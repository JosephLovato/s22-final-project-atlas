#########################
### Domain Parameters ###
#########################

# Table grid resolution
RESOLUTION=0.1

# End-Effector Frame
FRAME_JAR = "end_effector_grasp_jar"
FRAME_LID = "end_effector_grasp_lid"

# Object placement tolerance
EPSILON = 1e-4

########################
### Imported Modules ###
########################

# Import our planning packages
import aminopy as aa
import tmsmtpy as tm

import TMSMT

# Import python math package
from math import pi

# The Common Lisp runtime is also available
import CL as cl

#############
## Helpers ##
#############

def map_locations(function, scene):
    print("ATLAS: map_locations")
    for frame in tm.collect_frame_type(scene,"surface"):
        name = frame['name']
        for geom in frame['geometry']:
            shape = geom['shape']
            if aa.shape_is_box(shape):
                d = shape['dimension']
                x_max = d[0] / 2
                y_max = d[1] / 2
                x = 0
                i = 0
                while x <= x_max:
                    y = 0
                    j = 0
                    while y <= y_max:
                        function(name,i,j)
                        if i > 0: function(name,-i,j)
                        if j > 0: function(name,i,-j)
                        if i > 0 and j > 0: function(name,-i,-j)
                        y += RESOLUTION
                        j+=1
                    x +=  RESOLUTION
                    i+=1


def location_table(parent,frame):
    print("ATLAS: location_table")
    parent_name = parent.name
    name = frame.name
    trans = aa.translation( aa.frame_fixed_tf(frame) )
    i = int(round( trans[0] / RESOLUTION))
    j = int(round( trans[1] / RESOLUTION))
    position = tm.mangle(parent_name,i,j)
    if name[7] == 'j': # only way I could find to do this. 'in' keyword doesn't work for unknown reasons
        return (["ONTABLEJAR", name, position], i, j)
    else:
        return (["ONTABLELID", name, position], i, j)

############################
### Collision Constraint ###
############################

# Status: Copied from tm-blocks.py. We think this one
#         doesn't need changes (?)
def collision_constraint(scene,op,objs):
    print("ATLAS: COLLISION CONSTRAINT")
    moveable = []
    def collect_moveable(frame_name):
        frame = scene[frame_name]
        if aa.frame_isa(frame,"moveable"):
            moveable.append(frame)
    map(collect_moveable, objs)

    conjunction = []

    def handle_moveable(frame):
        parent_name = frame.parent
        parent = scene[parent_name]
        if aa.frame_isa(parent, "surface"):
            (x, i, j) = location_table(parent,frame)
            conjunction.append(x)

    map(handle_moveable, moveable)

    return conjunction


##########################
## Scene State Function ##
##########################
def make_state(scene, configuration, is_goal):
    '''Map the scene graph `scene' to a task state expression'''
    print("ATLAS: make_state")
    ## terms in the expression
    conjunction = []
    occupied = {}
    moveable_frames = tm.collect_frame_type(scene,"moveable")
    # print("ATLAS: ", moveable_frames)
    ## Add object locations
    ## Left (Jar) Hand, Right (Lid) Hand
    handempty = [True, True]

    # updates the conjunctions, handempty list, and occupied 
    # list 
    def update_state(child,parent):
        print("ATLAS: update_state")
        #print("ATLAS: update_state() child: ", child, "parent: ", parent)
        # If parent is the left hand (jar hand)
        if parent == FRAME_JAR:
            conjunction.append(["HOLDINGJAR", child])
            conjunction.append(["NOT", ["HANDEMPTYJAR"]])
            handempty[0] = False
            occupied[child] = True
        # If parent is the right hand (lid hand)
        elif parent == FRAME_LID:
            conjunction.append(["HOLDINGLID", child])
            conjunction.append(["NOT", ["HANDEMPTYLID"]])
            handempty[1] = False
            occupied[child] = True
        # Status: In our domain, the only option is that the
        # child is the lid, parent jar, so they are attached?
        else:
            conjunction.append(["ATTACHED"])
            occupied[parent] = True

    def handle_moveable(frame):
        print("ATLAS: handle_moveable")
        name = frame.name
        parent_name = frame.parent
        #print("ATLAS: handle_moveable name: ", frame.name, " parent_name: ", frame.parent)
        try:
            # If parent frame is a placement surface, position is the
            # appropriate grid cell on the surface.
            parent_frame = scene[parent_name]
            if aa.frame_isa(parent_frame, "surface"):
                (x, i, j) = location_table(parent_frame,frame)
                conjunction.append(x)
                print("ATLAS X: ", x)

                occupied[(parent_name,i,j)] = True
            else:
                update_state(name,parent_name)
        except NameError:
                update_state(name,parent_name)

    #print("ATLAS: moveable_frames: ", moveable_frames)
    map(handle_moveable, moveable_frames)

    if handempty[0]:
        conjunction.append(["HANDEMPTYJAR"])
    if handempty[1]:
        conjunction.append(["HANDEMPTYLID"])

    ## Clear things (COMMENTED OUT BECAUSE WE DON'T THINK WE NEED IT)
    # def clear_block(frame):
    #     name = frame.name
    #     if not name in occupied:
    #         conjunction.append(["CLEAR", name])

    def clear_location(name,i,j):
        #print("ATLAS: clear_locations")
        if not (name,i,j) in occupied:
            conjunction.append(["CLEAR", tm.mangle(name,i,j)])

    if not is_goal:
        # map(clear_block, moveable_frames)
        map_locations(clear_location,scene)

    #print("ATLAS: CONJUNCTION: ", conjunction)
    return conjunction

def scene_state(scene,configuration):
    print("ATLAS: scene_state")
    return make_state(scene, configuration, False)

def goal_state(scene,configuration):
    print("ATLAS: goal_state")
    return make_state(scene, configuration, True)

############################
## Scene Objects Function ##
############################

def scene_objects(scene):
    '''Return the PDDL objects for `scene'.'''
    obj = []
    print("ATLAS: scene_objects")

    def type_names(thing):
        return [ f.name
                 for f in
                 tm.collect_frame_type(scene,thing) ]

    # Jar objects
    jars = type_names("jar")
    jars.insert(0, "JAR")

    # Lid objects
    lids = type_names("lid")
    lids.insert(0, "LID")

    # Draw grid on surfaces
    locations = ['LOCATION']
    def add_loc(name,i,j):
        locations.append(tm.mangle(name,i,j))

    map_locations(add_loc,scene)
    #print("ATLAS: locations", locations)
    print("ATLAS: END OF SCENE OBJECTS")
    #print("ATLAS: OBJECTS: ", [jars, lids, locations])
    return [jars, lids, locations]

############################
### Operator Definitions ###
############################

# Helpers?
def motion_plan(op, frame, goal):
    print("ATLAS: motion_plan")
    scene = op.final_scene
    sub_scenegraph = aa.scene_chain(scene, "", frame)
    return tm.op_motion( op, sub_scenegraph, goal )

# def pick(op, obj):
#     mp = motion_plan(op, FRAME, tm.op_tf_abs(op,obj))
#     return tm.op_reparent(mp, FRAME, obj)

def place_tf(op, obj, dst_frame, g_tf_o ):
    print("ATLAS: place_tf")
    mp =  motion_plan(op, obj, g_tf_o)
    return tm.op_reparent(mp, dst_frame, obj)

def place_height(scene,name):
    #print("ATLAS: place_height")
    g = scene[name].collision
    s = g[0].shape
    if aa.shape_is_cylinder(s):
        return 0
    if aa.shape_is_box(s):
        return s.dimension[2] / 2
    

# pick-up-jar
def op_pick_up_jar(scene, config, op):
    #(a, obj, src, i, j) = op
    print("ATLAS: op_pick_up_jar")
    obj = op[1]
    nop = tm.op_nop(scene,config)
    mp = motion_plan(nop, FRAME_JAR, tm.op_tf_abs(nop,obj))
    return tm.op_reparent(mp, FRAME_JAR, obj)

# grab-lid
def op_grab_lid(scene, config, op):
    #(a, obj, src, i, j) = op
    print("ATLAS: op_grab_lid")
    obj = op[1]
    nop = tm.op_nop(scene,config)
    mp = motion_plan(nop, FRAME_LID, tm.op_tf_abs(nop,obj))
    return tm.op_reparent(mp, FRAME_LID, obj)

# *_put_down (binding for lid and jar put down)
def op_put_down(scene, config, op):
    print("ATLAS: op_put_down")
    (a, obj, dst, i, j) = op
    nop = tm.op_nop(scene,config)
    x = i*RESOLUTION
    y = j*RESOLUTION
    z = place_height(scene,obj) + place_height(scene,dst) + EPSILON
    d_tf_o = aa.tf2( 1, [x,y,z] )
    g_tf_d = tm.op_tf_abs(nop,dst)
    g_tf_o = aa.mul(g_tf_d, d_tf_o )
    return place_tf(nop, obj, dst, g_tf_o)

# stack_* (binding for lid and jar stack)
def op_stack(scene, config, op):
    (act,obj,dst) = op
    nop = tm.op_nop(scene,config)
    g_tf_d = tm.op_tf_abs(nop,dst)
    d_tf_o = aa.tf2(1, [0,0, place_height(scene,obj) + place_height(scene,dst) + EPSILON])
    g_tf_o = aa.mul(g_tf_d, d_tf_o)
    return place_tf(nop, obj, dst, g_tf_o)

# twist
# def op_twist(scene, config, op):
#     print("ATLAS: op_twist")
#     (a, obj, dst, i, j) = op
#     nop = tm.op_nop(scene,config)
#     mp = motion_plan(nop, FRAME_LID, tm.op_tf_abs(nop,obj))
#     return tm.op_reparent(mp, FRAME_LID, obj)

##########################
### Register functions ###
##########################

tm.bind_scene_state(scene_state)
tm.bind_goal_state(goal_state)
tm.bind_scene_objects(scene_objects)
tm.bind_refine_operator(op_pick_up_jar, "PICK-UP-JAR")
tm.bind_refine_operator(op_put_down, "PUT-DOWN-JAR")
tm.bind_refine_operator(op_put_down, "PUT-DOWN-LID")
tm.bind_refine_operator(op_grab_lid, "GRAB-LID")
tm.bind_refine_operator(op_stack, "STACK-LID")
tm.bind_refine_operator(op_stack, "STACK-JAR")
# tm.bind_refine_operator(op_twist, "TWIST")

tm.bind_collision_constraint(collision_constraint)
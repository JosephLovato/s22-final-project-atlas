#Credit: Sihui Li

from amino import SceneWin, SceneGraph, Geom, GeomOpt, QuatTrans, Vec3, YAngle, XAngle, SceneFK, SceneCollision, SceneCollisionSet
from math import pi, cos
from time import sleep
import os
# Scene Parameters
# Change scene_plugin based on your directory structure
scene_plugin = "./libbaxter-model.so"
scene_name = "baxter"
# Create an (empty) scene graph
sg = SceneGraph()
# Draw a grid
sg.add_frame_fixed(
    "",
    "grid",
    tf=(1, (0, 0, -.9)),
    geom=Geom.grid({
        "color": (0, 0, 1)
    }, [1.0, 1.0], [.1, .1], .005))
# Load the scene plugin
sg.load(scene_plugin, scene_name)
# Initialize the scene graph
sg.init()
START0 = [0.15708, -0.785398, 0.0, 0.785398, 0.0, 1.5708, 0.0]
START1 = [1.1801, -0.922453, -0.569238, 1.32207, 0.347802, 1.26949, -0.184131]
START2 = [0.15708, -0.785398, 0, 0.785398, 0, 1.5708, 0]
START3 = [0.0] * 7
START4 = [1, 1, 1, 1, 1, 1, 1]
STARTS = [START0, START1, START2, START3, START4]
# 0.7853981633974483 0.0 0.0 1.5707963267948966 0.0 -0.7853981633974483 0.1570796350201586


# config_dict1 = {"head_pan": 0.0, "left_e0": 0.0,
#             "left_e1": 2.356194490192345, "left_s0": 2.04203514993196,
#             "left_s1": -1.5707963267948966, "left_w0": 0.0,
#             "left_w1": 0.7853981633974483, "left_w2": 0.0,
#             "right_e0": 0.0, "right_e1": 0.7853981633974483,
#             "right_s0": 0.1570796350201586,
#             "right_s1": -0.7853981633974483, "right_w0": 0.0,
#             "right_w1": 1.5707963267948966, "right_w2": 0.0}

collisions = {"BAXTER Collisions"}

for i in range(0, 5):
    config_dict = {
        "right_s0": STARTS[i][0],
        "right_s1": STARTS[i][1],
        'right_e0': STARTS[i][2],
        'right_e1': STARTS[i][3],
        "right_w0": STARTS[i][4],
        'right_w1': STARTS[i][5],
        'right_w2': STARTS[i][6],
        "left_e0": STARTS[i][2],
        "left_e1": STARTS[i][3],
        "left_s0": STARTS[i][0],
        "left_s1": STARTS[i][1],
        "left_w1": STARTS[i][5],
        "left_w0": STARTS[i][4],
        "left_w2": STARTS[i][6]
    }

    fk = SceneFK(sg)
    fk.config = config_dict
    cl = SceneCollision(sg)
    cl_set = SceneCollisionSet(sg)
    inCollision = cl.check(fk, cl_set)
    for i in range(sg.frame_count):
        for j in range(sg.frame_count):
            if cl_set[i, j]:
                #print("allow_collision \"%s\" \"%s\";" %(sg.frame_name(i),sg.frame_name(j)))
                collisions.add("allow_collision \"%s\" \"%s\";" %(sg.frame_name(i),sg.frame_name(j)))
    #print(inCollision, sg.frame_count)

# Create a window and pass the scenegraph
win = SceneWin(start=False)
win.scenegraph = sg
win.fk = fk
# Start the window in a background thread
win.start(False)
print()

for c in collisions:
    print(c)
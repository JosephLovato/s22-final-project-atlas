#!/usr/bin/env python
# File: t4.1-fk.py
# =======================
#
# Compute Forward Kinematics
from amino import SceneWin, SceneGraph, SceneFK, Geom, GeomOpt, QuatTrans, Vec3, YAngle, XAngle
from math import pi, cos
from time import sleep
import os
# Scene Parameters
# Change scene_plugin based on your directory structure
scene_plugin = "/home/eryk/CSCI534/s22-final-project-atlas/aminoo/libbaxter-model.so"
scene_name = "baxter"


# Create an (empty) scene graph
sg = SceneGraph()
# Draw a grid
dim = [0.1, 0.2, 0.3]
sg.add_frame_fixed(
    "",
    "grid",
    tf=(1, (0, 0, -.9)),
    geom=Geom.grid({
        "color": (0, 0, 1)
    }, [1.0, 1.0], [.1, .1], .005))
sg.add_frame_fixed(
    "right_endpoint",
    "right_ee",
    tf=(YAngle(pi), (0,0,.075)),
    geom=Geom.box({
        "color": (1, 0, 0)
    }, dim)
)
sg.add_frame_fixed(
    "left_endpoint",
    "left_ee",
    tf=(YAngle(pi), (0,0,.075)),
    geom=Geom.box({
        "color": (1, 0, 0)
    }, dim)
)
# Load the scene plugin
sg.load(scene_plugin, scene_name)
# Initialize the scene graph
sg.init()
# Create a window, pass the scenegraph, and start
win = SceneWin(scenegraph=sg, start=True, background=True)
# Create the FK context
fk = SceneFK(sg)
# Do a simple wave
dt = 1.0 / 60
t = 0
#set initial angles
config_dict = {
    "left_s0": -.75 * pi,
    "left_s1": .75 * pi,
    "left_e0": .125 * pi,
    "left_e1": .125 * pi,
    "left_w0": .125 * pi,
    "left_w1": .125 * pi,
    "left_w2": .124 * pi,
    "right_s0": -.75 * pi,
    "right_s1": .75 * pi,
    "right_e0": .125 * pi,
    "right_e1": .125 * pi,
    "right_w0": .125 * pi,
    "right_w1": .125 * pi,
    "right_w2": .124 * pi
}

while win.is_runnining():
    # update forward kinematics
    # config_dict['left_s0'] = (120 + 15 * cos(t)) * (pi / 180)
    fk.config = config_dict
    # update window
    win.fk = fk
    # absolute hand pose is changing
    TF_g_h = fk["left_endpoint"]
    TF_g_h_r = fk["right_endpoint"]
    print("g->hand: %s" % TF_g_h)
    print("gr->hand: %s" % TF_g_h_r)
    # Relative pose between elbow and hand does not change; there are
    # only fixed transforms and joints with unchanging configuration
    # between these two frames.
    TF_e_h = fk["left_s0", "left_endpoint"]
    print("e->hand: %s" % TF_e_h)
    # sleep till next cycle
    sleep(dt)
    t += dt
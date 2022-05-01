#!/bin/bash
cd "Final Files"
tmsmt package://baxter_description/urdf/baxter.urdf jar-initial.robray allowed-collisions.robray jar.pddl jar.py -q q0.tmp -g jar-final.robray -o jar.tmp --gui | grep -Ev '(checking|Debug)'
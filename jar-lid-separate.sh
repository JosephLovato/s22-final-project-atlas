#!/bin/bash
cd Jar-Lid-Separate-Test-Files
tmsmt package://baxter_description/urdf/baxter.urdf test-jar-initial.robray allowed-collisions.robray test-jar.pddl jar.py -q q0.tmp -g test-jar-final.robray -o jar.tmp --gui | grep -Ev '(checking|Debug)'

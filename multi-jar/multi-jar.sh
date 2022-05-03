#!/bin/bash
tmsmt package://baxter_description/urdf/baxter.urdf multi-jar-initial.robray allowed-collisions.robray multi-jar.pddl multi-jar.py -q q0.tmp -g multi-jar-final.robray -o multi-jar.tmp --gui | grep -Ev '(checking|Debug)'

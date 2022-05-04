#!/bin/bash
cd Multi-jar
tmsmt package://baxter_description/urdf/baxter.urdf multi-jar-initial.robray multi-allowed-collisions.robray multi-jar.pddl multi-jar.py -q multi-q0.tmp -g multi-jar-final.robray -o multi-jar.tmp --gui | grep -Ev '(checking|Debug)'

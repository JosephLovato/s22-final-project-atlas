# README

Implementation for Dual Arm Task-Motion Planning of Baxter the Robot.

## Directory Structure
./Final-Files: files used in final draft of single jar-opening problem

./Jar-Lid-Separate-Test-Files: file used in testing/debugging

./Multi-jar: files used in draft of multi-jar-opening problem

./Original-PDDL-Files: original jar problem domain PDDLs

./Renderings: image captures

./aminoo: for debugging with aminoo

./baxter-blocks: from TMKit tutorial

./holderJar-test-file: variation on files (not used)

## Overview

In this project, Baxter the Robot was tasked with opening a jar using TMKit with Amino.

## Dependencies

- [TMKit](http://tmkit.kavrakilab.org/)
- [Baxter Common](https://github.com/RethinkRobotics/baxter_common)

## Running

After setting up TMKit (and all of it's dependencies):

1. Set `ROS_PACKAGE_PATH` to the directory of `baxter_common`
2. Give execute permissions the final script
```chmod +x final-jar.sh```
3. Run the final script
```./final-jar.sh```

## Authors
Joey Lovato, Eryk Lorenz, Heather Schneider

## Acknowledgements
Sihui Li, Neil Dantam


**This work was compeleted for CSCI534 (Robot Planning and Manipulation) at Colorado School of Mines Spring 2022*

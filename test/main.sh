#!/bin/bash

mkdir -p output src

sbatch opencv_testcase_1.sh
sbatch opencv_testcase_2.sh
sbatch opencv_testcase_3.sh
sbatch opencv_testcase_4.sh

echo "All test cases have been submitted. Monitor their progress using squeue."

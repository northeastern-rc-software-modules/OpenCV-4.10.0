#!/bin/bash
#SBATCH -p short
#SBATCH --export=ALL
#SBATCH -N 1
#SBATCH -n 28
#SBATCH --exclusive
#SBATCH --job-name=opencv_testcase_3
#SBATCH --output=output/opencv_testcase_3.txt

mkdir -p output src

echo "========================================================"
echo "Test Case: Compile C++ Program to Test OpenCV"
echo "Job ID: $SLURM_JOB_ID"
echo "Node: $(hostname)"
echo "Start Time: $(date)"
echo "========================================================"

g++ src/test_opencv.cpp -o src/test_opencv \
-I/shared/EL9/explorer/OpenCV/4.10.0/include \
-L/shared/EL9/explorer/OpenCV/4.10.0/lib64 -lopencv_core > output/compile_result.txt 2>&1

if [ $? -ne 0 ]; then
    echo "Failed to compile the C++ program. Check output/compile_result.txt for details."
    echo "End Time: $(date)"
    exit 1
else
    echo "C++ program compiled successfully: src/test_opencv"
fi

echo "End Time: $(date)"
echo "========================================================"

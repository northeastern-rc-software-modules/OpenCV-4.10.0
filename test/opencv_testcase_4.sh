#!/bin/bash
#SBATCH -p short
#SBATCH --export=ALL
#SBATCH -N 1
#SBATCH -n 28
#SBATCH --exclusive
#SBATCH --job-name=opencv_testcase_4
#SBATCH --output=output/opencv_testcase_4.txt

mkdir -p output src

echo "========================================================"
echo "Test Case: Run Compiled Program"
echo "Job ID: $SLURM_JOB_ID"
echo "Node: $(hostname)"
echo "Start Time: $(date)"
echo "========================================================"

./src/test_opencv > output/program_result.txt 2>&1

if [ $? -eq 0 ]; then
    echo "Program ran successfully. OpenCV functionality verified."
    cat output/program_result.txt
else
    echo "Program execution failed. Check output/program_result.txt for details."
    echo "End Time: $(date)"
    exit 1
fi

echo "End Time: $(date)"
echo "========================================================"

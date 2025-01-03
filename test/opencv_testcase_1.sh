#!/bin/bash
#SBATCH -p short
#SBATCH --export=ALL
#SBATCH -N 1
#SBATCH -n 28
#SBATCH --exclusive
#SBATCH --job-name=opencv_testcase_1
#SBATCH --output=output/opencv_testcase_1.txt

mkdir -p output src

echo "========================================================"
echo "Test Case: Load OpenCV Module and Verify Version"
echo "Job ID: $SLURM_JOB_ID"
echo "Node: $(hostname)"
echo "Start Time: $(date)"
echo "========================================================"

module load OpenCV/4.10.0
opencv_version > output/opencv_version_result.txt 2>&1

if [ $? -ne 0 ]; then
    echo "Failed to verify OpenCV version. Check output/opencv_version_result.txt for details."
    echo "End Time: $(date)"
    exit 1
else
    echo "OpenCV module loaded successfully. Version verified."
    cat output/opencv_version_result.txt
fi

echo "End Time: $(date)"
echo "========================================================"

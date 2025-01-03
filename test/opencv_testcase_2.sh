#!/bin/bash
#SBATCH -p short
#SBATCH --export=ALL
#SBATCH -N 1
#SBATCH -n 28
#SBATCH --exclusive
#SBATCH --job-name=opencv_testcase_2
#SBATCH --output=output/opencv_testcase_2.txt

mkdir -p output src

echo "========================================================"
echo "Test Case: Create C++ Program to Test OpenCV"
echo "Job ID: $SLURM_JOB_ID"
echo "Node: $(hostname)"
echo "Start Time: $(date)"
echo "========================================================"

cat <<EOL > src/test_opencv.cpp
#include <opencv2/opencv.hpp>
#include <iostream>

int main() {
    cv::Mat mat = cv::Mat::zeros(10, 10, CV_8UC1); // Create a simple 10x10 matrix
    if (mat.empty()) {
        std::cerr << "Failed to create matrix. OpenCV functionality issue!" << std::endl;
        return 1;
    }
    std::cout << "OpenCV module test successful. Matrix created successfully." << std::endl;
    return 0;
}
EOL

if [ -f src/test_opencv.cpp ]; then
    echo "C++ program created successfully: src/test_opencv.cpp"
else
    echo "Failed to create C++ program."
    echo "End Time: $(date)"
    exit 1
fi

echo "End Time: $(date)"
echo "========================================================"

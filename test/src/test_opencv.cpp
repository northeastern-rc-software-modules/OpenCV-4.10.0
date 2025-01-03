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

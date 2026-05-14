#include <iostream>
#include <vector>

int main() {
    std::vector<int> vec = {1, 2, 3, 4, 5};

    std::cout << "Vector elements: ";
    for (const auto& elem : vec) {
        std::cout << elem << " ";
    }
    std::cout << std::endl;

    return 0;
}

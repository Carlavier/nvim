#include <algorithm>
#include <functional>
#include <iostream>
#include <memory>
#include <string>
#include <vector>

/**
 * C++11 Theme Test: Lambdas, Smart Pointers, and Initializer Lists
 */

enum class Status { Idle, Processing, Error };

class LegacyProcessor {
  private:
    double factor;
    std::vector<int> data;

  public:
    // Initializer list and delegating constructor
    LegacyProcessor() :
        LegacyProcessor(1.0) {}
    explicit LegacyProcessor(double f) :
        factor(f),
        data({1, 2, 3, 4, 5}) {}

    void run() {
        // Lambda with capture and trailing return type
        auto multiply = [this](int n) -> double { return n * this->factor; };

        std::cout << "Results: ";
        for (auto it = data.begin(); it != data.end(); ++it) {
            double val = multiply(*it);
            std::cout << val << " ";
        }
        std::cout << std::endl;
    }
};

int main() {
    // Nullptr and Smart Pointers
    std::unique_ptr<LegacyProcessor> proc = nullptr;
    proc = std::unique_ptr<LegacyProcessor>(new LegacyProcessor(2.5));

    if (proc != nullptr) {
        proc->run();
    }

    // Range-based for loop
    std::vector<std::string> tags = {"cpp11", "test", "neovim"};
    for (const auto& tag : tags) {
        std::cout << "Tag: " << tag << "\n";
    }

    return 0;
}

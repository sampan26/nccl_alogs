#include <iostream>
#include <thread>
#include <chrono>
#include "timer.h"
using namespace std;

int main() {
    timer::Timer t;

    std::cout << "Simple Timer Test\n\n";

    // Start the timer
    t.start();

    // Simulate some work (sleep for 1 second)
    std::cout << "Sleeping for 1 second...\n";
    std::this_thread::sleep_for(std::chrono::seconds(1));

    // Stop the timer
    t.stop();

    // Print results
    std::cout << "Timer stopped.\n";
    std::cout << "Elapsed time:\n";
    std::cout << "  Cycles: " << t.cycles() << "\n";
    std::cout << "  Seconds: " << t.seconds() << "\n";
    std::cout << "  Absolute: " << t.absolute() << "\n";

    return 0;
}
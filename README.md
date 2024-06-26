# Dining Philosophers Problem

## Overview

In computer science, the dining philosophers problem is an example problem often used in concurrent algorithm design to illustrate synchronization issues and techniques for resolving them.

## History

The problem was originally formulated in 1965 by Edsger Dijkstra as a student exam exercise, presented in terms of computers competing for access to tape drive peripherals. Soon after, Tony Hoare gave the problem its present form.

## Problem Statement

Five philosophers dine together at the same table. Each philosopher has his own plate at the table. There is a fork between each plate. The dish served is a kind of spaghetti which has to be eaten with two forks. Each philosopher can only alternately think and eat. Moreover, a philosopher can only eat his spaghetti when he has both a left and right fork. Thus two forks will only be available when his two nearest neighbors are thinking, not eating. After an individual philosopher finishes eating, he will put down both forks. 

The problem is how to design a regimen (a concurrent algorithm) such that any philosopher will not starve; i.e., each can forever continue to alternate between eating and thinking, assuming that no philosopher can know when others may want to eat or think (an issue of incomplete information).

## Challenges

The problem was designed to illustrate the challenges of avoiding deadlock, a system state in which no progress is possible. To see that a proper solution to this problem is not obvious, consider a proposal in which each philosopher is instructed to behave as follows:

1. Think unless the left fork is available; when it is, pick it up;
2. Think unless the right fork is available; when it is, pick it up;
3. When both forks are held, eat for a fixed amount of time;
4. Put the left fork down;
5. Put the right fork down;
6. Repeat from the beginning.

With these instructions, the situation may arise where each philosopher holds the fork to their left; in that situation, they will all be stuck forever, waiting for the other fork to be available: it is a deadlock.

## Related Issues

- **Deadlock**: A situation in which no progress is possible because two or more processes are each waiting for the other to release a resource.
- **Resource Starvation**: A situation in which a process is perpetually denied necessary resources to proceed.
- **Mutual Exclusion**: Ensuring that multiple processes or threads do not simultaneously access a critical section.
- **Livelock**: A situation in which two or more processes continuously change their state in response to the other processes without making any actual progress.

## Implementation

### Swift Version

The project is implemented using Swift version 5.

### Code Description

The implementation consists of two main components: `Philosopher` and `ViewController`.

- **Philosopher Class**: Each philosopher is represented by an instance of the `Philosopher` class. The class contains methods for thinking, eating, and the life cycle of the philosopher. The philosophers alternate between thinking and eating, acquiring and releasing forks (represented as resources) to avoid deadlock. A semaphore is used to limit the number of philosophers that can try to eat at the same time, ensuring mutual exclusion.

- **ViewController Class**: The `ViewController` class sets up the dining table and philosophers, initiating their life cycles in a concurrent manner. A `DispatchQueue` is used to manage the execution of philosophers' actions asynchronously, allowing them to operate independently.

## How to Run

To run the project, ensure you have Swift 5 installed. Open the project in Xcode and run the application. The console will display the actions of each philosopher as they think, attempt to pick up forks, eat, and put down forks, demonstrating the solution to the dining philosophers problem.

## References
- Wikipedia: Dining Philosophers Problem
- Edsger Dijkstra's original formulation
- Tony Hoare's adaptation

Full descritions here: https://en.wikipedia.org/wiki/Dining_philosophers_problem

//
//  Table.swift
//  DiningPhilosophers
//
//  Created by Oleksiy Chebotarov on 30/11/2022.
//

import Foundation

class Table {
    let philosophers: Int
    private(set) var forks: [Fork]
    private(set) var semaphore: DispatchSemaphore

    init(philosophers: Int, semaphore: DispatchSemaphore) {
        self.philosophers = philosophers
        self.semaphore = semaphore
        forks = (0 ..< philosophers).map { Fork(number: $0) }
    }

    func philosophersAtTable() -> [Philosopher] {
        var arrayPhilosophers = [Philosopher]()
        for index in 0 ..< philosophers {
            let leftFork = forks[leftForkIndex(philosopherIndex: index)]
            let rightFork = forks[rightForkIndex(philosopherIndex: index)]

            let philosopher = Philosopher(number: index, leftFork: leftFork, rihgtFork: rightFork, semaphore: semaphore)
            arrayPhilosophers.append(philosopher)
        }

        return arrayPhilosophers
    }

    private func leftForkIndex(philosopherIndex: Int) -> Int {
        (philosopherIndex - 1 + philosophers) % philosophers
    }

    private func rightForkIndex(philosopherIndex: Int) -> Int {
        philosopherIndex
    }
}

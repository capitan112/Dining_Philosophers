//
//  Philosopher.swift
//  DiningPhilosophers
//
//  Created by Oleksiy Chebotarov on 30/11/2022.
//

import Foundation

class Philosopher {
    private(set) var number: Int
    let leftFork: Fork
    let rihgtFork: Fork
    private(set) var semaphore: DispatchSemaphore

    init(number: Int, leftFork: Fork, rihgtFork: Fork, semaphore: DispatchSemaphore) {
        self.number = number
        self.leftFork = leftFork
        self.rihgtFork = rihgtFork
        self.semaphore = semaphore
    }

    func think() {
        print("Philosopher \(number) thinking")
        sleep(1)
    }

    func eat() {
        print("Philosopher \(number) eating")
        sleep(1)
    }

    func lifeCicle() {
        while true {
            if number == 4 {
                think()
                semaphore.wait()
                rihgtFork.lock()
                print("Philosopher \(number) lock right fork")
                leftFork.lock()
                print("Philosopher \(number) lock left fork")
                eat()
                rihgtFork.unlock()
                print("Philosopher \(number) unlock right  fork")
                leftFork.unlock()
                print("Philosopher \(number) unlock left fork")
                semaphore.signal()
            } else {
                think()
                semaphore.wait()
                leftFork.lock()
                print("Philosopher \(number) lock left fork")
                rihgtFork.lock()
                print("Philosopher \(number) lock right fork")
                eat()
                leftFork.unlock()
                print("Philosopher \(number) unlock left fork")
                rihgtFork.unlock()
                print("Philosopher \(number) unlock right  fork")
                semaphore.signal()
            }
        }
    }
}

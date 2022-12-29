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
    let rightFork: Fork
    private(set) var semaphore: DispatchSemaphore

    init(number: Int, leftFork: Fork, rihgtFork: Fork, semaphore: DispatchSemaphore) {
        self.number = number
        self.leftFork = leftFork
        self.rightFork = rihgtFork
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
                rightFork.lock()
                print("Philosopher \(number) lock right fork")
                leftFork.lock()
                print("Philosopher \(number) lock left fork")
                eat()
                rightFork.unlock()
                print("Philosopher \(number) unlock right fork")
                leftFork.unlock()
                print("Philosopher \(number) unlock left fork")
                semaphore.signal()
            } else {
                think()
                semaphore.wait()
                leftFork.lock()
                print("Philosopher \(number) lock left fork")
                rightFork.lock()
                print("Philosopher \(number) lock right fork")
                eat()
                leftFork.unlock()
                print("Philosopher \(number) unlock left fork")
                rightFork.unlock()
                print("Philosopher \(number) unlock right fork")
                semaphore.signal()
            }
        }
    }
}



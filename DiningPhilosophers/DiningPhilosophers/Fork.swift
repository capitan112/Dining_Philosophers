//
//  Fork.swift
//  DiningPhilosophers
//
//  Created by Oleksiy Chebotarov on 30/11/2022.
//

import Foundation

class Fork: Equatable {
    let uuid = UUID().uuidString

    static func == (lhs: Fork, rhs: Fork) -> Bool {
        return lhs.number == rhs.number &&
            lhs.uuid == rhs.uuid
    }

    private(set) var number: Int
    private var mutex: Mutex

    init(number: Int) {
        self.number = number
        mutex = Mutex()
    }

    func lock() {
        mutex.lock()
    }

    func unlock() {
        mutex.unlock()
    }
}

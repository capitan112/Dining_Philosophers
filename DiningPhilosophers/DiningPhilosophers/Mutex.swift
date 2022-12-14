//
//  Mutex.swift
//  DiningPhilosophers
//
//  Created by Oleksiy Chebotarov on 05/11/2022.
// Thanks Vadim Bulavin for code Mutex

import Foundation

protocol Lock {
    func lock()
    func unlock()
}

final class Mutex: Lock {
    private var mutex: pthread_mutex_t = {
        var mutex = pthread_mutex_t()
        pthread_mutex_init(&mutex, nil)
        return mutex
    }()

    func lock() {
        pthread_mutex_lock(&mutex)
    }

    func unlock() {
        pthread_mutex_unlock(&mutex)
    }
}

//
//  ViewController.swift
//  DiningPhilosophers
//
//  Created by Oleksiy Chebotarov on 05/11/2022.
//

import UIKit

class ViewController: UIViewController {
    private let philosophersQueue = DispatchQueue(label: "com.queue.produceQueue", qos: .userInitiated, attributes: .concurrent)
    private var semaphore = DispatchSemaphore(value: 4)

    override func viewDidLoad() {
        super.viewDidLoad()
        philosohpersWork()
    }

    func philosohpersWork() {
        let table = Table(philosophers: 5, semaphore: semaphore)
        let philosophers = table.philosophersAtTable()

        for philosopher in philosophers {
            philosophersQueue.async {
                philosopher.lifeCicle()
            }
        }
    }
}

extension Thread {
    class func printCurrent() {
        print("\r⚡️: \(Thread.current)\r")
    }
}

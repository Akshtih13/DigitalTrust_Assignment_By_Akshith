//
//  Observable.swift
//  DigitalTrust_Akshith
//
//  Created by akshith kumar on 24/04/26.
//

import Foundation

final class Observable<T> {
    
    private struct Observer {
        weak var observer: AnyObject?
        let closure: (T) -> Void
    }
    
    private var observers: [Observer] = []
    private let queue = DispatchQueue(label: "com.observable.queue", attributes: .concurrent)
    
    public var value: T {
        didSet {
            notify()
        }
    }
    
    public init(_ value: T) {
        self.value = value
    }
    
    func subscribe(on observer: AnyObject, observerBlock: @escaping (T) -> Void) {
        let newObserver = Observer(observer: observer, closure: observerBlock)
        queue.async(flags: .barrier) {
            self.observers.append(newObserver)
        }
        
        DispatchQueue.main.async {
            observerBlock(self.value)
        }
    }
    
    private func notify() {
        queue.async(flags: .barrier) {
            self.observers = self.observers.filter { $0.observer != nil }
            DispatchQueue.main.async {
                self.observers.forEach { $0.closure(self.value) }
            }
        }
    }
}

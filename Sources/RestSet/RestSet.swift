//
//  RestSet.swift
//
//  Created by leehs81 on 2022/12/08.
//

import Foundation

/// 지정된 시간이 지나면 set에서 해당 값이 사라지는 Set 형태의 타입입니다.
/// example
///  ```
///     let rest = RestSet<Int>(interval: 1)
///     rest.insert(1)
///     // after 0.5 sec
///     rest.contains(1) // true
///     // after 1 sec
///     rest.contains(1) // false
///  ```
///  insert후 지정된 시간이 진행하는 동안 다른 값이 들어올 경우 타이머가 리셋됩니다.
///  동일한 값이 들어온 경우에는 리셋하지 않습니다.
public final class RestSet<T: Hashable> {

    private var timer: Timer?
    private let interval: TimeInterval
    private var set: Set<T>
    
    public var isEmpty: Bool {
        get {
            set.isEmpty
        }
    }
 
    public init(set: Set<T> = [], interval: TimeInterval) {
        self.set = set
        self.interval = interval
    }
    
    public func insert(_ element: T) {
        set.insert(element)
        rest(newValue: element)
    }
    
    public func contains(_ element: T) -> Bool {
        set.contains(element)
    }
    
    @inline(__always)
    private func rest(newValue: T) {
        if timer?.isValid == true || contains(newValue) {
            timer?.invalidate()
            run()
        } else {
            run()
        }
    }
    
    @inline(__always)
    private func run() {
        timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: false) { [weak self] timer in
            self?.set.removeAll()
            timer.invalidate()
        }
    }
}

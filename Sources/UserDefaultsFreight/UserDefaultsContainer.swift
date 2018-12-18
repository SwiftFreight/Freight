//
//  UserDefaultsContainer.swift
//  UserDefaultsFreight
//
//  Copyright (c) 2018 Jason Nam (https://jasonnam.com)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation

open class UserDefaultsContainer: Container {

    public typealias C = Configuration

    public let userDefaults: UserDefaults

    public required convenience init() throws {
        try self.init(configuration: .init(domain: .standard))
    }

    public required init(configuration: Configuration) throws {
        switch configuration.domain {
        case .standard:
            userDefaults = .standard
        case .suiteName(let suiteName):
            guard let userDefaults = UserDefaults(suiteName: suiteName) else {
                throw InitializeError.invalidSuiteName(suiteName)
            }
            self.userDefaults = userDefaults
        }
    }

    open class Configuration: Freight.Configuration {

        public let domain: Domain

        public init(domain: Domain) {
            self.domain = domain
        }

        public enum Domain {
            case standard
            case suiteName(String?)
        }
    }
}

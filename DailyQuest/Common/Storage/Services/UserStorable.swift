//
//  UserStorable.swift
//  DailyQuest
//
//  Created by Alexey Usenko on 22.04.2025.
//

import Foundation

protocol UserStorable: AnyObject {

    var account: Account? { get set }

}

//: Playground - noun: a place where people can play

import UIKit
import XCPlayground
let tableVC = UITableViewController()
let navigationController = UINavigationController(rootViewController: tableVC)

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
XCPlaygroundPage.currentPage.liveView = navigationController.view


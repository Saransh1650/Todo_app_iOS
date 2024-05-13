//
//  ReloadViewHelper.swift
//  Todo
//
//  Created by Saransh Singhal on 12/05/24.
//

import Foundation


class ReloadViewHelper: ObservableObject {
    func reloadView() {
        objectWillChange.send()
    }
}

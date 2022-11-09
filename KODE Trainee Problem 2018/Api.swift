//
//  Api.swift
//  KODE Trainee Problem 2018
//
//  Created by Pavel Zykov on 08.11.2022.
//

import Foundation

struct Api {
    
    let items: [Item]
    
    init?(apiData: ApiData) {
        items = apiData.items
    }
}

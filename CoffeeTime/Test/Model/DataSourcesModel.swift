//
//  DataSourcesModel.swift
//  CoffeeTime
//
//  Created by ouyangqi on 2022/1/15.
//

import Foundation

struct DataSourcesModel: Equatable, IdentifiableType {
    typealias Identity = Int
    var identity: Int = 0

    var title: String?
    var desc: String?
}



struct MySection {
    var header: String
    var items: [DataSourcesModel]
}

extension MySection : AnimatableSectionModelType {
    
    typealias Item = DataSourcesModel

    var identity: String {
        return header
    }

    init(original: MySection, items: [DataSourcesModel]) {
        self = original
        self.items = items
    }
}

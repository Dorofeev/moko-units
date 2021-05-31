/*
 * Copyright 2019 IceRock MAG Inc. Use of this source code is governed by the Apache 2.0 license.
 */

import UIKit
import MultiPlatformLibrary
import MultiPlatformLibraryUnits

class TestViewController: UIViewController {
    
    @IBOutlet private var tableView: UITableView!
    private var dataSource: TableUnitsSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        dataSource = TableUnitsSourceKt.default(for: tableView)
        dataSource.unitItems = Testing(unitFactory: self).getUnits()
    }
}

extension TestViewController: TestingUnitFactory {
    func createSimpleUnit(id: Int64, title: String, itemData: ItemData?) -> TableUnitItem {
        // without R.swift

        return UITableViewCellUnit<SimpleCell>(
            data: SimpleCell.CellModel(id: id, title: title),
            itemId: id,
            configurator: nil)
        // with R.swift
//        return UITableViewCellUnit<SimpleCell>(
//            data: SimpleCell.CellModel(id: id, title: title),
//            itemId: id,
//            reusable: R.nib.simpleCell,
//            configurator: nil
//        )
    }
}

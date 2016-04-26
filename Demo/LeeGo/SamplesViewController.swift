//
//  SamplesViewController.swift
//  LeeGo
//
//  Created by Victor WANG on 31/03/16.
//  Copyright © 2016 LeeGo. All rights reserved.
//

import Foundation
import UIKit
import LeeGo

class SamplesViewController: UITableViewController {

    private var elements = [SampleItem]()

    override func awakeFromNib() {
        super.awakeFromNib()

        tableView?.allowsSelection = false
        tableView?.estimatedRowHeight = 44.0
        tableView?.rowHeight = UITableViewAutomaticDimension

        SimpleShowcase.reuseIdentifiers.forEach { (identifier) in
            tableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier: identifier)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        for _ in 1...SimpleShowcase.reuseIdentifiers.count {
            elements.append(SampleItem())
        }
    }

    // MARK: Datasource

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elements.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let brick = {_ -> Brick in
            switch indexPath.row {
            case 0: return SimpleShowcase.showcase1.brick()
            case 1: return SimpleShowcase.showcase2.brick()
            case 2: return SimpleShowcase.showcase3.brick()
            case 3: return SimpleShowcase.showcase4.brick()
            case 4: return SimpleShowcase.showcase5.brick()
            case 5: return SimpleShowcase.showcase6.brick()
            case 6: return SimpleShowcase.showcase7.brick()
            case 7: return SimpleShowcase.showcase8.brick()
            case 8: return SimpleShowcase.showcase9.brick()
            case 9: return SimpleShowcase.showcase10.brick()
            case 10: return SimpleShowcase.showcase11.brick()
            case 11: return SimpleShowcase.showcase12.brick()
            default: return SimpleShowcase.showcase1.brick()
            }
        }()

        let cell = tableView.dequeueReusableCellWithIdentifier(brick.name, forIndexPath: indexPath)

        cell.configureAs(brick, updatingStrategy: .Always)

        return cell
    }
}



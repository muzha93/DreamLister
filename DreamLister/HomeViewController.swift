//
//  HomeViewController.swift
//  DreamLister
//
//  Created by luka on 24/06/2017.
//  Copyright © 2017 luka. All rights reserved.
//

import UIKit
import CoreData
import PureLayout

class HomeViewController: UIViewController {
    
    let persistanceService: PersistanceService?
    fileprivate var dataSource: TableViewDataSource<HomeViewController>?
    
    init(persistanceService: PersistanceService) {
        self.persistanceService = persistanceService
        super.init(nibName: nil, bundle: nil)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUpTableView(tableView: UITableView) {

        let identifier = String(describing: ItemsTableViewCell.self)
        tableView.register(ItemsTableViewCell.self, forCellReuseIdentifier: identifier)
        tableView.rowHeight = 140
//        tableView.rowHeight = UITableViewAutomaticDimension
//        tableView.estimatedRowHeight = 44
        let request = Item.sortedFetchRequest
        request.fetchBatchSize = 20
        if let frc = persistanceService?.fetchController(forRequest: request) {
            dataSource = TableViewDataSource(tableView: tableView,
                                             cellIdentifier: identifier,
                                             fetchedResultsController: frc,
                                             delegate: self)
        }
        tableView.delegate = self
        tableView.tableFooterView = UIView()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    @objc private func saveEvent() {
        if let persistanceService = self.persistanceService {
            persistanceService.createItem(withTitle: "proba", created: Date(), price: 30.0, details: "details")
            { item in
                print("event ID:", item.title)
            }
        }
        
    }
    
    private func setUpView() {
        let tableView = UITableView()
        setUpTableView(tableView: tableView)
        self.view.addSubview(tableView)

        tableView.autoPinEdge(toSuperviewEdge: .bottom)
        tableView.autoPinEdge(toSuperviewEdge: .leading)
        tableView.autoPinEdge(toSuperviewEdge: .trailing)
        tableView.autoPinEdge(toSuperviewEdge: .top, withInset: 100)
        
        let segmentedControl = UISegmentedControl(items: ["Newest", "Price", "Title"])
        self.view.addSubview(segmentedControl)
        
        segmentedControl.autoPinEdge(toSuperviewEdge: .top)
        segmentedControl.autoPinEdge(toSuperviewEdge: .leading)
        segmentedControl.autoPinEdge(toSuperviewEdge: .trailing)
        segmentedControl.autoPinEdge(.bottom, to: .top, of: tableView)
        
        navigationBarViewSetUp()
    }
    
    private func navigationBarViewSetUp() {
        
        self.automaticallyAdjustsScrollViewInsets = false
        self.navigationController!.navigationBar.isTranslucent = false
        self.navigationController!.navigationBar.backgroundColor = UIColor.white
        self.navigationItem.title = "Home"
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(saveEvent))
        self.navigationItem.rightBarButtonItem = addButton
        
    }

}

extension HomeViewController: TableViewDataSourceDelegate {
    func configure(_ cell: ItemsTableViewCell, for object: Item) {
        cell.configure(for: object)
    }
    
    func deleteAction(for object: Item) {
        persistanceService?.delete(event: object)
    }
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let object = dataSource?.objectAtIndexPath(indexPath)
    }
}

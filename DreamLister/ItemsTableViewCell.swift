//
//  ItemsTableViewCell.swift
//  DreamLister
//
//  Created by luka on 24/06/2017.
//  Copyright © 2017 luka. All rights reserved.
//

import UIKit

public class ItemsTableViewCell: UITableViewCell {
    
    override public func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func setUpView() {

    }
}

extension ItemsTableViewCell {
    func configure(for item: Item) {
        let imageView = UIImageView()
        let itemTitle = UILabel()
        let itemPrice = UILabel()
        let itemDetails = UILabel()
        
        itemPrice.text = String(describing: item.price)
        itemTitle.text = item.title
        itemDetails.text = item.details
        imageView.backgroundColor = .green
        itemDetails.backgroundColor = .blue
        itemPrice.backgroundColor = .red
        itemTitle.backgroundColor = .yellow
        
        self.addSubview(imageView)
        self.addSubview(itemTitle)
        self.addSubview(itemPrice)
        self.addSubview(itemDetails)

        itemTitle.autoPinEdge(toSuperviewEdge: .top, withInset: 10)
        itemTitle.autoPinEdge(toSuperviewEdge: .trailing, withInset: 10)
        itemTitle.autoPinEdge(toSuperviewEdge: .leading, withInset: 150)
        itemTitle.autoPinEdge(toSuperviewEdge: .bottom, withInset: 100)
        
        itemPrice.autoPinEdge(toSuperviewEdge: .trailing, withInset: 10)
        itemPrice.autoPinEdge(.top, to: .bottom, of: itemTitle, withOffset: 10)
        itemPrice.autoPinEdge(toSuperviewEdge: .leading, withInset: 150)
        
        itemDetails.autoPinEdge(.top, to: .bottom, of: itemPrice, withOffset: 10)
        itemDetails.autoPinEdge(toSuperviewEdge: .trailing, withInset: 10)
        itemDetails.autoPinEdge(toSuperviewEdge: .bottom, withInset: 10)
        itemDetails.autoPinEdge(toSuperviewEdge: .leading, withInset: 150)
        
        imageView.autoPinEdge(toSuperviewEdge: .top, withInset: 20)
        imageView.autoPinEdge(toSuperviewEdge: .leading, withInset: 10)
        imageView.autoPinEdge(toSuperviewEdge: .bottom, withInset: 20)
        imageView.autoPinEdge(toSuperviewEdge: .trailing, withInset: 300)
    }
    
}

//
//  CategoryCell.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 22.06.2023.
//

import Foundation
import UIKit

protocol CategoryButtonDelegate : AnyObject{
    func categoryClicked(_ index : Int)
}

class CategoryCollectionViewCell: UICollectionViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .orange
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    weak var delegate : CategoryButtonDelegate?
    var index : Int?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureGesture()
        setupUI()
        setupConstraints()
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top)
            make.leading.equalTo(contentView.snp.leading)
            make.trailing.equalTo(contentView.snp.trailing)
            make.bottom.equalTo(contentView.snp.bottom)
        }
    }
    
    private func setupUI() {
        contentView.backgroundColor = .white
        layer.borderWidth = 3
        layer.borderColor = CGColor(red: 239/255, green: 148/255, blue: 64/255, alpha: 1)
        contentView.addSubview(titleLabel)
        layer.cornerRadius = 12
        clipsToBounds = false
        contentView.layer.cornerRadius = 12
    }
    
    private func configureGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(categoryClicked))
        contentView.addGestureRecognizer(gesture)
    }
    
    @objc private func categoryClicked() {
        delegate?.categoryClicked(index ?? 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

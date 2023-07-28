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
    //MARK: - UI Objects
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = UIColor(hexString: Constants.HexCodes.navy)
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    //MARK: - Local Variables
    weak var delegate : CategoryButtonDelegate?
    var index : Int?
    //MARK: - Initial Functions
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureGesture()
        setupUI()
        setupTitleLabelConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Layout Functions
    private func setupTitleLabelConstraints() {
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
        layer.borderColor = CGColor(red: 53/255, green: 162/255, blue: 159/255, alpha: 1)
        contentView.addSubview(titleLabel)
        layer.cornerRadius = 12
        clipsToBounds = false
        contentView.layer.cornerRadius = 12
    }
    
    private func configureGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(categoryClicked))
        contentView.addGestureRecognizer(gesture)
    }
    //MARK: - Selector Methods
    @objc private func categoryClicked() {
        delegate?.categoryClicked(index ?? 0)
    }
    
}

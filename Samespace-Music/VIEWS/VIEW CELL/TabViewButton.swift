//
//  TabViewButton.swift
//  Samespace-Music
//
//  Created by AMAN K.A on 24/01/24.
//



import Foundation
import UIKit

class TabViewButton: UIButton {
    
    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    lazy var selectionIndicator: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 3
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(textLabel)
        textLabel.anchor(
            top:        topAnchor,
            leading:    leadingAnchor,
            trailing:   trailingAnchor
        )
        
        addSubview(selectionIndicator)
        selectionIndicator.anchor(
            top:    textLabel.bottomAnchor,
            width:  6,
            height: 6,
            inset:  .init(top: 8, left: 0, bottom: 0, right: 0)
        )
        selectionIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    func selectButton() {
        textLabel.textColor = .white
        selectionIndicator.alpha = 1
    }
    
    func deselectButton() {
        textLabel.textColor = .darkGray
        selectionIndicator.alpha = 0
    }
}

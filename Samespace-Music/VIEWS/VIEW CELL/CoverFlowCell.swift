//
//  CoverFlowCell.swift
//  Samespace-Music
//
//  Created by AMAN K.A on 24/01/24.
//



import Foundation
import UIKit

class CoverFlowCell: UICollectionViewCell {
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .gray
        view.contentMode = .scaleToFill
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .red
        layer.cornerRadius = 4
        
        addSubview(imageView)
        imageView.fillInSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with imageURL: String) {
        APIService.shared.fetchCoverImage(for: imageURL) { [weak self] image in
            DispatchQueue.main.async {
                self?.imageView.image = image
            }
        }
    }
}

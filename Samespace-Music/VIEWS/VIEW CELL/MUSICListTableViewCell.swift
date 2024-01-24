//
//  SongsListTableViewCell.swift
//  Samespace-Music
//
//  Created by AMAN K.A on 24/01/24.
//
//


import Foundation
import UIKit

class SongsListTableViewCell: UITableViewCell {
    
    lazy var coverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 24
        imageView.backgroundColor = .gray
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.textColor = .white
        return label
    }()
    
    lazy var artistLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textColor = .lightGray
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .black
        selectionStyle = .none
        
        contentView.addSubview(coverImageView)
        coverImageView.anchor(
            leading:     contentView.leadingAnchor,
            width:       48,
            height:      48,
            inset:       .init(top: 0, left: 12, bottom: 0, right: 0)
        )
        coverImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        contentView.addSubview(stackView)
        stackView.anchor(
            leading:    coverImageView.trailingAnchor,
            trailing:   contentView.trailingAnchor,
            inset:      .init(top: 0, left: 16, bottom: 0, right: 12)
        )
        stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(artistLabel)
    }
    
    func configure(with song: Song) {
        nameLabel.text = song.name
        artistLabel.text = song.artist
        APIService.shared.fetchCoverImage(for: song.cover) { image in
            DispatchQueue.main.async {
                self.coverImageView.image = image
            }
        }
    }
}

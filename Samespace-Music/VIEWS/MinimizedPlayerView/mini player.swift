//
//  MinimizedPlayerView.swift
//  Samespace-Music
//
//  Created by AMAN K.A on 24/01/24.
//



import UIKit

class MinimizedPlayerView: UIView {
    weak var launchPlayerDelegate: PlayerDelegate?

    var currentPlayingSong: Song? {
        didSet {
            if let song = currentPlayingSong {
                configure(with: song)
            }
        }
    }
    var songs: [Song] = []

    lazy var coverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 24
        return imageView
    }()

    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.text = "Song Name"
        label.textColor = .white
        return label
    }()

    lazy var playPauseButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 32)
        button.setImage(UIImage(systemName: "pause.circle.fill", withConfiguration: config), for: .normal)
        button.tintColor = .white
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        addGesture()
        addNotificationObserver()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        removeNotificationObserver()
    }

    private func setupViews() {
        backgroundColor = .gray
        


        addSubview(coverImageView)
        coverImageView.anchor(
            leading: leadingAnchor,
            width: 48,
            height: 48,
            inset: .init(top: 0, left: 16, bottom: 0, right: 0)
        )
        coverImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

        addSubview(nameLabel)
        nameLabel.anchor(
            leading: coverImageView.trailingAnchor,
            inset: .init(top: 0, left: 16, bottom: 0, right: 0)
        )
        nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

        addSubview(playPauseButton)
        playPauseButton.anchor(
            trailing: trailingAnchor,
            width: 44,
            height: 44,
            inset: .init(top: 0, left: 0, bottom: 0, right: 16)
        )
        playPauseButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

        playPauseButton.addTarget(self, action: #selector(handlePlayPauseButtonAction), for: .touchUpInside)
    }

    func configure(with song: Song) {
        nameLabel.text = song.name
        backgroundColor = UIColor(hex: song.accent)

        APIService.shared.fetchCoverImage(for: song.cover) { [weak self] image in
            DispatchQueue.main.async {
                self?.coverImageView.image = image
            }
        }

        AudioManager.shared.isPaused ? setButtonToPlay() : setButtonToPause()
    }

    @objc func handlePlayPauseButtonAction(sender: UIButton) {
        if AudioManager.shared.isPlaying {
            AudioManager.shared.pause()
            setButtonToPlay()
            performHaptic()
        } else {
            AudioManager.shared.play()
            setButtonToPause()
            performHaptic()
        }
    }

    func setButtonToPlay() {
        let config = UIImage.SymbolConfiguration(pointSize: 32)
        playPauseButton.setImage(UIImage(systemName: "play.circle.fill", withConfiguration: config), for: .normal)
    }

    func setButtonToPause() {
        let config = UIImage.SymbolConfiguration(pointSize: 32)
        playPauseButton.setImage(UIImage(systemName: "pause.circle.fill", withConfiguration: config), for: .normal)
    }

    func performHaptic() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
}


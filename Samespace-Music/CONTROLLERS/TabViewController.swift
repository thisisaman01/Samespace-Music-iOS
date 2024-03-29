//
//  TabViewController.swift
//  Samespace-Music
//
//  Created by AMAN K.A on 24/01/24.
//

import Foundation
import UIKit

class TabViewController: UIViewController {
    
    var swipeGesture: UIPanGestureRecognizer!
    
    var isShowingMinimizedPlayer = false
    
    let minimizedPlayer: MinimizedPlayerView = {
        let view = MinimizedPlayerView()
        return view
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    lazy var tabView: TabView = {
        let view = TabView()
        view.delegate = self
        return view
    }()
    
    var isShowingSecondViewController = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupViews()
        setupSwipeGesture()
    }
    
    private func setupViews() {
        view.backgroundColor = .black
        
        let songsListTableViewController = SongsListTableViewController(style: .plain)
        songsListTableViewController.delegate = self
        let songsListView = songsListTableViewController.view!
        
        let topTracksTableViewController = SongsListTableViewController(style: .plain)
        topTracksTableViewController.delegate = self
        let topTracksView = topTracksTableViewController.view!
        
        view.addSubview(containerView)
        containerView.anchor(
            top:        view.topAnchor,
            leading:    view.leadingAnchor,
            bottom:     view.bottomAnchor
        )
        containerView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2).isActive = true
        
        containerView.addSubview(songsListView)
        songsListView.anchor(
            top:        containerView.topAnchor,
            leading:    containerView.leadingAnchor,
            bottom:     containerView.bottomAnchor
        )
        songsListView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        containerView.addSubview(topTracksView)
        topTracksView.anchor(
            top:        containerView.topAnchor,
            leading:    songsListView.trailingAnchor,
            trailing:   containerView.trailingAnchor,
            bottom:     containerView.bottomAnchor
        )
        
        addChild(songsListTableViewController)
        songsListTableViewController.didMove(toParent: self)
        addChild(topTracksTableViewController)
        topTracksTableViewController.didMove(toParent: self)
        
        view.addSubview(tabView)
        tabView.anchor(
            leading:    view.leadingAnchor,
            trailing:   view.trailingAnchor,
            bottom:     view.bottomAnchor,
            height:     120
        )
        
        APIService.shared.fetchMusicData { result in
            songsListTableViewController.songs = result.data
            topTracksTableViewController.songs = result.data.filter {$0.top_track}
        }
    }
}

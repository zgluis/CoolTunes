//
//  ListSongsPresenter.swift
//  cooltunes
//
//  Created by Luis Zapata on 10/5/19.
//  Copyright (c) 2019 Luis Zapata. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ListSongsPresentationLogic
{
    func presentResult(response: ListSongs.Search.Response)
}

class ListSongsPresenter: ListSongsPresentationLogic
{
    weak var viewController: ListSongsDisplayLogic?
        
    func presentResult(response: ListSongs.Search.Response)
    {
        var displayedSongs: [ListSongs.Search.ViewModel.DisplayedSongs] = []
        
        for song in response.results! {
            let displayedSong = ListSongs.Search.ViewModel.DisplayedSongs.init(artistName: song.artistName ?? "", trackName: song.trackName ?? "")
            displayedSongs.append(displayedSong)
        }
        let viewModel = ListSongs.Search.ViewModel(displayedSongs: displayedSongs)
        viewController?.displayResults(viewModel: viewModel)
    }
}

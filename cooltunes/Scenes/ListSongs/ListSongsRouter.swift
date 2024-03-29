//
//  ListSongsRouter.swift
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

protocol ListSongsRoutingLogic
{
    func routeToShowSong()
}

protocol ListSongsDataPassing
{
    var dataStore: ListSongsDataStore? { get }
}

class ListSongsRouter: NSObject, ListSongsRoutingLogic, ListSongsDataPassing
{
    weak var viewController: ListSongsViewController?
    var dataStore: ListSongsDataStore?
    
    // MARK: Routing
    
    func routeToShowSong()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "ShowSongViewController") as! ShowSongViewController
        var destinationDS = destinationVC.router!.dataStore!
        passDataToSomewhere(source: dataStore!, destination: &destinationDS)
        navigateToSomewhere(source: viewController!, destination: destinationVC)
    }
    
    // MARK: Navigation
    
    func navigateToSomewhere(source: ListSongsViewController, destination: ShowSongViewController)
    {
        source.show(destination, sender: nil)
    }
    
    // MARK: Passing data
    
    func passDataToSomewhere(source: ListSongsDataStore, destination: inout ShowSongDataStore)
    {
        let selectedRow = viewController?.resultTableView.indexPathForSelectedRow?.row
        if selectedRow != nil {
            destination.song = source.songs?[selectedRow!]
        }
    }
}

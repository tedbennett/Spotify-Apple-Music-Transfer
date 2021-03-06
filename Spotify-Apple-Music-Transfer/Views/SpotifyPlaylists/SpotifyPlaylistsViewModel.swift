//
//  SpotifyPlaylistsViewModel.swift
//  Spotify-Apple-Music-Transfer
//
//  Created by Ted Bennett on 26/10/2020.
//

import Foundation
import Combine
import SpotifyAPI

class SpotifyPlaylistsViewModel: ObservableObject {
    
    @Published var playlists = [SpotifyAPI.PlaylistSimplified]()
    @Published var loading = true
    
    init() {
        getLibraryPlaylists()
    }
    
    func getLibraryPlaylists() {
        ServiceManager.shared.getSpotifyPlaylists { [weak self] playlists in
            DispatchQueue.main.async {
                self?.playlists = playlists
                self?.loading = false
            }
        }
    }
    
    func refresh() {
        loading = true
        getLibraryPlaylists()
    }
    
}

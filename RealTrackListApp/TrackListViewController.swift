//
//  TrackListViewController.swift
//  RealTrackListApp
//
//  Created by Алексей Гуляев on 14.10.2021.
//

import UIKit

class TrackListViewController: UITableViewController {
    
    var trackList = Track.getTrackList()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 80

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        trackList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "trackName", for: indexPath)
        
        let track = trackList[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = track.song
        content.secondaryText = track.artist
        content.image = UIImage(named: track.title)
        
        cell.contentConfiguration = content
        return cell
    }

    //MARK: - if use program segue from TrackListViewController to TrackDetailsViewController
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedTrack = trackList[indexPath.row]
        performSegue(withIdentifier: "showDetails", sender: selectedTrack)
    }
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let trackDetailsVC = segue.destination as! TrackDetailsViewController
//        guard let indexPath = tableView.indexPathForSelectedRow else { return }
//        let track = trackList[indexPath.row]
//        делаем через as? потому что свойство опциональное и track так же опциональное
//        кастим до типа Track
        trackDetailsVC.track = sender as? Track
    }

}

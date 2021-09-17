//
//  MovieDetailViewController.swift
//  PruebaGlobalHitss
//
//  Created by Bart on 16/09/21.
//

import UIKit

class MovieDetailViewController: UIViewController {
    var movie:Movie? = nil
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgPoster: UIImageView!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showDetails()
        // Do any additional setup after loading the view.
    }
    private func showDetails(){
        lblTitle.text = movie?.title
        lblDate.text = movie?.releaseDate
        lblRating.text = String(movie?.voteAverage ?? 0)
        lblDescription.text = movie?.overview
        let strMovie:String = "https://www.themoviedb.org/t/p/w220_and_h330_face/\(movie?.posterPath ?? "")"
        let urlMovie = URL(string:strMovie.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!
        imgPoster.load(url: urlMovie)
    }

}

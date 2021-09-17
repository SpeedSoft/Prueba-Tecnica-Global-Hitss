//
//  ViewController.swift
//  PruebaGlobalHitss
//
//  Created by Bart on 14/09/21.
//

import UIKit

class ListMovieViewController: UIViewController {
    var movies = [Movie]()
    var movieSelected:Movie?
    @IBOutlet weak var collectViewMovies: UICollectionView!
    var vmListMovie = VMListMovies()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        bind()
    }
    
    private func configureView(){
        collectViewMovies.dataSource = self
        collectViewMovies.delegate = self
    }
    
    private func bind(){
        vmListMovie.bindListMovieViewModelToController = { [weak self] () in
            DispatchQueue.main.async {
                self?.collectViewMovies.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is MovieDetailViewController {
            let vc = segue.destination as? MovieDetailViewController
            vc?.movie = sender as? Movie
        }
    }
}

extension ListMovieViewController:UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (vmListMovie.moviesData == nil){
            return 0
        }else{
            return vmListMovie.moviesData.results.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
        cell.lblMovie.text = "\(vmListMovie.moviesData.results[indexPath.row].title)   \(String(vmListMovie.moviesData.results[indexPath.row].voteAverage))"
        let strMovie:String = "https://www.themoviedb.org/t/p/w220_and_h330_face/\(vmListMovie.moviesData.results[indexPath.row].posterPath)"
        let urlMovie = URL(string:strMovie.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!
        cell.ImgMovie.load(url: urlMovie)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        movieSelected = vmListMovie.moviesData.results[indexPath.row]
        performSegue(withIdentifier: "SegueDetailMovie", sender:vmListMovie.moviesData.results[indexPath.row])
    }
    
}

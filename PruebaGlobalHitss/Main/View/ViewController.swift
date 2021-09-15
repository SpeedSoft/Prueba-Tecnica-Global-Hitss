//
//  ViewController.swift
//  PruebaGlobalHitss
//
//  Created by Bart on 14/09/21.
//

import UIKit

class ViewController: UIViewController {
    var movies = [Movie]()
    @IBOutlet weak var collectViewMovies: UICollectionView!
    var vmListMovie = VMListMovie()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        bind()
    }
    private func configureView(){
        collectViewMovies.dataSource = self
    }
    private func bind(){
        vmListMovie.bindListMovieViewModelToController = { [weak self] () in
            DispatchQueue.main.async {
                self?.collectViewMovies.reloadData()
            }
        }
    }
}

extension ViewController:UICollectionViewDataSource{
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
}

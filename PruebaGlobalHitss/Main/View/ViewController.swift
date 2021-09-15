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
        
    }
    private func configureView(){
        collectViewMovies.dataSource = self
        
    }
    private func bind(){
        vmListMovie.bindListMovieViewModelToController = { [weak self] () in
            
        }
    }

}

extension ViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
        return cell
    }
    
    
}

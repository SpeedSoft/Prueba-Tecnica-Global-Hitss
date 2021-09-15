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
    override func viewDidLoad() {
        super.viewDidLoad()

        collectViewMovies.dataSource = self
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

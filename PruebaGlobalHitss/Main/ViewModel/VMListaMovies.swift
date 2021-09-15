//
//  VMListaMovies.swift
//  PruebaGlobalHitss
//
//  Created by Bart on 15/09/21.
//

import Foundation

class VMListMovie : NSObject {
    
    private var apiService : APIService!
    private(set) var empData : ResponseTopRate! {
        didSet {
            self.bindListMovieViewModelToController()
        }
    }
    
    var bindListMovieViewModelToController = { () -> () in }
    
    override init() {
        super.init()
        self.apiService =  APIService()
        getMovieData()
    }
    
    func getMovieData() {
        self.apiService.apiToGetTopRateMovie { (empData) in
            self.empData = empData
        }
    }
}

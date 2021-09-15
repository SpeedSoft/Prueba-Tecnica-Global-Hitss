//
//  VMListaMovies.swift
//  PruebaGlobalHitss
//
//  Created by Bart on 15/09/21.
//

import Foundation

class VMListMovie : NSObject {
    
    private var apiService : APIService!
    private(set) var moviesData : ResponseTopRate! {
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
        self.apiService.apiToGetTopRateMovie { (responseData) in
            switch responseData{
            case .success(let messageData):
                self.moviesData = messageData
            case .failure(.canNotProcessData):
                print("Los datos no pueden ser procesados")
            case .failure(.noDataAvailable):
                print("el servicio no cuenta con datos")
            }
            
        }
    }
}

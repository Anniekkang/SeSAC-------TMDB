//
//  APIKey.swift
//  TMDB
//
//  Created by 나리강 on 2022/08/03.
//

import UIKit

struct APIKey {
    static let APIMovie = "39482b595731de46e04badd8ab070e10"
    
}

struct Endpoint {
    static let movieURL = "https://api.themoviedb.org/3/trending/movie/week?api_key="
    static let genreURL = "https://api.themoviedb.org/3/genre/movie/list?api_key=\(APIKey.APIMovie)&language=en-US"
  
}

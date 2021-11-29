//
//  ImageServiceProtocol.swift
//  TestTechiOS
//
//  Created by DIAN on 28/11/2021.
//

import Foundation

protocol ImageServiceProtocol {
    func getImageAPI(_ imageUrl: String, completion: @escaping (Data) -> Void)
}


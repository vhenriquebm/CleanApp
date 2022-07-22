//
//  HttpPostClient.swift
//  Data
//
//  Created by Vitor Henrique Barreiro Marinho on 21/07/22.
//

import Foundation

public protocol HttpPostClient {
    func post(to url:URL, with data: Data?)
}

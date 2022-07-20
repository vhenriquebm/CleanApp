//
//  DataTests.swift
//  DataTests
//
//  Created by Vitor Henrique Barreiro Marinho on 19/07/22.
//

import XCTest
//@testable import Data

class RemoteAddAccount {
    private let url: URL
    private let httpClient:HttpPostClient
    
    init (url:URL, httpClient: HttpPostClient) {
        self.url = url
        self.httpClient = httpClient
    }
    
    func add () {
        httpClient.post(url: url)
    }
}

protocol HttpPostClient {
    func post(url:URL)
}

class RemoteAddAccountTests: XCTestCase {

    func test_add_should_httpClient_with_correct_url () {
        let url = URL(string: "http://any-url.com")!
        let httpClientSpy = HttpClientSpy()
        let sut = RemoteAddAccount (url:url , httpClient: httpClientSpy)
        sut.add()
        XCTAssertEqual(httpClientSpy.url, url)
    }
    
    class HttpClientSpy: HttpPostClient {
        var url: URL?
        func post(url: URL) {
            self.url = url
    }
    }
}
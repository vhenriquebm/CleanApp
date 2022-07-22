
import XCTest
import Domain
import Data



class RemoteAddAccountTests: XCTestCase {
    
    func test_add_should_httpClient_with_correct_url () {
       let url = URL(string: "http//any-url.com")!
        let (sut, httpClientSpy) = makeSut(url: url)
        sut.add(addAccountModel: makeAddaccountModel())
        XCTAssertEqual(httpClientSpy.url, url)
    }

    func test_add_should_httpClient_with_correct_data () {
     
        let (sut, httpClientSpy) = makeSut()
        let addAccountModel =  makeAddaccountModel()
         sut.add(addAccountModel: makeAddaccountModel())
        XCTAssertEqual(httpClientSpy.data, addAccountModel.toData())
    }
    
 
}



// Helpers
extension RemoteAddAccountTests {
    
    func makeSut (url: URL = URL(string: "http//any-url.com")!) -> (sut: RemoteAddAccount, httpClientSpy: HttpClientSpy) {
        let httpClientSpy = HttpClientSpy()
        let sut = RemoteAddAccount(url: url, httpClient: httpClientSpy)
   return (sut, httpClientSpy)
    }
    
    func makeAddaccountModel () -> AddAccountModel {
        return AddAccountModel(name: "any_name", email: "any_email@gmail.com", password: "any_password", passwordConfirmation: "any_password")
    }
    
    class HttpClientSpy: HttpPostClient {
        var url: URL?
        var data: Data?
        func post(to url: URL, with data: Data?) {
            self.url = url
            self.data = data
    }
    }
}

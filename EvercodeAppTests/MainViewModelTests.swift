import XCTest
@testable import EvercodeApp

class MainViewModelDelegateMock: MainViewModelDelegate {
    
    var delegateWasCalled = false
    var itemsCountIsCorrect = false
    
    func didFetchItems(items: [String]) {
        delegateWasCalled = true
        itemsCountIsCorrect = items.count == 3
    }
}

class ServiceMock: ServiceProtocol {
    
    var serviceIsCalled = false
    
    func fetchData(completion: ([String]?) -> Void) {
        serviceIsCalled = true
        completion(["Item 1", "Item 2", "Item 3"])
    }
}

final class MainViewModelTests: XCTestCase {

    func testFetchItems() throws {
        
        let service = ServiceMock()
        let delegate = MainViewModelDelegateMock()
        let viewModel = MainViewModel(delegate: delegate, service: service)
        
        viewModel.fetchItems()
        
        XCTAssertEqual(delegate.delegateWasCalled, true)
        XCTAssertEqual(delegate.itemsCountIsCorrect, true)
        XCTAssertEqual(service.serviceIsCalled, true)
    }
}

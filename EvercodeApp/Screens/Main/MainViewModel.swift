import Foundation

protocol MainViewModelDelegate: AnyObject {
    
    func didFetchItems(items: [String])
}

class MainViewModel {
    
    weak var delegate: MainViewModelDelegate?
    private let service: ServiceProtocol

    init(delegate: MainViewModelDelegate, service: ServiceProtocol = Service()) {
        
        self.delegate = delegate
        self.service = service
    }
    
    func fetchItems() {

        service.fetchData { [weak self] items in
            
            guard let safeItems = items else {
                fatalError()
            }
            
            self?.delegate?.didFetchItems(items: safeItems)
        }
    }
}

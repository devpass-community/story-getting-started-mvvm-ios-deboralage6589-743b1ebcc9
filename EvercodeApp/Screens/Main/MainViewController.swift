import UIKit

final class MainViewController: UIViewController {

    private lazy var mainView: MainView = {

        let mainView = MainView()
        return mainView
    }()
        
    lazy var viewModel = MainViewModel(delegate: self)

    override func viewDidLoad() {

        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Evercode App"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        viewModel.fetchItems()
    }

    override func loadView() {
        self.view = mainView
    }
}

extension MainViewController: MainViewModelDelegate {
    
    func didFetchItems(items: [String]) {
        
        DispatchQueue.main.async {
            
            self.mainView.updateView(items: items)
        }
    }
}

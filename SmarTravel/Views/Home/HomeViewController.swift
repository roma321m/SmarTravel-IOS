import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var countriesCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var soldOutCollectionView: UICollectionView!
    
    var countries: [Country] = []
    var trips: [Trip] = []
    var popularTrips: [Trip] = []
    var soldOut: [Trip] = []
    
    //MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initCollectionViews()
        
        fetchInitialData()
    }
    
    @IBAction func profileClicked(_ sender: Any) {
        let controller = ProfileViewController.instantiate()
        controller.trips = trips //FIXME: change to actual user trips list
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func settingsClicked(_ sender: Any) {
        let controller = SettingsViewController.instantiate()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    private func fetchInitialData() {
        NetworkService.singleInstance.fetchAllCountries { (result) in
            switch result {
            case .success(let data):
                self.countries = data
                self.countriesCollectionView.reloadData()
                print ("The decoded data to string is: \n\(data)")
            case .failure(let error):
                print("The error is: \n\(error.localizedDescription)")
            }
        }
        NetworkService.singleInstance.fetchAllTrips { (result) in
            switch result {
            case .success(let data):
                self.trips = data
                self.soldOut = self.trips // FIXME: sort by sold out
                self.popularTrips = self.trips // FIXME: sort by popular
                self.popularCollectionView.reloadData()
                self.soldOutCollectionView.reloadData()
                print ("The decoded data to string is: \n\(data)")
            case .failure(let error):
                print("The error is: \n\(error.localizedDescription)")
            }
        }
    }
    
    private func initCollectionViews() {
        countriesCollectionView.delegate = self
        countriesCollectionView.dataSource = self
        popularCollectionView.delegate = self
        popularCollectionView.dataSource = self
        soldOutCollectionView.delegate = self
        soldOutCollectionView.dataSource = self
        
        registerCells()
    }
    
    private func registerCells(){
        countriesCollectionView.register(UINib(nibName: CountriesCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CountriesCollectionViewCell.identifier)
        popularCollectionView.register(UINib(nibName: PopularCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: PopularCollectionViewCell.identifier)
        soldOutCollectionView.register(UINib(nibName: SoldOutCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: SoldOutCollectionViewCell.identifier)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case countriesCollectionView:
            return countries.count
        case popularCollectionView:
            return trips.count
        case soldOutCollectionView:
            return soldOut.count
        default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case countriesCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CountriesCollectionViewCell.identifier, for: indexPath) as! CountriesCollectionViewCell
            cell.setup(countries[indexPath.row])
            return cell
        case popularCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.identifier, for: indexPath) as! PopularCollectionViewCell
            cell.setup(trips[indexPath.row])
            return cell
        case soldOutCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SoldOutCollectionViewCell.identifier, for: indexPath) as! SoldOutCollectionViewCell
            cell.setup(soldOut[indexPath.row])
            return cell
        default: return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case countriesCollectionView:
            let controller = CountryViewController.instantiate()
            controller.countyName = countries[indexPath.row].name
            controller.trips = trips // TODO: sort the list only for the selected country
            navigationController?.pushViewController(controller, animated: true)
        case popularCollectionView:
            let controller = TripDetailViewController.instantiate()
            controller.trip = trips[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        case soldOutCollectionView:
            let controller = TripDetailViewController.instantiate()
            controller.trip = soldOut[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        default: print()
        }
    }
}

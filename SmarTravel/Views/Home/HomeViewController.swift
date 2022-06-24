import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var countriesCollectionView: UICollectionView!
    
    @IBOutlet weak var popularCollectionView: UICollectionView!
    
    var countries: [Country] = []
    var trips: [Trip] = []
    
    //MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initCollectionViews()
        
        countries = Countries.countries // TODO: get this from API
        trips = Trips.trips // TODO: get from API
    }
    
    private func initCollectionViews() {
        countriesCollectionView.delegate = self
        countriesCollectionView.dataSource = self
        popularCollectionView.delegate = self
        popularCollectionView.dataSource = self
        
        registerCells()
    }
    
    private func registerCells(){
        countriesCollectionView.register(UINib(nibName: CountriesCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CountriesCollectionViewCell.identifier)
        popularCollectionView.register(UINib(nibName: PopularCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: PopularCollectionViewCell.identifier)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case countriesCollectionView:
            return countries.count
        case popularCollectionView:
            return trips.count
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
        default: return UICollectionViewCell()
        }
    }
}

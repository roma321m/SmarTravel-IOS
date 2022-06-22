import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var countriesCollectionView: UICollectionView!
    
    var countries: [Country] = []
    
    //MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        countriesCollectionView.delegate = self
        countriesCollectionView.dataSource = self
        registerCells()
        
        // TODO: get this from server
        countries = Countries.countries
    }
    
    private func registerCells(){
        countriesCollectionView.register(UINib(nibName: CountriesCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CountriesCollectionViewCell.identifier)
    }
    
    //MARK: - View methods
    
   /*
    let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    if let settingsVC = mainStoryboard.instantiateViewController(withIdentifier: "settings_vc") as? SettingsViewController {
        navigationController?.pushViewController(settingsVC, animated: true)
    }
    */
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return countries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CountriesCollectionViewCell.identifier, for: indexPath) as! CountriesCollectionViewCell
        
        cell.setup(countries[indexPath.row])
        
        return cell
    }
}

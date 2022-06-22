import UIKit
import FirebaseAuth

class OnboardingViewController: UIViewController {
    
    // MARK: - UI element diclaration
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextBTN: UIButton!
    
    // MARK: - global variables diclaration
    
    var slides: [OnBoardingSlide] = []
    var currentPage:Int = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextBTN.setTitle("Get Started", for: .normal)
            } else {
                nextBTN.setTitle("Next", for: .normal)
            }
        }
    }
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // TODO: set actual data here
        slides = [OnBoardingSlide(title: "The First Title Here",
                                  description: "Description of the first page will be here!",
                                  image: #imageLiteral(resourceName: "logo2")),
                  OnBoardingSlide(title: "The Second Title Here",
                                  description: "Description of the second page will be here!",
                                  image: #imageLiteral(resourceName: "logo2")),
                  OnBoardingSlide(title: "The Third Title Here",
                                  description: "Description of the third page will be here!",
                                  image: #imageLiteral(resourceName: "logo2"))]
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if FirebaseAuth.Auth.auth().currentUser != nil {
            self.logIn()
        }
    }
    
    //MARK: - View methods
    
    @IBAction func nextBTNClicked(_ sender: Any) {
        if currentPage == slides.count - 1 {
            let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            if let loginVC = mainStoryboard.instantiateViewController(withIdentifier: "login_vc") as? LoginViewController {
                self.present(loginVC, animated: true, completion: nil)
            }
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
    //MARK: - Methods
    
    func logIn() {
        print("You have signed in")
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let mainVC = mainStoryboard.instantiateViewController(withIdentifier: "main_vc") as! UINavigationController
        self.present(mainVC, animated: false, completion: nil)
    }
}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    // MARK: - extension override methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: OnboardingCollectionViewCell.identifier,
            for: indexPath) as! OnboardingCollectionViewCell
        
        cell.setup(slides[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}

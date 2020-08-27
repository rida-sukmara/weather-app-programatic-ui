import UIKit
import Lottie

class ViewController: UIViewController {
    
    lazy var weatherLabel: UILabel = {
        let label = UILabel()
        label.text = "it's raining now"
        label.font = label.font.withSize(30)
        label.textColor = .white
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var mapImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "map"))
        iv.tintColor = .white
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    lazy var starImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "star"))
        iv.tintColor = .white
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    lazy var weatherImageView: AnimationView = {
        let av = AnimationView()
        av.animation = Animation.named("partlyShower")
        av.loopMode = .loop
        av.translatesAutoresizingMaskIntoConstraints = false
        av.play()
        return av
    }()
    
    lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.text = "Istanbul Turkey"
        label.textColor = .white
        label.numberOfLines = 3
        label.font = label.font.withSize(30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var locationImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "location")
        iv.tintColor = .white
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    lazy var weatherContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var tempLabel: UILabel = {
        let label = UILabel()
        label.text = "26"
        label.font = label.font.withSize(70)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var degreeLabel: UILabel = {
        let label = UILabel()
        label.text = "o"
        label.textAlignment = .left
        label.textColor = .white
        label.font = label.font.withSize(25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var conditionScrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.bounces = true
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    lazy var windLabel: UILabel = {
        let label = UILabel()
        label.text = "Wind"
        label.textColor = .lightGray
        label.font = label.font.withSize(14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var windValueLabel: UILabel = {
        let label = UILabel()
        label.text = "9 km/h"
        label.textColor = .gray
        label.font = label.font.withSize(18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var humadityLabel: UILabel = {
        let label = UILabel()
        label.text = "Humadity"
        label.textColor = .lightGray
        label.font = label.font.withSize(14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var humadityValueLabel: UILabel = {
        let label = UILabel()
        label.text = "80%"
        label.textColor = .gray
        label.font = label.font.withSize(18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var windContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var humadityContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var weatherStackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .horizontal
        sv.distribution = .fillProportionally
        sv.spacing = 8
        return sv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        
        // MARK: Create CGColor
        let greenBgColor = CGColor(srgbRed: 150/255,
                                   green: 226/255,
                                   blue: 200/255,
                                   alpha: 1)
        // MARK: Set Background Color
        view.backgroundColor = UIColor(cgColor: greenBgColor)
        
        // MARK: Create StackView for map and star image
        let imagesStackView = UIStackView(arrangedSubviews: [mapImageView, starImageView])
        
        imagesStackView.axis = .vertical
        imagesStackView.translatesAutoresizingMaskIntoConstraints = false
        imagesStackView.spacing = 20
        
        // MARK: add to subview
        view.addSubview(weatherLabel)
        view.addSubview(imagesStackView)
        
        // MARK: Set Constraint Weahter Label
        NSLayoutConstraint.activate([
            weatherLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 32
            ),
            weatherLabel.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 32
            ),
            weatherLabel.widthAnchor.constraint(
                lessThanOrEqualTo: view.widthAnchor,
                multiplier: 0.3
            )
        ])
        
        // MARK: Set Image Stack View Constraint
        NSLayoutConstraint.activate([
            imagesStackView.topAnchor.constraint(
                equalTo: weatherLabel.topAnchor,
                constant: 10
            ),
            imagesStackView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -16
            )
        ])
        
        view.addSubview(weatherImageView)
        view.addSubview(weatherContainerView)
        
        // MARK: Set Weather Image View Constraint
        NSLayoutConstraint.activate([
            weatherImageView.centerYAnchor.constraint(
              equalTo: view.centerYAnchor
            ),
            weatherImageView.centerXAnchor.constraint(
              equalTo: view.centerXAnchor
            ),
            weatherImageView.widthAnchor.constraint(
              lessThanOrEqualTo: view.widthAnchor,
              multiplier: 0.55
            ),
            weatherImageView.heightAnchor.constraint(
              equalTo: weatherImageView.widthAnchor
            ),
        ])
        
        // MARK: Set View
        NSLayoutConstraint.activate([
            weatherContainerView.leadingAnchor.constraint(
              equalTo: view.leadingAnchor
            ),
            weatherContainerView.bottomAnchor.constraint(
              equalTo: view.safeAreaLayoutGuide.bottomAnchor
            ),
            weatherContainerView.widthAnchor.constraint(
              equalTo: view.widthAnchor,
              multiplier: 0.5
            ),
            weatherContainerView.heightAnchor.constraint(
              equalTo: weatherContainerView.widthAnchor
            )
        ])
        
        // MARK: Add Weather
        weatherContainerView.addSubview(locationImageView)
        weatherContainerView.addSubview(locationLabel)
        weatherContainerView.addSubview(tempLabel)
        weatherContainerView.addSubview(degreeLabel)
        
        // MARK: Add constraint
        NSLayoutConstraint.activate([
            locationImageView.leadingAnchor.constraint(
              equalTo: weatherContainerView.leadingAnchor,
              constant: 8
            ),
            locationImageView.topAnchor.constraint(
              equalTo: weatherContainerView.topAnchor,
              constant: 12
            ),
            locationLabel.leadingAnchor.constraint(
              equalTo: locationImageView.trailingAnchor,
              constant: 8
            ),
            locationLabel.trailingAnchor.constraint(
              equalTo: weatherContainerView.trailingAnchor
            ),
            tempLabel.centerXAnchor.constraint(
              equalTo: weatherContainerView.centerXAnchor
            ),
            tempLabel.topAnchor.constraint(
              equalTo: locationLabel.bottomAnchor
            ),
            degreeLabel.leadingAnchor.constraint(
              equalTo: tempLabel.trailingAnchor
            ),
            degreeLabel.trailingAnchor.constraint(
              equalTo: weatherContainerView.trailingAnchor
            ),
            degreeLabel.topAnchor.constraint(
              equalTo: tempLabel.topAnchor
            )
        ])
        
        // MARK: Section Scrollview
        view.addSubview(conditionScrollView)
        
        NSLayoutConstraint.activate([
            conditionScrollView.leadingAnchor.constraint(
              equalTo: weatherContainerView.trailingAnchor,
              constant: 8
            ),
            conditionScrollView.trailingAnchor.constraint(
              equalTo: view.trailingAnchor,
              constant: -8
            ),
            conditionScrollView.topAnchor.constraint(
              equalTo: tempLabel.topAnchor,
              constant: 8
            ),
            conditionScrollView.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        conditionScrollView.addSubview(weatherStackView)
        
        NSLayoutConstraint.activate([
            weatherStackView.leadingAnchor.constraint(
              equalTo: conditionScrollView.leadingAnchor
            ),
            weatherStackView.topAnchor.constraint(
              equalTo: conditionScrollView.topAnchor
            ),
            weatherStackView.trailingAnchor.constraint(
              equalTo: conditionScrollView.trailingAnchor
            ),
            weatherStackView.bottomAnchor.constraint(
              equalTo: conditionScrollView.bottomAnchor
            ),
            weatherStackView.widthAnchor.constraint(
              equalTo: view.widthAnchor, multiplier: 0.6
            )
        ])
        
        windContainer.addSubview(windLabel)
        windContainer.addSubview(windValueLabel)
        
        weatherStackView.addArrangedSubview(windContainer)
        
        NSLayoutConstraint.activate([
            windLabel.topAnchor.constraint(
              equalTo: windContainer.topAnchor,
              constant: 8
            ),
            windLabel.centerXAnchor.constraint(
              equalTo: windContainer.centerXAnchor
            ),
            windValueLabel.topAnchor.constraint(
              equalTo: windLabel.bottomAnchor,
              constant: 8
            ),
            windValueLabel.centerXAnchor.constraint(
              equalTo: windContainer.centerXAnchor
            ),
            windValueLabel.bottomAnchor.constraint(
              equalTo: windContainer.bottomAnchor,
              constant: -8
            ),
        ])
        
        humadityContainer.addSubview(humadityLabel)
        humadityContainer.addSubview(humadityValueLabel)
        
        weatherStackView.addArrangedSubview(humadityContainer)
        
        NSLayoutConstraint.activate([
            humadityLabel.topAnchor.constraint(
              equalTo: humadityContainer.topAnchor,
              constant: 8
            ),
            humadityLabel.centerXAnchor.constraint(
              equalTo: humadityContainer.centerXAnchor
            ),
            humadityValueLabel.topAnchor.constraint(
              equalTo: humadityLabel.bottomAnchor,
              constant: 8
            ),
            humadityValueLabel.centerXAnchor.constraint(
              equalTo: humadityContainer.centerXAnchor
            ),
            humadityValueLabel.bottomAnchor.constraint(
              equalTo: humadityContainer.bottomAnchor,
              constant: -8
            ),
        ])
    }
}

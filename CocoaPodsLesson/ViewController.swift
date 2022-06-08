import UIKit
import Alamofire
import Lottie
import Kingfisher
import SkeletonView

class ViewController: UIViewController {

    let animationView = AnimationView(name: "animation")
    let imageView = UIImageView()
    let textField = UITextField()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        AF.request("https://zoo-animal-api.herokuapp.com/animals/rand").responseDecodable(of: Fact.self) {
            responce in
            guard let fact = responce.value else { return }
            print(fact)
            
            let url = URL(string: fact.imageLink)
            let processor = RoundCornerImageProcessor(cornerRadius: 50)
            self.imageView.kf.setImage(with: url, placeholder: UIImage(systemName: "star"), options: [.processor(processor)])
        }
        
        
//        setUpAnimationView()
        setUpImageViewLayout()
        setUpTextFieldLAyout()
        
    }
    
    private func setUpImageViewLayout() {
        view.addSubview(imageView)
        imageView.isSkeletonable = true
        imageView.kf.indicatorType = .activity
        
//        let animation = GradientDirection.rightLeft.slidingAnimation(duration: 3, autoreverses: true)
//        imageView.showAnimatedGradientSkeleton(usingGradient: SkeletonAppearance.default.gradient, animation: animation)
//        imageView.showAnimatedGradientSkeleton()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2)
        ])
    }
    
    private func setUpTextFieldLAyout() {
        view.addSubview(textField)
//        textField.delegate = self
        textField.backgroundColor = .yellow
        textField.textColor = .black
        textField.placeholder = "rrr"
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -20),
//            textField.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 50),
            textField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2)
        ])
    }
    
    private func setUpAnimationViewLayout() {
        view.addSubview(animationView)
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.loopMode = .autoReverse
        animationView.play()
        animationView.backgroundColor = .purple
        
        NSLayoutConstraint.activate([
            animationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            animationView.topAnchor.constraint(equalTo: view.topAnchor),
            animationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            animationView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }


}


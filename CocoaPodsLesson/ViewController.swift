import UIKit
import Alamofire
import Lottie

class ViewController: UIViewController {

    let animationView = AnimationView(name: "animation")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        AF.request("https://zoo-animal-api.herokuapp.com/animals/rand").responseDecodable(of: Fact.self) {
            responce in
            guard let fact = responce.value else { return }
            print(fact)
        }
        
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


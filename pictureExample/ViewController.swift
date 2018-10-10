import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL.init(string: "https://static.food2fork.com/Jalapeno2BPopper2BGrilled2BCheese2BSandwich2B12B500fd186186.jpg")!
        var request = URLRequest.init(url: url)
        request.addValue("image/jpeg", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            let image = UIImage.init(data: data!)!
            DispatchQueue.main.async {
                self.imageView.image = image
            }
            
        }
        task.resume()
    }

}


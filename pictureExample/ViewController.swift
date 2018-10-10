import UIKit

class ViewController: UIViewController {
    
    let imageURLs = [
    URL(string: "https://static.food2fork.com/Jalapeno2BPopper2BGrilled2BCheese2BSandwich2B12B500fd186186.jpg")!,
    URL(string: "http://static.food2fork.com/icedcoffee5766.jpg")!,
    URL(string: "http://static.food2fork.com/CrashHotPotatoes5736.jpg")!,
    URL(string: "http://static.food2fork.com/avocadomacandcheesedc99.jpg")!,
    URL(string: "http://static.food2fork.com/333323997_04bd8d6c53da11.jpg")!,
    URL(string: "http://static.food2fork.com/best_pizza_dough_recipe1b20.jpg")!
    ]
}

extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageURLs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "custom", for: indexPath) as! CustomCollectionViewCell
        let url = imageURLs[indexPath.row]
        var request = URLRequest.init(url: url)
        request.addValue("image/jpeg", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            let image = UIImage.init(data: data!)!
            DispatchQueue.main.async {
                cell.imageView.image = image
            }
        }
        task.resume()
        return cell
    }
}

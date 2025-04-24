
import UIKit
import FirebaseFirestore
import SDWebImage

class HomeViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    var postDizi = [Post]()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()
        
        firebaseVerileriAL()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postDizi.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! TableCellTableViewCell
        cell.TextEmail.text = postDizi[indexPath.row].email
        cell.TextYorum.text = postDizi[indexPath.row].yorum
        cell.TableCellImage.sd_setImage(with: URL(string: self.postDizi[indexPath.row].gorselURL), placeholderImage: UIImage(named: "bos"))
        return cell;
    }
    
    func firebaseVerileriAL() {
        let firestoreDatabase = Firestore.firestore()
        
        firestoreDatabase.collection("Post").addSnapshotListener { snapshot, error in
            if error != nil {
                print(error?.localizedDescription ?? "Hata")
            } else {
                if let snapshot = snapshot, !snapshot.isEmpty {
                    self.postDizi.removeAll()
                    for document in snapshot.documents {
                        let email = document.get("email") as? String ?? ""
                        let yorum = document.get("yorum") as? String ?? ""
                        let gorselURL = document.get("gorselURL") as? String ?? ""
                        print(gorselURL)
                        
                        self.postDizi.append(Post(email: email, yorum: yorum, gorselURL: gorselURL))
                    }
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
}

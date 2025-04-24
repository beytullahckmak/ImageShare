
import Foundation

class Post {
    var email : String
    var yorum : String
    var gorselURL : String
    
    init(email: String, yorum: String, gorselURL: String) {
        self.email = email
        self.yorum = yorum
        self.gorselURL = gorselURL
    }
    
}

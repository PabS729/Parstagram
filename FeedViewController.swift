//
//  FeedViewController.swift
//  Parstagram
//
//  Created by Minjing Shi on 4/2/19.
//  Copyright © 2019 Minjing Shi. All rights reserved.
//

import UIKit
import Parse
import Alamofire
class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var POSTS = [PFObject]()
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return POSTS.count;
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell") as! postCell
        
        let post = POSTS[indexPath.row]
        let user = post["author"] as! PFUser
        cell.usernameLabel.text = user.username
        cell.content.text = (post["caption"] as! String)
        
        let imagefile = post["image"] as! PFFileObject
        let imageurl = imagefile.url!
        let url = URL(string: imageurl)!
        cell.photoView.af_setImage(withURL: url)
        return cell
    }
    @IBOutlet weak var posttable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        posttable.delegate = self
        posttable.dataSource = self

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        let query = PFQuery(className: "posts")
        query.includeKey("author")
        query.limit = 20
        
        query.findObjectsInBackground { (posts, error) in
            if posts != nil {
                self.POSTS = posts!
                self.posttable.reloadData()
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

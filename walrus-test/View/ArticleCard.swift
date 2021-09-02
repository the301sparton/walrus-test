//
//  ArticleCardTableViewCell.swift
//  walrus-test
//
//  Created by Chaitanya Deshpande on 01/09/21.
//

import UIKit

class ArticleCard: UITableViewCell {
    
    
    @IBOutlet weak var authorName: UILabel!
    
    @IBOutlet weak var articleTitle: UILabel!
    
    @IBOutlet weak var articleImage: UIImageView!
    
    @IBOutlet weak var articleContent: UILabel!
    
    @IBOutlet weak var seeFullArticleButton: UIButton!
    
    @IBOutlet weak var baseCard: UIView!
    
    var parent: UIViewController?
    var articleURL : String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor(hexaString: "#121212")
        contentView.layer.cornerRadius = 10
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //set the values for top,left,bottom,right margins
        let margins = UIEdgeInsets(top: 20, left: 10, bottom: 0, right: 10)
        contentView.frame = contentView.frame.inset(by: margins)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setArticleView(article : Article){
        authorName.text = article.author ?? "Author Information Not Available"
        if article.author == "" {
            authorName.text = "Author Information Not Available"
        }
        articleTitle.text = article.title
        
        articleContent.text = article.description ?? "Tap 'See Full News' to read more."
        if article.description == "" {
            articleContent.text = "Tap 'See Full News' to read more."
        }
        articleImage.load(url: URL(string: article.urlToImage ?? "https://www.habx.in/assets/images/videos_not_found.png")!)
        
        seeFullArticleButton.layer.cornerRadius = 8
        articleURL = article.url ?? ""
    }
    
    
    @IBAction func seeFullArticleEvent(_ sender: Any) {
        if let webViewVC : WebViewController = (Util.storyBoard.instantiateViewController(withIdentifier: "webViewVC") as? WebViewController) {
            webViewVC.articleTitle = articleTitle.text ?? ""
            webViewVC.articleURL = articleURL
            parent!.navigationController!.pushViewController(webViewVC, animated: true)
        }
    }
    
}

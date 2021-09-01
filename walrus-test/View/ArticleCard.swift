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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setArticleView(article : Article){
        authorName.text = article.author
        articleTitle.text = article.title
        articleContent.text = article.description
        articleImage.load(url: URL(string: article.urlToImage ?? "https://www.habx.in/assets/images/videos_not_found.png")!)
    }

}

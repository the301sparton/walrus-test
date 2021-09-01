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
        self.backgroundColor = UIColor(hexaString: "#121212")
        contentView.layer.cornerRadius = 10
        // Initialization code
    }
    
    override func layoutSubviews() {
           super.layoutSubviews()
           //set the values for top,left,bottom,right margins
           let margins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
           contentView.frame = contentView.frame.inset(by: margins)
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

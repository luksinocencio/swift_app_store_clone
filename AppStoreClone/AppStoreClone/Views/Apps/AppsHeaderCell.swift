import UIKit
import SDWebImage

class AppsHeaderCell: UICollectionViewCell {
    var appFeatured: FeaturedApp? {
        didSet {
            if let appFeatured = appFeatured {
                companyLabel.text = appFeatured.nome
                descriptionLabel.text = appFeatured.descricao
                imageImageView.sd_setImage(with: URL(string: appFeatured.imagemUrl), completed: nil)
            }
        }
    }
    
    let companyLabel: UILabel = .textLabel(text: "App empresa", fontSize: 12)
    let descriptionLabel: UILabel = .textLabel(text: "App descrição header", fontSize: 20, numberOfLines: 2)
    let imageImageView: UIImageView = .screenshotImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        companyLabel.textColor = UIColor.azul
        
        let stackView = UIStackView(arrangedSubviews: [companyLabel, descriptionLabel, imageImageView])
        stackView.axis = .vertical
        stackView.spacing = 8
        
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 16, left: 0, bottom: 0, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

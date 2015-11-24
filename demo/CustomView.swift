
import UIKit

@IBDesignable class CustomView : UIView {
    
    var label: UILabel!
    var imageView: UIImageView!
    
    @IBInspectable var text: String? {
        didSet { label.text = text }
    }
    
    @IBInspectable var image: UIImage? {
        didSet { imageView.image = image }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubviews()
    }
    
    func addSubviews() {
        imageView = UIImageView()
        addSubview(imageView)
        label = UILabel()
        addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.borderWidth = 0.5
        layer.cornerRadius = 5
        imageView.frame = self.bounds
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
        label.frame = CGRectMake(0, bounds.size.height - 40, bounds.size.width, 40)
        label.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.1)
        label.textAlignment = .Center
        label.textColor = .grayColor()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        text = " iPhone 6s"
        let url = "http://i.telegraph.co.uk/multimedia/archive/03058/iphone_6_3058505b.jpg"
        imageView.image = UIImage(data: NSData(contentsOfURL: NSURL(string: url)!)!)
    }
}

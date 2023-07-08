import UIKit

class CustomAlertViewController: UIViewController {
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let tickImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var duration: Double = 1.0
    
    init(message: String, duration: Double = 1.0,image : UIImage) {
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = .popover
        self.messageLabel.text = message
        self.duration = duration
        self.tickImageView.image = image
        if image == UIImage(systemName: "checkmark.circle.fill") {
            tickImageView.tintColor = .systemGreen
        }else {
            tickImageView.tintColor = .systemRed
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) { [weak self] in
            self?.dismiss(animated: true, completion: nil)
        }
    }
    
    private func setupViews() {
        containerView.addSubview(tickImageView)
        containerView.addSubview(messageLabel)
        view.addSubview(containerView)
    }
    
    private func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view.snp.centerY)
            make.width.equalTo(200)
        }
        tickImageView.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top).offset(16)
            make.centerX.equalTo(view.snp.centerX)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        messageLabel.snp.makeConstraints { make in
            make.top.equalTo(tickImageView.snp.bottom).offset(16)
            make.leading.equalTo(containerView.snp.leading).offset(16)
            make.trailing.equalTo(containerView.snp.trailing).inset(16)
            make.bottom.equalTo(containerView.snp.bottom).inset(16)
        }
    }
}


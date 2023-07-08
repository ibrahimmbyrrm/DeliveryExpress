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
        imageView.tintColor = .systemGreen
        imageView.image = UIImage(systemName: "checkmark.circle.fill")
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
    
    private var duration: Double = 2.0
    
    init(message: String, duration: Double = 2.0) {
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = .popover
        self.messageLabel.text = message
        self.duration = duration
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
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 200),
            
            tickImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            tickImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            tickImageView.heightAnchor.constraint(equalToConstant: 40),
            tickImageView.widthAnchor.constraint(equalToConstant: 40),
            
            messageLabel.topAnchor.constraint(equalTo: tickImageView.bottomAnchor, constant: 16),
            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            messageLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16)
        ])
    }
}


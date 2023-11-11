import UIKit

class PostCell : UITableViewCell {
    
    var title = UILabel()
    var icon = UIImageView()
    var view = UIView()

    func configurView(title: String, icon: String) {        self.title.text = icon
        self.icon.image = UIImage(systemName: title)
        self.icon.tintColor = .black
        setupUI()
    }
    
    private func setupUI(){
    self.addSubview(view)
        
        view.snp.makeConstraints { make in
    make.leading.trailing.equalToSuperview()
            make.height.equalTo(60)
}
        
        view.addSubview(icon)
        icon.snp.makeConstraints { make in
    make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }
        
        view.addSubview(title)
        title.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(icon.snp.trailing).offset(20)
        }
    }
    

    
}


import UIKit
import SnapKit
class ViewController: UIViewController {
    
    let sections:[String] = ["TO DO (15)", "COMPLETED", "PROCESSING"]

    var index = 0
    
    
    let processing: [[String]] = [
        [ "person",  "LeetCode"],
["person.fill.badge.plus", "LeetCode"],
[ "rectangle.checkered", "LeetCode"],
[ "medal", "LeetCode"],
[ "xmark.bin.circle", "LeetCode"],
    ]
    
    let completed: [[String]] = [
[ "square.and.arrow.down.fill", "problem solving"],
["pencil.tip", "Mathematic"],
["folder", "Mathematic"],
[ "tray.and.arrow.up.fill", "LeetCode"],
["paperplane.circle", "LeetCode"],
["externaldrive.fill.badge.checkmark", "LeetCode"],
    ]
    
    let ToDoList: [[String]] = [
    ["square.and.arrow.down.fill", "LeetCode"],
    ["pencil.tip", "Mathematics"],
    ["folder","Mathematic"],
    ["tray.and.arrow.up.fill","LeetCode"],
    ["paperplane.circle", "LeetCode"],
    [ "externaldrive.fill.badge.checkmark", "LeetCode"],
    [ "xmark.bin.circle", "LeetCode"],
    [ "doc.richtext.ar", "LeetCode"],
    [ "apple.terminal", "LeetCode"],
    [ "arrowshape.bounce.forward", "LeetCode"],
    [ "person", "LeetCode"],
    ["person.fill.badge.plus", "LeetCode"],
    [ "rectangle.checkered", "LeetCode"],
    [ "medal", "LeetCode"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    var tableView = UITableView()
    
    var Description: UILabel = {
        let label = UILabel()
        label.text = "8 tasks, 3 completed"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .systemGray
        return label
    }()
    
    var Title: UILabel = {
        let label = UILabel()
        label.text = "TO DO LIST"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    
    func day() -> UIView {
        let view = UIView()
        view.backgroundColor = .systemGray5
        
        view.addSubview(d1)
        
        d1.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
        }
        
        view.addSubview(d3)
        
        d3.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-20)
            make.centerY.equalToSuperview()
            
        }
        
        view.addSubview(d2)
        
        d2.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(120)
        }
        return view
    }
    
    var d1: UIButton = {
        let btn = UIButton()
        btn.setTitle("YESTERDAY", for: .normal)
        btn.setTitleColor(.systemGray, for: .normal)
        btn.backgroundColor = .systemGray5
        btn.layer.cornerRadius = 16
        return btn
    }()
    var d2: UIButton = {
        let btn = UIButton()
        btn.setTitle("TODAY", for: .normal)
        btn.setTitleColor(.systemGray, for: .normal)
        btn.backgroundColor = .black
        btn.layer.cornerRadius = 16
        return btn
    }()
    var d3: UIButton = {
        let btn = UIButton()
        btn.setTitle("TOMORROW", for: .normal)
        btn.setTitleColor(.systemGray, for: .normal)
        btn.backgroundColor =  .systemGray5
        btn.layer.cornerRadius = 16
        return btn
    }()
    
    var search = UIImageView(image: UIImage(systemName: "magnifyingglass.circle"))

    func Top() -> UIView {
        let view = UIView()
        view.backgroundColor = .systemGreen
        view.addSubview(calendar)

calendar.tintColor = .black
        calendar.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)       
         make.width.height.equalTo(25)
                make.centerY.equalToSuperview()
            }
            
            view.addSubview(Title)
            
            Title.snp.makeConstraints { make in
                make.top.equalToSuperview()
                make.centerX.equalToSuperview()
            }
            
            view.addSubview(Description)
            
            Description.snp.makeConstraints { make in
                make.top.equalTo(Title.snp.bottom)
                make.centerX.equalToSuperview()
            }
            
            view.addSubview(search)
            
            search.tintColor = .black
            search.snp.makeConstraints { make in
                make.trailing.equalToSuperview().offset(-20)
                make.centerY.equalToSuperview()
                make.width.height.equalTo(25)

            }
            return view
        }
        
        var calendar = UIImageView(image: UIImage(systemName: "calendar.badge.clock"))
        

        

    }

    extension ViewController{
        private func setupUI(){
            view.backgroundColor = .white
            let tt = Top()
            view.addSubview(tt)
            
            tt.snp.makeConstraints { make in
                make.leading.trailing.equalToSuperview()
                make.top.equalToSuperview().offset(60)
                make.height.equalTo(50)
            }
            
            let dd = day()
            view.addSubview(dd)
            
            dd.snp.makeConstraints { make in
                make.top.equalTo(tt.snp.bottom)
                make.leading.trailing.equalToSuperview()
                make.height.equalTo(60)
            }
            
            tableView.register(PostCell.self ,forCellReuseIdentifier: "Data")
            tableView.delegate = self
            tableView.dataSource = self

            view.addSubview(tableView)
            
            tableView.snp.makeConstraints { make in
                make.top.equalTo(dd.snp.bottom)
                make.leading.trailing.equalToSuperview()
                make.bottom.equalToSuperview()
            }
        }
        
    }
    extension ViewController: UITableViewDelegate, UITableViewDataSource {
        
        func numberOfSections(in tableView: UITableView) -> Int {
                sections.count
        }
            
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
                sections[section]
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            switch section {
            case 0:
                return ToDoList.count
            case 1:
                return completed.count
            case 2:
                return processing.count
            default:
                return processing.count
            }
            
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Data", for: indexPath) as! PostCell
            
            switch indexPath.section{
                
            case 1:
                if indexPath.row < completed.count {
                    let post = completed[indexPath.row]
                    cell.configurView(title: post[0], icon: post[1])
                }
            case 2:
                if indexPath.row < processing.count {
                    let post = processing[indexPath.row]
                    cell.configurView(title: post[0], icon: post[1])
                }
            case 0:
        if indexPath.row < ToDoList.count {
                    let post = ToDoList[indexPath.row]
                    cell.configurView(title: post[0], icon: post[1])
                }
            default:
                if indexPath.row < ToDoList.count {
                    let post = ToDoList[indexPath.row]
                    cell.configurView(title: post[0], icon: post[1])
                }
    }
        
        
        return cell
    }
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 50
        }
    }

    import UIKit

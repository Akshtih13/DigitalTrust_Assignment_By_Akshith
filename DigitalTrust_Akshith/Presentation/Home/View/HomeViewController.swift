//
//  HomeViewController.swift
//  DigitalTrust_Akshith
//
//  Created by akshith kumar on 24/04/26.
//

import UIKit

class HomeViewController: UIViewController, StoryboardInstantiable {
    
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var welcomeView: UIView!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var navBtnStack: UIStackView!
    @IBOutlet weak var settingsBtn: UIButton!
    @IBOutlet weak var notificationBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel: HomeViewModel!
    
    static func create(viewModel: HomeViewModel = DefaultHomeViewModel(), storyBoardName: String) -> HomeViewController {
        let vc = self.instantiateViewController(storyBoardName: storyBoardName)
        vc.viewModel = viewModel
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        registerTableViewCell()
        bind()
        viewModel.fetchUserData()
    }
    
    private func setupView() {
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        tableView.backgroundColor = .clear
        setupWelcomeView()
    }
    
    private func setupWelcomeView() {
        welcomeView.backgroundColor = .clear
        welcomeLabel.text = "👋 Welcome Back"
        welcomeLabel.textColor = UIColor(named: "primary_text_color")
        welcomeLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        settingsBtn.layer.cornerRadius = 8
        notificationBtn.layer.cornerRadius = 8
        navBtnStack.spacing = 8
        notificationBtn.setImage(UIImage(named: "notification"), for: .normal)
        settingsBtn.setImage(UIImage(named: "settings"), for: .normal)
        bgImage.image = UIImage(named: "linearBg")
        settingsBtn.layer.borderColor = UIColor(named: "nav_border_color")?.cgColor
        settingsBtn.layer.borderWidth = 1
        notificationBtn.layer.borderColor = UIColor(named: "nav_border_color")?.cgColor
        notificationBtn.layer.borderWidth = 1
    }
    
}

extension HomeViewController {
    private func bind() {
        viewModel.rows.subscribe(on: self) { [weak self] _ in
            guard let self else { return }
            tableView.reloadData()
        }
    }
    
    private func registerTableViewCell() {
        tableView.separatorStyle = .none
        tableView.register(ProfileTableViewCell.self)
        tableView.register(QRcodeTableViewCell.self)
        tableView.register(PersonalInfoTableViewCell.self)
        tableView.register(EventsTableViewCell.self)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rows.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = viewModel.rows.value[indexPath.row]
        switch row {
        case .profile(let data):
            let cell: ProfileTableViewCell = tableView.dequeueReusableCell(indexPath)
            cell.setupCell(data)
            return cell
        case .qrCode(let data):
            let cell: QRcodeTableViewCell = tableView.dequeueReusableCell(indexPath)
            cell.setupCell(data)
            cell.didClickOnQRCode = { [weak self] in
                guard let self else { return }
                UIView.animate(withDuration: 0.7, delay: 0, options: [.curveEaseInOut]) {
                    self.tableView.performBatchUpdates {
                        cell.layoutIfNeeded()
                    }
                }
            }
            return cell
        case .personalInfo(let data):
            let cell: PersonalInfoTableViewCell = tableView.dequeueReusableCell(indexPath)
            cell.setupCell(title: row.title ?? "", data: data)
            cell.reloadData = { [weak self] in
                guard let self else { return }
                UIView.performWithoutAnimation {
                    self.tableView.performBatchUpdates {
                        cell.layoutIfNeeded()
                    }
                }
            }
            return cell
        case .paginingTab(let data):
            let cell: EventsTableViewCell = tableView.dequeueReusableCell(indexPath)
            cell.setupCell(data)
            cell.reloadData = { [weak self] in
                guard let self else { return }
                UIView.performWithoutAnimation {
                    self.tableView.performBatchUpdates {
                        cell.layoutIfNeeded()
                    }
                }
            }
            return cell
        }
    }
}

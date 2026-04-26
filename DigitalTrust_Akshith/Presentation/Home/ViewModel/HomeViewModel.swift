//
//  HomeViewModel.swift
//  DigitalTrust_Akshith
//
//  Created by akshith kumar on 24/04/26.
//

import Foundation

enum HomeTableViewRows {
    case profile(UserInfo)
    case qrCode([InfoCard])
    case personalInfo([PersonalInfo])
    case paginingTab([InfoCard])
    
    var title: String? {
        switch self {
        case .personalInfo:
            return "Personal Info"
        default: return nil
        }
    }
}

enum StatusType {
    case active, inactive, pending
    
    var bgColor: String {
        switch self {
        case .active:
            return "active_bg"
        case .inactive:
            return "inactive_bg"
        case .pending:
            return "pending_bg"
        }
    }
    
    var borderColor: String {
        switch self {
        case .active:
            return "active_border"
        case .inactive:
            return "inactive_border"
        case .pending:
            return "pending_border"
        }
    }
    
    var textColor: String {
        switch self {
        case .active:
            return "active_text_color"
        case .inactive:
            return "inactive_text_color"
        case .pending:
            return "pending_text_color"
        }
    }
}

enum StatusTypeExtension: String {
    case approved, pending, review
    
    func getStatusType() -> StatusType {
        switch self {
        case .approved:
            return .active
        case .pending:
            return .pending
        case .review:
            return .inactive
        }
    }
}

struct HomeViewModelActions { }

protocol HomeViewModelInputs {
    func fetchUserData()
}

protocol HomeViewModelOutputs {
    var rows: Observable<[HomeTableViewRows]> { get }
    var isExpanded: Bool { get set }
}

protocol HomeViewModel: HomeViewModelInputs, HomeViewModelOutputs {}

final class DefaultHomeViewModel: HomeViewModel {
    
    var rows: Observable<[HomeTableViewRows]> = Observable([])
    var isExpanded: Bool = true
    
    private var actions: HomeViewModelActions?
    init(actions: HomeViewModelActions? = nil) {
        self.actions = actions
        fetchUserData()
    }
}

extension DefaultHomeViewModel {
    
    func fetchUserData() {
        guard let fileLocation = Bundle.main.url(forResource: "UserData", withExtension: "json") else { return }
        do {
            let data = try Data(contentsOf: fileLocation)
            let recivedData = try JSONDecoder().decode(UserDataModel.self, from: data)
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                rows.value = getTableViewRows(data: recivedData)
                print("Data fetched successfully \n \(recivedData)")
            }
        } catch {
            print("Error: ........ \n\(error.localizedDescription)")
        }
    }
    
    private func getTableViewRows(data: UserDataModel) -> [HomeTableViewRows] {
        var rows: [HomeTableViewRows] = []
        if let user = data.user {
            rows.append(.profile(user))
        }
        if let actions = data.quickActions, !actions.isEmpty {
            rows.append(.qrCode(actions))
        }
        if var personalInfo = data.personalInfo, !personalInfo.isEmpty {
            if personalInfo.count > 3 {
                personalInfo.removeSubrange(3..<personalInfo.count)
            }
            rows.append(.personalInfo(personalInfo))
        }
        if let tabs = data.infoCard, !tabs.isEmpty {
            rows.append(.paginingTab(tabs))
        }
        return rows
    }
}

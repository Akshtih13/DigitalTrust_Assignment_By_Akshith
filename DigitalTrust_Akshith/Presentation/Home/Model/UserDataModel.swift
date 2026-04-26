//
//  UserDataModel.swift
//  DigitalTrust_Akshith
//
//  Created by akshith kumar on 24/04/26.
//

import Foundation

// MARK: - UserDataModel
struct UserDataModel: Codable {
    let user: UserInfo?
    let quickActions: [InfoCard]?
    let qrCard: QrCard?
    let personalInfo: [PersonalInfo]?
    let infoCard: [InfoCard]?

    enum CodingKeys: String, CodingKey {
        case user
        case quickActions = "quick_actions"
        case qrCard = "qr_card"
        case personalInfo = "personal_info"
        case infoCard = "info_card"
    }
}

// MARK: - InfoCard
struct InfoCard: Codable {
    let id: Int
    let title: String
    let description: String?
    let icon: String
}

// MARK: - PersonalInfo
struct PersonalInfo: Codable {
    let id: Int
    let title, icon, date, status: String

    enum CodingKeys: String, CodingKey {
        case id, title, icon, date, status
    }
}

// MARK: - QrCard
struct QrCard: Codable {
    let id: String
    let qrCodeImage, backgroundCardImage: String

    enum CodingKeys: String, CodingKey {
        case id
        case qrCodeImage = "qr_code_image"
        case backgroundCardImage = "background_card_image"
    }
}

// MARK: - User
struct UserInfo: Codable {
    let id: Int
    let name, mobile: String
    let profileImage: String
    let accountType, status: String

    enum CodingKeys: String, CodingKey {
        case id, name, mobile
        case profileImage = "profile_image"
        case accountType = "account_type"
        case status
    }
}

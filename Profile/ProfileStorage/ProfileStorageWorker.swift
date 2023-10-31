//
//  ProfileStorageWorker.swift
//  Profile
//
import Foundation

class ProfileStorageWorker: ProfileStorageLogic
{
    /// Keys for userDefault dictionary.
    private struct Keys {
        static let firstName = "firstName"
        static let avatar = "avatar"
        static let secondName = "secondName"
        static let middleName = "middleName"
        static let alias = "alias"
        static let mail = "mail"
        static let phone = "phone"
        static let telegram = "telegram"
    }

    /// Save profile to userDefaults.
    func save(_ profile: ProfileModel) {
        let avatar: String = profile.avatar ?? ""
        UserDefaults.standard.set(profile.firstName, forKey: Keys.firstName)
        UserDefaults.standard.set(profile.secondName, forKey: Keys.secondName)
        UserDefaults.standard.set(profile.middleName, forKey: Keys.middleName)
        UserDefaults.standard.set(avatar, forKey: Keys.avatar)
        UserDefaults.standard.set(profile.alias, forKey: Keys.alias)
        UserDefaults.standard.set(profile.mail, forKey: Keys.mail)
        UserDefaults.standard.set(profile.phone, forKey: Keys.phone)
        UserDefaults.standard.set(profile.telegram, forKey: Keys.telegram)
    }

    /// Read profile from userDefaults.
    func read() -> ProfileModel {
        let firstName = UserDefaults.standard.string(forKey: Keys.firstName)
        let secondName = UserDefaults.standard.string(forKey: Keys.secondName)
        let middleName = UserDefaults.standard.string(forKey: Keys.middleName)
        let avatar = UserDefaults.standard.string(forKey: Keys.avatar)
        let alias = UserDefaults.standard.string(forKey: Keys.alias)
        let mail = UserDefaults.standard.string(forKey: Keys.mail)
        let phone = UserDefaults.standard.string(forKey: Keys.phone)
        let telegram = UserDefaults.standard.string(forKey: Keys.telegram)

        return ProfileModel(
            avatar: avatar,
            firstName: firstName ?? "",
            secondName: secondName ?? "",
            middleName: middleName ?? "",
            alias: alias ?? "",
            mail: mail ?? "",
            phone: phone ?? "",
            telegram: telegram ?? ""
        )
    }
}

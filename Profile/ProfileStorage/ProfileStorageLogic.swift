//
//  ProfileStorageLogic.swift
//  Profile
//
import Foundation

protocol ProfileStorageLogic {
    func save(_ profile: ProfileModel)
    func read() -> ProfileModel
}

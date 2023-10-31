//
//  ViewController.swift
//  Profile
//
import UIKit

class ProfileViewController: UIViewController
{
    let profileView = ProfileView()
    var profileStorage: ProfileStorageLogic
    var profile: ProfileModel = ProfileModel()
    var avatar: String? = nil

    init(profileStorage: ProfileStorageLogic = ProfileStorageWorker()) {
        self.profileStorage = profileStorage
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
        loadProfile()
    }

    private func configureUI() {
        view.addSubview(profileView)
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        profileView.pinHorizontal(to: view)
        profileView.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        profileView.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        profileView.cancelAction = loadProfile
        profileView.saveAction = saveProfile
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(pickImage))
        profileView.avatarImage.isUserInteractionEnabled = true
        profileView.avatarImage.addGestureRecognizer(tapGestureRecognizer)
    }

    private func loadImage(image: UIImage) {
        profileView.setAvatar(image)
        avatar = image.toPngString()
        if let avatar = avatar {
            profileView.setAvatar(avatar)
        }
    }

    private func loadProfile() {
        profile = profileStorage.read()
        profileView.configure(profile: profile)
    }

    private func saveProfile() {
        let newProfile = ProfileModel(
            avatar: avatar,
            firstName: profileView.firstNameField.text ?? "",
            secondName: profileView.secondNameField.text ?? "",
            middleName: profileView.middleNameField.text ?? "",
            alias: profileView.aliasField.text ?? "",
            mail: profileView.mailField.text ?? "",
            phone: profileView.phoneField.text ?? "",
            telegram: profileView.telegramField.text ?? ""
        )
        profileStorage.save(newProfile)
    }

    @objc
    private func pickImage() {
        ImagePickerManager().pickImage(self) { image in
            self.loadImage(image: image)
        }
    }

    @objc
    func dismissKeyboard() {
        view.endEditing(true)
    }
}

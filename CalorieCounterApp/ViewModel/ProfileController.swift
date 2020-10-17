//
//  ProfileController.swift
//  CalorieCounterApp
//
//  Created by Joshua Baruwa on 11/10/2020.
//

import UIKit



class ProfileController: UIViewController,UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet var profile_img: UIImageView!
    @IBOutlet var activity_lbl: UILabel!
    @IBOutlet var goal_txt: UILabel!
    @IBOutlet var gender_txt: UILabel!
    @IBOutlet var weight_txt: UILabel!
    @IBOutlet var height_txt: UILabel!
    @IBOutlet var dob_txt: UILabel!
    @IBOutlet var name_lbl: UILabel!
    var imagePicker = UIImagePickerController()
    var user:UsersModel?
    var signupVM = SignupVM()
    var id:Int64 = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        getUser()
        // Do any additional setup after loading the view.
    }
    
    func getUser(){
        signupVM.usersCompletionHandler { [weak self] (user) in
            guard let self = self else {return}
            self.user = user[0]
            self.setUI()
       }
        signupVM.getUser()
    }
    func setUI(){
        self.id =  (user?.id!)!
        name_lbl.text = user?.name
        dob_txt.text = user?.dob
        height_txt.text = String.init(describing: user!.height!)+" cm"
        weight_txt.text = String.init(describing: user!.weight!)+" kg"
        gender_txt.text = user?.gender
        goal_txt.text = user?.goal
        activity_lbl.text = user?.active
        profile_img.image = UIImage(data: (user?.image)!)
        profile_img.layer.masksToBounds = true
        profile_img.layer.cornerRadius = profile_img.bounds.width / 2
        profile_img.contentMode = .scaleAspectFill
    }
    @IBAction func profile_change_event(_ sender: UIButton) {
        let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
           self.openCamera()
        }))

        alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
           self.openGallery()
        }))

        alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        if let popoverController = alert.popoverPresentationController {
          popoverController.sourceView = self.view
          popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
          popoverController.permittedArrowDirections = []
        }
        self.present(alert, animated: true, completion: nil)
    }
    func openCamera()
    {
       if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerController.SourceType.camera))
       {
           imagePicker.delegate = self
           imagePicker.sourceType = UIImagePickerController.SourceType.camera
           imagePicker.allowsEditing = true
           self.present(imagePicker, animated: true, completion: nil)
       }
       else
       {
           let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
           self.present(alert, animated: true, completion: nil)
       }
    }
    func openGallery(){
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
             print("Button capture")

             imagePicker.delegate = self
             imagePicker.sourceType = .photoLibrary
             imagePicker.allowsEditing = false

             present(imagePicker, animated: true, completion: nil)
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
       if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
           
           profile_img.image = pickedImage
           profile_img.layer.masksToBounds = true
           profile_img.layer.cornerRadius = profile_img.bounds.width / 2
           profile_img.contentMode = .scaleAspectFill
           signupVM.updateUser(id: id, data: (profile_img.image?.pngData())!)
       }
       
          dismiss(animated: true, completion: nil)
    }
    

        
    @IBAction func logout_listener(_ sender: UIButton) {
        Helpers.writePreference(key: "name", data: "")
        Helpers.writePreference(key: "weight", data: "")
        Helpers.writePreference(key: "height", data: "")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let tabbar = storyboard.instantiateViewController(withIdentifier: "splash") as? UINavigationController
        tabbar?.modalPresentationStyle = .fullScreen
        self.present(tabbar!, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

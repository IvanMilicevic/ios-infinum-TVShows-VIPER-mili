import UIKit
import SVProgressHUD

protocol ViewInterface: class {
    func showProgressHUD()
    func hideProgressHUD()
}

extension ViewInterface {

    func showProgressHUD() {
        SVProgressHUD.show()
    }

    func hideProgressHUD() {
        SVProgressHUD.dismiss()
    }

    func showSuccessOnProgressHUD() {
        SVProgressHUD.showSuccess(withStatus: "Success")
    }

    func showErrorOnProgressHUD() {
        SVProgressHUD.showError(withStatus: "Error")
    }


}

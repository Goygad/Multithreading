import UIKit

class TaskSevenViewController: UIViewController {
     override func viewDidLoad() {
              super.viewDidLoad()
              print(2)
              DispatchQueue.main.async {
                      print(3)
                      DispatchQueue.main.async {
                            print(5)
                      }
               print(4)
             }
           print(6)
     }
}

let vc = TaskSevenViewController()
print(1)
let view = vc.view
print(7)
//Главный поток будет ждать завершения синхронного блока,
//который не может начаться, потому что главный поток занят ожиданием.

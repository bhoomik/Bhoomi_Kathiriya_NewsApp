//
//  ImageViewVC.swift
//  Swift_MVP
//
//  Created by Bhoomi Kathiriya on 08/07/18.

//

import UIKit

class ImageViewVC: UIViewController {

    
    var objNewsImage : UIImage?
    @IBOutlet weak var scrollView : UIScrollView?
    @IBOutlet weak var imageView : UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.imageView?.image = self.objNewsImage
        scrollView?.minimumZoomScale = 1.0
        scrollView?.maximumZoomScale = 10.0
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func setImageDetail(image:UIImage)
    {
        self.objNewsImage = image
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ImageViewVC:UIScrollViewDelegate
{
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
}

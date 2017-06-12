//
//  ViewController.swift
//  ZoomInMenu
//
//  Created by vikram singh rajpoot on 04/03/17.
//  Copyright © 2017 vikram singh rajpoot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var menuView: CircleView!
    @IBOutlet weak var menuContainer: UIView!
    @IBOutlet weak var menuBtn: UIButton!
    @IBOutlet weak var linkedInBtn: UIButton!
    @IBOutlet weak var twitterbtn: UIButton!
    @IBOutlet weak var facebookBtn: UIButton!
    @IBOutlet weak var photoView: UIView!
    @IBOutlet weak var tagImageView: UIImageView!
    var photoViewPoint:CGPoint?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.toggleMenuBtns(alpha: 0)
        self.photoViewPoint = self.photoView.frame.origin
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func showMenu(_ sender: UIButton) {
    
        if self.menuView.transform == .identity {
            UIView.animate(withDuration: 0.3) {
                self.menuView.transform = CGAffineTransform(scaleX: 11, y: 11)
                self.menuContainer.transform = CGAffineTransform(translationX: 0, y: -64)
                self.menuBtn.transform = CGAffineTransform(rotationAngle: self.radian(value: 180))
                self.toggleMenuBtns(alpha: 1)
            }
        }else{
            UIView.animate(withDuration: 0.3) {
             self.menuView.transform = .identity
             self.menuContainer.transform = .identity
             self.menuBtn.transform = .identity
                self.toggleMenuBtns(alpha: 0)
            }
        }
       
    }
    
    func radian(value:CGFloat) -> CGFloat {
        return ((value * 3.14) / 180)
    }
    
    func toggleMenuBtns(alpha:CGFloat) -> Void {
        self.facebookBtn.alpha = alpha
        self.linkedInBtn.alpha = alpha
        self.twitterbtn.alpha = alpha
        self.menuBtn.layer.cornerRadius = self.menuBtn.frame.size.width / 2

    }
    
    @IBAction func viewSwap(_ sender: UIPanGestureRecognizer) {
        let card = sender.view!
        let point = sender.translation(in: self.view)
        card.center = CGPoint(x: (self.view.center.x + point.x), y: (self.view.center.y + point.y))

        switch sender.state {
        case .ended:
            self.fadeView(point: point)
            break
            
        case .changed:
           self.showThumpsUpDown(point: point)
            break
            
        default:
            break
        }
        print(point.x)
    }
    
    func resetPhotoView() -> Void {
        UIView.animate(withDuration: 0.3,animations: {
            self.photoView.center = self.view.center
        }, completion: { (true) in
            self.photoView.alpha = 1
            self.tagImageView.alpha = 0
            
        })
    }
    
    func showThumpsUpDown(point:CGPoint) -> Void {
        if point.x >= 50 {
            UIView.animate(withDuration: 0.1, animations: {
                self.tagImageView.image = #imageLiteral(resourceName: "thumbs-up")
                self.tagImageView.alpha = self.tagImageView.alpha + 0.01
            })
        }else if(point.x <= 50) {
            UIView.animate(withDuration: 0.1, animations: {
                self.tagImageView.image = #imageLiteral(resourceName: "thumb-down")
                self.tagImageView.alpha = self.tagImageView.alpha + 0.01
            })
        }
    }
    
    func fadeView(point:CGPoint) -> Void {
        if point.x >= 240 {
            UIView.animate(withDuration: 0.4, animations: {
                self.photoView.alpha = 0
                
            }, completion: { (true) in
                self.resetPhotoView()
                
            })
        }else if(point.x <= -240){
            UIView.animate(withDuration: 0.4, animations: {
                self.photoView.alpha = 0
                
            }, completion: { (true) in
                self.resetPhotoView()
                
            })
            
        }
            
        else{
            self.resetPhotoView()
            
        }
    }
}


//
//  Animator.swift
//  RSScool_T11
//
//  Created by Маргарита Жучик on 17.09.21.
//

import UIKit

class Animator: NSObject, UIViewControllerAnimatedTransitioning {
    let duration = 0.24
    var presenting = true
    var originFrame = CGRect.zero
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        let toView = transitionContext.view(forKey: .to)!
        let detailsView = presenting ? toView : transitionContext.view(forKey: .from)!

        transitionContext.containerView.addSubview(toView)
        
        toView.alpha = 0

                let duration = self.transitionDuration(using: transitionContext)
                UIView.animate(withDuration: duration, animations: {
                    toView.alpha = 1
                }, completion: { _ in
                    transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
                })
        
//        let initialFrame = presenting ? originFrame : detailsView.frame
//        let finalFrame = presenting ? detailsView.frame : originFrame
//
//        let xScaleFactor = presenting ?
//          initialFrame.width / finalFrame.width :
//          finalFrame.width / initialFrame.width
//
//        let yScaleFactor = presenting ?
//          initialFrame.height / finalFrame.height :
//          finalFrame.height / initialFrame.height
//
//        let scaleTransform = CGAffineTransform(scaleX: xScaleFactor, y: yScaleFactor)
//
//        if presenting {
//            detailsView.transform = scaleTransform
//            detailsView.center = CGPoint(
//            x: initialFrame.midX,
//            y: initialFrame.midY)
//            detailsView.clipsToBounds = true
//        }
//
//        detailsView.layer.cornerRadius = presenting ? 20.0 : 0.0
//        detailsView.layer.masksToBounds = true
//
//        containerView.addSubview(toView)
//        containerView.bringSubviewToFront(detailsView)
//
//        UIView.animate(
//          withDuration: duration,
//          delay:0.0,
//          usingSpringWithDamping: 0.5,
//          initialSpringVelocity: 0.2,
//          animations: {
//            detailsView.transform = self.presenting ? .identity : scaleTransform
//            detailsView.center = CGPoint(x: finalFrame.midX, y: finalFrame.midY)
//            detailsView.layer.cornerRadius = !self.presenting ? 20.0 : 0.0
//          }, completion: { _ in
//            transitionContext.completeTransition(true)
//        })
    }
}



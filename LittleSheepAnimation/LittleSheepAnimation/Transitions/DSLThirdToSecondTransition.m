//
//  DSLThirdToSecondTransition.m
//  TransitionExample
//
//  Created by mykoma on 15/7/28.
//  Copyright (c) 2015年 Dative Studios. All rights reserved.
//

#import "DSLThirdToSecondTransition.h"
#import "DSLThirdViewController.h"
#import "DSLSecondViewController.h"

@implementation DSLThirdToSecondTransition

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIView * containerView = [transitionContext containerView];
    
    DSLThirdViewController * fromVC = (DSLThirdViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    DSLSecondViewController * toVC = (DSLSecondViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    toVC.view.frame = [transitionContext finalFrameForViewController:toVC];
    [containerView insertSubview:toVC.view aboveSubview:fromVC.view];
    
    UIView * topViewSnapshot = [fromVC.topView snapshotViewAfterScreenUpdates:NO];
    UIView * bottomViewSnapshot = [fromVC.bottomView snapshotViewAfterScreenUpdates:NO];
    
    topViewSnapshot.frame = [containerView convertRect:fromVC.topView.frame fromView:fromVC.topView.superview];
    bottomViewSnapshot.frame = [containerView convertRect:fromVC.bottomView.frame fromView:fromVC.bottomView.superview];
    [containerView addSubview:topViewSnapshot];
    [containerView addSubview:bottomViewSnapshot];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                     animations:^{
                         topViewSnapshot.frame = CGRectOffset(topViewSnapshot.frame, 0, topViewSnapshot.frame.size.height * -1);
                         bottomViewSnapshot.frame = CGRectOffset(bottomViewSnapshot.frame, 0, bottomViewSnapshot.frame.size.height);
                     } completion:^(BOOL finished) {
                         [topViewSnapshot removeFromSuperview];
                         [bottomViewSnapshot removeFromSuperview];
                         [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
                     }];
}

@end

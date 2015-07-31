//
//  DSLSecondToFirstTransition.m
//  TransitionExample
//
//  Created by mykoma on 15/7/26.
//  Copyright (c) 2015年 Dative Studios. All rights reserved.
//

#import "DSLSecondToFirstTransition.h"
#import "DSLFirstViewController.h"
#import "DSLSecondViewController.h"
#import "DSLThingCell.h"

@implementation DSLSecondToFirstTransition

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.4;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    DSLSecondViewController * fromVC = (DSLSecondViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    DSLFirstViewController * toVC = (DSLFirstViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView * containerView = [transitionContext containerView];
    
    UIView * snapshot = [fromVC.imageView snapshotViewAfterScreenUpdates:NO];
    snapshot.frame = [containerView convertRect:fromVC.imageView.frame fromView:fromVC.imageView.superview];
    fromVC.imageView.hidden = YES;
    
    DSLThingCell * cell = [toVC collectionViewCellForThing:fromVC.thing];
    cell.imageView.hidden = YES;
    
    toVC.view.frame = [transitionContext finalFrameForViewController:toVC];
    
    [containerView insertSubview:toVC.view belowSubview:fromVC.view];
    [containerView addSubview:snapshot];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                     animations:^{
                         fromVC.view.alpha = 0;
                         snapshot.frame = [containerView convertRect:cell.imageView.frame fromView:cell.imageView.superview];
                     } completion:^(BOOL finished) {
                         [snapshot removeFromSuperview];
                         cell.imageView.hidden = NO;
                         [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
                     }];
}

@end

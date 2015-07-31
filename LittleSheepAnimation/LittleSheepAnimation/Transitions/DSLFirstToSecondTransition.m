//
//  DSLFirstToSecondTransition.m
//  TransitionExample
//
//  Created by mykoma on 15/7/26.
//  Copyright (c) 2015年 Dative Studios. All rights reserved.
//

#import "DSLFirstToSecondTransition.h"
#import "DSLFirstViewController.h"
#import "DSLSecondViewController.h"
#import "DSLThingCell.h"

@implementation DSLFirstToSecondTransition

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    DSLFirstViewController * fromVC = (DSLFirstViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    DSLSecondViewController * toVC = (DSLSecondViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView * containerView = [transitionContext containerView];
    
    NSIndexPath * path = [[fromVC.collectionView indexPathsForSelectedItems] firstObject];
    DSLThingCell * cell = (DSLThingCell *)[fromVC.collectionView cellForItemAtIndexPath:path];
    UIView * snapshot = [cell.imageView snapshotViewAfterScreenUpdates:NO];
    snapshot.frame = [containerView convertRect:cell.imageView.frame fromView:cell.imageView.superview];
    cell.imageView.hidden = YES;
    
    toVC.view.frame = [transitionContext finalFrameForViewController:toVC];
    toVC.view.alpha = 0;
    toVC.imageView.hidden = YES;
    
    [containerView addSubview:toVC.view];
    [containerView addSubview:snapshot];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                     animations:^{
                         toVC.view.alpha = 1;
                         CGRect rect = [containerView convertRect:toVC.imageView.frame fromView:toVC.view];
                         snapshot.frame = rect;
                     } completion:^(BOOL finished) {
                         toVC.imageView.hidden = NO;
                         [snapshot removeFromSuperview];
                         [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
                     }];
}

@end

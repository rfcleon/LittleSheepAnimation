
#import "LSAFirstToSecondTransition.h"
#import "LSAFirstViewController.h"
#import "LSASecondViewController.h"
#import "LSAFirstVCCollectionCell.h"

@implementation LSAFirstToSecondTransition

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    LSAFirstViewController * fromVC = (LSAFirstViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    LSASecondViewController * toVC = (LSASecondViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView * containerView = [transitionContext containerView];
    
    NSIndexPath * path = [[fromVC.collectionView indexPathsForSelectedItems] firstObject];
    LSAFirstVCCollectionCell * cell = (LSAFirstVCCollectionCell *)[fromVC.collectionView cellForItemAtIndexPath:path];
    UIView * snapshot = [cell.imageView snapshotViewAfterScreenUpdates:NO];
    snapshot.frame = [containerView convertRect:cell.imageView.frame fromView:cell.imageView.superview];
    cell.imageView.hidden = YES;
    
    toVC.view.frame = [transitionContext finalFrameForViewController:toVC];
    toVC.view.alpha = 0;
    toVC.imageView.hidden = YES;
    [toVC.view setNeedsLayout];
    [toVC.view layoutIfNeeded];
    
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

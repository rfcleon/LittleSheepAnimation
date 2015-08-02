

#import "LSASecondToFirstTransition.h"
#import "LSAFirstViewController.h"
#import "LSASecondViewController.h"
#import "LSAFirstVCCollectionCell.h"

@implementation LSASecondToFirstTransition

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.4;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    LSASecondViewController * fromVC = (LSASecondViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    LSAFirstViewController * toVC = (LSAFirstViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView * containerView = [transitionContext containerView];
    
    UIView * snapshot = [fromVC.imageView snapshotViewAfterScreenUpdates:NO];
    snapshot.frame = [containerView convertRect:fromVC.imageView.frame fromView:fromVC.imageView.superview];
    fromVC.imageView.hidden = YES;
    
    LSAFirstVCCollectionCell * cell = [toVC collectionViewCellForThing:fromVC.thing];
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

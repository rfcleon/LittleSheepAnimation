
#import "LSAThirdToSecondTransition.h"
#import "LSAThirdViewController.h"
#import "LSASecondViewController.h"

@implementation LSAThirdToSecondTransition

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIView * containerView = [transitionContext containerView];
    
    LSAThirdViewController * fromVC = (LSAThirdViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    LSASecondViewController * toVC = (LSASecondViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
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

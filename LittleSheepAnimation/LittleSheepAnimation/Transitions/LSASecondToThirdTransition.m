

#import "LSASecondToThirdTransition.h"
#import "LSASecondViewController.h"
#import "LSAThirdViewController.h"

@implementation LSASecondToThirdTransition

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.3;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    LSASecondViewController * fromVC = (LSASecondViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    LSAThirdViewController * toVC = (LSAThirdViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView * containerView = [transitionContext containerView];
    [containerView insertSubview:toVC.view belowSubview:fromVC.view];
    [toVC.view setNeedsLayout];
    [toVC.view layoutIfNeeded];
    
    NSArray * topViewConstraints = toVC.topView.constraints;
    [toVC.topView removeConstraints:topViewConstraints];
    NSArray * bottomViewConstraints = toVC.bottomView.constraints;
    [toVC.bottomView removeConstraints:bottomViewConstraints];
    
    UIView * topViewSnapshot = [self duplicate:toVC.topView];
    
    UIView * bottomViewSnapshot = [self duplicate:toVC.bottomView];
    [containerView addSubview:topViewSnapshot];
    [containerView addSubview:bottomViewSnapshot];
    
    CGRect originTopFrame = [containerView convertRect:toVC.topView.frame fromView:toVC.topView.superview];
    CGRect originBottomFrame = [containerView convertRect:toVC.bottomView.frame fromView:toVC.bottomView.superview];
    
    topViewSnapshot.frame = CGRectOffset(originTopFrame, 0, originTopFrame.size.height * -1);
    bottomViewSnapshot.frame = CGRectOffset(originBottomFrame, 0, originBottomFrame.size.height);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                     animations:^{
                         topViewSnapshot.frame = originTopFrame;
                         bottomViewSnapshot.frame = originBottomFrame;
                     } completion:^(BOOL finished) {
                         [toVC.topView addConstraints:topViewConstraints];
                         [toVC.bottomView addConstraints:bottomViewConstraints];
                         [topViewSnapshot removeFromSuperview];
                         [bottomViewSnapshot removeFromSuperview];
                         [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
                     }];
}

- (UIView*)duplicate:(UIView*)view
{
    NSData * tempArchive = [NSKeyedArchiver archivedDataWithRootObject:view];
    return [NSKeyedUnarchiver unarchiveObjectWithData:tempArchive];
}

@end

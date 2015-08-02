

#import "LSAThirdViewController.h"
#import "LSASecondViewController.h"
#import "LSAThirdToSecondTransition.h"

@interface LSAThirdViewController () <UINavigationControllerDelegate>

@end

@implementation LSAThirdViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.navigationController.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    if (self.navigationController.delegate == self) {
        self.navigationController.delegate = nil;
    }
}

- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC
{
    if (fromVC == self && [toVC isKindOfClass:[LSASecondViewController class]]) {
        return [[LSAThirdToSecondTransition alloc] init];
    }
    return nil;
}

@end

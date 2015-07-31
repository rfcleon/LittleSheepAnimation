//
//  DSLThirdViewController.m
//  TransitionExample
//
//  Created by mykoma on 15/7/28.
//  Copyright (c) 2015年 Dative Studios. All rights reserved.
//

#import "DSLThirdViewController.h"
#import "DSLSecondViewController.h"
#import "DSLThirdToSecondTransition.h"

@interface DSLThirdViewController () <UINavigationControllerDelegate>

@end

@implementation DSLThirdViewController

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
    if (fromVC == self && [toVC isKindOfClass:[DSLSecondViewController class]]) {
        return [[DSLThirdToSecondTransition alloc] init];
    }
    return nil;
}

@end

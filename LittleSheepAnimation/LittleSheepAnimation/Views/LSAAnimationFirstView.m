//
//  MyView.m
//  TestChangex
//
//  Created by mykoma on 15/7/25.
//  Copyright (c) 2015年 mykoma. All rights reserved.
//

#import "LSAAnimationFirstView.h"

@interface LSAAnimationFirstView ()

@property (nonatomic, strong) IBOutlet NSLayoutConstraint * constraint1;
@property (nonatomic, strong) IBOutlet UIView * myView;
@property (nonatomic, strong) IBOutlet NSLayoutConstraint * constraint2;
@property (nonatomic, strong) IBOutlet NSLayoutConstraint * constraint3;

@end

@implementation LSAAnimationFirstView

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (IBAction)touchOn:(id)sender
{
    self.constraint1.constant = 80;
    [self removeConstraint:self.constraint2];
    self.constraint3.constant = 100;

    [UIView animateWithDuration:1.5
                          delay:0
         usingSpringWithDamping:0.4
          initialSpringVelocity:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         [self layoutIfNeeded];
                     } completion:^(BOOL finished) {
                         
                     }];
}

@end

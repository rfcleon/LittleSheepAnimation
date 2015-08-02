//
//  MyView.m
//  TestChangex
//
//  Created by mykoma on 15/7/25.
//  Copyright (c) 2015年 mykoma. All rights reserved.
//

#import "LSAAnimationFirstView.h"

@interface LSAAnimationFirstView ()

@property (nonatomic, strong) IBOutlet UIView * myView;
@property (nonatomic, strong) IBOutlet NSLayoutConstraint * topViewHeightConstraint;
@property (nonatomic, strong) IBOutlet NSLayoutConstraint * bottomViewRelateTopViewConstraint;
@property (nonatomic, strong) IBOutlet NSLayoutConstraint * openWitdhConstraint;

@end

@implementation LSAAnimationFirstView

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (IBAction)open:(id)sender
{
    self.topViewHeightConstraint.constant = 100;
    [self removeConstraint:self.bottomViewRelateTopViewConstraint];
    NSLayoutConstraint * changedOpenWidthConstraint = [NSLayoutConstraint constraintWithItem:self.openWitdhConstraint.firstItem
                                                                                   attribute:self.openWitdhConstraint.firstAttribute
                                                                                   relatedBy:self.openWitdhConstraint.relation
                                                                                      toItem:self.openWitdhConstraint.secondItem
                                                                                   attribute:self.openWitdhConstraint.secondAttribute
                                                                                  multiplier:1.0/4
                                                                                    constant:self.openWitdhConstraint.constant];
    [self removeConstraint:self.openWitdhConstraint];
    self.openWitdhConstraint = changedOpenWidthConstraint;
    [self addConstraint:self.openWitdhConstraint];

    [UIView animateWithDuration:1
                          delay:0
         usingSpringWithDamping:0.3
          initialSpringVelocity:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         [self layoutIfNeeded];
                     } completion:NULL];
}

- (IBAction)close:(id)sender
{
    self.topViewHeightConstraint.constant = 200;
    [self addConstraint:self.bottomViewRelateTopViewConstraint];
    NSLayoutConstraint * changedOpenWidthConstraint = [NSLayoutConstraint constraintWithItem:self.openWitdhConstraint.firstItem
                                                                                   attribute:self.openWitdhConstraint.firstAttribute
                                                                                   relatedBy:self.openWitdhConstraint.relation
                                                                                      toItem:self.openWitdhConstraint.secondItem
                                                                                   attribute:self.openWitdhConstraint.secondAttribute
                                                                                  multiplier:3.0/4
                                                                                    constant:self.openWitdhConstraint.constant];
    [self removeConstraint:self.openWitdhConstraint];
    self.openWitdhConstraint = changedOpenWidthConstraint;
    [self addConstraint:self.openWitdhConstraint];
    
    [UIView animateWithDuration:1
                          delay:0
         usingSpringWithDamping:0.3
          initialSpringVelocity:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         [self layoutIfNeeded];
                     } completion:NULL];
}

@end

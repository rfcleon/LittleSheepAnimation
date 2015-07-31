//
//  DSLFirstViewController.h
//  TransitionExample
//
//  Created by Pete Callaway on 21/07/2013.
//  Copyright (c) 2013 Dative Studios. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DSLThing;
@class DSLThingCell;


@interface DSLFirstViewController : UICollectionViewController

- (DSLThingCell*)collectionViewCellForThing:(DSLThing*)thing;

@end

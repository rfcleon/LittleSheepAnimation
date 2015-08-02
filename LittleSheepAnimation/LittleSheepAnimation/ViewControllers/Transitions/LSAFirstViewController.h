

#import <UIKit/UIKit.h>

@class LSAFirstVCCollectionCellModel;
@class LSAFirstVCCollectionCell;


@interface LSAFirstViewController : UICollectionViewController

- (LSAFirstVCCollectionCell*)collectionViewCellForThing:(LSAFirstVCCollectionCellModel*)thing;

@end

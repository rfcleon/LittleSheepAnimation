

#import <UIKit/UIKit.h>

@class LSAFirstVCCollectionCellModel;


@interface LSASecondViewController : UIViewController

@property (nonatomic, weak) IBOutlet UIImageView *imageView;

@property (nonatomic, strong) LSAFirstVCCollectionCellModel *thing;

@end

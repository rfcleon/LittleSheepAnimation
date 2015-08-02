

#import "LSAFirstViewController.h"

#import "LSAFirstToSecondTransition.h"
#import "LSAFirstVCCollectionCellModel.h"
#import "LSAFirstVCCollectionCell.h"
#import "LSASecondViewController.h"

@interface LSAFirstViewController ()<UINavigationControllerDelegate>

@property (nonatomic, strong) NSArray *things;

@end


@implementation LSAFirstViewController

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self != nil) {
        _things = [LSAFirstVCCollectionCellModel exampleThings];
        self.title = @"Things";
    }

    return self;
}


#pragma mark UIViewController methods

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    self.navigationController.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

    // Stop being the navigation controller's delegate
    if (self.navigationController.delegate == self) {
        self.navigationController.delegate = nil;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.destinationViewController isKindOfClass:[LSASecondViewController class]]) {
        // Get the selected item index path
        NSIndexPath *selectedIndexPath = [[self.collectionView indexPathsForSelectedItems] firstObject];

        // Set the thing on the view controller we're about to show
        if (selectedIndexPath != nil) {
            LSASecondViewController *secondViewController = segue.destinationViewController;
            secondViewController.thing = self.things[selectedIndexPath.row];
        }
    }
}

- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC
{
    if (fromVC == self && [toVC isKindOfClass:[LSASecondViewController class]]) {
        return [[LSAFirstToSecondTransition alloc] init];
    }
    return nil;
}

#pragma mark UICollectionViewControllerDataSource methods

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.things.count;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LSAFirstVCCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([LSAFirstVCCollectionCell class]) forIndexPath:indexPath];

    LSAFirstVCCollectionCellModel *thing = self.things[indexPath.row];
    cell.titleLabel.text = thing.title;
    cell.imageView.image = thing.image;

    return cell;
}


#pragma mark

- (LSAFirstVCCollectionCell*)collectionViewCellForThing:(LSAFirstVCCollectionCellModel*)thing {
    NSUInteger thingIndex = [self.things indexOfObject:thing];
    if (thingIndex == NSNotFound) {
        return nil;
    }

    return (LSAFirstVCCollectionCell*)[self.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:thingIndex inSection:0]];
}

@end

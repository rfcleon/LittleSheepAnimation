

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface LSAFirstVCCollectionCellModel : NSObject

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, copy, readonly) NSString *overview;

+ (NSArray*)exampleThings;

- (instancetype)initWithTitle:(NSString*)title image:(UIImage*)image overview:(NSString*)overview;

@end

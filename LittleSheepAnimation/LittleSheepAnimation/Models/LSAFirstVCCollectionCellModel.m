

#import "LSAFirstVCCollectionCellModel.h"


@implementation LSAFirstVCCollectionCellModel

- (instancetype)initWithTitle:(NSString*)title image:(UIImage*)image overview:(NSString*)overview {
    self = [super init];
    if (self != nil) {
        _title = [title copy];
        _image = image;
        _overview = [overview copy];
    }

    return self;
}

+ (NSArray*)exampleThings {
    return @[
             [[LSAFirstVCCollectionCellModel alloc] initWithTitle:@"Thing 1" image:[UIImage imageNamed:@"thing1.jpg"] overview:@"Drumstick cow beef fatback turkey boudin. Meatball leberkas boudin hamburger pork belly fatback."],
             [[LSAFirstVCCollectionCellModel alloc] initWithTitle:@"Thing 2" image:[UIImage imageNamed:@"thing2.jpg"] overview:@"Shank pastrami sirloin, sausage prosciutto spare ribs kielbasa tri-tip doner."],
             [[LSAFirstVCCollectionCellModel alloc] initWithTitle:@"Thing 3" image:[UIImage imageNamed:@"thing3.jpg"] overview:@"Frankfurter cow filet mignon short loin ham hock salami meatloaf biltong andouille bresaola prosciutto."],
             [[LSAFirstVCCollectionCellModel alloc] initWithTitle:@"Thing 4" image:[UIImage imageNamed:@"thing4.jpg"] overview:@"Pastrami sausage turkey shank shankle corned beef."],
             [[LSAFirstVCCollectionCellModel alloc] initWithTitle:@"Thing 5" image:[UIImage imageNamed:@"thing5.jpg"] overview:@"Tri-tip short loin pork belly, pastrami biltong ball tip ham hock. Shoulder ribeye turducken shankle."]
             ];
}

@end

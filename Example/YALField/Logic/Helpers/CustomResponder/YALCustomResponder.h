// For License please refer to LICENSE file in the root of YALField project

#import "YALResponder.h"

@interface YALCustomResponder : NSObject <YALResponder>

@property (nonatomic, copy) void (^actionBlock)(void);

@end

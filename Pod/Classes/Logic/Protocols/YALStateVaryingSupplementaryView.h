// For License please refer to LICENSE file in the root of YALField project

#import <Foundation/Foundation.h>

@protocol YALStateVaryingSupplementaryView <NSObject>

@required
@property (nonatomic, assign, readonly) NSInteger fieldState;

@required
- (void)setFieldState:(NSInteger)fieldState;

@end

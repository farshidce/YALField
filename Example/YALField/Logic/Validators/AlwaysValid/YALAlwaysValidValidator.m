// For License please refer to LICENSE file in the root of YALField project

#import "YALAlwaysValidValidator.h"

@implementation YALAlwaysValidValidator

#pragma mark - YALValidator

- (BOOL)isValid:(id<YALInput>)input error:(out NSError *__autoreleasing *)error {
    return YES;
}

@end

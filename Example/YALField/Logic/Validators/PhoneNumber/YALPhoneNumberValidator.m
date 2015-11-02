// For License please refer to LICENSE file in the root of YALField project

#import "YALPhoneNumberValidator.h"
#import "YALBaseValidator+YALPrivate.h"
#import "YALInput.h"

static const NSUInteger kPhoneNumberRequiredLength = 10;

@implementation YALPhoneNumberValidator

#pragma mark - YALValidator

- (BOOL)isValid:(id<YALInput>)input error:(out NSError *__autoreleasing *)error {
    NSString *phoneNumber = input.rawValue;
    BOOL valid = YES;
    
    if (phoneNumber.length < kPhoneNumberRequiredLength) {
        valid = NO;
        
        if (error != NULL) {
            *error = [self error];
        }
    }
    
    return valid;
}

@end

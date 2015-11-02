// For License please refer to LICENSE file in the root of YALField project

#import "YALCreditCardCvvValidator.h"
#import "YALBaseValidator+YALPrivate.h"
#import "YALInput.h"

static const NSUInteger kCvvCodeRequiredLength = 3;

@implementation YALCreditCardCvvValidator

#pragma mark - YALValidator

- (BOOL)isValid:(id<YALInput>)input error:(out NSError *__autoreleasing *)error {
    NSString *cvv = input.rawValue;
    BOOL valid = YES;
    
    if (cvv.length != kCvvCodeRequiredLength) {
        valid = NO;
        
        if (error != NULL) {
            *error = [self error];
        }
    }
    
    return valid;
}

@end

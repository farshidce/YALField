// For License please refer to LICENSE file in the root of YALField project

#import "YALRegexValidator.h"
#import "YALBaseValidator+YALPrivate.h"
#import "YALInput.h"

static NSString *const kPredicateFormat = @"SELF MATCHES %@";

@implementation YALRegexValidator

#pragma mark - YALValidator

- (BOOL)isValid:(id<YALInput>)input error:(out NSError *__autoreleasing *)error {
    NSString *string = input.rawValue;
    BOOL valid = [[NSPredicate predicateWithFormat:kPredicateFormat, self.regex] evaluateWithObject:string];
    
    if (!valid && error != NULL) {
        *error = [self error];
    }
    
    return valid;
}

@end

// For License please refer to LICENSE file in the root of YALField project

#import "YALDateNonEmptyValidator.h"
#import "YALBaseValidator+YALPrivate.h"
#import "YALInput.h"

@implementation YALDateNonEmptyValidator

#pragma mark - YALValidator

- (BOOL)isValid:(id<YALInput>)input error:(out NSError *__autoreleasing *)error {
    NSString *string = input.formattedValue;
    BOOL valid = (string.length > 0);
    
    if (!valid && error != NULL) {
        *error = [self error];
    }
    
    return valid;
}


@end

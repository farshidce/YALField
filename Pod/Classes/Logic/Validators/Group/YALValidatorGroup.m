// For License please refer to LICENSE file in the root of YALField project

#import "YALValidatorGroup.h"
#import "YALBaseValidator+YALPrivate.h"

@interface YALValidatorGroup ()

@property (nonatomic, strong) IBOutletCollection(id) NSArray *validators;

@end

@implementation YALValidatorGroup

#pragma mark - YALValidator

- (BOOL)isValid:(id<YALInput>)input error:(out NSError *__autoreleasing *)error {
    BOOL valid = YES;
    BOOL innerValid;
    NSError *innerError;
    
    for (id<YALValidator> validator in self.validators) {
        valid &= innerValid = [validator isValid:input error:&innerError];
        
        if (!valid && // check for validity
            innerError && // check for innerError to be not nil
            *error == nil && // check for error to be not nil
            error != NULL) // check to avoid memory leak
        {
            *error = innerError;
            break;
        }
    }
    
    return valid;
}

@end

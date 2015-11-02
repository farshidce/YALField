// For License please refer to LICENSE file in the root of YALField project

#import "YALPasswordValidator.h"
#import "YALBaseValidator+YALPrivate.h"
#import "YALInput.h"

@implementation YALPasswordValidator

#pragma mark - init

- (instancetype)init {
    if (self = [super init]) {
        self.passwordMinimumLength = 6;;
    }
    return self;
}

#pragma mark - YALValidator

- (BOOL)isValid:(id<YALInput>)input error:(out NSError *__autoreleasing *)error {
    NSString *password = input.rawValue;
    BOOL valid = YES;
    
    if (password.length < self.passwordMinimumLength) {
        valid = NO;
        
        if (error != NULL) {
            *error = [self error];
        }
    }
    
    return valid;
}

@end

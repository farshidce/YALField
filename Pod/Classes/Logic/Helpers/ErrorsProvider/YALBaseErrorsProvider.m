// For License please refer to LICENSE file in the root of YALField project

#import "YALBaseErrorsProvider.h"
#import "YALValidator.h"
#import "YALNonEmptyValidator.h"

static NSString *const kYALFieldErrorDomain = @"com.yalfield.YALField";

@implementation YALBaseErrorsProvider

#pragma mark - YALErrorsProvider

+ (NSError *)errorForValidator:(id<YALValidator>)validator {
    return [[self errors] valueForKey:NSStringFromClass(validator.class)];
}

#pragma mark - Errors

+ (NSDictionary<NSString *, NSError *> *)errors {
    return @{NSStringFromClass([YALNonEmptyValidator class]): [self yal_errorWithDescription:@"All fields must be filled"]};
}

#pragma mark - Helper method

+ (NSError *)yal_errorWithDescription:(NSString *)description {
    return [NSError errorWithDomain:kYALFieldErrorDomain code:0 userInfo:@{NSLocalizedDescriptionKey: description}];
}

@end

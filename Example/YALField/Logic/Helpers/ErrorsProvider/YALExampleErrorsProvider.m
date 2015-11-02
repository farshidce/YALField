// For License please refer to LICENSE file in the root of YALField project

#import "YALExampleErrorsProvider.h"
#import "YALBaseErrorsProvider+YALPrivate.h"
#import "YALEmailValidator.h"
#import "YALPasswordValidator.h"
#import "YALPhoneNumberValidator.h"
#import "YALCreditCardCvvValidator.h"
#import "YALDateNonEmptyValidator.h"

@implementation YALExampleErrorsProvider

+ (NSDictionary<NSString *, NSError *> *)errors {
    NSMutableDictionary<NSString *, NSError *> *errors = [[super errors] mutableCopy];
    
    [errors addEntriesFromDictionary:@{NSStringFromClass([YALEmailValidator class]): [self yal_errorWithDescription:@"Email contains inappropriate symbols"],
                                       NSStringFromClass([YALPasswordValidator class]): [self yal_errorWithDescription:@"Password should be at least 6 characters"],
                                       NSStringFromClass([YALPhoneNumberValidator class]): [self yal_errorWithDescription:@"Phone number should contain 10 characters"],
                                       NSStringFromClass([YALCreditCardCvvValidator class]): [self yal_errorWithDescription:@"CVV should contain 3 digits"],
                                       NSStringFromClass([YALDateNonEmptyValidator class]): [self yal_errorWithDescription:@"All fields must be filled"]}];
    
    return [NSDictionary dictionaryWithDictionary:errors];
}

@end

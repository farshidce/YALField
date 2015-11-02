// For License please refer to LICENSE file in the root of YALField project

#import "YALValidator.h"

@protocol YALErrorsProvider;

@interface YALBaseValidator : NSObject <YALValidator>

@property (nonatomic, assign) IBInspectable BOOL shouldReturnError;
@property (nonatomic, strong) IBInspectable NSString *errorsProviderClassName;

@end

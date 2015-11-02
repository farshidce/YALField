// For License please refer to LICENSE file in the root of YALField project

#import <Foundation/Foundation.h>

@protocol YALInput;
@protocol YALForm;

@protocol YALFormController <NSObject>

@required
+ (BOOL)isFormValid:(id<YALForm>)form error:(NSError **)error;

@required
+ (void)selectNextResponderInForm:(id<YALForm>)form afterInput:(id<YALInput>)input;

@end

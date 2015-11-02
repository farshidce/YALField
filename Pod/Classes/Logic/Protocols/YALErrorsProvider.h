// For License please refer to LICENSE file in the root of YALField project

#import <Foundation/Foundation.h>

@protocol YALValidator;

@protocol YALErrorsProvider <NSObject>

@required
+ (NSError *)errorForValidator:(id<YALValidator>)validator;

@end

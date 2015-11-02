// For License please refer to LICENSE file in the root of YALField project

#import <Foundation/Foundation.h>

@protocol YALInput;

@protocol YALValidator <NSObject>

@required
- (BOOL)isValid:(id<YALInput>)input error:(out NSError **)error;

@end

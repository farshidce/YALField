// For License please refer to LICENSE file in the root of YALField project

#import <Foundation/Foundation.h>

@class UIView;
@protocol YALInput;

@protocol YALDataFlowController <NSObject>

@required
+ (NSString *)formattedValueFromRawValue:(NSString *)rawValue forInput:(id<YALInput>)input;
+ (NSString *)rawValueFromFormattedValue:(NSString *)formattedValue forInput:(id<YALInput>)input;

@required
+ (void)inputDidBegin:(id<YALInput>)input;
+ (void)inputDidEnd:(id<YALInput>)input;
+ (void)inputDidReceiveTouchEvent:(id<YALInput>)input;
+ (BOOL)input:(id<YALInput>)input shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString **)string;

@end

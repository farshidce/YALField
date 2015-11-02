// For License please refer to LICENSE file in the root of YALField project

#import <Foundation/Foundation.h>

@protocol YALInput;

@class UIButton;

@protocol YALForm <NSObject>

@required
- (BOOL)shouldUpdateFieldsStates;

@required
- (id<YALInput>)activeInput;
- (UIButton *)finishButton;

@required
- (NSArray *)inputs;

@required
- (void)clear;

@end

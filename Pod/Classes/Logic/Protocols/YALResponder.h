// For License please refer to LICENSE file in the root of YALField project

#import <Foundation/Foundation.h>

@protocol YALResponder <NSObject>

@optional
- (BOOL)becomeFirstResponder;
- (BOOL)resignFirstResponder;
- (BOOL)isFirstResponder;
- (void)performAction:(id)sender;

@end

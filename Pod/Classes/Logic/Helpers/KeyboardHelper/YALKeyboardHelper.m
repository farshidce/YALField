// For License please refer to LICENSE file in the root of YALField project

#import <UIKit/UIKit.h>
#import "YALKeyboardHelper.h"

@implementation YALKeyboardHelper

+ (void)hideKeyboard {
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder)
                                               to:nil
                                             from:nil
                                         forEvent:nil];
}

@end

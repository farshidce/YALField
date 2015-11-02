// For License please refer to LICENSE file in the root of YALField project

#import "YALBaseDataFlowController.h"
#import "YALField+YALPrivate.h"
#import "YALFormatter.h"
#import "YALValidator.h"
#import "YALResponder.h"
#import "YALBaseFormController.h"
#import "YALFormController.h"
#import "YALKeyboardHelper.h"

@implementation YALBaseDataFlowController

#pragma mark - Input events

+ (void)inputDidBegin:(id<YALInput>)input {
    [input setFieldState:YALFieldStateClear];
}

+ (void)inputDidEnd:(id<YALInput>)input {
    if ([input validator]) {
        NSError *error;
        BOOL valid = [[input validator] isValid:input error:&error];
        
        if ([input conformsToProtocol:@protocol(YALFieldInput)]) {
            [input setFieldState:(valid) ? YALFieldStateValid : YALFieldStateInvalid];
        }
    }
    
    if ([input conformsToProtocol:@protocol(YALFieldInput)] &&
        [(UIControl<YALFieldInput> *)input inputEnabled] &&
        [[(UIControl<YALFieldInput> *)input textField] isFirstResponder])
    {
        [YALBaseFormController selectNextResponderInForm:[(UIControl<YALFieldInput> *)input form] afterInput:input];
    }
}

+ (void)inputDidReceiveTouchEvent:(id<YALInput>)input {
    if ([[input responder] respondsToSelector:@selector(becomeFirstResponder)]) {
        [[input responder] becomeFirstResponder];
    } else if ([[input responder] respondsToSelector:@selector(performAction:)]) {
        [[input responder] performAction:nil];
    } else if ([input inputEnabled] && [input conformsToProtocol:@protocol(YALFieldInput)]) {
        [[(UIControl<YALFieldInput> *)input textField] becomeFirstResponder];
    } else {
        [YALKeyboardHelper hideKeyboard];
    }
}

+ (BOOL)input:(UIControl<YALFieldInput> *)input shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString **)string {
    BOOL should = YES;
    
    id<YALFormatter> inputFormatter = [input formatter];
    if (inputFormatter) {
        should = [inputFormatter textField:input.textField shouldChangeCharactersInRange:range replacementString:string];
        
        // check if formatting is required after each data change action
        BOOL shouldFormatOnChange = NO;
        if ([inputFormatter respondsToSelector:@selector(shouldFormatValueOnChange)]) {
            shouldFormatOnChange = [inputFormatter shouldFormatValueOnChange];
        }
        if (should && shouldFormatOnChange) {
            // set new value directly to force formatting
            NSString *newString = [input.textField.text stringByReplacingCharactersInRange:range withString:*string];
            input.rawValue = newString;
            should = NO;
        }
    }
    
    return should;
}

#pragma mark - Formatting

+ (NSString *)rawValueFromFormattedValue:(NSString *)formattedValue forInput:(id<YALInput>)input {
    return ([input formatter]) ? [[input formatter] rawValueFromFormattedValue:formattedValue] : formattedValue;
}

+ (NSString *)formattedValueFromRawValue:(NSString *)rawValue forInput:(id<YALInput>)input {
    return ([input formatter]) ? [[input formatter] formattedValueFromRawValue:rawValue] : rawValue;
}

@end

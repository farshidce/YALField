// For License please refer to LICENSE file in the root of YALField project

#import "YALBaseFormController.h"
#import "YALField+YALPrivate.h"
#import "YALValidator.h"
#import "YALForm.h"

@implementation YALBaseFormController

#pragma mark - YALFormController

+ (BOOL)isFormValid:(id<YALForm>)form error:(NSError **)error {
    BOOL valid = YES;
    NSError *innerError;
    BOOL innerValid;

    for (UIControl<YALInput> *input in [form inputs]) {
        id<YALValidator> validator = [input validator];
        
        if (input.enabled && validator) {
            valid &= innerValid = [validator isValid:input error:&innerError];
            
            if ([form shouldUpdateFieldsStates] && [input conformsToProtocol:@protocol(YALFieldInput)]) {
                [input setFieldState:(valid) ? YALFieldStateValid : YALFieldStateInvalid];
            }
            
            if (!valid && // check for validity
                innerError && // check for innerError to be not nil
                *error == nil && // check for error to be not nil
                error != NULL) // check to avoid memory leak
            {
                *error = innerError;
                break;
            }
        }
    }
    
    return valid;
}

+ (void)selectNextResponderInForm:(id<YALForm>)form afterInput:(id<YALInput>)input {
    NSUInteger index = [[form inputs] indexOfObject:input];
    
    if (index < ([form inputs].count - 1)) {
        [self selectNextInputFromIndex:index inForm:form];
    } else if (index == ([form inputs].count - 1)) {
        [self finishOnInput:input inForm:form];
    }
}

#pragma mark - Private

+ (void)selectNextInputFromIndex:(NSUInteger)index inForm:(id<YALForm>)form {
    id<YALInput> nextInput = [form inputs][index + 1];
    
    if ([nextInput inputEnabled] || ![nextInput responder]) {
        [nextInput becomeFirstResponder];
    }
}

+ (void)finishOnInput:(id<YALInput>)input inForm:(id<YALForm>)form {
    [input resignFirstResponder];
    
    if ([form finishButton]) {
        [[form finishButton] sendActionsForControlEvents:UIControlEventTouchUpInside];
    }
}

@end

// For License please refer to LICENSE file in the root of YALField project

#import "YALLengthLimitingFormatter.h"
#import <UIKit/UIKit.h>

@implementation YALLengthLimitingFormatter

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *__autoreleasing *)string {
    return !( // inverting
             [*string length] && // check if symbol is not backspace
             self.maximalLength && // check if required text length is set
             (textField.text.length == self.maximalLength)); // check if required text length is reached
}

- (NSString *)formattedValueFromRawValue:(NSString *)rawValue {
    return rawValue;
}

- (NSString *)rawValueFromFormattedValue:(NSString *)formattedValue {
    return formattedValue;
}

@end

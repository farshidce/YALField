// For License please refer to LICENSE file in the root of YALField project

#import "YALPhoneNumberFormatter.h"

@implementation YALPhoneNumberFormatter

#pragma mark - YALFormatter

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *__autoreleasing *)string {
    NSUInteger length = [self getLength:textField.text];
    
    if (length == 10) {
        if (range.length == 0) {
            return NO;
        }
    }
    
    if (length == 3) {
        NSString *num = [self formatNumber:textField.text];
        
        textField.text = [NSString stringWithFormat:@"(%@) ",num];
        
        if (range.length > 0) {
            textField.text = [NSString stringWithFormat:@"%@",[num substringToIndex:3]];
        }
    } else if (length == 6) {
        NSString *num = [self formatNumber:textField.text];

        textField.text = [NSString stringWithFormat:@"(%@) %@-",[num  substringToIndex:3],[num substringFromIndex:3]];
        
        if (range.length > 0) {
            textField.text = [NSString stringWithFormat:@"(%@) %@",[num substringToIndex:3],[num substringFromIndex:3]];
        }
    }
    
    return YES;
}

- (NSString *)formattedValueFromRawValue:(NSString *)rawValue {
    NSString *firstPart = [rawValue substringWithRange:NSMakeRange(0, 3)];
    NSString *secondPart = [rawValue substringWithRange:NSMakeRange(3, 3)];
    NSString *thirdPart = [rawValue substringWithRange:NSMakeRange(6, 3)];
    
    return [NSString stringWithFormat:@"(%@)-%@-%@", firstPart, secondPart, thirdPart];
}

- (id)rawValueFromFormattedValue:(NSString *)formattedValue {
    return [self formatNumber:formattedValue];
}

#pragma mark - Helper methods

- (NSString *)formatNumber:(NSString *)mobileNumber {
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"(" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@")" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@" " withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"-" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"+" withString:@""];
    
    NSUInteger length = [mobileNumber length];
    
    if (length > 10) {
        mobileNumber = [mobileNumber substringFromIndex:length - 10];
    }
    return mobileNumber;
}


- (NSUInteger)getLength:(NSString *)mobileNumber {
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"(" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@")" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@" " withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"-" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"+" withString:@""];
    
    NSUInteger length = [mobileNumber length];
    return length;
}

@end

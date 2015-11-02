// For License please refer to LICENSE file in the root of YALField project

#import "YALCreditCardNumberFormatter.h"
#import <UIKit/UIKit.h>

static const NSInteger kCreditCardNumberLength = 19;

@implementation YALCreditCardNumberFormatter

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *__autoreleasing *)string {
    NSString *potentialResultString = [[textField text] stringByReplacingCharactersInRange:range withString:*string];
    return ([[self rawValueFromFormattedValue:potentialResultString] length] <= kCreditCardNumberLength);
}

- (NSString *)formattedValueFromRawValue:(NSString *)rawValue {
    rawValue = [rawValue stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSMutableString *formattedValue = [NSMutableString new];
    for (NSUInteger i = 0; i < [rawValue length]; i++) {
        if (i > 0 && i % 4 == 0) {
            [formattedValue appendString:@" "];
        }
        unichar c = [rawValue characterAtIndex:i];
        [formattedValue appendString:[[NSString alloc] initWithCharacters:&c length:1]];
    }
    return formattedValue;
}

- (NSString *)rawValueFromFormattedValue:(NSString *)formattedValue {
    return [formattedValue stringByReplacingOccurrencesOfString:@" " withString:@""];
}

- (BOOL)shouldFormatValueOnChange {
    return YES;
}

@end

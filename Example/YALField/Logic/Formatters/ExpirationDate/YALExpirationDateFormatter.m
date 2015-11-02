// For License please refer to LICENSE file in the root of YALField project

#import "YALExpirationDateFormatter.h"

@implementation YALExpirationDateFormatter

#pragma mark - YALFormatter

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *__autoreleasing *)string {
    return NO;
}

- (NSDate *)rawValueFromFormattedValue:(NSString *)formattedValue {
    return [[self.class dateFormatter] dateFromString:formattedValue];
}

- (NSString *)formattedValueFromRawValue:(NSDate *)rawValue {
    return [[self.class dateFormatter] stringFromDate:rawValue];
}

#pragma mark - Helper

+ (NSDateFormatter *)dateFormatter {
    static NSDateFormatter *formatter;
    
    if (!formatter) {
        formatter = [NSDateFormatter new];
        [formatter setDateFormat:@"dd/MM yyyy"];
    }
    
    return formatter;
}


@end

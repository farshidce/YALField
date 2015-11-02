// For License please refer to LICENSE file in the root of YALField project

#import <Foundation/Foundation.h>

@class UITextField;

@protocol YALFormatter <NSObject>

@required
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString **)string;
- (NSString *)formattedValueFromRawValue:(id)rawValue;
- (id)rawValueFromFormattedValue:(NSString *)formattedValue;

@optional
- (BOOL)shouldFormatValueOnChange;

@end

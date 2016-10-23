// For License please refer to LICENSE file in the root of YALField project

#import "YALInputConfigurator.h"

@interface YALFieldConfigurator : NSObject <YALInputConfigurator>

@property (nonatomic, assign) IBInspectable CGFloat leftInset;
@property (nonatomic, assign) IBInspectable CGFloat textFieldLeftInset;
@property (nonatomic, assign) IBInspectable CGFloat textFieldRightInset;
@property (nonatomic, assign) IBInspectable CGFloat rightInset;

@property (nonatomic, assign) IBInspectable CGFloat textFieldHeight;
@property (nonatomic, assign) IBInspectable CGSize titleViewSize;
@property (nonatomic, assign) IBInspectable CGSize supplementaryViewSize;

@property (nonatomic, strong) IBInspectable NSString *titleViewFontName;
@property (nonatomic, assign) IBInspectable CGFloat titleViewFontSize;
@property (nonatomic, strong) IBInspectable NSString *titleViewText;

@property (nonatomic, strong) IBInspectable NSString *textFieldFontName;
@property (nonatomic, assign) IBInspectable CGFloat textFieldFontSize;
@property (nonatomic, strong) IBInspectable NSString *textFieldText;

@property (nonatomic, assign) IBInspectable NSInteger keyboardType; // UIKeyboardType
@property (nonatomic, assign) IBInspectable NSInteger returnKeyType; // UIReturnKeyType
@property (nonatomic, assign) IBInspectable NSInteger autocapitalizationType; // UITextAutocapitalizationType
@property (nonatomic, assign) IBInspectable NSInteger autoCorrectionType; // UITextAutocorrectionType
@property (nonatomic, assign) IBInspectable NSInteger alignment; // UITextAlignment

@property (nonatomic, copy) IBInspectable UIColor *titleColor;
@property (nonatomic, copy) IBInspectable UIColor *textColor;
@property (nonatomic, copy) IBInspectable UIColor *placeholderColor;
@property (nonatomic, copy) IBInspectable UIColor *disabledTextColor;
@property (nonatomic, copy) IBInspectable UIColor *validTextColor;
@property (nonatomic, copy) IBInspectable UIColor *invalidTextColor;

- (void)configureView:(UIView<YALInput> *)field;
- (void)configureView:(UIView<YALInput> *)field forFieldState:(NSInteger)fieldState;
- (void)resetView:(UIView<YALInput> *)field;

@end

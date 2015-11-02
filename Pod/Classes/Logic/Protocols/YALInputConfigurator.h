// For License please refer to LICENSE file in the root of YALField project

#import <UIKit/UIKit.h>

@protocol YALInput;

@protocol YALInputConfigurator <NSObject>

@required
@property (nonatomic, assign) CGFloat leftInset;
@property (nonatomic, assign) CGFloat textFieldLeftInset;
@property (nonatomic, assign) CGFloat textFieldRightInset;
@property (nonatomic, assign) CGFloat rightInset;

@property (nonatomic, assign) CGFloat textFieldHeight;
@property (nonatomic, assign) CGSize titleViewSize;
@property (nonatomic, assign) CGSize supplementaryViewSize;

@property (nonatomic, strong) NSString *titleViewFontName;
@property (nonatomic, assign) CGFloat titleViewFontSize;
@property (nonatomic, strong) NSString *titleViewText;

@property (nonatomic, strong) NSString *textFieldFontName;
@property (nonatomic, assign) CGFloat textFieldFontSize;
@property (nonatomic, strong) NSString *textFieldText;

@property (nonatomic, assign) NSInteger keyboardType; // UIKeyboardType
@property (nonatomic, assign) NSInteger returnKeyType; // UIReturnKeyType
@property (nonatomic, assign) NSInteger autocapitalizationType; // UITextAutocapitalizationType
@property (nonatomic, assign) NSInteger alignment; // UITextAlignment

@property (nonatomic, copy) UIColor *titleColor;
@property (nonatomic, copy) UIColor *textColor;
@property (nonatomic, copy) UIColor *placeholderColor;
@property (nonatomic, copy) UIColor *disabledTextColor;
@property (nonatomic, copy) UIColor *validTextColor;
@property (nonatomic, copy) UIColor *invalidTextColor;

@required
- (void)configureView:(UIView<YALInput> *)view;
- (void)resetView:(UIView<YALInput> *)view;

@optional
- (void)configureView:(UIView<YALInput> *)view forFieldState:(NSInteger)fieldState;

@end

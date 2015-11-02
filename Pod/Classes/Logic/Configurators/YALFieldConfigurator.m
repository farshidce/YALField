// For License please refer to LICENSE file in the root of YALField project

#import "YALFieldConfigurator.h"
#import "YALField+YALPrivate.h"
#import "UIColor+YALFieldColors.h"

const struct YALFieldConfiguratorDefaultValues {
    CGFloat leftInset;
    CGFloat textFieldLeftInset;
    CGFloat textFieldRightInset;
    CGFloat rightInset;
    CGFloat textFieldHeight;
    CGSize titleViewSize;
    CGSize supplementaryViewSize;
    __unsafe_unretained NSString *titleViewFontName;
    CGFloat titleViewFontSize;
    __unsafe_unretained NSString *titleViewText;
    __unsafe_unretained NSString *textFieldFontName;
    CGFloat textFieldFontSize;
    __unsafe_unretained NSString *textFieldText;
    UIKeyboardType keyboardType;
    UIReturnKeyType returnKeyType;
    UITextAutocapitalizationType autocapitalizationType;
} YALFieldConfiguratorDefaultValues;

const struct YALFieldConfiguratorDefaultValues YALFieldConfiguratorDefaultValues = {
    .leftInset = 16.f,
    .textFieldLeftInset = 16.f,
    .textFieldRightInset = 16.f,
    .rightInset = 16.f,
    .textFieldHeight = 30.f,
    .titleViewSize = (CGSize) {80.f, 30.f},
    .supplementaryViewSize = (CGSize) {30.f, 30.f},
    .titleViewFontName = @"HelveticaNeue-Medium",
    .titleViewFontSize = 17.f,
    .titleViewText = @"Title",
    .textFieldFontName = @"HelveticaNeue-Medium",
    .textFieldFontSize = 17.f,
    .textFieldText = @"Lorem ipsum dolor sit amet",
    .keyboardType = UIKeyboardTypeDefault,
    .returnKeyType = UIReturnKeyDefault,
    .autocapitalizationType = UITextAutocapitalizationTypeNone
};

@interface YALFieldConfigurator ()

@property (nonatomic, weak) UIView<YALFieldInput> *field;

@end

@implementation YALFieldConfigurator

#pragma mar - init

- (instancetype)init {
    if (self = [super init]) {
        [self defaultSetup];
    }
    return self;
}

#pragma mark - Default setup

- (void)defaultSetup {
    self.leftInset = YALFieldConfiguratorDefaultValues.leftInset;
    self.textFieldLeftInset = YALFieldConfiguratorDefaultValues.textFieldLeftInset;
    self.textFieldRightInset = YALFieldConfiguratorDefaultValues.textFieldRightInset;
    self.rightInset = YALFieldConfiguratorDefaultValues.rightInset;
    self.textFieldHeight = YALFieldConfiguratorDefaultValues.textFieldHeight;
    self.titleViewSize = YALFieldConfiguratorDefaultValues.titleViewSize;
    self.supplementaryViewSize = YALFieldConfiguratorDefaultValues.supplementaryViewSize;
    self.titleViewFontName = YALFieldConfiguratorDefaultValues.titleViewFontName;
    self.titleViewFontSize = YALFieldConfiguratorDefaultValues.titleViewFontSize;
    self.titleViewText = YALFieldConfiguratorDefaultValues.titleViewText;
    self.textFieldFontName = YALFieldConfiguratorDefaultValues.textFieldFontName;
    self.textFieldFontSize = YALFieldConfiguratorDefaultValues.textFieldFontSize;
    self.textFieldText = YALFieldConfiguratorDefaultValues.textFieldText;
    self.keyboardType = YALFieldConfiguratorDefaultValues.keyboardType;
    self.returnKeyType = YALFieldConfiguratorDefaultValues.returnKeyType;
    self.autocapitalizationType = YALFieldConfiguratorDefaultValues.autocapitalizationType;
    self.titleColor = [UIColor yal_fieldInputTitleTextColor];
    self.textColor = [UIColor yal_fieldInputTextColor];
    self.placeholderColor = [UIColor yal_fieldinputPlaceholderTextColor];
    self.disabledTextColor = [UIColor yal_fieldInputTitleTextColor];
    self.validTextColor = [UIColor yal_fieldValidInputTextColor];
    self.invalidTextColor = [UIColor yal_fieldInvalidInputTextColor];
}

#pragma mark - YALInputConfigurator

- (void)configureView:(UIView<YALFieldInput> *)field {
    self.field = field;
    
    if (!self.field.titleView.text) {
        self.field.titleView.text = self.titleViewText;
    }
    
    if (!self.field.textField.text) {
        self.field.textField.text = self.textFieldText;
    }
    
    [self configureTextViews];
}

- (void)resetView:(UIView<YALFieldInput> *)field {
    self.field = nil;
}

- (void)configureView:(UIView<YALFieldInput> *)field forFieldState:(NSInteger)fieldState {
    switch ((YALFieldState)fieldState) {
        case YALFieldStateClear: {
            field.textField.textColor = (self.field.enabled) ? self.textColor : self.disabledTextColor;
            field.supplementaryView.hidden = (field.passwordSupplementaryView != nil);
            field.passwordSupplementaryView.hidden = NO;
            break;
        }
        case YALFieldStateValid: {
            field.textField.textColor = self.validTextColor;
            field.supplementaryView.hidden = NO;
            field.passwordSupplementaryView.hidden = YES;
            break;
        }
        case YALFieldStateInvalid: {
            field.textField.textColor = self.invalidTextColor;
            field.supplementaryView.hidden = NO;
            field.passwordSupplementaryView.hidden = YES;
            break;
        }
    }
}

#pragma mark - Text settigns

- (void)configureTextViews {
    self.field.textField.font = [UIFont fontWithName:self.textFieldFontName size:self.textFieldFontSize];
    self.field.textField.textColor = (self.field.enabled) ? self.textColor : self.disabledTextColor;
    self.field.textField.autocapitalizationType = self.autocapitalizationType;
    self.field.textField.keyboardType = self.keyboardType;
    self.field.textField.returnKeyType = self.returnKeyType;
    self.field.textField.textAlignment = self.alignment;
    self.field.titleView.font = [UIFont fontWithName:self.titleViewFontName size:self.titleViewFontSize];
    self.field.titleView.textColor = self.titleColor;
}

@end

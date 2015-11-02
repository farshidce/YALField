// For License please refer to LICENSE file in the root of YALField project

#import "YALOrderConfigurator.h"
#import "UIColor+YALExampleColors.h"
#import "YALOrderField.h"
#import "YALOrderField+YALPrivate.h"
#import "UIColor+YALExampleColors.h"

@implementation YALOrderConfigurator

#pragma mark - init

- (instancetype)init {
    if (self = [super init]) {
        [self setup];
    }
    return self;
}

#pragma mark - Setup

- (void)setup {
    self.iconSize = (CGSize) {34.f, 34.f};
    self.leftInset = 72.f;
    self.iconInsetToTitle = 10.f;
    self.titleBackgroundHeight = 57.f;
    self.titleBackgroundLeftInset = 8.f;
    self.textFieldRightInset = 0.f;
    self.rightInset = 30.f;
    self.supplementaryViewSize = (CGSize) {0.f, 0.f};
    self.titleColor = [UIColor yal_orderFieldTitleColor];
    self.textColor = [UIColor yal_orderFieldTextColor];
    self.placeholderColor = [UIColor yal_orderFieldPlaceholderColor];
    self.validTextColor = [UIColor yal_orderFieldValidColor];
    self.invalidTextColor = [UIColor yal_orderFieldInvalidColor];
    self.titleViewFontName = @"HelveticaNeue-Light";
    self.textFieldFontName = @"HelveticaNeue-Medium";
    self.titleViewFontSize = 18.f;
    self.textFieldFontSize = 18.f;
    
    self.alignment = 2;
}

- (void)configureView:(YALOrderField *)field {
    [super configureView:field];
    field.titleBackgroundView.backgroundColor = [UIColor yal_orderFieldTitleBackgroundColor];
}

@end

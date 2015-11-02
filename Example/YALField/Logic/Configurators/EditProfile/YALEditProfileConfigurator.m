// For License please refer to LICENSE file in the root of YALField project

#import "YALEditProfileConfigurator.h"
#import "UIColor+YALExampleColors.h"

@implementation YALEditProfileConfigurator

#pragma mark - init

- (instancetype)init {
    if (self = [super init]) {
        [self setup];
    }
    return self;
}

#pragma mark - Setup

- (void)setup {
    self.titleViewFontName = @"AvenirNext-Bold";
    self.textFieldFontName = @"AvenirNext-Medium";
    self.titleColor = [UIColor yal_editProfileFieldTitleColor];
    self.textColor = [UIColor yal_editProfileFieldTextColor];
    self.validTextColor = self.textColor;
    self.invalidTextColor = self.titleColor;
    self.placeholderColor = [UIColor yal_editProfileFieldPlaceholderColor];
    self.titleViewSize = (CGSize) {90.f, 30.f};
    self.textFieldLeftInset = 8.f;
    self.leftInset = 25.f;
    self.rightInset = 25.f;
}

@end

// For License please refer to LICENSE file in the root of YALField project

#import "YALRegistrationConfigurator.h"
#import "UIColor+YALExampleColors.h"

@implementation YALRegistrationConfigurator

#pragma mark - init

- (instancetype)init {
    if (self = [super init]) {
        [self setup];
    }
    return self;
}

#pragma mark - Setup

- (void)setup {
    self.textColor = [UIColor yal_registrationFieldTextColor];    
    self.placeholderColor = [UIColor yal_registrationFieldPlaceholderColor];
    self.validTextColor = self.textColor;
    self.textFieldLeftInset = 0.f;
    self.titleViewSize = CGSizeZero;
}

@end

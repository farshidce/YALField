// For License please refer to LICENSE file in the root of YALField project

#import "YALPaymentConfigurator.h"
#import "UIColor+YALExampleColors.h"

@implementation YALPaymentConfigurator

#pragma mark - init

- (instancetype)init {
    if (self = [super init]) {
        [self setup];
    }
    return self;
}

#pragma mark - Setup

- (void)setup {
    self.titleViewSize = (CGSize) {120.f, 30.f};
    self.titleColor = [UIColor yal_paymentFieldTitleColor];
    self.textColor = [UIColor yal_paymentFieldTextColor];
    self.placeholderColor = [UIColor yal_paymentFieldPlaceholderColor];
    self.leftInset = 8.f;
    self.rightInset = 8.f;
    self.textFieldLeftInset = 4.f;
    self.textFieldRightInset = 4.f;
}

@end

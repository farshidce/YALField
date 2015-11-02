// For License please refer to LICENSE file in the root of YALField project

#import "UIColor+YALExampleColors.h"
#import "UIColor+YALFieldColors.h"

@implementation UIColor (YALExampleColors)

+ (instancetype)yal_editProfileFieldTitleColor {
    return [self yal_fieldColorWithRed:255.f green:102.f blue:204.f alpha:1.f];
}

+ (instancetype)yal_editProfileFieldTextColor {
    return [self yal_fieldColorWithRed:102.f green:204.f blue:204.f alpha:1.f];
}

+ (instancetype)yal_editProfileFieldPlaceholderColor {
    return [self yal_fieldColorWithRed:255.f green:153.f blue:153.f alpha:0.8f];
}

+ (instancetype)yal_orderFieldTitleColor {
    return [self whiteColor];
}

+ (instancetype)yal_orderFieldTextColor {
    return [self yal_fieldColorWithRed:70.f green:61.f blue:95.f alpha:1.f];
}

+ (instancetype)yal_orderFieldPlaceholderColor {
    return [self yal_fieldColorWithRed:70.f green:61.f blue:95.f alpha:0.6f];
}

+ (instancetype)yal_orderFieldValidColor {
    return [self yal_orderFieldTextColor];
}

+ (instancetype)yal_orderFieldInvalidColor {
    return [self yal_orderFieldTextColor];
}

+ (instancetype)yal_orderFieldTitleBackgroundColor {
    return [self yal_fieldColorWithRed:70.f green:61.f blue:95.f alpha:0.84f];
}

+ (instancetype)yal_orderStepperNormalColor {
    return [self yal_orderFieldTextColor];
}

+ (instancetype)yal_orderStepperHighlightedColor {
    return [self yal_orderFieldPlaceholderColor];
}

+ (instancetype)yal_registrationFieldTextColor {
    return [self yal_fieldColorWithRed:104.f green:208.f blue:255.f alpha:1.f];
}

+ (instancetype)yal_registrationFieldPlaceholderColor {
    return [self yal_fieldColorWithRed:175.f green:232.f blue:255.f alpha:1.f];
}

+ (instancetype)yal_paymentFieldTitleColor {
    return [self yal_fieldColorWithRed:204.f green:153.f blue:255.f alpha:1.f];
}

+ (instancetype)yal_paymentFieldTextColor {
    return [self yal_fieldColorWithRed:0.f green:153.f blue:255.f alpha:1.f];
}

+ (instancetype)yal_paymentFieldPlaceholderColor {
    return [self yal_fieldColorWithRed:153.f green:204.f blue:204.f alpha:1.f];
}

+ (instancetype)yal_halloweenSupplementaryViewClearTintColor {
    return [self yal_fieldColorWithRed:189.f green:143.f blue:219.f alpha:1.f];
}

+ (instancetype)yal_halloweenSupplementaryViewValidTintColor {
    return [self yal_fieldColorWithRed:193.f green:231.f blue:135.f alpha:1.f];
}

+ (instancetype)yal_halloweenSupplementaryViewInvalidTintColor {
    return [self yal_fieldColorWithRed:231.f green:161.f blue:99.f alpha:1.f];
}

+ (instancetype)yal_stepperSupplementaryViewTintColor {
    return [self yal_fieldColorWithRed:193.f green:231.f blue:135.f alpha:1.f];
}

+ (instancetype)yal_stepperSupplementaryViewBackgroundColor {
    return [self yal_fieldColorWithRed:93.f green:90.f blue:90.f alpha:1.f];
}

@end

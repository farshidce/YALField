// For License please refer to LICENSE file in the root of YALField project

#import "UIColor+YALFieldColors.h"

@implementation UIColor (YALFieldColors)

+ (instancetype)yal_fieldColorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha {
    return [self colorWithRed:red/255.f green:green/255.f blue:blue/255.f alpha:alpha];
}

+ (instancetype)yal_fieldinputPlaceholderTextColor {
    return [self yal_fieldColorWithRed:27.f green:33.f blue:46.f alpha:0.25f];
}

+ (instancetype)yal_fieldInputTitleTextColor {
    return [self yal_fieldColorWithRed:27.f green:33.f blue:46.f alpha:0.25f];
}

+ (instancetype)yal_fieldInputTextColor {
    return [self yal_fieldColorWithRed:74.f green:74.f blue:74.f alpha:1.f];
}

+ (instancetype)yal_fieldValidInputTextColor {
    return [self yal_fieldColorWithRed:74.f green:74.f blue:74.f alpha:1.f];
}

+ (instancetype)yal_fieldInvalidInputTextColor {
    return [self yal_fieldColorWithRed:208.f green:2.f blue:27.f alpha:1.f];
}

+ (instancetype)yal_fieldOrangeColor {
    return [self yal_fieldColorWithRed:239.f green:90.f blue:22.f alpha:1.f];
}

@end

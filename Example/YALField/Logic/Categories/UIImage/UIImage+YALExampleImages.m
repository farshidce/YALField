// For License please refer to LICENSE file in the root of YALField project

#import "UIImage+YALExampleImages.h"

@implementation UIImage (YALExampleImages)

+ (instancetype)yal_orderStepperDecrementImage {
    return [self imageNamed:@"ic_minus"];
}

+ (instancetype)yal_orderStepperIncrementImage {
    return [self imageNamed:@"ic_plus"];
}

+ (instancetype)yal_validationValidImage {
    return [self imageNamed:@"ic_input_validation_ok"];
}

+ (instancetype)yal_validationInvalidImage {
    return [self imageNamed:@"ic_input_validation_fail"];
}

@end

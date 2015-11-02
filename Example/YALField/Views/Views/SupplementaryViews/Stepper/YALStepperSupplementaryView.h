// For License please refer to LICENSE file in the root of YALField project

#import "YALBaseSupplementaryView.h"

@interface YALStepperSupplementaryView : YALBaseSupplementaryView

@property (nonatomic, assign) IBInspectable CGSize stepperSize;
@property (nonatomic, assign) IBInspectable NSUInteger value;
@property (nonatomic, assign) IBInspectable NSUInteger minimumValue;
@property (nonatomic, assign) IBInspectable NSUInteger maximumValue;
@property (nonatomic, copy) IBInspectable UIColor *stepperBackgroundColor;
@property (nonatomic, copy) IBInspectable UIColor *stepperTintColor;
@property (nonatomic, weak, readonly) UIStepper *stepper;

@end

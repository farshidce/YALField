// For License please refer to LICENSE file in the root of YALField project

#import "YALStepperSupplementaryView.h"
#import "YALField+YALPrivate.h"
#import "UIColor+YALExampleColors.h"

static const CGSize kDefaultStepperViewSize = (CGSize) {94.f, 29.f};

@interface YALStepperSupplementaryView ()

@property (nonatomic, weak) UIStepper *stepper;
@property (nonatomic, weak) IBOutlet UIControl<YALFieldInput> *field;

@end

@implementation YALStepperSupplementaryView

#pragma mark - common init

- (void)commonInit {
    self.stepperSize = kDefaultStepperViewSize;
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubviews];
    [self configureStepper];
}

#pragma mark - Setup

- (void)addSubviews {
    UIStepper *stepper = [UIStepper new];
    self.stepper = stepper;
    [self addSubview:self.stepper];
}

- (void)configureStepper {
    self.stepper.translatesAutoresizingMaskIntoConstraints = NO;
    self.stepperBackgroundColor = [UIColor yal_stepperSupplementaryViewBackgroundColor];
    self.stepperTintColor = [UIColor yal_stepperSupplementaryViewTintColor];
    [self.stepper addTarget:self action:@selector(stepperValueChanged:) forControlEvents:UIControlEventValueChanged];
}

#pragma mark - Constraints

- (void)setupConstraints {
    UIView *stepper = self.stepper;
    UIView *view = self;
    NSDictionary *metrics = @{@"height": @(self.stepperSize.height), @"width": @(self.stepperSize.width)};
    NSDictionary *views = NSDictionaryOfVariableBindings(stepper, view);
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[view]-(<=0)-[stepper(width)]" options:NSLayoutFormatAlignAllCenterY metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[view]-(<=0)-[stepper(height)]" options:NSLayoutFormatAlignAllCenterX metrics:metrics views:views]];
}

#pragma markr - Action

- (void)stepperValueChanged:(UIStepper *)stepper {
    [self.field setRawValue:[NSString stringWithFormat:@"%.0f", stepper.value]];
}

#pragma mark - Mutators

- (void)setStepperBackgroundColor:(UIColor *)stepperBackgroundColor {
    self.stepper.backgroundColor = stepperBackgroundColor;
}

- (void)setStepperTintColor:(UIColor *)stepperTintColor {
    [self.stepper setTintColor:stepperTintColor];
}

- (void)setValue:(NSUInteger)value {
    self.stepper.value = value;
}

- (void)setMinimumValue:(NSUInteger)minimumValue {
    self.stepper.minimumValue = minimumValue;
}

- (void)setMaximumValue:(NSUInteger)maximumValue {
    self.stepper.maximumValue = maximumValue;
}

- (void)setField:(UIControl<YALFieldInput> *)field {
    _field = field;
    
    [self stepperValueChanged:self.stepper];
}

@end

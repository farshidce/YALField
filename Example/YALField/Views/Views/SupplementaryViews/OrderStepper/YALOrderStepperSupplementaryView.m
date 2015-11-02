// For License please refer to LICENSE file in the root of YALField project

#import "YALOrderStepperSupplementaryView.h"
#import "YALField+YALPrivate.h"
#import "UIImage+YALExampleImages.h"
#import "UIColor+YALExampleColors.h"

static const CGFloat kButtonWidth = 14.f;

@interface YALOrderStepperSupplementaryView ()

@property (nonatomic, weak) UIButton *decrementButton;
@property (nonatomic, weak) UIButton *incrementButton;
@property (nonatomic, weak) IBOutlet UIControl<YALFieldInput> *field;

@end

@implementation YALOrderStepperSupplementaryView

#pragma mark - common init

- (void)commonInit {
    [self addSubviews];
    
    [self.incrementButton addTarget:self action:@selector(buttonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    [self.decrementButton addTarget:self action:@selector(buttonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - Setup

- (void)addSubviews {
    UIButton *decrementButton = [UIButton new];
    UIButton *incrementButton = [UIButton new];
    
    [self addSubview:decrementButton];
    [self addSubview:incrementButton];
    
    self.decrementButton = decrementButton;
    self.incrementButton = incrementButton;
}

- (void)configureSubviews {
    UIImage *decrementTexture = [[UIImage yal_orderStepperDecrementImage] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    UIImage *incrementTexture = [[UIImage yal_orderStepperIncrementImage] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    
    [self.decrementButton setBackgroundImage:decrementTexture forState:UIControlStateNormal];
    [self.incrementButton setBackgroundImage:incrementTexture forState:UIControlStateNormal];
    
    [self updateButtonsTintColors];
    
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.decrementButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.incrementButton.translatesAutoresizingMaskIntoConstraints = NO;
}

#pragma mark - Constraints

- (void)setupConstraints {
    UIView *increment = self.incrementButton;
    UIView *decrement = self.decrementButton;
    UIView *view = self;
    NSDictionary *metrics = @{@"width": @(kButtonWidth), @"height": @(kButtonWidth), @"inset": @(68.f)};
    NSDictionary *views = NSDictionaryOfVariableBindings(view, increment, decrement);
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(0)-[decrement(width)]-(inset)-[increment(width)]-(0)-|" options:kNilOptions metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[decrement(height)]" options:kNilOptions metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[increment(height)]" options:kNilOptions metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[view]-(<=0)-[increment]" options:NSLayoutFormatAlignAllCenterY metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[view]-(<=0)-[decrement]" options:NSLayoutFormatAlignAllCenterY metrics:metrics views:views]];
}

#pragma mark - Action

- (void)buttonTouchUpInside:(UIButton *)button {
    if (button == self.incrementButton && self.value < self.maximumValue) {
        ++self.value;
    } else if (button == self.decrementButton && self.value > self.minimumValue) {
        --self.value;
    }
}

#pragma mark - Mutators

- (void)setValue:(NSUInteger)value {
    _value = value;
    
    [self updateFieldValue];
}

- (void)setField:(UIControl<YALFieldInput> *)field {
    _field = field;
    
    [self updateFieldValue];
}

#pragma mark - Helper

- (void)updateFieldValue {
    [self.field setRawValue:[NSString stringWithFormat:@"%@", @(self.value)]];
    [self updateButtonsTintColors];
}

- (void)updateButtonsTintColors {
    if (self.value == self.minimumValue) {
        [self.decrementButton setTintColor:[UIColor yal_orderStepperHighlightedColor]];
        [self.incrementButton setTintColor:[UIColor yal_orderStepperNormalColor]];
    } else if (self.value == self.maximumValue) {
        [self.decrementButton setTintColor:[UIColor yal_orderStepperNormalColor]];
        [self.incrementButton setTintColor:[UIColor yal_orderStepperHighlightedColor]];
    } else if (self.value > self.minimumValue && self.value < self.maximumValue) {
        [self.decrementButton setTintColor:[UIColor yal_orderStepperNormalColor]];
        [self.incrementButton setTintColor:[UIColor yal_orderStepperNormalColor]];
    }
}

@end

// For License please refer to LICENSE file in the root of YALField project

#import "YALValidatingSupplementaryView.h"

static const CGSize kDefaultValidatingViewSize = (CGSize) {20.f, 20.f};

@interface YALValidatingSupplementaryView ()

@property (nonatomic, weak) UIImageView *validityImageView;

@end

@implementation YALValidatingSupplementaryView

#pragma mark - common init

- (void)commonInit {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubviews];
}

#pragma mark - Setup

- (void)addSubviews {
    UIImageView *imageView = [UIImageView new];
    self.validityImageView = imageView;
    [self addSubview:imageView];
    self.validityImageView.translatesAutoresizingMaskIntoConstraints = NO;
}

#pragma mark - Constraints

- (void)setupConstraints {
    UIView *imageView = self.validityImageView;
    UIView *view = self;
    NSDictionary *metrics = @{@"height": @(kDefaultValidatingViewSize.height), @"width": @(kDefaultValidatingViewSize.width)};
    NSDictionary *views = NSDictionaryOfVariableBindings(imageView, view);
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[view]-(<=0)-[imageView(width)]" options:NSLayoutFormatAlignAllCenterY metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[view]-(<=0)-[imageView(height)]" options:NSLayoutFormatAlignAllCenterX metrics:metrics views:views]];
}

#pragma mark - YALStateVaryingSupplementaryView

- (void)setFieldState:(YALFieldState)fieldState {
    switch (fieldState) {
        case YALFieldStateClear:
            self.validityImageView.image = nil;
            break;
        case YALFieldStateValid:
            self.validityImageView.image = self.validImage;
            break;
        case YALFieldStateInvalid:
            self.validityImageView.image = self.invalidImage;
            break;
    }
}

@end

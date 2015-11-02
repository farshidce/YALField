// For License please refer to LICENSE file in the root of YALField project

#import "YALPasswordSupplementaryView.h"
#import "YALField+YALPrivate.h"
#import "YALBaseDataFlowController.h"
#import "UIColor+YALFieldColors.h"
#import "YALBaseDataFlowController.h"

static const CGSize kDefaultPasswordViewSize = (CGSize) {37.f, 15.f};
static const CGFloat kDefaultPasswordViewFontSize = 12.f;
static NSString *const kDefaultPasswordViewFontName = @"HelveticaNeue";

@interface YALPasswordSupplementaryView ()

@property (nonatomic, weak) IBOutlet YALField *field;
@property (nonatomic, weak) UIButton *showPasswordButton;

@end

@implementation YALPasswordSupplementaryView

#pragma mark - common init

- (void)commonInit {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubviews];
    [self configureShowPasswordButton];
}

#pragma mark - Setup

- (void)addSubviews {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.showPasswordButton = button;
    [self addSubview:button];
}

- (void)configureShowPasswordButton {
    self.showPasswordButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.showPasswordButton addTarget:self action:@selector(showSecuredTextButtonTouchUpInside) forControlEvents:UIControlEventTouchUpInside];
    [self.showPasswordButton setTitle:@"SHOW" forState:UIControlStateNormal];
    [self.showPasswordButton setTitleColor:[UIColor yal_fieldOrangeColor] forState:UIControlStateNormal];
    self.showPasswordButton.titleLabel.font = [UIFont fontWithName:kDefaultPasswordViewFontName size:kDefaultPasswordViewFontSize];
}

#pragma mark - Constraints

- (void)setupConstraints {
    UIView *button = self.showPasswordButton;
    UIView *view = self;
    NSDictionary *metrics = @{@"height": @(kDefaultPasswordViewSize.height), @"width": @(kDefaultPasswordViewSize.width)};
    NSDictionary *views = NSDictionaryOfVariableBindings(button, view);
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[view]-(<=0)-[button(width)]" options:NSLayoutFormatAlignAllCenterY metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[view]-(<=0)-[button(height)]" options:NSLayoutFormatAlignAllCenterX metrics:metrics views:views]];
}

#pragma mark - Action

- (IBAction)showSecuredTextButtonTouchUpInside {
    if (self.field.secured) {
        self.field.secured = NO;
        [YALBaseDataFlowController inputDidReceiveTouchEvent:self.field];
    }
}

@end

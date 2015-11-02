// For License please refer to LICENSE file in the root of YALField project

#import "YALOrderField.h"
#import "YALField+YALPrivate.h"
#import "YALOrderConfigurator.h"

@interface YALOrderField ()

@property (nonatomic, weak) UIImageView *iconImageView;
@property (nonatomic, weak) UIView *titleBackgroundView;

@end

@implementation YALOrderField

#pragma mark - common init

- (void)commonInit {
    [super commonInit];
    [self setConfigurator:[YALOrderConfigurator new]];
}

#pragma mark - Setup

- (void)addSubviews {
    [super addSubviews];
    
    UIImageView *leftIconImageView = [UIImageView new];
    UIView *titleBackgroundView = [UIView new];
    
    [self addSubview:leftIconImageView];
    [self insertSubview:titleBackgroundView belowSubview:self.titleView];
    
    self.iconImageView = leftIconImageView;
    self.titleBackgroundView = titleBackgroundView;
}

- (void)configureSubviews {
    [super configureSubviews];
    self.iconImageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.titleBackgroundView.translatesAutoresizingMaskIntoConstraints = NO;
    self.layer.cornerRadius = 36.5f;
    self.titleBackgroundView.layer.cornerRadius = 28.5f;
}

#pragma mark - Constraints

- (void)setupConstraints {
    [super setupConstraints];
    [self setupHorizontalConstraints];
    [self setupVerticalConstraints];
}

- (void)setupHorizontalConstraints {
    YALOrderConfigurator *configurator = (YALOrderConfigurator *)self.configurator;
    NSDictionary *views = [self dictionaryOfVariableBindings];
    NSDictionary *metrics = @{@"iconInset": @(configurator.iconInsetToTitle),
                              @"iconWidth": @(configurator.iconSize.width),
                              @"titleBackgroundInsetLeftInset": @(configurator.titleBackgroundLeftInset),
                              @"titleBackgroundInsetToTitle": @(-configurator.titleViewSize.width)};
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[icon(iconWidth)]-(iconInset)-[title]" options:kNilOptions metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(titleBackgroundInsetLeftInset)-[titleBackground]-(titleBackgroundInsetToTitle)-[title]" options:kNilOptions metrics:metrics views:views]];
}

- (void)setupVerticalConstraints {
    YALOrderConfigurator *configurator = (YALOrderConfigurator *)self.configurator;
    NSDictionary *views = [self dictionaryOfVariableBindings];
    NSDictionary *metrics = @{@"iconHeight": @(configurator.iconSize.height),
                              @"titleBackgroundHeight": @(configurator.titleBackgroundHeight)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[icon(iconHeight)]" options:kNilOptions metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[titleBackground(titleBackgroundHeight)]" options:kNilOptions metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[self]-(<=0)-[icon]" options:NSLayoutFormatAlignAllCenterY metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[self]-(<=0)-[titleBackground]" options:NSLayoutFormatAlignAllCenterY metrics:metrics views:views]];
}

#pragma mark - Mutators

- (void)setConfigurator:(YALOrderConfigurator *)configurator {
    [super setConfigurator:configurator];
}

- (void)setDebugMode:(BOOL)debugMode {
    [super setDebugMode:debugMode];
    
    self.iconImageView.backgroundColor = [UIColor redColor];
    self.titleBackgroundView.backgroundColor = [UIColor whiteColor];
}

- (void)setIcon:(UIImage *)icon {
    self.iconImageView.image = icon;
}

#pragma mark - Helpers

- (NSDictionary *)dictionaryOfVariableBindings {
    NSMutableDictionary *views = [[super dictionaryOfVariableBindings] mutableCopy];
    UIView *icon = self.iconImageView;
    UIView *titleBackground = self.titleBackgroundView;
    
    [views addEntriesFromDictionary:NSDictionaryOfVariableBindings(icon, titleBackground)];
    
    return [NSDictionary dictionaryWithDictionary:views];
}

@end

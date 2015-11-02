// For License please refer to LICENSE file in the root of YALField project

#import "YALLoginConfigurator.h"
#import "YALField+YALPrivate.h"

static const CGFloat kFieldSeparatorHeight = 1.f;

@interface YALLoginConfigurator ()

@property (nonatomic, strong) YALField *field;
@property (nonatomic, weak) UIView *topBorder;
@property (nonatomic, weak) UIView *bottomBorder;

@end

@implementation YALLoginConfigurator

#pragma mark - init

- (instancetype)init {
    if (self = [super init]) {
        [self setup];
    }
    return self;
}

#pragma mark - Setup

- (void)setup {
    self.leftInset = 20.f;
    self.rightInset = 20.f;
    self.textFieldHeight = 34.f;
    self.titleViewSize = (CGSize) {90.f, 34.f};
    self.titleViewFontSize = 19.f;
    self.textFieldFontSize = 19.f;
}

#pragma mark - YALInputConfigurator

- (void)configureView:(YALField *)field {
    [super configureView:field];
    self.field = field;
    [self addBorders];
}

- (void)resetView:(YALField *)field {
    [super resetView:field];
    self.field = field;
    [self removeBorders];
}

#pragma mark - Borders

- (void)addBorders {
    CGRect rect = self.field.bounds;

    UIView *topBorder = [[UIView alloc] initWithFrame:(CGRect) {
        .origin = rect.origin,
        .size.height = kFieldSeparatorHeight,
        .size.width = rect.size.width
    }];
    UIView *bottomBorder = [[UIView alloc] initWithFrame:(CGRect) {
        .origin.x = rect.origin.x,
        .origin.y = rect.size.height - kFieldSeparatorHeight,
        .size.height = kFieldSeparatorHeight,
        .size.width = rect.size.width
    }];

    topBorder.opaque = YES;
    bottomBorder.opaque = YES;
    topBorder.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin;
    bottomBorder.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    topBorder.backgroundColor = [UIColor lightGrayColor];
    bottomBorder.backgroundColor = [UIColor lightGrayColor];

    [self.field addSubview:topBorder];
    [self.field addSubview:bottomBorder];

    self.topBorder = topBorder;
    self.bottomBorder = bottomBorder;
}

- (void)removeBorders {
    [self.topBorder removeFromSuperview];
    [self.bottomBorder removeFromSuperview];
}

@end

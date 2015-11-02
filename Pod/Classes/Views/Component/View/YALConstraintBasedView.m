// For License please refer to LICENSE file in the root of YALField project

#import "YALConstraintBasedView.h"

@implementation YALConstraintBasedView

#pragma mark - init

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self commonInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self commonInit];
    }
    return self;
}

#pragma mark - common init

- (void)commonInit {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"Must override method (%@) in subclass", NSStringFromSelector(_cmd)]
                                 userInfo:nil];
}

#pragma mark - Setup

- (void)addSubviews {
    // a place to add subviews obviously
}

- (void)configureSubviews {
    // do here self.someSubview.translatesAutoresizingMaskIntoConstraints = NO
    // or anything else that might need to be updated every time constraints update
}

#pragma mark - Layout

- (BOOL)requiresConstraintBasedLayout {
    return YES;
}

- (UIEdgeInsets)alignmentRectInsets {
    return UIEdgeInsetsZero;
}

- (void)updateConstraints {
    [self configureSubviews];
    [self setupConstraints];
    [super updateConstraints];
}

#pragma mark - Constraints

- (void)setupConstraints {
    // setup your constraints here; do not bother to remove any
}

@end

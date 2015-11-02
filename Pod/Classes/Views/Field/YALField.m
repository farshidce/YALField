// For License please refer to LICENSE file in the root of YALField project

#import "YALField.h"
#import "YALInputConfigurator.h"
#import "YALFormatter.h"
#import "YALFormController.h"
#import "YALDataFlowController.h"
#import "YALFieldConfigurator.h"
#import "YALStateVaryingSupplementaryView.h"
#import "YALPasswordSupplementaryView.h"
#import "YALField+YALPrivate.h"
#import "YALBaseDataFlowController.h"

@interface YALField () <UITextFieldDelegate, YALFieldInput>

@property (nonatomic, weak) UILabel *titleView;
@property (nonatomic, weak) UITextField *textField;
@property (nonatomic, weak) UIView *additionalView;

@property (nonatomic, strong) IBOutlet id<YALResponder> responder;
@property (nonatomic, strong) IBOutlet id<YALValidator> validator;
@property (nonatomic, strong) IBOutlet id<YALFormatter> formatter;

@property (nonatomic, strong) IBOutlet UIView *supplementaryView;

@property (nonatomic, weak) id<YALForm> form;
@property (nonatomic, strong) IBOutlet id<YALInputConfigurator> configurator;

@property (nonatomic, strong) YALPasswordSupplementaryView *passwordSupplementaryView;

@end

@implementation YALField
@synthesize enabled = _enabled;

#pragma mark - common init

- (void)commonInit {
    [self addSubviews];
    self.configurator = [YALFieldConfigurator new];
    self.textField.delegate = self;
    self.enabled = YES;
    self.inputEnabled = YES;
}

#pragma mark - Setup

- (void)addSubviews {
    UILabel *title = [UILabel new];
    UITextField *textField = [UITextField new];
    UIView *additionalView = [UIView new];
    
    [self addSubview:title];
    [self addSubview:textField];
    [self addSubview:additionalView];
    
    self.titleView = title;
    self.textField = textField;
    self.additionalView = additionalView;
}

- (void)configureSubviews {
    self.titleView.translatesAutoresizingMaskIntoConstraints = NO;
    self.textField.translatesAutoresizingMaskIntoConstraints = NO;
    self.additionalView.translatesAutoresizingMaskIntoConstraints = NO;
    self.additionalView.clipsToBounds = NO;
}

#pragma mark - Layout

- (void)updateConstraints {
    [self setFieldState:YALFieldStateClear];
    [super updateConstraints];
}

#pragma mark - Constraints

- (void)setupConstraints {
    [self yal_setupHorizontalConstraints];
    [self yal_setupVerticalConstraints];
    if (self.supplementaryView) {
        [self wireView:self.supplementaryView toAdditionalView:self.additionalView];
    }
    
    if (self.passwordSupplementaryView) {
        [self wireView:self.passwordSupplementaryView toAdditionalView:self.additionalView];
    }
}

- (void)yal_setupHorizontalConstraints {
    NSDictionary *views = [self dictionaryOfVariableBindings];
    NSDictionary *metrics = @{@"insetOne": @(self.configurator.leftInset),
                              @"insetTwo": @(self.configurator.textFieldLeftInset),
                              @"insetThree": @(self.configurator.textFieldRightInset),
                              @"insetFour": @(self.configurator.rightInset),
                              @"titleViewWidth": @(self.configurator.titleViewSize.width),
                              @"additionalViewWidth": @(self.configurator.supplementaryViewSize.width)
                              };
    NSString *format = @"H:|-(insetOne)-[title(titleViewWidth)]-(insetTwo)-[textField]-(insetThree)-[additionalView(additionalViewWidth)]-(insetFour)-|";
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:format options:kNilOptions metrics:metrics views:views]];
}

- (void)yal_setupVerticalConstraints {
    NSDictionary *metrics = @{@"titleViewHeight": @(self.configurator.titleViewSize.height ?: 28.f),
                              @"textFieldHeight": @(self.configurator.textFieldHeight),
                              @"additionalViewHeight": @(self.configurator.supplementaryViewSize.height)
                              };
    NSDictionary *views = [self dictionaryOfVariableBindings];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[title(titleViewHeight)]" options:kNilOptions metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[textField(textFieldHeight)]" options:kNilOptions metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[additionalView(additionalViewHeight)]" options:kNilOptions metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[self]-(<=0)-[title]" options:NSLayoutFormatAlignAllCenterY metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[self]-(<=0)-[textField]" options:NSLayoutFormatAlignAllCenterY metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[self]-(<=0)-[additionalView]" options:NSLayoutFormatAlignAllCenterY metrics:metrics views:views]];
}

- (void)wireView:(UIView *)view toAdditionalView:(UIView *)additionalView {
    [additionalView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view]|" options:kNilOptions metrics:nil views:NSDictionaryOfVariableBindings(view)]];
    [additionalView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]|" options:kNilOptions metrics:nil views:NSDictionaryOfVariableBindings(view)]];
}

#pragma mark - Mutators

- (void)setDebugMode:(BOOL)debugMode {
    if (debugMode) {
        self.titleView.backgroundColor = [UIColor cyanColor];
        self.textField.backgroundColor = [UIColor yellowColor];
        self.additionalView.backgroundColor = [UIColor magentaColor];
        self.backgroundColor = [UIColor blackColor];
    }
}

- (void)setEnabled:(BOOL)enabled {
    if (self.enabled != enabled) {
        _enabled = enabled;
        self.textField.textColor = (self.enabled) ? [self.configurator textColor] : [self.configurator disabledTextColor];
        [super setEnabled:self.enabled];
    }
}

- (void)setSupplementaryView:(UIView *)supplementaryView {
    NSAssert(supplementaryView.superview == nil, @"Supplementary view should not have superview");
    NSAssert(![supplementaryView isMemberOfClass:[YALPasswordSupplementaryView class]], @"YALField already uses YALPasswordSupplementaryView as passwordSupplementaryView. Just toggle property \"secured\" of YALField to have YALPasswordSupplementaryView as secondatory supplementaryView for secured input");
    if (_supplementaryView) {
        [_supplementaryView removeFromSuperview];
    }
    
    _supplementaryView = supplementaryView;
    [self.additionalView addSubview:self.supplementaryView];
}

- (void)setConfigurator:(id<YALInputConfigurator>)configurator {
    [self.configurator resetView:self];
    _configurator = configurator;
    [self.configurator configureView:self];
}

- (void)setTitle:(NSString *)title {
    self.titleView.text = title;
}

- (void)setPlaceholder:(NSString *)placeholder {
    NSDictionary *attributes = @{NSForegroundColorAttributeName: self.configurator.placeholderColor};
    self.textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeholder attributes:attributes];
}

- (void)setSecured:(BOOL)secured {
    if (secured && !self.secured && !self.textField.secureTextEntry) {
        [self makeFieldSecure];
    } else if (!secured && self.secured && self.textField.secureTextEntry) {
        [self makeFieldInsecure];
    }
    _secured = secured;
}

#pragma mark - Accessors

- (NSString *)title {
    return self.titleView.text;
}

#pragma mark - Field security

- (void)makeFieldInsecure {
    self.textField.secureTextEntry = NO;
    [self.passwordSupplementaryView removeFromSuperview];
    self.passwordSupplementaryView = nil;
    self.supplementaryView.hidden = NO;
}

- (void)makeFieldSecure {
    self.textField.secureTextEntry = YES;
    if (!self.passwordSupplementaryView) {
        self.passwordSupplementaryView = [YALPasswordSupplementaryView new];
        [self.passwordSupplementaryView setField:self];
        [self.additionalView addSubview:self.passwordSupplementaryView];
    }
    self.supplementaryView.hidden = YES;
}

#pragma mark - YALInput

- (void)setFormattedValue:(NSString *)formattedValue {
    self.textField.text = formattedValue;
}

- (NSString *)formattedValue {
    return self.textField.text;
}

- (void)setRawValue:(id)rawValue {
    NSAssert((self.formatter == nil && [rawValue isKindOfClass:[NSString class]]) || self.formatter != nil , @"If no formatter provided rawValue can only be of NSString type");
    self.textField.text = [YALBaseDataFlowController formattedValueFromRawValue:rawValue forInput:self];
}

- (id)rawValue {
    return [YALBaseDataFlowController rawValueFromFormattedValue:self.textField.text forInput:self];
}

- (void)clear {
    [self setFormattedValue:@""];
    [self setFieldState:YALFieldStateClear];
}

#pragma mark - YALResponder

- (BOOL)becomeFirstResponder {
    [super becomeFirstResponder];
    [YALBaseDataFlowController inputDidReceiveTouchEvent:self];
    return YES;
}

- (BOOL)resignFirstResponder {
    [self.textField resignFirstResponder];
    [super resignFirstResponder];
    return YES;
}

- (BOOL)isFirstResponder {
    return [self.textField isFirstResponder];
}

#pragma mark - States

- (void)setFieldState:(NSInteger)fieldState {
    if ([self.configurator respondsToSelector:@selector(configureView:forFieldState:)]) {
        [self.configurator configureView:self forFieldState:fieldState];        
    }
    
    if ([self.supplementaryView conformsToProtocol:@protocol(YALStateVaryingSupplementaryView)]) {
        [(id<YALStateVaryingSupplementaryView>)self.supplementaryView setFieldState:fieldState];
    }
}

#pragma mark - UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [YALBaseDataFlowController inputDidBegin:self];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [YALBaseDataFlowController inputDidEnd:self];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [YALBaseDataFlowController inputDidEnd:self];
    return NO;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    return [YALBaseDataFlowController input:self shouldChangeCharactersInRange:range replacementString:&string];
}

#pragma mark - HitTest

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {    
    static NSTimeInterval previousEventTimestamp;
    UIView *view = [super hitTest:point withEvent:event];
    
    if (view && !([view isKindOfClass:[UIControl class]] && view != self.textField && view != self && view != self.titleView)) {
        if (previousEventTimestamp == 0 || event.timestamp != previousEventTimestamp) {
            previousEventTimestamp = event.timestamp;
            [YALBaseDataFlowController inputDidReceiveTouchEvent:self];
        } else {
            view = self;
        }
    }
    
    return view;
}

#pragma mark - Helpers

- (NSDictionary *)dictionaryOfVariableBindings {
    UIView *textField = self.textField;
    UIView *title = self.titleView;
    UIView *additionalView = self.additionalView;
    return NSDictionaryOfVariableBindings(self, title, textField, additionalView);
}

- (void)endInput {
    [YALBaseDataFlowController inputDidEnd:self];
}

#pragma mark - Interface builder rendering

- (void)prepareForInterfaceBuilder {
    [self setupConstraints];
    [self.configurator configureView:self];
    [self setFieldState:YALFieldStateClear];
}

@end

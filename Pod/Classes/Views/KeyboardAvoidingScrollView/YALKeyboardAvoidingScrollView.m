// For License please refer to LICENSE file in the root of YALField project

#import "YALKeyboardAvoidingScrollView.h"
#import "YALForm.h"
#import "YALKeyboardHelper.h"
#import "YALInput.h"

@interface YALKeyboardAvoidingScrollView () <UIGestureRecognizerDelegate>

@property (nonatomic, weak) IBOutlet id<YALForm> form;
@property (nonatomic, assign) UIEdgeInsets originalEdgeInset;

@end

@implementation YALKeyboardAvoidingScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setup];
}

- (void)dealloc {
    [self removeKeyboardNotificationsObservers];
}

- (void)setup {
    [self addKeyboardNotificationsObservers];
    [self addTapGestureRecognizer];
}

- (void)addKeyboardNotificationsObservers {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShownNotificationHandler:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHiddenNotificationHandler:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)removeKeyboardNotificationsObservers {
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardDidShowNotification
                                                  object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
}

- (void)addTapGestureRecognizer {
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewTapHandler:)];
    tapRecognizer.delegate = self;
    [self addGestureRecognizer:tapRecognizer];
}

#pragma mark - Notifications Handlers

- (void)keyboardWasShownNotificationHandler:(NSNotification *)aNotification {
    NSAssert(self.form, @"fromController cannot be nil in YALKeyboardAvoidingScrollView");
    
    NSDictionary *info = [aNotification userInfo];
    CGSize keyboardSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    self.originalEdgeInset = self.contentInset;
    UIEdgeInsets contentInsets = self.contentInset;
    contentInsets.bottom = keyboardSize.height;
    self.contentInset = contentInsets;
    self.scrollIndicatorInsets = contentInsets;
    
    // If the first responder is hidden by keyboard, scroll it so it's visible
    CGRect visibleRect = self.superview.frame;
    visibleRect.size.height -= keyboardSize.height;
    id<YALInput> activeInput = [self.form activeInput];
    if ([activeInput respondsToSelector:@selector(frame)]) {
        CGRect activeInputFrame = [(UIView *)activeInput frame];
        CGPoint activeInputFrameBottomPoint = (CGPoint){activeInputFrame.origin.x, activeInputFrame.origin.y + activeInputFrame.size.height};
        if (!CGRectContainsPoint(visibleRect, activeInputFrameBottomPoint)) {
            [self scrollRectToVisible:activeInputFrame animated:YES];
        }
    }
}

- (void)keyboardWillBeHiddenNotificationHandler:(NSNotification *)aNotification {
    self.contentInset = self.originalEdgeInset;
    self.scrollIndicatorInsets = self.originalEdgeInset;
    self.originalEdgeInset = UIEdgeInsetsZero;
}

#pragma mark - TapGestureRecognizer action handler

- (void)scrollViewTapHandler:(UIGestureRecognizer *)sender {
    [YALKeyboardHelper hideKeyboard];
}

#pragma mark - UIGestureRecognizerDelegate methods

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if ([[self.form inputs] containsObject:touch.view]) {
        return NO;
    }
    return YES;
}

@end

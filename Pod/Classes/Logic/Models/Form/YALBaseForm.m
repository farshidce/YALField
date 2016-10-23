// For License please refer to LICENSE file in the root of YALField project

#import "YALBaseForm.h"
#import "YALInput.h"
#import "YALField+YALPrivate.h"
#import "YALErrorsPresenter.h"
#import "YALBaseFormController.h"
#import "YALKeyboardHelper.h"
#import "YALFormFinishResponder.h"

@interface YALBaseForm ()

@property (nonatomic, strong) IBOutletCollection(id) NSArray *inputs;
@property (nonatomic, weak) IBOutlet id<YALErrorsPresenter> errorsPresenter;
@property (nonatomic, weak) IBOutlet UIButton *finishButton;
@property (nonatomic, strong) IBOutlet id<YALResponder> finishResponder;

@end

@implementation YALBaseForm

#pragma mark - init

- (instancetype)init {
    if (self = [super init]) {
        self.shouldUpdateFieldsStates = YES;
    }
    return self;
}

#pragma mark - Mutators

- (void)setFinishButton:(UIButton *)finishButton {
    _finishButton = finishButton;
    [self wireFinishActionIfPossible];
}

- (void)setFinishResponder:(id<YALResponder>)finishResponder {
    _finishResponder = finishResponder;
    [self wireFinishActionIfPossible];
}

#pragma mark - YALForm

- (id<YALInput>)activeInput {
    id<YALInput> activeInput;
    for (id<YALInput> input in self.inputs) {
        if ([input isFirstResponder]) {
            activeInput = input;
            break;
        }
    }
    return activeInput;
}

- (void)clear {
    [self.inputs makeObjectsPerformSelector:@selector(clear)];
}

#pragma mark - Form finishing

- (void)finishFormIfPossible {
    NSError *error;
    BOOL valid = ({
        [YALKeyboardHelper hideKeyboard];
        [YALBaseFormController isFormValid:self error:&error];
    });
    
    if (valid && self.finishResponder && [self.finishResponder respondsToSelector:@selector(performAction:)]) {
        if ([self.finishResponder conformsToProtocol:@protocol(YALFormFinishResponder)]
            && ![(id<YALFormFinishResponder>)self.finishResponder form])
        {
            [(id<YALFormFinishResponder>)self.finishResponder setForm:self];
        }
        [self.finishResponder performAction:self];
    } else if (!valid && error && self.errorsPresenter) {
        [self.errorsPresenter displayError:error];
    }
}

#pragma mark - Helper methods

- (void)wireFinishActionIfPossible {
    if (self.finishResponder && self.finishButton) {
        [self.finishButton addTarget:self action:@selector(finishFormIfPossible) forControlEvents:UIControlEventTouchUpInside];
    }
}

@end

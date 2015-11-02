// For License please refer to LICENSE file in the root of YALField project

#import "YALPaymentViewController.h"
#import "YALFormFinishResponder.h"
#import "YALPaymentForm.h"
#import "YALField.h"
#import "YALCustomResponder.h"
#import "YALField+YALPrivate.h"

static const CGFloat kViewVisibleAlpha = 1.f;
static const CGFloat kViewHiddenAlpha = 0.f;
static const NSTimeInterval kAnimationDuration = 0.3;

@interface YALPaymentViewController () <YALFormFinishResponder>

@property (nonatomic, strong) YALPaymentForm *form;

@property (nonatomic, weak) IBOutlet YALField *expirationDateField;
@property (nonatomic, weak) IBOutlet YALCustomResponder *expirationDateResponder;
@property (nonatomic, weak) IBOutlet UIDatePicker *datePicker;
@property (nonatomic, weak) IBOutlet UIView *datePickerContainerView;

@end

@implementation YALPaymentViewController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.datePicker.minimumDate = [NSDate date];
    
    [self.expirationDateResponder setActionBlock:^{
        [self presentDatePicker];
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

#pragma mark - YALFormFinishResponder

- (void)performAction:(id)sender {
    [self pretendToDoSomeNetworkRequestWithWithTitle:@"Placing order" completion:^{
        [self.navigationController popToRootViewControllerAnimated:YES];
    }];
}

#pragma mark - Action

- (IBAction)datePicked:(UIDatePicker *)datePicker {
    [self.expirationDateField setRawValue:datePicker.date];
    [self.expirationDateField endInput];
}

- (void)datePickerDoneButtonTapped {
    [self hideDatePicker];
}

#pragma mark - Helper

- (void)presentDatePicker {
    [self addDatePickerDoneButton];
    [UIView animateWithDuration:kAnimationDuration animations:^{
        self.datePickerContainerView.alpha = kViewVisibleAlpha;
    }];
}

- (void)hideDatePicker {
    [self removeDatePickerDoneButton];
    [UIView animateWithDuration:kAnimationDuration animations:^{
        self.datePickerContainerView.alpha = kViewHiddenAlpha;
    }];
}

- (void)addDatePickerDoneButton {
    UIBarButtonItem *done = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(datePickerDoneButtonTapped)];
    self.navigationItem.rightBarButtonItem = done;
}

- (void)removeDatePickerDoneButton {
    self.navigationItem.rightBarButtonItem = nil;
}

@end

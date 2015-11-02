// For License please refer to LICENSE file in the root of YALField project

#import "YALEditProfileViewController.h"
#import "YALFormFinishResponder.h"
#import "YALEditProfileForm.h"
#import "YALField.h"
#import "YALUser.h"
#import "YALProfileViewController.h"
#import "YALCustomResponder.h"
#import "YALField+YALPrivate.h"

static const CGFloat kViewVisibleAlpha = 1.f;
static const CGFloat kViewHiddenAlpha = 0.f;
static const NSTimeInterval kAnimationDuration = 0.3;

@interface YALEditProfileViewController () <YALFormFinishResponder>

@property (nonatomic, strong) YALEditProfileForm *form;
@property (nonatomic, strong) YALUser *user;
@property (nonatomic, weak) IBOutlet YALField *birthDate;
@property (nonatomic, weak) IBOutlet YALCustomResponder *birthDateResponder;
@property (nonatomic, weak) IBOutlet UIDatePicker *datePicker;
@property (nonatomic, weak) IBOutlet UIView *datePickerContainerView;

@end

@implementation YALEditProfileViewController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.datePicker.maximumDate = [NSDate date];
    
    [self.birthDateResponder setActionBlock:^{
        [self presentDatePicker];
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    self.navigationItem.hidesBackButton = YES;
}

#pragma mark - YALFormFinishResponder

- (void)performAction:(id)sender {
    [self pretendToDoSomeNetworkRequestWithWithTitle:@"Updating profile" completion:^{
        [self makeUserFromFormData];
        [self performSegueWithIdentifier:@"EditProfileToProfile" sender:self];
    }];
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"EditProfileToProfile"]) {
        YALProfileViewController *profile = segue.destinationViewController;
        
        [profile setUser:self.user];
    }
}

#pragma mark - Actions

- (IBAction)datePicked:(UIDatePicker *)datePicker {
    [self.birthDate setRawValue:datePicker.date];
    [self.birthDate endInput];
}

- (void)datePickerDoneButtonTapped {
    [self hideDatePicker];
}

#pragma mark - Helper methods

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

- (void)makeUserFromFormData {
    YALUser *user = self.user = [YALUser new];
    
    user.name = self.form.name.formattedValue;
    user.birthDate = self.form.birthDate.formattedValue;
    user.phone = self.form.phone.rawValue;
    user.email = self.form.email.formattedValue;
}


@end

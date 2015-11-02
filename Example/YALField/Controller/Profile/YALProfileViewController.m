// For License please refer to LICENSE file in the root of YALField project

#import "YALProfileViewController.h"
#import "YALFormFinishResponder.h"
#import "YALProfileForm.h"
#import "YALField.h"
#import "YALUser.h"
#import "YALField+YALPrivate.h"

@interface YALProfileViewController () <YALFormFinishResponder>

@property (nonatomic, weak) IBOutlet YALProfileForm *form;
@property (nonatomic, strong) YALUser *user;

@end

@implementation YALProfileViewController

#pragma mark - Life Cycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    self.form.name.formattedValue = self.user.name;
    self.form.birthDate.formattedValue = self.user.birthDate;
    self.form.email.formattedValue = self.user.email;
    self.form.phone.rawValue = self.user.phone;
}

#pragma mark - YALFormFinishResponder

- (void)performAction:(id)sender {
    [self pretendToDoSomeNetworkRequestWithWithTitle:@"Confirming profile" completion:^{
        [self performSegueWithIdentifier:@"ProfileToOrder" sender:self];
    }];
}

@end

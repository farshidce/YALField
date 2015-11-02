// For License please refer to LICENSE file in the root of YALField project

#import "YALRegistrationViewController.h"
#import "YALRegistrationForm.h"
#import "YALFormFinishResponder.h"

@interface YALRegistrationViewController () <YALFormFinishResponder>

@property (nonatomic, weak) IBOutlet YALRegistrationForm *form;

@end

@implementation YALRegistrationViewController

#pragma mark - Life cycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [self.form clear];
}

#pragma mark - YALFormFinishResponder

- (void)performAction:(id)sender {
    [self pretendToDoSomeNetworkRequestWithWithTitle:@"Registrering" completion:^{
        [self performSegueWithIdentifier:@"RegistrationToLogin" sender:self];
    }];
}

@end

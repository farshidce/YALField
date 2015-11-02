// For License please refer to LICENSE file in the root of YALField project

#import "YALLoginViewController.h"
#import "YALLoginForm.h"
#import "YALFormFinishResponder.h"

@interface YALLoginViewController () <YALFormFinishResponder>

@property (nonatomic, strong) YALLoginForm *form;

@end

@implementation YALLoginViewController

#pragma mark - Life cycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    self.navigationItem.hidesBackButton = YES;
}

#pragma mark - YALFormFinishResponder

- (void)performAction:(id)sender {
    [self pretendToDoSomeNetworkRequestWithWithTitle:@"Logging in" completion:^{
        [self performSegueWithIdentifier:@"LoginToEditProfile" sender:self];
    }];
}

@end

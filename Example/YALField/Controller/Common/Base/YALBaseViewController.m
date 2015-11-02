// For License please refer to LICENSE file in the root of YALField project

#import "YALBaseViewController.h"
#import "MBProgressHUD.h"

static const NSTimeInterval kMinimumIntervalValue = 0.3;
static const NSTimeInterval kMaximumIntervalValue = 2.0;

NS_INLINE NSTimeInterval yal_randomTimeIntervalInBetween(NSTimeInterval from, NSTimeInterval to) {
    return (drand48() * (to - from)) + from;
}

NS_INLINE NSTimeInterval yal_randomTimeInterval(void) {
    return yal_randomTimeIntervalInBetween(kMinimumIntervalValue, kMaximumIntervalValue);
}

__attribute__((constructor)) static void yal_randomize(void) {
    srand48(time(0));
}

@implementation YALBaseViewController

#pragma mark - YALErrorsPresenter

- (void)presentError:(NSError *)error {
    [self showHUDWithMode:MBProgressHUDModeText
                    title:error.localizedDescription
           hideAfterDelay:1.3
               completion:nil];
}

#pragma mark - Public

- (void)pretendToDoSomeNetworkRequestWithWithTitle:(NSString *)title
                                        completion:(void(^)(void))completion
{
    NSTimeInterval interval = yal_randomTimeInterval();
    
    [self showHUDWithMode:MBProgressHUDModeIndeterminate
                    title:title
           hideAfterDelay:interval
               completion:completion];
}

- (void)showHUDWithMode:(MBProgressHUDMode)mode
                  title:(NSString *)title
         hideAfterDelay:(NSTimeInterval)delay
             completion:(void(^)(void))completion
{
    MBProgressHUD *hud = ({
        [MBProgressHUD hideAllHUDsForView:self.view animated:NO];
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    });
    
    [hud setMode:mode];
    [hud setDetailsLabelText:title];
    [hud setUserInteractionEnabled:NO];
    [hud hide:YES afterDelay:delay];
    
    if (completion) {
        [hud setCompletionBlock:completion];
    }
}

@end

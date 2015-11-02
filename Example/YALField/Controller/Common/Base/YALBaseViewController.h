// For License please refer to LICENSE file in the root of YALField project

#import <UIKit/UIKit.h>
#import "YALErrorsPresenter.h"

@interface YALBaseViewController : UIViewController <YALErrorsPresenter>

- (void)pretendToDoSomeNetworkRequestWithWithTitle:(NSString *)title
                                        completion:(void(^)(void))completion;

@end

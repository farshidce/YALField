// For License please refer to LICENSE file in the root of YALField project

#import <Foundation/Foundation.h>

@protocol YALErrorsPresenter <NSObject>

@required
- (void)displayError:(NSError *)error;

@end

// For License please refer to LICENSE file in the root of YALField project

#import "YALCustomResponder.h"

@implementation YALCustomResponder

#pragma mark - YALResponder

- (void)performAction:(id)sender {
    if (self.actionBlock) {
        self.actionBlock();
    }
}

@end

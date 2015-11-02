// For License please refer to LICENSE file in the root of YALField project

#import "YALEmailValidator.h"
#import "YALBaseValidator+YALPrivate.h"

static NSString *const kEmailSoftRegex = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
static NSString *const kEmailStrictRegex = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";

@implementation YALEmailValidator

#pragma mark - Mutators

- (void)setStrictCheck:(BOOL)strictCheck {
    _strictCheck = strictCheck;
    
    self.regex = (self.strictCheck) ? kEmailStrictRegex : kEmailSoftRegex;
}

@end

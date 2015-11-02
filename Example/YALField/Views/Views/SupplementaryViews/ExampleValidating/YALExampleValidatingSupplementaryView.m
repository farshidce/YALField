// For License please refer to LICENSE file in the root of YALField project

#import "YALExampleValidatingSupplementaryView.h"
#import "UIImage+YALExampleImages.h"

@implementation YALExampleValidatingSupplementaryView

#pragma mark - common init

- (void)commonInit {
    [super commonInit];
    self.validImage = [UIImage yal_validationValidImage];
    self.invalidImage = [UIImage yal_validationInvalidImage];
}

@end

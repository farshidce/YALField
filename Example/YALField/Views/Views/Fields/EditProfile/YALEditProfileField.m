// For License please refer to LICENSE file in the root of YALField project

#import "YALEditProfileField.h"
#import "YALField+YALPrivate.h"
#import "YALEditProfileConfigurator.h"
#import "YALExampleValidatingSupplementaryView.h"

@implementation YALEditProfileField

- (void)commonInit {
    [super commonInit];
    [self setConfigurator:[YALEditProfileConfigurator new]];
    [self setSupplementaryView:[YALExampleValidatingSupplementaryView new]];
}

@end

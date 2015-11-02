// For License please refer to LICENSE file in the root of YALField project

#import "YALRegistrationField.h"
#import "YALField+YALPrivate.h"
#import "YALRegistrationConfigurator.h"
#import "YALExampleValidatingSupplementaryView.h"

@implementation YALRegistrationField

- (void)commonInit {
    [super commonInit];
    [self setConfigurator:[YALRegistrationConfigurator new]];
    [self setSupplementaryView:[YALExampleValidatingSupplementaryView new]];
}

@end

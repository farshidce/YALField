// For License please refer to LICENSE file in the root of YALField project

#import "YALPaymentField.h"
#import "YALField+YALPrivate.h"
#import "YALPaymentConfigurator.h"
#import "YALExampleValidatingSupplementaryView.h"

@implementation YALPaymentField

- (void)commonInit {
    [super commonInit];
    [self setConfigurator:[YALPaymentConfigurator new]];
    [self setSupplementaryView:[YALExampleValidatingSupplementaryView new]];
}

@end

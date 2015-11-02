// For License please refer to LICENSE file in the root of YALField project

#import "YALLoginField.h"
#import "YALField+YALPrivate.h"
#import "YALLoginConfigurator.h"
#import "YALExampleValidatingSupplementaryView.h"

@implementation YALLoginField

- (void)commonInit {
    [super commonInit];
    [self setConfigurator:[YALLoginConfigurator new]];
    [self setSupplementaryView:[YALExampleValidatingSupplementaryView new]];
}

@end

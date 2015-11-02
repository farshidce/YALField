// For License please refer to LICENSE file in the root of YALField project

#import "YALBaseSupplementaryView.h"
#import "YALStateVaryingSupplementaryView.h"
#import "YALField.h"

@interface YALValidatingSupplementaryView : YALBaseSupplementaryView <YALStateVaryingSupplementaryView>

@property (nonatomic, strong) IBInspectable UIImage *validImage;
@property (nonatomic, strong) IBInspectable UIImage *invalidImage;
@property (nonatomic, assign) YALFieldState fieldState;

@end

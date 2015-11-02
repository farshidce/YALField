// For License please refer to LICENSE file in the root of YALField project

#import "YALResponder.h"

@protocol YALForm;

@protocol YALFormFinishResponder <YALResponder>

@optional
- (id<YALForm>)form;
- (void)setForm:(id<YALForm>)form;

@end

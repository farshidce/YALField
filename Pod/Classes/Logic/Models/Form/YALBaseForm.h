// For License please refer to LICENSE file in the root of YALField project

#import "YALForm.h"

@class YALFormFinishResponder;
@class UIButton;

@protocol YALResponder;
@protocol YALErrorsPresenter;

@interface YALBaseForm : NSObject <YALForm>

@property (nonatomic, assign) IBInspectable BOOL shouldUpdateFieldsStates;

- (void)setErrorsPresenter:(id<YALErrorsPresenter>)errorsPresenter;
- (void)setFinishResponder:(id<YALResponder>)finishResponder;
- (void)setFinishButton:(UIButton *)finishButton;

@end

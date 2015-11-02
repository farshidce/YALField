// For License please refer to LICENSE file in the root of YALField project

#import "YALField.h"
#import "YALInput.h"

@protocol YALForm;
@protocol YALInputConfigurator;
@protocol YALFormatter;
@protocol YALSupplementaryView;

@class YALPasswordSupplementaryView;

@protocol YALFieldInput <YALInput>

@required
- (UILabel *)titleView;
- (UITextField *)textField;
- (UIView *)additionalView;

@required
- (UIView<YALSupplementaryView> *)supplementaryView;
- (UIView *)passwordSupplementaryView;

@required
- (id<YALInputConfigurator>)configurator;
- (id<YALForm>)form;
- (void)setForm:(id<YALForm>)form;

@required
- (void)setFormattedValue:(NSString *)formattedValue;
- (void)setFieldState:(NSInteger)fieldState;

@required
- (void)setResponder:(id<YALResponder>)responder;
- (void)setValidator:(id<YALValidator>)validator;
- (void)setFormatter:(id<YALFormatter>)formatter;
- (void)setConfigurator:(id<YALInputConfigurator>)configurator;
- (void)setSupplementaryView:(UIView *)supplementaryView;

@required
- (void)endInput;

@required
- (NSDictionary *)dictionaryOfVariableBindings;
@end

@interface YALField (YALPrivate) <YALFieldInput>

@end

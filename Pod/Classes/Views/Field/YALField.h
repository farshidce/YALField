// For License please refer to LICENSE file in the root of YALField project

#import "YALConstraintBasedControl.h"
#import "YALInput.h"

typedef NS_ENUM(NSInteger, YALFieldState) {
    YALFieldStateClear,
    YALFieldStateValid,
    YALFieldStateInvalid
};

IB_DESIGNABLE

@interface YALField : YALConstraintBasedControl <YALInput>

@property (nonatomic, strong) IBInspectable NSString *title;
@property (nonatomic, strong) IBInspectable NSString *placeholder;
@property (nonatomic, strong) id rawValue;
@property (nonatomic, strong, readonly) NSString *formattedValue;
@property (nonatomic, assign, readonly) YALFieldState fieldState;
@property (nonatomic, assign) IBInspectable BOOL inputEnabled;
@property (nonatomic, assign) IBInspectable BOOL secured;
@property (nonatomic, assign) IBInspectable BOOL debugMode;

@end

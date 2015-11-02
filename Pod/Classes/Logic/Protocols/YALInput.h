// For License please refer to LICENSE file in the root of YALField project

#import "YALResponder.h"

@protocol YALResponder;
@protocol YALValidator;
@protocol YALFormatter;

@protocol YALInput <YALResponder>

@required
@property (nonatomic, strong) id rawValue;
@property (nonatomic, strong, readonly) NSString *formattedValue;
@property (nonatomic, assign, readonly) NSInteger fieldState;
@property (nonatomic, assign) BOOL inputEnabled;
@property (nonatomic, assign) BOOL enabled;

@required
- (void)setRawValue:(id)rawValue;
- (void)setFieldState:(NSInteger)fieldState;
- (void)clear;

@required
- (id<YALResponder>)responder;
- (id<YALFormatter>)formatter;
- (id<YALValidator>)validator;

@end

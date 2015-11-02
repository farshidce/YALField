// For License please refer to LICENSE file in the root of YALField project

#import <UIKit/UIKit.h>

@interface UIColor (YALFieldColors)

+ (instancetype)yal_fieldColorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;
+ (instancetype)yal_fieldInputTitleTextColor;
+ (instancetype)yal_fieldinputPlaceholderTextColor;
+ (instancetype)yal_fieldInputTextColor;
+ (instancetype)yal_fieldValidInputTextColor;
+ (instancetype)yal_fieldInvalidInputTextColor;
+ (instancetype)yal_fieldOrangeColor;

@end

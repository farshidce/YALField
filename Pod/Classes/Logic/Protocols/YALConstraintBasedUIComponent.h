// For License please refer to LICENSE file in the root of YALField project

#import <Foundation/Foundation.h>

@protocol YALConstraintBasedUIComponent <NSObject>

@required
- (void)commonInit;
- (void)addSubviews;
- (void)configureSubviews;
- (BOOL)requiresConstraintBasedLayout;
- (void)setupConstraints;

@optional
- (void)updateConstraints; // be sure to call super at the end of the method if you would override it
- (void)prepareForInterfaceBuilder;

@end

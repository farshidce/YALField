// For License please refer to LICENSE file in the root of YALField project

#import "YALBaseForm.h"

@class YALField;

@interface YALRegistrationForm : YALBaseForm

@property (nonatomic, weak) IBOutlet YALField *name;
@property (nonatomic, weak) IBOutlet YALField *phone;
@property (nonatomic, weak) IBOutlet YALField *email;
@property (nonatomic, weak) IBOutlet YALField *password;

@end

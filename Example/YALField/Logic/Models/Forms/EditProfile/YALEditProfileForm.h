// For License please refer to LICENSE file in the root of YALField project

#import "YALBaseForm.h"

@class YALField;

@interface YALEditProfileForm : YALBaseForm

@property (nonatomic, weak) IBOutlet YALField *name;
@property (nonatomic, weak) IBOutlet YALField *phone;
@property (nonatomic, weak) IBOutlet YALField *birthDate;
@property (nonatomic, weak) IBOutlet YALField *email;

@end

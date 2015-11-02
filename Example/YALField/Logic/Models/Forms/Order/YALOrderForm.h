// For License please refer to LICENSE file in the root of YALField project

#import "YALBaseForm.h"

@class YALField;

@interface YALOrderForm : YALBaseForm

@property (nonatomic, weak) IBOutlet YALField *pizza;
@property (nonatomic, weak) IBOutlet YALField *amount;
@property (nonatomic, weak) IBOutlet YALField *deliveryTime;
@property (nonatomic, weak) IBOutlet YALField *address;
@property (nonatomic, weak) IBOutlet YALField *comment;


@end

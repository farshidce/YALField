// For License please refer to LICENSE file in the root of YALField project

#import "YALBaseForm.h"

@class YALField;

@interface YALPaymentForm : YALBaseForm

@property (nonatomic, weak) IBOutlet YALField *tip;
@property (nonatomic, weak) IBOutlet YALField *creditCard;
@property (nonatomic, weak) IBOutlet YALField *expirationDate;
@property (nonatomic, weak) IBOutlet YALField *cvv;

@end

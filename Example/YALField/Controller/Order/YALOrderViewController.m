// For License please refer to LICENSE file in the root of YALField project

#import "YALOrderViewController.h"
#import "YALFormFinishResponder.h"
#import "YALOrderForm.h"
#import "YALCustomResponder.h"
#import "YALField.h"
#import "YALField+YALPrivate.h"

static const CGFloat kViewVisibleAlpha = 1.f;
static const CGFloat kViewHiddenAlpha = 0.f;
static const NSTimeInterval kAnimationDuration = 0.3;

@interface YALOrderViewController () <YALFormFinishResponder, UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong) YALOrderForm *form;

@property (nonatomic, weak) IBOutlet YALField *pizzaField;
@property (nonatomic, weak) IBOutlet YALField *deliveryTimeField;
@property (nonatomic, weak) IBOutlet YALCustomResponder *deliveryTimeResponder;
@property (nonatomic, weak) IBOutlet YALCustomResponder *pizzaResponder;
@property (nonatomic, weak) IBOutlet UIDatePicker *deliveryTimeDatePicker;
@property (nonatomic, weak) IBOutlet UIPickerView *pizzaPickerView;
@property (nonatomic, weak) IBOutlet UIView *pickersContainerView;
@property (nonatomic, weak) IBOutlet UIButton *doneButton;
@property (nonatomic, strong) IBOutletCollection(UIView) NSArray *viewsToHideWhenPickerPresented;

@property (nonatomic, strong) NSArray *pizzas;

@end

@implementation YALOrderViewController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.deliveryTimeDatePicker setValue:[UIColor whiteColor] forKey:@"textColor"];
    
    self.pizzas = @[@"Margherita", @"Funghi", @"Capricciosa", @"Quattro Stagioni", @"Vegetariana", @"Quattro Formaggi", @"Marinara", @"Peperoni", @"Napolitana", @"Hawaii", @"Maltija", @"Calzone", @"Rucola", @"Bolognese", @"Meat Feast", @"Kebabpizza", @"Mexicana"];
    // list of pizzas taken from https://en.wikipedia.org/wiki/List_of_pizza_varieties_by_country#Malta
    
    [self.deliveryTimeResponder setActionBlock:^{
        [self presentTimePicker];
    }];
    
    [self.pizzaResponder setActionBlock:^{
        [self presentPizzaPicker];
    }];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.pizzas count];
}

#pragma mark - UIPickerViewDelegate

- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSString *pizza = self.pizzas[row];
    NSDictionary *attributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    return [[NSAttributedString alloc] initWithString:pizza attributes:attributes];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSString *pizza = self.pizzas[row];
    [self.pizzaField setRawValue:pizza];
    [self.pizzaField endInput];
}

#pragma mark - YALFormFinishResponder

- (void)performAction:(id)sender {
    [self pretendToDoSomeNetworkRequestWithWithTitle:@"Creating order" completion:^{
        [self performSegueWithIdentifier:@"OrderToPayment" sender:self];
    }];
}

#pragma mark - Action

- (IBAction)timePicked:(UIDatePicker *)timePicker {
    [self.deliveryTimeField setRawValue:timePicker.date];
    [self.pizzaField endInput];
}

- (IBAction)doneButtonTapped {
    [self hidePicker];
    [self hidePickerDoneButton];
}

#pragma mark - Helper methods

- (void)presentTimePicker {
    [self showPickerDoneButton];
    [UIView animateWithDuration:kAnimationDuration animations:^{
        self.pickersContainerView.alpha = kViewVisibleAlpha;
        self.deliveryTimeDatePicker.alpha = kViewVisibleAlpha;
    }];
}

- (void)presentPizzaPicker {
    [self showPickerDoneButton];
    [UIView animateWithDuration:kAnimationDuration animations:^{
        self.pickersContainerView.alpha = kViewVisibleAlpha;
        self.pizzaPickerView.alpha = kViewVisibleAlpha;
    }];
}

- (void)hidePicker {
    UIView *picker = (self.deliveryTimeDatePicker.alpha) ? self.deliveryTimeDatePicker : self.pizzaPickerView;
    
    [UIView animateWithDuration:kAnimationDuration animations:^{
        self.pickersContainerView.alpha = kViewHiddenAlpha;
        picker.alpha = kViewHiddenAlpha;
    }];
}

- (void)showPickerDoneButton {
    [UIView animateWithDuration:kAnimationDuration animations:^{
        self.doneButton.alpha = kViewVisibleAlpha;
        
        for (UIView *view in self.viewsToHideWhenPickerPresented) {
            view.alpha = kViewHiddenAlpha;
        }
    }];
}

- (void)hidePickerDoneButton {
    [UIView animateWithDuration:kAnimationDuration animations:^{
        self.doneButton.alpha = kViewHiddenAlpha;
        
        for (UIView *view in self.viewsToHideWhenPickerPresented) {
            view.alpha = kViewVisibleAlpha;
        }
    }];
}

@end

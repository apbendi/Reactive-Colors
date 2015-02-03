//
//  ViewController.m
//  Reactive Colors
//
//  Created by Ben DiFrancesco on 1/31/15.
//  Copyright (c) 2015 Ben DiFrancesco. All rights reserved.
//

#import <ReactiveCocoa/ReactiveCocoa.h>

#import "RICPickerViewController.h"
#import "RICPickerViewModel.h"

@interface RICPickerViewController ()
@property (nonatomic) RICPickerViewModel *viewModel;
@end

@implementation RICPickerViewController

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self == nil) return nil;

    self.viewModel = [[RICPickerViewModel alloc] init];

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    RAC(self.viewModel, red) = [RICPickerViewController signalForValueOnChangeOfSlider:self.redSlider];
    RAC(self.viewModel, green) = [RICPickerViewController signalForValueOnChangeOfSlider:self.greenSlider];
    RAC(self.viewModel, blue) = [RICPickerViewController signalForValueOnChangeOfSlider:self.blueSlider];
    RAC(self.viewModel, alpha) = [[[self.alphaStepper
                                    rac_signalForControlEvents:UIControlEventValueChanged]
                                   map:^NSNumber *(UIStepper *stepper) {
                                      return @(stepper.value);
                                  }]
                                  startWith:@(self.alphaStepper.value)];


    RAC(self.colorView, backgroundColor) = RACObserve(self.viewModel, color);
    RAC(self.alphaLabel, text) = RACObserve(self.viewModel, alphaPercent);

}

+ (RACSignal *)signalForValueOnChangeOfSlider:(UISlider *)slider
{
    NSNumber *(^mapBlock)(UISlider *slider) = ^NSNumber *(UISlider *slider) {
        return @(slider.value);
    };
   

    return [[[slider
              rac_signalForControlEvents:UIControlEventValueChanged]
             map:mapBlock]
            startWith:@(slider.value)];
}

@end

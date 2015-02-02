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
    // Do any additional setup after loading the view, typically from a nib.

    RACSignal *greenSliderChangedSignal = [self.greenSlider rac_signalForControlEvents:UIControlEventValueChanged];

    RACSignal *greenValueSignal = [[greenSliderChangedSignal map:^id(UISlider *sender) {
        return [NSNumber numberWithFloat:sender.value];
    }] startWith:@(self.greenSlider.value)];

    RACSignal *redValueSignal = [[[self.redSlider rac_signalForControlEvents:UIControlEventValueChanged]
                                 map:^id(UISlider *slider) {
        return @(slider.value);
    }] startWith:@(self.redSlider.value)];

    RACSignal *blueValueSignal = [[[self.blueSlider rac_signalForControlEvents:UIControlEventValueChanged]
      map:^NSNumber *(UISlider *slider) {
        return @(slider.value);
      }] startWith:@(self.blueSlider.value)];


    RAC(self.viewModel, red) = redValueSignal;
    RAC(self.viewModel, green) = greenValueSignal;
    RAC(self.viewModel, blue) = blueValueSignal;

    [RACObserve(self.viewModel, color) subscribeNext:^(UIColor *color) {
        self.colorView.backgroundColor = color;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

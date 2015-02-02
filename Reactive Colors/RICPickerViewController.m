//
//  ViewController.m
//  Reactive Colors
//
//  Created by Ben DiFrancesco on 1/31/15.
//  Copyright (c) 2015 Ben DiFrancesco. All rights reserved.
//

#import <ReactiveCocoa/ReactiveCocoa.h>

#import "RICPickerViewController.h"
#import "RICPickerController.h"
#import "RICPickerViewModel.h"

@interface RICPickerViewController ()
@property (nonatomic) RICPickerController *controller;
@end

@implementation RICPickerViewController

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self == nil) return nil;

    self.controller = [[RICPickerController alloc] init];

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

    RAC(self.controller, red) = redValueSignal;
    RAC(self.controller, blue) = blueValueSignal;
    RAC(self.controller, green) = greenValueSignal;

    [RACObserve(self.controller, viewModel) subscribeNext:^(RICPickerViewModel *viewModel) {
        self.colorView.backgroundColor = viewModel.color;
    }];




//    RACSignal *colorSignal = [RACSignal
//                              combineLatest:(@[redValueSignal, greenValueSignal, blueValueSignal])
//                              reduce:^(NSNumber *redValue, NSNumber *greenValue, NSNumber *blueValue){
//
//                                  return [UIColor colorWithRed:[redValue floatValue] green:[greenValue floatValue] blue:[blueValue floatValue] alpha:1.0f];
//                              }];
//
//    RAC(self.colorView, backgroundColor) = colorSignal;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

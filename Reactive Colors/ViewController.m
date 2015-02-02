//
//  ViewController.m
//  Reactive Colors
//
//  Created by Ben DiFrancesco on 1/31/15.
//  Copyright (c) 2015 Ben DiFrancesco. All rights reserved.
//

#import <ReactiveCocoa/ReactiveCocoa.h>

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

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

    RACSignal *colorSignal = [RACSignal
                              combineLatest:(@[redValueSignal, greenValueSignal, blueValueSignal])
                              reduce:^(NSNumber *redValue, NSNumber *greenValue, NSNumber *blueValue){

                                  return [UIColor colorWithRed:[redValue floatValue] green:[greenValue floatValue] blue:[blueValue floatValue] alpha:1.0f];
                              }];

    RAC(self.colorView, backgroundColor) = colorSignal;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

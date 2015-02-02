//
//  RICPickerController.m
//  Reactive Colors
//
//  Created by Ben DiFrancesco on 2/2/15.
//  Copyright (c) 2015 Ben DiFrancesco. All rights reserved.
//

#import <ReactiveCocoa/ReactiveCocoa.h>
#import "RICPickerController.h"
#import "RICPickerViewModel.h"
#import "RICColorModel.h"

@interface RICPickerController ()
@property (nonatomic, readwrite) RICPickerViewModel *viewModel;
@property (nonatomic) RICColorModel *model;
@end

@implementation RICPickerController

- (id)init
{
    self = [super init];
    if (self == nil) return nil;

    self.model = [[RICColorModel alloc] init];
    self.alpha = 1;

    RAC(self, viewModel) =
    [RACSignal
     combineLatest:@[RACObserve(self, red), RACObserve(self, green), RACObserve(self, blue), RACObserve(self, alpha)]
     reduce:^RICPickerViewModel*(NSNumber *redValue, NSNumber *greenValue, NSNumber *blueValue, NSNumber *alphaValue){


         NSLog(@"Combined; (%@, %@, %@, %@)", redValue, greenValue, blueValue, alphaValue);

         self.model.red = [redValue floatValue];
         self.model.blue = [blueValue floatValue];
         self.model.green = [greenValue floatValue];
         self.model.alpha = [alphaValue floatValue];

         return [[RICPickerViewModel alloc] initWithModel:self.model];
    }];

    return self;
}

@end

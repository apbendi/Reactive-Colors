//
//  RICPickerViewModel.m
//  Reactive Colors
//
//  Created by Ben DiFrancesco on 2/2/15.
//  Copyright (c) 2015 Ben DiFrancesco. All rights reserved.
//

#import <ReactiveCocoa/ReactiveCocoa.h>

#import "RICPickerViewModel.h"
#import "RICColor.h"

@interface RICPickerViewModel ()
@property (nonatomic) RICColor *colorModel;
@end

@implementation RICPickerViewModel

- (id)init
{
    self = [super init];
    if (self == nil) return nil;

    self.colorModel = [[RICColor alloc] init];


    RAC(self.colorModel, red) = RACObserve(self, red);
    RAC(self.colorModel, green) = RACObserve(self, green);
    RAC(self.colorModel, blue) = RACObserve(self, blue);
    RAC(self.colorModel, alpha) = RACObserve(self, alpha);

    RAC(self, color) =
    [RACSignal
     combineLatest:@[RACObserve(self.colorModel, red), RACObserve(self.colorModel, green), RACObserve(self.colorModel, blue), RACObserve(self.colorModel, alpha)]
     reduce:^UIColor *(NSNumber *red, NSNumber *green, NSNumber *blue, NSNumber *alpha){
         NSLog(@"Hello from Combined");
         return [UIColor colorWithRed:[red floatValue] green:[green floatValue] blue:[blue floatValue] alpha:[alpha floatValue]];
    }];

    RAC(self, alphaPercent) = [RACObserve(self.colorModel, alpha) map:^NSString *(NSNumber *alpha) {
        int percent = [alpha floatValue] * 100;
        return [NSString stringWithFormat:@"%i%%", percent, nil];
    }];

    return self;
}

@end

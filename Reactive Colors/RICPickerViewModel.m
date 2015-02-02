//
//  RICPickerViewModel.m
//  Reactive Colors
//
//  Created by Ben DiFrancesco on 2/2/15.
//  Copyright (c) 2015 Ben DiFrancesco. All rights reserved.
//

#import "RICPickerViewModel.h"
#import "RICColorModel.h"

@interface RICPickerViewModel ()
@property (nonatomic, readwrite) UIColor *color;
@end

@implementation RICPickerViewModel

- (id)initWithModel:(RICColorModel *)model
{
    self = [super init];
    if (self == nil) return nil;

    self.color = [UIColor colorWithRed:model.red green:model.green blue:model.blue alpha:model.alpha];

    return self;
}

@end

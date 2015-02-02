//
//  RICPickerViewModel.h
//  Reactive Colors
//
//  Created by Ben DiFrancesco on 2/2/15.
//  Copyright (c) 2015 Ben DiFrancesco. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RICColorModel;

@interface RICPickerViewModel : NSObject

- (id)initWithModel:(RICColorModel *)model;

@property (nonatomic, readonly) UIColor *color;

@end

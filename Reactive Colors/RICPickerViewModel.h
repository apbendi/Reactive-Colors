//
//  RICPickerViewModel.h
//  Reactive Colors
//
//  Created by Ben DiFrancesco on 2/2/15.
//  Copyright (c) 2015 Ben DiFrancesco. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RICPickerViewModel : NSObject

@property (nonatomic, readonly) UIColor *color;

@property (nonatomic) float red;
@property (nonatomic) float blue;
@property (nonatomic) float green;
@property (nonatomic) float alpha;

@end

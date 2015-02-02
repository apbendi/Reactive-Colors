//
//  RICPickerController.h
//  Reactive Colors
//
//  Created by Ben DiFrancesco on 2/2/15.
//  Copyright (c) 2015 Ben DiFrancesco. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RICPickerViewModel;

@interface RICPickerController : NSObject

@property (nonatomic, readonly) RICPickerViewModel *viewModel;

@property (nonatomic, assign) float red;
@property (nonatomic, assign) float blue;
@property (nonatomic, assign) float green;
@property (nonatomic, assign) float alpha;

@end

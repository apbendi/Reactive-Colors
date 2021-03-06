//
//  ViewController.h
//  Reactive Colors
//
//  Created by Ben DiFrancesco on 1/31/15.
//  Copyright (c) 2015 Ben DiFrancesco. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RICPickerViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISlider *redSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueSlider;
@property (weak, nonatomic) IBOutlet UIStepper *alphaStepper;
@property (weak, nonatomic) IBOutlet UILabel *alphaLabel;
@property (weak, nonatomic) IBOutlet UIView *colorView;

@end


//
//  CNViewController.m
//  ColourNamer
//
//  Created by Neil Taylor on 19/01/2013.
//  Copyright (c) 2013 Aberystwyth University. All rights reserved.
//

#import "CNViewController.h"
#import "CNNamerViewController.h"

@interface CNViewController ()

@property (weak, nonatomic) IBOutlet UISlider *redSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueSlider;
@property (weak, nonatomic) IBOutlet UILabel *colourLabel;

@end

@implementation CNViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self resetColour: nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (UIColor *) calculateColor {
    return [UIColor colorWithRed: [self.redSlider value]
                           green: [self.greenSlider value]
                            blue: [self.blueSlider value]
                           alpha: 1.0];
}

-(void) updateBackgroundColour {
    UIView *myView = [self view];
    myView.backgroundColor = [self calculateColor];
}

- (IBAction)sliderUpdated:(id)sender {
    
    self.view.backgroundColor = [self calculateColor];
    self.colourLabel.text = @"Unknown";
    
}

- (IBAction)resetColour:(id)sender {
    self.redSlider.value = 0.5;
    self.blueSlider.value = 0.5;
    self.greenSlider.value = 0.5;
    [self updateBackgroundColour];
    self.colourLabel.text = @"Mid-Gray";
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    CNNamerViewController *namer = [segue destinationViewController];
    namer.view.backgroundColor = [self calculateColor];
}

- (IBAction) confirmSetName: (UIStoryboardSegue *) segue {
    NSLog(@"Confirm the set name");
    CNNamerViewController *namer = [segue sourceViewController];
    self.colourLabel.text = [[namer nameField] text];
    
}

- (IBAction) cancelSetName: (UIStoryboardSegue *) segue {
    NSLog(@"Cancel set name operation");
}


@end

//
//  ViewController.m
//  HelloWorldSetLabel
//
//  Created by Neil Taylor on 18/01/2013.
//  Copyright (c) 2013 Aberystwyth University. All rights reserved.
//

#import "HelloWorldSetViewController.h"

@interface HelloWorldSetViewController ()

@property (strong, nonatomic) IBOutlet UILabel *outputLabel;

@end

@implementation HelloWorldSetViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self.outputLabel setText: @"Hello World, from Objective-C"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

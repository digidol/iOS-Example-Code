//
//  DetailViewController.h
//  StaticTables
//
//  Created by Neil Taylor on 22/05/2014.
//  Copyright (c) 2014 Aberystwyth University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end

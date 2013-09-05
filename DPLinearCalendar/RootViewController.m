//
//  RootViewController.m
//  DPLinearCalendar
//
//  Created by Kostas Antonopoulos on 9/28/12.
//  Copyright (c) 2012 Kostas Antonopoulos. All rights reserved.
//

#import "RootViewController.h"
#import "DPLinearCalendarScrollView.h"

@interface RootViewController (){
    
    __weak IBOutlet DPLinearCalendarScrollView *linearCalendar;
}

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [linearCalendar setWrapEnabled:NO];

    // Do any additional setup after loading the view from its nib.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [linearCalendar setSelectedDate:[NSDate date]];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

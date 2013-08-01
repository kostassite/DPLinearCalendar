//
//  DPLinearCalendarCell.m
//  DPLinearCalendar
//
//  Created by Kostas Antonopoulos on 9/28/12.
//  Copyright (c) 2012 Kostas Antonopoulos. All rights reserved.
//

#import "DPLinearCalendarCell.h"

@implementation DPLinearCalendarCell
@synthesize cellDate = _cellDate;

- (DPLinearCalendarCell*)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];

    if (self) {
        
    }
    return self;
}

-(void)setCellDate:(NSDate *)cellDate{
    _cellDate = cellDate;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components=[calendar components:NSDayCalendarUnit fromDate:cellDate];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"E"];
    
    UILabel *dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 2, self.frame.size.width-5, 15)];
    [dateLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:8]];
    [dateLabel setTextAlignment:NSTextAlignmentCenter];
    [dateLabel setBackgroundColor:[UIColor clearColor]];
    [dateLabel setTextColor:[UIColor whiteColor]];
    [dateLabel setText:[NSString stringWithFormat:@"%@",[[dateFormatter stringFromDate:cellDate] uppercaseString]]];
    [self addSubview:dateLabel];

    UILabel *numLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 14, self.frame.size.width-5, 30)];
    [numLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:23]];
    [numLabel setTextAlignment:NSTextAlignmentCenter];
    [numLabel setBackgroundColor:[UIColor clearColor]];
    [numLabel setTextColor:[UIColor whiteColor]];
    [numLabel setText:[NSString stringWithFormat:@"%d",[components day]]];
    
    [self addSubview:numLabel];
}

@end

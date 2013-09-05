//
//  DPLinearCalendarCell.m
//  DPLinearCalendar
//
//  Created by Kostas Antonopoulos on 9/28/12.
//  Copyright (c) 2012 Kostas Antonopoulos. All rights reserved.
//

#import "DPLinearCalendarCell.h"
#import "DPLinearCalendarScrollView.h"

@interface DPLinearCalendarCell () {
    UIView *selectedBgView;
    UIButton *btn;
}

@end

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
    
    //transparent btn for selection
    btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:self.bounds];
    [btn addTarget:self action:@selector(cellPressed:) forControlEvents:UIControlEventTouchDown];
    [self addSubview:btn   ];
}

+(CGFloat)cellWidth{
    return 65;
}

-(void)selectCell{
    if (!selectedBgView) {
        selectedBgView = [[UIView alloc]initWithFrame:CGRectMake(10, 14, self.frame.size.width-25, 30)];
        [selectedBgView setBackgroundColor:[UIColor redColor]];
    }
    [self insertSubview:selectedBgView atIndex:0];
}

-(void)unselectCell{
    [selectedBgView removeFromSuperview];
}

-(void)cellPressed:(UIButton*)sender{
    [self.linearCalendar setSelectedDate:self.cellDate];
}

@end

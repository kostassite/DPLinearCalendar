//
//  DPLinearCalendarCell.m
//  DPLinearCalendar
//
//  Created by Kostas Antonopoulos on 9/28/12.
//  Copyright (c) 2012 Kostas Antonopoulos. All rights reserved.
//

#import "DPLinearCalendarCell.h"

@implementation DPLinearCalendarCell
@synthesize cellDate;
+ (DPLinearCalendarCell*)cell
{
    NSArray *nibArray= [[NSBundle mainBundle] loadNibNamed:@"DPLinearCalendarCell" owner:self options:nil];
    for (id view in nibArray) {
        if ([view isKindOfClass:[UIView class]]) {
            return view;
        }
    }
    return nil;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

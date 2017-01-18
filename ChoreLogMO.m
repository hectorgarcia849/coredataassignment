//
//  ChoreLogMO.m
//  coredataassignment
//
//  Created by Hector Garcia on 2017-01-12.
//  Copyright © 2017 Hector Garcia. All rights reserved.
//

#import "ChoreLogMO.h"
#import "ChoreMO.h"
#import "PersonMO.h"

@implementation ChoreLogMO

// Insert code here to add functionality to your managed object subclass

- (NSString *) description {
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateStyle:NSDateFormatterMediumStyle];
    dateFormat.locale = [[NSLocale alloc] initWithLocaleIdentifier: @"en_US"];
    
    NSDateFormatter *timeFormat = [[NSDateFormatter alloc] init];
    [timeFormat setDateFormat:@"h:mm a"];
    
    NSString *date = [dateFormat stringFromDate:self.when];
    NSString *time = [timeFormat stringFromDate:self.when];
    
    return [NSString stringWithFormat:@"%@    %@    %@  %@", self.person_who_did_it.person_name, self.chore_done.chore_name, date, time];
}

@end

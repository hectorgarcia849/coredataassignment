//
//  ChoreLogMO.h
//  coredataassignment
//
//  Created by Hector Garcia on 2017-01-12.
//  Copyright © 2017 Hector Garcia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ChoreMO, PersonMO;

NS_ASSUME_NONNULL_BEGIN

@interface ChoreLogMO : NSManagedObject

- (NSString *) description;
@end

NS_ASSUME_NONNULL_END

#import "ChoreLogMO+CoreDataProperties.h"

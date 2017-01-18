//
//  PersonMO+CoreDataProperties.h
//  coredataassignment
//
//  Created by Hector Garcia on 2017-01-12.
//  Copyright © 2017 Hector Garcia. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "PersonMO.h"

NS_ASSUME_NONNULL_BEGIN

@interface PersonMO (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *person_name;
@property (nullable, nonatomic, retain) NSSet<ChoreLogMO *> *chorelog;

@end

@interface PersonMO (CoreDataGeneratedAccessors)

- (void)addChorelogObject:(ChoreLogMO *)value;
- (void)removeChorelogObject:(ChoreLogMO *)value;
- (void)addChorelog:(NSSet<ChoreLogMO *> *)values;
- (void)removeChorelog:(NSSet<ChoreLogMO *> *)values;

@end

NS_ASSUME_NONNULL_END

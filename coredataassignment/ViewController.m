//
//  ViewController.m
//  coredataassignment
//
//  Created by Hector Garcia on 2017-01-12.
//  Copyright © 2017 Hector Garcia. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()
@property (nonatomic) AppDelegate *appDelegate;
@property (weak, nonatomic) IBOutlet UITextField *personTextField;
@property (weak, nonatomic) IBOutlet UITextField *choreTextField;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (strong, nonatomic) ChoreLogMO *localCL;
@property (weak, nonatomic) IBOutlet UILabel *persistedData;
@property (weak, nonatomic) IBOutlet UILabel *numLabel;

@end

@implementation ViewController
- (IBAction)choreTextField:(id)sender {
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //allows us to retreive the managedobjectcontext
    self.appDelegate = [[UIApplication sharedApplication] delegate];
    
    //show persisteddata on view load
    [self updateLogList];
}

- (IBAction)addChoreTapped:(id)sender {
    //access the appdelegate context, call createChoreMO
    ChoreMO *c = [self.appDelegate createChoreMO];
    c.chore_name = self.choreTextField.text;
    PersonMO *p = [self.appDelegate createPersonMO];
    p.person_name = self.personTextField.text;
    self.localCL = [self.appDelegate createChoreLogMO];
    self.localCL.when = self.datePicker.date;
    
    //links from ChoreMO and PersonMO to ChoreLogMO.
    self.localCL.person_who_did_it = p;
    self.localCL.chore_done = c;
    
    [self.appDelegate saveContext];
    [self updateLogList];
    NSLog(@"person: %@, chore: %@, date: %@", p.person_name, c.chore_name, self.localCL.when);
}

- (IBAction)deleteChoreTapped:(id)sender {
    
    //delete person
    NSManagedObjectContext *moc = self.appDelegate.managedObjectContext;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"PersonEntity"];
    NSError *error = nil;
    NSArray *results = [moc executeFetchRequest:request error:&error];
    
    if(!results) {
        NSLog(@"Error fetching Person objects: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
    //deletes personmo objects in managed object context
    for(PersonMO *c in results) {
        [moc deleteObject:c];
    }
    
    //delete chore
    request = [NSFetchRequest fetchRequestWithEntityName:@"ChoreEntity"];
    results = [moc executeFetchRequest:request error:&error];
    
    if(!results) {
        NSLog(@"Error fetching Person objects: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
    //deletes choremo objects in managed object context
    for(ChoreMO *c in results) {
        [moc deleteObject:c];
    }
    
    //delete chorelog
    request = [NSFetchRequest fetchRequestWithEntityName:@"ChoreLogEntity"];
    results = [moc executeFetchRequest:request error:&error];
    
    if(!results) {
        NSLog(@"Error fetching Person objects: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
    //deletes chorelogmo objects in managed object context
    for(ChoreLogMO *c in results) {
        [moc deleteObject:c];
    }
    
    //context saved to persist data
    [self.appDelegate saveContext];
    //view updated
    [self updateLogList];
}



//fills out the label with data from the database.  Need iterator to go thru all elements in the database.

- (void) updateLogList {
    NSManagedObjectContext *moc = self.appDelegate.managedObjectContext;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"ChoreLogEntity"];
    NSError *error = nil;
    //stores results fetched in array
    NSArray *results = [moc executeFetchRequest:request error:&error];
    if(!results) {
        NSLog(@"Error fetching ChoreLogMO objects: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
    
    NSMutableString *buffer = [NSMutableString stringWithString:@""];
    
    for(ChoreLogMO *c in results) {
        [buffer appendFormat:@"\n%@", c, nil];
    }
    //display in label
    self.persistedData.text = buffer;
    
    [self updateNumLabel];
}

- (void) updateNumLabel {
    NSManagedObjectContext *moc = self.appDelegate.managedObjectContext;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"ChoreLogEntity"];
    NSError *error = nil;
    //stores results fetched in array
    NSArray *results = [moc executeFetchRequest:request error:&error];
    if(!results) {
        NSLog(@"Error fetching ChoreLogMO objects: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
    
    NSString *count = [NSString stringWithFormat:@"%lu", [results count]];
    self.numLabel.text = count;
}


@end

//
//  PlaceDetailsVC.m
//  shizzeeps
//
//  Created by Sue Brown on 11/27/09.
//  Copyright 2009 House of Crunchy. All rights reserved.
//

#import "PlaceDetailsVC.h"


@implementation PlaceDetailsVC

@synthesize thePlace;

/*
- (id)initWithStyle:(UITableViewStyle)style {
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    if (self = [super initWithStyle:style]) {
    }
    return self;
}
*/


- (void)viewDidLoad {
    [super viewDidLoad];

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
	self.navigationItem.title = self.thePlace.name;
}


/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return section == 1 ? [self.thePlace.people count] : 1;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    	
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle 
									   reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Set up the cell...
	
	NSString *curPlaceName = nil;
	NSString *pop = nil;
	NSString *addr = nil;
	NSString *curPersonName = nil;
	NSDictionary *curPerson = nil;
	NSArray *curMsgs = nil;
	NSString *msgsKey = nil;
	
	switch (indexPath.section) {
			
		// Population
		case 0:
			pop = self.thePlace.population;
			cell.textLabel.text = [NSString stringWithFormat:@"Population: %@", pop];
			break;
			
		// One cell for each person
		case 1:
			curPersonName = [self.thePlace.people objectAtIndex:indexPath.row];
			cell.textLabel.text = curPersonName;
			curPerson = [self.thePlace.shouts objectForKey:curPersonName];
			msgsKey = [NSString stringWithFormat:@"messages_from_%@", curPersonName];
			curMsgs = [[curPerson objectForKey:msgsKey] allValues];
			cell.detailTextLabel.text = [curMsgs description];
			break;
			
		// The place's address
		case 2:	
			curPlaceName = self.thePlace.name;
			addr = [NSString stringWithFormat:@"%@\n%@\n%@\n%@, %@  %@\n%@", 
							  curPlaceName, self.thePlace.address1, self.thePlace.address2,
							  self.thePlace.city, self.thePlace.state, self.thePlace.zip, self.thePlace.website];

			placeAddr = [[UITextView alloc] initWithFrame:CGRectMake(10, 10, 285, 75)];
			placeAddr.returnKeyType = UIReturnKeyDone;
			placeAddr.text = addr;
			[cell.contentView addSubview:placeAddr];
			break;
			
		default:
			break;
	}
	
	
	
    return cell;
}



// implement this callback from the UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView 
heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	// tableView.rowHeight is the default row height for a table
	return indexPath.section == 2 ? 95 : tableView.rowHeight;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	// we could have used nil instead of the empty string
	return section == 2 ? @"Address" : @"";
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	// AnotherViewController *anotherViewController = [[AnotherViewController alloc] initWithNibName:@"AnotherView" bundle:nil];
	// [self.navigationController pushViewController:anotherViewController];
	// [anotherViewController release];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/




- (void)dealloc {
    [super dealloc];
}


@end


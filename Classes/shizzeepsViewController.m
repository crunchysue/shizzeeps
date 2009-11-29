//
//  shizzeepsViewController.m
//  shizzeeps
//
//  Created by Sue Brown on 11/25/09.
//  Copyright 2009 House of Crunchy. All rights reserved.
//

#import "shizzeepsViewController.h"
#import "discovery.h"
#import "PlaceDetailsVC.h"



@implementation shizzeepsViewController

@synthesize oShizzeeps;


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
	
	self.navigationItem.title = @"Shizzeeps";
}



- (void)viewWillAppear:(BOOL)animated {
	 [super viewWillAppear:animated];
	
	oShizzeeps = [[shizzeeps alloc] init];
	[oShizzeeps init:self requestSelector:@selector(displayShizzeeps)];
}

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


#pragma mark -
#pragma mark Callback from shizzeeps

/* displayShizzeeps
 After the shizzeeps object has all its data loaded, this is the 
 callback function that it calls. This has to be done because we can't
 show the tableview until we have the data.
 -------------------------------------------------------------------------- */
- (void) displayShizzeeps {
	[shizzeepsTable reloadData];
}




#pragma mark -
#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    int numRows = oShizzeeps.count;
	//NSLog(@"i am a table and i have %i rows", numRows);
	return numRows;	
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Set up the cell...	
	
	place *curPlace = [oShizzeeps.places objectAtIndex:indexPath.row];
	NSString *curPlaceName = curPlace.name;
	NSString *pop = curPlace.population;
	
	cell.textLabel.text = [NSString stringWithFormat:@"%@: %@", pop, curPlaceName];
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	cell.detailTextLabel.text = curPlace.peopleList;
	
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {	
	
	PlaceDetailsVC *details = [[PlaceDetailsVC alloc] initWithStyle:UITableViewStyleGrouped];
	details.thePlace = [oShizzeeps.places objectAtIndex:indexPath.row];
		
	[self.navigationController pushViewController:details animated:YES];

	[details release];
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
	[oShizzeeps release];
}


@end


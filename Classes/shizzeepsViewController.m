//
//  shizzeepsViewController.m
//  shizzeeps
//
//  Created by Sue Brown on 11/7/09.
//  Copyright House of Crunchy 2009. All rights reserved.
//

#import "shizzeepsViewController.h"
#import "discovery.h"

@implementation shizzeepsViewController

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	oShizzeeps = [[shizzeeps alloc] init];
	[oShizzeeps init:self requestSelector:@selector(displayShizzeeps)];
	
}


- (void)dealloc {
    [super dealloc];
	[oShizzeeps release];
	[shizzeepsTable release];
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
#pragma mark TableView methods


// fill the cells
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	// boilerplate
	static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle 
									   reuseIdentifier:CellIdentifier] autorelease];
    
	// Configure the cell.	
	
	place *curPlace = [oShizzeeps.places objectAtIndex:indexPath.row];
	NSString *curPlaceName = curPlace.name;
	NSString *pop = curPlace.population;
	
	cell.textLabel.text = [NSString stringWithFormat:@"%@: %@", pop, curPlaceName];
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	cell.detailTextLabel.text = curPlace.people;
	
    return cell;
}

// Number of Rows in Section
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	int numRows = oShizzeeps.count;
	return numRows;	
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	// AnotherViewController *anotherViewController = [[AnotherViewController alloc] initWithNibName:@"AnotherView" bundle:nil];
	// [self.navigationController pushViewController:anotherViewController];
	// [anotherViewController release];
}


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return YES;
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

@end

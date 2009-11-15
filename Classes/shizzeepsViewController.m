//
//  shizzeepsViewController.m
//  shizzeeps
//
//  Created by Sue Brown on 11/7/09.
//  Copyright House of Crunchy 2009. All rights reserved.
//

#import "shizzeepsViewController.h"
//#import "JSON.h"


@implementation shizzeepsViewController

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	oShizzeeps = [[shizzeeps alloc] init];
	oShizzeeps.load;
	
	NSLog(@"in viewdidload, count is %i", oShizzeeps.count);
	
	[shizzeepsTable reloadData];

	
//	[self loadShizzeeps];
}


- (void)dealloc {
    [super dealloc];
	[oShizzeeps release];
	[shizzeepsTable release];
}


#pragma mark -
#pragma mark TableView methods



// fill the cells
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	// boilerplate
	static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault 
									   reuseIdentifier:CellIdentifier] autorelease];
    
	// Configure the cell.
	
	
	NSArray	*curplace = [[oShizzeeps.results valueForKey:@"places"] objectAtIndex:indexPath.row];		
	NSString *places_name = [[curplace valueForKey:@"places_name"] description];
	NSString *population = [[curplace valueForKey:@"population"] description];
	cell.textLabel.text = [NSString stringWithFormat:@"%@: %@", population, places_name];
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	
    return cell;
}

// Number of Rows in Section
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
	int numRows = oShizzeeps.count;
	NSLog(@"I am a table and I have %i rows.", numRows);
	return numRows;
	
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

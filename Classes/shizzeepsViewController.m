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
	
	// i want to do something likethis:
	// NSString *curplacename = oShizzeeps.places[indexPath.row].name
	
	NSDictionary *curplace = [[oShizzeeps.results valueForKey:@"places"] objectAtIndex:indexPath.row];		
	NSString *places_name = [[curplace valueForKey:@"places_name"] description];
	
	// sometimes places_name has an ampersand <rolls eyes>
	places_name = [places_name stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"];
	
	NSString *population = [[curplace valueForKey:@"population"] description];
	
	// get the names of the people in this place
	
	cell.textLabel.text = [NSString stringWithFormat:@"%@: %@", population, places_name];
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	
	NSDictionary *shouts = [curplace objectForKey:@"shouts"];
	NSDictionary *s_results = [shouts objectForKey:@"results"];
	NSArray *s_r_shouts = [s_results objectForKey:@"shouts"];	
	NSArray *name = [s_r_shouts valueForKey:@"people_name"];
		
	// make the names look better
	NSEnumerator *enumerator = [name objectEnumerator];
	id anObject;
	NSString *names = @"";
	while (anObject = [enumerator nextObject]) {
			names = [NSString stringWithFormat:@"%@ %@", names, [anObject description]];
	}
	cell.detailTextLabel.text = names;
   
	
	
	//NSLog(@"curplace: %@\n\n", [curplace description]);	
	//NSLog(@"shouts:\n\n%@", [shouts description]);
	//NSLog(@"shouts_results:\n\n%@", [shouts_results description]);
	//NSLog(@"shouts -> results -> shouts:\n\n%@", [s_r_shouts description]);
	//NSLog(@"name: %@", name);
	
	
	
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

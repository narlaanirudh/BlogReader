//
//  ANTableViewController.m
//  BlogReaderS
//
//  Created by Anirudh narla on 11/4/13.
//  Copyright (c) 2013 Anirudh Narla. All rights reserved.
//

#import "ANTableViewController.h"
#import "blogPost.h"

@interface ANTableViewController ()

@end

@implementation ANTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    NSURL *blogURL = [NSURL URLWithString:@"http://blog.teamtreehouse.com/api/get_recent_summary"];
    
    NSError * error = nil;
    
    NSData *jsonData = [NSData dataWithContentsOfURL:blogURL];
    
    NSDictionary *posts = [ NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    
    NSArray *bps = [posts objectForKey:@"posts"];
    
    self.blogPosts = [ NSMutableArray array];
    
    for (NSDictionary *bpDictionary in bps) {
        
        blogPost *block = [blogPost blogPostWithTitle:[bpDictionary objectForKey:@"title"]];
        block.author = [bpDictionary objectForKey:@"author"];
        
        block.url = [NSURL URLWithString:[bpDictionary objectForKey:@"url"]];
        NSString *thumbnail = [bpDictionary objectForKey:@"thumbnail"];
        [block formattedDate:[bpDictionary objectForKey:@"date"]];
        
       
        
        NSURL *imgURL = nil;
        
        
        if ( [thumbnail isKindOfClass:[NSString class]])
        {
            imgURL = [NSURL URLWithString: thumbnail];
            
            NSData *imgData = [NSData dataWithContentsOfURL:imgURL];
            
            block.img = [UIImage imageWithData:imgData];
            
            
        }
        
        else
            
            block.img = [UIImage imageNamed:@"treehouse.png"];
        
     
        [ self.blogPosts addObject:block];
    
         
        
    }
    
    NSLog(@"%lu",(unsigned long)self.blogPosts.count);


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [self.blogPosts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    
    blogPost *blogP = self.blogPosts[indexPath.row];
    
    cell.textLabel.text = blogP.title;
    cell.imageView.image = blogP.img;
    
    cell.detailTextLabel.text = [ NSString stringWithFormat:@"%@ - %@",blogP.author,blogP.date];
    
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    blogPost *blogP = self.blogPosts[indexPath.row];
    
    UIApplication *application = [UIApplication sharedApplication];
    
    [application openURL:blogP.url];
    
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end

//
//  LSTableApps.m
//  ElderlyTutorials
//
//  Created by LeafShadow on 14-4-22.
//  Copyright (c) 2014年 LeafShadows. All rights reserved.
//

#import "LSTableApps.h"
#import "LSTableFunctions.h"
#import "LSAppsModel.h"

@interface LSTableApps ()
{
    LSAppsModel *vo,*vo2,*vo3,*vo4;
}

@end

@implementation LSTableApps
{
    NSArray *apps;
    
    NSArray *weixins;
    NSArray *qqs;
    NSArray *apples;
    NSArray *weibos;
}

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
    
    qqs = [NSArray arrayWithObjects:@"加好友",@"加群",@"视频聊天",@"语音聊天", nil];
    
    weixins = [NSArray arrayWithObjects:@"发朋友圈",@"摇一摇",@"漂流瓶",@"加好友", nil];
    
    apples = [NSArray arrayWithObjects:@"facetime",@"短信",@"换主题", nil];
    
    weibos = [NSArray arrayWithObjects:@"发微博",@"加关注", nil];
    
    vo = [[LSAppsModel alloc] init];
    vo.name = @"微信";
    vo.functionsData = weixins;
    
    vo2 = [[LSAppsModel alloc] init];
    vo2.name = @"QQ";
    vo2.functionsData = qqs;
    
    vo3 = [[LSAppsModel alloc] init];
    vo3.name = @"苹果手机";
    vo3.functionsData = apples;
    
    vo4 = [[LSAppsModel alloc] init];
    vo4.name = @"微博";
    vo4.functionsData = weibos;
    
    apps = [NSArray arrayWithObjects:vo,vo2,vo3,vo4, nil];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [apps count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* tableAppIdentifier = @"AppsCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableAppIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableAppIdentifier];
    }
    LSAppsModel *vos = [apps objectAtIndex:indexPath.row];
    
    cell.textLabel.text = vos.name;
    
    
    return cell;
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
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UITableViewCell *cell = (UITableViewCell *) sender;
    NSString *text_o = cell.textLabel.text;
    NSLog(@"log:%@",text_o);
    if ([segue.identifier isEqualToString:@"showTutorials"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        LSTableFunctions * destinationView = segue.destinationViewController;
        LSAppsModel *vos = [apps objectAtIndex:indexPath.row];
        destinationView.functions = [[NSArray alloc] initWithArray:vos.functionsData];
        
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end

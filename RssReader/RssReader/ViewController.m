//
//  ViewController.m
//  RssReader
//
//  Created by ramesh chandra on 6/18/15.
//  Copyright © 2015 ramesh chandra. All rights reserved.
//

#import "ViewController.h"
#import "customTableViewCell.h"
#import "UIImageView+AFNetworking.h"
#import "DetailViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    _rssCon=[[connection alloc]init];
   
    _rssCon.delegate = self;
    _detail=[[NSMutableArray alloc]init];
    _sendDetail=[[NSMutableArray alloc]init];
    [_RssFeedTable addSubview:_activityIndicator];
    [_activityIndicator startAnimating];
    _activityIndicator.hidden=YES;

       // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)reload:(NSMutableArray*)array and:(BOOL) flag{
    
    _activityIndicator.hidden=YES;

    
    if (array!=nil) {
        
    
   
    [_detail addObjectsFromArray:array];
    
    [_RssFeedTable reloadData];
    }else{
        NSString *message=@"";
        
        if (flag) {
            
            message=[NSString stringWithFormat: @"no result bound for %@",_RSSValueTextBox.text];
        }else{
           message= @"connection error ";
        }
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    
}

- (IBAction)RssButton:(id)sender {
    _activityIndicator.hidden=NO;

    [_detail removeAllObjects];
    [_RssFeedTable reloadData];

    [_rssCon connect:_RSSValueTextBox.text and:0];

}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_detail count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    customTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    [tableView registerNib:[UINib nibWithNibName:@"customTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.RssShortDetail.text=_detail[indexPath.row][@"description"];
   cell.RssTitle.text=_detail[indexPath.row][@"title"];
    if (![_detail[indexPath.row][@"image"]  isEqual: @""]) {
        
    [cell.RssImageView setImageWithURL:[NSURL URLWithString: _detail[indexPath.row][@"image"]] placeholderImage:[UIImage imageNamed:@"loading.png"]];
    }else{
        cell.RssImageView.image=[UIImage imageNamed:@"No_Image_Available.png"];
    }
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
 //   UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    customTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    _sendDetail=_detail[indexPath.row];

    [self performSegueWithIdentifier:@"detail" sender:cell];
   
    
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 customTableViewCell *cell =sender;
     DetailViewController *next = [segue destinationViewController];
  
    next.resiveDetail=_sendDetail ;
    next.resiveIMAGE=cell.RssImageView.image;

}

@end

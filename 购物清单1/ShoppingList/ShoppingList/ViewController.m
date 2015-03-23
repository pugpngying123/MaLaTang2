//
//  ViewController.m
//  ShoppingList
//
//  Created by 翔冰 on 14/10/22.
//  Copyright (c) 2014年 xb. All rights reserved.
//

#import "ViewController.h"
#import "ShowCollectionViewCell.h"
#import "SelectedViewController.h"
#import "SelectedCollectionViewCell.h"


@interface ViewController ()
@end
@implementation ViewController

- (void)viewWillAppear:(BOOL)animated
{
      [super viewWillAppear:animated];
    
      //偏移模块
      [self isOffset];
    
      //刷新
      [self.clv_collectViewShow reloadData];
    
     //是否显示提示视图
      [ self isShowInterface];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //设置标题
    self.navigationItem.title=@"ShoppingList";
    
    //设textfiled置代理
    self.txt_input.delegate=self;
    
    //设置滚动的范围
    self.slv_home.contentSize=CGSizeMake(320, 568);
    
    //填充TableView
    _data=[[NSMutableArray alloc]initWithObjects:@"Fruit",@"Meat",@"Milk ",@"Fish",@"Cheese",@"Vegetables",nil];
    
    NSArray *fruit=[[NSArray alloc]initWithObjects:  [UIImage imageNamed:@"1.jpg"], [UIImage imageNamed:@"2.jpg"],[UIImage imageNamed:@"3.jpg"], [UIImage imageNamed:@"4.jpg"],[UIImage imageNamed:@"5.jpg"],[UIImage imageNamed:@"6.jpg"], [UIImage imageNamed:@"7.jpg"], [UIImage imageNamed:@"8.jpg"], [UIImage imageNamed:@"9.jpg"],[UIImage imageNamed:@"10.jpg"],[UIImage imageNamed:@"11.jpg"],[UIImage imageNamed:@"12.jpg"], [UIImage imageNamed:@"13.jpg"], [UIImage imageNamed:@"14.jpg"], [UIImage imageNamed:@"15.jpg"], [UIImage imageNamed:@"16.jpg"],[UIImage imageNamed:@"17.jpg"],nil];
    
      //定义子数组
     NSArray *meat=[[NSArray alloc]initWithObjects: [UIImage imageNamed:@"01.jpg"], [UIImage imageNamed:@"02.jpg"],  [UIImage imageNamed:@"03.jpg"], [UIImage imageNamed:@"04.jpg"], [UIImage imageNamed:@"06.jpg"],  [UIImage imageNamed:@"07.jpg"],[UIImage imageNamed:@"08.jpg"],nil];

     NSArray *milk=[[NSArray alloc]initWithObjects: [UIImage imageNamed:@"milk.jpg"],nil];
 
     NSArray *fish=[[NSArray alloc]initWithObjects:[UIImage imageNamed:@"fish.jpg"], nil];
    
     NSArray *cheese=[[NSArray alloc]initWithObjects: [UIImage imageNamed:@"cheesse1.jpg"],[UIImage imageNamed:@"cheese2.jpg"],nil];
    
     NSArray *vegetables=[[NSArray alloc]initWithObjects:[UIImage imageNamed:@" v1.jpg"],[UIImage imageNamed:@"v2.jpg"],[UIImage imageNamed:@"v3.jpg"],[UIImage imageNamed:@"v4.jpg"],[UIImage imageNamed:@"v5.jpg"], [UIImage imageNamed:@"v6.jpg"], [UIImage imageNamed:@"v7.jpg"],[UIImage imageNamed:@"v8.jpg"],[UIImage imageNamed:@"v9.jpg"],[UIImage imageNamed:@"v10.jpg"],[UIImage imageNamed:@"v11.jpg"],[UIImage imageNamed:@"v12.jpg"],[UIImage imageNamed:@"v13.jpg"],[UIImage imageNamed:@"v14.jpg"],nil];
    
    //填充大数组
    self.arr_dataArray = @[fruit,meat, milk,fish,cheese,vegetables];
    
    //初始化showCollectViewShowData
    self.showCollectViewShowData=[[NSMutableArray alloc]init];
    
    //注册  collectViewShow 的 cell
    [self.clv_collectViewShow registerNib:[UINib nibWithNibName:@"ShowCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"ShowCollectionViewCell"];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
/*
 *显示所需购买的清单CollectionView
 */
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.showCollectViewShowData.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    ShowCollectionViewCell * cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"ShowCollectionViewCell" forIndexPath:indexPath];
    cell.img_show.image= [self.showCollectViewShowData objectAtIndex:indexPath.row];
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
   
    [self.showCollectViewShowData removeObjectAtIndex:indexPath.row];
    [self isShowInterface];
    [self isOffset];//取消一个对象后重新设置模块之间的差距
    [self.tbv_homeTable reloadData];
    [self.clv_collectViewShow reloadData];
    
}

/*
 *TableView
 */
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
     return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _data.count;
}


-(UITableViewCell  *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString  * cellIdentifier=@"cell";
    UITableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text=[_data objectAtIndex:indexPath.row];
    
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    cell.tintColor=[UIColor redColor];
    return  cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
 
     UIStoryboard *mainS=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
     SelectedViewController *selectVc=[mainS instantiateViewControllerWithIdentifier:@"SelectedViewController"];
     selectVc.arr_dataArray = self.arr_dataArray[indexPath.row];
     selectVc.vc = self;
     [self.navigationController pushViewController:selectVc animated:YES];
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
-(void)isShowInterface
{
    
    if(self.showCollectViewShowData.count==0)
    {
          self.v_interface.hidden=NO;
        
    }
    else
    {
        self.v_interface.hidden=YES;
    }
}
    // 设置偏移后的各个模块的位置
-(void)isOffset
{
    
      //设置偏移量
    int offset=(self.showCollectViewShowData.count/3)*100;
    self.clv_collectViewShow.frame=CGRectMake(0, 53, 320, 100+offset);
    self.tbv_homeTable.frame=CGRectMake(0,120+offset , 320, 351);
    self.slv_home.contentSize=CGSizeMake(320, 450+offset);
}

@end

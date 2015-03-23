//
//  SelectedViewController.m
//  ShoppingList
//
//  Created by 翔冰 on 14/10/24.
//  Copyright (c) 2014年 xb. All rights reserved.
//

#import "SelectedViewController.h"
#import "SelectedCollectionViewCell.h" 


@interface SelectedViewController ()
@end
@implementation SelectedViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
   
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    //完成按钮
    UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(wancheng)];
    self.navigationItem.rightBarButtonItem=item;
    
    
    //注册SelectedCollectionViewCell
    [self.clv_selected registerNib:[UINib nibWithNibName:@"SelectedCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"SelectedCollectionViewCell"];
 
}

//个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.arr_dataArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    SelectedCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"SelectedCollectionViewCell" forIndexPath:indexPath];
    
    //如果存在则设置显示
    if ([self.vc.showCollectViewShowData containsObject:[self.arr_dataArray objectAtIndex:indexPath.row]])
    {
        cell.alpha=0.5;
        cell.backgroundColor=[UIColor redColor];
    }

    cell.img_source.image = [self.arr_dataArray objectAtIndex:indexPath.row ];

    return  cell;
    
    
    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //－－－点击后 变化
    SelectedCollectionViewCell *cell=(SelectedCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
 
    //如果所选的cell已经在前边的数组中，则remove所选的物品；否则添加
    if ([self.vc.showCollectViewShowData containsObject:[self.arr_dataArray objectAtIndex:indexPath.row ]])
    {
        cell.alpha=1;
        cell.backgroundColor=[UIColor whiteColor];
        [self.vc.showCollectViewShowData removeObject:[self.arr_dataArray objectAtIndex:indexPath.row ]];
    }
    
    else
    {
        [self.vc.showCollectViewShowData addObject:[self.arr_dataArray objectAtIndex:indexPath.row ]] ;
        cell.alpha=0.5;
        cell.backgroundColor=[UIColor redColor];
        
    }

  
}
-(void)wancheng
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end

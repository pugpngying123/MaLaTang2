//
//  ViewController.h
//  ShoppingList
//
//  Created by 翔冰 on 14/10/22.
//  Copyright (c) 2014年 xb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,
UICollectionViewDataSource,UICollectionViewDelegate,UITextFieldDelegate>
/*
  *ScrollView简写为：         slv
  *TableView简写为：          tbv
  *TextField简写为：          txt
  *CollectionView简写为：     clv
  */
@property (weak, nonatomic) IBOutlet UIScrollView *slv_home;
@property (weak, nonatomic) IBOutlet UITableView *tbv_homeTable;
@property (weak, nonatomic) IBOutlet UICollectionView *clv_collectViewShow;

@property (weak, nonatomic) IBOutlet UIView *v_interface;
@property (weak, nonatomic) IBOutlet UIImageView *img_interface;

@property(nonatomic ,strong)NSMutableArray *showCollectViewShowData; //数组－－显示所选的清单
@property(nonatomic ,strong)NSMutableArray *data;//数组－－显示TableView
@property (nonatomic,strong) NSArray *arr_dataArray;//大数组内容
@end


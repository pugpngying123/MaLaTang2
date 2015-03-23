//
//  SelectedViewController.h
//  ShoppingList
//
//  Created by 翔冰 on 14/10/24.
//  Copyright (c) 2014年 xb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface SelectedViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *clv_selected;

@property (nonatomic,strong) NSArray *arr_dataArray;

@property (nonatomic , weak) ViewController *vc;

@end

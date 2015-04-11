//
//  SelectedCollectionViewCell.h
//  ShoppingList
//
//  Created by 翔冰 on 14/10/24.
//  Copyright (c) 2014年 xb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
@interface SelectedCollectionViewCell : UICollectionViewCell
{
    AppDelegate *app;
}
@property (weak, nonatomic) IBOutlet UIImageView *img_source;


@property (weak, nonatomic) IBOutlet UILabel *lbl_Count;//选择的数量
- (IBAction)btn_Add:(id)sender;//数量增加
- (IBAction)btn_Less:(id)sender;//数量减少

@end

//
//  SelectedCollectionViewCell.m
//  ShoppingList
//
//  Created by 翔冰 on 14/10/24.
//  Copyright (c) 2014年 xb. All rights reserved.
//

#import "SelectedCollectionViewCell.h"

@implementation SelectedCollectionViewCell

- (void)awakeFromNib {
    
     app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
            
}

- (IBAction)btn_Add:(id)sender {
   
    self.lbl_Count.text=[NSString stringWithFormat:@"%ld",[(self.lbl_Count.text) integerValue]+1];
    app.count.counts=[NSString stringWithFormat:@"%ld",[(app.count.counts) integerValue]+1];
    NSLog(@"%@",app.count.counts);
     [app.count save];

}

- (IBAction)btn_Less:(id)sender {
    if([(self.lbl_Count.text) integerValue]<=0||app.count.counts<=0)
    {
        return;
    }
    else
    {
   self.lbl_Count.text=[NSString stringWithFormat:@"%ld",[(self.lbl_Count.text) integerValue]-1];
    app.count.counts=[NSString stringWithFormat:@"%ld",[(app.count.counts) integerValue]-1];
    NSLog(@"%@",app.count.counts);
    }
    [app.count save];
}
@end

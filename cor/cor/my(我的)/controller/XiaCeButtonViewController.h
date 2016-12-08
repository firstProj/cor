//
//  XiaCeButtonViewController.h
//  头条新闻
//
//  Created by 韩创显 on 2016/12/2.
//  Copyright © 2016年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XiaCeButtonViewController : UIViewController<UIImagePickerControllerDelegate,UIActionSheetDelegate,UINavigationControllerDelegate>
@property(nonatomic,strong)UIButton * shangchuanButton;
@property (strong, nonatomic) UIActionSheet *actionSheet;
@end

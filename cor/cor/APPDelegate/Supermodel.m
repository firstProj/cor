//
//  Supermodel.m
//  haozheng-xiangmu1
//
//  Created by wyzc on 16/11/30.
//  Copyright © 2016年 wyzc. All rights reserved.
//

#import "Supermodel.h"

@implementation Supermodel

- (CGFloat)cellHeight
{
    if (_cellHeight == 0) {
        _cellHeight = 35;
        
        int  he=[self.middle_image.heignt  intValue ];
        int  wi=[self.middle_image.width  intValue];
        
        int  height1=414*(he/wi );
        
        
        _cellHeight=_cellHeight+height1;
        
        
               
    }
    return _cellHeight;
}



@end

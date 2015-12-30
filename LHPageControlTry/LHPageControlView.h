//
//  LHPageControlView.h
//  LHPageControlTry
//
//  Created by LinGrea on 15/12/29.
//  Copyright © 2015年 Lin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LHPageControlView : UIView

/** 根据原点初始化控件 */
- (id)initWithOriginPoint:(CGPoint)point PageCount:(NSInteger)pageCount;
/** 根据位移移动 */
-(void)moveThePage:(double)distance;

@end

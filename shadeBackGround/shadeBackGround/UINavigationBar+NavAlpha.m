//
//  UINavigationBar+NavAlpha.m
//  shadeBackGround
//
//

#import "UINavigationBar+NavAlpha.h"
#import <objc/runtime.h>

@implementation UINavigationBar (NavAlpha)

static char alView;

-(void)setAlphaView:(UIView *)alphaView
{
    objc_setAssociatedObject(self, &alView, alphaView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIView *)alphaView
{
    return  objc_getAssociatedObject(self, &alView);
    
}

#pragma mark 设置渐变
-(void)setalphaNavigationWithColor:(UIColor *)color offSetY:(CGFloat)offSetY
{
    if (!self.alphaView) {
        //设置背景图片
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        //创建自定义透明的view
        self.alphaView = [[UIView alloc]initWithFrame:CGRectMake(0,-20, [UIScreen mainScreen].bounds.size.width, 64)];
        //插入添加
        [self insertSubview:self.alphaView atIndex:0];
    }
    //设置透明的颜色,根据offSet的值设置透明度
    CGFloat alphaScale = 1+(offSetY)/64;
    if (alphaScale > 0.6)
    {
        alphaScale = 0.6;
    }
    if (offSetY > -64)
    {
        //self.navigationController.navigationBar.alpha = alphaScale;
        color = [color colorWithAlphaComponent:alphaScale];
        
    }else
    {
        //self.navigationController.navigationBar.alpha = 1;
        color = [color colorWithAlphaComponent:0];
    }
    
    //设置透明的颜色为背景色
    [self.alphaView setBackgroundColor:color];
    
}


@end

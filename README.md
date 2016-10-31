# shadeBackGround
实现渐变效果的导航控制器


#安装

**手动安装**

将分类UINavigationBar+NavAlpha的.h和.m文件拖入到项目中即可

#使用方法

```
//导入头文件
#import "UINavigationBar+NavAlpha.h"
//根据偏移量设置渐变效果
CGFloat scrollY =  scrollView.contentOffset.y;
[self.navigationController.navigationBar setalphaNavigationWithColor:color offSetY:scrollY];
```

//
//  TableViewController.m
//  shadeBackGround
//
//

#import "TableViewController.h"
#import "UINavigationBar+NavAlpha.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //调用初始化方法
    [self setUpUI];
}

#pragma mark 初始化方法
- (void)setUpUI
{
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark - 数据源方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellId = @"leftCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    cell.textLabel.text = @"123";
    return cell;
}

#pragma mark - 代理方法
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    UIColor *color = [UIColor redColor];
    //渐变透明,当前滚动的Y值
    CGFloat scrollY =  scrollView.contentOffset.y;
    [self.navigationController.navigationBar setalphaNavigationWithColor:color offSetY:scrollY];
}


@end

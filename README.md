# LeftOrRightDraw
##左右抽屉总结
###展示效果图
![Mou icon](https://github.com/mengzhihun6/LeftOrRightDraw/blob/master/Snip20160909_1.png)
![Mou icon](https://github.com/mengzhihun6/LeftOrRightDraw/blob/master/Snip20160909_2.png)
![Mou icon](https://github.com/mengzhihun6/LeftOrRightDraw/blob/master/drawer.gif)

##第三方抽屉效果

1.  抽屉效果的基本原理应用了父子视图的层级,视图的位置改变，动画，手势操作等主要知识点。熟练掌握基础知识并灵活运用，即可实现该效果。
    * 父子视图的层级: 在指定层级上插入子视图 ［view insertSubView: atIndex:]
    * 视图位置的改变： 通过视图的frame,center属性调整
    * 动画：可使用UIView或CALayer的动画，这里主要使用了UIView的动画方法 [UIView animateWithDuration:……. ]
    * 手势操作：主要使用到UISwipeGestureRecognizer, UIPanGestureRecognizer. 通过点击，或轻扫，拖动手势操作完成抽屉的开关。

    除了左右两侧的侧滑效果外，通常情况下将app中类似新闻栏目点击后，内容随之切换的效果也称之为抽屉效果。

2. 其他第三方开源抽屉效果
    *  RESideMenu
       <https://github.com/romaonthego/RESideMenu>
       在开源库中星级值较高。
       支持iOS6以上
       类似网易的新闻客户端
       支持将抽屉效果变小或不变小
       但：抽屉视图中若需使用tableview及所占视图比例需自己实现

    * Mutual Mobile Drawer Controller 
       <https://github.com/mutualmobile/MMDrawerController>
       可选择抽屉动画效果
       抽屉视图是tableview ，无需自己实现
       纯代码实现

    *  ECSlidingViewController2 
       <https://github.com/ECSlidingViewController/ECSlidingViewController>
       星级值较高
       只是实现了基本的抽屉效果，也能满足开发需要
       支持纯代码和可视化

    * SWRevealViewController 
       <https://github.com/John-Lluch/SWRevealViewController>
       代码较干净简单
       可实现三层抽屉
       左右抽屉占比控制的较好
    * PPRevealSideViewController 
       <https://github.com/ipup/PPRevealSideViewController>
       比较灵活
       大部分使用storyboard创建
       但：依赖性比较大，必须使用cocoapods, 需导入的库文件比较多
              手势支持处理的不太好
    * YRSideViewController 
       <https://github.com/YueRuo/YRSideViewController>
       星级值较低
       国人开发，能看的懂。也能满足开发需要
    
    以上是几种常见的抽屉效果第三方开源，根据实际项目需要选择合适的库，建议使用1，2，6三种。
      



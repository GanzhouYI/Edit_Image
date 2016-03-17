import UIKit

class Editing: UIViewController,UITabBarDelegate,UIScrollViewDelegate,tiezhi_collectionView_Delegate,biaoqian_collectionView_Delegate,lvjing_collectionView_Delegate {
    
    var Edit_Data=Edit_Image_Data()
     var imageView=UIImageView()
    var EditImage=UIImage()
    var scrollBG=UIScrollView()
    
    var tiezhi_Data=["yindao.png","yindao1.jpg","yindao2.png","yindao3.jpg","yindao4.png","卡背.jpg"]
    
    //添加Tab Bar控件
    var tabBar:UITabBar!
    //Tab Bar Item的名称数组
    var tabs = ["贴纸","标签","滤镜","剪切"]
    //Tab Bar上方的容器
    var contentView:UIView!
    var tabBarImages = ["贴纸.png","标签.png","滤镜.png","剪切.png"]
    var tabBarImagesSelect = ["贴纸select.png","标签select.png","滤镜select.png","剪切select.png"]
    
    var contentViewBGImage = ["卡背6.jpg","卡背6.jpg","卡背6.jpg","卡背6.jpg"]
    override func viewDidLoad() {
        super.viewDidLoad()
        //给图片添加水印
        self.automaticallyAdjustsScrollViewInsets = false
        
        self.title = "编辑"
        self.view.backgroundColor = UIColor.grayColor()
        self.imageView.image = EditImage
        self.imageView.image!.waterMarkedImage(UIImage(named: "卡背.jpg")!,corner: .TopLeft,margin: CGPoint(x: 20, y: 20), alpha:0.5)
        self.imageView.frame.size = CGSize(width: self.view.frame.width,height: {
            ()->CGFloat in
            if self.view.frame.width < self.EditImage.size.width
            {
                return self.EditImage.size.height/(self.EditImage.size.width/self.view.frame.width)
            }
            return self.EditImage.size.height
            }())

        self.imageView.frame.origin = CGPoint(x: 0, y: 2)
        self.scrollBG.frame = CGRectMake(0, (self.navigationController?.navigationBar.frame.height)!+20, self.view.frame.width, 500)
        self.scrollBG.backgroundColor = UIColor.grayColor()
        self.scrollBG.contentSize = self.imageView.frame.size
        self.scrollBG.showsHorizontalScrollIndicator=true//默认显示滚动条
        self.scrollBG.showsVerticalScrollIndicator=true//默认显示滚动条
        self.scrollBG.pagingEnabled=false//是否允许滚动，必须设置
        self.scrollBG.delegate = self
        self.scrollBG.addSubview(imageView)
        self.view.addSubview(scrollBG)
//            .waterMarkedImage(UIImage(named: "卡背.jpg")!,corner: .TopLeft,
//                margin: CGPoint(x: 20, y: 20), alpha:0.5)
        
        
        //上方的容器
        contentView = UIView(frame: CGRectMake(0,(self.navigationController?.navigationBar.frame.height)!+scrollBG.frame.height+22,self.view.frame.width,120))
        contentView.backgroundColor = UIColor.grayColor()
        self.view.addSubview(contentView)
        
        tabBar = UITabBar(frame: CGRectMake(0,self.contentView.frame.origin.y+contentView.frame.height,self.view.frame.width,self.view.frame.height-self.scrollBG.frame.height-contentView.frame.height+(self.navigationController?.navigationBar.frame.height)!))
        
        
        tabBarView()
    
        //本类实现UITabBarDelegate代理，切换标签页时能响应事件
        tabBar.delegate = self
        //代码添加到界面上来
        self.view.addSubview(tabBar)

    
    }

    func tabBarView()
    {
        var items:[UITabBarItem] = []
        
        for i in 0...tabBarImages.count-1
        {
        var image = UIImage(named: tabBarImages[i])
        var selectedimage = UIImage(named: tabBarImagesSelect[i])
        image = image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        
        selectedimage = selectedimage!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        
        var tabItem_1 = UITabBarItem(title: "", image: image, tag: i)
        tabItem_1.selectedImage = selectedimage
        tabItem_1.imageInsets = UIEdgeInsetsMake(5, 0, -2, 0)
        items.append(tabItem_1)
        }
                //设置Tab Bar的标签页
        tabBar.setItems(items, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
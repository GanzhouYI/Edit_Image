//
//  ExtensionEditing.swift
//  SwiftInAction-008-016
//
//  Created by __________V|R__________ on 16/3/14.
//  Copyright © 2016年 ucai. All rights reserved.
//

import UIKit

extension Editing{
    func conterScrollViewContens()
    {
        let boundSize = self.scrollBG.bounds.size
        var contentFrame = self.imageView.frame
        //水平居中位置
        if contentFrame.size.width < boundSize.width
        {
            contentFrame.origin.x = (boundSize.width-contentFrame.size.width)/2.0
        }
        else
        {
            contentFrame.origin.x = 0.0
        }
        //垂直居中位置
        if contentFrame.size.height < boundSize.height
        {
            contentFrame.origin.y = (boundSize.height-contentFrame.size.height)/2.0
        }
        else
        {
            contentFrame.origin.y = 0.0
        }
        self.imageView.frame = contentFrame
    }

    // UITabBarDelegate协议的方法，在用户选择不同的标签页时调用
    func tabBar(tabBar: UITabBar!, didSelectItem item: UITabBarItem) {
        //通过tag查询到上方容器的label，并设置为当前选择的标签页的名称
        switch item.tag
        {
            case 0:
                var BGImage = UIImageView(frame: CGRectMake(20,10,self.view.frame.width-40,self.contentView.frame.height-10))
                BGImage.image = UIImage(named: contentViewBGImage[0])
                
                var tiezhi_collection = tiezhi_collectionView(frame:CGRectMake(20,10,self.view.frame.width-40,self.contentView.frame.height-10),tiezhi_contentSize: tiezhi_contentSize())
                tiezhi_collection.delegate = self
                
                self.contentView.addSubview(BGImage)
                self.contentView.addSubview(tiezhi_collection)
                //self.contentView.backgroundColor = UIColor.redColor()
            break
            
            case 1:
                var BGImage = UIImageView(frame: CGRectMake(20,10,self.view.frame.width-40,self.contentView.frame.height-10))
                BGImage.image = UIImage(named: contentViewBGImage[1])
                
                var biaoqian_collection = biaoqian_collectionView(frame:CGRectMake(20,10,self.view.frame.width-40,self.contentView.frame.height-10),biaoqian_contentSize: biaoqian_contentSize())
                biaoqian_collection.delegate = self
                
                self.contentView.addSubview(BGImage)
                self.contentView.addSubview(biaoqian_collection)
                //self.contentView.backgroundColor = UIColor.redColor()

            break
            
            case 2:
                var lvjing_collection = lvjing_collectionView(frame:CGRectMake(20,10,self.view.frame.width-40,self.contentView.frame.height-10),lvjing_contentSize: lvjing_contentSize())
                lvjing_collection.delegate = self
                
                var BGImage = UIImageView(frame: CGRectMake(20,10,self.view.frame.width-40,self.contentView.frame.height-10))
                //BGImage.image = UIImage(named: lvjing_collectionViewBGImage())
                
                self.contentView.addSubview(BGImage)
                self.contentView.addSubview(lvjing_collection)
               // self.contentView.backgroundColor = UIColor.redColor()
            break
            
            case 3:
                
            break
        default:
            break
        }
    }
    
    
    //     实现 tiezhi_collectionView_Delegate
    func tiezhi_Images() -> [String]
    {
        return Edit_Data.Edit_Image_tiezhi
    }
    
    func tiezhi_numberOfItemsInSection() -> Int
    {
        return Edit_Data.Edit_Image_tiezhi.count
    }
    
    func tiezhi_contentSize() -> CGSize {
        return Edit_Data.tiezhi_collectionViewSize
    }
    
    //     实现 biaoqian_collectionView_Delegate
    func biaoqian_Images() -> [String]
    {
        return Edit_Data.Edit_Image_biaoqian
    }
    
    func biaoqian_numberOfItemsInSection() -> Int
    {
        return Edit_Data.Edit_Image_biaoqian.count
    }
    
    func biaoqian_contentSize() -> CGSize {
        return Edit_Data.biaoqian_collectionViewSize
    }
    
    //     实现 lvjing_collectionView_Delegate
    func lvjing_Images() -> [String]
    {
        return Edit_Data.Edit_Image_lvjing
    }
    
    func lvjing_numberOfItemsInSection() -> Int
    {
        return Edit_Data.Edit_Image_lvjing.count
    }
    
    func lvjing_contentSize() -> CGSize {
        return Edit_Data.lvjing_collectionViewSize
    }
    
    
}

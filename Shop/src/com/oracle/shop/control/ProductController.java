package com.oracle.shop.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.shop.model.dao.ProductDAO;
import com.oracle.shop.model.javabean.Goods;

/**
 * 这样定义的一个普通java类就变成了一个springmvc框架下面的一个后台组件（可以对前台网页提供服务）
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	private ProductDAO dao;
	
	/**
	 * 这就是一个springmvc下面的一个后台controller的一个后台方法
	 * @return
	 */
	@RequestMapping("/list")
	public String listProduct(Model  m){
		System.out.println("这是进入了后台的方法，");
		List<Goods>  gs=dao.listGoods();
		m.addAttribute("gs", gs);//讲后台dao查询出来的一个集合里面的商品信息存储到一个盒子里
		return "index";
	}

}

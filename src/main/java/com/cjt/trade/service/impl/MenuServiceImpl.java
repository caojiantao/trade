package com.cjt.trade.service.impl;

import com.cjt.trade.dao.IMenuDao;
import com.cjt.trade.model.Menu;
import com.cjt.trade.service.IMenuService;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class MenuServiceImpl implements IMenuService {

  @Resource
  private IMenuDao menuDao;

  @Override
  public List<Menu> listMenus() {
    // 获取DB原始数据
    List<Menu> menus = menuDao.listMenus();
    // 采用spring自带工具类，实质就是实现Map<V, List<V>>，得到以parentId为分组的map
    MultiValueMap<Integer, Menu> map = new LinkedMultiValueMap<Integer, Menu>();
    for(Menu menu : menus) {
      map.add(menu.getParentId(), menu);
    }
    return setSubItem(map, 0);
  }

  private List<Menu> setSubItem(MultiValueMap<Integer, Menu> map, int parentId){
    List<Menu> result = new ArrayList<Menu>();
    if (map.containsKey(parentId)){
      List<Menu> menus = map.get(parentId);
      for (Menu menu : menus){
        // 递归设置子项
        menu.setChildren(setSubItem(map, menu.getId()));
        // 注意添加到当前同级兄弟list中
        result.add(menu);
      }
    }
    // 递归跳出条件：
    return result;
  }
}

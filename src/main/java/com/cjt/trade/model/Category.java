package com.cjt.trade.model;

import java.util.List;

public class Category {

  private Integer id;

  private Integer parentId;

  private Integer hasChild;

  private String name;

  private Integer order;

  private String title;

  private String keyword;

  private String description;

  private String logoUrl;

  private String logoRealUrl;

  private String content;

  private List<Category> children;

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public Integer getOrder() {
    return order;
  }

  public void setOrder(Integer order) {
    this.order = order;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getKeyword() {
    return keyword;
  }

  public void setKeyword(String keyword) {
    this.keyword = keyword;
  }

  public String getLogoUrl() {
    return logoUrl;
  }

  public void setLogoUrl(String logoUrl) {
    this.logoUrl = logoUrl;
  }

  public String getLogoRealUrl() {
    return logoRealUrl;
  }

  public void setLogoRealUrl(String logoRealUrl) {
    this.logoRealUrl = logoRealUrl;
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public Integer getParentId() {
    return parentId;
  }

  public void setParentId(Integer parentId) {
    this.parentId = parentId;
  }

  public Integer getHasChild() {
    return hasChild;
  }

  public void setHasChild(Integer hasChild) {
    this.hasChild = hasChild;
  }

  public List<Category> getChildren() {
    return children;
  }

  public void setChildren(List<Category> children) {
    this.children = children;
  }
}

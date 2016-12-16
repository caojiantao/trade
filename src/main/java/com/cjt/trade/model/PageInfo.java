package com.cjt.trade.model;

public class PageInfo {
	
    private Integer id;
    
    /**
     * 0:会社概要
     * 1:注文方法
     * 2:重要事项
     * 3:割引情报
     * 4:注意事项
     * 5:返品返金
     * 6:营业时间
     * 7:配送方式
     * 
     * 8:文章内容
     */
    private Integer type;

    private String title;

    private String keyword;
    
    private String description;
    
    private String content;
    
    public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
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

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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
}
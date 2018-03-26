package com.cjt.trade.controller.backend.mall;

import com.alibaba.fastjson.JSONObject;
import com.cjt.trade.controller.BaseController;
import com.cjt.trade.dto.BaseDto;
import com.cjt.trade.dto.ResultDto;
import com.cjt.trade.model.Goods;
import com.cjt.trade.service.IGoodsService;
import com.cjt.trade.service.IUploadService;
import com.cjt.trade.util.JSONUtil;
import com.cjt.trade.vo.GoodsVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.List;

/**
 * @author caojiantao
 */
@Controller
@RequestMapping(value = "/backend")
public class GoodsController extends BaseController {

    @Resource
    private IGoodsService goodsService;

    @Autowired
    private IUploadService uploadService;

    @RequestMapping(value = "/goodsList.action")
    public String goodsList() {
        return "backend/mall/goodsList";
    }

    @ResponseBody
    @RequestMapping(value = "/getAllGoods.action")
    public JSONObject getAllGoods(int page, int rows, BaseDto dto) {
        dto.setStart((page - 1) * rows);
        dto.setLimit(rows);
        List<GoodsVo> vos = goodsService.getAllGoods(dto);
        int count = goodsService.getAllGoodsCount(dto);
        return JSONUtil.toGridJson(vos, count);
    }

    @ResponseBody
    @RequestMapping(value = "/addGoods.action")
    public ResultDto addGoods(MultipartFile file, Goods goods) throws IOException {
        if (file != null) {
            goods.setLogoUrl(uploadService.uploadFile(file.getInputStream(), file.getOriginalFilename()));
        }
        goodsService.insertGoods(goods);
        return success("添加成功", null);
    }

    @ResponseBody
    @RequestMapping(value = "/updateGoods.action")
    public ResultDto updateGoods(MultipartFile file, Goods goods) throws IOException {
        if (file != null) {
            goods.setLogoUrl(uploadService.uploadFile(file.getInputStream(), file.getOriginalFilename()));
        }
        int lines = goodsService.updateGoods(goods);
        return lines > 0 ? success("更新成功", null) : failed("更新失败");
    }

    @ResponseBody
    @RequestMapping(value = "/getGoodsById.action")
    public Goods getgoodsById(int id) {
        return goodsService.getGoodsById(id);
    }

    @ResponseBody
    @RequestMapping(value = "/deleteGoodsById.action")
    public boolean deleteGoodsById(int id) {
        int lines = goodsService.deleteGoods(id);
        return lines > 0;
    }
}

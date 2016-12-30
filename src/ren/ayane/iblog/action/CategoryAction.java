package ren.ayane.iblog.action;

import java.net.URLDecoder;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;

import ren.ayane.core.action.BaseAction;
import ren.ayane.core.exception.ActionException;
import ren.ayane.core.utils.QueryHelper;
import ren.ayane.iblog.entity.Category;
import ren.ayane.iblog.service.ICategoryService;

/**
 * 控制器
 * 分类管理
 * @author SoulAsa
 */
public class CategoryAction extends BaseAction {

	@Resource
	private ICategoryService categoryService;
	private Category category;
	private Map<String,Object> json_map;
	List<Integer> selectedRows;
	
	// {"total":2,"rows":[{"articles":[],"cateId":1,"cateName":"IT"}]}
	// 列表页面
	public String listUI(){
		return "listUI";
	}
	
	public String list() throws ActionException{
		try {
			// 创建查询助手对象
			QueryHelper queryHelper = new QueryHelper(Category.class, "c");
			if (category != null) {
				if (StringUtils.isNotBlank(category.getCateName())) {
					category.setCateName(URLDecoder.decode(category.getCateName(),"utf-8"));
					queryHelper.addCondition("c.cateName like ?", "%" + category.getCateName() + "%");
				}
			}
			if (getPage() == 0 || "".equals(getPage())) {
				setPage(1);
			}
			if (getRows() == 0 || "".equals(getRows())) {
				setRows(DEFAULT_ROWS);
			}
			pageResult = categoryService.getPageResult(queryHelper, getPage(), getRows());
			json_map = new LinkedHashMap<String, Object>();
			json_map.put("total", categoryService.findObjects().size());
			json_map.put("rows", pageResult.getItems());
		} catch (Exception e) {
			// 捕获service层异常，根据异常信息判断是否影响本次操作结果
			throw new ActionException("请求操作失败。"+e.getMessage());
		}
		return SUCCESS;
	}
	
	// 跳转到添加页面
	public String addUI() {
		return "addUI";
	}
	
	// 保存新增
	public String add() {
		if(category != null) {
			categoryService.save(category);
		}
		return "listUI";
	}
	
	// 跳转到编辑页面
	public String editUI() {
		if (category != null && category.getCateId() != null) {
			category = categoryService.findObjectById(category.getCateId());
		}
		return "editUI";
	}
	
	public String edit() {
		if (category != null) {
			categoryService.update(category);
		}
		return "listUI";
	}
	
	// 删除
	public String delete(){
		if (category != null && category.getCateId() != null) {
			categoryService.delete(category.getCateId());
		}
		return "list";
	}
	
	// 批量删除
	public String deleteSelected(){
		if (selectedRows != null) {
			for (int id : selectedRows) {
				categoryService.delete(id);
			}
		}
		return "listUI";
	}
	
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public Map<String, Object> getJson_map() {
		return json_map;
	}
	public void setJson_map(Map<String, Object> json_map) {
		this.json_map = json_map;
	}
	public List<Integer> getSelectedRows() {
		return selectedRows;
	}
	public void setSelectedRows(List<Integer> selectedRows) {
		this.selectedRows = selectedRows;
	}
	
}

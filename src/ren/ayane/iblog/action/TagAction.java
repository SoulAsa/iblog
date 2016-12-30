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
import ren.ayane.iblog.entity.Tag;
import ren.ayane.iblog.service.ITagService;

/**
 * 控制器
 * 标签管理
 * @author SoulAsa
 */
public class TagAction extends BaseAction {

	@Resource
	private ITagService tagService;
	private Tag tag;
	private Map<String,Object> json_map;
	List<Integer> selectedRows;
	
	// 列表页面
	public String listUI(){
		return "listUI";
	}
	
	public String list() throws ActionException{
		try {
			// 创建查询助手对象
			QueryHelper queryHelper = new QueryHelper(Tag.class, "t");
			if (tag != null) {
				if (StringUtils.isNotBlank(tag.getTagName())) {
					tag.setTagName(URLDecoder.decode(tag.getTagName(),"utf-8"));
					queryHelper.addCondition("t.tagName like ?", "%" + tag.getTagName() + "%");
				}
			}
			if (getPage() == 0 || "".equals(getPage())) {
				setPage(1);
			}
			if (getRows() == 0 || "".equals(getRows())) {
				setRows(DEFAULT_ROWS);
			}
			pageResult = tagService.getPageResult(queryHelper, getPage(), getRows());
			json_map = new LinkedHashMap<String, Object>();
			json_map.put("total", tagService.findObjects().size());
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
		if(tag != null) {
			tagService.save(tag);
		}
		return "listUI";
	}
	
	// 跳转到编辑页面
	public String editUI() {
		if (tag != null && tag.getTagId() != null) {
			tag = tagService.findObjectById(tag.getTagId());
		}
		return "editUI";
	}
	
	public String edit() {
		if (tag != null) {
			tagService.update(tag);
		}
		return "listUI";
	}
	
	// 删除
	public String delete(){
		if (tag != null && tag.getTagId() != null) {
			tagService.delete(tag.getTagId());
		}
		return "list";
	}
	
	// 批量删除
	public String deleteSelected(){
		if (selectedRows != null) {
			for (int id : selectedRows) {
				tagService.delete(id);
			}
		}
		return "listUI";
	}
	


	public Tag getTag() {
		return tag;
	}
	public void setTag(Tag tag) {
		this.tag = tag;
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

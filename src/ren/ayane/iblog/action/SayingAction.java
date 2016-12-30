package ren.ayane.iblog.action;

import java.sql.Timestamp;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import ren.ayane.core.action.BaseAction;
import ren.ayane.core.exception.ActionException;
import ren.ayane.core.utils.QueryHelper;
import ren.ayane.iblog.entity.Saying;
import ren.ayane.iblog.service.ISayingService;

/**
 * 控制器
 * 碎言碎语管理
 * @author SoulAsa
 */
public class SayingAction extends BaseAction {

	@Resource
	private ISayingService sayingService;
	private Saying saying;
	private Map<String,Object> json_map;
	List<Integer> selectedRows;
	
	private Integer[] sayingTagIds;
	
	// 列表页面
	public String listUI() {
		return "listUI";
	}
	
	public String list() throws ActionException {
		try {
			// 创建查询助手对象
			QueryHelper queryHelper = new QueryHelper(Saying.class, "a");
			if (getPage() == 0 || "".equals(getPage())) {
				setPage(1);
			}
			if (getRows() == 0 || "".equals(getRows())) {
				setRows(DEFAULT_ROWS);
			}
			pageResult = sayingService.getPageResult(queryHelper, getPage(), getRows());
			json_map = new LinkedHashMap<String, Object>();
			json_map.put("total", sayingService.findObjects().size());
			json_map.put("rows", pageResult.getItems());
		} catch (Exception e) {
			// 捕获service层异常，根据异常信息判断是否影响本次操作结果
			throw new ActionException("请求操作失败。"+e.getMessage());
		}
		return SUCCESS;
	}
	
	// 跳转到添加页面
	public String addUI() {
		saying = new Saying();
		saying.setCreateTime(new Timestamp(new Date().getTime()));
		return "addUI";
	}
	
	// 保存新增
	public String add() throws Exception {
		if(saying != null) {
			saying.setCreateTime(new Timestamp(new Date().getTime()));
			sayingService.save(saying);
		}
		return "listUI";
	}
	
	// 跳转到编辑页面
	public String editUI() {
		if (saying != null && saying.getSayId() != null) {
			saying = sayingService.findObjectById(saying.getSayId());
		}
		return "editUI";
	}
	
	public String edit() throws Exception {
		if(saying != null) {
			sayingService.update(saying);
		}
		return "listUI";
	}
	
	// 删除
	public String delete(){
		if (saying != null && saying.getSayId() != null) {
			sayingService.delete(saying.getSayId());
		}
		return "list";
	}
	
	// 批量删除
	public String deleteSelected(){
		if (selectedRows != null) {
			for (int id : selectedRows) {
				sayingService.delete(id);
			}
		}
		return "listUI";
	}
	
	public Saying getSaying() {
		return saying;
	}
	public void setSaying(Saying saying) {
		this.saying = saying;
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
	public Integer[] getSayingTagIds() {
		return sayingTagIds;
	}
	public void setSayingTagIds(Integer[] sayingTagIds) {
		this.sayingTagIds = sayingTagIds;
	}
	
}

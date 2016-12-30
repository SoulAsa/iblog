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
import ren.ayane.iblog.entity.Message;
import ren.ayane.iblog.service.IMessageService;

/**
 * 控制器
 * 留言管理
 * @author SoulAsa
 */
public class MessageAction extends BaseAction {

	@Resource
	private IMessageService messageService;
	private Message message;
	List<Integer> selectedRows;
	private Map<String,Object> json_map;
	
	// 列表页面
	public String listUI() {
		return "listUI";
	}
	
	public String list() throws ActionException {
		try {
			// 创建查询助手对象
			QueryHelper queryHelper = new QueryHelper(Message.class, "m");
			queryHelper.addOrderByProperty("m.messageTime", QueryHelper.ORDER_BY_DESC);
			if (getPage() == 0 || "".equals(getPage())) {
				setPage(1);
			}
			if (getRows() == 0 || "".equals(getRows())) {
				setRows(DEFAULT_ROWS);
			}
			pageResult = messageService.getPageResult(queryHelper, getPage(), getRows());
			json_map = new LinkedHashMap<String, Object>();
			json_map.put("total", messageService.findObjects().size());
			json_map.put("rows", pageResult.getItems());
		} catch (Exception e) {
			// 捕获service层异常，根据异常信息判断是否影响本次操作结果
			throw new ActionException("请求操作失败。"+e.getMessage());
		}
		return SUCCESS;
	}

	// 批量删除
	public String deleteSelected(){
		if (selectedRows != null) {
			for (int id : selectedRows) {
				messageService.delete(id);
			}
		}
		return "listUI";
	}

	// 回复页面
	public String replyUI() {
		if (message != null) {
			if (message.getMessageId() != null) {
				message = messageService.findObjectById(message.getMessageId());
			}
		}
		return "replyUI";
	}
	
	// 回复留言
	public String reply() {
		// 作者回复游客，给定默认用户名和邮箱
		if (message != null) {
			message.setUserName("<font color='red'>ADMIN</font>");
			message.setEmail("admin@admin.com");
			message.setMessageTime(new Timestamp(new Date().getTime()));
			messageService.save(message);
		}
		return "listUI";
	}
	
	public Message getMessage() {
		return message;
	}
	public void setMessage(Message message) {
		this.message = message;
	}
	public List<Integer> getSelectedRows() {
		return selectedRows;
	}
	public void setSelectedRows(List<Integer> selectedRows) {
		this.selectedRows = selectedRows;
	}
	public Map<String, Object> getJson_map() {
		return json_map;
	}
	public void setJson_map(Map<String, Object> json_map) {
		this.json_map = json_map;
	}
	
}

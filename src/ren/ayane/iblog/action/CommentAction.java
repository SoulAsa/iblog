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
import ren.ayane.iblog.entity.Comment;
import ren.ayane.iblog.service.ICommentService;

/**
 * 控制器
 * 评论管理
 * @author SoulAsa
 */
public class CommentAction extends BaseAction {

	@Resource
	private ICommentService commentService;
	private Comment comment;
	List<Integer> selectedRows;
	private Map<String,Object> json_map;
	
	// 列表页面
	public String listUI() {
		return "listUI";
	}
	
	public String list() throws ActionException {
		try {
			// 创建查询助手对象
			QueryHelper queryHelper = new QueryHelper(Comment.class, "m");
			queryHelper.addOrderByProperty("m.commentTime", QueryHelper.ORDER_BY_DESC);
			if (getPage() == 0 || "".equals(getPage())) {
				setPage(1);
			}
			if (getRows() == 0 || "".equals(getRows())) {
				setRows(DEFAULT_ROWS);
			}
			pageResult = commentService.getPageResult(queryHelper, getPage(), getRows());
			json_map = new LinkedHashMap<String, Object>();
			json_map.put("total", commentService.findObjects().size());
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
				commentService.delete(id);
			}
		}
		return "listUI";
	}

	// 回复页面
	public String replyUI() {
		if (comment != null) {
			if (comment.getCommentId() != null) {
				comment = commentService.findObjectById(comment.getCommentId());
			}
		}
		return "replyUI";
	}
	
	// 回复评论
	public String reply() {
		// 作者回复游客，给定默认用户名和邮箱
		if (comment != null) {
			comment.setUserName("<font color='red'>ADMIN</font>");
			comment.setEmail("admin@admin.com");
			comment.setCommentTime(new Timestamp(new Date().getTime()));
			commentService.save(comment);
		}
		return "listUI";
	}
	
	public Comment getComment() {
		return comment;
	}
	public void setComment(Comment comment) {
		this.comment = comment;
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

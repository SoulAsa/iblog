package ren.ayane.iblog.action;

import java.io.File;
import java.net.URLDecoder;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import ren.ayane.core.action.BaseAction;
import ren.ayane.core.exception.ActionException;
import ren.ayane.core.utils.QueryHelper;
import ren.ayane.iblog.entity.Link;
import ren.ayane.iblog.service.ILinkService;

/**
 * 控制器
 * 友情链接管理
 * @author SoulAsa
 */
public class LinkAction extends BaseAction {

	@Resource
	private ILinkService linkService;
	private Link link;
	private Map<String,Object> json_map;
	List<Integer> selectedRows;
	
	// 文件上传
	private File iconLink;
	private String iconLinkFileName;
	private String iconLinkContentType;
	
	// 列表页面
	public String listUI(){
		return "listUI";
	}
	
	public String list() throws ActionException{
		try {
			// 创建查询助手对象
			QueryHelper queryHelper = new QueryHelper(Link.class, "c");
			if (link != null) {
				if (StringUtils.isNotBlank(link.getLinkName())) {
					link.setLinkName(URLDecoder.decode(link.getLinkName(),"utf-8"));
					queryHelper.addCondition("c.linkName like ?", "%" + link.getLinkName() + "%");
				}
			}
			if (getPage() == 0 || "".equals(getPage())) {
				setPage(1);
			}
			if (getRows() == 0 || "".equals(getRows())) {
				setRows(DEFAULT_ROWS);
			}
			pageResult = linkService.getPageResult(queryHelper, getPage(), getRows());
			json_map = new LinkedHashMap<String, Object>();
			json_map.put("total", linkService.findObjects().size());
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
	public String add() throws Exception {
		if(link != null) {
			if (iconLink != null) {
				/******拿到上传的文件，进行处理******/
				// 把文件上传到upload/link目录
				
				// 获取上传的目录路径
				String path = ServletActionContext.getServletContext().getRealPath("/upload/link");
				// 创建目标文件对象
				File destFile = new File(path,iconLinkFileName);
				// 把上传的文件，拷贝到目标文件中
				FileUtils.copyFile(iconLink, destFile);
				
				link.setIconLink("upload/link/" + iconLinkFileName);
			} else {
				link.setIconLink("images/link/link.png");
			}
			linkService.save(link);
		}
		return "listUI";
	}
	
	// 跳转到编辑页面
	public String editUI() {
		if (link != null && link.getLinkId() != null) {
			link = linkService.findObjectById(link.getLinkId());
		}
		return "editUI";
	}
	
	public String edit() {
		if (link != null) {
			linkService.update(link);
		}
		return "listUI";
	}
	
	// 删除
	public String delete(){
		if (link != null && link.getLinkId() != null) {
			linkService.delete(link.getLinkId());
		}
		return "list";
	}
	
	// 批量删除
	public String deleteSelected(){
		if (selectedRows != null) {
			for (int id : selectedRows) {
				linkService.delete(id);
			}
		}
		return "listUI";
	}
	
	public Link getLink() {
		return link;
	}
	public void setLink(Link link) {
		this.link = link;
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
	public void setIconLink(File iconLink) {
		this.iconLink = iconLink;
	}
	public void setIconLinkFileName(String iconLinkFileName) {
		this.iconLinkFileName = iconLinkFileName;
	}
	public void setIconLinkContentType(String iconLinkContentType) {
		this.iconLinkContentType = iconLinkContentType;
	}
	
}

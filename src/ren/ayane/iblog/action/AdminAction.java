package ren.ayane.iblog.action;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import ren.ayane.core.action.BaseAction;
import ren.ayane.core.constant.Constant;
import ren.ayane.core.page.PageResult;
import ren.ayane.core.utils.QueryHelper;
import ren.ayane.iblog.entity.Admin;
import ren.ayane.iblog.entity.AdminId;
import ren.ayane.iblog.service.IAdminService;
import ren.ayane.iblog.service.ICategoryService;

/**
 * 控制器
 * 文章管理
 * @author SoulAsa
 */
public class AdminAction extends BaseAction {

	@Resource
	private IAdminService adminService;
	private Admin admin;
	
	// 文件上传
	private File iconHead;
	private String iconHeadFileName;
	private String iconHeadContentType;
	
	// 列表页面
	public String info() {
		admin = (Admin)ServletActionContext.getRequest().getSession().getAttribute(Constant.ADMIN);
		if (admin.getId() != null) {
			admin = adminService.findObjectById(admin.getId());
		}
		return "info";
	}
	
	// 跳转到编辑页面
	public String editUI() {
		admin= (Admin)ServletActionContext.getRequest().getSession().getAttribute(Constant.ADMIN);
		if (admin.getId() != null) {
			admin = adminService.findObjectById(admin.getId());
		}
		return "editUI";
	}
	
	public String edit() throws Exception {
		if(admin != null) {
			if (iconHead != null) {
				/******拿到上传的文件，进行处理******/
				// 把文件上传到upload/admin目录
				
				// 获取上传的目录路径
				String path = ServletActionContext.getServletContext().getRealPath("/upload/admin");
				// 创建目标文件对象
				File destFile = new File(path,iconHeadFileName);
				// 把上传的文件，拷贝到目标文件中
				FileUtils.copyFile(iconHead, destFile);
				
				admin.setIconHead("upload/admin/" + iconHeadFileName);
			} else {
				admin.setIconHead("images/admin/admin.png");
			}
			adminService.update(admin);
		}
		return "infoUI";
	}
	

	public Admin getAdmin() {
		return admin;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	public void setIconHead(File iconHead) {
		this.iconHead = iconHead;
	}
	public void setIconHeadFileName(String iconHeadFileName) {
		this.iconHeadFileName = iconHeadFileName;
	}
	public void setIconHeadContentType(String iconHeadContentType) {
		this.iconHeadContentType = iconHeadContentType;
	}
	
}

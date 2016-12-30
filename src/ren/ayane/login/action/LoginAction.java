package ren.ayane.login.action;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;

import ren.ayane.core.constant.Constant;
import ren.ayane.iblog.entity.Admin;
import ren.ayane.iblog.entity.AdminId;
import ren.ayane.iblog.service.impl.AdminService;

import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport {
	
	@Resource
	private AdminService adminService;
	private AdminId adminId;
	private String loginResult;
	
	// 跳转到登陆页面
	public String toLoginUI() {
		return "loginUI";
	}
	
	// 登录
	public String login() {
		if (adminId != null) {
			if (StringUtils.isNotBlank(adminId.getAdmin()) && StringUtils.isNotBlank(adminId.getPwd())) {
				// 根据用户的账号和密码查询用户列表
				Admin admin =  adminService.findObjectById(adminId);
				if (admin != null) { // 说明登录成功
					// 2.1 登录成功
					// 2.1.1 将用户信息保存到session中
					ServletActionContext.getRequest().getSession().setAttribute(Constant.ADMIN, admin);
					// 2.1.3 将用户登录记录到日志文件
					Log log = LogFactory.getLog(getClass());
					log.info("名称为" + admin.getName() + "的管理员登录了系统。");
					// 2.1.4 重定向跳转到首页
					return "home";
				} else { // 登录失败
					loginResult = "账号或密码不正确！";
				}
			} else {
				loginResult = "账号或密码不能为空！";
			}
		} else {
			loginResult = "请输入账号和密码！";
		}
		return toLoginUI();
	}
	
	// 退出，注销
	public String logout() {
		// 清除session中保存的用户信息
		ServletActionContext.getRequest().getSession().removeAttribute(Constant.ADMIN);
		return toLoginUI();
	}

	public AdminId getAdminId() {
		return adminId;
	}
	public void setAdminId(AdminId adminId) {
		this.adminId = adminId;
	}
	public String getLoginResult() {
		return loginResult;
	}
	public void setLoginResult(String loginResult) {
		this.loginResult = loginResult;
	}
	
}

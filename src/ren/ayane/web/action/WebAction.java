package ren.ayane.web.action;

import java.sql.Timestamp;
import java.util.Date;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;

import ren.ayane.core.page.PageResult;
import ren.ayane.core.utils.QueryHelper;
import ren.ayane.iblog.entity.Admin;
import ren.ayane.iblog.entity.Article;
import ren.ayane.iblog.entity.Comment;
import ren.ayane.iblog.entity.Message;
import ren.ayane.iblog.entity.Saying;
import ren.ayane.iblog.service.IAdminService;
import ren.ayane.iblog.service.IArticleService;
import ren.ayane.iblog.service.ICategoryService;
import ren.ayane.iblog.service.ICommentService;
import ren.ayane.iblog.service.ILinkService;
import ren.ayane.iblog.service.IMessageService;
import ren.ayane.iblog.service.ISayingService;
import ren.ayane.iblog.service.ITagService;

import com.opensymphony.xwork2.ActionSupport;

public class WebAction extends ActionSupport {
	
	@Resource
	private ICategoryService categoryService;
	@Resource
	private ITagService tagService;
	@Resource
	private IArticleService articleService;
	@Resource
	private ISayingService sayingService;
	@Resource
	private ILinkService linkService;
	@Resource
	private IAdminService adminService;
	@Resource
	private IMessageService messageService;
	@Resource
	private ICommentService commentService;

	private Admin admin;
	private Article article;
	private Message message;
	private Comment comment;
	
	private PageResult articleResult;
	private PageResult newArticleResult;
	private PageResult topArticleResult;
	private PageResult linkResult;
	private PageResult categoryResult;
	private PageResult tagResult;
	private PageResult pageResult;
	
	private int pageNo;
	private int pageSize;
	// 默认页大小
	public static int DEFAULT_PAGE_SIZE = 4;
	
	
	public String index() {
		// 创建查询助手对象
		QueryHelper queryHelper = new QueryHelper(Article.class, "a");
		// 在主页显示推荐的文章
		queryHelper.addCondition("a.isFlag = ?", true);
		queryHelper.addOrderByProperty("a.readCount", QueryHelper.ORDER_BY_DESC);
		if (articleResult == null) {
			articleResult = new PageResult();
			articleResult.setItems(articleService.findObjects(queryHelper));
		}
		
		// 创建查询助手对象
		QueryHelper newQueryHelper = new QueryHelper(Article.class, "a");
		// 在主页右侧显示最新的前四篇文章
		newQueryHelper.addOrderByProperty("a.createTime", QueryHelper.ORDER_BY_DESC);
		newArticleResult = articleService.getPageResult(newQueryHelper, 1, 4);
		
		// 创建查询助手对象
		QueryHelper topQueryHelper = new QueryHelper(Article.class, "a");
		// 在主页右侧显示点击量前四的文章
		topQueryHelper.addOrderByProperty("a.readCount", QueryHelper.ORDER_BY_DESC);
		topArticleResult = articleService.getPageResult(topQueryHelper, 1, 4);
		
		// 加载友情链接信息
		if (linkResult == null) {
			linkResult = new PageResult();
			linkResult.setItems(linkService.findObjects());
		}
		
		// 加载管理员信息
		admin = adminService.findObjects().get(0);
		// 清空管理员的账号密码
		admin.setId(null);
		return "index";
	}
	
	public String about() {
		admin = adminService.findObjects().get(0);
		// 清空账号密码信息
		admin.setId(null);
		return "about";
	}
	
	public String saying() {
		if (pageNo == 0) {
			pageNo = 1;
		}
		if (pageSize == 0) {
			pageSize = 2;
		}
	
		// 查询所有文章，按时间排序，分页
		QueryHelper queryHelper = new QueryHelper(Saying.class, "s");
		queryHelper.addOrderByProperty("s.createTime", QueryHelper.ORDER_BY_DESC);
		pageResult = sayingService.getPageResult(queryHelper, pageNo, pageSize);

		return "saying";
	}
	
	public String more() {
		if (pageNo == 0) {
			pageNo = 1;
		}
		if (pageSize == 0) {
			pageSize = 2;
		}
	
		// 查询所有文章，按时间排序，分页
		QueryHelper queryHelper = new QueryHelper(Article.class, "a");
		// 如果分类信息不为空，则按分类查询文章
		if (article != null && article.getCategory() != null) {
			if (article.getCategory().getCateId() != null) {
				queryHelper.addCondition("a.category.cateId = ?", article.getCategory().getCateId());
			}
		}
		queryHelper.addOrderByProperty("a.createTime", QueryHelper.ORDER_BY_DESC);
		pageResult = articleService.getPageResult(queryHelper, pageNo, pageSize);

		// 创建查询助手对象
		QueryHelper newQueryHelper = new QueryHelper(Article.class, "a");
		// 在主页右侧显示最新的前四篇文章
		newQueryHelper.addOrderByProperty("a.createTime", QueryHelper.ORDER_BY_DESC);
		newArticleResult = articleService.getPageResult(newQueryHelper, 1, 4);
		
		// 创建查询助手对象
		QueryHelper topQueryHelper = new QueryHelper(Article.class, "a");
		// 在主页右侧显示点击量前四的文章
		topQueryHelper.addOrderByProperty("a.readCount", QueryHelper.ORDER_BY_DESC);
		topArticleResult = articleService.getPageResult(topQueryHelper, 1, 4);

		// 查询所有分类信息
		if (categoryResult == null) {
			categoryResult = new PageResult();
			categoryResult.setItems(categoryService.findObjects());
		}
		
		// 查询所有标签信息
		if (tagResult == null) {
			tagResult = new PageResult();
			tagResult.setItems(tagService.findObjects());
		}
		
		// 加载友情链接信息
		if (linkResult == null) {
			linkResult = new PageResult();
			linkResult.setItems(linkService.findObjects());
		}

		// 加载管理员信息
		admin = adminService.findObjects().get(0);
		// 清空账号密码信息
		admin.setId(null);
		return "more";
	}
	
	public String messageBoard() {
		if (pageNo == 0) {
			pageNo = 1;
		}
		if (pageSize == 0) {
			pageSize = 6;
		}
	
		// 查询所有文章，按时间排序，分页
		QueryHelper queryHelper = new QueryHelper(Message.class, "m");
		queryHelper.addOrderByProperty("m.messageTime", QueryHelper.ORDER_BY_DESC);
		pageResult = messageService.getPageResult(queryHelper, pageNo, pageSize);

		// 加载管理员信息
		admin = adminService.findObjects().get(0);
		// 清空账号密码信息
		admin.setId(null);
		return "messageBoard";
	}
	
	public String article() {
		// 根据文章编号查询文章
		article = articleService.findObjectById(article.getArtId());
		
		if (pageNo == 0) {
			pageNo = 1;
		}
		if (pageSize == 0) {
			pageSize = 6;
		}
		// 查询所有文章，按时间排序，分页
		QueryHelper queryHelper = new QueryHelper(Comment.class, "c");
		queryHelper.addOrderByProperty("c.commentTime", QueryHelper.ORDER_BY_DESC);
		pageResult = commentService.getPageResult(queryHelper, pageNo, pageSize);

		// 创建查询助手对象
		QueryHelper newQueryHelper = new QueryHelper(Article.class, "a");
		// 在主页右侧显示最新的前四篇文章
		newQueryHelper.addOrderByProperty("a.createTime", QueryHelper.ORDER_BY_DESC);
		newArticleResult = articleService.getPageResult(newQueryHelper, 1, 4);
		
		// 创建查询助手对象
		QueryHelper topQueryHelper = new QueryHelper(Article.class, "a");
		// 在主页右侧显示点击量前四的文章
		topQueryHelper.addOrderByProperty("a.readCount", QueryHelper.ORDER_BY_DESC);
		topArticleResult = articleService.getPageResult(topQueryHelper, 1, 4);
		
		// 加载友情链接信息
		if (linkResult == null) {
			linkResult = new PageResult();
			linkResult.setItems(linkService.findObjects());
		}

		// 加载管理员信息
		admin = adminService.findObjects().get(0);
		// 清空账号密码信息
		admin.setId(null);
		return "article";
	}
	
	// 更新文章阅读量
	public void addReadCount() {
		if (article != null) {
			if (article.getArtId() != null) {
				// 根据文章编号查询文章
				article = articleService.findObjectById(article.getArtId());
				// 增加文章阅读量
				articleService.addReadCountByArtId(article);
			}
		}
	}
	
	// 添加留言信息
	public void addMessage() {
		if (StringUtils.equals(message.getMessage().getMessageId(),"message")) {
			message.setMessage(null);
		}
		message.setMessageTime(new Timestamp(new Date().getTime()));
		messageService.save(message);
	}
	
	// 添加留言信息
	public void addComment() {
		if (StringUtils.equals(comment.getComment().getCommentId(),"comment")) {
			comment.setComment(null);
		}
		comment.setCommentTime(new Timestamp(new Date().getTime()));
		commentService.save(comment);
	}

	public Admin getAdmin() {
		return admin;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	public Article getArticle() {
		return article;
	}
	public void setArticle(Article article) {
		this.article = article;
	}
	public Message getMessage() {
		return message;
	}
	public void setMessage(Message message) {
		this.message = message;
	}
	public Comment getComment() {
		return comment;
	}
	public void setComment(Comment comment) {
		this.comment = comment;
	}
	public PageResult getArticleResult() {
		return articleResult;
	}
	public void setArticleResult(PageResult articleResult) {
		this.articleResult = articleResult;
	}
	public PageResult getNewArticleResult() {
		return newArticleResult;
	}
	public void setNewArticleResult(PageResult newArticleResult) {
		this.newArticleResult = newArticleResult;
	}
	public PageResult getTopArticleResult() {
		return topArticleResult;
	}
	public void setTopArticleResult(PageResult topArticleResult) {
		this.topArticleResult = topArticleResult;
	}
	public PageResult getLinkResult() {
		return linkResult;
	}
	public void setLinkResult(PageResult linkResult) {
		this.linkResult = linkResult;
	}
	public PageResult getCategoryResult() {
		return categoryResult;
	}
	public void setCategoryResult(PageResult categoryResult) {
		this.categoryResult = categoryResult;
	}
	public PageResult getTagResult() {
		return tagResult;
	}
	public void setTagResult(PageResult tagResult) {
		this.tagResult = tagResult;
	}
	public PageResult getPageResult() {
		return pageResult;
	}
	public void setPageResult(PageResult pageResult) {
		this.pageResult = pageResult;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
}

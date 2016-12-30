package ren.ayane.iblog.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ren.ayane.iblog.dao.IMessageDao;
import ren.ayane.iblog.entity.Message;
import ren.ayane.iblog.service.IMessageService;
import ren.ayane.core.service.impl.BaseService;

@Service("messageService")
public class MessageService extends BaseService<Message> implements IMessageService {

	private IMessageDao messageDao;
	
	@Resource
	public void setMessageDao(IMessageDao messageDao) {
		super.setIBaseDao(messageDao);
		this.messageDao = messageDao;
	}
}

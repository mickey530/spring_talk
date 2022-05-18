package com.talk.pay.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.talk.pay.domain.PayVO;
import com.talk.pay.mapper.PayMapper;

@Service
public class PayServiceImpl implements PayService{
	
	@Autowired
	private PayMapper mapper;

	@Override
	public void insertPay(PayVO vo) {
		mapper.insertPay(vo);
		
	}
	
	
	

}

package com.example.demo.service;

import org.springframework.stereotype.Service;

import com.example.demo.dao.JongChanDAO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class JongChanService {

	private final JongChanDAO dao;
}

package org.cg.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.cg.domain.Criteria;
import org.cg.domain.PageMaker;
import org.cg.domain.QAnswerVO;
import org.cg.domain.QfileVO;
import org.cg.domain.QuestionVO;
import org.cg.service.QnaService;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("/qna")
public class QnaController {
	Logger logger= Logger.getLogger(QnaController.class);
	
	
	@Inject
	QnaService qservice;
	
	
	@GetMapping("/list")
	public void getQna(@ModelAttribute("cri") Criteria cri,Model model){
		
		logger.info("qna/list get..........");
		
		logger.info(cri);
		
		List<QuestionVO> list=qservice.getQList(cri);
		
		model.addAttribute("list",list);
		model.addAttribute("pageMaker",new PageMaker(cri, qservice.getTotal(cri)));
		
	}
	
	
	@GetMapping("/qview")
	public void getQview(@ModelAttribute("cri") Criteria cri,QuestionVO vo,Model model){
		
		
		logger.info("qna/qview get..........");
		
		vo=qservice.qReadOne(vo);
		
		
//		답변
		List<QAnswerVO> alist= qservice.getAList(vo);
		
		logger.info(vo);
		
		model.addAttribute("vo",vo);
		model.addAttribute("cri",cri);
		model.addAttribute("alist",alist);
		
	}
	
	@PostMapping("/qview")
	public String modiQuestion(QuestionVO vo,Criteria cri,RedirectAttributes rttr){
		
		
		logger.info("qna/qview post..........");
		
		
		logger.info(vo);
		
		
		qservice.qUpdate(vo);
		
		
		rttr. addAttribute("qno",vo.getQno());
		rttr. addAttribute("page",cri.getPage());
		rttr. addAttribute("type",cri.getType());       //없어서 안가나보다   
		rttr. addAttribute("keyword",cri.getKeyword()); //없어서 안가나보다

		
		return "redirect:qview";
		
	}
	
	@Transactional
	@GetMapping("/delete")
	public String qDelete(QuestionVO vo){
		logger.info("delete get.................");
		logger.info(vo);
		
		qservice.aDeleteAll(vo);
		qservice.qDelete(vo);
		
		
		return "redirect:list";
	}
	
	@GetMapping("/regi")
	public void qRegiget(){
		logger.info("regi get............");
		
	}
	
	@Transactional
	@PostMapping("/regi")
	public String qRegipost(QuestionVO vo,MultipartFile[] file) throws IOException{
	
		logger.info("regi post...........");
		
		
		//댓글등록		
		qservice.qInsert(vo);
		//댓글등록
		
		
		
		List<String> flist = new ArrayList<String>();
		
		
		//파일업로드 부분
		for(int i=0;i<file.length;i++){
		
		QfileVO fvo = new QfileVO();
		
		logger.info("originalName: " + file[i].getOriginalFilename());
		logger.info("size: " + file[i].getSize());
		logger.info("contentType: "+file[i].getContentType());
		UUID uid = UUID.randomUUID();
		
		String saveName = uid.toString() +"_"+file[i].getOriginalFilename();
		
		File target = new File("c:\\zzz\\upload",saveName);
		
		FileCopyUtils.copy(file[i].getBytes(), target);
		
		flist.add(saveName);

		fvo.setFilename(saveName);
		fvo.setFqno(vo.getQno());
		qservice.fInsert(fvo);
		
		}
		//파일업로드 부분
		
		
		
		logger.info("flist : "+flist);
		//여기서 DB에 저장 되야할듯 
		
		
		
		//10초 딜레이
		try {
			Thread.sleep(20000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		//삭제해보기
		for(int i=0;i<flist.size();i++){
		new File("c:\\zzz\\upload\\"+flist.get(i).replace('/', File.separatorChar)).delete();
		}
		
		
		
		
		return "redirect:list";
	}
	
//	======================================ANSWER=========================//
	
		@PostMapping("/amodi")
		public String modiAnswer(Criteria cri,QuestionVO vo,RedirectAttributes rttr){
			
			logger.info("amodi post.........");
			
		// QAnswerVO 를 받는순간 에러 나는데 왜 에러가 나는지 도저히 모르겠음 //	

			
			return "redirect:qview";
		}
	
		
		
		@GetMapping("/adelete")
		public String delAnswer(QuestionVO vo,Criteria cri,int aano,RedirectAttributes rttr){
			
			logger.info("AnswerDelete get................");
			
			logger.info(vo);
			logger.info(aano);
			logger.info(cri);
			
			//QAnswerVO 를 받으면 에러가 나기때문에 이방법으로 한것 //
			//에러가 왜나는지 정말 궁금함 //
			QAnswerVO avo = new QAnswerVO();
			avo.setAano(aano);
			
			
			qservice.aDelete(avo);
			
			
			rttr.addAttribute("qno",vo.getQno());
			rttr.addAttribute("keyword",cri.getKeyword());
			rttr.addAttribute("type",cri.getType());
			
			return "redirect:qview";
			
		}
		
		
		@PostMapping("/aregi")
		public String regiAnswer(QAnswerVO avo,Criteria cri,RedirectAttributes rttr){
			
			logger.info("regiAnswer Post........................");
			logger.info(avo);
			qservice.aInsert(avo);

			rttr.addAttribute("qno",avo.getAqno());
			rttr.addAttribute("page",cri.getPage());
			rttr.addAttribute("type",cri.getPage());
			rttr.addAttribute("keyword",cri.getKeyword());			
			
			return "redirect:qview";
		}
		
		
		
		

}

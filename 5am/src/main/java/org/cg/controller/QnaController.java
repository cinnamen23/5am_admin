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
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


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
		
//      파일		
		List<QfileVO> flist=qservice.getFileList(vo);
		
		logger.info(vo);
		logger.info("=====1======");
		logger.info("=====1======");
		
		logger.info(flist);
		
		model.addAttribute("vo",vo);
		model.addAttribute("cri",cri);
		model.addAttribute("alist",alist);
		model.addAttribute("flist",flist);
		
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
		rttr.addFlashAttribute("msg","success");
		
		
		return "redirect:qview";
		
	}
	
	@Transactional
	@GetMapping("/delete")
	public String qDelete(QuestionVO vo){
		logger.info("delete get.................");
		logger.info(vo);
		
//		여기서 qno로 그 파일값 가져오는 쿼리 
		List<QfileVO> qflist=qservice.getFileList(vo);
		logger.info(qflist);
		
		for(int i=0;i<qflist.size();i++){
			logger.info("=============================================================");
			logger.info("=============================================================");
			logger.info("======================"+qflist.get(i).getFilename()+"======================");
			logger.info("=============================================================");
			logger.info("=============================================================");
			new File("c:\\zzz\\5am\\"+qflist.get(i).getFilename()).delete();
		}
		
		
		qservice.delAllFile(vo);
		qservice.aDeleteAll(vo);
		qservice.qDelete(vo);
		logger.info("여기 처리됬나요 ?????????????????");
		
		return "redirect:list";
		
	}
	
	
	@GetMapping("/regi")
	public void qRegiget(){
		logger.info("regi get............");
		
	}
	
	@Transactional
	@PostMapping("/regi")
	public String qRegipost(QuestionVO vo,MultipartFile[] file,RedirectAttributes rttr) throws IOException{
	
		logger.info("regi post...........");
		
		logger.info(vo);
		
		//질문등록		
		qservice.qInsert(vo);
		//질문등록
		
		logger.info(vo);		
		
		
		List<String> flist = new ArrayList<String>();
		
		
		if(file.length==1&file[0].getSize()==0){
			
		}else{
		
		//파일업로드 부분
		for(int i=0;i<file.length;i++){
		
			logger.info("=====2======");
			logger.info("=====2======");
			
		logger.info(file);
			
			
		QfileVO fvo = new QfileVO();
		
		logger.info("originalName: " + file[i].getOriginalFilename());
		logger.info("size: " + file[i].getSize());
		logger.info("contentType: "+file[i].getContentType());
		UUID uid = UUID.randomUUID();
		
		String saveName = uid.toString() +"_"+file[i].getOriginalFilename();
		
		File target = new File("c:\\zzz\\5am",saveName);
		
		FileCopyUtils.copy(file[i].getBytes(), target);
		
		flist.add(saveName);

		fvo.setFilename(saveName);
		fvo.setFqno(vo.getQno());
		
		logger.info("월요일아침=================================================");
		logger.info(fvo);
		
		qservice.fInsert(fvo);
		
		}
		//파일업로드 부분
		
		}//ifelse 끝
		
		
		logger.info("flist : "+flist);
		//여기서 DB에 저장 되야할듯 
		
		
		
		//삭제해보기
//		for(int i=0;i<flist.size();i++){
//		new File("c:\\zzz\\5am\\"+flist.get(i).replace('/', File.separatorChar)).delete();
//		}
		
		
		rttr.addFlashAttribute("msg","success");
		
		return "redirect:list?page=1";
	}
	
//	======================================ANSWER=========================//
	
		@PostMapping("/amodi")		
		public String modiAnswer(Criteria cri,QuestionVO vo,QAnswerVO avo,RedirectAttributes rttr){
			
			logger.info("amodi post.........");
			logger.info(vo);
			logger.info(cri);
			logger.info(avo);
		// QAnswerVO 를 받는순간 에러 나는데 왜 에러가 나는지 도저히 모르겠음 //	
			qservice.aUpdate(avo);
			
			rttr.addFlashAttribute("msg","success");
			rttr.addAttribute("qno",vo.getQno());
			rttr.addAttribute("keyword",cri.getKeyword());
			rttr.addAttribute("type",cri.getType());
			
			
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
		
//		=================================파일업로드===========================================//
		
		@PostMapping("/upload")
		public void uploadPost(@RequestParam("qno") int qno){
			System.out.println("upload post....");
			System.out.println("upload post....");
			System.out.println("upload post....");
			
			List<String> flist=new ArrayList<String>();

			flist.add("하하");
			flist.add("호호");
			flist.add("후후");
			
		}
		
		@PostMapping("/fdelete")
		public ResponseEntity<String> deleteFile(String fname){
			
			logger.info("fdelete post...........");
			logger.info(fname);
			logger.info("fdelete post...........");
			
				new File("c:\\zzz\\5am\\"+fname.replace('/', File.separatorChar)).delete();
			
				qservice.delOneFile(fname);
				
				
				
			return new ResponseEntity<String>("delete", HttpStatus.OK) ;
		}
		
		
		

}

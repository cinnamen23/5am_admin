package org.cg.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/give")
public class SendZipController {

	static public void zipFolder(String srcFolder, String destZipFile) throws Exception {
	    ZipOutputStream zip = null;
	    FileOutputStream fileWriter = null;

	   fileWriter = new FileOutputStream(destZipFile);
	    zip = new ZipOutputStream(fileWriter);

	   addFolderToZip("", srcFolder, zip);
	    zip.flush();
	    zip.close();
	  }

	 static private void addFileToZip(String path, String srcFile, ZipOutputStream zip)
	      throws Exception {

	   File folder = new File(srcFile);
	    if (folder.isDirectory()) {
	      addFolderToZip(path, srcFile, zip);
	    } else {
	      byte[] buf = new byte[1024];
	      int len;
	      FileInputStream in = new FileInputStream(srcFile);
	      zip.putNextEntry(new ZipEntry(path + "/" + folder.getName()));
	      while ((len = in.read(buf)) > 0) {
	        zip.write(buf, 0, len);
	      }
	    }
	  }

	 static private void addFolderToZip(String path, String srcFolder, ZipOutputStream zip)
	      throws Exception {
	    File folder = new File(srcFolder);

	   for (String fileName : folder.list()) {
	      if (path.equals("")) {
	        addFileToZip(folder.getName(), srcFolder + "/" + fileName, zip);
	      } else {
	        addFileToZip(path + "/" + folder.getName(), srcFolder + "/" + fileName, zip);
	      }
	    }
	  }
	
	
	
	@GetMapping(value="/zip")
	@ResponseBody
	public byte[] sendZip(@RequestParam("elv")String elv) throws Exception {

		System.out.println(elv);
		
		zipFolder("C:/zzz/5am//"+elv, "C:/zzz/5am/"+elv+".zip");
		
		
        FileInputStream fin = new FileInputStream("C:/zzz/5am/"+elv+".zip");

        byte[] arr = IOUtils.toByteArray(fin);
    
        return arr;

    }
	
	
}

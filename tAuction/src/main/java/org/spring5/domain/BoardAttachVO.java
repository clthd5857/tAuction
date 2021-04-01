package org.spring5.domain;

import lombok.Data;

@Data
public class BoardAttachVO {

	private String uuid;
	private String uploadPath;
	private String fileName;
	private String fileType;
	
	private Long bno;
	
//	public String getPathName(String uploadPath, String uuid, String fileName) {
//		String path =uploadPath+"/"+uuid+"_"+fileName; 
//		return path;
//	}
	
	public String getPathName() {
		String path=this.uploadPath+"/"+this.uuid+"_"+this.fileName;
		return path;
	}
	
}

package com.myteam.myapp.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.util.UUID;
import javax.imageio.ImageIO;
import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;


public class UploadProfile {

	public static String uploadFile(String uploadPath,
									String originalName,
									String index)	
	throws Exception{
		
		File directory = new File(uploadPath);
		File[] files = directory.listFiles();
		for(File file : files) {
		    if(file.delete()) {
		        System.out.println(file.getName() + " 삭제 성공");
		    } else {
		        System.out.println(file.getName() + " 삭제 실패");
		    }
		}
		
		System.out.println("uploadPath"+uploadPath);
		
		UUID uid = UUID.randomUUID();
		String savedName = null;
		if(index.equals("show")) {
			savedName = originalName;
		}
		else
			savedName= uid.toString() + "_" + originalName;
	    
	    File target = new File(uploadPath,savedName);
		target.createNewFile();
		String uploadedFileName = null;
		uploadedFileName = makeThumbnail(uploadPath,savedName);
	    File originalFile = new File(uploadPath, savedName);
	    originalFile.delete();
				
		return uploadedFileName;
	}	

//	private  static String makeIcon(String uploadPath,
////			String path,
//			String fileName)throws Exception{
//
//		String iconName = uploadPath+
////				path+
//				File.separator+fileName;				
//		
//		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
//	}
	
//	private static String calcPath(String uploadPath){	
//		
//		Calendar cal = Calendar.getInstance();
//		String yearPath = File.separator+cal.get(Calendar.YEAR);
//		
//		String monthPath = yearPath+
//				File.separator +
//				new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
//		
//		String datePath = monthPath +
//				File.separator +
//				new DecimalFormat("00").format(cal.get(Calendar.DATE));
//			
//		makeDir(uploadPath, yearPath, monthPath, datePath);
//		
//		return datePath;
//	}
	
//	private static void makeDir(String uploadPath,String...paths){
//			
//		if(new File(uploadPath+paths[paths.length -1]).exists())
//			return;
//		
//		for(String path : paths){
//			
//			File dirPath = new File(uploadPath + path);				
//			
//			if (! dirPath.exists()){			
//				dirPath.mkdir();				
//			}
//		}
//	}
	
	private static String makeThumbnail(String uploadPath,
			String fileName) throws Exception{
		
		BufferedImage sourceImg = 
				ImageIO.read(new File(uploadPath
						,fileName));
		BufferedImage destImg = 
				Scalr.resize(sourceImg, 
						Scalr.Method.AUTOMATIC, 
						Scalr.Mode.FIT_TO_HEIGHT,100);
		
		String thumbnailName = 
				uploadPath +  
				File.separator + 
				"s-"+fileName;
		
		File newFile = new File(thumbnailName);
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
	
		boolean flag = ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}	
}

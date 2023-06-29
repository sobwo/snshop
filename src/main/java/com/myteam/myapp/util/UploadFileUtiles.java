package com.myteam.myapp.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;
import javax.imageio.ImageIO;
import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;


public class UploadFileUtiles {
	
	private static final Logger logger = 
			LoggerFactory.getLogger(UploadFileUtiles.class);

	public static String uploadFile(String uploadPath,
									String originalName,byte[] fileData,String index)	
	throws Exception{
		
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() +"_"+originalName;
		
//		String path = UploadFileUtiles.class.getResource("").getPath();
//		System.out.println("����Ŭ����path:"+path);
		
//  	����Ǵ� �ý��� ��ġ	
//		System.out.println(System.getProperty("user.dir"));
       
//        String realpath = request.getSession().getServletContext().getRealPath(uploadPath);
//		System.out.println("realpath:"+realpath);
        
//		String savedPath = calcPath(uploadPath);
		
		File target = new File(uploadPath,savedName);
//  	����� ���� �����
//		String loc = target.getCanonicalPath();

		FileCopyUtils.copy(fileData,target);
		
		String formatName = originalName.substring(originalName.lastIndexOf(".")+1);
		System.out.println("formatName:"+formatName);
		String uploadedFileName = null;
		
		if(index.equals("product") || index.equals("contents"))
			return "/"+savedName;
		
		if(MediaUtils.getMediaType(formatName) != null){
			uploadedFileName = makeThumbnail(uploadPath, savedName);
		}else{
			uploadedFileName = makeIcon(uploadPath,savedName);
		}
				
		// 2018/05/03/s-dssddssf-2323423.jpg
		return uploadedFileName;
	}	

	private  static String makeIcon(String uploadPath,
			String fileName)throws Exception{

		String iconName = uploadPath+File.separator+fileName;				
		
		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
	
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
//		logger.info(datePath);
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
//	//		System.out.println("dirPath:"+dirPath);			
//			
//			if (! dirPath.exists()){			
//				dirPath.mkdir();				
//			}
//		}
//	}
	
	private static String makeThumbnail(String uploadPath,
			String fileName) throws Exception{
		
		System.out.println("uploadPath"+uploadPath);
		System.out.println("fileName"+fileName);
		
		BufferedImage sourceImg = 
				ImageIO.read(new File(uploadPath,fileName));
		System.out.println("sourceImg"+sourceImg);
		BufferedImage destImg = 
				Scalr.resize(sourceImg, 
						Scalr.Method.AUTOMATIC, 
						Scalr.Mode.FIT_TO_HEIGHT,100);
		
		String thumbnailName = 
				uploadPath + 
				File.separator + 
				"s-"+fileName;
		
	//	System.out.println("thumbnailName"+thumbnailName);
		
		File newFile = new File(thumbnailName);
	//	System.out.println("newFile:"+newFile);
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
	
	//	System.out.println("destImg"+destImg);
		boolean flag = ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		System.out.println("���翩�� flag"+flag);
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}	
}

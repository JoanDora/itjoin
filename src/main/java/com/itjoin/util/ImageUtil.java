package com.itjoin.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.imageio.ImageIO;

public final class ImageUtil {
	private static char[] chars="123456789ABCDEFG".toCharArray();
	private static final int SIZE=4;//4?????
	private static final int width=200;
	private static final int height=100;
	private static final int LINE_SIZE=20;//4?????
	/**
	 * Map-String:???4?????
	 * Map-BufferedImage:???????
	 * @return
	 */
	public static Map<String,BufferedImage> createMap(){
		Map<String,BufferedImage> map=new HashMap<String,BufferedImage>();
		//?????????
		BufferedImage image=new BufferedImage(width, height,
				BufferedImage.TYPE_INT_RGB);
		//???????
		Graphics g=image.getGraphics();
		//???????????????????
		g.setColor(Color.LIGHT_GRAY);
		g.fillRect(0, 0, width, height);
		//????????
		getRandomLine(g);
		//д?????
		String num=getRandomNum(g, chars);
		map.put(num, image);
		return map;
	}
	/**
	 * @param image ????????????????????????
	 * @return ???????
	 */
	public static InputStream getImageInputStream(BufferedImage image){
		InputStream is=null;
		ByteArrayOutputStream baos=new ByteArrayOutputStream();
		//??????????"JPEG"
		try {
			ImageIO.write(image, "JPEG", baos);
			is=new ByteArrayInputStream(baos.toByteArray());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return is;
	}
	/**?????????λ????????
	 * @param chars  ??????????????Χ
	 * @return
	 */
	private static String getRandomNum(Graphics g,char[] chars){
		Random random=new Random();
		StringBuffer sb=new StringBuffer();
		for(int i=0;i<SIZE;i++){
			g.setColor(getRandomColor());
			g.setFont(getRandomFont());
			int a=random.nextInt(chars.length);
			g.drawString(chars[a]+"", i*width/SIZE, height/2);
			sb.append(chars[a]);
		}
		return sb.toString();
	}
	/**????????????? 
	 * @return
	 */
	private static Color getRandomColor(){	
		Random random=new Random();
		return new Color(random.nextInt(255),random.nextInt(255), random.nextInt(255));
	}
	/**????????????--
	 * @param Graphics ??????????
	 * @return
	 */
	private static void getRandomLine(Graphics g){
		Random random=new Random();
		for(int i=0;i<LINE_SIZE;i++){
			g.setColor(getRandomColor());
			g.setFont(getRandomFont());
			g.drawLine(random.nextInt(width),random.nextInt(height), 
					random.nextInt(width),random.nextInt(height));
		}
	}
	/**????????
	 * @return
	 */
	private static Font getRandomFont(){	
		Random random=new Random();
		return new Font(null, Font.BOLD+Font.ITALIC, (random.nextInt(10)+70));
	}
}
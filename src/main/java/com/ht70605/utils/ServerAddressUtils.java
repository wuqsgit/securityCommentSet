package com.ht70605.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;

import java.net.Inet4Address;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.util.Enumeration;

public class ServerAddressUtils {

	private static Logger logger = LoggerFactory.getLogger("ServerAddressUtils");
	
	private static String serviceIp = null;
	
		public static String getServerIp(){
		if(StringUtils.isEmpty(serviceIp)){
    	try {
			Enumeration<NetworkInterface> allNetInterfaces = NetworkInterface.getNetworkInterfaces();
			InetAddress ip = null;
			while (allNetInterfaces.hasMoreElements())
			{
			NetworkInterface netInterface = allNetInterfaces.nextElement();
			Enumeration<InetAddress> addresses = netInterface.getInetAddresses();
			while (addresses.hasMoreElements())
			{
			ip = addresses.nextElement();
			if (ip != null && ip instanceof Inet4Address)
			{
				if(!"127.0.0.1".equals(ip.getHostAddress())){
					logger.info("IP = " + ip.getHostAddress());
					serviceIp = ip.getHostAddress();
				}
			
			} 
			}
			}
		} catch (SocketException e) {
			e.printStackTrace();
		}
		}
    	return serviceIp;
}
}

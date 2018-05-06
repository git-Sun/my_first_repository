package j_1;
import static java.lang.Math.random;
import java.net.InetAddress;
import java.net.UnknownHostException;
public class J_1 {
    public int shuzu()
    {
        int su30[][]=new int[10][5];
        for(int i=0;i<su30.length;i++)
        {
            for(int j=0;j<su30[i].length;j++)
            {
                su30[i][j]=(int) random();
            }
        }
        return 0;
    }
    public static void main(String[] args) {
        //TCP测试 网络程序设计 http 80 ftp 21
        //WAN（wide area network) LAN(local area network)
        try
        {
            InetAddress numaddress;
            numaddress = InetAddress.getByName("www.oracle.com");
            System.out.println(numaddress.toString());
            InetAddress local_ip;
            local_ip=InetAddress.getLocalHost();
            String localname=local_ip.getHostName();
            String ip=local_ip.getHostAddress();
            System.out.println("本机名："+localname);
            System.out.println("本机地址："+ip);
            //socket 套接字
        }catch(UnknownHostException e)
        {
            System.out.println("网络错误");
        }
    }
    
}

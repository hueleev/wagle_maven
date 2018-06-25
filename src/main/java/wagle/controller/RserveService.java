package wagle.controller;

import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.REngineException;
import org.rosuda.REngine.Rserve.RConnection;

public class RserveService {

   private static RserveService instance=new RserveService();
   public static void main(String[] args) {
      
   }

   public static RserveService getInstance() {
      return instance;
   }
   //Rscript.jsp���� ����Ǵ� �޼ҵ�
   public String RScript(String imgname,String path) throws REXPMismatchException, REngineException{
      
      RConnection c = new RConnection();
      String imgpath=path+"img"+"/"+imgname;
      System.out.println(imgpath);
      System.out.println("png('"+imgpath+"',width=600,height=500)");
         c.parseAndEval("png('"+imgpath+"',width=600,height=500)");
         System.out.println("setwd('c:/r_temp')");
         c.parseAndEval("setwd('c:/r_temp')");
         System.out.println("data1<-read.csv(\"r_test1.csv\",header=F, encoding='utf-8')");
         c.parseAndEval("data1<-read.csv(\"r_test1.csv\",header=F)");
         
         System.out.println("name2<-c('10��','20��','30��','40��','50��','60��')");
         c.parseAndEval("name2<-c('10��','20��','30��','40��','50��','60��')");
         
         System.out.println("barplot(as.matrix(data1[1:7,2:7]),main=paste(\"���ɺ� ī�װ��� �α��ִ� �ͱ� ������Ȳ\"),ylab=\"ȸ����\",beside=T,col=rainbow(7),ylim=c(0,10),names.arg=name2)");
         //c.parseAndEval("barplot(as.matrix(data1[1:7,2:7]),main=paste(\"���ɺ� ī�װ��� �α��ִ� �ͱ� ������Ȳ\"),ylab=\"ȸ����\",beside=T,col=rainbow(8),ylim=c(0,20))");
         c.parseAndEval("barplot(as.matrix(data1[1:7,2:7]),ylab=\"������ �ͱ۷�\",beside=T,col=rainbow(7),ylim=c(0,10),names.arg=name2)");
 
         System.out.println("abline(h=seq(0,10,5),lty=3,lwd=0.2)");
         c.parseAndEval("abline(h=seq(0,10,5),lty=3,lwd=0.2)");
         System.out.println("name<-c('�米/�θ�','�ι���/å','����','��ȭ/����','������','�丮/����','�ܱ�/���')");
         c.parseAndEval("name<-c('�米/�θ�','�ι���/å','����','��ȭ/����','������','�丮/����','�ܱ�/���')");
         
         System.out.println("legend(35,10,name,cex=0.8,fill=rainbow(7),bg=\"white\")");
         c.parseAndEval("legend(35,10,name,cex=0.8,fill=rainbow(7),bg=\"white\")");
         
         System.out.println("dev.off()");
         c.parseAndEval("dev.off()");
         c.close();
      
         return imgname;
      
   }
   
}
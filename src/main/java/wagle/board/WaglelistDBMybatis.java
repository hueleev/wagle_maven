package wagle.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import mybatis.MybatisConnector;




public class WaglelistDBMybatis extends MybatisConnector{
	private final String namespace = "ldg.mybatis";
	private static WaglelistDBMybatis instance = new WaglelistDBMybatis();
	
	private WaglelistDBMybatis() {

	}

	public static WaglelistDBMybatis getInstance() {
		return instance;
	}

	
	SqlSession sqlSession;
	
	//�ͱ��� �����Ѵ�.
	public void wagleOpen(WagleDataBean wagle) {
		sqlSession = sqlSession();

		int number=sqlSession.selectOne(namespace+".getNextNumber",wagle);
		
		wagle.setWboardid(number);
					
		sqlSession.insert(namespace+".wagleOpen",wagle);
		sqlSession.commit(); 
		sqlSession.close();
		
	}
	
	//���� ������ �ͱ� ����
	public int getWagleCount1(String email) {
		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("email", email);
		
		int number=sqlSession.selectOne(namespace+".getWagleCount1",map);
		
		sqlSession.close();
		
		return number;
	}
	
	//���� ������ �ͱ� ���� 
	public int getWagleCount2(String email) {
		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("email", email);
		
		int number=sqlSession.selectOne(namespace+".getWagleCount2",map);
		
		sqlSession.close();
		
		return number;
	}
	
	//�ͱ��� ȸ�� ��
	public int getWagleCount3(int wboardid) {
		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("wboardid", wboardid);
		
		int number=sqlSession.selectOne(namespace+".getWagleCount3",map);
		
		sqlSession.close();
		
		return number;
	}
	
	//���� ������ �ͱ��� ����Ʈ
	public List getWagles1(String email) {
		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("email", email);

		List li = sqlSession.selectList(namespace+".getWagles1",map);
		
		sqlSession.close();
		return li;
	}
	
	//���� ������ �ͱ��� ����Ʈ 
	public List getWagles2(String email) {
		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("email", email);

		
		List li = sqlSession.selectList(namespace+".getWagles2",map);
		sqlSession.close();
		return li;
	}
	

  	//�ͱ� ȸ�� ���ϱ�
 	public List getWagleMember(int wboardid) {
		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("wboardid", wboardid);
		
		List li = sqlSession.selectList(namespace+".getWagleMember",map);
		sqlSession.close();
		return li;
	}
 	
 	//ȣ��Ʈ ���� ���ϱ�
 	public String getHost(int wboardid) {
 		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("wboardid", wboardid);
		
		String host = sqlSession.selectOne(namespace+".getHost",map);
		sqlSession.close();
		return host;
 	}
 	
 	public String getHostemail(int wboardid) {
 		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("wboardid", wboardid);
		
		String hostemail = sqlSession.selectOne(namespace+".getHostemail",map);
	
		sqlSession.close();
		return hostemail;
 	}
	
	
	//���� ������ �ͱ��� ���� ����
	public WagleDataBean getWagle(int wboardid) {
		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("wboardid", wboardid);
		
		
		WagleDataBean wagle = sqlSession.selectOne(namespace+".getWagle",map);
		sqlSession.close();
		
		return wagle;
	}
	
	public WagleDataBean getWagle(int wboardid, String chk) {
		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("wboardid", wboardid);
		
		if(chk.equals("wagleContent")) {
			sqlSession.update(namespace+".plusReadCount", map);
		}
		
		
		WagleDataBean wagle = sqlSession.selectOne(namespace+".getWagle",map);
		sqlSession.commit();
		sqlSession.close();
		
		return wagle;
	}
	
	public int updateWagle(WagleDataBean wagle) {
		
		sqlSession = sqlSession();
		
		//�ͱ����� �ͱ��� �����Ѵ�.
		int chk = sqlSession.update(namespace+".updateWagle",wagle);
		
		//�ͱ����� �ͱ۸��� �ٲٸ� �ͱ۷����׵� �ͱ۸��� �ٲ��.
		int chk2 = sqlSession.update(namespace+".updateWagle2",wagle);
		sqlSession.commit(); 
		sqlSession.close();
		
		System.out.println(chk);
		
		return chk;
	}
	
	//�ͱ����� �ͱ��� �����Ѵ�.
	 public int deleteWagle(int wboardid) throws Exception {
		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("wboardid", wboardid);
		
		int chk=sqlSession.delete(namespace+".deleteWagle",map);
		
		sqlSession.commit();
		sqlSession.close();
		
		return chk;
	}
	 
	 //��ܹ��� �ͱۿͱۿ��� ��� �ͱ۸���Ʈ Ȯ�� ���� 
	 public List getWaglelist() {
			sqlSession = sqlSession();
			
			List li = sqlSession.selectList(namespace+".getWaglelist");
			sqlSession.close();
			return li;
	}
	 
	 public List getWaglelist(String wname) {
			sqlSession = sqlSession();
			
			Map map = new HashMap();
			map.put("wname", wname);
			List li = sqlSession.selectList(namespace+".getWaglelistSearch", map);
			sqlSession.close();
			return li;
	}

	 public List searchWaglelist(String wcategory) {
		 	sqlSession = sqlSession();
			Map map = new HashMap();
			map.put("wcategory", wcategory);
			
			List li = sqlSession.selectList(namespace+".searchWaglelist",map);
			sqlSession.close();
			return li;
	 }
	 
	 //���ϴ� �ͱۿ� �����Ѵ�. 
	 public void wagleJoin(int wboardid,String wagler,String wcategory,String wname,String wagleremail) {
			sqlSession = sqlSession();
			Map map = new HashMap();
			map.put("wboardid", wboardid);
			map.put("wagler", wagler);
			map.put("wname", wname);
			map.put("wcategory", wcategory);
			map.put("wagleremail",wagleremail);


			sqlSession.insert(namespace+".wagleJoin",map);
			
			sqlSession.commit(); 
			sqlSession.close();
	}
	 
	 //��ġ �ʴ� �ͱۿ��� Ż���Ѵ�.
	 public int wagleOut(int wboardid,String wagleremail) throws Exception {
			sqlSession = sqlSession();
			Map map = new HashMap();
			map.put("wboardid", wboardid);
			map.put("wagleremail", wagleremail);
			
			int chk=sqlSession.delete(namespace+".wagleOut",map);
			
			sqlSession.commit();
			sqlSession.close();
			
			return chk;
	}
	 
	 public List imgslide() {
			sqlSession = sqlSession();
			List li = sqlSession.selectList(namespace+".imgslide");
			sqlSession.close();
			return li;
	}
	 
	//�ͱۿͱ� ����Ʈ���� ���� ������ �ͱ����� �ƴ��� üũ�Ͽ� ��ư�� Ȱ��ȭ ���θ� �����Ѵ�
	public boolean waglechk(int wboardid, String wagleremail) {
		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("wboardid", wboardid);
		map.put("wagleremail", wagleremail);
		boolean li=true;
		Map<String,String> map2=sqlSession.selectOne(namespace+".waglechk",map);
		
		if (map2!=null) {
			//���Ե� ����
			li=true;
		}else {
			//���Ծȵ� ����
			li=false;
		}
		return li;
	}
	
	// ������ - �ͱ۸�� ��� ���� =============================================
	public List getWaglelist_ad (int startRow, int endRow) {
		sqlSession= sqlSession();
		Map map = new HashMap();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List li = sqlSession.selectList(namespace + ".getWaglelist_ad",map);
		sqlSession.close();
		return li;
	}
	
	public List getWaglelist_adWNAME (int startRow, int endRow, String wname) {
		sqlSession= sqlSession();
		Map map = new HashMap();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("wname", wname);
		List li = sqlSession.selectList(namespace + ".getWaglelist_adWNAME",map);
		sqlSession.close();
		return li;
	}
	
	public List getWaglelist_adWHOST (int startRow, int endRow, String whost) {
		sqlSession= sqlSession();
		Map map = new HashMap();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("whost", whost);
		List li = sqlSession.selectList(namespace + ".getWaglelist_adWHOST",map);
		sqlSession.close();
		return li;
	}
	
	
	
	// �ͱ� ��ü ��� ����.
	public int getWagleCount_ad() {
		int num = 0;
		sqlSession=sqlSession();
		num = sqlSession.selectOne(namespace+".getWagleCount_ad");
		sqlSession.close();
		return num;
	}
	public int getWagleCount_adWNAME(String wname) {
		int num = 0;
		sqlSession=sqlSession();
		Map map = new HashMap();
		map.put("wname", wname);
		num = sqlSession.selectOne(namespace+".getWagleCount_adWNAME", map);
		sqlSession.close();
		return num;
	}
	public int getWagleCount_adWHOST(String whost) {
		int num = 0;
		sqlSession=sqlSession();
		Map map = new HashMap();
		map.put("whost", whost);
		num = sqlSession.selectOne(namespace+".getWagleCount_adWHOST", map);
		sqlSession.close();
		return num;
	}
	// =================================================================


   public List rscript () {
      sqlSession= sqlSession();
      List li = sqlSession.selectList(namespace + ".readRScript");
      sqlSession.close();
      return li;
   }
	   
   public String getWname1(int wboardid) {
       sqlSession = sqlSession();
      Map map = new HashMap();
      map.put("wboardid", wboardid);
      
      String wname = sqlSession.selectOne(namespace+".getWname1",map);
      sqlSession.close();
      return wname;
    }
   
   // ����Ŭ����
   public List wordcloud() {
		sqlSession = sqlSession();
		List li = sqlSession.selectList(namespace+".wordcloud");
		sqlSession.close();
		return li;
   }

	
	
	
}

/*package wagle.chat;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/webGroup")
public class WebSocketServerGroup {
	private static Set<Session> clients = Collections
			.synchronizedSet(new HashSet<Session>());

	@OnMessage
	public void onMessage(String message, Session session) throws IOException {
		System.out.println(message);
		synchronized (clients) {
			//���� ä���� ���� �ҽ�
			//group��:�̸�:
			 
			String id = null;
		    
			String movemessage 
			= session.getRequestParameterMap().get("name") 
			+ ":" + message;
			
			for (Session client : clients) {
				//cid  : client���� ������ group��	
				//sid  : ������ ������ �ִ� session  group��	
		String cid = (String) session.getRequestParameterMap().get("group").get(0);
		String sid = (String) client.getRequestParameterMap().get("group").get(0);
		
		System.out.println(sid+":"+cid);
		// �ڱ� �ڽ����״� ������ ����
				if (!client.equals(session)) {
		if (cid.equals(sid))			
		client.getBasicRemote().sendText(movemessage);
					
				}

			}
		}
	}

	@OnOpen
	public void onOpen(Session session) {
		System.out.println("onOpen");
		System.out.println(session.getRequestParameterMap());
		// Add session to the connected sessions set
		clients.add(session);
		try {
			onMessage("���� �����ϼ̽��ϴ�.", session);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@OnClose
	public void onClose(Session session) {
		System.out.println("onClose");
		// Remove session from the connected sessions set
		clients.remove(session);
	}
}*/
&lt;!DOCTYPE html&gt;
&lt;html lang=&quot;en&quot;&gt;

&lt;head&gt;
&lt;meta charset=&quot;UTF-8&quot;&gt;
&lt;meta name=&quot;viewport&quot; content=&quot;width=device-width, initial-scale=1.0&quot;&gt;

&lt;meta http-equiv=&quot;X-UA-Compatible&quot; content=&quot;ie=edge&quot;&gt;
&lt;title&gt;Home&lt;/title&gt;
&lt;link rel=&quot;stylesheet&quot; href=&quot;style.css&quot;&gt;
&lt;/head&gt;

&lt;body&gt;
&lt;!-- Header start --&gt;
&lt;% if(session.getAttribute(&quot;uname&quot;) != null){ %&gt;
&lt;div class=&quot;container&quot; name=&#39;dashboard&#39; style=&quot;height: 100px;&quot;&gt;
&lt;div style=&quot;float:left&quot;&gt;
&lt;table&gt;
&lt;tr&gt;
&lt;td&gt;Username&lt;/td&gt;
&lt;td&gt;&lt;%= session.getAttribute(&quot;uname&quot;) %&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
&lt;td&gt;Balance&lt;/td&gt;
&lt;td&gt;&lt;%= session.getAttribute(&quot;amount&quot;) %&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
&lt;td&gt;Phone No.&lt;/td&gt;
&lt;td&gt;&lt;%= session.getAttribute(&quot;ph_number&quot;) %&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;/table&gt;
&lt;/div&gt;
&lt;div style=&quot;float:right&quot;&gt;
&lt;br&gt;
&lt;form action=&quot;logout.jsp&quot;&gt;
&lt;input type=&quot;submit&quot; value=&quot;Logout&quot; class=&#39;mt-btn&#39; name=&#39;logout&#39;&gt;
&lt;/form&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;!-- Header end --&gt;
&lt;div class=&quot;container&quot; style=&quot;background-image: inherit;&quot;&gt;

&lt;form action=&quot;operationController.jsp&quot; method=&quot;POST&quot;&gt;
&lt;table&gt;
&lt;tr&gt;
&lt;td&gt;&lt;input type=&quot;submit&quot; class=&#39;mt-btn&#39; value=&quot;Transfer&quot;
name=&quot;operation&quot;&gt;&lt;/td&gt;
&lt;td&gt;&lt;input type=&quot;submit&quot; class=&#39;mt-btn&#39; value=&quot;Deposit&quot;
name=&quot;operation&quot;&gt;&lt;/td&gt;
&lt;td&gt;&lt;input type=&quot;submit&quot; class=&#39;mt-btn&#39; value=&quot;Statements&quot;
name=&quot;operation&quot;&gt;&lt;/td&gt;
&lt;td&gt;&lt;input type=&quot;submit&quot; class=&#39;mt-btn&#39; value=&quot;Apply&quot;
name=&quot;operation&quot;&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;/table&gt;
&lt;/form&gt;
&lt;/div&gt;
&lt;img src=&quot;back.jpg&quot; alt=&quot;Image here&quot; style=&quot;margin-left: 30px; width: 95%;&quot;&gt;
&lt;%
}else{
%&gt;
&lt;center&gt;Session is invalid please login &lt;a
href=&quot;welcome.jsp&quot;&gt;here&lt;/a&gt;&lt;/center&gt;
&lt;%
}
%&gt;
&lt;/body&gt;
&lt;/html&gt;
Operation_controller.jsp
&lt;%
if(session == null || session.getAttribute(&quot;uname&quot;) == null){
%&gt; Your session has already expired. Please login &lt;a
href=&quot;welcome.jsp&quot;&gt;here&lt;/a&gt; &lt;%
}else{
if(request.getParameter(&quot;operation&quot;).equals(&quot;Transfer&quot;)){
out.println(&quot;Tranfer page&quot;);

%&gt;&lt;jsp:forward page=&#39;transfer.jsp&#39;/&gt;&lt;%
}else if(request.getParameter(&quot;operation&quot;).equals(&quot;Deposit&quot;)){
out.println(&quot;Deposit page&quot;);
%&gt;&lt;jsp:forward page=&#39;deposit.jsp&#39; /&gt;&lt;%
}else if(request.getParameter(&quot;operation&quot;).equals(&quot;Statements&quot;)){
out.println(&quot;Statements page&quot;);
%&gt;&lt;jsp:forward page=&#39;statements.jsp&#39; /&gt;&lt;%
}else if(request.getParameter(&quot;operation&quot;).equals(&quot;Apply&quot;)){
out.println(&quot;Apply page&quot;);
%&gt;&lt;jsp:forward page=&#39;apply.jsp&#39; /&gt;&lt;%
}
}
%&gt;
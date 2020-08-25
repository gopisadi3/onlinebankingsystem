&lt;%@page import=&#39;java.sql.*&#39; %&gt;

&lt;%
String uname = request.getParameter(&quot;username&quot;);
String password = request.getParameter(&quot;password&quot;);

Class.forName(&quot;oracle.jdbc.driver.OracleDriver&quot;);
Connection con =
DriverManager.getConnection(&quot;jdbc:oracle:thin:@localhost:1521:xe&quot;, &quot;system&quot;,
&quot;tiger&quot;);

String loginQuery = String.format(
&quot;select count(*) from account where uname=&#39;%s&#39; and password=&#39;%s&#39;&quot;, uname,
password);
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(loginQuery);
while(rs.next()){
int count = rs.getInt(1);
System.out.println(count);

if(count == 1){
System.out.println(&quot;Login success&quot;);
session.setAttribute(&quot;uname&quot;, uname);

String loginDetails = String.format(&quot;select * from account where uname=&#39;%s&#39;
and password=&#39;%s&#39;&quot;,
uname,password);
rs = stmt.executeQuery(loginDetails);
while(rs.next()){
session.setAttribute(&quot;amount&quot;, Double.toString(rs.getDouble(3)));
session.setAttribute(&quot;email&quot;, rs.getString(4));
session.setAttribute(&quot;ph_number&quot;, rs.getString(5));
}
%&gt;&lt;jsp:forward page=&#39;home.jsp&#39; /&gt;&lt;%
}else{
System.out.println(&quot;Wrong password or uname&quot;);
System.out.println(uname);
System.out.println(password);
out.println(&quot;&lt;script&gt;window.onload =
function(){document.getElementById(&#39;message&#39;).innerHTML = &#39;Username or
password is incorrect&#39;;}&lt;/script&gt;&quot;);
%&gt;&lt;jsp:include page=&#39;welcome.jsp&#39; /&gt;&lt;%
}
}
%&gt;
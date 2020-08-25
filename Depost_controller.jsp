&lt;%@ page import=&#39;java.sql.*&#39; %&gt;
&lt;%
if(session == null || session.getAttribute(&quot;uname&quot;) == null){
%&gt; Your session has already expired. Please login &lt;a
href=&quot;welcome.jsp&quot;&gt;here&lt;/a&gt; &lt;%
}else{
double deposit_amount =
Double.parseDouble(request.getParameter(&quot;transfer_amount&quot;));
double current_amount =
Double.parseDouble((String)session.getAttribute(&quot;amount&quot;));

Class.forName(&quot;oracle.jdbc.driver.OracleDriver&quot;);

Connection con =
DriverManager.getConnection(&quot;jdbc:oracle:thin:@localhost:1521:xe&quot;,&quot;system&quot;,&quot;tiger
&quot;);

Statement stmt = con.createStatement();
String amountUpdateQuery = String.format(&quot;update account set amount = %f
where uname = &#39;%s&#39;&quot;,
current_amount + deposit_amount, (String)session.getAttribute(&quot;uname&quot;));

stmt.executeUpdate(amountUpdateQuery);
session.setAttribute(&quot;amount&quot;,
Double.toString(current_amount+deposit_amount));
%&gt;Payment Successfull.&lt;br&gt;You will be redirected to home page...&lt;%

response.setHeader(&quot;Refresh&quot;, &quot;2;url=home.jsp&quot;);
}
%&gt;
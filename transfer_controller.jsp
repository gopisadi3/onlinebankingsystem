&lt;%@ page import=&#39;java.sql.*&#39; %&gt;
&lt;%
if(session == null || session.getAttribute(&quot;uname&quot;) == null){
%&gt; Your session has already expired. Please login &lt;a
href=&quot;welcome.jsp&quot;&gt;here&lt;/a&gt; &lt;%

}else{
String transfer_name = request.getParameter(&quot;transfer_name&quot;);
double transfer_amount =
Double.parseDouble(request.getParameter(&quot;transfer_amount&quot;));
double current_amount =
Double.parseDouble((String)session.getAttribute(&quot;amount&quot;));

Class.forName(&quot;oracle.jdbc.driver.OracleDriver&quot;);
Connection con =
DriverManager.getConnection(&quot;jdbc:oracle:thin:@localhost:1521:xe&quot;,&quot;system&quot;,&quot;tiger
&quot;);

Statement stmt = con.createStatement();
if(current_amount &gt;= transfer_amount){

String retriveQuery = String.format(&quot;select amount from account where
uname =&#39;%s&#39;&quot;, transfer_name);
ResultSet rs = stmt.executeQuery(retriveQuery);
double personAmount = 0;
while(rs.next()){
personAmount = rs.getDouble(1);
}
double totalAmount = personAmount + transfer_amount;
System.out.println(&quot;transfer_controller.jsp -- to users balance would be &quot; +
(transfer_amount+personAmount));

String currentAmountQuery = String.format(&quot;update account set amount = %f
where uname=&#39;%s&#39;&quot;,
current_amount-transfer_amount, (String)session.getAttribute(&quot;uname&quot;));
stmt.executeUpdate(currentAmountQuery);
session.setAttribute(&quot;amount&quot;, Double.toString(current_amount-
transfer_amount));

session.setAttribute(&quot;transfer_amount&quot;, Double.toString(transfer_amount));

String amountQuery = String.format(&quot;update account set amount = %f where
uname=&#39;%s&#39;&quot;, totalAmount, transfer_name);
int rowsAffected = stmt.executeUpdate(amountQuery);
System.out.println(&quot;Rows affected are &quot; + rowsAffected);
if(rowsAffected == 0){
%&gt;Payment Failed.&lt;%

String failRecoveryQuery = String.format(&quot;update account set amount = %f
where uname=&#39;%s&#39;&quot;,
current_amount, (String)session.getAttribute(&quot;uname&quot;));

session.setAttribute(&quot;amount&quot;, Double.toString(current_amount));
}else{
String updateTransactionQuery = String.format(&quot;insert into transactions
values(&#39;%s&#39;,&#39;%s&#39;,%f)&quot;,
(String)session.getAttribute(&quot;uname&quot;), transfer_name, transfer_amount);
stmt.executeUpdate(updateTransactionQuery);
session.setAttribute(&quot;content&quot;,&quot;Your transaction of amount INR. &quot; +
(String)session.getAttribute(&quot;transfer_amount&quot;) + &quot; was successfull. &lt;br&gt; If this
wasn&#39;t you please contact customer care.&quot;);
session.setAttribute(&quot;subject&quot;,&quot;Your transaction was successfull&quot;);
%&gt;&lt;jsp:include page=&#39;mailController.jsp&#39; /&gt;&lt;%
%&gt;Payment Successfull.&lt;%
}
%&gt;&lt;br&gt;You will be redirected to home page...&lt;%
}else{
%&gt;Insufficient Balence.&lt;br&gt;You will be redirected to home page...&lt;%
}
response.setHeader(&quot;Refresh&quot;, &quot;2;url=home.jsp&quot;);
}
%&gt;
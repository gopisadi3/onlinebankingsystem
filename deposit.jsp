&lt;!DOCTYPE html&gt;
&lt;html lang=&quot;en&quot;&gt;

&lt;head&gt;
&lt;meta charset=&quot;UTF-8&quot;&gt;
&lt;meta name=&quot;viewport&quot; content=&quot;width=device-width, initial-scale=1.0&quot;&gt;
&lt;meta http-equiv=&quot;X-UA-Compatible&quot; content=&quot;ie=edge&quot;&gt;
&lt;title&gt;Deposit&lt;/title&gt;
&lt;link rel=&quot;stylesheet&quot; href=&quot;style.css&quot;&gt;
&lt;script&gt;
function amountValidation(){
var am = document.getElementById(&#39;transfer_amount&#39;).value;
if(am &lt;= 0){
document.getElementById(&#39;transfer_amount&#39;).value = &#39;&#39;;
}
}
&lt;/script&gt;
&lt;/head&gt;

&lt;body&gt;

&lt;!-- Header start --&gt;
&lt;% if(session != null &amp;&amp; session.getAttribute(&quot;uname&quot;) != null){ %&gt;
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
&lt;!-- Tranfer start --&gt;
&lt;div class=&quot;container&quot;&gt;
&lt;form action=&quot;deposit_controller.jsp&quot;&gt;
&lt;table&gt;
&lt;tr&gt;
&lt;td&gt;&lt;label for=&quot;transfer_amount&quot;&gt;Amount : &lt;/label&gt;&lt;/td&gt;

&lt;td&gt;&lt;input type=&quot;text&quot; name=&quot;transfer_amount&quot; id=&quot;transfer_amount&quot;
class=&quot;txt&quot; onchange=&#39;amountValidation();&#39; required&gt;&lt;br&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
&lt;td colspan=&quot;2&quot; align=&quot;center&quot;&gt;&lt;input type=&quot;submit&quot; value=&quot;Deposit&quot;
class=&quot;mt-btn&quot; name=&#39;deposit&#39;&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;/table&gt;
&lt;/form&gt;
&lt;/div&gt;
&lt;%
}else{
%&gt;
&lt;center&gt;Session is invalid please login &lt;a href=&quot;welcome.jsp&quot;&gt;here&lt;/a&gt;&lt;/center&gt;
&lt;%
}
%&gt;
&lt;/body&gt;

&lt;/html&gt;
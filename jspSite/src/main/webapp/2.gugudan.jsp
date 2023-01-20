<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<TITLE>방가워요 JSP</TITLE>
</HEAD>
<BODY>
	<center>
		<H2>JSP 잘났어 정말 별꼴이야!!!!!!!!!</H2>
		
			<img src='tomcat.svg' />
			<H2>JSP구구단(스크립렛  &lt;% %&gt;)</H2>
			<table border=1 width=600 bgcolor=#CCFF33  bordercolordark=#FF6600
				cellspacing=0>
				<%for(int i=1;i<=9;i++){ %>
				<tr>
					<%for(int j=2;j<=9;j++){ %>
					<td align=center><%out.print(j);%>*<%out.print(i);%>=<%out.print(i*j);%></td>
					<%}%>
				</tr>
				<%}%>
			</table>
			<hr>
			<H2>JSP구구단(스크립렛 &lt;% %&gt;)</H2>
			<table border=1 width=600 bgcolor=#CCFF33  bordercolordark=#FF6600
				cellspacing=0>
				<%for(int i=1;i<=9;i++){ %>
				<tr>
					<%
					for(int j=2;j<=9;j++){
						String formatString = 
								String.format("<td align=center>%d*%d=%d</td>", j,i,j*i);
						out.print(formatString);
					}
					%>
				</tr>
				<%}%>
			</table>
			<hr>
			<H2>JSP구구단(표현식 &lt;%= %&gt;)</H2>
			<table border=1 width=600 bgcolor=#CCFF33  bordercolordark=#FF6600
				cellspacing=0>
				<%for(int i=1;i<=9;i++){ %>
				<tr>
					<%for(int j=2;j<=9;j++){ %>
					<td align=center><%=j%>*<%=i%>=<%=i*j%></td>
					<%}%>
				</tr>
				<%}%>
			</table>
	</center>		
	<br />
</BODY>
</HTML>

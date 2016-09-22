<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="persistence.RelatorioDao" %>

<% 

    request.setAttribute("dados", new RelatorioDao().consultar());

%>

Coti Infomatica - WebDeveloper
<hr size="1"/>

<form name="f" action="Controle" method="post">
    
    Digite o nome do professor:
    <input type="text" name="nome"/>
    <input type="submit" value="Gerar Relatorio"/>
    
</form>

Relaão das turmas abertas <br/>
<table border="1" width="80%">
    <tr>
        <th>Código</th>
        <th>Turma</th>
        <th>Professor</th>
        <th>Email</th>
        <th>Curso</th>
        <th>Descrição</th>
    </tr>
    
    <c:forEach items="${dados}" var="d">
        <tr>
            <td>${d.idturma}</td>
            <td>${d.turma}</td>
            <td>${d.professor}</td>
            <td>${d.email}</td>
            <td>${d.curso}</td>
            <td>${d.descricao}</td>
        </tr>
    </c:forEach>
</table>
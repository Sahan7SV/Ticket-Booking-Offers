<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Offer Management</title>
    <style>
        {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            text-align: center;
            background-color: #f8f9fa;
        }

        header {
            background-color: #343a40;
            color: #fff;
            padding: 10px 0;
        }

        nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        nav a {
            color: #fff;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        nav a:hover {
            color: #f8f9fa;
        }

        nav ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
        }

        nav li {
            display: inline;
            margin-left: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            margin-bottom: 20px;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ddd;
        }

        th {
            background-color: #343a40;
            color: #fff;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .button {
            display: inline-block;
            padding: 8px 12px;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            text-decoration: none;
            margin-bottom: 10px;
        }

        .button.edit {
            background-color: #ffc107; 
        }

        .button.edit:hover {
            background-color: #e0a800;
        }

        .button.delete {
            background-color: #dc3545; 
        }

        .button.delete:hover {
            background-color: #c82333;
        }

        .button.new {
            background-color: #28a745; 
        }

        .button.new:hover {
            background-color: #218838;
        }

        h1 {
            font-size: 36px;
            margin-bottom: 20px;
        }
        
        @media screen and (max-width: 600px) {
            table, th, td {
                padding: 8px;
            }
        }
    </style>
</head>
<body>
    <header>
        <h1>Offer Management</h1>
    </header>
    <div align="center">
        <table>
            <caption><h2>List of Offers</h2></caption>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Type</th>
                <th>Range</th>
                <th>Code</th>
                <th>Actions</th>
            </tr>
            <c:forEach var="Offer" items="${listOffer}">
                <tr>
                    <td><c:out value="${Offer.id}" /></td>
                    <td><c:out value="${Offer.name}" /></td>
                    <td><c:out value="${Offer.email}" /></td>
                    <td><c:out value="${Offer.type}" /></td>
                    <td><c:out value="${Offer.range}" /></td>
                    <td><c:out value="${Offer.code}" /></td>
                    <td>
                        <a href="edit?id=<c:out value='${Offer.id}' />" class="button edit">Edit</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="delete?id=<c:out value='${Offer.id}' />" class="button delete">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <nav>
            <a href="new" class="button new">Add New Offer</a>
        </nav>
    </div>    
</body>
</html>

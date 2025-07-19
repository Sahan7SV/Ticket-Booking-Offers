<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Offers</title>
    <style>
        h1 {
            text-align: center;
            font-family: 'Libre Baskerville', serif;
            font-size: 43px;
        }
        p {
            text-align: center;
            font-family: 'Libre Baskerville', serif;
            font-size: 16px;
        }
        .form-buttons {
            text-align: right;
        }
        input[type="text"]:focus,
        input[type="email"]:focus {
            box-shadow: 0 0 5px #007bff;
        }
        input[type="submit"], input[type="reset"], input[type="button"] {
            background-color: green;
            color: white;
            border: none;
            padding: 8px 12px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-family: 'Libre Baskerville', serif;
            font-size: 15px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 5px;
        }
        input[type="submit"]:hover, input[type="reset"]:hover, input[type="button"]:hover {
            background-color: darkgreen;
        }
        input[type="reset"] {
            background-color: blue;
        }
        input[type="reset"]:hover {
            background-color: darkblue;
        }
        input[type="button"] {
            background-color: red;
        }
        input[type="button"]:hover {
            background-color: darkred;
        }
        body {
            margin: 0;
            padding: 0;
            font-family: 'Libre Baskerville', serif;
            font-size: 18px;
        }
        .container {
            display: flex;
            height: 100vh;
        }
        .left-panel {
            flex: 0 0 65%;
            background-image: url('https://img.freepik.com/premium-photo/buses-running-suburban-highways-ai-technology-generated-image_1112-13364.jpg');
            background-size: cover;
            background-position: center; 
            background-repeat: no-repeat;
        }
        .right-panel {
            flex: 0 0 35%;
            background-image: url('https://wallpaperaccess.com/full/7104431.jpg');
            background-size: cover;
            background-position: center; 
            background-repeat: no-repeat;
            padding: 20px;
            box-sizing: border-box;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        .right-panel form {
            width: 80%;
            max-width: 400px;
            background-color:rgba(255, 255, 255, 0.7);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(180, 178, 170, 0.896);
        }
        input[type="text"],
        input[type="email"] {
            width: 250px;
            padding: 4px;
            border: 2px solid #ccc;
            border-radius: 6px;
            font-size: 15px;
            font-family: 'Libre Baskerville', serif;
            color: #333333c5;
        }
        select {
            width: 160px;
            padding: 4px;
            border: 2px solid #ccc;
            border-radius: 6px;
            font-size: 15px;
            font-family: 'Libre Baskerville', serif;
            color: #333333c5;
            cursor: pointer;
        }
    </style>
</head>
<body>   
    <div class="container">
        <div class="left-panel"></div>
        <div class="right-panel">
            <c:if test="${offer != null}">
                <form action="update" method="post" onsubmit="return validateForm()">
            </c:if>
            <c:if test="${offer == null}">
                <form action="insert" method="post" onsubmit="return validateForm()">
            </c:if>
                <caption>
                    <h2>
                        <c:if test="${offer != null}">
                            Edit Offer
                        </c:if>
                    </h2>
                </caption>
                <c:if test="${offer != null}">
                    <input type="hidden" name="id" value="<c:out value='${offer.id}' />" />
                </c:if>  
                <h1>Special Offers</h1>
                <p>To avail our special offers available on these days, please fill out the form below</p><br> 
                <label for="name">Full Name:</label><br>
                <input type="text" id="name" name="name" size="45" value="<c:out value='${offer.name}' />"><br><br>
                <label for="email">Email :</label><br>
                <input type="email" id="email" name="email" size="45" value="<c:out value='${offer.email}' />"><br><br>
                <label for="type">Select Ticket Type :</label><br>
                <input type="radio" id="luxury" name="type" value="luxury" ${offer.type == 'luxury' ? 'checked' : ''}>
                <label for="luxury" style="font-size: 16px">Luxury Ticket</label><br>
                <input type="radio" id="semi-luxury" name="type" value="semi-luxury" ${offer.type == 'semi-luxury' ? 'checked' : ''}>
                <label for="semi-luxury" style="font-size: 16px">Semi Luxury Ticket</label><br>
                <input type="radio" id="normal" name="type" value="normal" ${offer.type == 'normal' ? 'checked' : ''}>
                <label for="normal" style="font-size: 16px">Normal Ticket</label><br><br>
                <label for="range">Select Price Range :</label>
                <select id="range" name="range">
                    <option value="Less than Rs. 500" ${offer.range == 'Less than Rs. 500' ? 'selected' : ''}>Less than Rs. 500</option>
                    <option value="Rs. 500 to Rs. 2000" ${offer.range == 'Rs. 500 to Rs. 2000' ? 'selected' : ''}>Rs. 500 to Rs. 2000</option>
                    <option value="Rs. 2001 to Rs. 5000" ${offer.range == 'Rs. 2001 to Rs. 5000' ? 'selected' : ''}>Rs. 2001 to Rs. 5000</option>
                    <option value="More than Rs. 5000" ${offer.range == 'More than Rs. 5000' ? 'selected' : ''}>More than Rs. 5000</option>
                </select><br><br>
                <input type="checkbox" id="checkbox" name="checkbox">
                <label for="checkbox" style="font-size: 16px">I have a promo code</label><br><br>
                <label for="code">Promo Code:</label><br>
                <input type="text" id="code" name="code" disabled value="<c:out value='${offer.code}' />" />
                <p id="validationResult"></p><br>
                <div class="form-buttons">
                    <input type="submit" value="Apply Offer" id="Apply">
                    <input type="reset" value="Clear">
                    <input type="button" value="Cancel" onclick="window.location.href='home.jsp';">
                </div>
            </form>
        </div>
    </div>  

    <script>
        document.getElementById('checkbox').addEventListener('change', function() {
            document.getElementById('code').disabled = !this.checked;
        });

        document.getElementById('Apply').addEventListener('click', function() {
            alert("Hello! You will receive further information about the offer in your email. Please check your email. Thank you for contacting us. Have a nice day.");
        });

        document.addEventListener('DOMContentLoaded', function() {
            var promoCodeInput = document.getElementById("code");
            promoCodeInput.addEventListener("input", validatePromoCode);

            function validatePromoCode() {
                var promoCode = promoCodeInput.value;
                var regex = /^[B]{1}\d{5}$/;
                var validationResult = document.getElementById("validationResult");
                if (regex.test(promoCode)) {
                    validationResult.textContent = "Promo code is valid!";
                    validationResult.style.color = "green";
                } else {
                    validationResult.textContent = "Invalid promo code. Please enter a valid promo code.";
                    validationResult.style.color = "red";
                }
            }
        });

        function validateForm() {
            var name = document.getElementById("name").value;
            var email = document.getElementById("email").value;
            var type = document.querySelector('input[name="type"]:checked');
            var range = document.getElementById("range").value;

            if (!name) {
                alert("Full Name is required.");
                return false;
            }

            if (/\d/.test(name)) {
                alert("Full Name cannot contain numbers.");
                return false;
            }

            if (!email) {
                alert("Email is required.");
                return false;
            }

            if (!type) {
                alert("Please select a ticket type.");
                return false;
            }

            if (!range) {
                alert("Please select a price range.");
                return false;
            }

            return true;
        }
    </script>
</body>
</html>

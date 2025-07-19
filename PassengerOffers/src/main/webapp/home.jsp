<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
  <title>Online Bus Ticket Reservation System</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
  <style>
    body {
      background-color: #f2f2f2;
      margin: 0;
      padding: 0;
      font-family: Arial, sans-serif;
      padding-top: 180px; 
    }

   header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color: white;
    padding: 10px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    position: fixed;
    width: 100%;
    top: 0;
    z-index: 1000;
  }

  .logo-container {
    display: flex;
    align-items: center;
    position: relative;
  }

  .logo-container img {
    height: 80px;
  }

  .company-name {
    font-size: 30px; 
    font-weight: bold;
    font-family: "Times New Roman", Times, serif;
    margin-left: 10px;
    color: green;
  }

  .horizontal-line {
    position: absolute;
    bottom: -5px;
    width: 100%;
    border: none;
    border-top: 2px solid rgb(0, 188, 0);
  }

  .horizontal-line.small {
    bottom: -10px;
    width: 80%;
    border-top-width: 2px; 
  }

  header ul {
    list-style-type: none;
    padding: 0;
    margin: 0;
  }

  header ul li {
    display: inline;
    margin-right: 10px;
  }

  header ul li a {
    text-decoration: none;
    color: black;
    font-size: 16px; 
  }

  header ul li a.home-button {
    background-color: green;
    color: white;
    padding: 5px 10px;
    border-radius: 5px;
  }

  header ul li a.home-button:hover {
    background-color: darkgreen;
  }

  header ul li a:hover {
    color: green;
    text-decoration: none;
    transform: scale(1.1);
    transition: transform 0.3s ease, color 0.3s ease; 
  }

    .content {
      text-align: center;
      margin-top: -75px; 
      position: relative;
    }

    .content img {
      width: 100%;
      height: auto;
    }

    .welcome-text {
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      background-color: rgba(4, 115, 95, 0.748); 
      padding: 20px;
      border-radius: 10px;
      width: 80%; 
      max-width: 800px;
      opacity: 0;
      transition: opacity 1s ease-in-out;
    }

    .text-container {
      text-align: center;
      color: white; 
      font-family: "Times New Roman", Times, serif;
    }

    .text-container h1 {
      font-size: 60px; 
    }

    .text-container h2 {
      font-size: 24px; 
    }

    .content:hover .welcome-text {
      opacity: 1;
    }

    footer {
      background-color: black;
      color: white;
      padding: 20px;
      display: flex;
      justify-content: space-between;
    }

    footer .section {
      flex: 1;
    }

    footer ul {
      list-style-type: none;
      padding: 0;
    }

    footer ul li {
      display: block;
      margin-bottom: 10px;
    }

    footer ul li a {
      color: white;
      text-decoration: none;
    }

    footer ul li a:hover {
      color: green;
    }

    footer p {
      text-align: left;
    }

    footer h2 {
      color: green;
    }

    .footer-icons a {
      color: white;
      text-decoration: none;
      margin-right: 10px;
      font-size: 24px;
    }

    .footer-icons a:hover {
      color: green;
    }
  </style>
</head>

<body>
  <header>
    <div class="logo-container">
      <img src="https://static.vecteezy.com/system/resources/previews/029/887/796/original/minimal-and-abstract-logo-of-bus-icon-school-bus-silhouette-isolated-design-green-bus-vector.jpg" alt="Panaroma Skyways Logo">
      <div class="company-name">Panaroma Skyways</div>
      <!-- <hr class="horizontal-line"> -->
      <!-- <hr class="horizontal-line small"> -->
    </div>
    <ul>
      <li><a href="#" class="home-button">Home</a></li>
      <li><a href="">Services</a></li>
      <li><a href="">Payment</a></li>
      <li><a href="offer-form.jsp">Offers</a></li>
      <li><a href="">Feedback</a></li>
      <li></li>
      <li></li>
      <li></li>
    </ul>
  </header>

  <div class="content">
    <img src="https://www.crb.ae/assets/images/luxury-bus/Mercedes-Benz-Tourismo-thumb.jpg" alt="Bus Image">
    <div class="welcome-text">
      <div class="text-container">
        <h1>Welcome to Panaroma Skyway</h1>
        <h2 class="tagline">Travel with Ease, Book with Confidence!</h2>
      </div>
    </div>
  </div>

  <footer>
    <div class="section">
      <h2>Useful Links</h2>
      <ul>
        <li><a href="#">Home</a></li>
        <li><a href="#">About us</a></li>
        <li><a href="#">Services</a></li>
        <li><a href="#">Terms and condition</a></li>
        <li><a href="#">Privacy policy</a></li>
      </ul>
    </div>

    <div class="section">
      <h2>Contact Us</h2>
      <p>
        Walivita Road SLIIT <br>
        Malabe <br>
        Sri Lanka <br>
        <strong>Phone:</strong> +94 712345678<br>
        <strong>Email:</strong> info@panaromaskyway.com<br><br>

        <span class="footer-icons">
          <a href="#"><i class="fab fa-twitter-square"></i></a>
          <a href="#"><i class="fab fa-facebook-square"></i></a>
          <a href="#"><i class="fab fa-instagram-square"></i></a>
          <a href="#"><i class="fab fa-linkedin"></i></a>
        </span>
      </p>
    </div>

    <div class="section">
      <h2>Panaroma Skyways</h2>
      <p>Welcome to Panaroma Skyway, your one-stop solution for convenient and hassle-free bus ticket booking. We understand the importance of efficient travel planning, and our platform is designed to make your journey comfortable and enjoyable.</p>
    </div>
  </footer>
</body>
</html>

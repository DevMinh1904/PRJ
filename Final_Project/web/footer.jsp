<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    /* Footer Styles */
    .footer {
        background-color: #2c3e50;
        color: #ecf0f1;
        padding: 3rem 2rem 2rem;
        margin-top: 3rem;
    }
    
    .footer-content {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
        max-width: 1200px;
        margin: 0 auto;
    }
    
    .footer-section {
        flex: 1;
        min-width: 200px;
        margin-bottom: 2rem;
        padding: 0 1rem;
    }
    
    .footer-section h3 {
        color: #3498db;
        margin-bottom: 1.2rem;
        font-size: 1.2rem;
    }
    
    .footer-section ul {
        list-style: none;
        padding: 0;
    }
    
    .footer-section ul li {
        margin-bottom: 0.7rem;
    }
    
    .footer-section a {
        color: #ecf0f1;
        text-decoration: none;
        transition: color 0.3s;
    }
    
    .footer-section a:hover {
        color: #3498db;
    }
    
    .footer-section p {
        line-height: 1.5;
    }
    
    .social-icons {
        display: flex;
        margin-top: 1rem;
    }
    
    .social-icons a {
        display: flex;
        align-items: center;
        justify-content: center;
        width: 36px;
        height: 36px;
        border-radius: 50%;
        background-color: #34495e;
        margin-right: 1rem;
        transition: background-color 0.3s;
    }
    
    .social-icons a:hover {
        background-color: #3498db;
    }
    
    .newsletter form {
        display: flex;
        margin-top: 1rem;
    }
    
    .newsletter input {
        flex: 1;
        padding: 0.7rem;
        border: none;
        border-radius: 4px 0 0 4px;
    }
    
    .newsletter button {
        padding: 0.7rem 1rem;
        background-color: #3498db;
        color: white;
        border: none;
        border-radius: 0 4px 4px 0;
        cursor: pointer;
        transition: background-color 0.3s;
    }
    
    .newsletter button:hover {
        background-color: #2980b9;
    }
    
    .footer-bottom {
        text-align: center;
        padding-top: 2rem;
        margin-top: 2rem;
        border-top: 1px solid #34495e;
    }
    
    @media (max-width: 768px) {
        .footer-section {
            flex: 100%;
        }
    }
</style>

<footer class="footer">
    <div class="footer-content">
        <div class="footer-section">
            <h3>Quick Links</h3>
            <ul>
                <li><a href="products.jsp">Browse Laptops</a></li>
                <li><a href="#">Special Offers</a></li>
                <li><a href="#">Business Solutions</a></li>
                <li><a href="#">Student Discounts</a></li>
                <li><a href="#">Compare Models</a></li>
            </ul>
        </div>
        
        <div class="footer-section">
            <h3>Customer Support</h3>
            <ul>
                <li><a href="#">Contact Us</a></li>
                <li><a href="#">FAQs</a></li>
                <li><a href="#">Shipping Information</a></li>
                <li><a href="#">Return Policy</a></li>
                <li><a href="#">Warranty</a></li>
            </ul>
        </div>
        
        <div class="footer-section">
            <h3>About LaptopHub</h3>
            <p>LaptopHub is dedicated to providing premium laptops with excellent customer service and technical support.</p>
            <div class="social-icons">
                <a href="#">📘</a>
                <a href="#">📱</a>
                <a href="#">🐦</a>
                <a href="#">📸</a>
            </div>
        </div>
        
        <div class="footer-section newsletter">
            <h3>Newsletter</h3>
            <p>Subscribe to receive updates on new products and special offers.</p>
            <form>
                <input type="email" placeholder="Your email address">
                <button type="submit">Subscribe</button>
            </form>
        </div>
    </div>
    
    <div class="footer-bottom">
        <p>&copy; <%= new java.util.Date().getYear() + 1900 %> LaptopHub. All rights reserved.</p>
    </div>
</footer>
</body>
</html>
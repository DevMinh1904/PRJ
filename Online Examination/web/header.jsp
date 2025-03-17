<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Online Examination</title>
    <style>
        /* Header Styles */
        .header {
            background-color: #2c3e50;
            color: white;
            padding: 1rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        
        .logo {
            font-size: 1.8rem;
            font-weight: bold;
            color: white;
            text-decoration: none;
        }
        
        .logo span {
            color: #3498db;
        }
        
        .nav-menu {
            display: flex;
            list-style: none;
        }
        
        .nav-menu li {
            margin-left: 2rem;
        }
        
        .nav-menu a {
            color: white;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s;
        }
        
        .nav-menu a:hover {
            color: #3498db;
        }
        
        .search-cart {
            display: flex;
            align-items: center;
        }
        
        .search-form {
            margin-right: 1.5rem;
        }
        
        .search-form input {
            padding: 0.5rem;
            border: none;
            border-radius: 4px;
        }
        
        .cart-icon {
            color: white;
            font-size: 1.2rem;
            text-decoration: none;
            position: relative;
        }
        
        .cart-count {
            position: absolute;
            top: -8px;
            right: -8px;
            background-color: #e74c3c;
            color: white;
            font-size: 0.7rem;
            border-radius: 50%;
            width: 16px;
            height: 16px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        @media (max-width: 768px) {
            .header {
                flex-direction: column;
                padding: 1rem;
            }
            
            .nav-menu {
                margin-top: 1rem;
                flex-wrap: wrap;
                justify-content: center;
            }
            
            .nav-menu li {
                margin: 0.5rem 1rem;
            }
            
            .search-cart {
                margin-top: 1rem;
            }
        }
    </style>
</head>
<body>
    <header class="header">
        <a href="index.jsp" class="logo">Online<span>Examination</span></a>
        <div class="search-cart">
            <a href="login.jsp" class="nav-menu-item">Login</a>
        </div>
    </header>
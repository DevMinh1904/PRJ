<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Laptops - LaptopHub</title>
    <style>
        /* Products Page Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background-color: #f5f7fa;
            color: #333;
        }
        
        .products-container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 1rem;
        }
        
        .products-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
        }
        
        .products-header h1 {
            color: #2c3e50;
        }
        
        .filter-sort {
            display: flex;
            gap: 1rem;
        }
        
        .filter-sort select {
            padding: 0.5rem 1rem;
            border: 1px solid #ddd;
            border-radius: 4px;
            background-color: white;
            cursor: pointer;
        }
        
        .sidebar {
            width: 250px;
            float: left;
            padding: 1rem;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
        }
        
        .filter-group {
            margin-bottom: 1.5rem;
        }
        
        .filter-group h3 {
            color: #2c3e50;
            margin-bottom: 1rem;
            font-size: 1.1rem;
        }
        
        .filter-group ul {
            list-style: none;
        }
        
        .filter-group ul li {
            margin-bottom: 0.5rem;
        }
        
        .filter-checkbox {
            display: flex;
            align-items: center;
        }
        
        .filter-checkbox input {
            margin-right: 0.5rem;
        }
        
        .price-range input {
            width: 100%;
            margin-bottom: 0.5rem;
        }
        
        .price-inputs {
            display: flex;
            gap: 0.5rem;
        }
        
        .price-inputs input {
            width: 45%;
            padding: 0.5rem;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        
        .product-grid {
            margin-left: 280px;
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 2rem;
        }
        
        .product-card {
            background-color: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            transition: transform 0.3s, box-shadow 0.3s;
        }
        
        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        
        .product-image {
            height: 180px;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #f5f7fa;
        }
        
        .product-image img {
            max-width: 100%;
            max-height: 100%;
            object-fit: contain;
        }
        
        .product-details {
            padding: 1.5rem;
        }
        
        .product-category {
            color: #7f8c8d;
            font-size: 0.8rem;
            margin-bottom: 0.5rem;
        }
        
        .product-title {
            color: #2c3e50;
            font-size: 1.1rem;
            margin-bottom: 0.5rem;
            height: 2.6rem;
            overflow: hidden;
        }
        
        .product-specs {
            font-size: 0.9rem;
            color: #7f8c8d;
            margin-bottom: 1rem;
        }
        
        .product-specs span {
            display: block;
            margin-bottom: 0.2rem;
        }
        
        .product-price {
            font-size: 1.3rem;
            font-weight: bold;
            color: #2c3e50;
            margin-bottom: 1rem;
        }
        
        .product-price .old-price {
            text-decoration: line-through;
            font-size: 0.9rem;
            color: #7f8c8d;
            margin-right: 0.5rem;
            font-weight: normal;
        }
        
        .add-to-cart {
            display: block;
            width: 100%;
            padding: 0.8rem;
            background-color: #3498db;
            color: white;
            text-align: center;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
            text-decoration: none;
            font-weight: 500;
        }
        
        .add-to-cart:hover {
            background-color: #2980b9;
        }
        
        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 3rem;
            margin-left: 280px;
        }
        
        .pagination a {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 40px;
            height: 40px;
            margin: 0 5px;
            border-radius: 4px;
            border: 1px solid #ddd;
            color: #333;
            text-decoration: none;
            transition: background-color 0.3s, color 0.3s;
        }
        
        .pagination a.active,
        .pagination a:hover {
            background-color: #3498db;
            color: white;
            border-color: #3498db;
        }
        
        @media (max-width: 992px) {
            .sidebar {
                width: 100%;
                float: none;
                margin-bottom: 2rem;
            }
            
            .product-grid {
                margin-left: 0;
            }
            
            .pagination {
                margin-left: 0;
            }
        }
        
        @media (max-width: 576px) {
            .product-grid {
                grid-template-columns: repeat(auto-fill, minmax(180px, 1fr));
                gap: 1rem;
            }
            
            .products-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 1rem;
            }
            
            .filter-sort {
                width: 100%;
            }
            
            .filter-sort select {
                flex: 1;
            }
        }
    </style>
</head>
<body>
    <%@ include file="header.jsp" %>
    
    <div class="products-container">
        <div class="products-header">
            <h1>Browse Laptops</h1>
            <div class="filter-sort">
                <select>
                    <option>Sort By</option>
                    <option>Price: Low to High</option>
                    <option>Price: High to Low</option>
                    <option>Best Selling</option>
                    <option>New Arrivals</option>
                </select>
                <select>
                    <option>12 per page</option>
                    <option>24 per page</option>
                    <option>36 per page</option>
                </select>
            </div>
        </div>
        
        <div class="sidebar">
            <div class="filter-group">
                <h3>Categories</h3>
                <ul>
                    <li>
                        <div class="filter-checkbox">
                            <input type="checkbox" id="gaming" name="category">
                            <label for="gaming">Gaming Laptops</label>
                        </div>
                    </li>
                    <li>
                        <div class="filter-checkbox">
                            <input type="checkbox" id="business" name="category">
                            <label for="business">Business Laptops</label>
                        </div>
                    </li>
                    <li>
                        <div class="filter-checkbox">
                            <input type="checkbox" id="student" name="category">
                            <label for="student">Student Laptops</label>
                        </div>
                    </li>
                    <li>
                        <div class="filter-checkbox">
                            <input type="checkbox" id="ultrabook" name="category">
                            <label for="ultrabook">Ultrabooks</label>
                        </div>
                    </li>
                </ul>
            </div>
            
            <div class="filter-group">
                <h3>Brand</h3>
                <ul>
                    <li>
                        <div class="filter-checkbox">
                            <input type="checkbox" id="dell" name="brand">
                            <label for="dell">Dell</label>
                        </div>
                    </li>
                    <li>
                        <div class="filter-checkbox">
                            <input type="checkbox" id="hp" name="brand">
                            <label for="hp">HP</label>
                        </div>
                    </li>
                    <li>
                        <div class="filter-checkbox">
                            <input type="checkbox" id="lenovo" name="brand">
                            <label for="lenovo">Lenovo</label>
                        </div>
                    </li>
                    <li>
                        <div class="filter-checkbox">
                            <input type="checkbox" id="apple" name="brand">
                            <label for="apple">Apple</label>
                        </div>
                    </li>
                    <li>
                        <div class="filter-checkbox">
                            <input type="checkbox" id="asus" name="brand">
                            <label for="asus">Asus</label>
                        </div>
                    </li>
                </ul>
            </div>
            
            <div class="filter-group">
                <h3>Price Range</h3>
                <div class="price-range">
                    <input type="range" min="0" max="5000" value="2500">
                    <div class="price-inputs">
                        <input type="number" placeholder="Min" min="0">
                        <input type="number" placeholder="Max" min="0">
                    </div>
                </div>
            </div>
            
            <div class="filter-group">
                <h3>Processor</h3>
                <ul>
                    <li>
                        <div class="filter-checkbox">
                            <input type="checkbox" id="intel-i7" name="processor">
                            <label for="intel-i7">Intel Core i7</label>
                        </div>
                    </li>
                    <li>
                        <div class="filter-checkbox">
                            <input type="checkbox" id="intel-i5" name="processor">
                            <label for="intel-i5">Intel Core i5</label>
                        </div>
                    </li>
                    <li>
                        <div class="filter-checkbox">
                            <input type="checkbox" id="amd-ryzen7" name="processor">
                            <label for="amd-ryzen7">AMD Ryzen 7</label>
                        </div>
                    </li>
                    <li>
                        <div class="filter-checkbox">
                            <input type="checkbox" id="amd-ryzen5" name="processor">
                            <label for="amd-ryzen5">AMD Ryzen 5</label>
                        </div>
                    </li>
                </ul>
            </div>
            
            <div class="filter-group">
                <h3>RAM</h3>
                <ul>
                    <li>
                        <div class="filter-checkbox">
                            <input type="checkbox" id="ram-8gb" name="ram">
                            <label for="ram-8gb">8 GB</label>
                        </div>
                    </li>
                    <li>
                        <div class="filter-checkbox">
                            <input type="checkbox" id="ram-16gb" name="ram">
                            <label for="ram-16gb">16 GB</label>
                        </div>
                    </li>
                    <li>
                        <div class="filter-checkbox">
                            <input type="checkbox" id="ram-32gb" name="ram">
                            <label for="ram-32gb">32 GB</label>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        
        <div class="product-grid">
            <!-- Product 1 -->
            <div class="product-card">
                <div class="product-image">
                    <img src="/images/laptop1.jpg" alt="Dell XPS 13">
                </div>
                <div class="product-details">
                    <div class="product-category">Ultrabook</div>
                    <h3 class="product-title">Dell XPS 13</h3>
                    <div class="product-specs">
                        <span>Intel Core i7</span>
                        <span>16GB RAM</span>
                        <span>512GB SSD</span>
                    </div>
                    <div class="product-price">
                        <span class="old-price">$1,499</span>
                        $1,299
                    </div>
                    <a href="#" class="add-to-cart">Add to Cart</a>
                </div>
            </div>
            
            <!-- Product 2 -->
            <div class="product-card">
                <div class="product-image">
                    <img src="/images/laptop2.jpg" alt="HP Spectre x360">
                </div>
                <div class="product-details">
                    <div class="product-category">2-in-1</div>
                    <h3 class="product-title">HP Spectre x360</h3>
                    <div class="product-specs">
                        <span>Intel Core i5</span>
                        <span>8GB RAM</span>
                        <span>256GB SSD</span>
                    </div>
                    <div class="product-price">$1,099</div>
                    <a href="#" class="add-to-cart">Add to Cart</a>
                </div>
            </div>
            
            <!-- Product 3 -->
            <div class="product-card">
                <div class="product-image">
                    <img src="/images/laptop3.jpg" alt="Lenovo Legion 5">
                </div>
                <div class="product-details">
                    <div class="product-category">Gaming</div>
                    <h3 class="product-title">Lenovo Legion 5
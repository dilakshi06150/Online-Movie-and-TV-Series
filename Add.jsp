<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Page - ReelVibe</title>
    <style>
        /* Global Styling */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Roboto', sans-serif;
        }

        body {
            background-color: #f0f3f5;
            color: #333;
        }

        header {
            background-color: #1f2937;
            padding: 20px;
            text-align: center;
            position: relative;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .system-name {
            position: absolute;
            top: 50%;
            left: 20px;
            transform: translateY(-50%);
            font-size: 30px;
            color: #FF6F61;
            font-weight: bold;
        }

        header h1 {
            color: #ffffff;
            font-size: 26px;
            letter-spacing: 2px;
        }

        nav a {
            color: #ffffff;
            margin: 0 15px;
            text-decoration: none;
            font-size: 16px;
            transition: color 0.3s;
        }

        nav a:hover {
            color: #ff6f61;
        }

        /* Main Container */
        main {
            max-width: 1200px;
            margin: 50px auto;
            padding: 0 20px;
        }

        h2 {
            text-align: center;
            color: #374785;
            font-size: 2.5em;
            margin-bottom: 40px;
            font-weight: 600;
            letter-spacing: 1px;
        }

        .admin-container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
        }

        .admin-section {
            margin-bottom: 50px;
        }

        .admin-section h3 {
            font-size: 1.75em;
            color: #374785;
            margin-bottom: 15px;
            position: relative;
            padding-bottom: 10px;
        }

        .admin-section h3::after {
            content: "";
            position: absolute;
            width: 50px;
            height: 3px;
            background-color: #ff6f61;
            left: 0;
            bottom: 0;
        }

        .admin-section button {
            padding: 10px 20px;
            background-color: #FF6F61;
            color: #ffffff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s, transform 0.3s;
        }

        .admin-section button:hover {
            background-color: #e65550;
            transform: translateY(-2px);
        }

        /* Forms Styling */
        .admin-form {
            margin-top: 30px;
        }

        .admin-form label {
            font-size: 16px;
            color: #333;
            margin-bottom: 8px;
            display: block;
        }

        .admin-form input,
        .admin-form textarea {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 16px;
            color: #333;
            transition: border 0.3s;
        }

        .admin-form input:focus,
        .admin-form textarea:focus {
            border-color: #FF6F61;
            outline: none;
        }

        .admin-form button {
            width: 100%;
            padding: 12px;
            background-color: #374785;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
        }

        .admin-form button:hover {
            background-color: #2c3e50;
            transform: translateY(-2px);
        }

        footer {
            text-align: center;
            padding: 20px;
            background-color: #1f2937;
            color: white;
            position: relative;
            bottom: 0;
            left: 0;
            width: 100%;
            margin-top: 50px;
        }

        /* Smooth show/hide transitions */
        .form-container {
            display: none;
            opacity: 0;
            transition: opacity 0.3s ease-in-out;
        }

        .form-container.show {
            display: block;
            opacity: 1;
        }

        /* Responsive design */
        @media (max-width: 768px) {
            .admin-section button {
                width: 100%;
                margin-bottom: 10px;
            }

            nav a {
                font-size: 14px;
            }

            h2 {
                font-size: 2em;
            }
        }
    </style>
</head>

<body>
    <header>
        <div class="system-name">ReelVibe</div>
        <h1>Admin Dashboard</h1>
        <nav>
            <a href="home.html">Home</a>
            <a href="admin.html">Admin Page</a>
        </nav>
    </header>

    <main>
        <section class="admin-container">
            <h2>Admin Panel</h2>

            <!-- Manage Movies Section -->
            <div class="admin-section">
                <h3>Manage Movies</h3>
                <button onclick="toggleForm('add-movie-form')">Add Movie</button>
                <button onclick="toggleForm('update-movie-form')">Update Movie</button>
                <button onclick="toggleForm('delete-movie-form')">Delete Movie</button>

                <div id="add-movie-form" class="form-container">
                    <h4>Add New Movie</h4>
                    <form class="admin-form">
                        <label for="movie-title">Title:</label>
                        <input type="text" id="movie-title" required>

                        <label for="movie-genre">Genre:</label>
                        <input type="text" id="movie-genre" required>

                        <label for="movie-year">Release Year:</label>
                        <input type="number" id="movie-year" required>

                        <button type="submit">Submit</button>
                    </form>
                </div>

                <div id="update-movie-form" class="form-container">
                    <h4>Update Movie</h4>
                    <form class="admin-form">
                        <label for="movie-id-update">Movie ID:</label>
                        <input type="text" id="movie-id-update" required>

                        <label for="movie-title-update">Title:</label>
                        <input type="text" id="movie-title-update">

                        <label for="movie-genre-update">Genre:</label>
                        <input type="text" id="movie-genre-update">

                        <label for="movie-year-update">Release Year:</label>
                        <input type="number" id="movie-year-update">

                        <button type="submit">Submit</button>
                    </form>
                </div>

                <div id="delete-movie-form" class="form-container">
                    <h4>Delete Movie</h4>
                    <form class="admin-form">
                        <label for="movie-id-delete">Movie ID:</label>
                        <input type="text" id="movie-id-delete" required>

                        <button type="submit">Delete</button>
                    </form>
                </div>
            </div>

            <!-- Manage FAQs Section -->
            <div class="admin-section">
                <h3>Manage FAQs</h3>
                <button onclick="toggleForm('add-faq-form')">Add Question</button>
                <button onclick="toggleForm('edit-faq-form')">Edit Question</button>
                <button onclick="toggleForm('delete-faq-form')">Delete Question</button>

                <div id="add-faq-form" class="form-container">
                    <h4>Add New Question</h4>
                    <form class="admin-form" method="post" action="AddQA">
                        <label for="faq-id-add">FAQ ID:</label>
                        <input type="text" id="faq-id-add" name="id" required>

                        <label for="faq-question">Question:</label>
                        <input type="text" id="faq-question" name="que"  required>

                        <label for="faq-answer">Answer:</label>
                        <textarea id="faq-answer" rows="5"  name="ans" required></textarea>

                        <button type="submit">Submit</button>
                    </form>
                </div>

                <div id="edit-faq-form" class="form-container">
                    <h4>Edit Question</h4>
                    <form class="admin-form"  method="post" action="UpdateQA">
                        <label for="faq-id-edit">FAQ ID:</label>
                        <input type="text" id="faq-id-edit" name="id" required>

                        <label for="faq-question-edit">New Question:</label>
                        <input type="text" id="faq-question-edit" name="newque">

                        <label for="faq-answer-edit">New Answer:</label>
                        <textarea id="faq-answer-edit" rows="5" name="newans"></textarea>

                        <button type="submit">Submit</button>
                    </form>
                </div>

                <div id="delete-faq-form" class="form-container">
                    <h4>Delete Question</h4>
                    <form class="admin-form" method="post" action="DeleteQA">
                        <label for="faq-id-delete">FAQ ID:</label>
                        <input type="text" id="faq-id-delete" name="id" required>

                        <button type="submit">Delete</button>
                    </form>
                </div>
            </div>
        </section>
    </main>

    <footer>
        <p>&copy; 2024 ReelVibe. All rights reserved.</p>
    </footer>

    <script>
        function toggleForm(formId) {
            const forms = document.querySelectorAll('.form-container');
            forms.forEach(form => form.classList.remove('show'));

            const selectedForm = document.getElementById(formId);
            selectedForm.classList.add('show');
        }
    </script>
</body>

</html>

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

        /* Navigation Bar */
        nav {
            text-align: right;
            position: absolute;
            right: 20px;
            top: 50%;
            transform: translateY(-50%);
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
            width: 50%; /* Reduced width */
            padding: 8px; /* Reduced padding */
            background-color: #374785;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 14px; /* Reduced font size */
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
            display: block;
            margin: 0 auto; /* Centers the button */
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
            <a href="movies.html">Movies</a>
            <a href="tvseries.html">TV Series</a>
            <a href="watchlist.html">Watchlist</a>
            <a href="profile.html">Profile</a>
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
                    <form class="admin-form" method="post" action="AddMovie" enctype="multipart/form-data">
                        <label for="movie-title">Title:</label>
                        <input type="text" id="movie-title" name="title" required>

                        <input type="radio" id="movie" name="type" value="movie"><br>
                        <label for="movie">Movie</label>
                        <input type="radio" id="tvseries" name="type" value="tvseries">
                        <label for="tvseries">TV Series</label>

                        <label for="movie-genre">Genre:</label>
                        <input type="text" id="movie-genre" name="genre" required>

                        <label for="movie-year">Release Year:</label>
                        <input type="number" id="movie-year" name="year" required>

                        <label for="faq-answer">Description:</label>
                        <textarea id="faq-answer" rows="5" name="dec" required></textarea>

                        <label for="poster">Select Poster Image:</label>
                        <input type="file" id="poster" name="poster" accept="image/*" required>

                        <button type="submit">Submit</button>
                    </form>
                </div>

                <div id="update-movie-form" class="form-container">
                    <h4>Update Movie</h4>
                    <form class="admin-form" method="post" action="UpdateMovie" enctype="multipart/form-data">
                        <label for="movie-id-update">Title:</label>
                        <input type="text" id="movie-id-update" name="title" required>

                        <label for="movie-title-update">New Title:</label>
                        <input type="text" id="movie-title-update" name="newtitle">

                        <input type="radio" id="movie" name="newtype" value="movie"><br>
                        <label for="movie">Movie</label>
                        <input type="radio" id="tvseries" name="newtype" value="tvseries">
                        <label for="tvseries">TV Series</label>

                        <label for="movie-genre-update">New Genre:</label>
                        <input type="text" id="movie-genre-update" name="newgenre">

                        <label for="movie-year-update">New Release Year:</label>
                        <input type="number" id="movie-year-update" name="newyear">

                        <label for="faq-answer-update">New Description:</label>
                        <textarea id="faq-answer-update" rows="5" name="newdec"></textarea>

                        <label for="poster-update">Select New Poster Image:</label>
                        <input type="file" id="poster-update" name="newimg" accept="image/*">

                        <button type="submit">Submit</button>
                    </form>
                </div>

                <div id="delete-movie-form" class="form-container">
                    <h4>Delete Movie</h4>
                    <form class="admin-form" method="post" action="DeleteMovie">
                        <label for="movie-id-delete">Movie Title:</label>
                        <input type="text" id="movie-id-delete" name="title" required>

                        <button type="submit">Delete</button>
                    </form>
                </div>
                
                
            </div>
            
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
        &copy; 2024 ReelVibe. All Rights Reserved.
    </footer>

    <script>
        function toggleForm(formId) {
            var forms = document.querySelectorAll('.form-container');
            forms.forEach(function (form) {
                form.classList.remove('show');
            });
            document.getElementById(formId).classList.add('show');
        }
    </script>

</body>

</html>

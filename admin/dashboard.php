<?php
include '../components/connect.php';

if (isset($_COOKIE['tutor_id'])) {
    $tutor_id = $_COOKIE['tutor_id'];
}else {
    $tutor_id = '';
    header('location: login.php');
}

$select_contents = $conn->prepare("SELECT * FROM `content` WHERE tutor_id = ?");
$select_contents->execute([$tutor_id]);
$total_contents = $select_contents->rowCount();

$select_playlists = $conn->prepare("SELECT * FROM `playlist` WHERE tutor_id = ?");
$select_playlists->execute([$tutor_id]);
$total_playlists = $select_playlists->rowCount();

$select_likes = $conn->prepare("SELECT * FROM `likes` WHERE tutor_id = ?");
$select_likes->execute([$tutor_id]);
$total_likes = $select_likes->rowCount();

$select_comments = $conn->prepare("SELECT * FROM `comments` WHERE tutor_id = ?");
$select_comments->execute([$tutor_id]);
$total_comments = $select_comments->rowCount();

?>
<style type="text/css">
<?php include '../css/admin_style.css'; ?>
</style>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Dashboard</title>

    <!-- boxicon link  -->
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

</head>
<body>
<?php include '../components/admin_header.php';?>
<section class="dashboard">
    <h1 class="heading">Dashboard</h1>

    <div class="box-container">
        <div class="box">
            <h3>Wellcome!</h3>
            <p><?= $fetch_profile['name']; ?></p>
            <a href="profile.php" class="btn">View Profile</a>
        </div>
        <div class="box">
            <h3><?= $total_contents; ?></h3>
            <p>Total Content</p>
            <a href="add_content.php" class="btn">Add New Content</a>
        </div>
        <div class="box">
            <h3><?= $total_playlists; ?></h3>
            <p>Total Playlists</p>
            <a href="add_playlist.php" class="btn">Add New Playlist</a>
        </div>
        <div class="box">
            <h3><?= $total_likes; ?></h3>
            <p>Total Likes</p>
            <a href="content.php" class="btn">View Content</a>
        </div>
        <div class="box">
            <h3><?= $total_comments; ?></h3>
            <p>Total Comments</p>
            <a href="comments.php" class="btn">View Comments</a>
        </div>
        <div class="box">
            <h3>Quick Start</h3>
            <div class="flex-btn">
            <a href="login.php" class="btn" style="width:200px;">Login</a>
                <a href="register.php" class="btn" style="width:200px;">Register</a>
            </div>
        </div>
    </div>
</section>
<?php include '../components/footer.php';?>
<script type="text/javascript" src="../js/admin_script.js"></script>

</body>
</html>
<?php
include '../components/connect.php';

if (isset($_COOKIE['tutor_id'])) {
    $tutor_id = $_COOKIE['tutor_id'];
}else {
    $tutor_id = '';
    header('location: login.php');
}

if (isset($_POST['submit'])) {
    $id = unique_id();
    $title = $_POST['title'];
    $title = filter_var($title, FILTER_SANITIZE_STRING);
    $description = $_POST['description'];
    $description = filter_var($description, FILTER_SANITIZE_STRING);
    $status = $_POST['status'];
    $status = filter_var($status, FILTER_SANITIZE_STRING);

    $image = $_FILES['image']['name'];
    $image = filter_var($image, FILTER_SANITIZE_STRING);
    $ext = pathinfo($image, PATHINFO_EXTENSION);
    $rename = unique_id().','.$ext;
    $image_size = $_FILES['image']['size'];
    $image_tmp_name = $_FILES['image']['tmp_name'];
    $image_folder = '../uploaded_files/'.$rename;

    $add_playlist = $conn->prepare("INSERT INTO `playlist` (id, tutor_id, title, description, thumb, status) VALUES(?,?,?,?,?,?)");
    $add_playlist->execute([$id, $tutor_id, $title, $description, $rename, $status]);
    move_uploaded_file($image_tmp_name, $image_folder);

    $message[] = 'New Playlist Created';

}



?>
<style type="text/css">
<?php include '../css/admin_style.css'; ?>
</style>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Add Playlist</title>

    <!-- boxicon link  -->
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

</head>
<body>
<?php include '../components/admin_header.php';?>
<section class="playlist-form">
    <h1 class="heading">create playlist</h1>

    <form action="" method="post" enctype="multipart/form-data">
        <p>playlist status <span>*</span></p>
        <select name="status" class="box">
            <option value="" selected disabled >---select status---</option>
            <option value="active">active</option>
            <option value="deactive">deactive</option>
        </select>
        <p>playlist title <span>*</span></p>
        <input type="text" name="title" maxlength="100" required placeholder="Enter Playlist Title" class="box">
        <p>playlist description <span>*</span></p>
        <textarea name="description" required placeholder="Write description" class="box"cols="30" rows="10"></textarea>
        <p>playlist thumbnail <span>*</span></p>
        <input type="file" name="image" accept="image/*" required class="box">
        <input type="submit" name="submit" value="Create Playlist" class="btn">
    </form>


</section>
<?php include '../components/footer.php';?>
<script type="text/javascript" src="../js/admin_script.js"></script>

</body>
</html>
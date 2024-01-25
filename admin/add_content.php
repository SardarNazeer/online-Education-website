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
    $playlist = $_POST['playlist'];
    $playlist = filter_var($playlist, FILTER_SANITIZE_STRING);

    $image = $_FILES['image']['name'];
    $image = filter_var($image, FILTER_SANITIZE_STRING);
    $ext = pathinfo($image, PATHINFO_EXTENSION);
    $rename = unique_id().','.$ext;
    $image_size = $_FILES['image']['size'];
    $image_tmp_name = $_FILES['image']['tmp_name'];
    $image_folder = '../uploaded_files/'.$rename;

    $video = $_FILES['video']['name'];
    $video = filter_var($video, FILTER_SANITIZE_STRING);
    $video_ext = pathinfo($video, PATHINFO_EXTENSION);
    $rename_video = unique_id().','.$video_ext;
    $video_tmp_name = $_FILES['video']['tmp_name'];
    $video_folder = '../uploaded_files/'.$rename_video;

   
        if ($image_size > 2000000) {
            $message[] = 'image size is too large';
        }else {
            $add_playlist = $conn->prepare("INSERT INTO `content` (id, tutor_id, playlist_id, title, description, video, thumb, status) VALUES(?,?,?,?,?,?,?,?)");
            $add_playlist->execute([$id, $tutor_id, $playlist, $title, $description, $rename_video, $rename, $status]);
            move_uploaded_file($image_tmp_name, $image_folder);
            move_uploaded_file($video_tmp_name, $video_folder);
        
            $message[] = 'New Course Uploaded';
      }
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
    <title>Add Content</title>

    <!-- boxicon link  -->
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

</head>
<body>
<?php include '../components/admin_header.php';?>
<section class="video-form">
    <h1 class="heading">upload content</h1>

    <form action="" method="post" enctype="multipart/form-data">
        <p>playlist status <span>*</span></p>
        <select name="status" class="box">
            <option value="" selected disabled >---select status---</option>
            <option value="active">active</option>
            <option value="deactive">deactive</option>
        </select>
        <p>video title <span>*</span></p>
        <input type="text" name="title" maxlength="100" required placeholder="Enter Video Title" class="box">
        <p>video description <span>*</span></p>
        <textarea name="description" required placeholder="Write description" class="box"cols="30" rows="10"></textarea>
        <p>video playlist<span>*</span></p>
        <select name="playlist" class="box" required>
            <option value="" selected disabled>---Select Playlist---</option>
            <?php
             $select_playlist =  $conn->prepare("SELECT * FROM `playlist` WHERE tutor_id = ?");
             $select_playlist->execute([$tutor_id]);    
     
             if ($select_playlist->rowCount() > 0) {
                 while ($fetch_playlist = $select_playlist->fetch(PDO::FETCH_ASSOC)) {
               
            ?>
            <option value="<?=$fetch_playlist['id'];?>"> ?><?= $fetch_playlist['title']; ?></option>
            <?php
              }
            ?>
            <?php
            }else {
                echo '<p class="empty">no playlist added yet!</p>';
            }
            ?>
        </select>
        <p>select thumbnail <span>*</span></p>
        <input type="file" name="image" accept="image/*" required class="box">
        <p>select video <span>*</span></p>
        <input type="file" name="video" accept="video/*" required class="box">
        <input type="submit" name="submit" value="Upload Video" class="btn">
    </form>


</section>
<?php include '../components/footer.php';?>
<script type="text/javascript" src="../js/admin_script.js"></script>

</body>
</html>
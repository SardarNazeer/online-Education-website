<?php
include '../components/connect.php';

if (isset($_COOKIE['tutor_id'])) {
    $tutor_id = $_COOKIE['tutor_id'];
}else {
    $tutor_id = '';
    header('location: login.php');
}

if (isset($_GET['get_id'])) {
    $get_id = $_GET['get_id'];
}else {
    $get_id = '';
    header('location:playlists.php');
}

// delete playlist 

if (isset($_POST['delete'])) {

    $delete_id = $_POST['playlist_id'];
    $delete_id = filter_var($delete_id, FILTER_SANITIZE_STRING);

        $delete_playlist_thumb =  $conn->prepare("SELECT * FROM `playlist` WHERE id = ? LIMIT 1");
        $delete_playlist_thumb->execute([$delete_id]);
        $fetch_thumb = $delete_playlist_thumb->fetch(PDO::FETCH_ASSOC);
        unlink('../uploaded_files/' . $fetch_thumb['thumb']);

        $delete_bookmark =  $conn->prepare("DELETE FROM `bookmark` WHERE playlist_id = ?");
        $delete_bookmark->execute([$delete_id]);
        $delete_playlist =  $conn->prepare("DELETE FROM `playlist` WHERE id = ?");
        $delete_playlist->execute([$delete_id]);
        header('location:playlists.php');
}

// delete video from playlist 

if (isset($_POST['delete_video'])) {

    $delete_id = $_POST['video_id'];
    $delete_id = filter_var($delete_id, FILTER_SANITIZE_STRING);

    $verify_video =  $conn->prepare("SELECT * FROM `content` WHERE id = ? LIMIT 1");
    $verify_video->execute([$delete_id]);

    if ($verify_video->rowCount() > 0) {
        $delete_video_thumb =  $conn->prepare("SELECT * FROM `content` WHERE id = ? LIMIT 1");
        $delete_video_thumb->execute([$delete_id]);
        $fetch_thumb = $delete_video_thumb->fetch(PDO::FETCH_ASSOC);
        unlink('../uploaded_files/' . $fetch_thumb['thumb']);

        $delete_video =  $conn->prepare("DELETE FROM `content` WHERE id = ? LIMIT 1");
        $delete_video->execute([$delete_id]);
        $fetch_videos = $delete_video_thumb->fetch(PDO::FETCH_ASSOC);
        unlink('../uploaded_files/' . $fetch_thumb['video']);

        $delete_likes =  $conn->prepare("SELECT * FROM `likes` WHERE content_id = ?");
        $delete_likes->execute([$delete_id]);

        $delete_comments =  $conn->prepare("SELECT * FROM `comments` WHERE content_id = ?");
        $delete_comments->execute([$delete_id]);

        $delete_content =  $conn->prepare("SELECT * FROM `content` WHERE id = ?");
        $delete_content->execute([$delete_id]);

        $message[] = 'video deleted';
    }else {
        $message[] = 'video already deleted';
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
    <title>View Playlist</title>

    <!-- boxicon link  -->
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

</head>
<body>
<?php include '../components/admin_header.php';?>
<section class="view-playlist">
    <h1 class="heading">playlist detail</h1>

    <?php 
        $select_playlist =  $conn->prepare("SELECT * FROM `playlist` WHERE id = ? AND tutor_id = ?");
        $select_playlist->execute([$get_id, $tutor_id]);    

        if ($select_playlist->rowCount() > 0) {
            while ($fetch_playlist = $select_playlist->fetch(PDO::FETCH_ASSOC)) {
                $playlist_id = $fetch_playlist['id'];
                $count_videos =  $conn->prepare("SELECT * FROM `content` WHERE playlist_id = ?");
                $count_videos->execute([$playlist_id]);
                $total_videos = $count_videos->rowCount();
    ?>

        <div class="row">
            <div class="thumb">
                <span><?= $total_videos; ?></span>
                <img src="../uploaded_files/<?= $fetch_playlist['thumb']; ?>">
            </div>
            <div class="details">
            <h3 class="title"><?= $fetch_playlist['title']; ?></h3>
            <div class="date"><i class="bx bxs-calender-alt"></i><span><?= $fetch_playlist['date'] ?></span></div>
            <div class="description"><?= $fetch_playlist['description']; ?></div>
            <form action="" method="post" class="flex-btn">
            <input type="hidden" name="playlist_id" value="<?= $playlist_id; ?>">
            <a href="update_playlist.php?get_id=<?= $playlist_id; ?>" class="btn">Update Playlist</a>
            <input type="submit" name="delete" value="delete playlist" class="btn" onclick="return confirm('delete this playlist')">
            </form>
            </div>
        </div>

    <?php
        }
    }else {
        echo '<p class="empty">no playlist added yet!</p>';
    }
    ?>
</section>
<section class="contents">
    <h1 class="heading">playlist videos</h1>

    <div class="box-container">
        <?php 
            $select_videos = $conn->prepare("SELECT * FROM `content` WHERE tutor_id = ? AND playlist_id = ?");
            $select_videos->execute([$tutor_id, $playlist_id]);
            if ($select_videos->rowCount() > 0) {
                while ($fetch_videos = $select_videos->fetch(PDO::FETCH_ASSOC)) {
                        $video_id = $fetch_videos['id'];

            ?>
            <div class="box">
                <div class="flex">
                    <div><i class="bx bx-dots-vertical-rounded" style="<?php if($fetch_videos['status'] == ['active']){echo 'color: limegreen';}else{echo "red";} ?>"></i> <span style="<?php if($fetch_videos['status'] == 'active'){echo "limegreen";}else{echo "red";} ?>"><?= $fetch_videos['status'] ?></span></div>
                    <div><i class="bx bx-calender"></i><span><?= $fetch_videos['date'] ?></span></div>
                    </div>
                    <img src="../uploaded_files/<?= $fetch_videos['thumb']; ?>" class="thumb">
                    <h3 class="title"><?= $fetch_videos['title']; ?></h3>
                    <form action="" method="post" class="flex-btn">
                        <input type="hidden" name="video_id" value="<?= $video_id; ?>">
                        <a href="update_content.php?get_id=<?= $video_id; ?>" class="btn">Update</a>
                        <input type="submit" name="delete_video" value="delete video" class="btn" onclick="return confirm('delete this video')">
                        <a href="view_content.php?get_id=<?= $video_id; ?>" class="btn">View Content</a>
                </div>
            <?php 
                }
            }else {
                echo '            
                <div class="empty">
                <p style="margin-bottom: 1.5rem;">no video added in playlist yet!</p>
                <a href="add_content.php" style="margin-top: 1.5rem;" class="btn">Add Videos</a>
                </div>';
            }
            ?>
    </div>
</section>
<?php include '../components/footer.php';?>
<script type="text/javascript" src="../js/admin_script.js"></script>

</body>
</html>
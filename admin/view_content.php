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
    header('location:contents.php');
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

// delete comment from video 

if (isset($_POST['delete_comment'])) {

    $delete_id = $_POST['video_id'];
    $delete_id = filter_var($delete_id, FILTER_SANITIZE_STRING);

    $verify_comment =  $conn->prepare("SELECT * FROM `comments` WHERE id = ?");
    $verify_comment->execute([$delete_id]);

    if ($verify_comment->rowCount() > 0) {
        $delete_comment=  $conn->prepare("SELECT * FROM `comments` WHERE id = ?");
        $delete_comment->execute([$delete_id]);

        $message[] = 'comment deleted';
    }else {
        $message[] = 'comment already deleted';
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
    <title>Content Details</title>

    <!-- boxicon link  -->
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

</head>
<body>
<?php include '../components/admin_header.php';?>
<section class="view-content">
    <h1 class="heading">content detail</h1>

    <?php 
            $select_content = $conn->prepare("SELECT * FROM `content` WHERE id = ? AND tutor_id = ?");
            $select_content->execute([$get_id, $tutor_id]);
            if ($select_content->rowCount() > 0) {
                while ($fetch_content = $select_content->fetch(PDO::FETCH_ASSOC)) {
                        $video_id = $fetch_content['id'];

                    $count_likes =  $conn->prepare("SELECT * FROM `likes` WHERE tutor_id = ? AND content_id = ?");
                    $count_likes->execute([$tutor_id, $video_id]);
                    $total_likes = $count_likes->rowCount();

                    $count_comments =  $conn->prepare("SELECT * FROM `comments` WHERE tutor_id = ? AND content_id = ?");
                    $count_comments->execute([$tutor_id, $video_id]);
                    $total_comments = $count_comments->rowCount();

            ?>
            <div class="container">
                <video class="video" style="width: 100%;" src="../uploaded_files/<?= $fetch_content['video']; ?>" autoplay controls poster="../uploaded_files/<?= $fetch_content['thumb']; ?>"></video>
            <div class="date"><i class="bx bxs-calender-alt"></i><span><?= $fetch_content['date'] ?></span></div>
            <h3 class="title"><?= $fetch_content['title']; ?></h3>
            <div class="flex">
                <div><i class="bx bxs-heart"></i><span><?= $total_likes; ?></span></div>
                <div><i class="bx bxs-chat"></i><span><?= $total_comments; ?></span></div>
            </div>
            <div class="description"><?= $fetch_content['description']; ?></div>
            <form action="" method="post">
            <input type="hidden" name="video_id" value="<?= $video_id; ?>">
            <a href="update_content.php?get_id=<?= $video_id; ?>" class="btn">Update</a>
            <input type="submit" name="delete_video" value="delete video" class="btn" onclick="return confirm('delete this video')">
            </form>
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

</section>
<section class="comments">
    <h1 class="headings">User Comments</h1>
    <div class="show-comments">
        <?php
        
        $select_comments = $conn->prepare("SELECT * FROM `comments` WHERE content_id = ?");
        $select_comments->execute([$get_id]);
        if ($select_comments->rowCount() > 0) {
            while ($fetch_comment = $select_comments->fetch(PDO::FETCH_ASSOC)) {
                    
                $select_commentor =  $conn->prepare("SELECT * FROM `likes` WHERE tutor_id = ? AND content_id = ?");
                $select_commentor->execute([$fetch_comment['user_id']]);
                $fetch_commentor = $select_commentor->fetch(PDO::FETCH_ASSOC);
        
        ?>
        <div class="box">
            <div class="user">
            <img src="../uploaded_files/<?= $fetch_commentor['image']; ?>">
            <div>
            <h3 class="title"><?= $fetch_commentor['name']; ?></h3>
            <span><?= $fetch_commentor['date']; ?></span>
            </div>
            </div>
            <p class="text"><?= $fetch_comment['comments'];?></p>
            <form action="" method="post" class="flex-btn">
            <input type="hidden" name="comment_id" value="<?= $fetch_comment['id']; ?>">
            <button type="submit" name="delete_comment" value="delete comment" class="btn" onclick="return confirm('delete this comment')"></button>
        </div>
        <?php
            }
        }else {
            echo '<p class="empty">no comments added yet!</p>';
        }
        ?>
    </div>
</section>

<?php include '../components/footer.php';?>
<script type="text/javascript" src="../js/admin_script.js"></script>

</body>
</html>
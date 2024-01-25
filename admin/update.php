<?php
include '../components/connect.php';

if (isset($_COOKIE['tutor_id'])) {
    $tutor_id = $_COOKIE['tutor_id'];
}else {
    $tutor_id = '';
    header('location: login.php');
}

if (isset($_POST['submit'])) {

    $select_tutor = $conn->prepare("SELECT * FROM `tutors` where id = ? LIMIT 1");
    $select_tutor->execute([$tutor_id]);
    $fetch_tutor = $select_tutor->fetch(PDO::FETCH_ASSOC);

    $prev_pass = $fetch_tutor['password'];
    $prev_image = $fetch_tutor['image'];

    $name = $_POST['name'];
    $name = filter_var($name, FILTER_SANITIZE_STRING);

    $profession = $_POST['profession'];
    $profession = filter_var($profession, FILTER_SANITIZE_STRING);

    $email = $_POST['email'];
    $email = filter_var($email, FILTER_SANITIZE_STRING);

    if (!empty($name)) {
        $update_name = $conn->prepare("UPDATE `tutors` SET name = ? where id = ?");
        $update_name->execute([$name, $tutor_id]);
        $message[] = 'username updated successfully';
    }
    if (!empty($profession)) {
        $update_profession = $conn->prepare("UPDATE `tutors` SET profession = ? where id = ?");
        $update_profession->execute([$profession, $tutor_id]);
        $message[] = 'user profession updated successfully';
    }
    if (!empty($email)) {
        $select_email = $conn->prepare("SELECT * FROM `tutors` WHERE id = ? AND email = ?");
        $select_email->execute([$tutor_id, $email]);
        if ($select_email->rowCount() > 0) {
            $message[] = 'email already taken';
        }else {
            $update_email = $conn->prepare("UPDATE `tutors` SET email = ? where id = ?");
            $update_email->execute([$email, $tutor_id]);
            $message[] = 'user email updated successfully';
        }
    }


    // update profile image of tutor 

    $image = $_FILES['image']['name'];
    $image = filter_var($image, FILTER_SANITIZE_STRING);
    $ext = pathinfo($image, PATHINFO_EXTENSION);
    $rename = unique_id().','.$ext;
    $image_size = $_FILES['image']['size'];
    $image_tmp_name = $_FILES['image']['tmp_name'];
    $image_folder = '../uploaded_files/'.$rename;

    if (!empty($image)) {
          if ($image_size > 2000000) {
              $message[] = 'image size too large';
          }else {
            $update_image = $conn->prepare("UPDATE `tutors` SET `image` = ? WHERE id = ?");
            $update_image->execute([$rename, $tutor_id]);
            move_uploaded_file($image_tmp_name, $image_folder);
            if ($prev_image != '' AND $prev_image != $rename) {
                  unlink('../uploaded_files/'.$prev_image);
            }
            $message[] = 'image updated successfully';
        }
    }

    // update password of tutor 

    $empty_pass = 'da39a3ee5e6b4b0d3255bfef95601898afd80709';
    $old_pass = sha1($_POST['old_pass']);
    $old_pass = filter_var($old_pass, FILTER_SANITIZE_STRING);
    $new_pass = sha1($_POST['new_pass']);
    $new_pass = filter_var($new_pass, FILTER_SANITIZE_STRING);
    $cpass = sha1($_POST['cpass']);
    $cpass = filter_var($cpass, FILTER_SANITIZE_STRING);

    if ($old_pass != $empty_pass) {
          if ($old_pass != $prev_pass) {
               $message[] = 'old password not matched';
          }elseif ($new_pass != $cpass) {
            $message[] = 'confirm password not matched';
        }else {
            if ($new_pass != $empty_pass) {
                 $update_pass = $conn->prepare("UPDATE `tutors` SET password = ? where id = ?");
                 $update_pass->execute([$cpass, $tutor_id]);
                 $message[] = 'password updated successfully';
            }else {
                $message[] = 'please enter a new password';
            }
        }
    }
}

?>
<style type="text/css">
<?php include '../css/admin_style.css'; ?>
</style>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Profile</title>
        <!-- boxicon link  -->
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
<?php include '../components/admin_header.php';?>

<div class="form-container" style="min-height: calc(100vh - 19rem); padding: 5rem 0;">
    <form action="" method="post" enctype="multipart/form-data" class="register">
        <h3>Update Profile</h3>
        <div class="flex">
            <div class="col">
                <p>Your Name <span>*</span></p>
                <input type="text" name="name" placeholder="<?= $fetch_profile['name']?>" maxlength="50" required class="box">
                <p>Your profession <span>*</span></p>
                <select name="profession" required class="box">
                    <option value="" disabled selected><?= $fetch_profile['profession']?></option>
                    <option value="Developer">Developer</option>
                    <option value="Designer">Designer</option>
                    <option value="Musician">Musician</option>
                    <option value="Biologist">Biologist</option>
                    <option value="Teacher">Teacher</option>
                    <option value="Engineer">Engineer</option>
                    <option value="Lawyer">Lawyer</option>
                    <option value="Accountant">Accountant</option>
                    <option value="Doctor">Doctor</option>
                    <option value="Journalist">Journalist</option>
                    <option value="Photographer">Photographer</option>
                    <option value="Software Developer">Software Developer</option>
                </select>
                <p>Your Email <span>*</span></p>
                <input type="email" name="email" placeholder="<?= $fetch_profile['email']?>" maxlength="20" required class="box">
            </div>
            <div class="col">
            <p>Old Password <span>*</span></p>
                <input type="password" name="old_pass" placeholder="Enter Your Old Password" maxlength="20" required class="box">
            <p>New Password <span>*</span></p>
                <input type="password" name="new_pass" placeholder="Enter Your New Password" maxlength="20" required class="box">
            <p>Confirm Your Password <span>*</span></p>
                <input type="password" name="cpass" placeholder="Confirm Your Password" maxlength="20" required class="box">
                
            </div>
        </div>
        <p>Update Picture <span>*</span></p>
                <input type="file" name="image" accept="image/*" required class="box">    
                <input type="submit" name="submit" class="btn" value="update profile">
    </form>
</div>
<?php include '../components/footer.php';?>
<script type="text/javascript" src="../js/admin_script.js"></script>
</body>
</html>
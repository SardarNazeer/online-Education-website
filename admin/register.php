<?php
include '../components/connect.php';
if (isset($_POST['submit'])) {
    $id = unique_id();
    $name = $_POST['name'];
    $name = filter_var($name, FILTER_SANITIZE_STRING);

    $profession = $_POST['profession'];
    $profession = filter_var($profession, FILTER_SANITIZE_STRING);

    $email = $_POST['email'];
    $email = filter_var($email, FILTER_SANITIZE_STRING);

    $pass = sha1($_POST['pass']);
    $pass = filter_var($pass, FILTER_SANITIZE_STRING);

    $cpass = sha1($_POST['cpass']);
    $cpass = filter_var($cpass, FILTER_SANITIZE_STRING);

    $image = $_FILES['image']['name'];
    $image = filter_var($image, FILTER_SANITIZE_STRING);
    $ext = pathinfo($image, PATHINFO_EXTENSION);
    $rename = unique_id().','.$ext;
    $image_size = $_FILES['image']['size'];
    $image_tmp_name = $_FILES['image']['tmp_name'];
    $image_folder = '../uploaded_files/' . $rename;

    $select_tutor = $conn->prepare("SELECT * FROM `tutors` WHERE email = ?");
    $select_tutor->execute([$email]);

    if ($select_tutor->rowCount() > 0) {
        $message[] = 'email already exist';
    }else {
        if ($pass != $cpass) {
            $message[] = 'confirm password not matched';
        }else {
            $insert_tutor = $conn->prepare("INSERT INTO `tutors` (id, name, profession, email, password, image) VALUES(?,?,?,?,?,?)");
            $insert_tutor->execute([$id, $name, $profession, $email, $cpass, $rename]);

            move_uploaded_file($image_tmp_name, $image_folder);
            $message[] = 'new tutors registered! you can login now';
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
    <title>Admin Login</title>
        <!-- boxicon link  -->
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
<?php
if (isset($message)) {
    foreach ($message as $message) {
        echo '
        <div class="message">
         <span> '.$message.' </span>
           <i class="bx bx-x" onclick="this.parentElement.remove();"></i>
           </div>
    ';
    }
}
?>
<div class="form-container">
    <img src="../image//fun.jpg" class="form-img" style="left: -5%;">
    <form action="" method="post" enctype="multipart/form-data" class="register">
        <h3>Register Now</h3>
        <div class="flex">
            <div class="col">
                <p>Your Name <span>*</span></p>
                <input type="text" name="name" placeholder="Enter Your Name" maxlength="50" required class="box">
                <p>Your profession <span>*</span></p>
                <select name="profession" required class="box">
                    <option value="" disabled selected>--Select Your Profession--</option>
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
                <input type="email" name="email" placeholder="Enter Your Email" maxlength="20" required class="box">
            </div>
            <div class="col">
            <p>Your Password <span>*</span></p>
                <input type="password" name="pass" placeholder="Enter Your Password" maxlength="20" required class="box">
            <p>Your Password <span>*</span></p>
                <input type="password" name="cpass" placeholder="Confirm Your Password" maxlength="20" required class="box">
                <p>Select Picture <span>*</span></p>
                <input type="file" name="image" accept="image/*" required class="box">
            </div>
        </div>
        <p class="link" >Already have an account ? <a href="login.php">Login Now</a></p>
            <input type="submit" name="submit" class="btn" value="register now">
    </form>
</div>
</body>
</html>
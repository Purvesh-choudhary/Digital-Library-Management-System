<?php 
session_start();
include('includes/config.php');
error_reporting(0);

if(isset($_POST['signup']))
{
    // Code for student ID
    $count_my_page = ("studentid.txt");
    $hits = file($count_my_page);
    $hits[0]++;
    $fp = fopen($count_my_page , "w");
    fputs($fp , "$hits[0]");
    fclose($fp); 
    $StudentId = $hits[0];   

    $fname = $_POST['fullanme'];
    $mobileno = $_POST['mobileno'];
    $email = $_POST['email']; 
    $password = md5($_POST['password']); 
    $status = 1;

    // Profile Picture Upload
    $target_dir = "assets/img/profilePics/";
    $profilepic = $target_dir . basename($_FILES["profilepic"]["name"]);
    $imageFileType = strtolower(pathinfo($profilepic,PATHINFO_EXTENSION));

    // Check if image is valid
    $check = getimagesize($_FILES["profilepic"]["tmp_name"]);
    if($check !== false) {
        move_uploaded_file($_FILES["profilepic"]["tmp_name"], $profilepic);
    } else {
        echo "<script>alert('File is not an image.');</script>";
        exit();
    }

    // Insert into database
    $sql = "INSERT INTO tblstudents (StudentId, FullName, MobileNumber, EmailId, Password, ProfilePic, Status) 
            VALUES (:StudentId, :fname, :mobileno, :email, :password, :profilepic, :status)";
    
    $query = $dbh->prepare($sql);
    $query->bindParam(':StudentId', $StudentId, PDO::PARAM_STR);
    $query->bindParam(':fname', $fname, PDO::PARAM_STR);
    $query->bindParam(':mobileno', $mobileno, PDO::PARAM_STR);
    $query->bindParam(':email', $email, PDO::PARAM_STR);
    $query->bindParam(':password', $password, PDO::PARAM_STR);
    $query->bindParam(':profilepic', $profilepic, PDO::PARAM_STR);
    $query->bindParam(':status', $status, PDO::PARAM_STR);
    $query->execute();

    $lastInsertId = $dbh->lastInsertId();
    if($lastInsertId) {
        echo '<script>alert("Your Registration is successful. Your student ID is ' . $StudentId . '")</script>';
    } else {
        echo "<script>alert('Something went wrong. Please try again');</script>";
    }
}
?>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <title>Digital Library Management System | Student Signup</title>
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <link href="assets/css/style.css" rel="stylesheet" />
    <script type="text/javascript">
    function valid() {
        if (document.signup.password.value != document.signup.confirmpassword.value) {
            alert("Password and Confirm Password do not match!");
            document.signup.confirmpassword.focus();
            return false;
        }
        return true;
    }
    </script>
</head>

<body>
    <?php include('includes/header.php');?>

    <div class="content-wrapper">
        <div class="container">
            <div class="row pad-botm">
                <div class="col-md-12">
                    <h4 class="header-line">User Signup</h4>
                </div>
            </div>
            <div class="row">
                <div class="col-md-9 col-md-offset-1">
                    <div class="panel panel-danger">
                        <div class="panel-heading">
                            SIGNUP FORM
                        </div>
                        <div class="panel-body">
                            <form name="signup" method="post" enctype="multipart/form-data" onSubmit="return valid();">
                                <div class="form-group">
                                    <label>Full Name</label>
                                    <input class="form-control" type="text" name="fullanme" required />
                                </div>

                                <div class="form-group">
                                    <label>Mobile Number</label>
                                    <input class="form-control" type="tel" name="mobileno" minlength="5" maxlength="15" required />
                                </div>

                                <div class="form-group">
                                    <label>Email</label>
                                    <input class="form-control" type="email" name="email" id="emailid" required />
                                </div>

                                <div class="form-group">
                                    <label>Profile Picture</label>
                                    <input class="form-control" type="file" name="profilepic" required />
                                </div>

                                <div class="form-group">
                                    <label>Password</label>
                                    <input class="form-control" type="password" name="password" required />
                                </div>

                                <div class="form-group">
                                    <label>Confirm Password</label>
                                    <input class="form-control" type="password" name="confirmpassword" required />
                                </div>

                                <button type="submit" name="signup" class="btn btn-danger">Register Now</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <?php include('includes/footer.php');?>
    <script src="assets/js/jquery-1.10.2.js"></script>
    <script src="assets/js/bootstrap.js"></script>
</body>

</html>

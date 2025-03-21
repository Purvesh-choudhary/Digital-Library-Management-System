<?php 
session_start();
include('includes/config.php');
error_reporting(0);

if(strlen($_SESSION['login'])==0) {   
    header('location:index.php');
} else { 

    
    if(isset($_POST['update'])) {    
        $sid = $_SESSION['stdid'];  
        $fname = $_POST['fullanme'];
        $mobileno = $_POST['mobileno'];
        $email = $_POST['email'];

        // Handle profile image upload
        if (!empty($_FILES['profileImage']['name'])) {
        $target_dir = "assets/img/profilePics/"; // Ensure this folder exists
        $target_file = $target_dir . basename($_FILES["profileImage"]["name"]);
        
        if (move_uploaded_file($_FILES["profileImage"]["tmp_name"], $target_file)) {
            $sql = "UPDATE tblstudents SET ProfilePic=:profilePic WHERE StudentId=:sid";
            $query = $dbh->prepare($sql);
            $query->bindParam(':profilePic', $target_file, PDO::PARAM_STR);
            $query->bindParam(':sid', $sid, PDO::PARAM_STR);
            $query->execute();
        }
    }


        $sql = "UPDATE tblstudents SET FullName=:fname, MobileNumber=:mobileno, EmailId=:email WHERE StudentId=:sid";
        $query = $dbh->prepare($sql);
        $query->bindParam(':sid', $sid, PDO::PARAM_STR);
        $query->bindParam(':fname', $fname, PDO::PARAM_STR);
        $query->bindParam(':mobileno', $mobileno, PDO::PARAM_STR);
        $query->bindParam(':email', $email, PDO::PARAM_STR);
        $query->execute();

        echo '<script>alert("Your profile has been updated"); window.location.href="my-profile.php";</script>';
        exit();
        }
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Student Profile</title>
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet">
    <style>
    * {
        /* border:1px solid green; */
    }

    body {
        font-family: 'Open Sans', sans-serif;
        background-color: #e8e8f9;
    }

    .profile-card {
        width: 650px;
        background: white;
        border-radius: 10px;
        box-shadow: 2px 2px 20px rgba(0, 0, 0, 0.2);
        padding: 20px;
        margin: 50px auto;
        border: 4px solid #a68cff;
        background: linear-gradient(319deg, rgba(255, 255, 255, 1) 0%, rgba(241, 241, 241, 1) 39%, rgba(255, 255, 255, 1) 100%);
    }

    .profile-header {
        background: #a68cff;
        color: white;
        padding: 8px 0px;
        border-radius: 8px;
        font-size: 16px;
        text-align: center;
    }

    .profile-content {
        display: flex;
        align-items: center;
        padding: 15px;
    }

    .profile-img {
        width: 150px;
        height: 150px;
        border: 4px solid #9170e4;
        border-radius: 50%;
        display: flex;
        position: relative;
        justify-content: center;
        align-items: center;
        font-size: 40px;
        color: #555;
        margin-right: 30px;
        flex-shrink: 0;
        padding: 5px;

    }

    .profile-img img {
        width: 100%;
        height: 100%;
        border-radius: 50%;
        object-fit: cover;
    }

    .profile-details {
        flex: 1;
        float:left:
    }

    .profile-details p {
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin: 3px 0;
        line-height: 1.2;
    }

    .profile-details label {
        font-weight: bold;
        flex: 1;
        margin: 0px;
        width: 10px;
        flex: 0 0 120px;
        /* flex-grow: 0, flex-shrink: 0, flex-basis: 120px */
    }

    .profile-details input {
        border: none;
        background: transparent;
        outline: none;
        transition: 0.3s;
        /* flex: 2; */
        flex: 0 0 120px;
        /* flex-grow: 0, flex-shrink: 0, flex-basis: 120px */

        padding: 0px;
    }

    .profile-details input:disabled {
        background: none;
        color: black;
    }

    .profile-details h3 {
        display: inline;
        padding: 0px;
    }

    .profile-details span {

        text-align: left;
    }

    .edit-icon {
        cursor: pointer;
        color: #a68cff;
        font-weight: bold;
        margin-left: 10px;
        font-size: 18px;
        overflow: visible;
        /* display: none; */


    }

    #editImageIcon {
        /* border:2px solid red; */
        position: absolute;
    top: 10px;
    right: 10px;
    background: white;
    color: black;
    font-size: 20px;
    width: 30px;
    height: 30px;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 50%;
    cursor: pointer;
    box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.62);

    }

    /* .profile-details p:hover .edit-icon {
        display: inline;
    }
    .profile-details input:hover .edit-icon {
        display: inline;
    } */

    .reg-date,
    .status {
        flex: 1;
        text-align: left;
        display: inline-block;
    }

    .status {
        font-weight: bold;
    }

    .active {
        color: green;
    }

    .blocked {
        color: red;
    }
    </style>
</head>

<body>
    <?php include('includes/header.php'); ?>

    <div class="profile-card">
        <div class="profile-header">
            Student ID: <b><?php echo htmlentities($_SESSION['stdid']); ?></b>
        </div>

        <?php 
            $sid = $_SESSION['stdid'];
            $sql = "SELECT FullName, EmailId, ProfilePic, MobileNumber, RegDate, UpdationDate, Status FROM tblstudents WHERE StudentId=:sid";
            $query = $dbh->prepare($sql);
            $query->bindParam(':sid', $sid, PDO::PARAM_STR);
            $query->execute();
            $result = $query->fetch(PDO::FETCH_OBJ);
            if ($result) {
        ?>

            <div class="profile-content">
            <form method="POST" enctype="multipart/form-data">
            <div class="profile-img" style="float:left;">
                <img id="profilePic" src="<?php echo htmlentities($result->ProfilePic); ?>" width="100"
                    alt="Profile Image">
                <input type="file" id="imageUpload" name="profileImage" accept="image/*" style="display: none;">
                <span class="edit-icon" id="editImageIcon">✎</span>
            </div>
            <div class="profile-details" style="float:left;">
                    <p>
                        <!-- <label>Full Name:</label> -->
                    <h3>
                        <input type="text" name="fullanme" id="fullanme"
                            value="<?php echo htmlentities($result->FullName); ?>" required>
                    </h3>

                    <span class="edit-icon" onclick="enableEdit('fullanme')">✎</span>
                    </p>

                    <p>
                        <label>Phone No:</label>
                        <!-- <input type="number" name="mobileno" max="10" id="mobileno" value="<?php echo htmlentities($result->MobileNumber); ?>" disabled required> -->
                        <input type="number" name="mobileno" id="mobileno" maxlength="13" pattern="\d{10,13}"
                            title="Phone number must be between 10 and 13 digits"
                            value="<?php echo htmlentities($result->MobileNumber); ?>" required>

                        <span class="edit-icon" onclick="enableEdit('mobileno')">✎</span>

                    </p>

                    <p>
                        <label>Email:</label>
                        <input type="email" name="email" id="email"
                            value="<?php echo htmlentities($result->EmailId); ?>" required>
                        <span class="edit-icon" onclick="enableEdit('email')">✎</span>
                    </p>

                    <p>
                        <label>Reg Date:</label>
                        <span class="reg-date"><?php echo htmlentities($result->RegDate); ?></span>
                    </p>

                    <p>
                        <label>Status:</label>
                        <span class="status <?php echo ($result->Status == 1) ? 'active' : 'blocked'; ?>">
                            <?php echo ($result->Status == 1) ? 'ACTIVE' : 'BLOCKED'; ?>
                        </span>
                    </p>

                    <button type="submit" name="update" class="btn btn-primary" style="margin-top:30px;">Update
                        Now</button>
                </div>
            </form>
        </div>

        <?php } ?>

    </div>

    <script>
    function enableEdit(id) {
        document.getElementById(id).removeAttribute("disabled");
        document.getElementById(id).focus();
    }

    document.getElementById("editImageIcon").addEventListener("click", function() {
        document.getElementById("imageUpload").click();
    });

    document.getElementById("imageUpload").addEventListener("change", function(event) {
        let file = event.target.files[0];
        if (file) {
            let reader = new FileReader();
            reader.onload = function(e) {
                document.getElementById("profilePic").src = e.target.result;
            };
            reader.readAsDataURL(file);
        }
    });
    </script>


    <script src="assets/js/jquery-1.10.2.js"></script>
    <script src="assets/js/bootstrap.js"></script>
    <script src="assets/js/custom.js"></script>
</body>

</html>

<?php } ?>
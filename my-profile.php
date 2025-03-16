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

        $sql = "UPDATE tblstudents SET FullName=:fname, MobileNumber=:mobileno WHERE StudentId=:sid";
        $query = $dbh->prepare($sql);
        $query->bindParam(':sid', $sid, PDO::PARAM_STR);
        $query->bindParam(':fname', $fname, PDO::PARAM_STR);
        $query->bindParam(':mobileno', $mobileno, PDO::PARAM_STR);
        $query->execute();

        echo '<script>alert("Your profile has been updated")</script>';
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
    body {
        font-family: 'Open Sans', sans-serif;
        background-color: #e8e8f9;
    }

    .profile-card {
        width: 500px;
        background: white;
        border-radius: 10px;
        box-shadow: 2px 2px 20px rgba(0, 0, 0, 0.2);
        padding: 20px;
        margin: 50px auto;
        border: 4px solid #a68cff;
        background: linear-gradient(319deg, rgba(255,255,255,1) 0%, rgba(241,241,241,1) 39%, rgba(255,255,255,1) 100%);
    }

    .profile-header {
        background: #a68cff;
        color: white;
        padding: 8px 0px;
        /* height: 10px; */
        /* border:2px solid black; */
        border-radius: 8px;
        /* font-weight: bold; */
        font-size:16px;
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
        justify-content: center;
        align-items: center;
        font-size: 40px;
        color: #555;
        margin-right: 15px;
        flex-shrink: 0;
        padding:5px;
    }
    .profile-img img {
    width: 100%;  /* Adjust width */
    height: 100%; /* Adjust height */
    border-radius: 50%; /* Makes it circular */
    object-fit: cover; /* Ensures the image fits well */

}

    .profile-details {
        flex: 1;
    }

    .profile-details label {
        font-weight: bold;
    }

    .profile-details p {
        margin: 3px 0;
        /* Reduce top and bottom margin */
        line-height: 1.3;
        /* Adjust line height (default is around 1.5) */
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
            <div class="profile-img">
                <img src="<?php echo htmlentities($result->ProfilePic); ?>" width="100" alt="Profile Image">
            </div>

            <div class="profile-details">
                <p><!-- <label>Full Name:</label>  --><h3 style="font-weight:bold;"><?php echo htmlentities($result->FullName); ?> </h3> 
                </p>
                <p><label>Phone No:</label> <?php echo htmlentities($result->MobileNumber); ?></p>
                <p><label>Email:</label> <?php echo htmlentities($result->EmailId); ?></p>
                <p><label>Reg Date:</label> <?php echo htmlentities($result->RegDate); ?></p>
                <p><label>Status:</label>
                    <span class="status <?php echo ($result->Status == 1) ? 'active' : 'blocked'; ?>">
                        <?php echo ($result->Status == 1) ? 'ACTIVE' : 'BLOCKED'; ?>
                    </span>
                </p>
                <button type="submit" name="update" class="btn btn-primary" id="submit">Update Now
                </button>
            </div>
        </div>

        <?php } ?>

    </div>

    <script src="assets/js/jquery-1.10.2.js"></script>
    <script src="assets/js/bootstrap.js"></script>
    <script src="assets/js/custom.js"></script>
</body>

</html>

<?php } ?>
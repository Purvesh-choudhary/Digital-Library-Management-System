<?php
    session_start();
    error_reporting(0);
    include('includes/config.php');
    if(strlen($_SESSION['login'])==0)
        {   
    header('location:index.php');
    }
    else{ 
 ?>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Digital Library Management System | Issued Books</title>
    <!-- BOOTSTRAP CORE STYLE  -->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONT AWESOME STYLE  -->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <!-- DATATABLE STYLE  -->
    <link href="assets/js/dataTables/dataTables.bootstrap.css" rel="stylesheet" />
    <!-- CUSTOM STYLE  -->
    <link href="assets/css/style.css" rel="stylesheet" />
    <!-- GOOGLE FONT -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

</head>

<body>
    <!------MENU SECTION START-->
    <?php include('includes/header.php');?>
    <!-- MENU SECTION END-->
    <div class="content-wrapper">
        <div class="container">
            <div class="row pad-botm">
                <div class="col-md-12">
                    <h4 class="header-line">Books Avalaible In Library</h4>
                </div>


                <div class="row">
                    <div class="col-md-12">
                        <!-- Advanced Tables -->
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Listed Books
                            </div>
                            <div class="panel-body">


                                <?php $sql = "SELECT tblbooks.BookName,tblbooks.BookAvailQuantity,tblcategory.CategoryName,tblauthors.AuthorName,tblbooks.ISBNNumber,tblbooks.BookPrice,tblbooks.id as bookid,tblbooks.bookImage,tblbooks.isIssued from  tblbooks join tblcategory on tblcategory.id=tblbooks.CatId join tblauthors on tblauthors.id=tblbooks.AuthorId";
                                    $query = $dbh -> prepare($sql);
                                    $query->execute();
                                    $results=$query->fetchAll(PDO::FETCH_OBJ);
                                    $cnt=1;
                                    if($query->rowCount() > 0)
                                    {
                                        foreach($results as $result)
                                        {               
                                ?>
                                            <div class="col-md-4" style="float:left; height:220px; width:550px; box-shadow: 0 4px 8px 0 rgba(48, 48, 48, 0.14), 0 6px 20px 0 rgba(0, 0, 0, 0.13); margin:7px;">
                                                <img src="admin/bookimg/<?php echo htmlentities($result->bookImage);?>" style="float:left; height:210px; margin-top:5px; padding:10px; width:150px; ">
                                                <br /><b><?php echo htmlentities($result->BookName);?></b><br />
                                                    <span><?php echo htmlentities($result->AuthorName);?><br /></span>                                                       <span><?php echo htmlentities($result->CategoryName);?><br /></span>
                                                    <span><?php echo htmlentities($result->ISBNNumber);?><br /></span>
                                                    <span><?php echo htmlentities($result->BookPrice);?><br /></span>
                                                    <span>Available QTY : <?php echo htmlentities($result->BookAvailQuantity);?></span>
                                                    <span><?php if($result->BookAvailQuantity=='0'): ?>
                                                    <p style="color:red; float:right; font-weight:bold;">Book Not Available</p></span>
                                            
                                                <?php endif;?>
                                            </div>

                                        <?php $cnt=$cnt+1;
                                        }
                                    } 
                                        ?>
                            </div>
                        </div>
                        <!--End Advanced Tables -->
                    </div>
                </div>



            </div>
        </div>
    </div>

    <!-- CONTENT-WRAPPER SECTION END-->
    <?php include('includes/footer.php');?>
    <!-- FOOTER SECTION END-->
    <!-- JAVASCRIPT FILES PLACED AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
    <!-- CORE JQUERY  -->
    <script src="assets/js/jquery-1.10.2.js"></script>
    <!-- BOOTSTRAP SCRIPTS  -->
    <script src="assets/js/bootstrap.js"></script>
    <!-- DATATABLE SCRIPTS  -->
    <script src="assets/js/dataTables/jquery.dataTables.js"></script>
    <script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
    <!-- CUSTOM SCRIPTS  -->
    <script src="assets/js/custom.js"></script>

</body>

</html>
<?php } ?>
<?php 


	include("connect.php");
  
	


	if($_SERVER['REQUEST_METHOD'] == "POST")
	{
		//something was posted
        $email = $_POST['email'];
		$name = $_POST['name'];
        $surname = $_POST['surname'];
        $contact_no = $_POST['contact_no'];
		$password = $_POST['password'];

		if(!empty($email) && !empty($name) && !empty($surname) && !empty($password) !empty($contact_no)&& !is_numeric($name) && is_numeric($contact_no))
		{

			//save to database
			$farmer_id = random_num(1000);// can change number
			$query = "insert into farmers (email,name,surname,contact_no,password) values ('$email','$name','$surname','$contact_no','$password')";

			mysqli_query($con, $query);

			header("Location: sign.php"); // directed to sign in if signup is a success.
			die;
		}else
		{
			echo "Please enter some valid information!";
		}
	}
?>
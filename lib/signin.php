<?php 



	include("connect.php");




	if($_SERVER['REQUEST_METHOD'] == "POST")
	{
		//something was posted
		$name = $_POST['name'];
		$password = $_POST['password'];

		if(!empty($name) && !empty($password) && !is_numeric($name))
		{

			//read from database
			$query = "select * from farmers where name = '$name' ";
			$result = mysqli_query($query);

			
				
			

					$user_data = mysqli_fetch_assoc($result);
					
					if($user_data['password'] === $password)
					{

						echo "logged in";
						die;
						
						
					}
				
			
			
			echo "wrong username or password!";
		}else
		{
			echo "wrong username or password!";
		}
	}

?>
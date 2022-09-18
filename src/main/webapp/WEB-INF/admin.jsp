<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>OnlineExam - Admin</title>
<%@include file="../component/style.jsp"%>
<link rel="stylesheet" href="../css/main.css">
</head>
<body>
	<%@include file="../component/navbar.jsp"%>
	<div class="container">
		<div class="row mt-4">
			<%-- first Col --%>
			<div class="col-md-4">
				<div class="card custome__card">
					<div class="card-body text-center">
						<img style="max-width: 100px" class="img-fluid"
							src="../images/user.png" />
						<h2>4666</h2>
						<h1>User</h1>
					</div>
				</div>
			</div>
			<%-- Second Col --%>
			<div class="col-md-4">
				<div class="card custome__card">
					<div class="card-body text-center">
						<img style="max-width: 100px" class="img-fluid"
							src="../images/categories.png" />
						<h2>100</h2>
						<h1>Test Given</h1>
					</div>
				</div>
			</div>
			<%-- Third Col --%>
			<div class="col-md-4">
				<div class="card custome__card">
					<div class="card-body text-center">
						<img style="max-width: 100px" class="img-fluid"
							src="../images/packaging.png" />
						<h2>5464</h2>
						<h1>Products</h1>
					</div>
				</div>
			</div>
		</div>

		<%-- Second Row --%>

		<div class="row mt-4">
			<%-- first Col --%>
			<div class="col-md-6">
				<div class="card custome__card">
					<div class="card-body text-center">
						<img style="max-width: 100px" class="img-fluid"
							src="../images/plus.png" />
						<h1>Add Question</h1>
					</div>
				</div>
			</div>

			<%-- Second Col --%>
			<div class="col-md-6">
				<div class="card custome__card" data-toggle="modal"
					data-target="#addProductModal">
					<div class="card-body text-center">
						<img style="max-width: 100px" class="img-fluid"
							src="../images/plus.png" />
						<%-- <p>Click here to add new Product</p> --%>
						<h1>Add Product</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

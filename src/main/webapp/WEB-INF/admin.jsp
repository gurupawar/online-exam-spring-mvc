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
	<div style="max-width: 500px;" class="container mt-4">
		${msg}</div>
	<div class="container">
		<div class="row mt-4">
			<%-- first Col --%>
			<div class="col-md-4">
				<div class="card custome__card">
					<div class="card-body text-center">
						<img style="max-width: 100px" class="img-fluid"
							src="../images/user.png" />
						<h2>${totalUser}</h2>
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
				<div class="card custome__card" data-toggle="modal"
					data-target="#addQuestionn">
					<div class="card-body text-center">
						<img style="max-width: 100px" class="img-fluid"
							src="../images/plus.png" />
						<h1>Add Product</h1>
					</div>
				</div>
			</div>

			<%-- Second Col --%>
			<div class="col-md-6">
				<div class="card custome__card" data-toggle="modal"
					data-target="#addCategoryModal">
					<div class="card-body text-center">
						<img style="max-width: 100px" class="img-fluid"
							src="../images/plus.png" /> <a href="/addCategory"><h1>Add
								Product</h1></a>
					</div>
				</div>
			</div>
		</div>
	</div>

<div class="modal fade" id="addQuestionn" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add New
						Category</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="addNewQuestion" method="post">

						<div class="form-group">
							<label for="exampleFormControlTextarea1">Question</label>
							<textarea name="q_question" class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="your question goes here..." required></textarea>
						</div>

						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="exampleInputOption1">Option 1</label>
								<input name="q_option1" type="text" class="form-control" id="exampleInputOption1" placeholder="" required>
							</div>
							<div class="form-group col-md-6">
								<label for="exampleInputOption2">Option 2</label>
								<input name="q_option2" type="text" class="form-control" id="exampleInputOption2" placeholder="" required>
							</div>
						</div>

						<div class="form-row">
						<div class="form-group col-md-6">
							<label for="exampleInputOption3">Option 3</label>
							<input name="q_option3" type="text" class="form-control" id="exampleInputOption3" placeholder="" required>
						</div>
						<div class="form-group col-md-6">
							<label for="exampleInputOption4">Option 4</label>
							<input name="q_option4" type="text" class="form-control" id="exampleInputOption4" placeholder="" required>
						</div>
					</div>

					 <div class="form-group">
						<label for="exampleInputAnswer">Correct Answer</label><input
							type="text" name="q_answeser" class="form-control"
							id="exampleInputAnswer" required >
					</div>

						<div class="form-group">
						<label for="q_subject">Select Subject</label>
						<select name="q_subject" class="form-control" id="q_subject">
							<option value="java">Java</option>
							<option value="math">Math</option>
							<option value="gk">General Knowledge</option>
							<option value="css">Css</option>
							<option value="datastructure">Data Structure</option>
						</select>
					</div>


						<button class="btn btn-primary">Add</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Add Category Modal -->
	<%-- <div class="modal fade" id="addCategoryModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add New
						Category</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form formaction="addNewQuestion" method="post">
						<div class="form-group">
							<label for="exampleFormControlTextarea1">Question</label>
							<textarea name="q_question" class="form-control"
								id="exampleFormControlTextarea1" rows="3"
								placeholder="your question goes here..." required></textarea>
						</div>

						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="exampleInputOption1">Option 1</label> <input
									name="q_option1" type="text" class="form-control"
									id="exampleInputOption1" placeholder="" required>
							</div>
							<div class="form-group col-md-6">
								<label for="exampleInputOption2">Option 2</label> <input
									name="q_option2" type="text" class="form-control"
									id="exampleInputOption2" placeholder="" required>
							</div>
						</div>

						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="exampleInputOption3">Option 3</label> <input
									name="q_option3" type="text" class="form-control"
									id="exampleInputOption3" placeholder="" required>
							</div>
							<div class="form-group col-md-6">
								<label for="exampleInputOption4">Option 4</label> <input
									name="q_option4" type="text" class="form-control"
									id="exampleInputOption4" placeholder="" required>
							</div>
						</div>
						<div class="form-group">
							<label for="exampleInputAnswer">Correct Answer</label><input
								type="text" name="q_answeser" class="form-control"
								id="exampleInputAnswer" required>
						</div>
						<div class="form-group">
							<label for="q_subject">Select Subject</label> <select
								class="form-control" id="q_subject">
								<option value="java">Java</option>
								<option value="math">Math</option>
								<option value="gk">General Knowledge</option>
								<option value="css">Css</option>
								<option value="datastructure">Data Structure</option>
							</select>
							<button class="btn btn-primary">Add</button>
						</div>
						<div class="container text-center"></div>
				</div>
				</form>
			</div>
		</div>
	</div> --%>
	</div>
</body>
</html>

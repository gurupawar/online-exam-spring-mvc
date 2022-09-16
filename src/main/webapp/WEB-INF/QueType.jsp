<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>OnlineExam - select category</title>
<%@include file="../component/style.jsp"%>
<link rel="stylesheet" href="../css/main.css">
</head>
<body>
	<%@include file="../component/navbar.jsp"%>
	<div class="row mt-5">
		<div class="container">
			<div class="card bg-light" >
            <div class="card-body">
            <h3 class="text-center">Select quiz category</h3>

                <form action="startQuiz" method="post" class="text-center">
                    <div class="form-group mt-5" style="min-width:300px; display:inline-block;">
                        <select name="selectedOption" class="form-control" id="exampleFormControlSelect1">
                            <option value="math">Math</option>
                            <option value="java">Java</option>
                            <option value="html">Html</option>
                            <option value="css">Css</option>
                            <option value="gk">General Knowledge</option>
                        </select>
                    </div>
                        <button class="btn-dark rounded py-1 ml-2" style="cursor:pointer;">Start quiz</div>
                </form>
            </div>
        </div>
	</div>
</body>
</html>

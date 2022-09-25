<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>OnlineExam - Que 1</title>
<%@include file="../component/style.jsp"%>
<link rel="stylesheet" href="../css/main.css">
<style>
    #option1, #option2, #option3, #option4, label, button{
        cursor:pointer;
    }

    button {
        max-width:120px;
        min-width:120px;
    }
    .btn__group {
        display:flex;
        justify-content: space-between;
    }

</style>
</head>
<body>
	<%@include file="../component/navbar.jsp"%>
	<div class="row mt-5">
		<div class="container">
			<div class="card bg-light">
              ${alert_msg}
            <div class="card-body">
                <form name="que_form" action="nexQuestion" method="post" class="mt-4">
                    <div class="queNo__que">
                        <input id="qno" text="text" name="qno" value="${sorted_Question.q_id}" readonly /><br>
                        <input id="q_que" text="text" name="q_que" value="${sorted_Question.question}" readonly/>
                    </div>
                    <div class="ml-2">
                        <div class="form-check">
                        <input class="form-check-input"  type="radio" name="selectedOption" id="gridRadios1" value="${sorted_Question.opt1}" onclick="sendData()">
                            <label class="form-check-label" for="gridRadios1">
                             ${sorted_Question.opt1}
                            </label>
                    </div>
                    <div class="form-check">
                            <input class="form-check-input" type="radio" name="selectedOption" id="gridRadios2" value="${sorted_Question.opt2}" onclick="sendData()">
                                <label class="form-check-label" for="gridRadios2">
                                 ${sorted_Question.opt2}
                            </label>
                    </div>
                     <div class="form-check">
                            <input class="form-check-input" type="radio" name="selectedOption" id="gridRadios3" value="${sorted_Question.opt3}" onclick="sendData()">
                                <label class="form-check-label" for="gridRadios3">
                                 ${sorted_Question.opt3}
                            </label>
                    </div>
                     <div class="form-check mb-4">
                            <input class="form-check-input" type="radio" name="selectedOption" id="gridRadios4" value="${sorted_Question.opt4}" onclick="sendData()">
                                <label class="form-check-label" for="gridRadios4">
                                 ${sorted_Question.opt4}
                            </label>
                    </div>
                        <div class="btn__group">
                            <div class="btn__groupOne">
                                <button type="submit" class="btn-dark rounded py-1" formaction="previousQue">Previous</button>
                                <button type="submit" class="btn-dark rounded py-1" formaction="nextQue">Next</button>
                            </div>
                                <button type="submit" class="btn-dark rounded py-1" formaction="endQuiz">End Quiz</button>
                            </div>
                    </div>
                    </div>
                </form>
            </div>
        </div>
	</div>

<script type="text/javascript">

function sendData() {
    console.log("hel");
    var xmlhttp = new XMLHttpRequest();
    var qno = document.que_form.qno.value;
    var submittedAnswer = document.que_form.selectedOption.value;
    var question = document.que_form.q_que.value;
    var data = "qno="+qno+"&submittedAnswer="+submittedAnswer+"&question="+question;

    xmlhttp.open("get", "saveResponse?"+data);
    xmlhttp.send();
}
</script>
</body>
</html>

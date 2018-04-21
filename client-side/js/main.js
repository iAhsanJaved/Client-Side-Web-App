function displayStudents() {
    document.getElementById('heading-title').innerHTML='Students';
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            var myObj = JSON.parse(this.responseText);

            var node = document.getElementById('content');
             

            var htmlcode = '<table class="table"><thead><tr><th>Student ID</th><th>Name</th><th>Father Name</th><th>DOB</th><th>Email</th><th>Contact Number</th></tr></thead>';

            htmlcode += '<tbody>';

            for (var i = 0; i < myObj["records"].length; i++) {
                var student_id = myObj["records"][i].student_id;
                var name = myObj["records"][i].name;
                var father_name = myObj["records"][i].father_name;
                var dob = myObj["records"][i].dob;
                var email = myObj["records"][i].email;
                var contact_number = myObj["records"][i].contact_number;
                
                htmlcode += '<tr><td>'+student_id+'</td><td>'+name+'</td><td>'+father_name+'</td><td>'+dob+'</td><td>'+email+'</td><td>'+contact_number+'</td></tr> ';
    
            }
            
            htmlcode += '</tbody> </table>';
            htmlcode += '<button id="btn" onclick="displayStudents()" type="button" class="btn btn-primary">Refresh</button>';
            node.innerHTML = htmlcode;


        }
    };
    xmlhttp.open("GET", "http://localhost/studentapp/back-end/api/student/read.php", true);
    xmlhttp.send();
}

function addStudent() {
    document.getElementById('heading-title').innerHTML='Add Student';
    document.getElementById('content').innerHTML = '<form action="" onsubmit="return addStudent_submit()"> <div class="form-group"> <label for="name">Name</label> <input type="text" class="form-control" name="name" required> </div> <div class="form-group"> <label for="father_name">Father Name</label> <input type="text" class="form-control" name="father_name" required> </div> <div class="form-group"> <label for="dob">DOB</label> <input type="date" class="form-control" name="dob"> </div> <div class="form-group"> <label for="email">Email</label> <input type="email" class="form-control" name="email" required> </div> <div class="form-group"> <label for="contact_number">Contact Number</label> <input type="number" class="form-control" name="contact_number" required> </div> <button type="submit" class="btn btn-success">Add Student</button> </form>';
    return false;
}



function addStudent_submit() {
    var name = document.getElementsByName('name')[0].value;
    var father_name = document.getElementsByName('father_name')[0].value;
    var dob = document.getElementsByName('dob')[0].value;
    var email = document.getElementsByName('email')[0].value;
    var contact_number = document.getElementsByName('contact_number')[0].value;

    var Student = {
        "name" : name,
        "father_name": father_name,
        "dob": dob,
        "email": email,
        "contact_number": contact_number
    };

    var reqBodyJSON = JSON.stringify(Student);
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            var myObj = JSON.parse(this.responseText);

            if (myObj['message'] == 'Student record was created') {
                displayStudents();
            }

        }
    };
    xmlhttp.open("POST", "http://localhost/studentapp/back-end/api/student/create.php", true);
    xmlhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
    xmlhttp.send(reqBodyJSON);
    
    return false;
}
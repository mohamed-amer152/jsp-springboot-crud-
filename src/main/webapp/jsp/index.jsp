<%-- 
    Document   : index
    Author     : amer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="//cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
        <title>JSP Ajax CRUD</title>
    </head>
    <body>
        <nav class="navbar navbar-dark bg-dark">
            <h1 style="color: white " >   &nbsp;     JSP AJAX SPRING </h1>
        </nav>

        <br>
        <div class="row">

            <div class="col-sm-4">

                <div class="container">

                    <form id='formcar' name="formcar">

                        <div class="form-group" align="left">
                            <label>Car Name </label>
                            <input type="text" id='name' name='name' class="form-control" placeholder="Enter the name " size="40px" required="" />
                        </div>
                        <br>
                        <div class="form-group">
                            <label>Car Color </label>
                            <input type="text" id='color' name='color' class="form-control" placeholder="Enter the color " size="40px" required="" />
                        </div>
                        <br>
                       

                        <div class="form-group" align="right">
                            <button type='button' onclick="s()" class="btn btn-info" id='save' name="save">Save</button>
                            <button type='button' onclick="r()" class="btn btn-warning" id='reset' name="reset">Reset</button>

                        </div>

                    </form>

                </div>

            </div>



            <div class="col-sm-8">

                <div class="tbl-body">

                    <table class="table table-striped table-dark" id="tblcar"  cellpadding="0" cellspacing="0" width="100%">
                        <thead>
                            <tr>
                                <th ></th>
                                <th ></th>
                                <th ></th>
                                <th ></th>

                            </tr>
                        </thead>

                    </table>

                </div>

            </div>


        </div>
        <script src="component/DataTables/datatables.min.js" type="text/javascript"></script>
        <script src="component/jquery/jquery.js" type="text/javascript"></script>
        <script src="component/jquery/jquery.min.js" type="text/javascript"></script>
        <script src="component/jquery.validate.min.js" type="text/javascript"></script>
        <script src="////cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js" type="text/javascript"></script>
        <script>

                                
                                var stdid = null;
                                var isNew = true;
                                getall();
                                function s()
                                {

                                    if ($("#formcar").valid())
                                    {
                                        var url = "";
                                        var data = "";
                                        var method;
                                        if (isNew == true) {
                                            url = '/save';
                                            data = $("#formcar").serialize();
                                            method = 'POST';
                                        } else
                                        {
                                            url = '/save';
                                            data = $("#formcar").serialize() + "&id=" + stdid;
                                            method = 'POST';
                                        }


                                        $.ajax({

                                            type: method,
                                            url : url,
                                            dataType : "JSON",
                                            data : data,
                                            success:function(data)
                                            {
                                                $('#name').val("");
                                                $('#color').val("");
                                                console.log(data);
                                                getall();
                                                if(data.status == "success")
                                                {
                                                    alert("Record Addedd");
                                                }
                                                else
                                                {
                                                    alert("Record Updateedddd");
                                                }
                                            }

                                        });
                                    }


                                }




                                function getall()
                                {
                                    $("#tblcar").dataTable().fnDestroy();
                                    $.ajax({

                                        url: "/getalle",
                                        type: 'GET',
                                        dataType: 'JSON',
                                        success: function (data) {
                                            $("#tblcar").dataTable(
                                                    {
                                                        "aaData": data,
                                                        "scrollX": true,
                                                        "aoColumns":
                                                                [
                                                                    {"sTitle": "Name", "mData": "name"},
                                                                    {"sTitle": "Color", "mData": "color"},
                                                                    {"sTitle": "Update"
                                                                        , "mData": "id",
                                                                        "render": function (mData, type, row, meta)
                                                                        {
                                                                            return '<button onclick="update(' + mData + ')" class="btn btn-success">Update</button>';
                                                                        }
                                                                    },
                                                                    {"sTitle": "Delete"
                                                                        , "mData": "id",
                                                                        "render": function (mData, type, row, meta)
                                                                        {
                                                                            return '<button onclick="delete_std(' + mData + ')" class="btn btn-danger">Delete</button>';
                                                                        }
                                                                    }

                                                                ]

                                                    }
                                            );
                                        }


                                    });
                                }

                                function update(id)
                                {
                                    $.ajax({
                                        type: "POST",
                                        data: {"id": id},
                                        url: "/edit/"+id,
                                        success: function (data) {
                                            isNew = false;
                                            var obj = JSON.parse(data);
                                            stdid = obj[0].id;
                                            $("#name").val(obj[0].name);
                                            $("#color").val(obj[0].color);

                                        }
                                    });

                                }




                                function delete_std(id)
                                {

                                    $.ajax({
                                        url: "/remove/"+id,
                                        dataType: "JSON",
                                        type: "delete",
                                        data: {"id": id},

                                        success: function (data) {

                                            getall();
                                            alert("Delete Success");

                                        }

                                    });


                                }


                                function r()
                                {
                                    $("#name").val("");
                                    $("#color").val("");

                                }


        </script>



    </body>
</html>

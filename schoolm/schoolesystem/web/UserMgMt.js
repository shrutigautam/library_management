/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



$(document).ready(function(){
    $(".ulist").click(function(){
        mm=$(".list").css("display");
        if(mm=="none")
        {
            $(".list").css({"display":"block"})
        }
        else{
            $(".list").css({"display":"none"})
        }

    });
});

$(document).ready(function(){
    $(".ulist2").click(function(){
        gg=$(".list2").css("display");
        if(gg=="none")
        {
            $(".list2").css({"display":"block"})
        }
        else{
            $(".list2").css({"display":"none"})
        }

    });
});
$(document).ready(function(){
    $(".ulist3").click(function(){
        kk=$(".list3").css("display");
        if(kk=="none")
        {
            $(".list3").css({"display":"block"})
        }
        else{
            $(".list3").css({"display":"none"})
        }

    });
});
$(document).ready(function(){
    $(".ulist4").click(function(){
        ll=$(".list4").css("display");
        if(ll=="none")
        {
            $(".list4").css({"display":"block"})
        }
        else{
            $(".list4").css({"display":"none"})
        }

    });
});
$(document).ready(function(){
    $(".ulist5").click(function(){
        hh=$(".list5").css("display");
        if(hh=="none")
        {
            $(".list5").css({"display":"block"})
        }
        else{
            $(".list5").css({"display":"none"})
        }

    });
});
$(document).ready(function(){
    $(".ulist6").click(function(){
        ff=$(".list6").css("display");
        if(ff=="none")
        {
            $(".list6").css({"display":"block"})
        }
        else{
            $(".list6").css({"display":"none"})
        }

    });
});
$(document).ready(function(){
    $("#imgchange").click(function(){
       imgPath= $("#imgchange").attr("src");
       if(imgPath== "images/plus.jpg")
       {
           $("#imgchange").attr("src","images/minus.jpg")
       }
       else
       {
          $("#imgchange").attr("src","images/plus.jpg")  
       }
    });
});
$(document).ready(function(){
    $("#imgchange1").click(function(){
       imgPath= $("#imgchange1").attr("src");
       if(imgPath== "images/plus.jpg")
       {
           $("#imgchange1").attr("src","images/minus.jpg")
       }
       else
       {
          $("#imgchange1").attr("src","images/plus.jpg")  
       }
    });
});
$(document).ready(function(){
    $("#imgchange2").click(function(){
       imgPath= $("#imgchange2").attr("src");
       if(imgPath== "images/plus.jpg")
       {
           $("#imgchange2").attr("src","images/minus.jpg")
       }
       else
       {
          $("#imgchange2").attr("src","images/plus.jpg")  
       }
    });
});
$(document).ready(function(){
    $("#imgchange3").click(function(){
       imgPath= $("#imgchange3").attr("src");
       if(imgPath== "images/plus.jpg")
       {
           $("#imgchange3").attr("src","images/minus.jpg")
       }
       else
       {
          $("#imgchange3").attr("src","images/plus.jpg")  
       }
    });
});
$(document).ready(function(){
    $("#imgchange4").click(function(){
       imgPath= $("#imgchange4").attr("src");
       if(imgPath== "images/plus.jpg")
       {
           $("#imgchange4").attr("src","images/minus.jpg");
       }
       else
       {
          $("#imgchange4").attr("src","images/plus.jpg");  
       }
    });
});
$(document).ready(function(){
    $("#imgchange5").click(function(){
       imgPath= $("#imgchange5").attr("src");
       if(imgPath== "images/plus.jpg")
       {
           $("#imgchange5").attr("src","images/minus.jpg");
       }
       else
       {
          $("#imgchange5").attr("src","images/plus.jpg");  
       }
    });
});
 $(function () {
        $("#1").click(function () {
            if ($(this).is(":checked")) {
                $("#2").checked();
            } else {
                $("#2").unchecked();
            }
        });
    });
      
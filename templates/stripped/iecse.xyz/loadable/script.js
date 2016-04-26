$(document).ready(function() {
    const current = $(".main").html();
    console.log(current);
    $.preloadImages = function() {
      for (var i = 0; i < arguments.length; i++) {
        $("<img />").attr("src", arguments[i]);
      }
    }
$.preloadImages("viewable/1.png","viewable/2.png","viewable/3.png","viewable/4.png","viewable/5.png","viewable/6.png");
    $(".topnav").slideDown();
    $(".logo").delay(800).slideDown();
    for (i = 6; i >= 1; i--) {
            $("#d" + i).delay(i * 50).css({
                'height': '0vh',
                'top': '50vh'
            }, 700);
            $("#overlay" + i).delay(i * 50).css({
                'height': '0vh',
            }, 700);
            //$('#d' + i).animate({
              //  top: dir + '00vh'
            //}, 700);
            dir *= -1;
        }

    $(".main").delay(800).show();
    $(".div").show();
    $("#logo_1").css("visibility", "visible");
            var dir = 1;
            for (i = 1; i <= 6; i++) {
                $('#d' + i).addClass("hov");
                $('.div').hover(function() {
                        $('.desp').css("display", "block");
                    },
                    function() {
                        $('.desp').css("display", "none");
                    });
                $('#d' + i).css("opacity", "0.8");
                $("#logo_" + (i + 1)).css("visibility", "hidden");
                $('#d' + i).delay(i * 50).animate({
                    height: '100vh',
                    top: '0vh',
                    left: '0%'
                }, 700, function() {});           
                $('#overlay' + i).delay(i * 50).animate({
                    height: '100vh',
                    top: '0vh',
                    left: '0%'
                }, 700, function() {});
 }
            $('.icon').hover(function() {
                    $(this).css("background-color", "black");
                },
                function() {
                    $('.icon').css('background-color', '#22313F');
                });
    $(".foot").show();
    var flag = 0;

    var target;
    var initial;
    $(".hov").hover(function(){
        target = $(this).attr('target');
        initial = $(this).css('background-color');
        $(".desp").css({'opacity':1});
        $("#overlay" + target).css('background-color','rgba(33, 33, 33, 0.8)');
    },function(){
       // $(".desp").css('opacity','0');
        var color;
        switch(Number(target))
        {
            case 1 : color = "rgba(210, 87, 39, 0.8)";
            break;
            case 2 : color = "rgba(73, 163, 223, 0.8)";
            break;
            case 3 : color = "rgba(8, 147, 115, 0.8)";
            break;
            case 4 : color = "rgba(240, 73, 73, 0.7)";
            break;
            case 5 : color = "rgba(141, 141, 141, 0.8)";
            break;
            case 6 : color = "rgba(103, 66, 115, 0.8)";
            break;
        }
        $("#overlay" + target).css({'background-color': color , 'color':'white'});
    });
    window.contact = function() {
        $("#te").hide();
        flag = 1;
        //$(".main").html("").load("ajax/contact/").fadeIn(1200);
        $.ajax({
            url : 'ajax/contact',
            beforeSend : function()
            {
                NProgress.start();
                NProgress.done();
            },
            success : function(data)
            {
                $(".main").fadeOut();
                //$(".ajax").fadeOut();
                $(".ajax").html(data);
                $(".ajax").fadeIn(700);
            },
        });
    };
    window.community = function() {

        $('body').fadeOut(700);
        setTimeout(function() {
            window.location = "https://iecse.xyz/forum";
        }, 800);
    };
    window.alumni = function() {
        $('body').fadeOut(700);
        setTimeout(function() {
            window.location = "https://iecse.xyz/alumni";
        }, 800);
    };

    window.prom = function() {
        $("#te").hide();
        flag = 1;
        $.ajax({
            url : 'ajax/prometheus',
            beforeSend : function()
            {
                NProgress.start();
                NProgress.done();
            },
            success : function(data)
            {
                $(".main").fadeOut();
               // $(".ajax").fadeOut();
                $(".ajax").html(data);
                $(".ajax").fadeIn();
            },
        });
    };
    window.team = function() {
        $("#te").hide();
        flag = 1;
        $.ajax({
            url : 'ajax/team',
            beforeSend : function()
            {
                NProgress.start();
                NProgress.done();
            },
            success : function(data)
            {

                $(".main").fadeOut();
               // $(".ajax").fadeOut();
                $(".ajax").html(data);
                $(".ajax").fadeIn();
            },
        });
    };
    window.about = function() {
        $("#te").hide();
        //current = $(".main").html();
        flag = 1;
        $.ajax({
            url : 'ajax/about',
            beforeSend : function()
            {
                NProgress.start();
                NProgress.done();
            },
            success : function(data)
            {
                $(".main").fadeOut();
               // $(".ajax").fadeOut();
                $(".ajax").html(data);
                $(".ajax").fadeIn(700);
            },
        });
    };
    $(document).on("click", ".hov", function() {
        flag = 0;
       var id = Number($(this).attr('target'));
        $.ajax({
            url: 'ajax/getContent.php',
            beforeSend : function()
            {
                NProgress.start();
                NProgress.done();
            },
            data: 'category=' + id,
            success: function(data) {
                $("#te").html(data);
            },

        });
        $("#te").css("display", "block");
        $('#te').css("opacity", "1");
        $('#te').css("left", "18%");
        $("#logo_1").css("visibility", "hidden");
        $('#d' + id).removeClass("hov");
        $('#d' + id).css("opacity", "1");
        $('#c' + id).css("visibility", "visible");
        $("#logo_" + (id + 1)).css("visibility", "visible");
        $('#d' + id).delay(700 + 6 * 50).animate({
            left: '-' + (id - 1) * (100 / 6) + '%',
        }, 365 * id);

        var dir = -1;
        for (i = 6; i >= 1; i--) {
            if (i == id) {
                continue;
            }
            $("#logo_" + (i + 1)).css("z-index", "10");
            $("#d" + i).delay(i * 50).animate({
                'height': '0vh',
                'top': '50vh'
            }, 700);
            $("#overlay" + i).delay(i * 50).animate({
                'height': '0vh',
            }, 700);
            //$('#d' + i).animate({
              //  top: dir + '00vh'
            //}, 700);
            dir *= -1;
            $('#de' + i).css("display", "none");
            $('#de' + id).css("display", "none");
        }
        $(".txt").hide();
    });
    $(document).on("click", ".logo", function() {
    	$(".txt").show();
        if (flag == 1) {
            $(".main").html(current);
            $(".ajax").fadeOut();
            $(".main").fadeIn();
        } else {
            $("#te").fadeOut();
            $('#te').css("opacity", "0");
            $('#te').css("left", "-100%");
            $("#logo_1").css("visibility", "visible");
            var dir = 1;
            for (i = 1; i <= 6; i++) {
                $('#d' + i).addClass("hov");
                $('.div').hover(function() {
                        $('.desp').css("display", "block");
                    },
                    function() {
                        $('.desp').css("display", "none");
                    });
                $('#d' + i).css("opacity", "0.8");
                $("#logo_" + (i + 1)).css("visibility", "hidden");
                $('#d' + i).delay(i * 50).animate({
                    height: '100vh',
                    top: '0vh',
                    left: '0%'
                }, 700, function() {});           
                $('#overlay' + i).delay(i * 50).animate({
                    height: '100vh',
                    top: '0vh',
                    left: '0%'
                }, 700, function() {});
 }
            $('.icon').hover(function() {
                    $(this).css("background-color", "black");
                },
                function() {
                    $('.icon').css('background-color', '#22313F');
                });
        }
    });
    switch (id) {
        //#CB2026
        case 1:
            {
                col = "#DA7A52";
                break;
            } //garage
        case 2:
            {
                col = "#71A0BE";
                break;
            } //studios
        case 3:
            {
                col = "#2BA085";
                break;
            } //code
        case 4:
            {
                col = "#E04847";
                break;
            } //x
        case 5:
            {
                col = "#ACACAC";
                break;
            } //hashtag
        case 6:
            {
                col = "#714E77";
                break;
            } //web
        
    }
    $('.icon').hover(function hovernav() {
            $(this).css("background-color", col);
        },
        function() {
            $(this).css("background-color", "#22313F");
        });
    $('#d' + id).click(true);

});

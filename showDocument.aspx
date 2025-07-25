<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="showDocument.aspx.cs" Inherits="PrasarNet.showDocument" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <style type="text/css">
              *,
*:after,
*:before {
	margin:0;
	padding:0;
	box-sizing:border-box;
	-webkit-box-sizing:border-box;
	-moz-box-sizing:border-box;
}
body {
	font: 1em 'Helvetica Neue', Helvetica, Arial, sans-serif;
}
   /*.dropdown-menu > li > a:hover, .dropdown-menu > li > a:focus 
   {
            background-image:none !important;
   }
 .dropdown-menu > li > a:hover, .dropdown-menu > li > a:focus {
            background-color:red;
 }
 nav.navbar ul li > ul {
  background: #2B3E50;
  box-shadow: none;
}*/

p {
  line-height: 1.3;
  margin-bottom: 20px}

body {
	background:#ffffff;
  /*padding-top: 40px; */
}
a,
a:hover {
	text-decoration:none;
}
/* Outer navigation wrapper*/
.navigation {
  width: 100%;
  height:70px;
  background: #efefef;
  & a {
    // link colors and text decoration for nav
    color: #666666;
    text-decoration: none;
    & :hover {
      color: #262626;
      text-decoration: none;
    }
  }
}
// Logo and branding
.brand {
  position: absolute;
  float: left;
  padding-left: 20px;
  color: #262626;
  line-height: 70px;
}
.brand a {
  color: #262626;
  font-size: 1.4em;
  font-family: ;
  text-decoration: none;
  font-weight: 600;
  &:visited,
  &:active {
    color: #262626;
  }
  &:hover {
    text-decoration: none;
  }
}
          .navbar-default .navbar-nav > li > a:hover, .navbar-default .navbar-nav > li > a:focus
        {
            background: #FFF !important;
            color: #000 !important;
        }
        
        .dropdown-toggle:active, .open .dropdown-toggle
        {
            background: #FFF !important;
            color: #000 !important;
        }

.container1 {
  max-width: 1000px;
  margin: 0 auto;
  padding: 0px 20px;
}
// Container with no padding for navbar
.nav-container {
  max-width:1100px;
  margin: 0 auto;
  padding: 0px 0px;
}
.containernew
{
    width="100%";
}
// Dropdown list binds to JS toggle event
.nav-dropdown {
  display: none;
  position: absolute;
  left: 0;
  width: 200px;
  z-index: 1;
}
// Navigation 
nav {
  float: right;
  position: relative;
  display: inline-block;
  font-size: 14px;
  font-weight: 600;
  & ul 
  {
     list-style: none;
    text-align: left;
    & li {
      float: left;
      display: inline;
      position: relative;
      & a {
        display: block;
        color: #666666;
        padding: 0 20px;
        line-height: 70px;
        background: #efefef;
        &:hover,
        &:focus,
        &:active {
          text-decoration: none;
        }
      }
      & > a:hover {
        background: #dedede;
        color: #262626;
      } // Show dropdown arrow on list items with children only
      & > a:not(:only-child):after {
        padding-left: 4px;
        content: ' ▾';
      } // Dropdown list
      ul li {
        width: 190px;
        & a {
          background: #efefef;
          display: block;
          padding: 15px;
          line-height: 20px;
          z-index: 1; // Ensure dropdown displays on top of content
          &:hover {
            background: #dedede;
            color: #262626;
          }
        }
      }
    }
  }
}

/* Mobile navigation */

// Binds to JS Toggle
.nav-mobile {
  display: none;
  position: absolute;
  top: 0;
  right: 0;
  background: #efefef;
  height: 70px;
  width: 70px;
}
@media only screen and (max-width: 768px) {
  // Hamburger nav visible on mobile only
  .nav-mobile {
    display: block;
  }
  .logo {
    position: absolute;
  }
  nav {
    width: 100%;
   
    & ul {
      display: none;
      & li {
        width: 100%;
        float: none;
        & > a {
          padding: 15px;
          line-height: 20px;
        }
        &:hover .nav-dropdown 
        {
          display: none;
        }
        ul li a {
          line-height: 20px;
        }
      }
    }
  }
  .nav-dropdown {
    position: static;
    width: 100%;
  }
}

  @media screen and (max-width: 992px)
        {
        
            #headericon
            {
            }
            legend /*panel header text*/
            {
                font-size: 15px;
                font-weight: bold;
            }
        
            .linkbutton
            {
                font-size: 12.5px;
            }
            p
            {
                font-size: 12.5px;
            }
            h1
            {
                font-size: 24px;
            }
            h2
            {
                font-size: 22px;
            }
            h3
            {
                font-size: 18px;
            }
            h5
            {
                font-size: 12px;
            }
        }
        .visible-md-block
        {
            display: block !important;
        }
        @media screen and (max-width: 768px)
        {
            /*.collapsing, .in {background-color: Aqua;}
.collapsing ul li a, .in ul li a {color: Green!important;}
.collapsing ul li a:hover, .in ul li a:hover {color: Red!important;}*/
            .ex3 {
                  background-color: lightblue;
                  height: 300px;
                  width: 100%;    
                  overflow-y: auto;
                 }
            .divpadding
            {
                padding-top: 0px;
            }
            legend
            {
                font-size: 13px;
                font-weight: bold;
            }
            .linkbutton
            {
                font-size: 10.5px;
            }
            p
            {
                font-size: 10.5px;
            }
            h1
            {
                font-size: 18.5px;
            }
            h2
            {
                font-size: 18px;
            }
            h3
            {
                font-size: 16px;
            }
            h5
            {
                font-size: 10px;
            }
        }
        
        
        @media screen and (max-width: 256px)
        {
            .hidden-hide
            {
                display: none !important;
            }
        }
        .scrol
        {
            background-color: lightblue;
            width: 100%;
            overflow-y: auto;
        }
        .container21
        {
            min-height: 430px;
        }
        .container2
        {
            min-height: 500px;
        }
        .container3
        {
            min-height: 400px;
        }
        .containerwidth
        {
            width: 100%;
        }
#nav-toggle {
  position: absolute;
  left: 18px;
  top: 22px;
  cursor: pointer;
  padding: 10px 35px 16px 0px;
  & span,
  & span:before,
  & span:after {
    cursor: pointer;
    border-radius: 1px;
    height: 5px;
    width: 35px;
    background: #262626;
    position: absolute;
    display: block;
    content: '';
    transition: all 300ms ease-in-out;
  }
  & span:before {
    top: -10px;
  }
  & span:after {
    bottom: -10px;
  }
  &.active span {
    background-color: transparent;
    &:before,
    &:after {
      top: 0;
    }
    &:before {
      transform: rotate(45deg);
    }
    &:after {
      transform: rotate(-45deg);
    }
  }
}

    .fixed 
    {
      position: fixed;
      top: 0;
      z-index: 999;
      width: 105%;
      padding-top:5px;
  
    }
     .navpriorscrolling {
      width: 99%;
    }
    .margin {
      margin-top: 10px;
    }
    .containerdiv
    {
         /*   background-color: lightblue;*/
                  min-height: 300px; 
              
    }
    .divwidth
    {
        align:center;
        width:95%;
        height:90%;
    }
     .row-no-padding,.row-no-padding div{
                margin-bottom: 0 !important;
                
            }
            hr { 
    display: block;
    margin-left: auto;
    margin-right: auto;
    border-style: inset;
    border-width: 2px;
    border-color:black;

} 
.imground
{
    width: order-radius: 30%;
}
        #divviewdgdd
        {
            text-align: right;
        }
    </style>
    <script type='text/javascript' src='https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js'></script>
    <script type='text/javascript'>
        /* Begin jQuery */;
        (function ($) {

            $(window).scroll(function (e) {
                if ($(window).scrollTop() >= $("header").height() + 30) {
                    $(".sticky").addClass("fixed");
                    $(".content").addClass("margin");

                } else {
                    $(".sticky").removeClass("fixed");
                    $(".content").removeClass("margin");
                }
                e.stopPropagation();
            });

            // DOM ready


        })(jQuery);
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>

   <%-- this page is to shopw a downloaded documents--%>
  <%-- not for the show order/Circulars/policioes
--%>
    </div>
    </form>
</body>
</html>

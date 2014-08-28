

function __assigned(obj)
{
        var res = false;
        if (typeof(obj) != 'undefined' && (obj))
        {
                if (typeof(obj) != 'string')
                        res = true;
                else
                        res = (obj.length > 0);

        }
        else
        {
                if (typeof(obj) == 'number')
                        if (obj == 0)
                                res = true;
        }
        return res;
}


function __login()
{
      var logined = false;
      var span1 = $("span[id='ShortenedLbl']");
      if (__assigned(span1[1]))
      {
        logined = (span1[1].innerText == "(Код: 657126)");
      }

      if (!logined)
      {
              var need_code = false;
              var ed_code = $("input[id='main_cphMain_txtCode']");
              need_code = __assigned(ed_code);

              if (!need_code)
              {
                      var ed_login = $("input[name='ctl00$ctl00$main$PlaceHolderMain$extLogin$ucLoginFormPage$tbLogin']");
                      var ed_passw = $("input[name='ctl00$ctl00$main$PlaceHolderMain$extLogin$ucLoginFormPage$tbPassword']");;
                      if (__assigned(ed_login) && __assigned(ed_passw))
                      {
                        ed_login[0].value = "_iveco";
                        ed_passw[0].value = "hjtu23iovb89";
                        var btn = $("input[name='ctl00$ctl00$main$PlaceHolderMain$extLogin$ucLoginFormPage$btnPageLogin']");;
                        btn[0].click();
                      }
              }
              else
              {
                      console.log("cmd:this.aut_need_code();");   
              }
      }
      else
      {
              console.log("cmd:this.aut_ok();");
      }
}




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

function __cmd(script)
{
	console.log("cmd:" + script);
}


function __login(log,passw)
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
		  need_code = (__assigned(ed_code[0]));
		
		  if (!need_code)
		  {
		      var ed_login = $("input[name='ctl00$ctl00$main$PlaceHolderMain$extLogin$ucLoginFormPage$tbLogin']");
		      var ed_passw = $("input[name='ctl00$ctl00$main$PlaceHolderMain$extLogin$ucLoginFormPage$tbPassword']");
		      if (__assigned(ed_login) && __assigned(ed_passw))
		      {
		        ed_login[0].value = log;//"";
		        ed_passw[0].value = passw;//"";
		        var btn = $("input[name='ctl00$ctl00$main$PlaceHolderMain$extLogin$ucLoginFormPage$btnPageLogin']");
				var s = "var oo:TOperationObject;begin oo:= TOperationObject.Create();oo.id:= '_login3';oo.selector:= 'http';this.PushOperStack(oo);end;";
		        __cmd(s);
				btn[0].click();
		      }
		  }
		  else
		  {
		  	__cmd("this.aut_need_code();");
		  }
	}
	else
	{
		__cmd("this.aut_ok();");
	}
}

function __tickets()
{
	var items = $("tr[id^='item_r']");
	if (__assigned(items))
	{
		items.each(
						function(index) 
						{
			  				var _item = $(this).children("td:eq(1)").find("a[id*='hlkDistance']");
							if (!__assigned(_item[0]))							
							{
								
							}
							else
							{
								var s = "var t:TTicket;begin t:= TTicket.Create(); end;";
								__cmd(s);
								var s = "var _ticket:TTicket; begin _ticket:= this.ticket; _ticket.dist:= '" + _item[0].innerText  + "'; end;";
								__cmd(s);	
							}
						}
					
				  );
	}
	var s = "var oo:TOperationObject;begin oo:= TOperationObject.Create();oo.id:= '_tickets4';this._process(oo);end;";
	__cmd(s);
}


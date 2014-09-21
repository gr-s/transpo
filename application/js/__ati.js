
var timeout_capcha_id;

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


function __contacts()
{
	var _items = $("a[id*='hlShowMail']");
	var s = "begin this.contact_count:= " + _items.length  + "; end;";
	__cmd(s);
	for(var i=0; i<_items.length; i++) 
	{
		var _item = $(_items[i]);
		                   
		var _firmId = _item.attr('fid');
        var _contactId = _item.attr('cid');
		if (_firmId != null && _contactId != null) 
		{
            var sUrl = "/WebServices/Mail/EmailService.asmx/TryGetEmailAddress";
            var o = $.toJSON({ firmId: _firmId, contactId: _contactId });
            $.ajax({
                type: 'post',
                url: sUrl,
                data: o,
                contentType: "application/json; charset=utf-8",
                dataType: "json",

                success: function(data) {
                    var response = $.parseJSON(data.d);
					var _s = response.Message;
					s = "var _ticket:TTicket; begin _ticket:= this.ticket; _ticket.Contact:= '" + _s  + "'; end;";
					__cmd(s);                    
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    
                }
            });
        }
		else
		{
			var s = "var oo:TOperationObject;begin oo:= TOperationObject.Create();oo.id:= '_contacts4';this._process(oo);end;";
			__cmd(s);
		}
	}
}

function __tickets_capcha()
{
	var _capcha = false;
	var _capcha_item1 = $("img[id*='imgCaptcha']");
	if (_capcha_item1.length > 0)
                _capcha = true;

	if (_capcha)
	{
         var _cph = $(_capcha_item1[0]).attr("src");
		var s = "this.need_captcha('" + _cph + "');";
		__cmd(s);
		var s = "var oo:TOperationObject;begin oo:= TOperationObject.Create();oo.id:= '_tickets_capcha4';this._process(oo);end;";
		__cmd(s);
    }
    else
    {
    	var s = "var oo:TOperationObject;begin oo:= TOperationObject.Create();oo.id:= '_tickets_capcha_error';this._process(oo);end;";
		__cmd(s);
    }
}


function __tickets_enter_capcha(_capcha)
{
        var _capcha_edit = $("input[id='cphLeft_ctlSearch_ctlCaptcha_txtInput']");
        _capcha_edit[0].value = _capcha;
        var btn = $("input[name='ctl00$ctl00$main$cphLeft$ctlSearch$btnTopSearch']");
        btn[0].click();
		timeout_capcha_id = setTimeout(function() 
									   { 
									   		var _capcha_edit = $("input[id='cphLeft_ctlSearch_ctlCaptcha_txtInput']");
											if (_capcha_edit[0].value.length == 0)
											{
												var s = "begin this.PopOperStack(); end;";
												__cmd(s);
												clearTimeout(timeout_capcha_id);	
											}		   
									   }, 
									   5000);
}

function __tickets(__curr_page)
{
	var _capcha = false;
	var _capcha_item1 = $("img[id*='imgCaptcha']");
	if (_capcha_item1.length > 0)
		_capcha = true;
	
	if (!_capcha)
	{
		var _cont = true;
		
		var _cur_page = $("span[id*='cphMain_hlpTop_repPageNumber']");
		if (_cur_page.length > 0)
		{
			var _pg = _cur_page[0].innerText;
			if (_pg != __curr_page)
				_cont = false;
		}
		else
		{
			if (__curr_page > 1)
				_cont = false;
		}
		
		if (_cont)
		{
			try
			{
			
				var page_count = 0;
				var pager = $("div[id='cphMain_hlpTop_pnlPager']").children("a");
				for(var i=0; i<pager.length; i++) 
				{
					var b = true;
					
					if (__assigned($(pager[i]).attr("title")))
						if ($(pager[i]).attr("title").length > 0)
							b = false;
					if (pager[i].innerText == ">>" || pager[i].innerText == "<<")
						b = false;
					if (b)
						page_count++; 
				}
				
				page_count++;
					
				var s = "begin this.page_count:= " + page_count  + "; end;";
				__cmd(s);
				
				var items = $("tr[id^='item_r']");
				if (__assigned(items))
				{
					items.each(
									function(index) 
									{
						  				var _item = $(this).children("td:eq(1)").find("a[id*='hlkDistance']");
										if (!__assigned(_item[0]))							
										{
											var _item0 = $(this).children("td:eq(0)");
											var _item1 = _item0.find("td[class*='noteText']");
											if (_item1.length > 0)
											{
												_s = _item1[0].innerText;
												s = "var _ticket:TTicket; begin _ticket:= this.ticket; _ticket.Note:= '" + _s  + "'; end;";
												__cmd(s);
											}
											
											var _item1 = _item0.find("table[id*='tblFirmData']");
											if (_item1.length > 0)
											{
												_s = _item1[0].innerText;
		                                                                                _s = _s.replace(/\'/g,"`");
												s = "var _ticket:TTicket; begin _ticket:= this.ticket; _ticket.ControllerInfo:= '" + _s  + "'; end;";
												__cmd(s);
		
												var _item2 = _item1.find("a[id*='FirmLink']");
												if (_item2.length > 0)
												{
													_s = $(_item2).attr("href");
													s = "var _ticket:TTicket; begin _ticket:= this.ticket; _ticket.ControllerLink:= '" + _s  + "'; end;";
													__cmd(s);
												}
											}
		
											var _item1 = _item0.find("table[id*='tblContacts']");
											if (_item1.length > 0)
											{
												_s = _item1[0].innerText;
		                                                                                _s = _s.replace(/\'/g,"`");
												s = "var _ticket:TTicket; begin _ticket:= this.ticket; _ticket.controller_contacts:= '" + _s  + "'; end;";
												__cmd(s);
											}
											
											s = "var _ticket:TTicket; begin _ticket:= this.ticket; _ticket.id:= ''; end;";
											__cmd(s);
										}
										else
										{
											var s = "var t:TTicket;begin t:= TTicket.Create(); end;";
											__cmd(s);
											
											s = "var _ticket:TTicket; begin _ticket:= this.ticket; _ticket.dist:= '" + _item[0].innerText  + "'; end;";
											__cmd(s);	
											
											_item = $(this).children("td:eq(2)").find("span[id*='item_itTruckDetails']");
											
											var _s = '';
											
											_item.each(
												function(index) 
												{
													if (_s.length > 0)
														_s += ' '; 		
													_s += this.innerText; 		
												}
											)
											
											s = "var _ticket:TTicket; begin _ticket:= this.ticket; _ticket.TruckType:= '" + _s  + "'; end;";
											__cmd(s);	
											
											
											var _item0 = $(this).children("td:eq(3)").find("div[id*='item_pWeight']");
											
											var _item1 = _item0.children("div:eq(0)").children("div:eq(0)").children("div:eq(0)");
											_item = _item1.children("b:eq(0)");
											_s = _item[0].innerText;
											s = "var _ticket:TTicket; begin _ticket:= this.ticket; _ticket.Weight:= '" + _s  + "'; end;";
											__cmd(s);
											
											_item = _item1.children("b:eq(1)");
											_s = _item[0].innerText;
											s = "var _ticket:TTicket; begin _ticket:= this.ticket; _ticket.Volume:= '" + _s  + "'; end;";
											__cmd(s);
											
											var CargoDesc = '';
											
											_item1 = _item0.children("div:eq(0)").find("div[style*='float: left; padding-right:']");
											if (_item1.length > 0)
											{
												_s = _item1[0].innerText;
												CargoDesc += _s;
												s = "var _ticket:TTicket; begin _ticket:= this.ticket; _ticket.CargoName:= '" + _s  + "'; end;";
												__cmd(s);
											}
											
											_item1 = _item0.children("div:eq(0)").find("div[class='noteText']");
											if (_item1.length > 0)
											{
												_s = '';
												for(var i=0; i<_item1.length; i++) 
												{
													if (_s.length > 0)
														_s += ' ';
													_s += _item1[i].innerText;
												}
												if (_s.length > 0)
													CargoDesc += ' (' + _s + ')';
												s = "var _ticket:TTicket; begin _ticket:= this.ticket; _ticket.CargoNote:= '" + _s  + "'; end;";
												__cmd(s);
											}
											
											s = "var _ticket:TTicket; begin _ticket:= this.ticket; _ticket.CargoDesc:= '" + CargoDesc  + "'; end;";
											__cmd(s);
											
											
											_item0 = $(this).children("td:eq(4)").children("div:eq(0)").children("div:eq(0)");
											
											_item1 = _item0.find("span[id*='lblFrom']");
											if (_item1.length > 0)
											{
												s = "var _ticket:TTicket; begin _ticket:= this.ticket; _ticket.FromGeo:= '" + _item1[0].innerText  + "'; end;";
												__cmd(s);
											}
											
											var FromGeoDesc = '';
											
											_item1 = _item0.find("span[id*='lblFromRegion']");
											if (_item1.length > 0)
												FromGeoDesc += _item1[0].innerText;
												
											_item1 = _item0.find("span[id*='lblFromStreet']");
											if (_item1.length > 0)
												FromGeoDesc += _item1[0].innerText;
											
											_item1 = _item0.find("span[id*='lblDistance']");
											if (_item1.length > 0)
											{
												if (FromGeoDesc.length > 0) FromGeoDesc += ' ';
												FromGeoDesc += _item1[0].innerText;
											}
											
											s = "var _ticket:TTicket; begin _ticket:= this.ticket; _ticket.FromGeoDesc1:= '" + FromGeoDesc  + "'; end;";
											__cmd(s);
											
											
											_item1 = _item0.children("b");
											var _s = '';
											for(var i=0; i<_item1.length; i++) 
											{
												if (_s.length > 0)
													_s += ' ';
												_s += _item1[i].innerText;
											}
											
											if (_s.length == 0)
												_s += _item0[0].innerText;
											
											s = "var _ticket:TTicket; begin _ticket:= this.ticket; _ticket.DateDesc:= '" + _s  + "'; end;";
											__cmd(s);
											
											
											
											_item0 = $(this).children("td:eq(5)").children("div:eq(0)").children("div:eq(0)");
											
											_item1 = _item0.find("div[id*='divTo']");
											if (_item1.length > 0)
											{
												s = "var _ticket:TTicket; begin _ticket:= this.ticket; _ticket.ToGeo:= '" + _item1[0].innerText  + "'; end;";
												__cmd(s);
											}
											
											var ToGeoDesc = '';
											
											_item1 = _item0.find("div[id*='divToRegion']");
											if (_item1.length > 0)
												ToGeoDesc += _item1[0].innerText;
											
											_item1 = _item0.find("span[id*='lblToStreet']");
											if (_item1.length > 0)
											{
												if (ToGeoDesc.length > 0) ToGeoDesc += ' ';
												ToGeoDesc += _item1[0].innerText;
											}
											
											_item1 = _item0.find("div[id*='divDistance']");
											if (_item1.length > 0)
											{
												if (ToGeoDesc.length > 0) ToGeoDesc += ' ';
												ToGeoDesc += _item1[0].innerText;
											}
											
											s = "var _ticket:TTicket; begin _ticket:= this.ticket; _ticket.ToGeoDesc1:= '" + ToGeoDesc  + "'; end;";
											__cmd(s);
											
											
											_item0 = $(this).children("td:eq(6)").children("div:eq(0)");
											
											var _price = '';
											
											_item1 = _item0.find("div[id*='divLoadPrice']");
											if (_item1.length > 0)
											{
												if (_price.length > 0) _price += ' ';
												_price += _item1[0].innerText;
											}
											
											_item1 = _item0.find("div[id*='divLoadPriceWithNDS']");
											if (_item1.length > 0)
											{
												if (_price.length > 0) _price += ' ';
												_price += _item1[0].innerText;
											}
											
											_item1 = _item0.find("div[id*='divLoadPriceWithoutNDS']");
											if (_item1.length > 0)
											{
												if (_price.length > 0) _price += ' ';
												_price += _item1[0].innerText;
											}
											
											s = "var _ticket:TTicket; begin _ticket:= this.ticket; _ticket.Price1:= '" + _price  + "'; end;";
											__cmd(s);
										}
									}
								
							  );
				}
			
			}
			catch(e)
			{
				
			}
			finally
			{
				var s = "var oo:TOperationObject;begin oo:= TOperationObject.Create();oo.id:= '_tickets4';this._process(oo);end;";
				__cmd(s);
			}
		}
		else
		{
			var s = "var oo:TOperationObject;begin oo:= TOperationObject.Create();oo.id:= '_tickets_end';this._process(oo);end;";
			__cmd(s);
		}
	}
	else
	{
		var _cph = $(_capcha_item1[0]).attr("src");
		var s = "this.need_captcha('" + _cph + "');";
		__cmd(s);
		var s = "var oo:TOperationObject;begin oo:= TOperationObject.Create();oo.id:= '_tickets_capcha1';this._process(oo);end;";
		__cmd(s);
	}
}


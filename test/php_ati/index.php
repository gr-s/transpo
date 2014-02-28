<?php

	if ($_GET['task'] == 'test')
	{
		$postdata = http_build_query(
		    array(
		        'lgnUserName' => '_iveco',
		        'lgnPassword' => 'Yb2b76D4bc1'
		    )
		);
		
		$opts = array('http' =>
		    array(
		        'method'  => 'GET',
		        'Host'  => 'ati.su',
				'User-Agent'  => 'Mozilla/5.0 (Windows NT 6.1; rv:14.0) Gecko/20100101 Firefox/14.0.1',
				'Accept'  => 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
				'Accept-Language'  => 'ru-ru,ru;q=0.8,en-us;q=0.5,en;q=0.3',
				'Accept-Encoding'  => 'gzip, deflate',
				'Connection'  => 'keep-alive'
		    )
		);
		
		$context  = stream_context_create($opts);

		$result = file_get_contents('http://ati.su/Tables/Default.aspx?EntityType=Load&FromGeo=ИЖЕВСК&ToGeo=НИЖНИЙ%20НОВГОРОД&FromGeoRadius=100&ToGeoRadius=300&CarType=115&LoadType=4&Weight2=5&Volume2=35&FirstDate=2014-3-3&FirstDate2=2014-3-4&ExactFromGeos=true&ExactToGeos=true&qdsv=-1&SortingType=2&PageSize=100&PageNumber=1', false, $context);
		
		echo $result;
	}
?>
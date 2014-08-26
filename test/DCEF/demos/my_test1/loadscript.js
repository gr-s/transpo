
var script = document.createElement('script');
        if (script.readyState && !script.onload) {
	    // IE, Opera
	    script.onreadystatechange = function() {
	        if (script.readyState == "loaded" || script.readyState == "complete") {
	            script.onreadystatechange = null;
	            alert('Loaded');
	        }
	    }
	}
	else {
	    // Rest
	    script.onload = function() {
	        alert('Loaded');
	    };
	}
	script.src = //script//;
	document.getElementsByTagName('head')[0].appendChild(script);

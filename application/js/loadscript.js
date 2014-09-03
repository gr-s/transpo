
var script = document.createElement('script');
        if (script.readyState && !script.onload) {
	    // IE, Opera
	    script.onreadystatechange = function() {
	        if (script.readyState == "loaded" || script.readyState == "complete") {
	            script.onreadystatechange = null;
	            console.log("cmd:this.script_loaded();");
	        }
	    }
	}
	else {
	    // Rest
	    script.onload = function() {
	        console.log("cmd:this.script_loaded();");
	    };
	}
	script.src = //script//;
	document.getElementsByTagName('head')[0].appendChild(script);

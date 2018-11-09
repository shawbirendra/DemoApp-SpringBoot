<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Pricing Portal Support</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
$(document).ready(function() {
	
	$('#response').hide();
	$('#storeResponse').hide();
	$('#pricingServiceTokenResponse').hide();
	$('#localizationResponse').hide();
	$('#pricingsheetResponse').hide();
	$('#hierarchyResponse').hide();
	$('#hierarchyDescriptionResponse').hide();
	$('#pricingsheetNodeResponse').hide();
    $('#profileBtn').click(function(event) {
    	
            var dsId = $('#dsId').val();
            
            var url = window.location.href + "/profile?dsId=" + dsId;
            
        	$('#profileHeader').text("Profile Response");
        	$('#panel-url').text(url);
        	$('#panel-url').attr("href",url);
        	$('#response').show();
        	
            $.get('/pricingweb/pricing/support/profile', {
            	dsId : dsId
            }, function(responseText) {
                $('#profileResponseBody').text(JSON.stringify(responseText,undefined, 2));
            }).fail(function(jqXHR, textStatus, errorThrown) {
            	$('#profileResponseBody').text(JSON.stringify(jqXHR.responseText));
       		}); 
    });
    $('#platformBtn').click(function(event) {
    	
        var dsId = $('#dsId').val();
        
        var url = window.location.href + "/platform?dsId=" + dsId;
        
		$('#profileHeader').text("Platform Response");
		$('#panel-url').text(url);
		$('#panel-url').attr("href",url);
		$('#response').show();
		
        $.get('/pricingweb/pricing/support/platform', {
        	dsId : dsId
        }, function(responseText) {
             $('#profileResponseBody').text(JSON.stringify(responseText,undefined, 2));
        }).fail(function(jqXHR, textStatus, errorThrown) {
        	$('#profileResponseBody').text(JSON.stringify(jqXHR.responseText));
   		}); 
    });
        $('#storeBtn').click(function(event) {
        	
            var storeId = $('#storeId').val();
            
            var url = window.location.href + "/store?appleId=" + storeId;
    		$('#storeResponse').show();
    		$('#storeResponseUrl').text(url);
    		$('#storeResponseUrl').attr("href",url);
    		
            $.get('/pricingweb/pricing/support/store', {
            	appleId : storeId
            }, function(responseText) {
                $('#storeResponseBody').text(JSON.stringify(responseText,undefined, 2));
            }).fail(function(jqXHR, textStatus, errorThrown) {
            	$('#storeResponseBody').text(JSON.stringify(jqXHR.responseText));
       		});    
		});
        
        $('#pricingsheetPublishBtn').click(function(event) {
        	
            var publishId = $('#publishId').val();
            
            var url = window.location.href + "/pricingsheet/publishjson?publishId=" + publishId;
            
            $('#pricingsheetResponseUrl').text(url);
    		$('#pricingsheetResponseUrl').attr("href",url);
    		$('#pricingsheetResponse').show();
    		
    		
            $.get('/pricingweb/pricing/support/pricingsheet/publishjson', {
            	publishId : publishId
            }, function(responseText) {
                  $('#pricingsheetResponseBody').text(JSON.stringify(responseText,undefined, 2));
            }).fail(function(jqXHR, textStatus, errorThrown) {
            	$('#pricingsheetResponseBody').text(JSON.stringify(jqXHR.responseText));
       		});   
		});
        
		$('#pricingsheetBtn').click(function(event) {
        	
            var pricingSheetId = $('#pricingSheetId').val();
            
            var url = window.location.protocol + "//" + window.location.hostname
    		if (window.location.port != ""){
    			url = url + ":" + window.location.port
    		} 
            
    		url = url + "/pricingsheet/getsheet?pricingSheetId=" + pricingSheetId;
    		
            $('#pricingsheetResponseUrl').text(url);
    		$('#pricingsheetResponseUrl').attr("href",url);
    		$('#pricingsheetResponse').show();
    		
    		
            $.get('/pricingweb/pricing/pricingsheet/getsheet', {
            	pricingSheetId : pricingSheetId
            }, function(responseText) {
                  $('#pricingsheetResponseBody').text(JSON.stringify(responseText,undefined, 2));
            }).fail(function(jqXHR, textStatus, errorThrown) {
            	$('#pricingsheetResponseBody').text(JSON.stringify(jqXHR.responseText));
       		});   
		});
        
		$('#hierarchyBtn').click(function(event) {
        	
            var posIds = $('#posIds').val();
            var lobSelected = $('#lobSelected').text();
            
            var url = window.location.protocol + "//" + window.location.hostname
    		if (window.location.port != ""){
    			url = url + ":" + window.location.port
    		} 
            
    		url = url + "/pricingweb/pricing/support/hierarchy?lob=" + lobSelected + "&posIds=" + posIds;
    		
            $('#hierarchyResponseUrl').text(url);
    		$('#hierarchyResponseUrl').attr("href",url);
    		$('#hierarchyResponse').show();
    		
    		
            $.get('/pricingweb/pricing/support/hierarchy', {
            	posIds : posIds,
            	lob : lobSelected
            }, function(responseText) {
                  $('#hierarchyResponseBody').text(JSON.stringify(responseText,undefined, 2));
            }).fail(function(jqXHR, textStatus, errorThrown) {
            	$('#hierarchyResponseBody').text(JSON.stringify(jqXHR.responseText));
       		});   
		});
		
        $('#isHqBtn').click(function(event) {
            var storeId = $('#storeId').val();
            $.get('/pricingweb/pricing/support/store/is_hq', {
            	appleId : storeId
            }, function(responseText) {
            		var url = window.location.href + "/store/is_hq?appleId=" + storeId;
            		$('#storeResponse').show();
            		$('#storeResponseUrl').text(url);
            		$('#storeResponseUrl').attr("href",url);
                    $('#storeResponseBody').text(JSON.stringify(responseText,undefined, 2));
            });   
		});
        
        $('#pricingServiceTokenBtn').click(function(event) {
            $.get('/pricingweb/pricing/support/token/pricing', function(responseText) {
            		var url = window.location.href + "/token/pricing";
            		$('#pricingServiceTokenResponse').show();
            		$('#pricingServiceTokenResponseUrl').text(url);
            		$('#pricingServiceTokenResponseUrl').attr(url);
                    $('#pricingServiceTokenResponseBody').text(responseText);
            });   
		});
        
        $('#localizationCookieBtn').click(function(event) {
            $.get('/pricinglocale/localization', function(responseText) {
            		$('#localizationResponse').show();
            		var url = window.location.protocol + "//" + window.location.hostname
            		if (window.location.port != ""){
            			url = url + ":" + window.location.port
            		} 
            		url = url + "/pricinglocale/localization"
            		$('#localizationResponseUrl').text(url);
            		$('#localizationResponseUrl').attr("href",url);
                    $('#localizationResponseBody').text(JSON.stringify(responseText,undefined, 2));
            }).fail(function(jqXHR, textStatus, errorThrown) {
           	  	if (textStatus == 'timeout')
           		    console.log('The server is not responding');

           		  if (textStatus == 'error')
           		    console.log(errorThrown);

           		  // Etc
       		}); 
		});
        
        $('#localizationCodeBtn').click(function(event) {
        	var localeCode = $('#localeCode').val();
            $.get('/pricinglocale/localization/bylocale', {
            	locale : localeCode
            },function(responseText) {
            		$('#localizationResponse').show();
            		var url = window.location.protocol + "//" + window.location.hostname
            		if (window.location.port != ""){
            			url = url + ":" + window.location.port
            		} 
            		url = url + "/pricinglocale/localization/bylocale?locale=" + localeCode
            		$('#localizationResponseUrl').text(url);
            		$('#localizationResponseUrl').attr("href",url);
                    $('#localizationResponseBody').text(JSON.stringify(responseText,undefined, 2));
            });   
		});
        
        $('#localizationCodeWithFallBackBtn').click(function(event) {
        	var localeCode = $('#localeCode').val();
            $.get('/pricinglocale/localization/withfallback', {
            	locale : localeCode
            },function(responseText) {
            		$('#localizationResponse').show();
            		var url = window.location.protocol + "//" + window.location.hostname
            		if (window.location.port != ""){
            			url = url + ":" + window.location.port
            		} 
            		url = url + "/pricinglocale/localization/withfallback?locale=" + localeCode
            		$('#localizationResponseUrl').text(url);
            		$('#localizationResponseUrl').attr("href",url);
                    $('#localizationResponseBody').text(JSON.stringify(responseText,undefined, 2));
            });   
		});
		$('#hierarchyDescriptionBtn').click(function(event) {
        	
            var phPosIds = $('#phPosIds').val();
            var phLobSelected = $('#phLobSelected').text();
            
            var url = window.location.protocol + "//" + window.location.hostname
    		if (window.location.port != ""){
    			url = url + ":" + window.location.port
    		} 
            
    		url = url + "/pricingweb/pricing/support/hierarchy/description?lob=" + phLobSelected + "&posIds=" + phPosIds;
    		
            $('#hierarchyDescriptionResponseUrl').text(url);
    		$('#hierarchyDescriptionResponseUrl').attr("href",url);
    		$('#hierarchyDescriptionResponse').show();
    		
    		
            $.get('/pricingweb/pricing/support/hierarchy/description', {
            	posIds : phPosIds,
            	lob : phLobSelected
            }, function(responseText) {
                  $('#hierarchyDescriptionResponseBody').text(JSON.stringify(responseText,undefined, 2));
            }).fail(function(jqXHR, textStatus, errorThrown) {
            	$('#hierarchyDescriptionResponseBody').text(JSON.stringify(jqXHR.responseText));
       		});   
	   });
		$('#pricingsheetNodeBtn').click(function(event) {
        	
            var pricingSheetId = $('#pricingSheetNodeId').val();
            
            var url = window.location.protocol + "//" + window.location.hostname
    		if (window.location.port != ""){
    			url = url + ":" + window.location.port
    		} 
            
    		url = url + "/pricingweb/pricing/support/pricingsheet/nodes?pricingSheetId=" + pricingSheetId;
    		
            $('#pricingsheetNodeResponseUrl').text(url);
    		$('#pricingsheetNodeResponseUrl').attr("href",url);
    		$('#pricingsheetNodeResponse').show();
    		
    		
            $.get('/pricingweb/pricing/support/pricingsheet/nodes', {
            	pricingSheetId : pricingSheetId
            }, function(responseText) {
                  $('#pricingsheetNodeResponseBody').text(JSON.stringify(responseText,undefined, 2));
            }).fail(function(jqXHR, textStatus, errorThrown) {
            	$('#pricingsheetNodeResponseBody').text(JSON.stringify(jqXHR.responseText));
       		});   
		});	
		
       $('#storeClearBtn').click(function(event) {
    		$('#storeResponse').hide();   
    		$('#storeId').val("")
       });
       
		$('#profileClearBtn').click(function(event) {
			$('#response').hide();   
			$('#dsId').val("")
       });
		
		$('#pricingServiceTokenClearBtn').click(function(event) {
			$('#pricingServiceTokenResponse').hide();   
       });	
		
		$('#pricingSheetClearBtn').click(function(event) {
			$('#pricingsheetResponse').hide();   
       });	
		
		$('#hierarchyClearBtn').click(function(event) {
			$('#hierarchyResponse').hide();   
       });	
		$('#hierarchyDesciptionClearBtn').click(function(event) {
			$('#hierarchyDescriptionResponse').hide();   
       });
		
		$('#localizationCopyBtn').click(function(event) {
			copyToClipboard($('#localizationResponseBody').text())  
       });	
		
		$('#pricingServiceTokenCopyBtn').click(function(event) {
			copyToClipboard($('#pricingServiceTokenResponseBody').text())  
       });	
		
		$('#storeCopyBtn').click(function(event) {
			copyToClipboard($('#storeResponseBody').text())  
       });	
		
		$('#profileCopyBtn').click(function(event) {
			copyToClipboard($('#profileResponseBody').text())  
       });	
		
		$('#pricingsheetCopyBtn').click(function(event) {
			copyToClipboard($('#pricingsheetResponseBody').text())  
       });	
		
		$('#hierarchyCopyBtn').click(function(event) {
			copyToClipboard($('#hierarchyResponseBody').text())  
       });	
		
		
		$("#hierarchyLOB a").click(function(e){
		    var selText = $(this).text();
		    $("#lobSelected").text(selText);
		    $("#selectedHLob").text(selText).append('  <span class="caret"></span>');
		});
		
		$('#hierarchyDescriptionCopyBtn').click(function(event) {
			copyToClipboard($('#hierarchyDescriptionResponseBody').text())  
       });	
		
		$("#phHierarchyLOB a").click(function(e){
		    var selText = $(this).text();
		    $("#phLobSelected").text(selText);
		    $("#selectedPhLob").text(selText).append('  <span class="caret"></span>');
		});
		$('#pricingSheetNodeClearBtn').click(function(event) {
			$('#pricingsheetNodeResponse').hide();   
       });
		$('#pricingsheetNodeCopyBtn').click(function(event) {
			copyToClipboard($('#pricingsheetNodeResponseBody').text())  
       });
		
		
});

function copyToClipboard(content) {

	  // Create a "hidden" input
	  var aux = document.createElement("input");

	  // Assign it the value of the specified element
	  aux.setAttribute("value", content);

	  // Append it to the body
	  document.body.appendChild(aux);

	  // Highlight its content
	  aux.select();

	  // Copy the highlighted text
	  document.execCommand("copy");

	  // Remove it from the body
	  document.body.removeChild(aux);

	}
	
</script>
</head>
<body class="container">
	<h2>Pricing Portal Support</h2>

	<form>
	
		<ul class="nav nav-tabs">
	      <!-- add data-toggle attribute to the anchors -->
	      <li class="active"><a data-toggle="tab" href="#profile">Profile</a></li>
	      <li><a data-toggle="tab" href="#store">Store</a></li>
	      <li><a data-toggle="tab" href="#pricingsheet">Pricing Sheet</a></li>
	      <li><a data-toggle="tab" href="#hierarchy">Product Hierarchy</a></li>
	      <li><a data-toggle="tab" href="#token">Token</a></li>
	      <li><a data-toggle="tab" href="#localization">Localization</a></li>
	      <li><a data-toggle="tab" href="#hierarchydescription">Product Hierarchy Description</a></li>
	      <li><a data-toggle="tab" href="#pricingsheetnode">Pricing Sheet Nodes</a></li>
	    </ul>
	    
	    <div class="tab-content">
			<div id="profile" class="tab-pane fade in active" style="margin-top: 20px;">
				<div class="form-group">
				    <label for="dsId">Ds Id:</label>
				    <input type="text" class="form-control" id="dsId" required="true">
				</div>
				<div class="btn-group">
				  <button id="profileBtn" type="button" class="btn btn-primary">Profile</button>
				  <button id="platformBtn" type="button" class="btn btn-primary">Platform</button>
				</div>
				<button id="profileClearBtn" type="button" class="btn btn-link">Clear</button>
				<br>
				<br>
				<div class="form-group" style="margin-top: 15px;">
					<div id="response" class="panel panel-default">
					  <div id="profileHeader" class="panel-heading">Response</div>
					  <div class="alert alert-info form-inline" style="margin-bottom: unset">
					  	<strong>URL: </strong><a id="panel-url" href="" target="_blank"></a>
					  	<button id="profileCopyBtn" type="button" class="btn btn-success" style="float: right">Copy JSON</button>
					  </div>	
					  <pre id="profileResponseBody" class="panel-body" style="margin-bottom: unset"></pre>
					</div>
				</div>	
			</div>	
			<div id="store" class="tab-pane fade" style="margin-top: 20px;">
				<div class="form-group">
				    <label for="storeId">Store Id:</label>
				    <input type="text" class="form-control" id="storeId" required="true">
				</div>
				<div class="btn-group">
				  <button id="storeBtn" type="button" class="btn btn-primary">Platform Store</button>
				  <button id="isHqBtn" type="button" class="btn btn-primary">Is HQ?</button>
				</div>
				<button id="storeClearBtn" type="button" class="btn btn-link">Clear</button>
				<div class="form-group" style="margin-top: 15px;">
					<div id="storeResponse" class="panel panel-default">
					  <div id="storeResponseHeader" class="panel-heading">Platform Response</div>
					  <div class="alert alert-info form-inline" style="margin-bottom: unset">
					  	<strong>URL: </strong><a id="storeResponseUrl" href="" target="_blank"></a>	
					  	<button id="storeCopyBtn" type="button" class="btn btn-success" style="float: right">Copy JSON</button>
					  </div>	
					  <pre id="storeResponseBody" class="panel-body" style="margin-bottom: unset"></pre>
					</div>
				</div>	
			</div>	
			
			<div id="pricingsheet" class="tab-pane fade" style="margin-top: 20px;">
				<div class="form-inline">
					<div class="form-group">
					    <label for="publishId">Publish Id:</label>
					    <input type="text" class="form-control" id="publishId" required="true">
					</div>
					<div class="btn-group">
					  <button id="pricingsheetPublishBtn" type="button" class="btn btn-primary">Get Published Payload</button>
					</div>
					<div class="form-group" style="margin-left: 50px;">
					    <label for="pricingSheetId">PricingSheet Id:</label>
					    <input type="text" class="form-control" id="pricingSheetId" required="true">
					</div>
					<div class="btn-group">
					  <button id="pricingsheetBtn" type="button" class="btn btn-primary">Get PricingSheet Payload</button>
					</div>
					<button id="pricingsheetClearBtn" type="button" class="btn btn-link">Clear</button>
				</div>	
				<div class="form-group" style="margin-top: 15px;">
					<div id="pricingsheetResponse" class="panel panel-default">
					  <div id="pricingsheetResponseHeader" class="panel-heading">PricingSheet Response</div>
					  <div class="alert alert-info form-inline" style="margin-bottom: unset">
					  	<strong>URL: </strong><a id="pricingsheetResponseUrl" href="" target="_blank"></a>	
					  	<button id="pricingsheetCopyBtn" type="button" class="btn btn-success" style="float: right">Copy JSON</button>
					  </div>	
					  <pre id="pricingsheetResponseBody" class="panel-body" style="margin-bottom: unset"></pre>
					</div>
				</div>	
			</div>	
			
			<div id="hierarchy" class="tab-pane fade" style="margin-top: 20px;">
				<div class="alert alert-warning form-inline" style="margin-bottom: unset">
				  	Leave the POS Ids empty if you want to get the product hierarcy for the stores loaded in profile/session
				</div>	
				<div class="form-inline" style="margin-top: 10">
					<div class="form-group">
					    <label for="posIds">Pos Ids</label>
					    <textarea class="form-control" rows="2" id="posIds" placeholder="Comma seperated list"></textarea>
					</div>
					<div class="form-group" style="margin-left: 50px;">
						<input type="hidden" class="form-control" id="lobSelected">
						<div class="dropdown">
						  <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown" id="selectedHLob">LOB
						  <span class="caret"></span></button>
						  <ul id="hierarchyLOB" class="dropdown-menu">
						    <li><a href="#">iPhone</a></li>
						    <li><a href="#">iPad</a></li>
						    <li><a href="#">iWatch</a></li>
						  </ul>
						</div>
					</div>	
					<div class="btn-group">
					  <button id="hierarchyBtn" type="button" class="btn btn-primary">Product Hierarchy</button>
					</div>
					<button id="hierarchyClearBtn" type="button" class="btn btn-link">Clear</button>
				</div>	
				<div class="form-group" style="margin-top: 15px;">
					<div id="hierarchyResponse" class="panel panel-default">
					  <div id="hierarchyResponseHeader" class="panel-heading">Product Hierarchy Response</div>
					  <div class="alert alert-info form-inline" style="margin-bottom: unset">
					  	<strong>URL: </strong><a id="hierarchyResponseUrl" href="" target="_blank"></a>	
					  	<button id="hierarchyCopyBtn" type="button" class="btn btn-success" style="float: right">Copy JSON</button>
					  </div>	
					  <pre id="hierarchyResponseBody" class="panel-body" style="margin-bottom: unset"></pre>
					</div>
				</div>	
			</div>	
			
			<div id="token" class="tab-pane fade" style="margin-top: 20px;">
			    <button id="pricingServiceTokenBtn" type="button" class="btn btn-primary">Generate  Pricing Service Token</button>
				<button id="pricingServiceTokenClearBtn" type="button" class="btn btn-link">Clear</button>
				<div class="form-group" style="margin-top: 15px;">
					<div id="pricingServiceTokenResponse" class="panel panel-default">
					  <div id="pricingServiceTokenResponseHeader" class="panel-heading">Pricing Service Token</div>
					  <div class="alert alert-info form-inline" style="margin-bottom: unset">
					  	<strong>URL: </strong><a id="pricingServiceTokenResponseUrl" href="" target="_blank"></a>	
					  	<button id="pricingServiceTokenCopyBtn" type="button" class="btn btn-success" style="float: right">Copy Token</button>
					  </div>	
					  <pre id="pricingServiceTokenResponseBody" class="panel-body" style="margin-bottom: unset"></pre>
					</div>
				</div>	
			</div>	
			
			<div id="localization" class="tab-pane fade" style="margin-top: 20px;">
				<div class="form-inline">
					<div class="btn-group">
						<button id="localizationCookieBtn" type="button" class="btn btn-primary">Get Locale by DSLANG cookie</button>
					</div>
					<div class="form-group" style="margin-left: 100px;">	
					    <label for="localeCode">Locale Code</label>
					    <input type="text" class="form-control" id="localeCode" required="true">
					</div>
					
					<div class="btn-group">
						<button id="localizationCodeBtn" type="button" class="btn btn-primary">No Fallback Locale</button>
						<button id="localizationCodeWithFallBackBtn" type="button" class="btn btn-primary">With Fallback Locale</button>
					</div>
				</div>
					
				<div class="form-group" style="margin-top: 15px;">
					<div id="localizationResponse" class="panel panel-default">
					  <div id="localizationResponseHeader" class="panel-heading">Localization response</div>
					  <div class="alert alert-info form-inline" style="margin-bottom: unset">
					  	<strong>URL: </strong><a id="localizationResponseUrl" href="" target="_blank"></a>	
					  	<button id="localizationCopyBtn" type="button" class="btn btn-success" style="float: right">Copy JSON</button>
					  </div>	
					  <pre id="localizationResponseBody" class="panel-body" style="margin-bottom: unset"></pre>
					</div>
				</div>	
			</div>	
			<div id="hierarchydescription" class="tab-pane fade" style="margin-top: 20px;">
				<div class="form-inline" style="margin-top: 10">
					<div class="form-group">
					    <label for="phPosIds">Pos Ids</label>
					    <textarea class="form-control" rows="2" id="phPosIds" placeholder="Comma seperated list"></textarea>
					</div>
					<div class="form-group" style="margin-left: 50px;">
						<input type="hidden" class="form-control" id="phLobSelected">
						<div class="dropdown">
						  <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown" id="selectedPhLob">LOB
						  <span class="caret"></span></button>
						  <ul id="phHierarchyLOB" class="dropdown-menu">
						    <li><a href="#">iPhone</a></li>
						    <li><a href="#">iPad</a></li>
						    <li><a href="#">iWatch</a></li>
						  </ul>
						</div>
					</div>	
					<div class="btn-group">
					  <button id="hierarchyDescriptionBtn" type="button" class="btn btn-primary">Get Product Hierarchy Description</button>
					</div>
					<button id="hierarchyDescriptionClearBtn" type="button" class="btn btn-link">Clear</button>
				</div>	
				<div class="form-group" style="margin-top: 15px;">
					<div id="hierarchyDescriptionResponse" class="panel panel-default">
					  <div id="hierarchyDescriptionResponseHeader" class="panel-heading">Product Hierarchy Description Response</div>
					  <div class="alert alert-info form-inline" style="margin-bottom: unset">
					  	<strong>URL: </strong><a id="hierarchyDescriptionResponseUrl" href="" target="_blank"></a>	
					  	<button id="hierarchyDescriptionCopyBtn" type="button" class="btn btn-success" style="float: right">Copy JSON</button>
					  </div>	
					  <pre id="hierarchyDescriptionResponseBody" class="panel-body" style="margin-bottom: unset"></pre>
					</div>
				</div>	
			</div>	
			<div id="pricingsheetnode" class="tab-pane fade" style="margin-top: 20px;">
				<div class="form-inline">
					<div class="form-group" style="margin-left: 50px;">
					    <label for="pricingSheetNodeId">PricingSheet Id:</label>
					    <input type="text" class="form-control" id="pricingSheetNodeId" required="true">
					</div>
					<div class="btn-group">
					  <button id="pricingsheetNodeBtn" type="button" class="btn btn-primary">Get PricingSheet Nodes</button>
					</div>
					<button id="pricingSheetNodeClearBtn" type="button" class="btn btn-link">Clear</button>
				</div>	
				<div class="form-group" style="margin-top: 15px;">
					<div id="pricingsheetNodeResponse" class="panel panel-default">
					  <div id="pricingsheetNodeResponseHeader" class="panel-heading">PricingSheet Nodes Response</div>
					  <div class="alert alert-info form-inline" style="margin-bottom: unset">
					  	<strong>URL: </strong><a id="pricingsheetNodeResponseUrl" href="" target="_blank"></a>	
					  	<button id="pricingsheetNodeCopyBtn" type="button" class="btn btn-success" style="float: right">Copy JSON</button>
					  </div>	
					  <pre id="pricingsheetNodeResponseBody" class="panel-body" style="margin-bottom: unset"></pre>
					</div>
				</div>	
			</div>	
			
			
			
		</div>		
	</form>
</body>
</html>
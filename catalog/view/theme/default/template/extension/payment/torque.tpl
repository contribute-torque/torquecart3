<div id="textbox">
  <h2 class="alignleft"> <?php echo $message; ?>  </h2>
  <input type="button" value="Verify Payment" onClick="window.location.reload()">
</div>

<div class="buttons">
		<link href="http://cdn.torqueintegrations.com/style.css" rel="stylesheet">
	
	<link href='https://fonts.googleapis.com/icon?family=Material+Icons' rel='stylesheet'>
	<link href='https://fonts.googleapis.com/css?family=Montserrat:400,800' rel='stylesheet'>
        <link href='http://cdn.torqueintegrations.com/style.css' rel='stylesheet'>
        
            
            <!-- Torque container payment box -->
            <div class='container-xtc-payment'>
            <!-- header -->
            <div class='header-xtc-payment'>
            <span class='logo-xtc'><img src='http://cdn.torqueintegrations.com/logotorque.png' /></span>
            <span class='xtc-payment-text-header'><h2>TORQUE PAYMENT</h2></span>
            </div>
            <!-- end header -->
            <!-- xtc content box -->
            <div class='content-xtc-payment'>
            <div class='xtc-amount-send'>
            <span class='xtc-label'>Send:</span>
            <div class='xtc-amount-box'><?php echo $amount_xtc; ?></div><div class='xtc-box'>XTC</div>
            </div>
            <div class='xtc-address'>
            <span class='xtc-label'>To this address:</span>
            <div class='xtc-address-box'><?php echo $integrated_address; ?></div>
            </div>
            <div class='xtc-qr-code'>
            <span class='xtc-label'>Or scan QR:</span>
            <div class='xtc-qr-code-box'><img src='https://api.qrserver.com/v1/create-qr-code/? size=200x200&data=<?=$uri?>' /></div>
            </div>
            <div class='clear'></div>
            </div>
            <!-- end content box -->
            <!-- footer xtc payment -->
            <div class='footer-xtc-payment'>
            <a href='https://gettorque.org' target='_blank'>Help</a> | <a href='https://gettorque.org' target='_blank'>About Torque</a>
            </div>
            <!-- end footer xtc payment -->
            </div>
            <!-- end Torque container payment box -->
      
	</div>

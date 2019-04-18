<?php
class ModelExtensionPaymentTorque extends Model {
  	public function getMethod($address) {
	
		
      		$method_data = array( 
        		'code'         	=> 'torque',
        		'title'      	=> 'Torque Payment Gateway',
      		'sort_order' => '',
      		'terms' => 'by Monero Integrations Team'
      		);
    	
   
    	return $method_data;
  	}
}
?>

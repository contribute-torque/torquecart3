<?php
    
    class ControllerExtensionPaymentTorque extends Controller {
        private $payment_module_name  = 'torque';
        public function index() {
            
            //$this->load->model('payment/torque');
            $this->load->model('checkout/order');
            $order_id = $this->session->data['order_id'];
            $order = $this->model_checkout_order->getOrder($order_id);
            $current_default_currency = $this->config->get('config_currency');
            $order_total = $order['total'];
            $order_currency = $this->session->data['currency'];
            $amount_xtc = $this->changeto($order_total, $order_currency);
            $payment_id = $this->set_paymentid_cookie();
            
            $data['amount_xtc'] = $amount_xtc;
            
            $data['integrated_address'] = $this->make_integrated_address($payment_id);
            $address = $this->config->get("payment_torque_address");
            $data['url'] = "torque:" . $data['integrated_address'] . "?tx_amount=" . $amount_xtc;
            if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/extension/payment/torque.twig')) {
                $this->template = $this->config->get('config_template') . '/template/extension/payment/torque.twig';
            } else {
                $this->template = 'default/template/extension/payment/torque.twig';
            }
            
            if($this->verify_payment($payment_id, $data['amount_xtc']))
            {
                $this->model_checkout_order->addOrderHistory($order_id, 2, 'Torque payment received');
            }
            
            return $this->load->view('extension/payment/torque', $data);
            
        }
        
        public function changeto($order_total, $currency){
            $xtc_live_price = $this->xtcliveprice($currency);
            $amount_in_xtc = $order_total / $xtc_live_price ;
            return $amount_in_xtc;
        }
        
        public function xtcliveprice($currency){
            $url = "https://api.coinmarketcap.com/v1/ticker/torque/";
            $curl = curl_init();
            curl_setopt($curl, CURLOPT_URL, $url);
            curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($curl, CURLOPT_HEADER, false);
            $data = curl_exec($curl);
            curl_close($curl);
            $price = json_decode($data, TRUE);
            
            switch ($currency) {
                case 'USD':
                    return $price['price_usd'];
                case 'BTC':
                    return $price['price_btc'];
                case 'XTC':
                    $price = '1';
                    return $price;
            }
        }
        
        private function set_paymentid_cookie()
        {
            if (!isset($_COOKIE['payment_id'])) {
                $payment_id = bin2hex(openssl_random_pseudo_bytes(8));
                setcookie('payment_id', $payment_id, time() + 2700);
            }
            else{
                $payment_id = $_COOKIE['payment_id'];
            }
            return $payment_id;
        }
        
        private function make_integrated_address($payment_id){
          
            $host = $this->config->get("payment_torque_wallet_rpc_host");
            $port = $this->config->get("payment_torque_wallet_rpc_port");
            $torque = new torque($host, $port);
            $integrated_address = $torque->make_integrated_address($payment_id);
            return $integrated_address["integrated_address"];
        }
        
        private function verify_payment($payment_id, $amount)
        {
            /*
             * function for verifying payments
             * Check if a payment has been made with this payment id then notify the merchant
             */
            
            $host = $this->config->get("payment_torque_wallet_rpc_host");
            $port = $this->config->get("payment_torque_wallet_rpc_port");
            
            $torque_daemon = new torque($host, $port);
            
            $amount_atomic_units = $amount * 100;
            $get_payments_method = $torque_daemon->get_payments($payment_id);
            if(isset($get_payments_method["payments"][0]["amount"]))
            {
                if($get_payments_method["payments"][0]["amount"] >= $amount_atomic_units)
                {
                    $confirmed = true;
                }
            }
            else
            {
                $confirmed = false;
            }
            return $confirmed;
        }
        
    }

<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-torque" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
            <h1>Torque Payment Gateway</h1>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
        <?php if ($error_warning) { ?>
        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php } ?>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
            </div>
            <div class="panel-body">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-torque" class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-status">Status</label>
                        <div class="col-sm-10">
                            <select name="torque_status" id="input-status" class="form-control">
                                <?php if ($torque_status) { ?>
                                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                <option value="0"><?php echo $text_disabled; ?></option>
                                <?php } else { ?>
                                <option value="1"><?php echo $text_enabled; ?></option>
                                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>

                    

                                        
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-torque-address"><span data-toggle="tooltip" title="Torque Address"><?php echo $torque_address_text; ?></span></label>
                        <div class="col-sm-10">
                            <input type="text" name="torque_address" value="<?php echo $torque_address; ?>" placeholder="<?php echo $torque_address; ?>" id="input-total" class="form-control" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-torque-wallet-rpc-host"><span data-toggle="tooltip" title="Torque Wallet RPC">Torque Wallet RPC Host</span></label>
                        <div class="col-sm-10">
                            <input type="text" name="torque_wallet_rpc_host" value="<?php echo $torque_wallet_rpc_host ?>" placeholder="<?php echo $torque_wallet_rpc_host ?>" id="input-total" class="form-control" />
                        </div>
                    </div>

<div class="form-group">
                        <label class="col-sm-2 control-label" for="input-torque-wallet-port"><span data-toggle="tooltip" title="Torque Wallet RPC port">Torque Wallet RPC Port</span></label>
                        <div class="col-sm-10">
                            <input type="text" name="torque_wallet_rpc_port" value="<?php echo $torque_wallet_rpc_port ?>" placeholder="20189" id="input-total" class="form-control" />
                        </div>
                    </div>
                    

                    
                    

                    


             
                </form>
            </div>
        </div>
    </div>
</div>
<?php echo $footer; ?>

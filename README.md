Torque Opencart 3.x (forked from Monero Integration)
==================
Torque Payment processor for Opencart 3.x

This branch of the torque-opencart plugin for Opencart 3.x is in beta. It is not reccomended to use this on a live production server until a stable release is published. 

Feedback is encouraged to work out the kinks and get a stable release published as soon as possible. 

Please also let me know if you would like to see any added functionality.

Prerequisites
-------------------
* Torque Node
* Torque Wallet RPC

The idea for Torque Opencart is that it is a standalone payment processor. This means there is no middleman for collecting payments. Payments made using the torque-opencart plugin go directly to the merchants XTC wallet.

Because of this, it is required to run your own Torque Node and Wallet RPC. 

Installation
------------------------
To install the torque-opencart plugin, upload all files to their corresponding locations. 

To-Do List
-----------------------------
* Add ability to verify payments made at checkout. Customers would not be able to complete an order until a payment has been verified.
* Add ability to add the generated payment id to order history.Will allow merchants to lookup transactions if needed.
* Create ocmod for easier install. (May not need this but adding it to the To-Do list just incase)
* Cleanup code.



Developer Donations
===================
If you'd like to support the development of this branch and make a one time donation to Monero Integration team, the addresses are as follows:
* XMR - 4Ay3vprEZXAPMUdSkehXqD4Tj7xiMG9Ds8UzgkPutB427SRHDs1JpFxNjWcyk1NXgtVRukL9hA5x7ipTxMCYT3zEHEPvs9Z



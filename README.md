# Example Hub and Spoke archetype on Google Cloud

## Networks

|Environment|Name|Primary CIDR|Secondary CIDR(s)|Description|
|-|-|-|-|-|
|DNS|_name_-dns-hub|172.16.0.0/24||DNS Hub|
|Shared|_name_-base-hub|10.0.0.0/13|||
|Shared|_name_-restricted-hub|10.8.0.0/13|||
|Development|_name_-base-dev|10.16.0.0/13|100.64.0.0/16 *pods*</br>100.65.0.0/21 *services*||
|Development|_name_-restricted-dev|10.24.0.0/13|100.72.0.0/16</br>100.73.0.0/21||
|Non-Production|_name_-base-non|10.32.0.0/13|100.80.0.0/16</br>100.81.0.0/21||
|Non-Production|_name_-restricted-non|10.40.0.0/13|100.88.0.0/16</br>100.89.0.0/21||
|Production|_name_-base-prd|10.48.0.0/13|100.96.0.0/16</br>100.97.0.0/21||
|Production|_name_-restricted-prd|10.64.0.0/13|100.104.0.0/16</br>100.105.0.0/21||

## TODO

* PSC for shared hubs
* DNS resolver for domain
* Transivity
* Firewall Rules
*

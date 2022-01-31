# !/bin/bash

#Variables comercio
merchant_id='750f1fae-5fe7-4e52-b451-79104b0eee9c'
private_api_key="8f38258b7e3903887b93779e0f02e7f7d192c1cfc83eeddf85898fa4ea55efe26ff92d10591cde709006d8ca0e1e21455e4e7877bdd59dc806b82537e1cd"
application_id='bc108b75-de6f-4103-993f-aaf9b3fb0985'

#Variables super usuario
token='eyJhbGciOiJSUzI1NiIsImtpZCI6Il8tMWptV01RNmoxVXp5Mk9objRTWnNZTVBPZ3gtWXNSb2hrcEl2Rmkyd0EiLCJ0eXAiOiJKV1QifQ.eyJlbWFpbCI6ImpjYWxsYXRheGlAZ2V0ZHVuYS5jb20iLCJleHAiOjE2NDM2NDE3NjIsImlhdCI6MTY0MzM4MjU2MiwibWVyY2hhbnRfaWQiOm51bGwsInJvbGUiOiJzdXBlcmFkbWluIiwic3RvcmVfY29kZSI6IiIsInN1YiI6IjI2MSJ9.G8IRhIRkpYTgoez_wTh6QspeUwD7o6VfvcNVMabI_KGDc921MPGwcxZGJlYHJ5YghnKM54F_QldHncWGnub-W74euGyTBuEnNip_BSMWHoONLBCAmkGZPZpP7H-st3D12d20G62dOWvs3IPehU406IJzuesfImIShenoqoO8LLeH7hWska5c5TpApj5Ol4tR5Ij4Dr81COT2HAlhsNmQojh4LHDIPTk73egvdsW6X3qmW-BS2fjJ8qFRAIdwCTxc8-w9AvpH2AcK7awr9Tz351lRcdcg6z0x7S-HBwBXjfBq7h37oKKF2ccT6pL2uSWfePPMVWp6khNQ2mlA2nDpt5FUkMrr6OWsa5AK5yLr5gLc_OLIqNkWg5eWVYrEomMjHDQUrJ4py_PC3vjJRY1Avlepe_3_we0lrEDhl2hnPoI7A7Yjpb2ZrjtM-OoCStdJ6X9SDCzzadgMHz58mYdMPZV2KcFaVfHTmUUBIkQNfd7afkjfwcI-fD_zCIq_19GVM3BtWkAU41C-5C6sJ9xcbkPQs3T_Jcb5tHGzU9lmmZo03RGZgKf06Y3C9HC8sS6WPjV4VGW5819XxkHLx_nciYgjkYdd17JgpLXdEOC37UI4namLlnlMZ2GHobzRAlxHwPUJPi5E5Cu-eA5jNRPQ15i4pYBZ-okeideU7sQu8oc'

#Variables por tienda
id_tienda_1='d5505419-3dbe-4d11-954f-995ffa6f1c32'
cod_tienda_1='Local4'

#Otras variables
payment_method='credit_card'

# # Obtener configuraciones del comercio

# curl --location --request GET "https://ema.getduna.com/api/v1/merchants/${merchant_id}/configurations" \
# --header "Authorization: Bearer ${token}" | json_pp -json_opt pretty,canonical


# echo "\n \n Imprimir locales" 
# # Obtener locales 

# curl --location --request GET "https://apigw.getduna.com/merchants" \
# --header "X-Api-Key: ${private_api_key}" \
# --header "Authorization: Bearer ${token}" | json_pp -json_opt pretty,canonical


# echo "\n \n Asociando Api Keys a locales" 
# # Asociar Api Keys a locales  ---- REVISAR

# curl --location --request POST "https://auth.getduna.com:443/grpc/api/v1/merchants/${merchant_id}/applications/${application_id}/stores" \
# --header "Authorization: Bearer ${token}" \
# --header "Content-Type: application/json" \
# --data-raw "{
#     \"stores\": [${id_tienda_1}]
# }"


#echo "\n \n Crear Cash por tienda"  
# Crear cash por tienda

# curl --location --request POST "https://payment.getduna.com:443/api/v1/merchants/${merchant_id}/stores/${cod_tienda_1}/processors" \
# --header "Authorization: Bearer ${token}" \
# --header "Content-Type: application/json" \
# --data-raw "{\"name\":\"cash\",\"payment_processor_id\":7,\"enabled\": true,\"currency_iso3\": \"USD\"
# }"



# echo "\n \n Crear Credit Card por tienda" 
# Crear Credit Card por tienda

# curl --location --request POST "https://payment.getduna.com:443/api/v1/merchants/${merchant_id}/stores/${cod_tienda_4}/processors" \
# --header "Authorization: Bearer ${token}" \
# --header "Content-Type: application/json" \
# --data-raw "{
#     \"name\":\"kushki-credit\",
#     \"payment_processor_id\":2,
#     \"enabled\": true,
#     \"currency_iso3\": \"USD\",
#     \"kushki\": {
#         \"public_merchant_id\": \"\",
#         \"private_merchant_id\": \"\"
#     }
# }"


# echo "\n Seteando tienda \n"
# Seteando metodo de pago tienda a tienda

# echo "\n Seteando tienda  \n"
# curl --location --request POST "https://payment.getduna.com:443/api/v1/merchants/${merchant_id}/stores/${cod_tienda_2}/processors/assign-available-for?method_type=${payment_method}" \
# --header "Authorization: Bearer ${token}" \
# --header "Content-Type: application/json" \
# --data-raw "{
#     \"shipping_options\": [\"dine_in\",\"delivery\", \"pickup\"]
# }"

echo "\n Obteniendo tiendas \n"
curl --location --request GET "https://apigw.getduna.com/merchants/${merchant_id}/stores" \
--header "Authorization: Bearer ${token}" \ | json_pp -json_opt pretty,canonical
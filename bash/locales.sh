# !/bin/bash
merchant_id='4b7d38ba-f349-480d-955a-6fe3fcfb063d'
token='eyJhbGciOiJSUzI1NiIsImtpZCI6Il8tMWptV01RNmoxVXp5Mk9objRTWnNZTVBPZ3gtWXNSb2hrcEl2Rmkyd0EiLCJ0eXAiOiJKV1QifQ.eyJlbWFpbCI6ImpjYWxsYXRheGlAZ2V0ZHVuYS5jb20iLCJleHAiOjE2NDM2NDE3NjIsImlhdCI6MTY0MzM4MjU2MiwibWVyY2hhbnRfaWQiOm51bGwsInJvbGUiOiJzdXBlcmFkbWluIiwic3RvcmVfY29kZSI6IiIsInN1YiI6IjI2MSJ9.G8IRhIRkpYTgoez_wTh6QspeUwD7o6VfvcNVMabI_KGDc921MPGwcxZGJlYHJ5YghnKM54F_QldHncWGnub-W74euGyTBuEnNip_BSMWHoONLBCAmkGZPZpP7H-st3D12d20G62dOWvs3IPehU406IJzuesfImIShenoqoO8LLeH7hWska5c5TpApj5Ol4tR5Ij4Dr81COT2HAlhsNmQojh4LHDIPTk73egvdsW6X3qmW-BS2fjJ8qFRAIdwCTxc8-w9AvpH2AcK7awr9Tz351lRcdcg6z0x7S-HBwBXjfBq7h37oKKF2ccT6pL2uSWfePPMVWp6khNQ2mlA2nDpt5FUkMrr6OWsa5AK5yLr5gLc_OLIqNkWg5eWVYrEomMjHDQUrJ4py_PC3vjJRY1Avlepe_3_we0lrEDhl2hnPoI7A7Yjpb2ZrjtM-OoCStdJ6X9SDCzzadgMHz58mYdMPZV2KcFaVfHTmUUBIkQNfd7afkjfwcI-fD_zCIq_19GVM3BtWkAU41C-5C6sJ9xcbkPQs3T_Jcb5tHGzU9lmmZo03RGZgKf06Y3C9HC8sS6WPjV4VGW5819XxkHLx_nciYgjkYdd17JgpLXdEOC37UI4namLlnlMZ2GHobzRAlxHwPUJPi5E5Cu-eA5jNRPQ15i4pYBZ-okeideU7sQu8oc'

echo "\n Obteniendo tiendas \n"
curl --location --request GET "https://apigw.getduna.com/merchants/${merchant_id}/stores" \
--header "Authorization: Bearer ${token}" \ | json_pp -json_opt pretty,canonical | jq > locales.json

store_code=""
id=""
for ((numero=0; numero<=52; numero++))
do
    #store_code=$(jq .stores[${numero}].name locales.json)
    jq .stores[${numero}].name locales.json >> name.txt
    #echo $numero
    #echo $store_code
    #id=$(jq .stores[${numero}].id locales.json)
    jq .stores[${numero}].id locales.json >> id.txt 
    #echo $id
done
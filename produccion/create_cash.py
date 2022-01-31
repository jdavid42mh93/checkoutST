from marshal import load
import requests
import json
from requests.structures import CaseInsensitiveDict

headers = CaseInsensitiveDict()
token = 'eyJhbGciOiJSUzI1NiIsImtpZCI6Il8tMWptV01RNmoxVXp5Mk9objRTWnNZTVBPZ3gtWXNSb2hrcEl2Rmkyd0EiLCJ0eXAiOiJKV1QifQ.eyJlbWFpbCI6ImpjYWxsYXRheGlAZ2V0ZHVuYS5jb20iLCJleHAiOjE2NDM4MjQ3OTYsImlhdCI6MTY0MzU2NTU5NiwibWVyY2hhbnRfaWQiOm51bGwsInJvbGUiOiJzdXBlcmFkbWluIiwic3RvcmVfY29kZSI6IiIsInN1YiI6IjI2MSJ9.3VObjtaMpTPhVD5BXDqHHfAatd6etYMWVCyiR3Mx-MNFPGbmYW6ll4ZGX9dheGUWm-GCCr2A1kCWkixNOR4RXC6-YTmfcpsFjeleW1e6KjrYKCqWeeNmTyXcD8k9uyN_uOZpxoOlZHQBkHbOnulOKKXq-yW82Khn2qXwzuTmUSznyGIgC3iUm8xoqZzTcpZrNuqU9Ae4YWgaWK1BK7M522xDgjK8ksJrDbnP7XnHez6vCG6J2M7kDjZjH1Pa9lBHUTcWvz3NMIjlwunB8WQbP8Sr7iu6R2Zu1gJ1--35vOvhACvZLfsKLgKWXJ7jf4xgeNCIKq5MBZUz2E3rvDguuryUeculh15DzKSx8PYZqA1z3xm-IKPc_PwlJLNPiEBeu1ygrdeLvtzPtbg3tGVWO3DxbrV_6ejCOZp0Jnr7YT3r1Lois5PcuoR-RHl9d4SbAkx_CWj38vlx3BbZJxSV7CBdWByUfKfId6LHyIfC54C03XWdw2xJNm64kpwK7q_QiQszJ6nVBh97KVfUchA_pjEzXzOq_YWlW-0hjudwdDfyyWyihEm1z--vRAe7BzCuycYq5peHM-k9VPgF12bMwrIGOTsG0bm2eU_AJQq2PBZLaz0E2MQLobponHjP30K98xzJxrqpKSwg8gZE-zWDFcyQz3OjWLWp7dM537sKTKs'
merchant_id = input('Ingresa el merchant_id: ')

payload = {'name': 'cash','payment_processor_id':7,'enabled': True,'currency_iso3': 'USD'}

with open('locales.json') as file:
    stores = json.load(file)

    for local in stores['stores']:
        url = 'https://payment.getduna.com/api/v1/merchants/'+merchant_id+'/stores/'+local["name"]+'/processors'
        headers = {'Authorization': 'Bearer ' + token,'Content-Type': 'application/json'}
        r = requests.post(url, headers=headers, json=payload)
        print(url)
        print(r.status_code)
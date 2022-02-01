from marshal import load
import requests
import json
from requests.structures import CaseInsensitiveDict

headers = CaseInsensitiveDict()
token = 'eyJhbGciOiJSUzI1NiIsImtpZCI6IlZOUDlOVGM2SWdxVDhhYVRqYlFnOTRPa2wzZHgtLWZfQjdNdXdTNmYzdmMiLCJ0eXAiOiJKV1QifQ.eyJlbWFpbCI6ImpjYWxsYXRheGlAZ2V0ZHVuYS5jb20iLCJleHAiOjE2NDM4OTQyNjAsImlhdCI6MTY0MzYzNTA2MCwibWVyY2hhbnRfaWQiOm51bGwsInJvbGUiOiJzdXBlcmFkbWluIiwic3RvcmVfY29kZSI6IiIsInN1YiI6IjE5MCJ9.FZlAuF3KTRZB-DQIj43LMMZPcLyAm9FpoFohXdiDY9esKoRx4EKJAiWeLeTl5450n8kwugOXjWZFiMCS2mDJsdwlqlOuZuk0-zGZkvpwwVOfZJgLG2pPgY-79l6XUgi21aZ51f5cGjz0iv2DpBXVEhaBuqAug8nkgKnWVefVuXZszOLkTWJPIxCCfFZOn5N1-4DxxXS7fyDxlnwCsm3FhMaROBqk_aNjKsb0BV0ga9_SXVfCe43GqNzgPisamQ3j6Z7yWdGF3jSGGBSaQBtoBnvKlOTvGSCsoqu1VlnsNP2LU-rrcH9B24kLqxGA2hqD8U3lapJrs_YHiCkv7loy_wghrg-Eqw6FZsEPtgxD1kv_NtP2X-5PVFt3B_uy4bLAh_gp1d0zF4nZ0bJ120p070PAScDUnNeoQl3PiSf0YOhjEBamv9eZyIyAU5NQ_hnOnd_Prj2bHn3oIQmxs99tEscVrTYabYJP8kjqGfUf_A7McBtq-NOxMAyBSGta6Hmma_2dNXO7PRDZ2in-LyKgF13lmj9eCKcAiRkuJyC1JdUC5vnkMUNI_dUdhDfhSMQUt1onlc5RuAifSsEy556T-Dg6Ur-U6pdHpN20tEfxhjoPbmih1NuRhPgr-vhOMA2gxfgdXgozFEm7Nd09hsIByZsFT-ZN3LkWCdj5zsGq5Ug'
merchant_id = input('Ingresa el merchant_id: ')

payload = {
    "name": "",
    "is_sandbox": False
}

url = 'https://auth.getduna.com/grpc/api/v1/merchants/'+merchant_id+'/applications'
headers = {'Authorization': 'Bearer ' + token,'Content-Type': 'application/json'}
r = requests.post(url, headers=headers, json=payload)
data = r.json()

with open('merchant_application.json', 'w') as json_file:
    json.dump(data, json_file, indent=4, sort_keys=True)
print(url)
print(r.status_code)
# checkoutST
Pasos:
Archivo get_configuraciones.py
1. Configurar script get_configuraciones.py
    - cambiar el token
2. Ejecutar script get_configuraciones.py
    - python get_configuraciones.py
    - pasar el merchant_id como parametro
    - retornara un archivo configuraciones.json --> contiene las configuraciones del merchant

Archivo get_stores.py
1. Configurar script get_stores.py
    - cambiar el token
2. Ejecutar script get_stores.py
    - python get_stores.py
    - pasar el merchant_id como parametro
    - retornara un archivo locales.json --> contiene las tiendas de ese merchant

Archivo create_cash.py
1. Configurar script create_cash.py
    - cambiar el token
    - cambiar el currency iso3 dependiendo del pais del merchant
2. Ejecutar script create cash.py
    - python create_cash.py
    - pasar el merchant_id como parametro
    - retornara en consola:
        - url de configuracion: https://payment.getduna.com/api/v1/merchants/1688ac91-068b-443b-b82a-0d67086f5c0b/stores/Chico/processors
        - status_code debe ser 200

Archivo assign_shipping_options.py
1. Configurar script assign_shipping_options.py
    - cambiar el token
    - cambiar el method_type de ser el caso, por lo general debe ser cash
2. Ejecutar script assign_shipping_options.py
    - python assign_shipping_options.py
    - pasar el merchant_id como parametro
    - retornara en consola:
        - url de configuracion: https://payment.getduna.com:443/api/v1/merchants/1688ac91-068b-443b-b82a-0d67086f5c0b/stores/Chico/processors/assign-available-for?method_type=cash
        - status_code debe ser 200

Verificar los metodos de pago asociados a metodos de envio 
1. Copiar url en postman: https://payment.getduna.com:443/api/v1/transactions/payments-methods?available_option=dine_in
2. Pasar el X-Merchant-Id y X-Store_Code en headers https://www.notion.so/getduna/Endpoints-para-Admin-44479a32989d4e6197acb6a378990d21  <-- revisar documentacion "Obtener configuración de métodos de pago"
3. Debe retornar los metodos de pago para esa tienda en el canal de delivery, pickup, dine_in

Archivo create_merchant_application.py
1. Configurar el script create_merchant_application.py
    - cambiar el token
    - cambiar el payload:
        - name debe ser el mismo que en la pagina admin.getduna.com
        - is_sandbox debe ser False para produccion, si es un core en staging debe ser True
    - retornara un archivo json merchant_application.json el cual contiene:
        - application id
        - public y private keys
Nota importante:
Guardar esta informacion ya que una vez creada no se volvera a proporcionar

Asignar locales a Api key
1. Ejecutar el siguiente comando:
    - cat locales.json | grep id | awk '{print $2;}'
    - retornara los ids de las tiendas incluido el merchant_id, este ultimo no tomarlo en cuenta
2. Ir a postman:
    - buscar el endpoint: Assign Stores to Application
    - pasar el merchant id y el application id en la url
    - en el body: pasar los ids que retorno el comando anterior

Configuracion en el core
1. Crear metodos de pago
    - cash en el campo Nombre y Efectivo en la Descripcion
    - credit_card en el campo Nombre y Tarjeta de Credito en la Descripcion
2. Colocar las api keys publica y privada en Preferencias Generales
3. Activar el checkbox checkoutST y desactivar el checkbox checkout d-una
4. Limpiar cache


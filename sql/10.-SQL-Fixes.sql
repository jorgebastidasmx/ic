--212            
ALTER TABLE EPMC_SEGM ADD FOREIGN KEY (COD_CLIE) REFERENCES EPMC_CLIE(COD_CLIE);
ALTER TABLE EPMC_SEGM MODIFY COD_CLIE NOT NULL;
--211 El campo COD_CLIE de la tabla EPTD_CARGA_BIT no tiene relación con la tabla EPMC_CLIE, y este campo no debe permitir valores nulos
ALTER TABLE EPTD_CARGA_BIT ADD FOREIGN KEY (COD_CLIE) REFERENCES EPMC_CLIE(COD_CLIE);
ALTER TABLE EPTD_CARGA_BIT MODIFY COD_CLIE NOT NULL;
--210 El campo identificador de la carga en la tabla EPTD_CARGA_LOG, no debería admitir valores nulos
ALTER TABLE EPTD_CARGA_LOG MODIFY ID_CARGA NOT NULL;
--206 La tabla EPTD_CLIE_SUJE_REPO tiene a los campos COD_CLIE_SUJE y COD_REPO como FK de relación directa, los cuales no deben admitir valores nulos
ALTER TABLE EPTD_CLIE_SUJE_REPO MODIFY COD_CLIE_SUJE NOT NULL;
ALTER TABLE EPTD_CLIE_SUJE_REPO MODIFY COD_REPO NOT NULL;
--204 La tabla EPTD_ALER tiene los campos COD_ALER_PROD y COD_OPCI_CONF los cuales son FK de relación directa, estos no deben tener admitir valores nulos
ALTER TABLE EPTD_ALER MODIFY COD_ALER_PROD NOT NULL;
ALTER TABLE EPTD_ALER MODIFY COD_OPCI_CONF NOT NULL;
--203 La tabla EPMC_RANG_SCOR cuenta con el campo COD_TIPO_SCOR como FK de relación directa, la cual no debe ser nula.
ALTER TABLE EPMC_RANG_SCOR MODIFY COD_TIPO_SCOR NOT NULL;
--202 La tabla EPMC_CLIE cuenta con el campo COD_PAIS como FK de relación directa, la cual no debe ser nula
ALTER TABLE EPMC_CLIE MODIFY COD_PAIS NOT NULL;
--201 La tabla EPTD_USUA_CORR siendo un el campo COD_USUA un FK de relación directa no debe ser nulo
ALTER TABLE EPTD_USUA_CORR MODIFY COD_USUA NOT NULL;
--200 La relación del Codigo de Cliente COD_CLIE no debe ser nulo se debería relacionar con la tabla de clientes para que la consistencia de datos sea máxima.
ALTER TABLE EPMC_USUA MODIFY COD_CLIE NOT NULL;
--208 La tabla EPMC_PERF tiene la descripción del perfil el cual no debe admitir valores nulos
ALTER TABLE EPMC_PERF MODIFY DES_NOMB_PERF NOT NULL;
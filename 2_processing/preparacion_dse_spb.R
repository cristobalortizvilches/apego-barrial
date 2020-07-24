getwd()
load("1_input/data/original/ELSOC_W01_V4.00_R.RData")
load("1_input/data/original/ELSOC_W01_CIT_v3.20_R.RData")

#selección de variables
elsoc_proc <- dplyr::select(elsoc_2016a,SEXO=m0_sexo,EDAD=m0_edad, #características socio-demográficas
                           URBE=estrato,COMUNA=comuna.x,distrito=distrito,ZONA=zona,MANZANA=manzana, #identificadores geo-espaciales
                           PERCEP_SEGURIDAD=t10,FREC_PELEAS=t09_01,FREC_ROBOS=t09_02,FREC_TRAFICO=t09_03, #conflicto meso-social
                           FREC_RUIDOS=t11_01,FREC_MASCOT=t11_02,FREC_AMENAZAS=t11_03,FREC_BASURA=t11_04, #conflicto micro social
                           AMISTAD=t03_01,SOCIABILIDAD=t03_02,CORDIALIDAD=t03_03,COLABORACION=t03_04, #sociabilidad
                           BARRIO_IDEAL=t02_01,INTEGRADO_BARRIO=t02_02,IDENTIFICADO_BARRIO=t02_03,PERTENENCIA_BARRIO=t02_04,CONFIANZA_VECINOS=t01, #sentido de pertenencia
                           AREAS_VERDES=acverzon,COLEGIOS=acedzon,SERVICIOS_PUBLICOS=accszon,CALIDAD_AMBIENTAL=ambzon, #accesibilidad
                           REPUTACION_BARRIAL=t08,DENSIDAD_BARRIAL=denszon,SCORE_VIOLENCIA=dviolzon,SCORE_SUSTRACCION=drobozon, HACINAMIENTO=hacinzon,NVIVIENDAS=nvivzon,DIVERSIDAD_CREENCIAS=mixrezon,NVLSOEC_ESCO=nivedzon,EXPO_HETE=sdedzon) #conflicto

#filtramos sólo para el conglomerado urbano de Santiago
elsoc_proc <- dplyr::filter(elsoc_proc, URBE < 2)

summary(elsoc_proc)


(deftemplate Enfermedad
    (slot id (type INTEGER))
    (slot nombre (type SYMBOL))
    (multislot signos (type SYMBOL))
    (multislot sintomas (type SYMBOL))
)

(deffacts BasedeConocimientos
    (Enfermedad (id 1) (nombre Resfriado) (signos fiebre congestion_nasal) (sintomas tos dolor_garganta))
    (Enfermedad (id 2) (nombre Gripe) (signos fiebre cansancio) (sintomas dolor_cabeza escalofrios))
    (Enfermedad (id 3) (nombre Alergia) (signos estornudos picazon) (sintomas congestion_nasal ojos_llorosos))
    (Enfermedad (id 4) (nombre Hipertension) (signos dolor_cabeza mareos) (sintomas vision_borrosa fatiga))
    (Enfermedad (id 5) (nombre Diabetes) (signos sed aumento_apetito) (sintomas fatiga miccion_frecuente))
    (Enfermedad (id 6) (nombre Asma) (signos dificultad_respirar silbidos) (sintomas tos opresion_pecho))
)

(defrule ConsultarEnfermedad
    =>
    (printout t "Ingresar ID para verificar enfermedad")
    (bind ?id (read))
    (Enfermedad (id ?id) (nombre ?nombre) (signos $?signos) (sintomas $?sintomas))
    =>
    (printout t "------------------------------------" crlf)
    (printout t "Enfermedad: " ?nombre " (ID: " ?id ")" crlf)
    (printout t "------------------------------------" crlf)
    (printout t "Sintomas: " ?sintomas crlf)
    (printout t "Signos: " ?signos crlf)
    (printout t "------------------------------------" crlf)
)

(defrule ConsultarSignos
    =>
    (printout t "Ingresar ID para verificar signos")
    (bind ?id (read))
    (Enfermedad (id ?id) (nombre ?nombre) (signos $?signos))
    =>
    (printout t "------------------------------------" crlf)
    (printout t "Signos de: " ?nombre " (ID: " ?id ")" crlf)
    (printout t "------------------------------------" crlf)
    (printout t ?signos crlf)
    (printout t "------------------------------------" crlf)
)

(defrule ConsultarSintomas
    =>
    (printout t "Ingresar ID para verificar sintomas")
    (bind ?id (read))
    (Enfermedad (id ?id) (nombre ?nombre) (sintomas $?sintomas))
    =>
    (printout t "------------------------------------" crlf)
    (printout t "Sintomas de " ?nombre " (ID: " ?id ")" crlf)
    (printout t "------------------------------------" crlf)
    (printout t ?sintomas crlf)
    (printout t "------------------------------------" crlf)
)

(defrule DeletById
    =>
    (printout t "Ingresar ID de enfermedad: ")
    (bind ?id (read))
    (Enfermedad (id ?id))
    =>
    (printout t "Enfermedad con ID: " ?id crlf)
    (retract (Enfermedad (id ?id)))
)

;need to insert dis line by line 
(assert (Enfermedad (id 1) (nombre Resfriado) (signos fiebre congestión_nasal) (sintomas tos dolor_garganta)))
(assert (Enfermedad (id 2) (nombre Gripe) (signos fiebre cansancio) (sintomas dolor_cabeza escalofríos)))
(assert (Enfermedad (id 3) (nombre Alergia) (signos estornudos picazón) (sintomas congestión_nasal ojos_llorosos)))
(assert (Enfermedad (id 4) (nombre Hipertensión) (signos dolor_cabeza mareos) (sintomas visión_borrosa fatiga)))
(assert (Enfermedad (id 5) (nombre Diabetes) (signos sed aumento_apetito) (sintomas fatiga micción_frecuente)))
(assert (Enfermedad (id 6) (nombre Asma) (signos dificultad_respirar silbidos) (sintomas tos opresión_pecho)))
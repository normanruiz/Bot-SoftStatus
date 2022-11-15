##############################################################################
#                             AVIS SOFTWARE                                  #
#                     (Productos de Software Libre)                          #
#                                                                            #
##############################################################################
#
#  **************************************************************************
#  * El software libre no es una cuestion economica sino una cuestion etica *
#  **************************************************************************
#
# Avis Software es marca registrada.
#
# Este programa es software libre; puede redistribuirlo o modificarlo bajo los
# terminos de la Licencia Publica General de GNU tal como se publica por la
# Free Software Foundation; ya sea la version 3 de la Licencia, o (a su
# eleccion) cualquier version posterior.
#
# Este programa se distribuye con la esperanza de que le sea util, pero SIN
# NINGUNA GARANTIA; sin incluso la garantia implicita de MERCANTILIDAD o
# IDONEIDAD PARA UN PROPOSITO PARTICULAR.
#
# Vea la Licencia Publica General GNU para mas detalles.
#
# Deberia haber recibido una copia de la Licencia Publica General de GNU
# junto con este programa, si no es asi, escriba a la Free Software Foundation,
# Inc, 59 Temple Place - Suite 330, Boston, MA 02111-1307, EE.UU.
#
##############################################################################
# ARCHIVO             : config.py
# AUTOR               : Norman Ruiz.
# COLABORADORES       : No aplica.
# VERSION             : 1.00 estable.
# FECHA DE CREACION   : 15/11/2022.
# ULTIMA ACTUALIZACION: 15/11/2022.
# LICENCIA            : GPL (General Public License) - Version 3.
#=============================================================================
# SISTEMA OPERATIVO   : Linux NT-9992031 4.4.0-19041-Microsoft #1237-Microsoft Sat Sep 11 14:32:00 PST 2021 x86_64 GNU/Linux.
# IDE                 : Atom 1.60.0
# COMPILADOR          : ruby 2.7.2p137 (2020-10-01 revision 5445e04352) [x86_64-linux]
# LICENCIA            : GPL (General Public License) - Version 3.
#=============================================================================
# DEDICATORIA: A mi hija Micaela Ruiz que me re aguanta.
#=============================================================================
# DESCRIPCION:
#             Este archivo incluye la definicion del modulo config.
#
#             Las funciones config permiten la reconfiguracion del bot
#             a traves de una interfaz xml.
#
#-------------------------------------------------------------------------------
# ARCHIVO DE CABECERA: No aplica
#
# FUNCIONES DEFINIDAS:
#==============================================================================|
#     NOMBRE     |  TIPO  |                    ACCION                          |
#================+========+====================================================|
# Cargar()       | dict | Carga la configuracion desde un archivo json.        |
#================+========+====================================================|
#
#-------------------------------------------------------------------------------
# MODIFICACIONES DE LA VERSION 0.01 estable (05/05/2022)
# AUTOR DE LA MODIFICACION: Norman Ruiz.
# * Ejemplo de historial de modificaciones.
#
#-------------------------------------------------------------------------------
#
#///////////////////////////////////////////////////////////////////////////////

#*****************************************************************************
#                             INCLUSIONES ESTANDAR
#=============================================================================
require 'xmlhasher'

#*****************************************************************************
#                             INCLUSIONES PERSONALES
#=============================================================================
require './files_bot/logger.rb'

#*****************************************************************************
#                             INCLUSIONES PARA WINDOWS
#=============================================================================

# Sin especificar

#*****************************************************************************
#                             INCLUSIONES PARA LINUX
#=============================================================================

# Sin especificar

#*****************************************************************************
#               ESPACIO DE NOMBRES DE LA LIBRERIA
#=============================================================================

# Sin especificar

#***************************************************************************
#                        FUNCIONES PARA LINUX
#===========================================================================
# FUNCION   : dict Cargar().
# ACCION    : Carga la configuracion desde un archivo json.
# PARAMETROS: void, no recibe nada.
# DEVUELVE  : dict, la configuracion del bot.
#---------------------------------------------------------------------------
def Cargar_configuracion()
    configfile = File.join(".", "config.xml")
    config = nil

    begin
        mensaje = "Cargando configuracion..."
        puts("  " + mensaje)
        Escribir_log(mensaje)

        xmlfile = File.open(configfile, 'r')
        config = XmlHasher.parse(xmlfile)

        mensaje = "Configuracion cargada exitosamente..."
        puts("  " + mensaje)
        Escribir_log(mensaje)
        mensaje = "Subproceso finalizado..."
        puts("  " + mensaje)
        Escribir_log(mensaje)

    rescue Exception => excepcion
        config = false
        mensaje = "ERROR - Cargando configuracion: " + str(excepcion)
        puts("  " + mensaje)
        Escribir_log(mensaje)
        mensaje = "WARNING!!! - Subproceso interrumpido..."
        puts("  " + mensaje)
        Escribir_log(mensaje)

    ensure
        mensaje = " #{'-' * 128}"
        puts(mensaje)
        Escribir_log(mensaje, false)
        return config
    end
end

#---------------------------------------------------------------------------
# FUNCION   :
# ACCION    :
# PARAMETROS:
# DEVUELVE  :
#---------------------------------------------------------------------------

#***************************************************************************
#                        FUNCIONES PARA WINDOWS
#===========================================================================
# FUNCION   :
# ACCION    :
# PARAMETROS:
# DEVUELVE  :
#---------------------------------------------------------------------------

# Sin especificar

#=============================================================================
#                            FIN DE ARCHIVO
##############################################################################

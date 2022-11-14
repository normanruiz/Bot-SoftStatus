##############################################################################
# ARCHIVO             : bot.rb
# AUTOR/ES            : Ruiz Norman
# VERSION             : 1.00 estable.
# FECHA DE CREACION   : 14/11/2022.
# ULTIMA ACTUALIZACION: 14/11/2022.
# LICENCIA            : GPL (General Public License) - Version 3.
#  **************************************************************************
#  * El software libre no es una cuestion economica sino una cuestion etica *
#  **************************************************************************
#
# Este programa es software libre;  puede redistribuirlo  o  modificarlo bajo
# los terminos de la Licencia Publica General de GNU  tal como se publica por
# la  Free Software Foundation;  ya sea la version 3 de la Licencia,  o (a su
# eleccion) cualquier version posterior.
#
# Este programa se distribuye con la esperanza  de que le sea util,  pero SIN
# NINGUNA  GARANTIA;  sin  incluso  la garantia implicita de MERCANTILIDAD  o
# IDONEIDAD PARA UN PROPOSITO PARTICULAR.
#
# Vea la Licencia Publica General GNU para mas detalles.
#
# Deberia haber recibido una copia de la Licencia Publica General de GNU junto
# con este proyecto, si no es asi, escriba a la Free Software Foundation, Inc,
# 59 Temple Place - Suite 330, Boston, MA 02111-1307, EE.UU.

#=============================================================================
# SISTEMA OPERATIVO   : Linux NT-9992031 4.4.0-19041-Microsoft #1237-Microsoft Sat Sep 11 14:32:00 PST 2021 x86_64 GNU/Linux.
# IDE                 : Atom 1.60.0
# COMPILADOR          : ruby 2.7.2p137 (2020-10-01 revision 5445e04352) [x86_64-linux]
# LICENCIA            : GPL (General Public License) - Version 3.
#=============================================================================
# DESCRIPCION:
#              Bot de recoleccion y actualizacion de la tabla de reporteria de software de terminales.
#
#/////////////////////////////////////////////////////////////////////////////

#*****************************************************************************
#                       CONFIGURACION MULTIPLATAFORMA
#=============================================================================
# COMPILACION EN WINDOWS
#-----------------------------------------------------------------------------
# Si este programa se va a compilar en Windows, descomente las tres lineas
# siguientes, y comente las tres lineas de "COMPILACION EN LINUX".
#-----------------------------------------------------------------------------

# Sin especificar

#=============================================================================
# COMPILACION EN LINUX
#-----------------------------------------------------------------------------
# Si este programa se va a compilar en Linux, descomente las tres lineas
# siguientes, y comente las tres lineas de "COMPILACION EN WINDOWS".
#-----------------------------------------------------------------------------
# Sin especificar

#*****************************************************************************
#                             DECLARACIONES GLOBALES
#=============================================================================
# Sin especificar

#*****************************************************************************
#                             INCLUSIONES ESTANDAR
#=============================================================================

#*****************************************************************************
#                             INCLUSIONES PERSONALES
#=============================================================================
require './files_bot/logger.rb'

#==============================================================================
# DECLARACION DEL ESPACIO DE NOMBRES POR DEFECTO
#------------------------------------------------------------------------------

# Sin especificar

#==============================================================================
# FUNCION PRINCIPAL - PUNTO DE INICIO DEL PROYECTO
#------------------------------------------------------------------------------

module Bot
    include Logger

    def Run()
        begin
            system('clear')
            @estado = verificar_log()
            puts("")
            mensaje = " #{'=' * 128}"
            puts(mensaje)
            escribir_log(mensaje, false)
            mensaje = " Iniciando SoftStatus's Bot..."
            puts(" " + mensaje)
            escribir_log(mensaje)
            mensaje = " #{'~' * 128}"
            puts(mensaje)
            escribir_log(mensaje, false)

        rescue Exception => excepcion
            @estado = false
            mensaje = " #{'-' * 128}"
            puts(mensaje)
            escribir_log(mensaje, false)
            mensaje = "ERROR - Ejecucion principal - #{excepcion.message}"
            puts("  " + mensaje)
            escribir_log(mensaje)

        ensure
            unless @estado then
                mensaje = " #{'-' * 128}"
                puts(mensaje)
                escribir_log(mensaje, false)
                mensaje = "ALERTA - Ejecucion principal - Se detiene el proceso, no se ejecutaran mas acciones..."
                puts("  " + mensaje)
                escribir_log(mensaje)
            end
            mensaje = " #{'~' * 128}"
            puts(mensaje)
            escribir_log(mensaje, false)
            mensaje = "Finalizando SoftStatus's Bot..."
            puts("  " + mensaje)
            escribir_log(mensaje)
            mensaje = " #{'=' * 128}"
            puts(mensaje)
            escribir_log(mensaje, false)
            puts("")
            return @estado
        end
    end
end

include Bot

#==============================================================================
# LLAMADA DE INICIO
#------------------------------------------------------------------------------
Run()

#=============================================================================
#                            FIN DE ARCHIVO
##############################################################################

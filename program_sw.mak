#***************************  M a k e f i l e  *******************************
#
#         Author: Christian.Schuster@men.de
#          $Date: 2013/04/17 19:00:56 $
#      $Revision: 2.6 $
#
#    Description: linux makefile descriptor file for fpga_load
#
#---------------------------------[ History ]---------------------------------
#
#   $Log: program_sw.mak,v $
#   Revision 2.6  2013/04/17 19:00:56  ts
#   R: changes for compiling as part of an MDIS project
#
#   Revision 2.5  2005/12/12 14:25:51  cschuster
#   Copyright line changed
#
#   Revision 2.4  2005/11/24 18:18:33  cschuster
#   Added support for A404/A500 (Flash access over SMBus and PLD)
#
#   Revision 2.3  2005/07/08 17:49:54  cs
#   use chameleon (+oss_usr, +dbg_usr) library
#   add VME bus support
#
#   Revision 2.2  2005/01/21 13:36:48  cs
#   switch Z100_IO_MAPPED_EN moved to library.mak
#
#   Revision 2.1  2004/12/23 15:10:49  cs
#   Initial Revision
#
#   Revision 1.2  2004/12/13 18:03:39  cs
#   added comment for MAC_IO_MAPPED_EN switch
#
#   Revision 1.1  2004/11/30 18:05:00  cs
#   Initial Revision
#
#
#-----------------------------------------------------------------------------
# (c) Copyright 2004 by MEN Mikro Elektronik GmbH, Nuremberg, Germany
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#*****************************************************************************

MAK_NAME=fpga_load_sw

MAK_SWITCH= \
            $(SW_PREFIX)MAC_BYTESWAP\
			$(SW_PREFIX)FPGA_LOAD_SW\
			$(SW_PREFIX)FLASH_SW\
			$(SW_PREFIX)FL_SWAP_SW\
            $(SW_PREFIX)Z100_CONFIG_VME \
            $(SW_PREFIX)MAC_USERSPACE\
			
			
# $(SW_PREFIX)Z100_CONFIG_SMB \
#            $(SW_PREFIX)Z100_IO_ACCESS_ENABLE \
#			$(SW_PREFIX)OSS_USR_IO_MAPPED_ACC_EN 
		
MAK_LIBS= 	$(LIB_PREFIX)$(MEN_LIB_DIR)/usr_oss$(LIB_SUFFIX)				\
			$(LIB_PREFIX)$(MEN_LIB_DIR)/usr_utl$(LIB_SUFFIX)				\
        	$(LIB_PREFIX)$(MEN_LIB_DIR)/chameleon_usr$(LIB_SUFFIX)			\
			$(LIB_PREFIX)$(MEN_LIB_DIR)/chameleon_usr_sw$(LIB_SUFFIX)		\
        	$(LIB_PREFIX)$(MEN_LIB_DIR)/chameleon_usr_io$(LIB_SUFFIX)		\
			$(LIB_PREFIX)$(MEN_LIB_DIR)/chameleon_usr_io_sw$(LIB_SUFFIX)	\
        	$(LIB_PREFIX)$(MEN_LIB_DIR)/oss_usr$(LIB_SUFFIX)				\
        	$(LIB_PREFIX)$(MEN_LIB_DIR)/dbg_usr$(LIB_SUFFIX)				\

# for LINUX:
MAK_LIBS+=	$(LIB_PREFIX)$(MEN_LIB_DIR)/pci$(LIB_SUFFIX)\
			$(LIB_PREFIX)$(MEN_LIB_DIR)/vme4l_api$(LIB_SUFFIX) \

MAK_INCL=$(MEN_INC_DIR)/men_typs.h \
		 $(MEN_INC_DIR)/usr_oss.h \
		 $(MEN_INC_DIR)/usr_err.h \
		 $(MEN_INC_DIR)/smb2.h \
		 $(MEN_INC_DIR)/usr_utl.h \
		 $(MEN_INC_DIR)/fpga_header.h \
         $(MEN_MOD_DIR)/../COM/fpga_load.h \

#MAK_INP3=am29lvxxx$(INP_SUFFIX)
#MAK_INP4=am29lvxxx_smb$(INP_SUFFIX)
#MAK_INP6=fpga_load$(INP_SUFFIX)
#MAK_INP5=flash_com$(INP_SUFFIX)
#MAK_INP1=hw_acc$(INP_SUFFIX)
#MAK_INP2=hw_acc_io$(INP_SUFFIX)
#MAK_INP7=


MAK_INP1 =_amd_smb_stub$(INP_SUFFIX)
MAK_INP2 =_amd_smb_sw_stub$(INP_SUFFIX)
MAK_INP3 =_amd_stub$(INP_SUFFIX)
MAK_INP4 =_amd_sw_stub$(INP_SUFFIX)
MAK_INP5 =_istrata_mmod_stub$(INP_SUFFIX)
MAK_INP6 =_istrata_mmod_sw_stub$(INP_SUFFIX)
MAK_INP7 =_istrata_stub$(INP_SUFFIX)
MAK_INP8 =_istrata_sw_stub$(INP_SUFFIX)
MAK_INP9 =_st_stub$(INP_SUFFIX)
MAK_INP10=_st_sw_stub$(INP_SUFFIX)
MAK_INP11=fpga_load$(INP_SUFFIX)
MAK_INP12=flash_com$(INP_SUFFIX)
MAK_INP13=hw_acc$(INP_SUFFIX)
MAK_INP14=hw_acc_io$(INP_SUFFIX)

MAK_INP=$(MAK_INP1)\
		$(MAK_INP2)\
		$(MAK_INP3)\
		$(MAK_INP4)\
		$(MAK_INP5)\
		$(MAK_INP6)\
		$(MAK_INP7)\
		$(MAK_INP8)\
		$(MAK_INP9)\
		$(MAK_INP10)\
		$(MAK_INP11)\
		$(MAK_INP12)\
		$(MAK_INP13)\
		$(MAK_INP14)


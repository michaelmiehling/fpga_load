/*********************  P r o g r a m  -  M o d u l e ***********************/
/*!
 *         \file  _istrata_sw_stub.c
 *
 *       \author  Christian.Kauntz@men.de
 *        $Date: 2009/03/05 09:53:05 $
 *    $Revision: 2.3 $
 *
 *        \brief  instance for IntelStrata Flash swapped version
 *
 *
 *     Required: -
 *    \switches  (none)
 */
 /*---------------------------[ Public Functions ]----------------------------
 *
 *
 *-------------------------------[ History ]---------------------------------
 *
 * $Log: _istrata_sw_stub.c,v $
 * Revision 2.3  2009/03/05 09:53:05  CKauntz
 * R: Compiler warning internFunc declared but not defined
 * M: Added undef to reduce compiler warning
 *
 * Revision 2.2  2009/01/22 17:53:40  CKauntz
 * Added fpga_load.h to solve compiler warnings
 *
 * Revision 2.1  2007/07/09 20:13:05  CKauntz
 * Initial Revision
 *
 *
 *
 *
 *---------------------------------------------------------------------------
 * (c) Copyright 2007 by MEN Mikro Elektronik GmbH, Nuremberg, Germany
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 ****************************************************************************/
#ifdef FL_SWAP_SW
#undef FL_SWAP_SW
#endif /* FL_SWAP_SW */
#ifdef FL_SWAP_MMOD_SW
#undef FL_SWAP_MMOD_SW
#endif /* FL_SWAP_MMOD_SW */
#ifdef FL_SWAP_MMOD
#undef FL_SWAP_MMOD
#endif /* FL_SWAP_MMOD */

#define FL_SWAP_SW
#define Z100_ISTRATAPC28FXXXP30_TRY Z100_ISTRATAPC28FXXXP30_TRY_sw

#undef PROG_FILE_NAME
#include "fpga_load.h"
#include "hw_acc.c"
#include "istratapc28fxxxp30.c"
#undef FL_SWAP_SW

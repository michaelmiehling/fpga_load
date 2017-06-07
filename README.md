# Build of fpga_load tool within A25 MDIS project:


Prerequisites: install pciutils and pciutils-dev (or pciutils-devel)  (use apt, yum, zypper,…) Get A25 project         

    $ git clone https://github.com/ThomasSchnuerer/A25_MDIS_project.git
 
Get Sources:

    $ git clone https://github.com/ThomasSchnuerer/MDIS4Linux_systemPackage.git  
    $ cd MDIS4Linux_systemPackage/ 
    $ git submodule update --init --recursive 

Add fpga_load source:

    $ cd TOOLS $ mkdir fpga_load 
    $ git clone ssh://git@192.168.1.166:7999/mct/fpga_load.git fpga_load/COM
    
Adoptions in makefiles of MDIS4Linux_systemPackage:


Change ~/MDIS4Linux_systemPackage/LIBSRC/OSS/library_usr.mak:

    <          $(MEN_MOD_DIR)/../pciutils/lib/pci.h  \ 
    <          $(MEN_MOD_DIR)/../pciutils/lib/config.h  \ 
    <          $(MEN_MOD_DIR)/../pciutils/lib/header.h  \ 
    ---
    >          /usr/include/pci/pci.h \ 
    >          /usr/include/pci/config.h \ 
    >          /usr/include/pci/header.h \
    
Change ~/MDIS4Linux_systemPackage/INCLUDE/NATIVE/MEN/ossu_os.h:

    <          #ifdef OSS_CONFIG_PCI 
    <          #       include "../../../LIBSRC/pciutils/lib/pci.h" 
    <          #endif /* OSS_CONFIG_PCI */ 
    ---
    >          #ifdef OSS_CONFIG_PCI 
    >          #       include <pci/pci.h> 
    >          #endif /* OSS_CONFIG_PCI */
    
Change ~/MDIS4Linux_systemPackage/LIBSRC/OSS/oss_intern.h:

    <          #if LINUX_VERSION_CODE > KERNEL_VERSION(3,0,0) 
    <          # define TASK_SIGPENDING        pending.signal.sig 
    <          #else 
    <          # define TASK_SIGPENDING        signal.sig 
    <          #endif 
    <            
    <          #if LINUX_VERSION_CODE > KERNEL_VERSION(2,6,20) 
    <          # define TASK_LOCK_SIGNALS(t,flags)         spin_lock_irqsave(&(t)->sighand->siglock, flags); 
    <          # define TASK_UNLOCK_SIGNALS(t,flags)   spin_unlock_irqrestore(&(t)->sighand->siglock, flags); 
    <          # define RECALC_SIGPENDING()                    recalc_sigpending() 
    <          #else 
    <          # define TASK_LOCK_SIGNALS(t,flags)         spin_lock_irqsave(&(t)->sigmask_lock, flags); 
    <          # define TASK_UNLOCK_SIGNALS(t,flags)   spin_unlock_irqrestore(&(t)->sigmask_lock, flags); 
    <          # define RECALC_SIGPENDING()                    recalc_sigpending(current) 
    <          #endif 
    ---
    >          # define TASK_SIGPENDING        pending.signal.sig 
    >          # define TASK_LOCK_SIGNALS(t,flags)         spin_lock_irqsave(&(t)->sighand->siglock, flags); 
    >          # define TASK_UNLOCK_SIGNALS(t,flags)   spin_unlock_irqrestore(&(t)->sighand->siglock, flags); 
    >          # define RECALC_SIGPENDING()                    recalc_sigpending()
    
Change ~/MDIS4Linux_systemPackage/LIBSRC/OSS/ossu_bustoaddr.c:

    <          #include "../pciutils/lib/pci.h" 
    ---
    >          #include <pci/pci.h> 
    
Change ~/MDIS4Linux_systemPackage/TOOLS/fpga_load/COM/program.mak:

    <          MAK_LIBS=       $(LIB_PREFIX)$(MEN_LIB_DIR)/usr_oss$(LIB_SUFFIX)                        \ 
    <                          $(LIB_PREFIX)$(MEN_LIB_DIR)/usr_utl$(LIB_SUFFIX)                        \ 
    <                          $(LIB_PREFIX)$(MEN_LIB_DIR)/chameleon_usr$(LIB_SUFFIX)          \ 
    <                          $(LIB_PREFIX)$(MEN_LIB_DIR)/chameleon_usr_io$(LIB_SUFFIX)       \ 
    <                          $(LIB_PREFIX)$(MEN_LIB_DIR)/chameleon_usr_sw$(LIB_SUFFIX)       \ 
    <                          $(LIB_PREFIX)$(MEN_LIB_DIR)/chameleon_usr_io_sw$(LIB_SUFFIX)\ 
    <                          $(LIB_PREFIX)$(MEN_LIB_DIR)/oss_usr$(LIB_SUFFIX)                        \ 
    <                          $(LIB_PREFIX)$(MEN_LIB_DIR)/dbg_usr$(LIB_SUFFIX)                        
    ---
    >          MAK_LIBS=       $(LIB_PREFIX)$(MEN_LIB_DIR)/usr_oss$(LIB_SUFFIX)                        \ 
    >                          $(LIB_PREFIX)$(MEN_LIB_DIR)/usr_utl$(LIB_SUFFIX)                        \ 
    >                          $(LIB_PREFIX)$(MEN_LIB_DIR)/chameleon_usr$(LIB_SUFFIX)          \ 
    >                          $(LIB_PREFIX)$(MEN_LIB_DIR)/chameleon_usr_io$(LIB_SUFFIX)       \ 
    >                          $(LIB_PREFIX)$(MEN_LIB_DIR)/chameleon_usr_sw$(LIB_SUFFIX)       \ 
    >                          $(LIB_PREFIX)$(MEN_LIB_DIR)/chameleon_usr_io_sw$(LIB_SUFFIX)\ 
    >                          $(LIB_PREFIX)$(MEN_LIB_DIR)/oss_usr$(LIB_SUFFIX)                        \ 
    >                          $(LIB_PREFIX)$(MEN_LIB_DIR)/dbg_usr$(LIB_SUFFIX)                        \ 
    >                          $(LIB_PREFIX)$(MEN_LIB_DIR)/vme4l_api$(LIB_SUFFIX)                        \ 
    >                          $(LIB_PREFIX)pci
    
Edit ~/A25_MDIS_project/Makefile to contain:  

    ALL_USR_LIBS = \
        USR_OSS/library.mak \
        USR_UTL/COM/library.mak \
        CHAMELEON/COM/library.mak \
        CHAMELEON/COM/library_io.mak \
        CHAMELEON/COM/library_usr.mak \
        CHAMELEON/COM/library_io_sw.mak \
        CHAMELEON/COM/library_usr_io.mak \
        CHAMELEON/COM/library_usr_io_sw.mak \
        CHAMELEON/COM/library_usr_sw.mak \
        OSS/library.mak \
        OSS/library_usr.mak \
        DBG/library.mak \
        DBG/library_usr.mak \
        VME4L_API/library.mak
        
    ALL_COM_TOOLS = fpga_load/COM/program.mak
    
Final Build:

    $ cd ~/A25_MDIS_project 
    $ make
   
=> binary for fpga_load will be in ~/A25_MDIS_project/BIN

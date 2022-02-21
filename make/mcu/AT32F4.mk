#
# AT32F4 Make file include
#


ifeq ($(TARGET),$(filter $(TARGET), $(AT32F403xG_TARGETS)))
MCU_FLASH_SIZE  := 1024
else ifeq ($(TARGET),$(filter $(TARGET), $(AT32F403xE_TARGETS)))
MCU_FLASH_SIZE  := 512
else
MCU_FLASH_SIZE  := 256
endif

STDPERIPH_DIR   = $(ROOT)/lib/main/AT32F4/Drivers/STM32F10x_StdPeriph_Driver
STDPERIPH_SRC   = $(notdir $(wildcard $(STDPERIPH_DIR)/src/*.c))
EXCLUDES        = stm32f10x_crc.c \
                  stm32f10x_cec.c \
                  stm32f10x_can.c
STARTUP_SRC     = startup_stm32f10x_hd_gcc.S
STDPERIPH_SRC   := $(filter-out ${EXCLUDES}, $(STDPERIPH_SRC))

# Search path and source files for the CMSIS sources
VPATH           := $(VPATH):$(CMSIS_DIR)/Core/Include:$(ROOT)/lib/main/AT32F4/Drivers/CMSIS/Device/ST/STM32F10x
CMSIS_SRC        = $(notdir $(wildcard $(ROOT)/lib/main/AT32F4/Drivers/CMSIS/Device/ST/STM32F10x/*.c))

INCLUDE_DIRS    := $(INCLUDE_DIRS) \
                   $(STDPERIPH_DIR)/inc \
                   $(CMSIS_DIR)/Core/Include \
                   $(ROOT)/lib/main/AT32F4/Drivers/CMSIS/Device/ST/STM32F10x

DEVICE_STDPERIPH_SRC = $(STDPERIPH_SRC)

ifneq ($(filter VCP, $(FEATURES)),)
INCLUDE_DIRS    := $(INCLUDE_DIRS) \
                   $(USBFS_DIR)/inc \
                   $(ROOT)/src/main/vcp

VPATH           := $(VPATH):$(USBFS_DIR)/src

DEVICE_STDPERIPH_SRC := $(DEVICE_STDPERIPH_SRC) \
                        $(USBPERIPH_SRC)

endif

ifeq ($(LD_SCRIPT),)
LD_SCRIPT       = $(LINKER_DIR)/at32_flash_f403a_$(TARGET_FLASH_SIZE)k.ld
endif

ARCH_FLAGS      = -mthumb -mcpu=cortex-m3 -Wdouble-promotion

#ARCH_FLAGS = -mthumb -mcpu=cortex-m3 -march=armv7e-m -mfloat-abi=hard -mfpu=fpv4-sp-d16 -fsingle-precision-constant -Wdouble-promotion

ifeq ($(DEVICE_FLAGS),)
DEVICE_FLAGS    = -DAT32F403AX -DSTM32F10X_HD -DSTM32F10X
endif
DEVICE_FLAGS   += -DAT32F403AX -DSTM32F10X_HD -DSTM32F10X

VCP_SRC = \
            vcp/hw_config.c \
            vcp/stm32_it.c \
            vcp/usb_desc.c \
            vcp/usb_endp.c \
            vcp/usb_istr.c \
            vcp/usb_prop.c \
            vcp/usb_pwr.c \
            drivers/serial_usb_vcp.c \
            drivers/usb_io.c

MCU_COMMON_SRC = \
            drivers/adc_stm32f10x.c \
            drivers/bus_i2c_stm32f10x.c \
            drivers/bus_spi_stdperiph.c \
            drivers/dma.c \
            drivers/inverter.c \
            drivers/light_ws2811strip_stdperiph.c \
            drivers/serial_uart_stdperiph.c \
            drivers/serial_uart_stm32f10x.c \
            drivers/system_stm32f10x.c \
            drivers/timer_stm32f10x.c\
            drivers/pwm_output_dshot_shared.c \
			drivers/pwm_output_dshot.c \
			drivers/dshot_bitbang.c \
            drivers/dshot_bitbang_decode.c \
            drivers/dshot_bitbang_stdperiph.c \
            
            

DSP_LIB :=

ifneq ($(DEBUG),GDB)
OPTIMISE_DEFAULT    := -Os
OPTIMISE_SPEED      :=
OPTIMISE_SIZE       :=

LTO_FLAGS           := $(OPTIMISATION_BASE) $(OPTIMISE_DEFAULT)
endif

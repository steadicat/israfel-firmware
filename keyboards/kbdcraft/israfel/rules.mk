LTO_ENABLE = yes

OPT_DEFS += -DCORTEX_ENABLE_WFI_IDLE=TRUE

ISRAFEL_ARM_TOOLCHAIN_PATHS :=

ifneq ($(wildcard /opt/homebrew/opt/arm-none-eabi-binutils/bin),)
ISRAFEL_ARM_TOOLCHAIN_PATHS := /opt/homebrew/opt/arm-none-eabi-binutils/bin:$(ISRAFEL_ARM_TOOLCHAIN_PATHS)
endif

ifneq ($(wildcard /opt/homebrew/opt/arm-none-eabi-gcc@8/bin),)
ISRAFEL_ARM_TOOLCHAIN_PATHS := /opt/homebrew/opt/arm-none-eabi-gcc@8/bin:$(ISRAFEL_ARM_TOOLCHAIN_PATHS)
endif

ifneq ($(wildcard /usr/local/opt/arm-none-eabi-binutils/bin),)
ISRAFEL_ARM_TOOLCHAIN_PATHS := /usr/local/opt/arm-none-eabi-binutils/bin:$(ISRAFEL_ARM_TOOLCHAIN_PATHS)
endif

ifneq ($(wildcard /usr/local/opt/arm-none-eabi-gcc@8/bin),)
ISRAFEL_ARM_TOOLCHAIN_PATHS := /usr/local/opt/arm-none-eabi-gcc@8/bin:$(ISRAFEL_ARM_TOOLCHAIN_PATHS)
endif

ifneq ($(ISRAFEL_ARM_TOOLCHAIN_PATHS),)
export PATH := $(ISRAFEL_ARM_TOOLCHAIN_PATHS)$(PATH)
endif

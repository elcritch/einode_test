##  Copyright 2015-2016 Espressif Systems (Shanghai) PTE LTD
##
##  Licensed under the Apache License, Version 2.0 (the "License");
##  you may not use this file except in compliance with the License.
##  You may obtain a copy of the License at
##      http://www.apache.org/licenses/LICENSE-2.0
##
##  Unless required by applicable law or agreed to in writing, software
##  distributed under the License is distributed on an "AS IS" BASIS,
##  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
##  See the License for the specific language governing permissions and
##  limitations under the License.

import esp_err

## *
##  @brief Ethernet interface mode
##
##

type
  eth_mode_t* {.size: sizeof(cint), importcpp: "eth_mode_t", header: "esp_eth.h".} = enum
    ETH_MODE_RMII = 0,          ## !< RMII mode
    ETH_MODE_MII              ## !< MII mode


## *
##  @brief Ethernet clock mode
##
##

type
  eth_clock_mode_t* {.size: sizeof(cint), importcpp: "eth_clock_mode_t",
                     header: "esp_eth.h".} = enum
    ETH_CLOCK_GPIO0_IN = 0,     ## !< RMII clock input to GPIO0
    ETH_CLOCK_GPIO0_OUT = 1,    ## !< RMII clock output from GPIO0
    ETH_CLOCK_GPIO16_OUT = 2,   ## !< RMII clock output from GPIO16
    ETH_CLOCK_GPIO17_OUT = 3


## *
##  @brief Ethernet Speed
##
##

type
  eth_speed_mode_t* {.size: sizeof(cint), importcpp: "eth_speed_mode_t",
                     header: "esp_eth.h".} = enum
    ETH_SPEED_MODE_10M = 0,     ## !< Ethernet speed: 10Mbps
    ETH_SPEED_MODE_100M       ## !< Ethernet speed: 100Mbps


## *
##  @brief Ethernet Duplex
##
##

type
  eth_duplex_mode_t* {.size: sizeof(cint), importcpp: "eth_duplex_mode_t",
                      header: "esp_eth.h".} = enum
    ETH_MODE_HALFDUPLEX = 0,    ## !< Ethernet half duplex
    ETH_MODE_FULLDUPLEX       ## !< Ethernet full duplex


## *
##  @brief Ethernet PHY address
##
##

type
  eth_phy_base_t* {.size: sizeof(cint), importcpp: "eth_phy_base_t",
                   header: "esp_eth.h".} = enum
    PHY0 = 0,                   ## !< PHY address 0
    PHY1,                     ## !< PHY address 1
    PHY2,                     ## !< PHY address 2
    PHY3,                     ## !< PHY address 3
    PHY4,                     ## !< PHY address 4
    PHY5,                     ## !< PHY address 5
    PHY6,                     ## !< PHY address 6
    PHY7,                     ## !< PHY address 7
    PHY8,                     ## !< PHY address 8
    PHY9,                     ## !< PHY address 9
    PHY10,                    ## !< PHY address 10
    PHY11,                    ## !< PHY address 11
    PHY12,                    ## !< PHY address 12
    PHY13,                    ## !< PHY address 13
    PHY14,                    ## !< PHY address 14
    PHY15,                    ## !< PHY address 15
    PHY16,                    ## !< PHY address 16
    PHY17,                    ## !< PHY address 17
    PHY18,                    ## !< PHY address 18
    PHY19,                    ## !< PHY address 19
    PHY20,                    ## !< PHY address 20
    PHY21,                    ## !< PHY address 21
    PHY22,                    ## !< PHY address 22
    PHY23,                    ## !< PHY address 23
    PHY24,                    ## !< PHY address 24
    PHY25,                    ## !< PHY address 25
    PHY26,                    ## !< PHY address 26
    PHY27,                    ## !< PHY address 27
    PHY28,                    ## !< PHY address 28
    PHY29,                    ## !< PHY address 29
    PHY30,                    ## !< PHY address 30
    PHY31                     ## !< PHY address 31
  eth_phy_check_link_func* = proc (): bool {.cdecl.}
  eth_phy_check_init_func* = proc () {.cdecl.}
  eth_phy_get_speed_mode_func* = proc (): eth_speed_mode_t {.cdecl.}
  eth_phy_get_duplex_mode_func* = proc (): eth_duplex_mode_t {.cdecl.}
  eth_phy_func* = proc (): esp_err_t {.cdecl.}
  eth_tcpip_input_func* = proc (buffer: pointer; len: uint16; eb: pointer): esp_err_t {.
      cdecl.}
  eth_gpio_config_func* = proc () {.cdecl.}
  eth_phy_get_partner_pause_enable_func* = proc (): bool {.cdecl.}
  eth_phy_power_enable_func* = proc (enable: bool) {.cdecl.}


## *
##  @brief ethernet configuration
##
##

type
  eth_config_t* {.importcpp: "eth_config_t", header: "esp_eth.h", bycopy.} = object
    phy_addr* {.importc: "phy_addr".}: eth_phy_base_t ## !< PHY address (0~31)
    mac_mode* {.importc: "mac_mode".}: eth_mode_t ## !< MAC mode: only support RMII now
    clock_mode* {.importc: "clock_mode".}: eth_clock_mode_t ## !< external/internal clock mode selection
    tcpip_input* {.importc: "tcpip_input".}: eth_tcpip_input_func ## !< tcpip input func
    phy_init* {.importc: "phy_init".}: eth_phy_func ## !< phy init func
    phy_check_link* {.importc: "phy_check_link".}: eth_phy_check_link_func ## !< phy check link func
    phy_check_init* {.importc: "phy_check_init".}: eth_phy_check_init_func ## !< phy check init func
    phy_get_speed_mode* {.importc: "phy_get_speed_mode".}: eth_phy_get_speed_mode_func ## !< phy check init func
    phy_get_duplex_mode* {.importc: "phy_get_duplex_mode".}: eth_phy_get_duplex_mode_func ## !< phy check init func
    gpio_config* {.importc: "gpio_config".}: eth_gpio_config_func ## !< gpio config func
    flow_ctrl_enable* {.importc: "flow_ctrl_enable".}: bool ## !< flag of flow ctrl enable
    phy_get_partner_pause_enable* {.importc: "phy_get_partner_pause_enable".}: eth_phy_get_partner_pause_enable_func ## !< get partner pause enable
    phy_power_enable* {.importc: "phy_power_enable".}: eth_phy_power_enable_func ## !< enable or disable phy power
    reset_timeout_ms* {.importc: "reset_timeout_ms".}: uint32 ## !< timeout value for reset emac
    promiscuous_enable* {.importc: "promiscuous_enable".}: bool ## !< set true to enable promiscuous mode


## *
##  @brief  Init ethernet mac
##
##  @note   config can not be NULL, and phy chip must be suitable to phy init func.
##
##  @param[in] config  mac init data.
##
##  @return
##       - ESP_OK
##       - ESP_FAIL
##

proc esp_eth_init*(config: ptr eth_config_t): esp_err_t {.cdecl,
    importcpp: "esp_eth_init(@)", header: "esp_eth.h".}
## *
##  @brief  Deinit ethernet mac
##
##  @return
##       - ESP_OK
##       - ESP_FAIL
##       - ESP_ERR_INVALID_STATE
##

proc esp_eth_deinit*(): esp_err_t {.cdecl, importcpp: "esp_eth_deinit(@)",
                                 header: "esp_eth.h".}
## *
##  @brief  Init Ethernet mac driver only
##
##  For the most part, you need not call this function directly. It gets called
##  from esp_eth_init().
##
##  This function may be called, if you only need to initialize the Ethernet
##  driver without having to use the network stack on top.
##
##  @note   config can not be NULL, and phy chip must be suitable to phy init func.
##  @param[in] config  mac init data.
##
##  @return
##       - ESP_OK
##       - ESP_FAIL
##

proc esp_eth_init_internal*(config: ptr eth_config_t): esp_err_t {.cdecl,
    importcpp: "esp_eth_init_internal(@)", header: "esp_eth.h".}
## *
##  @brief  Send packet from tcp/ip to mac
##
##  @note   buf can not be NULL, size must be less than 1580
##
##  @param[in] buf:  start address of packet data.
##
##  @param[in] size:  size (byte) of packet data.
##
##  @return
##       - ESP_OK
##       - ESP_FAIL
##

proc esp_eth_tx*(buf: ptr uint8; size: uint16): esp_err_t {.cdecl,
    importcpp: "esp_eth_tx(@)", header: "esp_eth.h".}
## *
##  @brief  Enable ethernet interface
##
##  @note   Should be called after esp_eth_init
##
##  @return
##       - ESP_OK
##       - ESP_FAIL
##

proc esp_eth_enable*(): esp_err_t {.cdecl, importcpp: "esp_eth_enable(@)",
                                 header: "esp_eth.h".}
## *
##  @brief  Disable ethernet interface
##
##  @note   Should be called after esp_eth_init
##
##  @return
##       - ESP_OK
##       - ESP_FAIL
##

proc esp_eth_disable*(): esp_err_t {.cdecl, importcpp: "esp_eth_disable(@)",
                                  header: "esp_eth.h".}
## *
##  @brief  Get mac addr
##
##  @note   mac addr must be a valid unicast address
##
##  @param[out] mac:  start address of mac address.
##

proc esp_eth_get_mac*(mac: array[6, uint8]) {.cdecl,
    importcpp: "esp_eth_get_mac(@)", header: "esp_eth.h".}
## *
##  @brief  Write PHY reg with SMI interface.
##
##  @note  PHY base addr must be right.
##
##  @param[in] reg_num:  PHY reg num.
##
##  @param[in] value: value which is written to PHY reg.
##

proc esp_eth_smi_write*(reg_num: uint32; value: uint16) {.cdecl,
    importcpp: "esp_eth_smi_write(@)", header: "esp_eth.h".}
## *
##  @brief  Read PHY reg with SMI interface.
##
##  @note  PHY base addr must be right.
##
##  @param[in] reg_num:  PHY reg num.
##
##  @return value that is read from PHY reg
##

proc esp_eth_smi_read*(reg_num: uint32): uint16 {.cdecl,
    importcpp: "esp_eth_smi_read(@)", header: "esp_eth.h".}
## *
##  @brief Continuously read a PHY register over SMI interface, wait until the register has the desired value.
##
##  @note PHY base address must be right.
##
##  @param reg_num: PHY register number
##  @param value: Value to wait for (masked with value_mask)
##  @param value_mask: Mask of bits to match in the register.
##  @param timeout_ms: Timeout to wait for this value (milliseconds). 0 means never timeout.
##
##  @return ESP_OK if desired value matches, ESP_ERR_TIMEOUT if timed out.
##

proc esp_eth_smi_wait_value*(reg_num: uint32; value: uint16;
                            value_mask: uint16; timeout_ms: cint): esp_err_t {.
    cdecl, importcpp: "esp_eth_smi_wait_value(@)", header: "esp_eth.h".}
## *
##  @brief Continuously read a PHY register over SMI interface, wait until the register has all bits in a mask set.
##
##  @note PHY base address must be right.
##
##  @param reg_num: PHY register number
##  @param value_mask: Value mask to wait for (all bits in this mask must be set)
##  @param timeout_ms: Timeout to wait for this value (milliseconds). 0 means never timeout.
##
##  @return ESP_OK if desired value matches, ESP_ERR_TIMEOUT if timed out.
##

proc esp_eth_smi_wait_set*(reg_num: uint32; value_mask: uint16; timeout_ms: cint): esp_err_t {.
    cdecl.} =
  discard

## *
##  @brief  Free emac rx buf.
##
##  @note  buf can not be null, and it is tcpip input buf.
##
##  @param[in] buf: start address of received packet data.
##
##

proc esp_eth_free_rx_buf*(buf: pointer) {.cdecl,
                                       importcpp: "esp_eth_free_rx_buf(@)",
                                       header: "esp_eth.h".}
## *
##  @brief  Set mac of ethernet interface.
##
##  @note user can call this function after emac_init, and the new mac address will be enabled after emac_enable.
##
##  @param[in] mac: the Mac address.
##
##  @return
##     - ESP_OK: succeed
##     - ESP_ERR_INVALID_MAC: invalid mac address
##

proc esp_eth_set_mac*(mac: array[6, uint8]): esp_err_t {.cdecl,
    importcpp: "esp_eth_set_mac(@)", header: "esp_eth.h".}
## *
##  @brief Get Ethernet link speed
##
##  @return eth_speed_mode_t ETH_SPEED_MODE_10M when link speed is 10Mbps
##                           ETH_SPEED_MODE_100M when link speed is 100Mbps
##

proc esp_eth_get_speed*(): eth_speed_mode_t {.cdecl,
    importcpp: "esp_eth_get_speed(@)", header: "esp_eth.h".}

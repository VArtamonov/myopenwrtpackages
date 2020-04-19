/*
 *  ABBA test driver
 *
 *  Copyright (C) 2020 VArtamonov <vartamonov@abba.org>
 *
 *  Based on the diag.c - GPIO interface driver for Broadcom boards
 *    Copyright (C) 2006 Mike Baker <mbm@openwrt.org>,
 *    Copyright (C) 2006-2007 Felix Fietkau <nbd@nbd.name>
 *    Copyright (C) 2008 Andy Boyett <agb@openwrt.org>
 *
 *  This program is free software; you can redistribute it and/or modify it
 *  under the terms of the GNU General Public License version 2 as published
 *  by the Free Software Foundation.
 */

#include <linux/module.h>
#include <linux/version.h>
#include <linux/kmod.h>

#include <linux/leds.h>
#include <linux/input.h>
#include <linux/gpio_keys.h>

//#include <linux/interrupt.h>
#include <bcm47xx_board.h>
#include <bcm47xx.h>

//#define DRV_NAME	"abba-dire320-detect"
//#define DRV_VERSION	"0.0.1"
//#define DRV_DESC	"ABBA DIR-320 driver"

struct platform_device *my_gpio_led_register_device(int id, const struct gpio_led_platform_data *pdata);


/**************************************************
 * Database
 **************************************************/

#define BCM47XX_GPIO_LED(_gpio, _color, _function, _active_low,		\
			 _default_state)				\
	{								\
		.name		= "bcm47xx:" _color ":" _function,	\
		.gpio		= _gpio,				\
		.active_low	= _active_low,				\
		.default_state	= _default_state,			\
	}

#define BCM47XX_GPIO_LED_TRIGGER(_gpio, _color, _function, _active_low,	\
				 _default_trigger)			\
	{								\
		.name		= "bcm47xx:" _color ":" _function,	\
		.gpio		= _gpio,				\
		.active_low	= _active_low,				\
		.default_state	= LEDS_GPIO_DEFSTATE_OFF,		\
		.default_trigger	= _default_trigger,		\
	}

#define BCM47XX_GPIO_KEY(_gpio, _code)					\
	{								\
		.code		= _code,				\
		.gpio		= _gpio,				\
		.active_low	= 1,					\
	}

#define BCM47XX_GPIO_KEY_H(_gpio, _code)				\
	{								\
		.code		= _code,				\
		.gpio		= _gpio,				\
	}

/**************************************************
 * Init
 **************************************************/

static struct gpio_led_platform_data bcm47xx_leds_pdata;

#define bcm47xx_set_pdata(dev_leds) do {				\
	bcm47xx_leds_pdata.leds = dev_leds;				\
	bcm47xx_leds_pdata.num_leds = ARRAY_SIZE(dev_leds);		\
} while (0)

static struct gpio_led_platform_data bcm47xx_leds_pdata_extra __initdata = {};
#define bcm47xx_set_pdata_extra(dev_leds) do {				\
	bcm47xx_leds_pdata_extra.leds = dev_leds;			\
	bcm47xx_leds_pdata_extra.num_leds = ARRAY_SIZE(dev_leds);	\
} while (0)

static struct gpio_keys_platform_data bcm47xx_button_pdata;

static struct platform_device bcm47xx_buttons_gpio_keys = {
	.name = "gpio-keys",
	.dev = {
		.platform_data = &bcm47xx_button_pdata,
	}
};

/* Copy data from __initconst */
static int __init bcm47xx_buttons_copy(const struct gpio_keys_button *buttons,
				       size_t nbuttons)
{
	size_t size = nbuttons * sizeof(*buttons);

	bcm47xx_button_pdata.buttons = kmemdup(buttons, size, GFP_KERNEL);
	if (!bcm47xx_button_pdata.buttons)
		return -ENOMEM;
	bcm47xx_button_pdata.nbuttons = nbuttons;

	return 0;
}

#define bcm47xx_copy_bdata(dev_buttons)					\
	bcm47xx_buttons_copy(dev_buttons, ARRAY_SIZE(dev_buttons));


static const struct gpio_keys_button
bcm47xx_buttons_di320_a2[] __initconst = {
	BCM47XX_GPIO_KEY(2, KEY_WPS_BUTTON),
	BCM47XX_GPIO_KEY(3, KEY_RESTART),
};


static const struct gpio_led
bcm47xx_leds_asus_di320_a2[] __initconst = {
	BCM47XX_GPIO_LED(0, "green", "wlan", 0, LEDS_GPIO_DEFSTATE_OFF),
	BCM47XX_GPIO_LED(1, "green", "power", 1, LEDS_GPIO_DEFSTATE_ON),
	BCM47XX_GPIO_LED(3, "red", "wps", 0, LEDS_GPIO_DEFSTATE_OFF),
	BCM47XX_GPIO_LED(4, "blue", "wps", 0, LEDS_GPIO_DEFSTATE_OFF),
	BCM47XX_GPIO_LED(5, "green", "usb", 0, LEDS_GPIO_DEFSTATE_OFF),
//	BCM47XX_GPIO_LED(5, "green", "usb", 0, LEDS_GPIO_DEFSTATE_OFF),
};

int __init bcm47xx_buttons_register(void)
{
//	enum bcm47xx_board board = bcm47xx_board_get();
	int err;

	err = bcm47xx_copy_bdata(bcm47xx_buttons_di320_a2);

	if (err)
		return -ENOMEM;

	err = platform_device_register(&bcm47xx_buttons_gpio_keys);
	if (err) {
		pr_err("Failed to register platform device: %d\n", err);
		return err;
	}

	return 0;
}

void __init bcm47xx_leds_register(void)
{
//	enum bcm47xx_board board = bcm47xx_board_get();

	bcm47xx_set_pdata(bcm47xx_leds_asus_di320_a2);

	my_gpio_led_register_device(-1, &bcm47xx_leds_pdata);
	if (bcm47xx_leds_pdata_extra.num_leds)
		my_gpio_led_register_device(0, &bcm47xx_leds_pdata_extra);
}

static int __init abba_dir320_custom_init(void)
{
	printk(KERN_INFO "ABBA DIR-320 Detect ... \n");
	printk(KERN_INFO DRV_DESC " version " DRV_VERSION "\n");

	bcm47xx_buttons_register();
	bcm47xx_leds_register();

    /*
    * A non 0 return means init_module failed; module can't be loaded.
    */
	return 0;
}

static void __exit abba_dir320__custom_exit(void)
{
	printk(KERN_INFO "ABBA DIR-320 Detect ... \n");
	printk(KERN_INFO DRV_DESC " version " DRV_VERSION "\n");
}


MODULE_LICENSE("GPL");
//MODULE_AUTHOR("ABBA 2020");
//MODULE_DESCRIPTION(DRV_DESC);
//MODULE_VERSION(DRV_VERSION);

module_init(abba_dir320_custom_init);
module_exit(abba_dir320__custom_exit);

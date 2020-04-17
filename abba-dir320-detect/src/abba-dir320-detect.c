/*
* hello−1.c − The simplest kernel module.
*/
#include <linux/module.h> /* Needed by all modules */
#include <linux/kernel.h> /* Needed for KERN_INFO */

#include <linux/leds.h>
#include <bcm47xx_board.h>

#define DRV_NAME	"abba-dire320-test"
#define DRV_VERSION	"0.0.1"
#define DRV_DESC	"ABBA DIR-320 driver"

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

int __init bcm47xx_buttons_register(void)
{
	enum bcm47xx_board board = bcm47xx_board_get();
	int err;
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
	enum bcm47xx_board board = bcm47xx_board_get();

	gpio_led_register_device(-1, &bcm47xx_leds_pdata);
	if (bcm47xx_leds_pdata_extra.num_leds)
		gpio_led_register_device(0, &bcm47xx_leds_pdata_extra);
}


int init_module(void)
{
	printk(KERN_INFO "Hello world 1.\n");
	bcm47xx_buttons_register();
	bcm47xx_leds_register();

    /*
    * A non 0 return means init_module failed; module can't be loaded.
    */
	return 0;
}

void cleanup_module(void)
{
printk(KERN_INFO "Goodbye world 1.\n");
}

MODULE_LICENSE("GPL v2");
MODULE_AUTHOR("ABBA 2020");
MODULE_DESCRIPTION(DRV_DESC);
MODULE_VERSION(DRV_VERSION);

/*
 *  ABBA DIR-320 driver
 *
 *  Copyright (C) 2020 VArtamonov <vartamonov@abba.org>
 *
 */

#include <linux/module.h>
#include <linux/version.h>
#include <linux/kmod.h>

#define DRV_NAME	"abba-dire320-detect"
#define DRV_VERSION	"0.0.1"
#define DRV_DESC	"ABBA DIR-320 driver"

static int __init abba_dir320_custom_init(void)
{
	printk(KERN_INFO "ABBA DIR-320 Detect ... \n");
	printk(KERN_INFO DRV_DESC " version " DRV_VERSION "\n");

//	bcm47xx_buttons_register();
//	bcm47xx_leds_register();

    /*
    * A non 0 return means init_module failed; module can't be loaded.
    */
	return 0;
}

static void __exit abba_dir320_custom_exit(void)
{
	printk(KERN_INFO "ABBA DIR-320 Detect ... \n");
	printk(KERN_INFO DRV_DESC " version " DRV_VERSION "\n");
}

module_init(abba_dir320_custom_init);
module_exit(abba_dir320_custom_exit);

MODULE_LICENSE("MIT");
MODULE_AUTHOR("ABBA 2020");
MODULE_DESCRIPTION(DRV_DESC);
MODULE_VERSION(DRV_VERSION);

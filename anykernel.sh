### AnyKernel3 Ramdisk Mod Script
## osm0sis @ xda-developers
# kernel changes by mmtrt

### AnyKernel setup
# begin properties
properties() { '
kernel.string=kernel for everpal
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=evergo
device.name2=evergreen
device.name3=opal
device.name4=everpal
device.name5=
supported.versions=11 - 13
'; } # end properties

### AnyKernel install
# begin attributes
attributes() {
set_perm_recursive 0 0 755 644 $ramdisk/*;
set_perm_recursive 0 0 750 750 $ramdisk/init* $ramdisk/sbin;
} # end attributes


## boot shell variables
block=/dev/block/by-name/boot;
is_slot_device=1;
ramdisk_compression=auto;
patch_vbmeta_flag=auto;

# import functions/variables and setup patching - see for reference (DO NOT REMOVE)
. tools/ak3-core.sh && attributes;

# boot install
dump_boot; # use split_boot to skip ramdisk unpack, e.g. for devices with init_boot ramdisk

write_boot;
## end boot install

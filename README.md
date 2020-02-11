Docker PHP
==========

For each version avaliable there is a branch related, we must try to keep then with the some dependencies when possible.

Branch naming rules:

 * `/^[0-9\.]+/` => PHP cli versions, must have the same dependencies as its related images (v9.99-apache, v9.99-fpm)
 * `/^[0-9\.]+-apache/` => Apache with PHP
 * `/^[0-9\.]+-fpm/` => PHP-FPM version
 * `/^[0-9\.]+-\w+-with-.*/` => A variation of the `v9.99-(apache|fpm)` with some extra dependencie or detail.

package OMV::PluginTemplate::Methods;
# $Id$

use strict;
use warnings;
use MT;

use vars qw( $VENDOR $MYNAME $FULLNAME );
$FULLNAME = join '::',
        (($VENDOR, $MYNAME) = (split /::/, __PACKAGE__)[0, 1]);

sub instance { MT->component($FULLNAME); }



### omv_sample_methods
sub omv_sample_methods {
    my ($app) = @_;

    ...
}

1;
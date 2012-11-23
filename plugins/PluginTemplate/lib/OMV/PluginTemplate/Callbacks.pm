package OMV::PluginTemplate::Callbacks;
# <ProductName> (C) <Year> Piroli YUKARINOMIYA (Open MagicVox.net)
# This program is distributed under the terms of the GNU General Public License, version 3.
# This program is distributed under the terms of the GNU Lesser General Public License, version 3.
# $Id$

use strict;
use warnings;
use MT;

use vars qw( $VENDOR $MYNAME $FULLNAME );
$FULLNAME = join '::',
        (($VENDOR, $MYNAME) = (split /::/, __PACKAGE__)[0, 1]);

sub instance { MT->component($FULLNAME); }



### MT::App::CMS::template_source.edit_entry
sub template_source_edit_entry {
    my ($cb, $app, $tmpl) = @_;

    ...
}

### MT::App::CMS::template_param.edit_entry
sub template_param_edit_entry {
    my ($cb, $app, $param) = @_;

    ...
}

1;
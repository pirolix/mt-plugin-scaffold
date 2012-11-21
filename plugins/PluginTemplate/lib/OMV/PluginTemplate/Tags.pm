package OMV::PluginTemplate::Tags;
# <ProductName> (C) <Year> Piroli YUKARINOMIYA (Open MagicVox.net)
# This program is distributed under the terms of the GNU General Public License, version 3.
# This program is distributed under the terms of the GNU Lesser General Public License, version 3.
# $Id$

use strict;
use warnings;
use MT;

sub instance { MT->component((__PACKAGE__ =~ /^(\w+::\w+)/g)[0]); }



### mt:Block
sub Block {
    my ($ctx, $args, $cond) = @_;

    my $token = $ctx->stash ('tokens');
    my $builder = $ctx->stash ('builder');
    my $vars = $ctx->{__stash}{vars} ||= {};

    my $block_out;
    while (...) {
        defined(my $out = $builder->build ($ctx, $token, {
                %$cond,
#                DateHeader => ( $this_day ne $last_day ),
#                DateFooter => $footer,
#                EntriesHeader => !$i,
#                EntriesFooter => !defined $entries[ $i + 1 ],
#                PagesHeader   => !$i,
#                PagesFooter   => !defined $entries[ $i + 1 ],
        })) or return $ctx->error ($builder->errstr);
        $block_out .= $out;
    }
    return $block_out;
}

### mt:Condition
sub Condition {
    my ($ctx, $args) = @_;

    return rand(2) % 2;
}

### mt:Func
sub Func {
    my ($ctx, $args) = @_;

    return __LINE__;
}

1;
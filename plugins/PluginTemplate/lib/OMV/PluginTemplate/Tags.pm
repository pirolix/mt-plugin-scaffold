package OMV::PluginTemplate::Tags;
# $Id$

use strict;
use warnings;
use MT;

use vars qw( $VENDOR $MYNAME $FULLNAME );
$FULLNAME = join '::',
        (( $VENDOR, $MYNAME ) = (split /::/, __PACKAGE__)[0, 1]);

sub instance { MT->component( $FULLNAME ); }



### mt:Block block tag
sub Block {
    my( $ctx, $args, $cond ) = @_;

    my $token = $ctx->stash( 'tokens' );
    my $builder = $ctx->stash( 'builder' );
    my $vars = $ctx->{__stash}{vars} ||= {};

    my $block_out;
    while( 1 ) {
        defined( my $out = $builder->build( $ctx, $token, {
                %$cond,
#                DateHeader => ( $this_day ne $last_day ),
#                DateFooter => $footer,
#                EntriesHeader => !$i,
#                EntriesFooter => !defined $entries[ $i + 1 ],
#                PagesHeader   => !$i,
#                PagesFooter   => !defined $entries[ $i + 1 ],
        })) or return $ctx->error( $builder->errstr );
        $block_out .= $out;
    }
    return $block_out;
}

### mt:Condition? conditional block tag
sub Condition {
    my( $ctx, $args ) = @_;

    return rand(2) % 2;
}

### $mt:Func$ function tag
sub Func {
    my( $ctx, $args ) = @_;

    return __LINE__;
}

1;
package MT::Plugin::HogeHoge::OMV::PluginTemplate;
# <ProductName> (C) <Year> Piroli YUKARINOMIYA (Open MagicVox.net)
# This program is distributed under the terms of the GNU General Public License, version 3.
# This program is distributed under the terms of the GNU Lesser General Public License, version 3.
# $Id$

use strict;
use warnings;
use MT 5;

use vars qw( $VENDOR $MYNAME $FULLNAME $VERSION );
$FULLNAME = join '::',
        (($VENDOR, $MYNAME) = (split /::/, __PACKAGE__)[-2, -1]);
$VERSION = 'v0.10.$WCREV$';
use vars qw( $SCHEMA_VERSION );
$SCHEMA_VERSION = 0.01_000;

# http://www.sixapart.jp/movabletype/manual/object_reference/archives/mt_plugin.html
use base qw( MT::Plugin );
my $plugin = __PACKAGE__->new ({
    # Basic descriptions
    id => $FULLNAME,
    key => $FULLNAME,
    name => $MYNAME,
    version => $VERSION,
    schema_version => $SCHEMA_VERSION,
    author_name => 'Open MagicVox.net',
    author_link => 'http://www.magicvox.net/',
    plugin_link => 'http://www.magicvox.net/archive/YYYY/MMDDhhmm/', # Blog
    doc_link => "http://lab.magicvox.net/trac/mt-plugins/wiki/$MYNAME", # tracWiki
    description => <<'HTMLHEREDOC',
<__trans phrase="Description">
HTMLHEREDOC
    l10n_class => "${FULLNAME}::L10N",

    # Configurations
    system_config_template => "$VENDOR/$MYNAME/config.tmpl",
    blog_config_template => "$VENDOR/$MYNAME/config.tmpl",
    config_template => "$VENDOR/$MYNAME/config.tmpl",
    settings => new MT::PluginSettings ([
        [ 'name', { Default => undef, scope => 'system' } ],
        [ 'name', { Default => undef, scope => 'blog' } ],
    ]),

    # Registry
    registry => {
        tags => {
            help_url => "http://lab.magicvox.net/trac/mt-plugins/wiki/$MYNAME#tag-%t",
            function => {
                hoge => sub { my ($ctx, $args) = @_; },
                hoge => "${FULLNAME}::Tags::callback_handler",
            },
            block => {
                fuga => sub { my ($ctx, $args, $cond) = @_; },
                'piyo?' => sub { my ($ctx, $args, $cond) = @_; },
                hoge => "${FULLNAME}::Tags::callback_handler",
            },
            modifier => {
                hogera => sub { my ($ctx, $args) = @_; },
                hoge => "${FULLNAME}::Tags::callback_handler",
            },
        },

        text_filters => {
            $MYNAME => {
                label => $MYNAME,
                handler => sub { my ($str, $ctx) = @_; $str; },
                condition => sub {
                    my ($type) = @_;
                    return 1 if $type && ($type ne 'comment');
                },
            },
        },

        applications => {
            cms => {
                callbacks => {
                    _MyTestCallback => "${FULLNAME}::Callbacks::callback_handler",
                },
                methods => {
                    $MYNAME => \&_hdlr_test_callback,
                    $MYNAME => "${FULLNAME}::Methods::hogehoge",
                },
            },
        },

        callbacks => {
            _MyTestCallback => "${FULLNAME}::Callbacks::callback_handler",
            _MyTestCallback => sub {
                my ($cb, $app) = @_;
#                $app->log (__LINE__);
#                $app->log (ref $cb);
#                return 0;
#               return undef;
#                return $cb->error (__LINE__);
#                return 1;
                return 'hoge';
            },
        },
    },
});
MT->add_plugin ($plugin);

sub instance { $plugin; }

###
sub _hdlr_test_callback {
    my ($app) = @_;

    my $ret = $app->run_callbacks ('MyTestCallback', $app);

    use Data::Dumper;
    return Dumper ($ret);
}

###
sub template_source_modify {
    my ($cb, $app, $tmpl) = @_;
}

1;
__END__

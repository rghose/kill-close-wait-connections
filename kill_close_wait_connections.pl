use strict;
use Socket;
use Net::RawIP;
use Net::Pcap;
use NetPacket::Ethernet qw(:strip);
use NetPacket::IP qw(:strip);
use NetPacket::TCP;
use POSIX qw(setsid);


my $num_args = $#ARGV + 1;
if ($num_args != 4) {
	print "\nUsage: wrong\n";
	exit;
}

my $src_ip=$ARGV[0];
my $src_port=$ARGV[1];
my $dst_ip=$ARGV[2];
my $dst_port=$ARGV[3];

my $packet = Net::RawIP->new({
		ip => {  frag_off => 0, tos => 0,
		saddr => $dst_ip, daddr => $src_ip
		},
		tcp =>{  dest => $src_port, source => $dst_port,
		seq => 10, ack => 1
		}
		});
$packet->send;

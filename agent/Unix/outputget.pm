###############################################################################
## OCSINVENTORY-NG
## Copyleft Léa DROGUET 2020
## Web : http://www.ocsinventory-ng.org
##
## This code is open source and may be copied and modified as long as the source
## code is always made freely available.
## Please refer to the General Public Licence http://www.gnu.org/ or Licence.txt**
################################################################################

package Ocsinventory::Agent::Modules::OutputGet;


sub new {
    my $name="outputget";   #Set the name of your module here
    

    my (undef,$context) = @_;
    my $self = {};

    #Create a special logger for the module
    $self->{logger} = new Ocsinventory::Logger ({
        config => $context->{config}
    });

    $self->{logger}->{header}="[$name]";

    $self->{context}=$context;

    $self->{structure}= {
        name => $name,
        start_handler => undef, #$name."_start_handler",    #or undef if don't use this hook 
        prolog_writer => undef, #$name."_prolog_writer",    #or undef if don't use this hook  
        prolog_reader => undef, #$name."_prolog_reader",    #or undef if don't use this hook  
        inventory_handler => $name."_inventory_handler",    #or undef if don't use this hook 
        end_handler => undef #$name."_end_handler"    #or undef if don't use this hook 
    };
 
    bless $self;
}



######### Hook methods ############

# sub outputget_start_handler {     #Use this hook to test prerequisites needed by module and disble it if needed
#     my $self = shift;
#     my $logger = $self->{logger};
    
#     $logger->debug("Yeah you are in example_start_handler :)");
#     my $prerequisites = 1 ;

#     if ( $prerequisites == 0 ) { 
#         $self->{disabled} = 1; #Use this to disable the module
#         $logger->debug("Humm my prerequisites are not OK...disabling module :( :( ");
#     }
# }


# sub outputget_prolog_writer {    #Use this hook to add information the prolog XML
#     my $self = shift;
#     my $logger = $self->{logger};
    
#     $logger->debug("Yeah you are in example_prolog_writer :)");

# }


# sub outputget_prolog_reader {    #Use this hook to read the answer from OCS server
#     my $self = shift;
#     my $logger = $self->{logger};
    
#     $logger->debug("Yeah you are in example_prolog_reader :)");

# }


sub outputget_inventory_handler {
    my $self = shift;
    my $logger = $self->{logger};
    my $common = $self->{context}->{common};

    $logger->debug("Yeah you are in outputget_inventory_handler :)");

    # sub-rotina para verificar se o diretório existe e criar, se necessário
    sub check {
        my $params = shift;
        my $common = $params->{common};

        unless (-d "/var/lib/ocsinventory-agent/outputget") {
            mkdir("/var/lib/ocsinventory-agent/outputget") || die "Não foi possível criar o diretório /var/lib/ocsinventory-agent/outputget: $!";
        }

        $common->can_read("/var/lib/ocsinventory-agent/outputget/*");
    }

    # verificar e criar diretório de saída
    check({ common => $common });

    # listar arquivos dentro do diretório
    my @files = glob("/var/lib/ocsinventory-agent/outputget/*");

    # acessar cada arquivo, ler seu conteúdo e adicionar informações ao arquivo XML de inventário
    foreach my $file (@files) {
        my $filename = (split('/', $file))[-1]; # extrair o nome do arquivo sem o caminho
        $logger->debug($filename);
        open(my $fh, '<', $file) or die "Não foi possível abrir o arquivo $file: $!";
        my $content = do { local $/; <$fh> }; # ler todo o conteúdo do arquivo
        close($fh);

        push @{$common->{xmltags}->{OUTPUTGET}},
        {
            FILE_NAME  => [$filename],
            OUTPUT_RESULT  => [$content],
        };
    }
}



# sub outputget_end_handler { #Use this hook to add treatments before the end of agent launch
#     my $self = shift;
#     my $logger = $self->{logger};
    
#     $logger->debug("Yeah you are in example_end_handler :)");

# }

1;

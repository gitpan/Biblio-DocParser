use Module::Build;

Module::Build->new
	( 
		module_name => 'Biblio::DocParser', 
		license => 'gpl', 
		requires => {
				'HTML::HeadParser' => 0,
				'LWP::UserAgent' => 0,
				'File::Temp' => 0,
			},
	)->create_build_script;



use Locale::Country::Multilingual;
use strict;

my %LAENDER=(
	'afghan'	=> 'AF',
	'alabama'	=> 'US',
	'alaska'	=> 'US',
	'albania'	=> 'AL',
	'albanian'	=> 'AL',
	'albanisch'	=> 'AL',
	'algerian'	=> 'DZ',
	'algeria'	=> 'DZ',
	'algerisch'	=> 'DZ',
	'amsterdam'	=> 'NL',
	'american'	=> 'US',
	'antwerp'	=> 'BE',
	'argentina'	=> 'AR',
    'argentinisch'	=> 'AR',
    'argentine'	=> 'AR',
    'argentine'	=> 'AR',
	'argentinian'	=> 'AR',
	'arizona'	=> 'US',
	'arkansas'	=> 'US',
	'armenian'	=> 'AM',
    'armenisch'     => 'AM',
    'aserbaidschan' => 'AZ',
    'aserbaidschanisch' => 'AZ',

    'australian'	=> 'AU',
	'australisch'	=> 'AU',
	'austrian'	=> 'AT',
	'american'	=> 'US',
	'amerikanisch'	=> 'US',
	'ägyptisch'	=> 'EG',
	'äthiopisch'   => 'ET',
	'the bahamas|bahamas'	=> 'BS',
	'badisch'	=> 'DE',
        'bahamas'	=> 'BS',
	'bangladesh' => 'BD',
	'bangladeshi' => 'BD',
	'bahrani'	=> 'BH',
	'bavaria'	=> 'DE',
	'bayerisch'	=> 'DE',
	'belarus'	=> 'BY',
	'belarusian'	=> 'BY',
	'belgian'	=> 'BE',
	'belgisch'	=> 'BE',
	'belgium'	=> 'BE',
	'benin'		=> 'BJ',
	'bolivian'	=> 'BO',
	'bosnia'	=> 'BA',
	'bosnian'	=> 'BA',
	'bosnien'	=> 'BA',
	'bosnisch'	=> 'BA',
	'botswana'	=> 'BW',
	'böhmisch'	=> 'CZ2',
	'brasilianisch'	=> 'BR',
	'brasilien'	=> 'BR',
	'brazilian'	=> 'BR',
	'britisch'	=> 'GB',
	'british'	=> 'GB',
	'brooklyn'	=> 'US',
	'budapest'	=> 'HU',
	'bulgaria'	=> 'BG',
	'bulgarisch'	=> 'BG',
	'bulgarian'	=> 'BG',
	'burundi'	=> 'BI',
	'calcutta'	=> 'IN',
	'california'	=> 'US',
	'cameroonian'	=> 'CM',
	'canada'	=> 'CA',
	'canadian'	=> 'CA',
	'catalan'	=> 'ES2',
	'cheshire'	=> 'GB',
	'chicago'	=> 'US',
	'chilean'	=> 'CL',
	'chilenisch'	=> 'CL',
	'china'	=> 'CN',
        'chinesisch'	=> 'CN',
        'chinese'	=> 'CN',
	'colombian'	=> 'CO',
	'colorado'	=> 'US',
	'congo dr'	=> 'CD',
	'connecticut'		=> 'US',
	'cornwall'	=> 'GB',
	'côte d\'ivoire'	=> 'CI',
	'croatia'	=> 'HR',
	'croatian'	=> 'HR',
	'cuba'		=> 'CU',
	'cuban'		=> 'CU',
	'cypriot'	=> 'CY',
	'czech'	=> 'CZ',
	'czechoslovakia'	=> 'CZ',
	'dalmatia'	=> 'HR1',
	'danish'	=> 'DK',
	'dänisch'	=> 'DK',
	'democratic republic of the congo'	=> 'CD',
	'deutsch'	=> 'DE',
	'deutschland'	=> 'DE',
	'devon'		=> 'GB',
	'dominican republic'	=> 'DO',
        'dominikanisch'	=> 'DO',
	'dubai'		=> 'AE',
	'dutch'		=> 'NL',
	'ecuadorian'	=> 'EC',
	'estnisch'	=> 'EE',
	'estonia'	=> 'EE',
	'estonian'	=> 'EE',
	'egyptian'	=> 'EG',
	'england'	=> 'GB',
	'english'	=> 'GB',
	'englisch'	=> 'GB',
	'equatoguinean'	=> 'GQ',
	'faroese'	=> 'FO',
	'färöisch'	=> 'FO',
	'filipino'	=> 'PH',
	'finnish'	=> 'FI',
	'finnisch'	=> 'FI',
	'flämisch'	=> 'BE2',
	'florida'	=> 'US',
	'france'	=> 'FR',
	'frankreich'	=> 'FR',
	'französisch'	=> 'FR',
	'french'	=> 'FR',
	'gaelic'	=> 'GD',
	'georgia'	=> 'GE',
	'georgian ssr'	=> 'GE',
	'germany'	=> 'DE',
	'german'	=> 'DE',
	'ghana'		=> 'GH',
	'ghanaian'		=> 'GH',
	'gifu'		=> 'JP',
	'greek'		=> 'GR',
	'griechisch'		=> 'GR',
	'grossbritannien'	=> 'UK',
	'guatemala'	=> 'GT',
	'hamburg' => 'DE',
     'haryana'	=> 'IN',
	'heidelberg'	=> 'DE',
	'herzegovina'	=> 'BA',
	'honduran'	=> 'HN',
	'hungarian'	=> 'HU',
	'icelandic'	=> 'IS',
	'illinois'	=> 'US',
	'indian'	=> 'IN',
	'indisch'	=> 'IN',
	'indiana'	=> 'US',
	'indonesian'	=> 'ID',
        'indonesisch'	=> 'ID',
	'iowa'		=> 'US',
	'iranisch'	=> 'IR',
	'iranian'	=> 'IR',
	'republic of ireland'	=> 'IE',
	'irakisch'		=> 'IQ',
	'iraqi'		=> 'IQ',
	'irish free state'	=> 'IE',
	'irish'		=> 'IE',
	'irisch'		=> 'IE',
	'isländisch'	=> 'IS',
	'israeli'	=> 'IL',
	'italian'	=> 'IT',
        'italien'	=> 'IT',
	'italienisch'	=> 'IT',
	'italy'	=> 'IT',
	'jamaican'	=> 'JM',
        'jamaikanisch'	=> 'JM',
	'japanese'	=> 'JP',
	'japanisch'	=> 'JP',
	'jordan'	=> 'JO',
	'jugoslawien'	=> 'YU',
	'sfr jugoslawien'	=> 'YU',
	'sfr'	=> 'YU',
	'jugoslawisch'	=> 'YU',
	'kamerunisch'	=> 'CM',
	'kanada'	=> 'CA',
	'kanadisch'	=> 'CA',
	'kansas'	=> 'US',
	'kashubian'	=> 'PL2',
	'katalanisch'	=> 'ES2',
	'kazakhstani'	=> 'KZ',
	'kentucky'	=> 'US',
	'kenyan'	=> 'KE',
	'kenianisch'	=> 'KE',
	'kingdom of yugoslavia'=>'YU',
	'kolumbianisch'	=> 'CO',
	'kolumbisch'	=> 'CO',
	'komoros'	=> 'KM',
	'komorisch'	=> 'KM',
	'kroatisch'	=> 'HR',
        'kubanisch'  => 'CU',
        'kurdisch'	=> 'TU2',
	'latvian'	=> 'LT',
	'litauisch'	=> 'LT',
	'lebanese'	=> 'LB',
	'libanesisch'	=> 'LB',
	'liberian'	=> 'LR',
	'liechtensteinisch'	=> 'LI',
	'lithuanian'=> 'LT',
	'london'	=> 'GB',
	'los angeles'	=> 'US',
	'louisiana'	=> 'US',
	'luxembourgian' => 'LU',
	'luxemburgisch' => 'LU',
	'federal people\'s republic of yugoslavia|yugoslavia'=>'YU',
	'macedonian'	=> 'MK',
	'mazedonisch'	=> 'MK',
	'malagasy'	=> 'MG',
	'malaysian'	=> 'MG',
	'maltesisch'	=> 'MT',
	'maine'	=> 'US',
	'marokkanisch'	=> 'MA',
	'maryland'	=> 'US',
	'massachusetts'	=> 'US',
	'mexikanisch'	=> 'MX',
	'méxico'	=> 'MX',
	'mexico'	=> 'MX',
	'mexiko'	=> 'MX',
	'mexican'	=> 'MX',
	'melbourne'	=> 'AU',
	'michigan'	=> 'US',
	'minnesota'	=> 'US',
	'mississippi'	=> 'US',
	'missouri'	=> 'US',
	'moldavisch'	=> 'MD',
	'moldova'	=> 'MD',
	'moldovan'	=> 'MD',
	'montenegrin'	=> 'ME',
	'moroccan'		=> 'MA',
	'munich'	=> 'DE',
'münchen'  => 'DE',
        'namibian'	=> 'NA',
	'namibisch'	=> 'NA',
	'namibia'	=> 'NA',
	'nebraska'	=> 'US',
	'nepal'		=> 'NP',
	'netherlands antilles'	=> 'AN',
	'new jersey'	=> 'US',
	'new york city'	=> 'US',
	'new york'	=> 'US',
	'new zealand'	=> 'NZ',
	'neuseeländisch'	=> 'NZ',
	'new south wales'	=> 'AU',
	'nicaraguan'	=> 'NI',
	'niederdeutsch'	=> 'DE',
	'niederländisch'	=> 'NL',
	'niederlande'	=> 'NL',
	'nigerian'	=> 'NG',
	'northamptonshire'	=> 'GB',
	'north carolina'	=> 'US',
	'north korean'	=> 'KP',
	'northern ireland'	=> 'GB2',
	'northern irish'	=> 'GB2',
	'north wales'	=> 'GB3',
	'northrhine-westphalia'=>'DE',
	'norwegian'	=> 'NO',
	'norwegisch'	=> 'NO',
	'ohio'=>'US',
	'oklahoma'=>'US',
	'ontario'=>'CA',
	'oregon'=>'US',
	'österreich'	=> 'AT',
	'österreichisch'	=> 'AT',
	'omani'	=> 'OM',
	'palestinian'	=> 'PS',
	'palästinensisch'	=> 'PS',
	'karachi'		=> 'PK',
	'pakistan'		=> 'PK',
	'pakistani'		=> 'PK',
	'pakistanisch'		=> 'PK',
	'pennsylvania'	=> 'US',
	'peruanisch'	=> 'PE',
	'peruvian'	=> 'PE',
	'philippinisch'	=> 'PH',
        'polish'	=> 'PL',
	'polnisch'	=> 'PL',
	'portugiesisch'	=> 'PT',
	'portuguese'	=> 'PT',
	'preussisch'	=> 'DE2',
        'preußisch'	=> 'DE2',
	'puerto rico'	=> 'US',
	'puerto rican'	=> 'US',
	'quebec'	=> 'CA',
	'republik kongo'	=> 'CD',
	'rhode island'	=> 'US',
	'romanian'	=> 'RO',
	'rumänisch'	=> 'RO',
	'russian'	=> 'RU',
	'russisch'	=> 'RU',
	'saudi arabian'	=> 'SA',
        'saudi-arabisch'	=> 'SA',
	'sächsisch'	=> 'DE',
	'edinburgh'	=> 'GB3',
	'schottland'	=> 'GB3',
	'schweden'	=> 'SE',
	'schwedisch'	=> 'SE',
	'schweizer'	=> 'CH',
	'scotland'	=> 'GB3',
	'scottish'	=> 'GB3',
	'schottisch'	=> 'GB3',
	'senegal'	=> 'SN',
	'simbabwe'	=> 'ZW',
	'simbabwisch'	=> 'ZW',
	'sfr yugoslavia'	=> 'YU',
	'socialist federal republic of yugoslavia|yugoslavia'	=> 'YU',
	'fpr yugoslavia'	=> 'YU',
	'salvadoran'	=> 'SV',
	'serbian'	=> 'RS',
	'serbisch'	=> 'RS',
	'sierra leonean'	=> 'SL',
	'singaporean'		=> 'SG',
	'slovak'	=> 'SK',
	'slovakia'	=> 'SK',
	'slowakisch'	=> 'SK',
	'slovenia'	=> 'SI',
	'slowenisch'	=> 'SI',
	'slovenian'	=> 'SI',
	'durban'	=>	'ZA',
	'southper  african'	=>	'ZA',
	'south africa'	=>	'ZA',
	'south australia'	=> 'AU',
	'south carolina'	=> 'US',
	'south korean'	=>	'KR',
	'südafrikanisch'	=>	'ZA',
	'südkoreanisch'	=>	'KR',
	'soviet'	=> 'RU1',
	'sowjetisch'	=> 'RU1',
	'spanisch'	=> 'ES',
	'spanish'		=> 'ES',
	'sri lanka'	=> 'LK',
	'stuttgar'	=> 'DE',
	'sudan'	=> 'SD',
	'sudanese'	=> 'SD',
	'south sudanese'	=> 'SD',
	'surrey'	=> 'GB',
	'swedish'	=> 'SE',
	'swiss'		=> 'CH',
	'sydney'	=> 'AU',
	'syrian'	=> 'SY',
	'syrisch'	=> 'SY',
	'tahiti'	=> 'PF',
	'tahitian'	=> 'PF',
	'tanzania'	=> 'TZ',
	'tanzanian'	=> 'TZ',
	'texas'	=> 'US',
	'tennessee'	=> 'US',
	'taiwanese'	=> 'TW',
	'taiwan'	=> 'TW',
	'taiwan (chinese taipei)'	=> 'TW',
	'thai'		=> 'TH',
	'toronto'	=> 'CA',
	'trinidad and tobago'	=> 'TT',
	'tschechisch'	=> 'CZ',
        'tschechoslowakisch'  => 'CZ2',
        'tunesisch'	=> 'TN',
        'tunisian'	=> 'TN',
	'turkish'	=> 'TU',
	'türkisch'	=> 'TU',
	'turkmenistan'	=> 'TM',
	'uganda'	=> 'UG',
	'ukrainian'	=> 'UA',
	'ungarisch'	=> 'HU',
	'united kingdom of great britain and ireland|uk'	=> 'GB',
	'united states' => 'US',
	'united states|usa' => 'US',
	'uruguayan'	=> 'UY',
	'uruguayisch'	=> 'UY',
	'us-amerikanisch'	=> 'US',
	'u.s.a.'	=> 'US',
	'u.s.'	=> 'US',
	'u.s.a'	=> 'US',
	'usa'	=> 'US',
	'ussr'			=> 'RU1',
	'usbekisch'	=> 'UZ',
	'uzbekistan'	=> 'UZ',
	'uzbekistani'	=> 'UZ',

	'vancouver'	=> 'CA',
	'vanuatuan'	=> 'VU',
	'venezuelan'	=> 'VE',
	'vereinigte staaten'	=> 'US',
        'vereinigtes königreich von grossbritannien und irland'  => 'GB',
        'verona'	=> 'IT',
	'vietnamese'	=> 'VN',
	'virginia'	=> 'US',
	'wales'		=> 'GB3',
	'washington'	=> 'US',
	'welsh'	=> 'GB3',
	'west germany'	=> 'DE',
	'west virginia'	=> 'US',
	'wisconsin'	=> 'US',
	'yemen'	=> 'YE',
	'yemeni'	=> 'YE',
	'yorkshire'	=> 'GB',
	'yugoslav'=>'YU',
	'yugoslavian'=>'YU',
	'zaire'	=> 'CD2',
	'zimbabwean'	=> 'ZW',
);

my %BERUFE_EN=(
	'academic'				=> '_next',
	'activist'				=> '_next',
	'actor'					=> 'Kultur:Film:Schauspieler',
	'actress'				=> 'Kultur:Film:Schauspieler',
	'alpine skier' =>	'Sport:Ski:Alpine',
	'architect'				=> 'Kultur:Architekt',
	'army general'		=>'_next',
	'army officer'		=>'_next',
	'art historian'			=> 'Kultur:Kunsthistoriker',
	'badminton player'	=> 'Sport:Badminton',
	'ballet dancer'	=> 'Kultur:Ballett',
	'bank robber'	=> 'Sonstige:Verbrecher:Bankräuber',
	'baseball player'		=> 'Sport:Baseball',
	'beauty pageant winner'	=> 'Sonstige:Schönheitskönigin',
	'businessman'			=> '_next',
	'businesswoman'			=> '_next',
	'businessperson'			=> '_next',

);

my %BERUFE=(
	'abgeordnete zum nationalrat'	=> 'Sonstige:Politik:Allgemein',
	'abgeordneter'	=> 'Sonstige:Politik:Allgemein',
	'adlige'	=> 'Sonstige:Adel',
	'adliger'	=> 'Sonstige:Adel',
	'adeliger'	=> 'Sonstige:Adel',
	'adeliger'	=> 'Sonstige:Adel',
	'adelige'	=> 'Sonstige:Adel',
	'admiral'				=> '_next',
	'aktionskünstler'	=> 'Kultur:Kunst',
	'alpinist'	=> 'Sport:Bergsteiger',
	'althistoriker'		=> 'Sonstige:Wissenschaft:Historiker',
	'american-football-spieler'=>'Sport:American Football',
	'animator'	=> '_next',
	'archäologe'	=> 'Sonstige:Wissenschaft:Archäologie',
	'archäologin'	=> 'Sonstige:Wissenschaft:Archäologie',
	'architekt'				=> 'Kultur:Architekt',
	'Ärztin'	=> 'Sonstige:Wissenschaft:Arzt',
	'volkskundler'		=>'_next',
	'arzt für'	=> 'Sonstige:Wissenschaft:Arzt',
	'arzt'	=> 'Sonstige:Wissenschaft:Arzt',
	'astronom'			=> 'Sonstige:Wissenschaft:Astronomie',
	'astronomer'			=> 'Sonstige:Wissenschaft:Astronomie',
	'astronaut'			=> 'Sonstige:Wissenschaft:Astronaut',
	'astrophysiker'			=> 'Sonstige:Wissenschaft:Astrophysik',
	'attentäter'=>'Sonstige:Verbrecher:Attentäter',
	'aussenminister'=>'Sonstige:Politik:Minister',
	'author'				=> 'Kultur:Literatur:Schriftsteller',
	'automobilrennfahrer'	=> 'Sport:Rennfahrer',
	'autor'				=> 'Kultur:Literatur:Schriftsteller',
	'b-sängerin'	=> 'Kultur:Musik:Sänger',
	'badmintonspieler'	=> 'Sport:Badminton',
	'bahnradsportler'	=> 'Sport:Radrennen',
    'bahnradrennfahrer'	=> 'Sport:Radrennen',
	'balletttänzerin'	=> 'Kultur:Ballett',
	'bandleader'	=> 'Kultur:Musik',
	'country- und pop-sängerin' => 'Kultur:Musik',
	'bankräuber'	=> 'Sonstige:Verbrecher:Bankräuber',
	'baseballspieler'		=> 'Sport:Baseball',
	'basketballspieler'		=> 'Sport:Basketball',
    'basketball-nationalspieler'		=> 'Sport:Basketball',
	'bassist'				=> 'Kultur:Musik:Gitarre:Bass',
	'bass guitarist'				=> 'Kultur:Musik:Gitarre:Bass',
	'beach volleyball'		=> 'Sport:Beachvolleyball',
	'beachvolleyballspieler'		=> 'Sport:Beachvolleyball',
	'bergsteiger'	=> 'Sport:Bergsteiger',
	'betrüger'	=> 'Sonstige:Verbrecher:Betrüger',
	'biathlet'	=> 'Sport:Ski:Biathlon',
	'biathlete'	=> 'Sport:Ski:Biathlon',
	'bildender künstler'	=> 'Kultur:Kunst',
	'bildende künstlerin'	=> 'Kultur:Kunst',
	'bildhauer'	=> 'Kultur:Bildhauer',
	'biochemiker'	=> 'Sonstige:Wissenschaft:Biochemie',
	'biologe'	=> 'Sonstige:Wissenschaft:Biologie',
	'biologin'	=> 'Sonstige:Wissenschaft:Biologie',
	'biophysiker'	=> 'Sonstige:Wissenschaft:Biophysik',
	'bischof'				=> 'Sonstige:Religion:Katholisch:Würdenträger',
        'römisch-katholischer bischof'				=> 'Sonstige:Religion:Katholisch:Würdenträger',
        'römisch-katholischer erzbischof'				=> 'Sonstige:Religion:Katholisch:Würdenträger',
	'bluesmusiker'	=> 'Kultur:Musik:Blues',
	'blues-musiker'	=> 'Kultur:Musik:Blues',
        'bluessänger'	=> 'Kultur:Musik:Blues',
        'blues-sänger'	=> 'Kultur:Musik:Blues',
        'blues-gitarrist'	=> 'Kultur:Musik:Blues',
        'bluesgitarrist'	=> 'Kultur:Musik:Blues',
        'blues-pianist'	=> 'Kultur:Musik:Blues',
	'bobfahrer'	=> 'Sport:Bob',
	'bodybuilder'=>'_next',
	'botaniker'	=> 'Sonstige:Wissenschaft:Botanik',
	'botschafter'	=> 'Sonstige:Politik:Botschafter',
	'boxer'					=> 'Sport:Boxen',
	'broadcaster'	=> '_next',
	'buchautor'	=> 'Kultur:Literatur:Schriftsteller',
	'buchillustrator'	=> 'Kultur:Kunst',
	'bürgerrechtler'	=> 'Sonstige:PdZ',
	'cartoonist'	=> 'Kultur:Literatur:Zeichner',
        'cellist'		=> 'Kultur:Musik:Cello',
	'chef'=>'_next',
	'industrieller'=>'_next','bankier'=>'_next',
	'chansonsänger'	=> 'Kultur:Musik:Sänger',
	'chemiker'=>'Sonstige:Wissenschaft:Chemie',
	'comicautor'	=> 'Kultur:Literatur:Zeichner',
	'comiczeichner'	=> 'Kultur:Literatur:Zeichner',
	'comic-zeichner'	=> 'Kultur:Literatur:Zeichner',
	'composer'	=> 'Kultur:Musik:Komponist',
	'cosmonaut'	=> 'Sonstige:Wissenschaft:Astronaut',
	'country-musiker'	=> 'Kultur:Musik:Country',
	'countrysänger'	=> 'Kultur:Musik:Country',
	'country-sänger'	=> 'Kultur:Musik:Country',
	'cricketer'	=> 'Sport:Kricket',
	'curler'	=> 'Sport:Curling',
	'violinist'	=> 'Kultur:Musik:Violine',
	'dancer'	=> 'Sport:Tänzer',
	'darts player' => 'Sport:Dart',
	'designer'			=> 'Kultur:Kunst:Design',
	'dichter'	=> 'Kultur:Literatur:Poesie',
	'diktator'	=> 'Sonstige:Politik:Diktatoren',
	'diplomat'					=> 'Sonstige:Politik:Diplomat',
	'dirigent'		=> 'Kultur:Musik:Dirigenten',
	'diver'		=> 'Sport:Tauchen',
	'dokumentarfilmer'			=> 'Kultur:Film:Regisseur',
	'dramatiker'	=> 'Kultur:Literatur:Dramaturg',
	'dramaturg'	=> 'Kultur:Literatur:Dramaturg',
	'drummer'	=> 'Kultur:Musik:Drummer',
	'earl'	=> 'Sonstige:Adel:Graf',
	'economist'	=> '_next',
	'educator'	=> '_next',
	'lithograf'	=> '_next',
	'stuckateur'	=> '_next',
        'psychiater'	=> '_next',
        'archivar'	=> '_next',
        'geograph'	=> '_next',
	'sportreporter'	=> '_next',
	'oberst'	=> '_next',
	'innenarchitekt'	=> '_next',
	'Ägyptologe'	=> '_next',
	'flugzeugkonstrukteur'	=> '_next',

	'sportkommentator'	=> '_next',
	'literarischer Übersetzer'	=> '_next',
	'forstwissenschaftler'	=> '_next',
	'bratschist'	=> '_next',
	'gewerkschaftsfunktionär'	=> '_next',
	'eishockeyspieler'	=> 'Sport:Eishockey',
	'eishockeytorwart'	=> 'Sport:Eishockey',
	'eishockeytorhüter'	=> 'Sport:Eishockey',
	'eiskunstläufer'	=> 'Sport:Eiskunstlauf',
	'eisschnellläufer'	=> 'Sport:Eisschnelllauf',
	'equestrian'	=> 'Sport:Reiten',
	'erfinder'=>'Sonstige:Erfinder',
        'erzbischof' => 'Sonstige:Religion:Katholisch:Würdenträger',
        'essayist'	=> 'Kultur:Literatur:Schriftsteller',

        'evangelischer theologe'	=> 'Sonstige:Wissenschaft:Theologie',
	'evangelisch-lutherischer theologe'	=> 'Sonstige:Wissenschaft:Theologie',
	'fashion designer'			=> 'Kultur:Kunst:Design',
	'director'	=> 'Kultur:Film:Regisseur',
	'fantasy-autor'	=> 'Kultur:Literatur:Schriftsteller',
	'fantasy-schriftsteller'	=> 'Kultur:Literatur:Schriftsteller',
	'finanzwissenschaftler'=>'_next','missionar'=>'_next',
	'bürgermeister'=>'_next','koch'=>'_next','gastronom'=>'_next','funktionär'=>'_next',
	'bratschist'=>'_next',
	'fachbuchautor'				=> 'Kultur:Literatur:Schriftsteller',
	'fechter'	=> 'Sport:Fechten',
	'fernschachspieler'	=> 'Sport:Schach',
	'fernsehjournalist'		=> 'Kultur:Medien:Journalist',
	'fernsehregisseur'		=> 'Kultur:Film:Regisseur',
	'fernsehmoderator'		=> 'Kultur:TV:Moderator',
	'fernsehschauspieler'		=> 'Kultur:Film:Schauspieler',
	'filmmaker'			=> 'Kultur:Film:Regisseur',
	'film director'			=> 'Kultur:Film:Regisseur',
	'film/television director'			=> 'Kultur:Film:Regisseur',
	'film producer'			=> 'Kultur:Film:Produzent',
	'filmemacher'			=> 'Kultur:Film:Regisseur',
	'filmschauspieler'			=> 'Kultur:Film:Schauspieler',
	'flugpionier'	=> 'Sonstige:PdZ',
	'footballspieler'=>'Sport:American Football',
	'fotograf'	=> 'Kultur:Fotograf',
	'fotokünstler'	=> 'Kultur:Fotograf',
	'fotojournalist'		=> 'Kultur:Medien:Journalist',
	'fotomodel'	=> 'Sonstige:Model',
	'frauenrechtlerin'	=> 'Sonstige:PdZ',
	'freestyle ski'	=> 'Sport:Ski:Freestyle',
	'fussballtrainer'	=> 'Sport:Fussball:Trainer',
	'fussballmanager'	=> 'Sport:Fussball:Manager',
	'fussballspieler'	=> 'Sport:Fussball',
	'fussballtorwart'	=> 'Sport:Fussball',
	'fussballtorhüter'	=> 'Sport:Fussball',
	'olympic alpine skier' =>	'Sport:Ski:Alpine',

	'gelehrter'	=> 'Sonstige:Wissenschaft:Gelehrter',
	'geiger'	=> 'Kultur:Musik:Violine',
	'genetiker'			=> 'Sonstige:Wissenschaft:Genforscher',
        'mediziner'	=> 'Sonstige:Wissenschaft:Genforscher',
	'genremaler'	=> 'Kultur:Maler',
	'geologe'	=> 'Sonstige:Wissenschaft:Geologie',
	'geophysiker'	=> 'Sonstige:Wissenschaft:Physik',
	'gewichtheber'	=> 'Sport:Gewichtheben',
	'gitarrist'		=> 'Kultur:Musik:Gitarre',
	'glasmaler'	=> 'Kultur:Maler',
	'gouverneur'	=> 'Sonstige:Politik:Gouverneure',
	'golfspieler'	=> 'Sport:Golf',
	'graf'	=> 'Sonstige:Adel:Graf',
	'guitarist'		=> 'Kultur:Musik:Gitarre',
	'handball player'	=> 'Sport:Handball',
	'handballspieler'	=> 'Sport:Handball',
	'handballtrainer'	=> 'Sport:Handball:Trainer',
	'heiliger'	=>'Sonstige:Religion:Katholisch:Heilige',
	'heimatdichter'	=> 'Kultur:Literatur:Poesie',
	'heimatschriftsteller'	=> 'Kultur:Literatur:Schriftsteller',
	'historienmaler'	=> 'Kultur:Maler',
	'hockeyspieler'		=> 'Sport:Hockey',
	'hurdler'	=> 'Sport:Leichtathletik:Laufen:Hürdenlauf',
	'hürdenläufer'	=> 'Sport:Leichtathletik:Laufen:Hürdenlauf',
	'high jumper'	=> 'Sport:Leichtathletik:Hochsprung',
	'hip-hop-musiker'	=> 'Kultur:Musik:Hip-Hop',
	'historian'		=> 'Sonstige:Wissenschaft:Historiker',
	'historiker'		=> 'Sonstige:Wissenschaft:Historiker',
	'hochspringer'	=> 'Sport:Leichtathletik:Hochsprung',
	'hurler'=>'_next','kameramann'=>'_next',
	'ice hockey player'	=> 'Sport:Eishockey',
	'ice hockey defence player'	=> 'Sport:Eishockey',
	'ice hockey defenceman'	=> 'Sport:Eishockey',
	'illustrator'	=> 'Kultur:Literatur:Zeichner',
        'innenminister'=>'Sonstige:Politik:Minister',
        'installationskünstler'	=> 'Kultur:Kunst',
	'inventor'	=> '_next',
	'jazz-bassist'	=> 'Kultur:Musik:Jazz',
	'jazzbassist'	=> 'Kultur:Musik:Jazz',
	'jazz musician'	=> 'Kultur:Musik:Jazz',
	'jazz-gitarrist'	=> 'Kultur:Musik:Jazz',
	'jazzgitarrist'	=> 'Kultur:Musik:Jazz',
	'jazzmusiker'	=> 'Kultur:Musik:Jazz',
	'jazz-musiker'	=> 'Kultur:Musik:Jazz',
	'jazz-saxophonist'	=> 'Kultur:Musik:Jazz',
        'jazzsaxophonist'	=> 'Kultur:Musik:Jazz',
	'jazzsänger'	=> 'Kultur:Musik:Jazz',
	'jazzpianist'	=> 'Kultur:Musik:Jazz',
	'jazz-pianist'	=> 'Kultur:Musik:Jazz',
        'jazzposaunist'	=> 'Kultur:Musik:Jazz',

	'jazzschlagzeuger'	=> 'Kultur:Musik:Jazz',
	'jazz-sänger'	=> 'Kultur:Musik:Jazz',
	'jazz-schlagzeuger'	=> 'Kultur:Musik:Jazz',
	'jazztrompeter'	=> 'Kultur:Musik:Jazz',
	'jazz-trompeter'	=> 'Kultur:Musik:Jazz',
	'journalist'		=> 'Kultur:Medien:Journalist',
	'jugendbuchautor'	=> 'Kultur:Literatur:Schriftsteller',
	'jüdischer gelehrter'	=> 'Sonstige:Wissenschaft:Gelehrter',

	'kabarettist'=>'Kultur:Komik',
	'kammermusiker'	=>'Kultur:Musik',
	'kanute'	=> 'Sport:Rudern',
	'kanutin'	=> 'Sport:Rudern',
	'kardinal'				=> 'Sonstige:Religion:Katholisch:Würdenträger',
	'karikaturist'	=> 'Kultur:Literatur:Zeichner',
	'katholischer bischof'	=> 'Sonstige:Religion:Katholisch:Würdenträger',
	'katholischer theologe'	=> 'Sonstige:Wissenschaft:Theologie',
	'kernphysiker'	=> 'Sonstige:Wissenschaft:Physik',
	'keyboarder'	=> 'Kultur:Musik:Keyboarder',
	'kinderbuchautor'	=> 'Kultur:Literatur:Schriftsteller',
	'kirchenmusiker'	=> 'Kultur:Musik',
	'klassischer archäologe'	=> 'Sonstige:Wissenschaft:Archäologie',
	'klassische archäologin'	=> 'Sonstige:Wissenschaft:Archäologie',
	'klassischer pianist'	=> 'Kultur:Musik:Piano',
	'kletterer'	=> 'Sport:Bergsteiger',
	'komiker'=>'Kultur:Komik',
	'komponist'			=> 'Kultur:Musik:Komponist',
	'konzeptkünstler'			=> 'Kultur:Kunst',
	'kosmonaut'			=> 'Sonstige:Wissenschaft:Astronaut',
	'kriegsverbrecher'	=> 'Sonstige:Verbrecher:Kriegsverbrecher',
	'krimiautor'	=> 'Kultur:Literatur:Schriftsteller',
	'krimi-schriftsteller'	=> 'Kultur:Literatur:Schriftsteller',
	'krimineller'	=> 'Sonstige:Verbrecher',
	'kunsthistoriker'			=> 'Kultur:Kunsthistoriker',
	'kunstmaler'			=> 'Kultur:Maler',
	'künstler'		=> 'Kultur:Kunst',
	'kurienkardinal'	=> 'Sonstige:Religion:Katholisch:Würdenträger',
	'landschaftsmaler'	=> 'Kultur:Kunst',
	'landtagsabgeordneter'	=> 'Sonstige:Politik:Allgemein',
	'langstreckenläufer'	=> 'Sport:Leichtathletik:Laufen:Langlauf',
	'leichtathlet'	=> 'Sport:Leichtathletik',
	'liedermacher'	=> 'Kultur:Musik:Komponist',
	'linguist'			=> 'Sonstige:Wissenschaft:Sprachforscher',
	'luftfahrpionier'	=> 'Sonstige:PdZ',
	'lutherischer theologe'	=> 'Sonstige:Wissenschaft:Theologie',
	'lyriker'	=> 'Kultur:Literatur:Poesie',
	'outlaw'			=> 'Sonstige:Verbrecher',
	'mafioso'	=> 'Sonstige:Verbrecher',
        'mdep' => 'Sonstige:Politik:Allgemein',
        'middle distance runner'	=> 'Sport:Leichtathletik:Laufen:Mittelstrecke',
	'mittelstreckenläufer'	=> 'Sport:Leichtathletik:Laufen:Mittelstrecke',
	'magician'			=> 'Sonstige:Zauberer',
	'major league baseball pitcher'	=> 'Sport:Baseball',
	'maler'		=> 'Kultur:Maler',
	'marathonläufer'	=> 'Sport:Leichtathletik:Laufen:Langlauf',
	'martial artist'	=> 'Sport:Kampfsport',
	'martyr'	=> 'Sonstige:Religion:Katholisch:Märtyrer',
	'mathematician'	=> 'Sonstige:Wissenschaft:Mathematik',
	'mathematiker'	=> 'Sonstige:Wissenschaft:Mathematik',
	'märtyrer'	=> 'Sonstige:Religion:Katholisch:Märtyrer',
	'mda'	=> 'Sonstige:Politik:Allgemein',
	'mdb'	=> 'Sonstige:Politik:Allgemein',
	'mdbb'	=> 'Sonstige:Politik:Allgemein',
	'mdl'	=> 'Sonstige:Politik:Allgemein',
	'mdr'	=> 'Sonstige:Politik:Allgemein',
	'mdhb'	=> 'Sonstige:Politik:Allgemein',
	'mdv'	=> 'Sonstige:Politik:Allgemein',
	'medienkünstler'		=> 'Kultur:Kunst',
	'mediziner'	=> 'Sonstige:Wissenschaft:Arzt',
	'metalsänger'	=> 'Kultur:Musik:Metal',
	'metal-sänger'	=> 'Kultur:Musik:Metal',
	'mitglied des bundesrates'	=> 'Sonstige:Politik:Allgemein',
	'mitglied der chambre'	=> 'Sonstige:Politik:Allgemein',
	'mitglied des house of commons'	=> 'Sonstige:Politik:Allgemein',
	'mitglied des riksdag'	=> 'Sonstige:Politik:Allgemein',
	'mitglied des sejm'	=> 'Sonstige:Politik:Allgemein',
	'minister'	=> 'Sonstige:Politik:Minister',
	'mobster'	=> 'Sonstige:Verbrecher',
	'modedesigner'			=> 'Kultur:Kunst:Design',
	'modeschöpfer'			=> 'Kultur:Kunst:Design',
	'model'			=> 'Sonstige:Model',
	'moderator'		=> 'Kultur:TV:Moderator',
	'molekularbiologe'	=> 'Sonstige:Wissenschaft:Biologe',
	'motocrossfahrer'	=> 'Sport:Rennfahrer:Motorrad',
	'motorcycle racer'	=> 'Sport:Rennfahrer:Motorrad',
	'motorradrennfahrer'	=> 'Sport:Rennfahrer:Motorrad',
	'mountain climber'	=> 'Sport:Bergsteiger',
	'mörder'	=> 'Sonstige:Verbrecher:Mörder',
	'mundartautor'	=> 'Kultur:Literatur:Schriftsteller',
	'mundartschriftsteller'	=> 'Kultur:Literatur:Schriftsteller',
	'murderer'	=> 'Sonstige:Verbrecher:Mörder',
	'musicaldarsteller'	=> 'Kultur:Theater:Schauspieler',
	'musiker'	=> 'Kultur:Musik',

	'naturbahnrodler'	=> 'Sport:Rodeln',
	'naturwissenschaftler'				=> 'Sonstige:Wissenschaft',
	'nobelpreisträger'	=> 'Sonstige:Wissenschaft:Nobelpreisträger',
        'nordischer kombinierer' => 'Sport:Ski:Nordisch',
	'novelist'	=> 'Kultur:Literatur:Schriftsteller',
	'olympic wrestler'		=> 'Sport:Ringen',
	'olympic basketball player'		=> 'Sport:Basketball',
	'olympic sailor'		=> 'Sport:Segeln',
	'opernsänger'	=> 'Kultur:Musik:Oper',
	'painter'		=> 'Kultur:Maler',
	'paläontologe'	=> '_next',
	'parlamentarier'		=> 'Sonstige:Politik:Allgemein',
	'performancekünstler'	=> 'Kultur:Kunst',
	'senator'	=> 'Sonstige:Politik:Allgemein',
	'philantropist'	=> '_next','trade unionist'	=> '_next','marschall'	=> '_next',
	'film'	=> '_next',
	'philosoph'	=> 'Kultur:Philosoph',
	'physiker'				=> 'Sonstige:Wissenschaft:Physik',
	'pianist'	=> 'Kultur:Musik:Klavier',
	'pirat'	=> 'Sonstige:Verbrecher:Pirat',
        'piratenkapitän'	=> 'Sonstige:Verbrecher:Pirat',
	'poet'					=> 'Kultur:Literatur:Poesie',
	'poker player'	=> '_next','pädagogin'	=> '_next','romanist'	=> '_next',
	'pokerspieler'	=> '_next',
	'mykologe'	=> '_next',
	'immunologe'	=> '_next',

	'Sonstige:Politiker'	=> 'Sonstige:Politik:Allgemein',
	'Sonstige:Politiker (cdu)'	=> 'Sonstige:Politik:CDU',
	'Sonstige:Politikerin (cdu)'	=> 'Sonstige:Politik:CDU',
	'politischer schriftsteller'	=> 'Kultur:Literatur:Schriftsteller',
	'player'	=> '_next','political consultant'	=> '_next',
	'polospieler'=>'Sport:Polo',
	'popmusiker'	=> 'Kultur:Musik:Sänger',
	'popsänger'	=> 'Kultur:Musik:Sänger',
	'pop-sänger'	=> 'Kultur:Musik:Sänger',
	'pornodarsteller'	=> 'Sonstige:Porno',
	'porträtmaler' => 'Kultur:Maler',
        'premierminister'	=> 'Sonstige:Politik:Premierminister',
	'prinzessin'	=> 'Sonstige:Adel:Prinzessin',
	'professor' => '_next','prediger' => '_next','buchhändler' => '_next',
	'protestantischer theologe'	=> 'Sonstige:Wissenschaft:Theologie',
	'profigolfer'	=> 'Sport:Golf',
	'publisher'				=> 'Kultur:Literatur:Herausgeber',
	'ornithologe' => '_next','unternehmensberater' => '_next','drehbuchautor' => 'Kultur:Film:Drehbuch',
	'rabbi'	=> '_next','kupferstecher'	=> '_next',
	'radrennfahrer'	=> 'Sport:Radrennen',
	'radsportler' => 'Sport:Radrennen',
	'rally driver'	=> 'Sport:Rennfahrer:Rallye',
	'rallyefahrer'	=> 'Sport:Rennfahrer:Rallye',
	'rapper'				=> 'Kultur:Musik:Rap',
	'reformierter theologe'	=> 'Sonstige:Wissenschaft:Theologie',
	'regisseur'	=> 'Kultur:Film:Regisseur',
	'reiseschriftsteller'=>'Kultur:Literatur:Schriftsteller',
	'rennfahrer'	=> 'Sport:Rennfahrer',
	'rennrodler'	=> 'Sport:Rodeln',
	'revolutionär'	=> 'Sonstige:PdZ',
	'ringer'		=> 'Sport:Ringen',
        'rockabilly-musiker' => 'Kultur:Musik',
        'rockmusiker'	=> 'Kultur:Musik:Rock',
	'rocksänger'	=> 'Kultur:Musik:Rock',
	'rockgitarrist'	=> 'Kultur:Musik:Rock',
	'rock-schlagzeuger'	=> 'Kultur:Musik:Rock',
	'romanautor'	=> 'Kultur:Literatur:Schriftsteller',
	'romanschriftsteller'	=> 'Kultur:Literatur:Schriftsteller',
	'römisch-katholischer theologe'	=> 'Sonstige:Wissenschaft:Theologie',
	'ruderer'	=> 'Sport:Rudern',
	'ruderin'	=> 'Sport:Rudern',
	'rugby'	=>'Sport:Rugby',
	'sachbuchautor'	=> 'Kultur:Literatur:Schriftsteller',
	'satiriker'=>'Kultur:Komik',
	'saxophonist'			=> 'Kultur:Musik:Saxophon',
	'sänger'	=> 'Kultur:Musik:Sänger',
	'screenwriter'			=> 'Kultur:Film:Drehbuch',
	'schachkomponist'	=> 'Sport:Schach',
	'schachgrossmeister'	=> 'Sport:Schach',
	'schachmeister'	=> 'Sport:Schach',
	'schachspieler'	=> 'Sport:Schach',
	'schauspieler'	=> 'Kultur:Film:Schauspieler',
	'schlagersänger'	=> 'Kultur:Musik:Sänger',
	'schlagzeuger'	=> 'Kultur:Musik:Drummer',
	'schönheitskönigin'	=> 'Sonstige:Schönheitskönigin',
	'schriftsteller'	=> 'Kultur:Literatur:Schriftsteller',
	'scholar'	=> 'Sonstige:Wissenschaft:Gelehrter',
	'schwergewichtsboxer'	=> 'Sport:Boxen',
	'schwimmer'	=> 'Sport:Schwimmen',
	'science-fiction-autor'	=> 'Kultur:Literatur:Schriftsteller',
	'science-fiction-schriftsteller'	=> 'Kultur:Literatur:Schriftsteller',
	'sculptor'	=> 'Kultur:Bildhauer',
	'segler'		=> 'Sport:Segeln',
	'senator (bayern)'		=> 'Sonstige:Politik:Allgemein',
	'short story writer'	=> 'Kultur:Literatur:Schriftsteller',
	'silent film actress'	=> 'Kultur:Film:Stummfilm-Schauspieler',
	'singer'	=> 'Kultur:Musik:Sänger',
	'singer-songwriter'	=> 'Kultur:Musik:Sänger',
	'skilangläufer' =>	'Sport:Ski',
	'skirennläufer' =>	'Sport:Ski',
	'skirennfahrer' =>	'Sport:Ski',
	'skisportler' =>	'Sport:Ski',
	'skispringer' =>	'Sport:Ski:Skisprung',
	'smuggler'=>'_next','jurist'=>'_next','mediävist'=>'_next',
	'soccer player'			=> 'Sport:Fussball',
	'soldier'	=> '_next','bankmanager'	=> '_next',
	'sopranist'	=> 'Kultur:Musik:Sänger:Sopran',
	'sozialpolitiker'	=> 'Sonstige:Politik:Allgemein',
	'sportkletterer'	=> 'Sport:Bergsteiger',
	'stabhochspringer'	=> 'Sport:Leichtathletik:Stabhochsprung',
	'stadtplaner'	=> '_next','industriemanager'	=> '_next',
	'springreiter'	=> 'Sport:Reiten',
	'sprinter'=>'Sport:Leichtathletik:Laufen:Sprint',
	'sprint athlete'=>'Sport:Leichtathletik:Laufen:Sprint',
	'squash player'	=> 'Sport:Squash',
	'staatsmann'	=> 'Sonstige:Politik:Allgemein',
	'staatspräsident'	=> 'Sonstige:Politik:Allgemein',
	'strassenradrennfahrer'	=> 'Sport:Radrennen',
	'synchronschwimmer'	=> 'Sport:Schwimmen:Synchronschwimmen',
	'synchronsprecher'			=> 'Kultur:Film:Synchronsprecher',
	'swimmer'=>'Sport:Schwimmen',
	'table tennis player'	=> 'Sport:Tischtennis',
	'talk show host'		=> 'Kultur:TV:Moderator',
	'tänzer'	=> 'Kultur:Ballett',
	'television'	=> 'Kultur:Film:Schauspieler',
	'television journalist'	=> 'Kultur:Medien:Journalist',
	'television personality'	=> 'Kultur:Medien:Allgemein',
	'tv personality'	=> 'Sonstige',
	'television actress'	=> 'Kultur:TV:Schauspieler',
	'tennis player'	=> 'Sport:Tennis',
	'tennisspieler'	=> 'Sport:Tennis',
	'tenor'	=> 'Kultur:Musik:Oper',
	'terrorist'=>'Sonstige:Verbrecher:Attentäter',
	'theaterregisseur'	=> 'Kultur:Theater:Regisseur',
	'theaterschauspieler'	=> 'Kultur:Theater:Schauspieler',
	'theologe'	=> 'Sonstige:Wissenschaft:Theologie',
	'theologian'=>'_next',
	'theoretischer physiker'				=> 'Sonstige:Wissenschaft:Physik',
	'tierfilmer'			=> 'Kultur:Film:Regisseur',
	'tischtennisspieler'	=> 'Sport:Tischtennis',
	'trompeter'	=> 'Kultur:Musik:Trompete',
	'todesopfer der berliner mauer'	=> 'Sonstige:PdZ',
	'todesopfer an der innerdeutschen grenze'	=> 'Sonstige:PdZ',
	'tv host'=>'Kultur:TV:Moderator',
	'tv-moderator'		=> 'Kultur:TV:Moderator',
	'musician'	=> 'Kultur:Musik',
	'news reporter'			=> 'Kultur:Medien:Journalist',
	'photojournalist'			=> 'Kultur:Medien:Journalist',
	'politician'	=> 'Sonstige:Politik:Allgemein',
	'golfer'	=> 'Sport:Golf',
	'serial killer'	=> 'Sonstige:Verbrecher:Serienmörder',
	'serienmörder'	=> 'Sonstige:Verbrecher:Serienmörder',
	'songschreiber'			=> 'Kultur:Musik:Komponist',
	'songwriter'			=> 'Kultur:Musik:Komponist',
	'television producer'	=> 'Kultur:Film:Produzent',
	'television director'	=> 'Kultur:Film:Regisseur',
	'ultramarathonläufer'	=> 'Sport:Leichtathletik:Laufen:Langlauf',
	'verteidigungsminister'	=> 'Sonstige:Politik:Minister',
	'videokünstler'	=> 'Kultur:Kunst',
	'vielseitigkeitsreiter'	=> 'Sport:Reiten',
	'voice actress'			=> 'Synchronsprecher',
	'volleyball player'	=> 'Sport:Volleyball',
	'volleyballspieler'	=> 'Sport:Volleyball',
	'volksschauspieler'	=> 'Kultur:Film:Schauspieler',
        'volleyball-nationalspieler'	=> 'Sport:Volleyball',

	'wasserballspieler'	=> 'Sport:Wasserball',
	'water polo player'	=> 'Sport:Wasserball',
	'weightlifter'	=> 'Sport:Gewichtheben',
	'weihbischof'	=> 'Sonstige:Religion:Katholisch:Würdenträger',
	'weitspringer'	=> 'Sport:Leichtathletik:Weitsprung',
	'widerstandskämpfer'	=> 'Sonstige:PdZ',
	'wirtschaftsjournalist'	=> 'Kultur:Medien:Journalist',
	'wissenschaftler'	=> 'Sonstige:Wissenschaft',
        'wissenschaftsjournalist'		=> 'Kultur:Medien:Journalist',
	'writer'				=> 'Kultur:Literatur:Schriftsteller',
	'zeichner'	=> 'Kultur:Literatur:Zeichner',
	'zauberkünstler'			=> 'Sonstige:Zauberer',


	'united states general' => '_next',	'united states navy sailor' => '_next',	'geschäftsmann'=> '_next','chorleiter'=> '_next','lobbyist'	=> '_next',
	'idol'	=> '_next','wrestler' => '_next',	'financier'	=> '_next','bühnenbildner'	=> '_next','reporter'	=> '_next',
	'curator'	=> '_next','judge'				=> '_next','germanist'				=> '_next',
	'gutsbesitzer'	=> '_next','manager'=>'_next','naturforscher'=>'_next',
	'radierer'	=> '_next','agrarwissenschaftler'	=> '_next','ethnologe'	=> '_next',
	'cutter'	=> '_next','Sonstige:Wissenschaftshistoriker'	=> '_next',
	'sportjournalist'	=> '_next',
	'pharmazeut'	=> '_next',
	'feldmarschall'	=> '_next',
	'bergführer'	=> '_next',
	'goldschmied'	=> '_next',
	'museumsleiter'	=> '_next',
	'orthopäde'	=> '_next',
	'polizeibeamter'	=> '_next',
	'reformator'=>'_next',
	'medizinhistoriker'	=> '_next',
	'musikdirektor'	=> '_next',
	'heraldiker'	=> '_next',
	'zeichenlehrer'	=> '_next',
	'landschaftsarchitekt'	=> '_next',
	'geigenbauer'	=> '_next',
	'kommunaler baubeamter'	=> '_next',
	'komödiant'	=> '_next',
	'glockengiesser'	=> '_next',

	'dartspieler'	=> '_next',
	'sozialpädagoge'	=> '_next',
	'kunstwissenschaftler'	=> '_next',
	'lithograph'	=> '_next',
	'zeitungsverleger'	=> '_next',
	'lexikograf'	=> '_next',
	'wirtschaftsmanager'	=> '_next',
	'instrumentenbauer'	=> '_next',

	'rechtsmediziner'	=> '_next',
	'lexikograph'	=> '_next',
	'forstwirt'	=> '_next',
	'Sonstige:Politikberater'	=> '_next','kommunikationswissenschaftler'	=> '_next',
	'lithograph'	=> '_next',
	'luftfahrtpionier'	=> '_next',
	'forstwirt'	=> '_next',
	'olympiasieger'	=> '_next',
	'hofdame'	=> '_next',
	'japanologe'	=> '_next',
	'astrologe'	=> '_next',
	'sammler'	=> '_next',
	'drucker'	=> '_next',
	'olympiamedaillengewinner'	=> '_next',
	'kolonialbeamter'	=> '_next',
	'pflanzenbauwissenschaftler'	=> '_next',
	'heerführer'	=> '_next',
	'strafverteidiger'	=> '_next',
	'sozialist'	=> '_next',
	'unfallchirurg'	=> '_next',
	'kirchenhistoriker'	=> '_next',
	'choreograph'	=> '_next',
	'sportmanager'	=> '_next',
	'reformierter pfarrer'	=> '_next',
	'hispanist'	=> '_next',
	'hygieniker'	=> '_next',
	'kardiologe'	=> '_next',

	'skeletonpilot'	=> '_next',
	'versicherungsmanager'	=> '_next',
	'lokalpolitiker'	=> '_next',
	'bodenkundler'	=> '_next',
	'scharfrichter'	=> '_next',
	'eisenbahningenieur'	=> '_next',
	'wirtschaftshistoriker'	=> '_next',
	'theaterkritiker'	=> '_next',
	'stukkateur'	=> '_next',
	'puppenspieler'	=> '_next',
	'buchdrucker'	=> '_next',
	'rezitator'	=> '_next',
	'ritter'	=> '_next',
	'kryptologe'	=> '_next',
	'gärtner'	=> '_next',
	'afrikaforscher'	=> '_next',
	'lautenist'	=> '_next',
	'tontechniker'	=> '_next',
	'indologe'	=> '_next',
	'geschichtsschreiber'	=> '_next',
	'zuletzt generalleutnant im zweiten weltkrieg'	=> '_next',
	'elektroingenieur'	=> '_next',
	'philanthrop'	=> '_next',
	'virologe'	=> '_next',
	'köchin'	=> '_next',
	'opfer des holocaust'	=> '_next',
	'techniker'	=> '_next',
	'pharmakologe'	=> '_next',
	'anglist'	=> '_next',
	'aktivist'	=> '_next',
	'stukkateur'	=> '_next',
        'organist'	=> '_next',
        'soziologe'	=> '_next',
        'zoologe'	=> '_next',

	'menschenrechtsaktivistin'	=> '_next',
	'verbandsfunktionär'	=> '_next',
	'klarinettist'	=> '_next',
	'sinologe'	=> '_next',
	'hornist'	=> '_next',
	'onkologe'	=> '_next',
	'kostümbildner'	=> '_next',
	'sektenführer'	=> '_next',
	'musikprofessor'	=> '_next',
	'agrarökonom'	=> '_next',
	'kristallograph'	=> '_next',
	'liedtexter'	=> '_next',
	'konteradmiral'	=> '_next',
	'regierungsbeamter'	=> '_next',
	'geburtshelfer'	=> '_next',
	'flugzeugregisseur'	=> '_next',
	'klavierbauer'	=> '_next',
	'rechtsgelehrter'	=> '_next',
	'olympiateilnehmer'	=> '_next',
	'pomologe'	=> '_next',
	'ethnologin'	=> '_next',
	'bergbauingenieur'	=> '_next',
	'bühnenautor'	=> '_next',
	'stifter'	=> '_next',
	'ratsherr'	=> '_next',
	'automobildesigner'	=> '_next',
	'optiker'	=> '_next',
	'waffenkonstrukteur'	=> '_next',
	'computeringenieur'	=> '_next',
	'orientierungsläufer'	=> '_next',
	'grossgrundbesitzer'	=> '_next',
	'kapitän'	=> '_next','zeitungsherausgeber'	=> '_next',
	'augenarzt'=>'_next','tobago'=>'_next','literarhistoriker'	=> '_next',
	'oberbürgermeister'	=> '_next',
	'neonazi'	=> '_next',
	'marinemaler'	=> '_next',
	'altorientalist'	=> '_next',
	'musikhistoriker'	=> '_next',
	'freimaurer'	=> '_next',
	'peer'	=> '_next',
	'posaunist'	=> '_next',
	'rundfunkmoderator'	=> '_next',
	'freiherr'	=> '_next',
	'freiheitskämpfer'	=> '_next',
	'württembergischer oberamtmann'	=> '_next',
	'islamwissenschaftler'	=> '_next',
	'vizeadmiral'	=> '_next',
	'stukkateur'	=> '_next',
	'tierschützer'	=> '_next',
	'reeder'	=> '_next',
	'feldherr'	=> '_next',
	'nationalsozialist'	=> '_next',
	'ordensschwester'	=> '_next',
	'staatswissenschaftler'	=> '_next',
	'industriedesigner'	=> '_next',
	'herzchirurg'	=> '_next',
	'alttestamentler'	=> '_next',
	'kunstmäzen'	=> '_next',
	'geschichtsdidaktiker'	=> '_next',
	'neurowissenschaftler'	=> '_next',
	'notar'	=> '_next',
	'forstmann'	=> '_next',
	'schachfunktionär'	=> '_next',
	'evangelist'	=> '_next',
	'wirtschaftsprüfer'	=> '_next',
	'medienmanager'	=> '_next',
	'wirtschaftsinformatiker'	=> '_next',
	'anwalt'	=> '_next',
	'seefahrer'	=> '_next',
	'oboist'	=> '_next',
	'gitarrenbauer'	=> '_next',
	'prämonstratenser'	=> '_next',
	'bibliograph'	=> '_next',
	'esoteriker'	=> '_next',
	'harfenistin'	=> '_next',
	'kontrabassist'	=> '_next',
	'Sonstige:Wissenschaftsmanager'	=> '_next',
	'gründer'	=> '_next',
	'antiquar'	=> '_next',
	'medientheoretiker'	=> '_next',
	'milliardär'	=> '_next',
	'staatsrat'	=> '_next',
	'weltmeister'	=> '_next',
	'musikmanager'	=> '_next',
	'zuletzt generalmajor'	=> '_next',
	'händler'	=> '_next',
	'menschenrechtler'	=> '_next',
	'umweltaktivist'	=> '_next',
	'wasserbauingenieur'	=> '_next',
	'arabist'	=> '_next',
	'house-produzent'	=> '_next',
	'mitglied der nationalversammlung'	=> '_next',
	'rechtmediziner'	=> '_next',
	'toningenieur'	=> '_next',
	'software-entwickler'	=> '_next',
	'erzieherin'	=> '_next',
	'aphoristiker'	=> '_next',
	'dresdner ratsherr'	=> '_next',
	'spion'	=> '_next',
	'handballschiedsrichter'	=> '_next',
	'agronom'	=> '_next',
	'menschenrechtskativistin'	=> '_next',
	'dissident'	=> '_next',
	'reformierter geistlicher'	=> '_next',
	'textilunternehmer'	=> '_next',
	'klimatologe'	=> '_next',
	'spieleentwickler'	=> '_next',
	'sozialhistoriker'	=> '_next',
	'managementberater'	=> '_next',
	'ophthalmologe'	=> '_next',
	'hochschulprofessor'	=> '_next',
	'unterhaltungsmusiker'	=> '_next',
	'umweltschützer'	=> '_next',
	'konquistador'	=> '_next',
	'friedensaktivist'	=> '_next',
	'kulturhistoriker'	=> '_next',
	'sportwissenschaftler'	=> '_next',
	'mathematikhistoriker'	=> '_next',
	'hörspielregisseur'	=> '_next',
	'biathlontrainer'	=> '_next',
	'prähistoriker'	=> '_next',
	'soldat'	=> '_next',
	'cembalist'	=> '_next',
	'reichsgerichtsrat'	=> '_next',
	'theaterleiter'	=> '_next',
	'antroposoph'	=> '_next',
	'tierarzt'	=> '_next','zimmermann'	=> '_next',
	'musikinstrumentenbauer'	=> '_next',
	'tonmeister'	=> '_next',
	'ns-funktionär'	=> '_next',
	'labelbetreiber'	=> '_next',
	'sportler'	=> '_next',
	'ss-sturmbannführer'	=> '_next',
	'kreuzfahrer'	=> '_next',
	'agent'	=> '_next',
	'politischer aktivist'	=> '_next',
	'medienwissenschaftler'	=> '_next',
	'restaurator'	=> '_next',
	'erzähler'	=> '_next',
	'ns-opfer'	=> '_next',
	'statistiker'	=> '_next',
	'snowboarder'	=> '_next',
	'gynäkologe'	=> '_next',
	'elektrotechniker'	=> '_next',
	'kantor'	=> '_next',
	'römisch-katholischer geistlicher'	=> '_next',
	'katholischer geistlicher'	=> '_next',
	'choreograf'	=> '_next',
	'abgeordneter zum nationalrat'	=> '_next',
	'kommunist'	=> '_next',
	'baumeister'	=> '_next',
	'graphiker'	=> '_next',
	'betriebswirt'	=> '_next',
	'kulturmanager'	=> '_next',
	'intendant'	=> '_next',
	'bauunternehmer'	=> '_next',
	'texter'	=> '_next',
	'denkmalpfleger'	=> '_next',
	'sprecher'	=> '_next',
	'kunstkritiker'	=> '_next',
	'hörspielautor'	=> '_next',
	'literaturhistoriker'	=> '_next',
	'forschungsreisender'	=> '_next','tierarzt'	=> '_next',
	'evangelischer geistlicher'	=> '_next',
	'abenteurer'	=> '_next',
	'naturschützer'	=> '_next',
	'kirchenlieddichter'	=> '_next',
	'maschinenbauingenieur'	=> '_next',
	'theaterintendant'	=> '_next',
	'hörspielsprecher'	=> '_next',
	'internist'	=> '_next',
	'Ökologe'	=> '_next',
	'religionswissenschaftler'	=> '_next',
	'zahnarzt'	=> '_next',
	'kunstturner'	=> '_next',
	'turner'	=> '_next',
	'sa-führer'	=> '_next',
	'numismatiker'	=> '_next',
	'brigadegeneral'	=> '_next',
	'kartograph'	=> '_next',
	'entomologe'	=> '_next',
	'kartograf'	=> '_next',
	'kunstschriftsteller'	=> '_next',
	'softwareentwickler'	=> '_next',
	'amateurastronom'	=> '_next',
	'bogenschütze'	=> '_next',
	'karateka'	=> '_next',
	'dermatologe'	=> '_next',
	'schulleiter'	=> '_next',
	'berufsoffizier'	=> '_next',
	'veterinärmediziner'	=> '_next',
	'chronist'	=> '_next',
	'redner'	=> '_next',
	'anthroposoph'	=> '_next',
	'anthropologe'	=> '_next',
	'mineraloge'	=> '_next',
	'Sportschütze'	=> '_next',
	'spieleautor'	=> '_next',
	'meteorologe'	=> '_next',
	'uhrmacher'	=> '_next',
	'kunsthändler'	=> '_next',
	'mikrobiologe'	=> '_next',
	'musikschriftsteller'	=> '_next',
	'humanist'	=> '_next',
	'apotheker'	=> '_next',
	'lektor'	=> '_next',
	'forscher'	=> '_next',
	'pazifist'	=> '_next',
	'musiktheoretiker'	=> '_next',
	'musikverleger'	=> '_next',
	'theaterdirektor'	=> '_next',
	'investor'	=> '_next',
	'pathologe'	=> '_next',
	'medailleur'	=> '_next','anarchist'	=> '_next',
	'sprachforscher'	=> '_next',
	'kunstpädagoge'	=> '_next',
	'kolumnist'	=> '_next',
	'rechtsextremist'	=> '_next',
	'genealoge'	=> '_next',
	'keramiker'	=> '_next',
	'opernregisseur'	=> '_next',
	'medienunternehmer'	=> '_next',
	'kinderarzt'	=> '_next',
	'slawist'	=> '_next',
	'triathlet'	=> '_next',
	'staatsbeamter'	=> '_next',
	'staatssekretär'	=> '_next',
	'nationalökonom'	=> '_next',
	'basketballtrainer'	=> '_next',
	'preussischer generalmajor'	=> '_next',
	'konstrukteur'	=> '_next',
	'musikkritiker'	=> '_next',
	'ss-führer'	=> '_next',
	'fernsehproduzent'	=> '_next',
	'anatom'	=> '_next',
	'logiker'	=> '_next',
	'physiologe'	=> '_next',
	'flötist'	=> '_next',
	'coach'	=> '_next',
	'augenarzt'	=> '_next',
	'hotelier'	=> '_next',
	'maschinenbauer'	=> '_next',
	'betriebswirtschaftler'	=> '_next',
	'geodät'	=> '_next',
	'reisender'	=> '_next',
	'preussischer offizier'	=> '_next',

	'reporter'	=> '_next',
	'kaufmann'	=> '_next',
	'mundartdichter'	=> '_next',
	'musikpädagoge'	=> '_next','pädagoge'	=> '_next',
	'musikpädagogin'	=> '_next',	'rechtshistoriker'	=> '_next',	'sozialpsychologe'	=> '_next',	'typograf'	=> '_next',	'katholischer pfarrer'	=> '_next',
	'abenteuer'	=> '_next',	'rechtsanwältin'	=> '_next',	'museumsdirektor'	=> '_next',	'bakteriologe'	=> '_next',	'polarforscher'	=> '_next',

	'herausgeber'	=> '_next',
	'verwaltungsjurist'	=> '_next','kommunalpolitiker'	=> '_next','informatiker'	=> '_next',
	'heimatforscher'	=> '_next',
	'musikproduzent'	=> '_next',
	'mayor'=>'_next','militär'=>'_next',
	'redakteur'=>'_next','lehrer'=>'_next','Ökonom'=>'_next',
	'gewerkschafter'=>'_next',
	'musikwissenschaftler'=>'_next',
	'beamter'=>'_next',
	'publizist'=>'_next',
	'dozent'=>'_next',
	'benediktiner'=>'_next',
	'preussischer baubeamter'=>'_next',
	'galerist'=>'_next',
	'hofbeamter'=>'_next',

	'geistlicher'=>'_next',
	'psychologe'=>'_next',
	'psychologin'=>'_next',
	'neurochirurg'=>'_next',
	'ordensgründer'=>'_next',
	'literat'=>'_next',
	'eishockeytrainer'=>'_next',
	'gewerkschaftsführer'=>'_next',
	'berater'=>'_next',
	'slam-poet'=>'_next',
	'kriminologe'=>'_next',

	'evangelischer pfarrer'=>'_next','pfarrer'=>'_next',
	'jesuit'=>'_next','volkswirt'=>'_next',
	'psychotherapeut'=>'_next',
	'neurologe'=>'_next',
	'librettist'=>'_next',

	'rittergutsbesitzer'=>'_next',
	'psychoanalytiker'=>'_next',
	'trainer'=>'_next',
	'priester'=>'_next',
	'verlagslektor'=>'_next',
	'kirchenrechtler'=>'_next',
	'nonne'=>'_next',
	'religionsphilosoph'=>'_next',
	'evangelische theologin'=>'_next',
	'kulturjournalist'=>'_next',
	'privatgelehrter'=>'_next',
	'bibelübersetzer'=>'_next',
	'literaturwissenschaftler'=>'_next',
	'hörfunkmoderator'=>'_next',
	'ordensgeistlicher'=>'_next',
	'katholischer priester'=>'_next',
	'wirtschaftswissenschaftler'=>'_next',
	'rechtswissenschaftler'=>'_next',
	'produzent'	=> '_next',
	'landrat' => '_next',
	'landwirt' => '_next',
	'literaturkritiker' => '_next',

	'kapellmeister' => '_next','universitätsprofessor' => '_next','bauingenieur'	=> '_next',
	'merchant'	=> '_next','fussballschiedsrichter' =>'_next',
	'computer scientist'	=> '_next',
	'unternehmer'=>'_next','comedian'				=> '_next',
	'sociologist'	=> '_next',
	'polizist'	=> '_next','klassischer philologe'	=> '_next','philologe'	=> '_next','altphilologe'	=> '_next',
	'fabrikant'	=> '_next','sprachwissenschaftler'	=> '_next','orgelbauer'	=> '_next',
	'chirurg'	=> '_next',
	'politologe'	=> '_next','lawyer'			=> '_next','orientalist'			=> '_next',	'fabrikant'	=> '_next',
	'fussballfunktionär'	=> '_next',
	'rechtsanwalt'	=> '_next',
	'sozialwissenschaftler'	=> '_next',
	'ice hockey coach'	=> '_next',
	'jagdflieger'	=> '_next','sozialwissenschaftler'	=> '_next','marineoffizier'	=> '_next','literaturkritiker'	=> '_next',
	'offizier'	=> '_next',
	'gymnasiallehrer'	=> '_next',
	'kritiker'	=> '_next',
	'baubeamter'	=> '_next',
	'kunstsammler'	=> '_next',
	'fussballfunktionär'	=> '_next',
	'erziehungswissenschaftler'	=> '_next',
	'volkswirtschaftler'=>'_next',

	'br/&gt'	=> '_next','br /&gt'	=> '_next',	'general'			=> '_next',
	'ghostwriter'		=> '_next',	'hochschullehrer'			=> '_next',	'rechtslehrer'	=> '_next',
	'feminist'			=> '_next','programmierer'=>'_next','politikwissenschaftler'=>'_next',

	'grafiker'=>'_next',
	'kulturwissenschaftler'=>'_next',
	'mäzen'=>'_next',
	'verwaltungsbeamter'				=> '_next',
	'Übersetzer'				=> '_next',
	'bibliothekar'=>'_next',
	'sportfunktionär'	=> '_next',
	'blogger'	=> 'Kultur:Medien:Internet:Blogger',
	'radiomoderator'			=> '_next',
	'ingenieur'=> '_next','verleger'=> '_next',

	'werber'=>'_next',
);


#
# Liefert alle Daten zu einem Vornamen zurück
#
sub getVorname
{
	my($v,$geschlecht)=@_;
	return if length($v)<1;
	if(!exists($main::cache->{'vornamen_top_ausland'}))
	{
		if(-e "$main::master->{'_path_data'}/vornamen/ausland/indiziert.idx")
		{
			$main::cache->{'vornamen_top_ausland'}=retrieve("$main::master->{'_path_data'}/vornamen/ausland/indiziert.idx");
		} else
		{
			&main::logge_int("Keine Index-Datei für Top-Auslandsvornamen gefunden in $main::master->{'_path_data'}/vornamen/ausland/indiziert.idx");
		}
	}
	$v=~s/_([0-9A-F]+)/encode_utf8(chr(hex($1)))/eg;
	$v=~s/\s+$//;
	my $vorname=ucfirst(lc($v));

	&main::db_connect();

	# Cache für Namenstage geladen?
	if(!exists($main::cache->{'vornamen_namenstage'}))
	{
		if(-e "$main::master->{'_path_data'}/vornamen/namenstage.idx")
		{
			#&main::logge_int("Lade Index für Namenstage $main::master->{'_path_data'}/vornamen/namenstage.idx",1);
			eval{
				$main::cache->{'vornamen_namenstage'}=retrieve("$main::master->{'_path_data'}/vornamen/namenstage.idx");
			};
		} else
		{
			#&main::logge_int("Erstelle Index für Namenstage $main::master->{'_path_data'}/vornamen/namenstage.idx",1);
			if(-e "$main::master->{'_path_data'}/vornamen/namenstage.txt")
			{
				#$main::cache->{'vornamen_namenstage'}=retrieve("$main::master->{'_path_data'}/vornamen/namenstage.idx");
				#&main::logge_int("Lese Text ein",1);
				my $akt_name="";
				foreach my $z (split(/\n/,&main::hole_file("$main::master->{'_path_data'}/vornamen/namenstage.txt")))
				{
					next if length($z)<3;
					if($z=~s/^([A-Z].*?)\t([\*\d\.]+)\t/\t$2\t/)
					{
						$akt_name=$1;
					} elsif($z=~/^([A-Z].*?)$/)
					{
						$akt_name=$1;
						next;
					}
					my($dum,$datum,$konf,$wer)=split(/\t/,$z);
					if($akt_name)
					{
						#&main::logge_int("Akt-Name: $akt_name $datum ($wer)");
					}
					my $flags;
					if($konf=~s/^([EAKO\+]+)://)
					{
						my $dum=$1;
						$dum=~s/\+//g;
						$flags=join("",sort(split(//,$dum)));
						#&main::logge_int("$konf = $flags");
					} else
					{
						#&main::logge_int("FFFFFFFFFF $konf");
					}

					my $real_nt=-1;
					if($datum=~s/^\*//)
					{
						$real_nt=1;
					}
					#&main::logge_int("Z: $z") if $akt_name eq "Petrus";
					if($datum=~/^(\d+)\.(\d+)$/)
					{
						$datum="$1. ".&main::getMonatsname($2);
						#&main::logge_int("$konf = $datum");
					} else
					{
						&main::logge_int("Fehler bei Datum $datum ($akt_name / $konf)");
						next;
					}
					$wer=~s/ \(gestorben ([\d\.\- ]+)\)/ ✝$1/g;

					if($real_nt>0)
					{
						#&main::logge_int("Pushe $datum bei $akt_name ($flags)") if $akt_name eq "Lea";
						push(@{$main::cache->{'vornamen_namenstage'}->{$akt_name}->{'nt'}},{
							'datum'		=> $datum,
							'person'	=> $konf,
							'desc'		=> $wer,
							'flags'		=> $flags || "K"
						});
						#&main::logge_int("$akt_name: # ".$#{$main::cache->{'vornamen_namenstage'}->{$akt_name}->{'nt'}});
					} else
					{
						#&main::logge_int("Pushe $datum bei $akt_name ($flags)") if $akt_name eq "Lea";
						push(@{$main::cache->{'vornamen_namenstage'}->{$akt_name}->{$flags || "K"}},{
							'datum'		=> $datum,
							'person'	=> $konf,
							'desc'		=> $wer,
						});
					}
				}
				Storable::nstore($main::cache->{'vornamen_namenstage'},"$main::master->{'_path_data'}/vornamen/namenstage.idx");
			} else
			{
				&main::logge_int("Fehler! Namenstage-Cache $main::master->{'_path_data'}/vornamen/namenstage.txt nicht vorhanden",1);
			}
		}
	}
	my $zeit=&zeit(0);


	# Vorname bereinigen
	$vorname=~s/\/$//;
	$vorname=~s/\?\d+$//;
	$vorname=~s/^\s+//;
	$vorname=~s/\s+$//;

	# Potentiell gefährliche Symbole löschen
	$vorname=~s/[\|\{\}\*\.]//g;

	#
	# Validierungen, ob der aufgerufene Vorname gültig ist
	#
	if(length($vorname)>30)
	{
		$main::MESSAGE=&get410Text();
		return();
	}

	# Doppelname?
	my @temp=split(/[\s\-]/,$vorname);
	if($#temp>0)
	{
		my @dum;
		my $lfd=-1;
		foreach my $i (@temp)
		{
			$i=ucfirst(lc($i));
			if(exists($main::cache->{'vornamen'}->{$i}))
			{
				++$lfd;
				push(@dum,{
					'v'=>$i,
					'g'=>$main::cache->{'db'}->{'vornamen'}->{$main::cache->{'vornamen'}->{$i}}->{'geschlecht'}
				});
			}
		}
		if($#dum>-1)
		{
			return({
				'fehler'=>'sp',
				'vs'=>\@dum
			});
		}
	}

	# Existiert der Name?
	if(!exists($main::cache->{'vornamen'}->{$vorname}))
	{
		&main::logge_int("Vorname $vorname existiert nicht\n\tReferer: $ENV{'REQUEST_URI'}\n\tBrowser: $ENV{'HTTP_USER_AGENT'}");
#		if($main::ZWANG_LOKAL)
#		{
#			$main::MESSAGE=&get410Text();
#			return();
#		}
		return({'fehler'=>'ng'});
	}
	#&main::logge_int("GGG: $geschlecht / ".$main::VORNAMEN_GESCHLECHT->{$vorname});
	# Das richtige Geschlecht?
	if(length($geschlecht)>0 && $main::VORNAMEN_GESCHLECHT->{$vorname}!~/$geschlecht/)
	{
		&main::logge_int("Falsches Geschlecht $geschlecht bei $vorname ($main::VORNAMEN_GESCHLECHT->{$vorname})\n\tReferer: $ENV{'HTTP_REFERER'}\n\tBrowser: $ENV{'HTTP_USER_AGENT'}");
		return({'fehler'=>'fg'});
	}

	my $vid=$main::cache->{'vornamen'}->{$vorname};

	# Haben wir ein Geschlecht?
	if($geschlecht!~/[mw]/)
	{
		# Wir versuchen
		my $mg=$main::cache->{'db'}->{'vornamen'}->{$vid}->{'geschlecht'};
		if(!$mg)
		{
			&main::logge_int("Vorname $vorname (VID $vid) hat kein Geschlecht ($geschlecht)");
		} else
		{
			$geschlecht=$mg;
		}
	}





	# Ist der Vorname im temporären Cache?
	if(exists($main::cache->{'vornamendetails'}->{$geschlecht}->{$vorname}))
	{
		#&main::logge_int("Cache: Vorname gefunden: $vorname ($geschlecht)");
		#if($main::ZWANG_LOKAL<1)
		#{
			return $main::cache->{'vornamendetails'}->{$geschlecht}->{$vorname};
		#}
	}

	#
	# Nein, Vorname ist 'neu', also Daten einlesen:
	#

	#
	# Syntax:
	#
	#	$details = {
	#		beruehmt		=> ( $anz Prominente gefunden | Keine Promis gefunden)
	#		bibel_stufe	=> [1..6]
	#		geschlecht		=> [m, w]
	#		personen		=> # Promis
	#		vorname_hex	=> B%FCller
	#		vorname_ohne_umlaute
	#		parents		=> [
	#			{
	#				v:'Vorname Parent 1',
	#				g:'Geschlecht Parent 1',
	#				h:'Herkunft Parent 1',
	#				parents:'Weitere Parents von 1',
	#			},
	#		]
	#	}
	# DB-Verbindung aufbauen

	my $details={};

	# Zufallszahl für Zufallstexte anhand des Vornamens festlegen

	#&makeZufallszahl($vorname);
	$details->{'zufallszahl'}=int(rand(19))+1;
	$details->{'z1'}=int(rand(19))+1;
	$details->{'z2'}=int(rand(99))+1;


	# Welche Grafiken gibt es?
	my %zeit=&main::zeit;
	@temp=();
	opendir(DIR,"$main::master->{'_path'}/g/vornamen/bilder/$vorname");
	foreach my $file (readdir(DIR))
	{
		next if $file!~/jpg/;
		push(@temp,$file);
	}
	srand($zeit{'MM'}+(int($zeit{'TT'}/10))+$vid);
	#srand(time);
	@temp=&main::mischeListe(@temp);
	$details->{'fotos'}=\@temp;

	# Himmelskörper mit diesem Namen?
	# Zuerst die Asteroiden
	$details->{'himmelskoerper_anz'}=0;
	$details->{'himmelskoerper'}->{'asteroiden_anz'}=0;
	if(-e "/web/virtual/fb24svn/daten/vornamen/asteroiden/$vorname")
	{
		my @temp=split(/\n/,&main::hole_file("/web/virtual/fb24svn/daten/vornamen/asteroiden/$vorname"));
		my ($main,$rest)=split(/\t/,$temp[0]);
		my $anz=0;
		if(length($main)>1)
		{
			$details->{'himmelskoerper'}->{'asteroiden'}->{'main'}=$main;
			++$anz;
		}
		if(length($rest)>0 and length($vorname)>3)
		{
			@{$details->{'himmelskoerper'}->{'asteroiden'}->{'rest'}}=split(/,/,$rest);
			$anz+=$#{$details->{'himmelskoerper'}->{'asteroiden'}->{'rest'}}+1;
		}
		$details->{'himmelskoerper_anz'}+=$anz;
		$details->{'himmelskoerper'}->{'asteroiden_anz'}+=$anz;
	}


	# Biblischer Vorname?
	#&main::logge_int("Suche /web/virtual/fb24svn/daten/vornamen/bibel/$vorname.txt");
	if(-e "/web/virtual/fb24svn/daten/vornamen/bibel/$vorname.txt")
	{
		#&main::logge_int("BIBEL: $vorname");
		my @bibel=split(/\n/,&main::hole_file("/web/virtual/fb24svn/daten/vornamen/bibel/$vorname.txt"));
		$details->{'bibel_anz'}=($#bibel+1);
		if($#bibel<3)
		{
			$details->{'bibel_stufe'}=1;
		} elsif($#bibel<6)
		{
			$details->{'bibel_stufe'}=2;
		} elsif($#bibel<15)
		{
			$details->{'bibel_stufe'}=3;
		}  elsif($#bibel<50)
		{
			$details->{'bibel_stufe'}=4;
		}  elsif($#bibel<250)
		{
			$details->{'bibel_stufe'}=5;
		} else
		{
			$details->{'bibel_stufe'}=6;
		}
	}

	$details->{'vorname_ohne_umlaute'}=&gar_keine_umlaute($vorname);
	&main::db_connect(1);
	# Nach Vornamen suchen
#	goto neu;
#&main::logge_int("TTTTTTTT");

	$v=decode_utf8($vorname);
	#utf8::upgrade($v);
	#&main::logge_int("Q: select * from vornamen where vorname='$v' and geschlecht='$geschlecht' limit 10");
	my $erg=$main::DB->query("select * from vornamen where vorname='$v' and geschlecht='$geschlecht' limit 10");
	while(my %temp=$erg->fetchhash)
	{
		next if $temp{'vorname'} ne $vorname;
		foreach my $i (keys %temp)
		{
			#&main::logge_int(">>>>>>>> $i = $temp{$i}");
			$details->{$i}=$temp{$i};
		}
		last;
	}
	#srand($details->{'vid'});
	goto ohne_neu;
neu:
	%$details=%{$main::cache->{'db'}->{'vornamen'}->{$vid}};



ohne_neu:
	my @info_kurz;
	my @info_lang;

	$details->{'geschlecht'}||=$geschlecht;

	if($details->{'personen'}=~/^\d+$/)
	{
		my $anz=&commify($details->{'personen'},".");
		if($details->{'personen'}>1)
		{
			my @temp=&main::mischeListe(
				"$anz Prominente gefunden",
				"$anz Prominente mit Vornamen $details->{'vorname'}",
				"$anz Berühmtheiten gefunden",
				"$anz Berühmtheiten namens $details->{'vorname'}",
				"$anz Promis namens $details->{'vorname'}",
				"$anz Prominente namens $details->{'vorname'}",
				"$anz berühmte Persönlichkeiten",
				"$anz berühmte Persönlichkeiten gefunden",
			);
			$details->{'beruehmt'}=shift(@temp);
		} else
		{
			if($details->{'geschlecht'}=~/m/)
			{
				$details->{'beruehmt'}="$details->{'personen'} Prominenter gefunden";
			} else
			{
				$details->{'beruehmt'}="$details->{'personen'} Prominente gefunden";
			}
		}
	}
	if(length($details->{'beruehmt'})<2)
	{
		my @temp=&main::mischeListe(
			"Leider keine Promis bekannt",
			"Keine Prominenten bekannt",
			"Keine Promis mit Vornamen $vorname bekannt"
		);
		$details->{'beruehmt'}=shift(@temp);
	}
	#&main::logge_int("P: $details->{'personen'} / $details->{'beruehmt'}");

	$details->{'vorname_hex'}=&main::getCleanFilename($details->{'vorname'});
#&main::logge_int("IIIIIIIIII: $vid / $details->{'vorname_hex'}");

	# Haben wir einen Parent-Vornamen? Dann holen wir von ihm noch die Details
	my @parents;
	my $parent={};

	if(length($details->{'parent'})>1)
	{
		&db_connect();
		my $vx=$details->{'parent'};
		my $lfx=0;
		#&main::logge_int("PPPPPPPPPPPPPPPPP: $vx");
		foreach my $pid (split(/, ?/,$vx))
		{
			my $erg=$main::DB->query("select vorname,bedeutung,herkunft,geschlecht,parent,vid from baby.vornamen where vorname='$pid'");
			#&main::logge_int("Frage (1) nach $pid: select vorname,bedeutung,herkunft,geschlecht,parent,vid from baby.vornamen where vorname='$pid'");
			my %temp;
			while(my %erg=$erg->fetchhash)
			{
				#&main::logge_int("OK: $erg{'geschlecht'} / $details->{'geschlecht'}");
				next if scalar(keys %temp)>0 and $erg{'geschlecht'} ne $details->{'geschlecht'};

				%temp=%erg;
			}
			#&main::logge_int("X: $temp{'vid'} / $temp{'geschlecht'}");
			next if !$temp{'geschlecht'};
			if($temp{'geschlecht'} eq "m")
			{
				$temp{'vlink'}="<i class='fa fa-arrow-circle-right text-gelb'></i> <a href='/vornamen/jungs/$temp{'vorname'}/index.html'>$temp{'vorname'}</a>";
			} else
			{
				$temp{'vlink'}="<i class='fa fa-arrow-circle-right text-gelb'></i> <a href='/vornamen/maedchen/$temp{'vorname'}/index.html'>$temp{'vorname'}</a>";
			}
			if(length($temp{'parent'})>1)
			{
				my @d=split(/,/,$temp{'parent'});
				if($#d==0)
				{
					#&main::logge_int("Frage (2) nach $d[0]");
					my $erg2=$main::DB->query("select vorname,bedeutung,herkunft,geschlecht,vid from vornamen where vorname='$d[0]'");
					my %temp2=$erg2->fetchhash;
					$temp2{'lv_parent'}=1;
					if($temp2{'geschlecht'} eq "m")
					{
						$temp2{'vlink'}="<i class='fa fa-arrow-circle-right text-gelb'></i> <a href='/vornamen/jungs/$temp2{'vorname'}/index.html'>$temp2{'vorname'}</a>";
					} else
					{
						$temp2{'vlink'}="<i class='fa fa-arrow-circle-right text-gelb'></i> <a href='/vornamen/maedchen/$temp2{'vorname'}/index.html'>$temp2{'vorname'}</a>";
					}
					push(@{$temp{'parents'}},\%temp2);
				} else
				{
					#&main::logge_int("vornamen.pl:	FEHLER 378434 bei Vorname $details->{'vorname'} ($details->{'vid'}), Parent $temp{'parent'}");
				}
			}
			push(@parents,\%temp);
		}
		goto dbrestb;
dbresta:
		# Nur der erste Parent wird geholt einstweilen
		$vx=~s/^(.*?),.*$/$1/;

		my $erg=$main::DB->query("select * from vornamen where vorname='$vx'");
		my %temp=$erg->fetchhash;


		if($details->{'geschlecht'} ne $temp{'geschlecht'})
		{
			$details->{'geschlecht_parent'}=$temp{'geschlecht'};
		}

	#	if($details->{'geschlecht'} ne $temp{'geschlecht'})
	#	{
	#		$details->{'geschlecht_parent'}=$temp{'geschlecht'};
	#	}

		foreach my $i (keys %temp)
		{
			$parent->{$i}||=decode_utf8($temp{$i});
		}

		if(length($temp{'parent'})>0)
		{
			$vx=$temp{'parent'};
			++$lfx;
			if($lfx<2)
			{
				#goto dbresta;
			}
		}
dbrestb:
		#&main::logge_int("P: @parents");
	}



	#
	# Info-Text zusammenstellen, wenn nicht vorhanden
	#
	# Allgemein-Text
	#if(!exists($details->{'info'}) or length($details->{'info'})<4)
	#{
		if(length($details->{'parent'})>1)
		{
			#  $Herkunft zusammenstellen
			my $herkunft="";
			my $herkunft_kurz="";

			my @h=split(/, ?/,$details->{'herkunft'});
			if($#h==0)
			{
				$herkunft.="$details->{'herkunft'}e";
			} elsif($#h==1)
			{
				$herkunft.="$h[0]e und $h[1]e";
			} elsif($#h>6)
			{
				$herkunft=&main::getSatz(
					'sehr weit verbreitete',
					'weltweit verbreitete',
					'sehr häufige'
				);
			} elsif($#h>1)
			{
				$herkunft.=join("e, ",@h[0..1])."e und ".$h[2]."e";
			}
			#&main::logge_int("H: $herkunft / $details->{'herkunft'}");
			if($h[0] eq $details->{'herkunft'})
			{
				$herkunft_kurz="Andere ";
			} else
			{
				$herkunft_kurz=$herkunft;
			}
			if(length($herkunft)>2)
			{
#				my $zu=rand(10);
#				if($zu>8)
#				{
#					if(!$g)
#					{
#						$herkunft=ucfirst($herkunft);
#					} else
#					{
#						$g2.=", ";
#					}
#					$details->{'info'}="\u${g2} $herkunft Form von $details->{'parent'}.";
#				} elsif($zu>5)
#				{
#					$details->{'info'}="Bei dem Vornamen $vorname handelt es sich um die $g2 $herkunft Form von $details->{'parent'}.";
#				} else
#				{
#					$details->{'info'}="Der Vorname $vorname ist die $g2 $herkunft Form von $details->{'parent'}.";
#				}
				#&main::logge_int("Anzahl Parents: ".($#parents+1));
				if($#parents==0)
				{
					# Anderes Geschlecht als Parent?
					my $g;
					my $g2;
					#&main::logge_int("G1: ".$parents[0]->{'geschlecht'}." / ".$parents[0]->{'vid'});
					#&main::logge_int("G2: ".$parent[0]->{'geschlecht'});

					if($details->{'geschlecht'} ne $parents[0]->{'geschlecht'})
					{
						if($details->{'geschlecht'} eq "m")
						{
							$g="männliche Form ";
							$g2="männliche";
						} elsif($details->{'geschlecht'} eq "w")
						{
							$g="weibliche Form ";
							$g2="weibliche";
						}
					}

					my @temp=&main::mischeListe(
						"Der Vorname $vorname ist die $g2 $herkunft Form von $parents[0]->{'vlink'}.",
						"Bei dem Vornamen $vorname handelt es sich um die $g2 $herkunft Form von $parents[0]->{'vlink'}.",
					);
					my $te=shift(@temp);
					$te=~s/^\s+//;
					push(@info_lang,ucfirst($te));

					if($herkunft ne $details->{'herkunft'}."e" or length($g2)>2)
					{
						@temp=&main::mischeListe(
							"\u$g2 $herkunft Form von $parents[0]->{'vlink'}",
							"$vorname ist die $g2 (${herkunft}) Form von $parents[0]->{'vlink'}.",
						);
					} else
					{
						@temp=&main::mischeListe(
							"Andere Form von $parents[0]->{'vlink'}",
							"Ableitung von $parents[0]->{'vlink'}.",
							"$vorname ist eine Form von $parents[0]->{'vlink'}.",
						);
					}
					$te=shift(@temp);
					$te=~s/^\s+//;
					push(@info_kurz,ucfirst($te));
				} elsif($#parents==1)
				{
					my @dum=split(/, ?/,$parents[0]->{'herkunft'});
					my $h1=shift(@dum);
					@dum=split(/, ?/,$parents[1]->{'herkunft'});
					my $h2=shift(@dum);
					my $form="eine Form";
					my $herkunft="";
					my $herkunft_e="";

					my @h_o=split(/, ?/,$details->{'herkunft'});
					if($#h_o==0)
					{
						if($details->{'herkunft'} ne $h1)
						{
							$form="die $details->{'herkunft'}e Form";
						}
						$herkunft=$details->{'herkunft'};
						$herkunft_e=$details->{'herkunft'}."e ";
						$form=~s/, ?/e bzw. /;
						#$herkunft_=~s/, ?/e bzw. /;
					}
					#&main::logge_int("HHHHHHHHHHH: $details->{'herkunft'} / $form / $h1");
					my @temp;
					if($h1 ne $h2)
					{
						@temp=&main::mischeListe(
							"Der ${herkunft_e}Vorname $vorname kann von zwei verschiedenen Vornamen abgeleitet werden: Zum einen vom ${h1}en $parents[0]->{'vlink'} und zum anderen vom ${h2}en Vornamen $parents[1]->{'vlink'} ",
						);
					} else
					{
						@temp=&main::mischeListe(
							"Der ${herkunft_e}Vorname $vorname kann von zwei verschiedenen Vornamen abgeleitet werden (beide $parents[0]->{'herkunft'}): $parents[0]->{'vlink'} und $parents[1]->{'vlink'}",
						);
					}
					push(@info_lang,shift(@temp));

					if($h1 ne $h2)
					{
						@temp=&main::mischeListe(
							"$vorname ist $form von zwei verschiedenen Vornamen: ${h1} $parents[0]->{'vlink'} und ${h2} $parents[1]->{'vlink'}",
							"$vorname ist zum einen $form von $parents[0]->{'vlink'} (${h1}) und zum anderen von $parents[1]->{'vlink'} (${h2})",
							"$vorname ist zum einen $form des ${h1}en $parents[0]->{'vlink'} und zum anderen eine Form des ${h2}en Namens $parents[1]->{'vlink'}",
							"$vorname kann abgeleitet werden als $form der beiden Vornamen ${h1} $parents[0]->{'vlink'} und ${h2} $parents[1]->{'vlink'}",
						);
					} else
					{
						@temp=&main::mischeListe(
							"Der Vorname $vorname ist $form der beiden ($parents[0]->{'herkunft'}en) Vornamen $parents[0]->{'vlink'} und $parents[1]->{'vlink'}",
						);
					}
					#&main::logge_int("BBBBBBB: @temp");
					push(@info_kurz,shift(@temp));
				}
			} else
			{
				#$details->{'info'}="Keine weiteren Informationen zur Herkunft";
			}
		} else
		{
			# Herkunft
			my ($he1,$he2);
			if(length($details->{'herkunft'})>1)
			{
				#&main::logge_int("HHHHHHHHHHHH: $details->{'herkunft'}");
				my @temp=split(/,/,$details->{'herkunft'});
				if($#temp>3)
				{
					my @temp2=&mischeListe(
						"mit Quellen aus vielen verschiedenen Ländern",
						"der seinen Ursprung in vielen Ländern und Sprachen hat",
						"der seinen Ursprung in vielen Ländern und Sprachen dieser Welt hat",
						"mit vielfältigen Quellen",
					);
					$he2=shift(@temp2);
				} elsif($#temp==1)
				{
					my @temp2=&mischeListe(
						"der seinen Ursprung im \u$temp[0]en und \u$temp[1]en  hat",
						"der seinen Ursprung im $temp[0]en und $temp[1]en Sprachraum hat",
						"der aus dem \u$temp[0]en oder auch dem \u$temp[1]en stammt",
						"der aus dem \u$temp[0]en bzw. aus dem \u$temp[1]en kommt",
					);
					$he2=shift(@temp2);
				} elsif($#temp==0)
				{
					if(rand(10)>5)
					{
						$he1="$temp[0]er";
					} else
					{
						my @temp=&mischeListe(
							"aus dem \u$temp[0]en",
							"aus dem $temp[0]en Sprachraum",
							"aus der $temp[0]en Sprache",
							"mit Wurzeln im \u$temp[0]en",
							"der seine Wurzeln im \u$temp[0]en hat",
						);
						$he2=shift(@temp);
					}
				}
			}
			my $rand=int(10);

			my @temp=&mischeListe(
				"Der Vorname $vorname",
				"Dieser Vorname",
				"Dieser Name",
				"$vorname",
				"$vorname",
				"$vorname",
			);
			my $einl=shift(@temp);
			my $g1;
			my $g2;
			if($details->{'geschlecht'} eq "m")
			{
				my @temp=&main::getZufallstext('jungs');
				$g1=shift(@temp);
				@temp=&mischeListe("männlicher");
				$g2=shift(@temp);
			} else
			{
				my @temp=&main::getZufallstext('maedchen');
				$g1=shift(@temp);
				@temp=&mischeListe("weiblicher");
				$g2=shift(@temp);
			}
			my $biblisch="";
			if($rand<5 && $details->{'bibel_anz'}>0)
			{
				my @temp=&mischeListe(
					"(schon in der Bibel erwähnter)",
					"(bereits in der Bibel erwähnter)",
					" biblischer",
				);
				$biblisch=" ".shift(@temp);
			}
			@temp=&mischeListe(
				"ist ein$biblisch $he1 $g2 Vorname",
				"ist ein$biblisch $he1 Vorname für $g1"
			);
			$einl.=" ".shift(@temp)." $he2";
			if($rand>=5 && $details->{'bibel_anz'}>1)
			{
				my @temp=&mischeListe(
					" mit Erwähnungen bereits in der Bibel",
				);
				$einl.=shift(@temp);
			}
			push(@info_lang,$einl);
			push(@info_kurz,$einl);
			#$details->{'info'}=$einl.". ";
			#$details->{'info'}=~s/ \./\./;
		}


	#
	if($details->{'info'}=~s/unisex//)
	{
		my @temp=&main::mischeListe(
			"Der Name $vorname kann sowohl für Jungen als auch für Mädchen benutzt werden",
			"Bei dem Namen $vorname handelt es sich um einen Unisex-Namen",
			"$vorname ist ein Unisex-Name für Jungs und Mädchen",
			"$vorname ist ein Unisex-Name",
			"$vorname ist ein nicht eindeutig einem Geschlecht zugeordneter Vorname. $vorname kann also sowohl für Mädchen als auch Jungs vergeben werden".
			"$vorname ist ein gleichgeschlechtlicher Name",
			"$vorname ist ein gleichgeschlechtlicher Name (für Jungs und Mädchen)",
			"Bei dem Vornamen $vorname handelt es sich um einen Unisex-Vornamen für Jungs und Mädchen",
			"$vorname ist ein Unisex-Vorname für Männer und Frauen",
			"$vorname ist ein gleichgeschlechtlicher Vorname für Mädchen und Jungs",
			"$vorname kann sowohl von Männern als auch von Frauen getragen werden",
			"Der Vorname $vorname kann sowohl von Männern als auch von Frauen getragen werden",
			"$vorname ist ein Vorname, der sowohl für weibliche als auch für männliche Personen gebraucht wird",
			"$vorname ist ein Vorname, der sowohl für weibliche als auch für männliche Personen vorkommt",
			"$vorname ist als Vorname sowohl für weibliche als auch für männliche Personen möglich",
			"$vorname ist sowohl als weiblicher wie auch als männlicher Vorname in Gebrauch",
			"$vorname ist ein sog. gleichgeschlechtlicher Vorname (also für Jungs und Mädchen gleichermassen geeignet)",
			"$vorname ist ein sogenannter gleichgeschlechtlicher Vorname",
		);
		my $s=shift(@temp);

		@temp=&main::mischeListe(
			", zur eindeutigen Zuordnung muss daher ein zweiter Vorname vergeben werden",
			", zur eindeutigen Zuordnung muss daher in Deutschland ein zweiter Vorname vergeben werden",
			", daher ist ein zweiter (eindeutiger) Vorname zu vergeben",
			", daher ist noch ein weiterer (eindeutiger) Vorname notwendig",
			", daher ist in Deutschland noch ein weiterer (eindeutiger) Vorname notwendig",
			", daher ist ein zweiter (eindeutiger) Vorname notwendig",
			", daher ist bei uns in Deutschland ein zweiter (eindeutiger) Vorname notwendig",
			", ein zweiter (eindeutiger) Vorname ist daher nötig",
		);
		$s.=shift(@temp).". ";

		push(@info_lang,$s);

		 @temp=&main::mischeListe(
			"$vorname ist ein Unisex-Name für Jungs und Mädchen",
			"$vorname ist ein Unisex-Name für Jungs &amp; Mädchen",
			"$vorname ist ein Unisex-Name für Mädchen und Jungs",
			"$vorname ist ein Unisex-Name für Mädchen &amp; Jungs",
			"$vorname ist ein Unisex-Name",
			"$vorname ist ein gleichgeschlechtlicher Name",
			"$vorname ist ein gleichgeschlechtlicher Name (für Jungs und Mädchen)",
			"$vorname ist ein Unisex-Vorname für Männer und Frauen",
			"$vorname ist ein sogenannter gleichgeschlechtlicher Vorname",
			"$vorname ist ein Vorname, der gleichermassen für Jungs wie für Mädchen vergeben werden kann",
			"$vorname ist ein Vorname, der gleichermassen für Jungs wie für Mädchen genutzt wird",
			"Der Vorname $vorname kann sowohl für Jungs als auch für Mädchen vergeben werden.",
		);
		push(@info_kurz,shift(@temp));
	}

	$details->{'geschlecht_lang'}= $details->{'geschlecht'}=~/m/i ? "jungs" : "maedchen";

	my $text="";
	if($details->{'info'}=~s/KURZ;(.*?)( |$)/dfjasfawer/)
	{
		my @felder=split(/;/,$1);
		shift(@felder) if length($felder[0])==0;
		&main::logge_int("KURZ - Anfang: @felder (".($#felder).")");

		if($#felder==0)
		{
			my($herkunft,$formen);
			if($felder[0]=~/^(.*?):(.*?)$/)
			{
				$herkunft=$1;
				$formen=$2;
			} else
			{
				$formen=$felder[0];
			}
			#&main::logge_int("KURZ - formen: $formen");
			$herkunft||=$details->{'herkunft'};
			if($herkunft=~/,/)
			{
			} else
			{
				$herkunft.="e";
			}

			$herkunft="" if length($herkunft)>18;
			my @temp;

			if($formen=~/,/)
			{
				my @f;
				foreach my $i (split(/, ?/,$formen))
				{
					if(length($i)>0)
					{
						push(@f,"<i class='fa fa-arrow-circle-right text-gelb'></i> <a href='/vornamen/$details->{'geschlecht_lang'}/$i/index.html'>$i</a>");
					}
				}
				if($#f==1)
				{
					my @temp=&mischeListe(
						"und",
						"bzw.",
						"beziehungsweise"
					);
					my $bw=" ".shift(@temp)." ";
					$formen=join($bw,@f);
				} elsif($#f>1)
				{
					my @temp=&mischeListe(
						"und",
						"und",
						"oder auch",
						"und schließlich",
					);

					my $bw=" ".shift(@temp)." ";
					$formen=join(", ",@f[0..$#f-1]).$bw.pop(@f);
				}
				@temp=&mischeListe(
					"Abkürzung",
					"Kurzform",
					"Kurzform",
					"gekürzte Form",
				);
				my $als=shift(@temp);
				if($#f==1)
				{
					@temp=&mischeListe(
						"Der Vorname $vorname ist eine gebräuchliche Kurzform folgender Varianten: $formen",
						"Der Vorname $vorname dient als $herkunft $als von Namen wie $formen",
						"Der Vorname $vorname ist die $herkunft Kurzform von $formen",
						"Der Vorname $vorname ist die $herkunft $als von Namen wie $formen",
						"Die Namen $formen sind der Ursprung von $vorname, denn dieser dient als Kurzform dieser beiden Vornamen",
						"Die Namen $formen können als Ursprung von $vorname gesehen werden, denn dieser dient als Kurzform von diesen beiden Vornamen",
						"Im \u${herkunft}n ist $vorname die $als der beiden Vornamen $formen",
						"$vorname wird im \u${herkunft}n als $als von Namen wie $formen genutzt",
						"Der Vorname $vorname ist die $herkunft $als von Vornamen wie $formen",
					);
				} else
				{
					@temp=&mischeListe(
						"Der Vorname $vorname dient als $herkunft $als von Namen wie $formen",
						"Der Vorname $vorname ist die $herkunft $als von Namen wie $formen",
						"Die Namen $formen sind der Ursprung von $vorname, denn dieser dient als Kurzform der genannten Namen",
						"Die Namen $formen sind der Ursprung von $vorname, denn dieser dient als Kurzform bzw. Koseform der genannten Namen",
						"Die Namen $formen können als Ursprung von $vorname gesehen werden, denn dieser dient diesen als Kurzform",
						"Die Namen $formen können als Ursprung von $vorname gesehen werden, denn dieser dient den geneannnten Namen als Kurzform",
						"Im \u${herkunft}n ist $vorname die $als der Vornamen $formen",
						"$vorname wird im \u${herkunft}n als $als von Namen wie $formen genutzt",
						"Der Vorname $vorname ist die $herkunft $als von Vornamen wie $formen",

					);
				}
			} else
			{
				$formen="<i class='fa fa-arrow-circle-right text-gelb'></i> <a href='/vornamen/$details->{'geschlecht_lang'}/$formen/index.html'>$formen</a>";
				@temp=&mischeListe(
						"Der Vorname $vorname ist die Kurzform von $formen",
						"$vorname ist die Kurzform von $formen",
						"$vorname ist die Kurz- bzw. Koseform des Vornamen $formen",
						"Der Vorname $formen ist der Ursprung von $vorname, denn das ist die Kurz- oder Koseform davon",
						"Der Vorname $vorname wird als Kurz- und Koseform von $formen genutzt",
						"Der Vorname $vorname wird als Kurz- und Koseform von $formen verwendet",
				);
			}
			$text=shift(@temp).". ";
		} elsif($#felder<0)
		{
			$text="Hosas!";
		} else
		{
			$text="XYZ";
		}
		$details->{'info'}=~s/dfjasfawer/$text/g;
	}
	#$details->{'info'}=~s/dfjasfawer/$text/g;
	#&main::logge_int("F: $details->{'info'}");

	if($details->{'info'}=~/KOMBI:(.*?)\+(.*?)( |$)/)
	{
		my($h1,$h2)=($1,$2);
		my $v1="<i class='fa fa-arrow-circle-right text-gelb'></i> <a href='/vornamen/$details->{'geschlecht_lang'}/$h1/index.html'>$h1</a>";
		my $v2="<i class='fa fa-arrow-circle-right text-gelb'></i> <a href='/vornamen/$details->{'geschlecht_lang'}/$h2/index.html'>$h2</a>";
		my @temp=&main::mischeListe(
			"$vorname wird aus den beiden Vornamen $v1 und $v2 zusammengesetzt",
			"$vorname ist eine Kombination aus den beiden Vornamen $v1 und $v2",
			"$vorname ist eine zusammengesetzte Form aus den beiden Vornamen $v1 und $v2",
			"$vorname ist ein Doppelname aus $v1 und $v2",
		);
		#my $text=shift(@temp).". ";
		push(@info_lang,shift(@temp));


		@temp=&main::mischeListe(
			"Zusammengesetzte Form aus $v1 und $v2",
			"Kombination aus den beiden Vornamen $v1 und $v2",
			"Doppelname aus $v1 und $v2",
		);
		#my $text=shift(@temp).". ";
		push(@info_kurz,shift(@temp));


		$details->{'info'}=~s/KOMBI:(.*?)\+(.*?)( |$)/$3/;
	}

	$details->{'info'}=~s/^\s+//;
	$details->{'info'}=~s/\s+$//;
	if(length($details->{'info'})>3)
	{
		my @d=split(/_li_/,$details->{'info'});
		push(@info_lang,@d);
		foreach my $dd (@d)
		{
			my $d2=$dd;
			$d2=~s/<.*?>//g;
			if(length($d2)>280)
			{
				$dd=substr($dd,0,277)." [...]";
			}
			push(@info_kurz,$dd);
		}
	}

	#
	# Doppelnamen
	#
	$details->{'anz_doppel'}=0;
	if(-e "$main::master->{'_path_data'}/vornamen/doppelnamen/$details->{'geschlecht'}_$details->{'vorname_hex'}.idx")
	{
		#&main::logge_int("Lade Doppel $main::master->{'_path_data'}/vornamen/doppelnamen/$vorname.idx",1);
		my $hit=retrieve("$main::master->{'_path_data'}/vornamen/doppelnamen/$details->{'geschlecht'}_$details->{'vorname_hex'}.idx");
		#warn("Doppel geladen");
		#foreach my $i (sort {$hit->{'telefon'}->{$b}<=>$hit->{'telefon'}->{$a}} keys %{$hit->{'telefon'}})
		my $anzahl=0;
		$details->{'doppelnamen_first'}=0;
		$details->{'doppelnamen_naechste'}=0;
		foreach my $i (sort {$hit->{$b}<=>$hit->{$a}} keys %{$hit})
		{
			my $i2=$i;#encode_utf8($i);
			++$details->{'anz_doppel'};
			$anzahl+=$hit->{$i};
			my @temp=split(/[ \-]+/,$i);
			if($temp[0] eq $vorname)
			{
				$details->{'doppelnamen_first'}+=1;#$hit->{$i};
			} else
			{
				$details->{'doppelnamen_naechste'}+=1;#$hit->{$i};
			}

			foreach my $j (@temp)
			{
				my $i2=ucfirst($j);
				next if $i2 eq $details->{'vorname'};
				$details->{'doppelnamen_top'}->{$i2}||=0;
				$details->{'doppelnamen_top'}->{$i2}+=$hit->{$i};
			}

			if($#temp==1)
			{
				$details->{'doppelnamen_anz1'}||=0;
				$details->{'doppelnamen_anz1'}+=$hit->{$i};
			} elsif($#temp==2)
			{
				$details->{'doppelnamen_anz2'}||=0;
				$details->{'doppelnamen_anz2'}+=$hit->{$i};
			} elsif($#temp>2)
			{
				$details->{'doppelnamen_anz3'}||=0;
				$details->{'doppelnamen_anz3'}+=$hit->{$i};
			}
			$details->{'doppelnamen'}.=$i2." ($hit->{$i} x)<br/>\n";
		}


		# Wieviel % haben einen Doppelnamen?
		#&main::logge_int("LLLLLLLL: $details->{'geburten'} + $details->{'menschen'}");
		my $menschen=$details->{'menschen'}+$details->{'geburten'};
		$menschen=~s/\.//g;
		if($menschen>80)
		{
			my $proz=int(($anzahl*100)/$menschen);
			#&main::logge_int("$details->{'vorname'}: Menschen: $menschen. Anz Doppel: $anzahl = $proz %");
			my $nt='';
			my $nt2='';
			my $jeder;
			if($details->{'geschlecht'} eq "w")
			{
				$jeder="jede";
				my @temp=&mischeListe(
					"Namensträgerinnen",
					"Namensträgerinnen",
					"Namensträgerinnen",
					"Trägerinnen dieses Namens",
					"Frauen und Mädchen",
					"Personen"
				);
				$nt=shift(@temp);
				@temp=&mischeListe(
					"Namensträgerin",
					"Namensträgerin",
					"Namensträgerin",
					"Trägerin dieses Namens",
					"Frau",
					"Person"
				);
				$nt2=shift(@temp);
			} else
			{
				$jeder="jeder";
				my @temp=&mischeListe(
					"Namensträger",
					"Namensträger",
					"Namensträger",
					"Träger dieses Namens",
					"Männer und Jungs",
					"Personen"
				);
				$nt=shift(@temp);
				@temp=&mischeListe(
					"Namensträger",
					"Namensträger",
					"Namensträger",
					"Träger dieses Namens",
					"Mann",
					"Junge"
				);
				$nt2=shift(@temp);
			}
			my @temp=&mischeListe(
				"haben",
				"haben",
				"besitzen",
				"führen",
				"tragen",
			);
			my $haben=shift(@temp);
			if($proz>80)
			{
				&main::logge_int("Viele % bei Doppelnamen (Vorname $details->{'vorname'}): Menschen: $menschen. Anz Doppel: $anzahl = $proz %");
				my @temp=&main::mischeListe(
				);
				#$details->{'doppelnamen_text'}=shift(@temp);
			} elsif($proz>65)
			{
				my @temp=&main::mischeListe(
					"Der Vorname $details->{'vorname'} wird recht ".&main::getZufallstext('oft')." mit anderen Vornamen kombiniert, denn mehr als $proz% aller $nt $haben noch weitere Vornamen",
					"Der Vorname $details->{'vorname'} wird ".&main::getZufallstext('oft')." mit anderen Vornamen kombiniert, denn mehr als $proz% aller $nt $haben noch weitere Vornamen",
					"Der Vorname $details->{'vorname'} steht selten für sich alleine, die meisten $nt ($proz%) haben noch einen oder mehrere andere Vornamen",
					"$details->{'vorname'} ist ein beliebter Zweitvorname, mehr als $proz% aller $nt $haben noch mindestens einen weiteren Vornamen",
					"Menschen namens $details->{'vorname'} haben in vielen Fällen ($proz%) mehr als nur diesen einen Vornamen",
					"Recht viele Menschen (genauer: $proz%) namens $details->{'vorname'} haben noch mindestens einen weiteren Vornamen",
					"Der Vorname $details->{'vorname'} wird ".&main::getZufallstext('oft')." häufig für Vornamen-Kombinationen genommen, bei mehr als $proz% aller $nt sind mindestens noch ein weiterer Vorname vorhanden",
					"$details->{'vorname'} ist ein sehr beliebter Vorname für Vornamen-Kombinationen, denn mehr als $proz% aller $nt $haben noch mindestens einen weiteren Vornamen",
				);
				$details->{'doppelnamen_text'}=shift(@temp).". ";
				@temp=&main::mischeListe(
					"zusammengestellt",
					"kombiniert",
					"zusammengestellt",
					"kombiniert",
					"verknüpft"
				);
				@temp=&main::mischeListe(
					"$details->{'vorname'} wird sehr oft ($proz%) mit anderen Vornamen kombiniert",
					"$details->{'vorname'} wird eher selten alleine getragen, in $proz% aller Fälle wurde $details->{'vorname'} mit anderen Vornamen kombiniert",
					"$details->{'vorname'} wird eher selten alleine getragen, in $proz% aller Fälle wurde $details->{'vorname'} mit anderen Vornamen zusammengestellt",
					"$details->{'vorname'} wird sehr gerne (in $proz% aller Namensträger) mit anderen Vornamen kombiniert",
					"$details->{'vorname'} wird sehr gerne (in $proz% aller Namensträger) zusammen mit anderen Vornamen kombiniert",
					"Außergewöhnlich viele Eltern haben sich dafür entschieden, ihrem Kind außer $details->{'vorname'} noch einen oder sogar mehrere andere Vornamen zu geben",
					"$details->{'vorname'} ist außergewöhnlich oft in Kombination mit anderen Vornamen anzutreffen, $proz% aller $nt haben neben $details->{'vorname'} noch mindestens einen weiteren Vornamen.",
					"$details->{'vorname'} ist ein Vorname, der sehr oft ($proz%) gemeinsam mit anderen Vornamen anzutreffen ist",
					"$details->{'vorname'} ist ein Vorname, der bei außergewöhnlich häufig (genauer: in $proz% aller Fälle) gemeinsam mit anderen Vornamen anzutreffen ist - ein typischer Zweit-Vorname also",
					"$details->{'vorname'} ist ein typischer Zweit-Vorname, der wirklich häufig (genauer: in $proz% aller Fälle) mit anderen Vornamen kombiniert wird",
					"$details->{'vorname'} ist ein typischer Zweitvorname, der in $proz% aller Fälle mit anderen Vornamen kombiniert wurde",
				);
				$details->{'doppelnamen_text_kurz'}.=shift(@temp).". ";
			} elsif($proz>50)
			{
				my @temp=&main::mischeListe(
					"Der Vorname $details->{'vorname'} wird in über der Hälfte der Fälle mit anderen Vornamen kombiniert, denn mehr als jeder zweite Namensträger von $details->{'vorname'} trägt noch weitere Vornamen",
				);
				$details->{'doppelnamen_text'}=shift(@temp).". ";
				@temp=&main::mischeListe(
					"$details->{'vorname'} wird in mehr als der Hälfte aller Fälle ($proz%) mit anderen Vornamen kombiniert",
					"Mehr als die Hälfte aller Eltern haben sich dafür entschieden, $details->{'vorname'} mit einem oder mehreren anderen Vornamen zu kombinieren. $details->{'vorname'} ist also ein typischer Zweitvorname",
					"$details->{'vorname'} ist ganz besonders in Kombination mit anderen Vornamen beliebt, $proz% aller $nt haben neben $details->{'vorname'} noch mindestens einen weiteren Vornamen.",
					"$details->{'vorname'} ist ein typischer Zweit-Vorname, der bei mehr als der Hälfte aller $nt (genauer: $proz%) gemeinsam mit anderen Vornamen anzutreffen ist",
					"$details->{'vorname'} ist ein typischer Doppel- oder Zweitvorname, der bei mehr als der Hälfte aller $nt (genauer: $proz%) gemeinsam mit anderen Vornamen anzutreffen ist - ein typischer Zweit-Vorname also",
					"$details->{'vorname'} ist sehr häufig Teil von Doppelnamen, denn bei mehr als der Hälfte aller $nt (genauer: $proz%) wurde $details->{'vorname'} mit anderen Vornamen kombiniert",
					"$details->{'vorname'} ist ein typischer Zweit-Vorname, der bei mehr als der Hälfte aller $nt (genauer: $proz%) mit anderen Vornamen kombiniert wurde",
					"$details->{'vorname'} ist ein typischer Zweitvorname, der bei mehr als der Hälfte aller $nt (genauer: $proz%) mit anderen Vornamen kombiniert wurde",
					"$details->{'vorname'} ist ein typischer Zweitvorname, der bei mehr als der Hälfte aller $nt (genauer: $proz%) mit einem oder mehreren weiteren Vornamen kombiniert wurde",
					"$details->{'vorname'} ist ein Vorname, der typischerweise mit anderen Vornamen kombiniert wird. $proz% aller $nt mit Namen $details->{'vorname'} tragen außerdem noch einen oder weitere andere Vornamen",
					"Mehr als die Hälfte aller Kinder (genauer: $proz%), die $details->{'vorname'} als Namen von ihren Eltern bekommen haben, tragen außerdem noch einen oder mehrere andere Vornamen"
				);
				$details->{'doppelnamen_text_kurz'}.=shift(@temp).". ";
			} elsif($proz>43)
			{
				my @temp=&main::mischeListe(
					"Der Vorname $details->{'vorname'} wird in der Hälfte der Fälle mit anderen Vornamen kombiniert, denn ca. zweite Namensträger von $details->{'vorname'} trägt noch weitere Vornamen",
				);
				$details->{'doppelnamen_text'}=shift(@temp).". ";

				@temp=&main::mischeListe(
					"etwas weniger als",
					"nur etwas weniger als",
					"fast",
					"nahezu"
				);
				my $fast=shift(@temp);
				@temp=&main::mischeListe(
					"$details->{'vorname'} wird in fast der Hälfte aller Fälle ($proz%) mit anderen Vornamen kombiniert",
					"$details->{'vorname'} ist besonders in Kombination mit anderen Vornamen beliebt, $proz% aller $nt haben neben $details->{'vorname'} noch mindestens einen weiteren Vornamen.",
					"$details->{'vorname'} ist ein Vorname, der bei $fast der Hälfte aller $nt (genauer: $proz%) gemeinsam mit anderen Vornamen anzutreffen ist",
					"$details->{'vorname'} ist ein Vorname, der bei $fast der Hälfte aller $nt (genauer: $proz%) gemeinsam mit anderen Vornamen anzutreffen ist - ein typischer Zweit-Vorname also",
					"$details->{'vorname'} ist ein Vorname, der bei $fast der Hälfte aller $nt (genauer: $proz%) als Teil eines Doppelnamen oder als Zweitvorname dient",
					"$details->{'vorname'} ist ein typischer Zweit-Vorname, der bei $fast der Hälfte aller $nt (genauer: $proz%) mit anderen Vornamen kombiniert wurde",
					"$details->{'vorname'} ist ein typischer Zweitvorname, der bei $fast der Hälfte aller $nt (genauer: $proz%) mit anderen Vornamen kombiniert wurde",
					"$details->{'vorname'} ist ein typischer Zweitvorname, der bei $fast der Hälfte aller $nt (genauer: $proz%) mit einem oder mehreren weiteren Vornamen kombiniert wurde",
					"$details->{'vorname'} ist ein Vorname, der typischerweise mit anderen Vornamen kombiniert wird. $proz% aller $nt mit Namen $details->{'vorname'} tragen außerdem noch einen oder weitere andere Vornamen",
				);
				$details->{'doppelnamen_text_kurz'}.=shift(@temp).". ";
			} elsif($proz>31)
			{
				my @temp=&main::mischeListe(
				   "sehr gerne",
				   "sehr gerne und h&auml;ufig",
				   "h&auml;ufig",
				   "gerne und h&auml;ufig",
				   "gern und oft",
				   "besonders gerne",
				   "recht oft",
				   "recht h&auml;ufig",
				   "ziemlich oft"
				);
				my $gern=shift(@temp);
				@temp=&main::mischeListe(
					"Der Vorname $details->{'vorname'} wird $gern mit anderen Vornamen kombiniert, denn ".&main::getZufallstext('knapp')." $jeder dritte $nt2 von $details->{'vorname'} trägt noch weitere Vornamen",
					"Der Vorname $details->{'vorname'} wird $gern mit anderen Vornamen kombiniert, denn immerhin ".&main::getZufallstext('knapp')." $jeder dritte $nt2 von $details->{'vorname'} trägt noch weitere Vornamen",
					"&Uuml;ber ein Drittel aller $nt (genauer: $proz%) mit Namen $details->{'vorname'} tragen noch mindestens einen weiteren Vornamen",
					"&Uuml;ber ein Drittel aller $nt ($proz%) mit Namen $details->{'vorname'} tragen noch einen anderen Vornamen",
					"$proz% aller $nt namens $details->{'vorname'} haben noch einen anderen (oder mehrere) Vornamen - das ist ".&main::getZufallstext('knapp')." ein Drittel",
				);
				$details->{'doppelnamen_text'}=shift(@temp).". ";
				@temp=&main::mischeListe(
					"$details->{'vorname'} wird $gern mit anderen Vornamen kombiniert",
					"$details->{'vorname'} ist besonders in Kombination mit anderen Vornamen beliebt",
					"$details->{'vorname'} ist häufig ein Zweitvorname oder Bestandteil von Doppelnamen",
					"$details->{'vorname'} ist ein Vorname, der $gern gemeinsam mit anderen Vornamen vergeben wird",
				);
				$details->{'doppelnamen_text_kurz'}=shift(@temp);
				@temp=&main::mischeListe(
					", ".&main::getZufallstext('knapp')." ein Drittel (${proz}%) aller $nt $haben neben $details->{'vorname'} noch mindestens einen weiteren Vornamen.",
					", denn ".&main::getZufallstext('knapp')." jedes dritte Kind hat außer $details->{'vorname'} noch mindestens einen weiteren Vornamen.",
					" - ".&main::getZufallstext('knapp')." $jeder Dritte (${proz}%) hat neben $details->{'vorname'} noch mindestens einen weiteren Vornamen.",
					", denn ".&main::getZufallstext('knapp')." ein Drittel ($proz%) aller $nt $haben neben $details->{'vorname'} mindestens noch einen weiteren Vornamen.",
				);
				$details->{'doppelnamen_text_kurz'}.=shift(@temp);
			} elsif($proz>=25)
			{
				my @temp=&main::mischeListe(
					"Der Vorname $details->{'vorname'} wird ".&main::getZufallstext('oft')." mit anderen Vornamen kombiniert, mehr als jeder vierte Namensträger von $details->{'vorname'} trägt noch weitere Vornamen",
				);
				$details->{'doppelnamen_text'}=shift(@temp).". ";
				@temp=&main::mischeListe(
					"$details->{'vorname'} wird sehr gerne mit anderen Vornamen kombiniert",
					"$details->{'vorname'} ist besonders in Kombination mit anderen Vornamen beliebt",
					"$details->{'vorname'} ist sehr beliebt bei Vornamen-Kombinationen",
				);
				$details->{'doppelnamen_text_kurz'}=shift(@temp);
				@temp=&main::mischeListe(
					", ".&main::getZufallstext('knapp')." ein Viertel ($proz%) aller $nt haben neben $details->{'vorname'} noch mindestens einen weiteren Vornamen.",
					", denn ".&main::getZufallstext('knapp')." ein Viertel ($proz%) aller $nt haben mindestens noch einen weiteren Vornamen.",
				);
				$details->{'doppelnamen_text_kurz'}.=shift(@temp);
			} elsif($proz>=18)
			{
			      my @temp=&main::mischeListe(
					"Der Vorname $details->{'vorname'} wird ".&main::getZufallstext('manchmal')." mit anderen Vornamen kombiniert, ".&main::getZufallstext('knapp')." $jeder fünfte $nt von $details->{'vorname'} trägt noch mind. einen weiteren Vornamen",
					"Der Vorname $details->{'vorname'} wird ".&main::getZufallstext('manchmal')." mit anderen Vornamen kombiniert, ".&main::getZufallstext('knapp')." jeder fünfte ($proz%) Mensch namens $details->{'vorname'} f&uuml;hrt noch mindestens einen weiteren Vornamen",
					"Der Vorname $details->{'vorname'} wird ".&main::getZufallstext('manchmal')." mit anderen Vornamen zusammen kombiniert, ".&main::getZufallstext('knapp')." jeder fünfte ($proz%) Mensch namens $details->{'vorname'} noch einen oder mehrere andere Vornamen",
					"Manche Eltern ($proz%) - nicht allzu viele allerdings - haben ihrem Kind au&szlig;er $details->{'vorname'} noch weitere Vornamen gegeben",
					"F&uuml;r eine Vornamen-Kombination haben sich $proz% der Eltern entschieden - ihr Kind hat au&szlig;er $details->{'vorname'} noch mindestens einen weiteren Vornamen",
					"F&uuml;r eine Vornamen-Kombination haben sich $proz% der Eltern entschieden, ihr Kind namens $details->{'vorname'} hat also noch mindestens einen weiteren Vornamen",
					"F&uuml;r eine Vornamen-Kombination haben sich $proz% der Eltern entschieden und ihrem Kind somit außer $details->{'vorname'} noch weitere Vornamen geschenkt",
					"Manche Eltern ($proz%) haben ihrem Kind au&szlig;er $details->{'vorname'} noch mindestens einen weiteren Vornamen gegeben",
				);
				$details->{'doppelnamen_text'}=shift(@temp).". ";
				@temp=&main::mischeListe(
					"$details->{'vorname'} wird gerne mit anderen Vornamen kombiniert",
					"$details->{'vorname'} wird gelegentlich in Kombination mit anderen Vornamen genutzt",
					"Einige Eltern haben ihr Kind außer mit $details->{'vorname'} noch mit anderen Vornamen bedacht",
					"Für einige Eltern war der Vorname $details->{'vorname'} alleine nicht ausreichend",
					"Einige Eltern haben sich dafür entschieden, ihrem Kind mehr als einen Vornamen zu geben",
					"$details->{'vorname'} wird gelegentlich mit anderen Vornamen gemeinsam genutzt",
					"Gelegentlich wird $details->{'vorname'} als Bestandteil von Doppelnamen oder als Zweitvorname genutzt",
					"$details->{'vorname'} wird ab und an mit anderen Vornamen kombiniert",
					"$details->{'vorname'} tritt bei einigen Menschen in Kombination mit anderen Vornamen auf",
					"Einige Menschen $haben neben $details->{'vorname'} noch mindestens einen weiteren Vornamen",
					"Einige Menschen $haben $details->{'vorname'} nicht als alleinigen Vornamen",
					"Einige Menschen $haben nicht nur $details->{'vorname'} als Vornamen von ihren Eltern erhalten",
					"Einige Menschen $haben $details->{'vorname'} nicht als alleinigen Vornamen",
					"$details->{'vorname'} ist bei Einigen nicht der alleinige Vorname",
				);
				$details->{'doppelnamen_text_kurz'}=shift(@temp);
				@temp=&main::mischeListe(
					", ".&main::getZufallstext('knapp')." ein Fünftel ($proz%) aller $nt $haben neben $details->{'vorname'} noch mindestens einen weiteren Vornamen.",
					", denn ".&main::getZufallstext('knapp')." ein Fünftel ($proz%) aller $nt $haben mindestens noch einen weiteren Vornamen neben $details->{'vorname'}.",
				);
				$details->{'doppelnamen_text_kurz'}.=shift(@temp);
			} elsif($proz>=12)
			{
				my @temp=&main::mischeListe(
					"Für die meisten $nt ist $details->{'vorname'} der einzige Vorname, nur ".&main::getZufallstext('knapp')." $proz% $haben noch weitere Vornamen",
					"Der Vorname $details->{'vorname'} wird sehr häufig als alleinstehender Vorname genutzt, nur ca. $proz% aller Menschen haben neben $details->{'vorname'} noch einen weiteren Vornamen",
					"Der Vorname $details->{'vorname'} ist meistens der alleinige Vorname, nur ".&main::getZufallstext('knapp')." $proz% $haben neben $details->{'vorname'} noch weitere Vornamen",

					"Der Vorname $details->{'vorname'} ist meistens ein einzelner Vorname, nur ".&main::getZufallstext('knapp')." $proz% der $nt $haben neben $details->{'vorname'} noch weitere Vornamen",

				);
				$details->{'doppelnamen_text'}=shift(@temp).". ";
				@temp=&main::mischeListe(
					"$details->{'vorname'} wird nur gelegentlich mit anderen Vornamen kombiniert",
					"$details->{'vorname'} tritt nur bei manchen Menschen in Kombination mit anderen Vornamen auf",
					"$details->{'vorname'} ist in den meisten Fällen der einzige Vorname",
					"$details->{'vorname'} ist in den meisten Fällen der alleinige Vorname",
					"$details->{'vorname'} wird eher selten mit anderen Vornamen kombiniert",
					"$details->{'vorname'} ist meistens der einzige Vorname",
					"Die meisten Menschen namens $details->{'vorname'} tragen keinen weiteren Vornamen",
					"Bei den meisten Menschen ist $details->{'vorname'} der einzige Vorname",
					"Viele Eltern, die ihr Kind $details->{'vorname'} nannten, haben keinen weiteren Vornamen vergeben",
				);
				$details->{'doppelnamen_text_kurz'}=shift(@temp);
				@temp=&main::mischeListe(
					", aber immerhin mehr als ein Zehntel ($proz%) aller $nt $haben neben $details->{'vorname'} noch mindestens einen weiteren Vornamen.",
					", denn nur ".&main::getZufallstext('knapp')." $proz% aller $nt $haben mindestens noch einen weiteren Vornamen.",
					", nur etwas mehr als $jeder Zehnte hat außer $details->{'vorname'} noch weitere Vornamen.",
				);
				$details->{'doppelnamen_text_kurz'}.=shift(@temp);
			}  elsif($proz>=9)
			{
				my @temp=&main::mischeListe(
					"Der Vorname $details->{'vorname'} wird sehr häufig als alleinstehender Vorname genutzt, nur ca. $proz% aller Menschen haben neben $details->{'vorname'} noch einen weiteren Vornamen",
				);
				$details->{'doppelnamen_text'}=shift(@temp).". ";
				@temp=&main::mischeListe(
					"$details->{'vorname'} wird nicht besonders oft mit anderen Vornamen kombiniert",
					"$details->{'vorname'} tritt bei vielen Menschen eher selten in Kombination mit anderen Vornamen auf",
					"$details->{'vorname'} ist bei den meisten der alleinige Vorname",
					"$details->{'vorname'} ist bei den meisten Menschen der einzige Vorname",
					"$details->{'vorname'} ist bei den meisten alleiniger Vorname",
					"$details->{'vorname'} ist bei den meisten der einzige Vorname",
				);
				$details->{'doppelnamen_text_kurz'}=shift(@temp);
				@temp=&main::mischeListe(
					", ".&main::getZufallstext('knapp')." ein Zehntel ($proz%) aller $nt $haben neben $details->{'vorname'} noch mindestens einen weiteren Vornamen.",
					", denn nur ".&main::getZufallstext('knapp')." ein Zehntel ($proz%) aller $nt $haben mindestens noch einen weiteren Vornamen.",
					", denn nur ".&main::getZufallstext('knapp')." $jeder Zehnte hat noch weitere Vornamen.",
					", nur ".&main::getZufallstext('knapp')." $jeder zehnte $nt2 hat außer $details->{'vorname'} noch weitere Vornamen.",
				);
				$details->{'doppelnamen_text_kurz'}.=shift(@temp);
			} elsif($proz>=5)
			{
				my @temp=&main::mischeListe(
					"$details->{'vorname'} ist meist ein alleinstehender Vorname. Nur ungefähr $proz% aller $nt tragen neben $details->{'vorname'} noch einen weiteren Vornamen",
				);
				$details->{'doppelnamen_text'}=shift(@temp).". ";

				@temp=&main::mischeListe(
					"$details->{'vorname'} ist meistens ein alleinstehender Name",
					"$details->{'vorname'} tritt bei den wenigsten in Kombination mit anderen Vornamen auf",
					"$details->{'vorname'} ist bei den meisten der einzige Vorname",
					"$details->{'vorname'} ist meistens der einzige Vorname",
					"$details->{'vorname'} ist meistens der alleinige Vorname",
					"$details->{'vorname'} wird relativ selten mit anderen Vornamen kombiniert",
					"$details->{'vorname'} tritt relativ selten in Kombination mit anderen Vornamen auf",
					"$details->{'vorname'} wird eher selten mit anderen Vornamen kombiniert",
					"$details->{'vorname'} ist eher selten in Kombination mit anderen Vornamen anzutreffen",
					"Mit anderen Vornamen wird $details->{'vorname'} eher selten kombiniert",
				);
				$details->{'doppelnamen_text_kurz'}=shift(@temp);
				if($details->{'geschlecht'} eq "m")
				{
					@temp=&main::mischeListe(
						" - nur ".&main::getZufallstext('knapp')." jeder Zwanzigste $nt2 hat neben $details->{'vorname'} noch einen oder mehrere Vornamen.",
						", nur ".&main::getZufallstext('knapp')." jeder 20. $nt2 von $details->{'vorname'} hat noch einen anderen Vornamen.",
						", denn nur ".&main::getZufallstext('knapp')." jeder 20. $nt2 hat noch weitere Vornamen.",
						", nur ".&main::getZufallstext('knapp')." jeder 20. $nt2 von $details->{'vorname'} hat noch weitere Vornamen.",
						". Nur ".&main::getZufallstext('knapp')." jeder 20. $nt2 trägt neben $details->{'vorname'} noch weitere Vornamen.",
						" - nur ".&main::getZufallstext('knapp')." jeder 20. $nt2 trägt neben $details->{'vorname'} noch weitere Vornamen.",

						", denn nur ".&main::getZufallstext('knapp')." jeder 20. $nt2 hat daneben noch einen oder mehrere andere Vornamen.",
						": nur ".&main::getZufallstext('knapp')." jeder 20. $nt2 hat noch einen anderen Vornamen.",
						" -  nur ".&main::getZufallstext('knapp')." jeder 20. $nt2 hat noch weitere Vornamen.",
						", nur ".&main::getZufallstext('knapp')." jeder 20. $nt2 trägt noch weitere Vornamen.",
						", denn nur ".&main::getZufallstext('knapp')." jeder 20. $nt2 trägt noch weitere Vornamen.",
					);
				} else
				{
					@temp=&main::mischeListe(
						" - nur ".&main::getZufallstext('knapp')." jede 20. $nt2 hat neben $details->{'vorname'} noch einen oder mehrere Vornamen.",
						" - nur ".&main::getZufallstext('knapp')." jede 20. $nt2 von $details->{'vorname'} hat noch einen anderen Vornamen.",
						": nur ".&main::getZufallstext('knapp')." jede 20. $nt2 hat noch weitere Vornamen.",
						", denn nur ".&main::getZufallstext('knapp')." jede 20. $nt2 von $details->{'vorname'} hat noch weitere Vornamen.",
						", nur ".&main::getZufallstext('knapp')." jede 20. $nt2 trägt neben $details->{'vorname'} noch weitere Vornamen.",
						" - nur ".&main::getZufallstext('knapp')." jede 20. $nt2 trägt neben $details->{'vorname'} noch weitere Vornamen.",

						", nur ".&main::getZufallstext('knapp')." jede 20. $nt2 hat daneben noch einen oder mehrere andere Vornamen.",
						". Nur ".&main::getZufallstext('knapp')." jede 20. $nt2 hat noch einen anderen Vornamen.",
						", denn nur ".&main::getZufallstext('knapp')." jede 20. $nt2 hat noch weitere Vornamen.",
						", nur ".&main::getZufallstext('knapp')." jede 20. $nt2 trägt noch weitere Vornamen.",
						" - nur ".&main::getZufallstext('knapp')." jede 20. $nt2 trägt noch weitere Vornamen.",
					);
				}
				$details->{'doppelnamen_text_kurz'}.=shift(@temp);
				#&main::logge_int("HOSSA2: $details->{'doppelnamen_text_kurz'}");
			} elsif($proz>=1)
			{
			      my @temp=&main::mischeListe(
				 'in Kombination mit anderen Vornamen',
				 'als Zweitname',
				 'als Zweitvorname',
				 'als Zweit-Vorname',
				 'in Doppelnamen',
				 'in Doppelvornamen',
				 'in Doppel-Vornamen',
				 'als Teil eines Doppelnamens',
				 'als Teil einer Vornamenkombination',
				 'als Teil einer Vornamen-Kombination',
				 );
			      my $vnk=shift(@temp);
				@temp=&main::mischeListe(
					"$details->{'vorname'} ist fast immer ein alleinstehender Vorname",
					"$details->{'vorname'} ist fast immer ein alleinstehender Vorname",
					"$details->{'vorname'} ist fast immer ein alleinstehender Vorname",
					"$details->{'vorname'} ist in den meisten F&auml;llen der einzige Vorname",
					"$details->{'vorname'} ist in den meisten F&auml;llen der einzige Vorname",
					"$details->{'vorname'} ist sehr selten $vnk anzutreffen",
					"$details->{'vorname'} ist sehr selten $vnk zu finden",
					"$details->{'vorname'} wird nicht h&auml;ufig $vnk genutzt",
					"Oft ist $details->{'vorname'} der alleinige Vorname",
					"Bei den meisten $nt ist $details->{'vorname'} der alleinige Vorname",
					"Bei den meisten $nt ist $details->{'vorname'} der einzige  Vorname",
					"Die meisten $nt haben mit $details->{'vorname'} nur diesen Vornamen",

				);
				$details->{'doppelnamen_text'}=shift(@temp);
				@temp=&main::mischeListe(
					". Nur ein verschwindend kleiner Teil der Menschen (ungefähr $proz%) $haben neben $details->{'vorname'} noch einen oder mehrere weitere Vornamen",
					". Nur ein verschwindend kleiner Teil der Menschen (ungefähr $proz%) $haben einen Doppelnamen",
					". Nur ein verschwindend kleiner Teil der Menschen (ungefähr $proz%) $haben neben $details->{'vorname'} einen Zweitvornamen",
					". Nur verschwindend geringe $proz% $haben au&szlig;er $details->{'vorname'} noch einen weiteren Vornamen",
					". Nur verschwindend geringe $proz% $haben einen Doppelnamen",
					", nur verschwindend geringe $proz% der $nt $haben noch weitere Vornamen",
					", nur verschwindend geringe $proz% der $nt $haben noch weitere Vornamen",
					". Lediglich $proz% aller $nt namens $details->{'vorname'} $haben noch weitere Vornamen",
					", lediglich $proz% aller $nt namens $details->{'vorname'} $haben noch weitere Vornamen",
					", nur verschwindend geringe $proz% der $nt $haben neben $details->{'vorname'} noch weitere Vornamen",
				);
				$details->{'doppelnamen_text'}.=shift(@temp).". ";


				@temp=&main::mischeListe(
					"$details->{'vorname'} ist fast immer ein alleinstehender Name",
					"Wenn Eltern sich für den Namen $details->{'vorname'} entscheiden, vergeben sie fast nie einen Zweitnamen",
					"Der Vorname $details->{'vorname'} ist sehr selten in Kombination mit anderen Vornamen anzutreffen",
					"$details->{'vorname'} tritt bei den allerwenigsten in Kombination mit anderen Vornamen auf",
					"$details->{'vorname'} ist bei den Wenigsten mit anderen Vornamen zu finden",
					"$details->{'vorname'} wird sehr selten mit anderen Vornamen kombiniert",
					"Als Vorname steht $details->{'vorname'} in den allermeisten Fällen für sich alleine",
					"Als Vorname steht $details->{'vorname'} fast immer für sich alleine",
					"$details->{'vorname'} ist bei den meisten Menschen der einzige Vorname",
					"In Kombination mit anderen Vornamen findet sich $details->{'vorname'} eher selten",
				);
				$details->{'doppelnamen_text_kurz'}=shift(@temp);
				@temp=&main::mischeListe(
					", denn nur ".&main::getZufallstext('knapp')."  ein bis zwei von 100 $nt $haben neben $details->{'vorname'} noch einen oder mehrere Vornamen.",
					", denn nur ".&main::getZufallstext('knapp')."  1-2 von 100 der $nt $haben neben $details->{'vorname'} noch weitere Vornamen.",
					", denn nur ".&main::getZufallstext('knapp')."  1-2 von 100 der $nt $haben neben $details->{'vorname'} noch weitere Vornamen.",
					", denn nur  ".&main::getZufallstext('knapp')." 1-2 von 100 $nt $haben neben $details->{'vorname'} noch andere Vornamen.",
					", denn nur ".&main::getZufallstext('knapp')." $proz Prozent aller $nt hat neben $details->{'vorname'} noch weitere Vornamen.",
				);
				$details->{'doppelnamen_text_kurz'}.=shift(@temp);
			}
			$details->{'doppelnamen_text_kurz'}.="<br/><i class='fa fa-arrow-circle-right text-gelb'></i> <a href='/vornamen/$details->{'geschlecht_lang'}/$vorname/sonstiges.html'>".&main::getSatz(
				"Doppelnamen mit $vorname",
				"Beliebte Doppelnamen mit $vorname",
				"Vornamen-Kombinationen mit $vorname"
			)."</a>";
			#&main::logge_int("OOOOOOOOOOOOOOOOOO: $details->{'doppelnamen_text_kurz'}");
		}
		#&main::logge_int("$details->{'anz_doppel'} Doppelnamen gefunden",1);
		#$details->{'doppelnamen'}=&umlaut($temp{'doppelnamen'});
	} else
	{
		$details->{'doppelnamen'}="Es sind leider noch keine Zweit- bzw. Doppelvornamen von $vorname bekannt.";
	}
	if($details->{'anz_doppel'}>0)
	{
		$details->{'anz_doppel'}=&commify($details->{'anz_doppel'},1);
	} else
	{
		$details->{'anz_doppel'}="Keine";
	}


	if(length($details->{'doppelnamen_text_kurz'})>0)
	{
		push(@info_kurz,$details->{'doppelnamen_text_kurz'});
	}
	#&main::logge_int("I: $details->{'doppelnamen_text_kurz'} / $details->{'doppelnamen_text_kurz'} // @info_kurz");


	#
	# Top-Vornamen im Ausland
	#

	if(exists($main::cache->{'vornamen_top_ausland'}->{$details->{'vorname'}}))
	{
		my $anz=scalar keys %{$main::cache->{'vornamen_top_ausland'}->{$details->{'vorname'}}};
		my @temp;
		if($anz>0)
		{
			my @l=sort { $main::cache->{'vornamen_top_ausland'}->{$details->{'vorname'}}->{$a}->{'last'}<=>$main::cache->{'vornamen_top_ausland'}->{$details->{'vorname'}}->{$b}->{'last'} } keys %{$main::cache->{'vornamen_top_ausland'}->{$details->{'vorname'}}};
			@temp=&mischeListe(
				"in den Vornamen-Listen",
				"in den Vornamen-Listen",
				"in den Vornamenlisten",
				"in den Geburten-Listen",
				"in den Geburten-Listen",
				"in den Geburtenlisten",
				"im Geburten-Index",
				"im Geburten-Register"
			);
			my $in_liste=shift(@temp);
			my $junge='ihre Tochter';
			if($details->{'geschlecht'} eq "m")
			{
				$junge="ihren Sohn";
			}

			my $wieviel='';
			my $text_kurz='';
			my $text_lang='';
			@temp=&mischeListe(
				"der Name $details->{'vorname'}",
				"dieser Vorname",
				"der Vorname $details->{'vorname'}",
				"$details->{'vorname'}",
			);
			my $name=shift(@temp);
			my $name2=shift(@temp);
			if($anz>2)
			{
				my $wieviel2='';
				if($anz>10)
				{
					$wieviel="sehr bekannt und beliebt";
					$wieviel2='sehr vielen';
				} elsif($anz>7)
				{
					$wieviel="ziemlich bekannt und beliebt";
					$wieviel2='vielen';
				} elsif($anz>5)
				{
					$wieviel="recht bekannt und beliebt";
					$wieviel2='einigen';
				} elsif($anz>3)
				{
					$wieviel="bekannt und beliebt";
					$wieviel2='manchen';
				} else
				{
					my @temp=&mischeListe(
						"zu finden",
						"bekannt",
						"ein bekannter Vorname",
						"kein unbekannter Vorname"
					);
					$wieviel=shift(@temp);
					@temp=&mischeListe(
						"einigen",
						"einigen (wenigen)",
						"einigen anderen",
						"anderen"
					);
					$wieviel2=shift(@temp);
				}

				my @lliste;
				my $zusatz="";
				if(exists($main::cache->{'vornamen_top_ausland'}->{$details->{'vorname'}}->{'kanadisch'}))
				{
					push(@lliste,"in Kanada");
				}
				if(exists($main::cache->{'vornamen_top_ausland'}->{$details->{'vorname'}}->{'australisch'}))
				{
					push(@lliste,&main::getSatz(
						"in Australien",
						"auf dem australischen Kontinent",
						"auch in Australien",
						"auch auf dem australischen Kontinent",
						"sogar in Australien",
						"sogar auf dem australischen Kontinent"
					));
				}
				if($#lliste==0)
				{
					$zusatz=" und $lliste[0]";
				} elsif($#lliste==1)
				{
					$zusatz=", $lliste[0] und $lliste[1]";
				} elsif($#lliste>0)
				{
					$zusatz=" sowie ".join(", ",@lliste[0..$#lliste-1])." und ".pop(@lliste);
				}

				@temp=&mischeListe(
					"Auch bei unseren europäischen Nachbarn$zusatz ist $name $wieviel",
					"Bei unseren europäischen Nachbarn$zusatz  ist $name $wieviel",
					"Bei $wieviel2 unserer europäischen Nachbarn$zusatz  ist $name $wieviel",
					"In der EU$zusatz  ist $name ebenfalls $wieviel",
					"In Europa$zusatz  ist $name ebenfalls $wieviel",
					"Auch in anderen europäischen Ländern$zusatz  ist $name $wieviel",
					"In Europa$zusatz  ist $name in $wieviel2 Ländern $wieviel",
					"In $wieviel2 europäischen Ländern$zusatz ist $name $wieviel",
					"In $wieviel2 anderen europäischen Ländern$zusatz  ist $name $wieviel",
					"Auch in $wieviel2 europäischen Ländern$zusatz  ist $name $wieviel",
					"Bei unseren Nachbarn in Europa$zusatz  ist $name $wieviel",
					"Bei $wieviel2 unserer Nachbarn in Europa$zusatz  ist $name $wieviel",
					ucfirst($name)." ist auch bei unseren europäischen Nachbarn$zusatz  $wieviel",
					ucfirst($name)." ist auch bei $wieviel2 unserer europäischen Nachbarn$zusatz  $wieviel",
					ucfirst($name)." ist $wieviel2 unserer europäischen Nachbarn$zusatz  bekannt",
				);
				$text_kurz=shift(@temp).". ";
				$text_lang=shift(@temp).". ";

				@temp=&mischeListe(
					"in den beiden Ländern",
					"in den beiden Ländern",
					"in den Ländern",
					"in"
				);
				my $in=shift(@temp);
				@temp=&mischeListe(
					"Insbesondere in den Ländern ",
					"Besonders populär ist der Vorname $in",
					"Sehr populär ist der Vorname beispielsweise $in",
					"Sehr bekannt ist der Vorname beispielsweise auch $in",
					"Sehr bekannt ist der Vorname beispielsweise auch bei unseren Nachbarn in",
					"Sehr bekannt ist der Vorname beispielsweise auch bei unseren Nachbarn $in",
					"Eine große Popularität genießt der Vorname beispielsweise $in",
					"Eine große Popularität genießt der Vorname beispielsweise $in",
					"Besonders populär ist ist $details->{'vorname'} $in",
				);
				$text_kurz.=shift(@temp)." ";
				if(!defined($main::lcm))
				{
					$main::lcm = Locale::Country::Multilingual->new();
					$main::lcm->set_lang('de');
				}
				my $l=shift(@l);
				@temp=&mischeListe(
					"Platz $main::cache->{'vornamen_top_ausland'}->{$details->{'vorname'}}->{$l}->{'last'}",
					"Platz $main::cache->{'vornamen_top_ausland'}->{$details->{'vorname'}}->{$l}->{'last'}",
					"$main::cache->{'vornamen_top_ausland'}->{$details->{'vorname'}}->{$l}->{'last'}. Platz",
					"$main::cache->{'vornamen_top_ausland'}->{$details->{'vorname'}}->{$l}->{'last'}. Platz",
					"zuletzt Platz $main::cache->{'vornamen_top_ausland'}->{$details->{'vorname'}}->{$l}->{'last'}",
					"aktuell auf Platz $main::cache->{'vornamen_top_ausland'}->{$details->{'vorname'}}->{$l}->{'last'}",
					"auf dem $main::cache->{'vornamen_top_ausland'}->{$details->{'vorname'}}->{$l}->{'last'}. Platz",
					"hier zuletzt auf dem $main::cache->{'vornamen_top_ausland'}->{$details->{'vorname'}}->{$l}->{'last'}. Platz",
				);
				my $p1=shift(@temp);

				my $land=$main::lcm->code2country(&getLaenderKuerzel($l));
				$text_kurz.="$land ($p1) und ";
				$l=shift(@l);
				@temp=&mischeListe(
					"Platz $main::cache->{'vornamen_top_ausland'}->{$details->{'vorname'}}->{$l}->{'last'}",
					"zuletzt Platz $main::cache->{'vornamen_top_ausland'}->{$details->{'vorname'}}->{$l}->{'last'}",
					"aktuell auf Platz $main::cache->{'vornamen_top_ausland'}->{$details->{'vorname'}}->{$l}->{'last'}",
					"auf dem $main::cache->{'vornamen_top_ausland'}->{$details->{'vorname'}}->{$l}->{'last'}. Platz",
					"$main::cache->{'vornamen_top_ausland'}->{$details->{'vorname'}}->{$l}->{'last'}. Platz",
					"hier zuletzt auf dem $main::cache->{'vornamen_top_ausland'}->{$details->{'vorname'}}->{$l}->{'last'}. Platz",
				);
				$p1=shift(@temp);
				$land=$main::lcm->code2country(&getLaenderKuerzel($l));
				$text_kurz.="$land ($p1)";


				@temp=&mischeListe(
					"",
					", hier findet sich $name2 $in_liste der letzten Jahre weit oben",
					", hier findet sich $name2 regelmässig $in_liste der letzten Jahre",
					", wo $name2 in den letzten Jahren immer weit oben $in_liste gewesen",
					", wo $name2 in den letzten Jahren immer weit oben $in_liste gewesen ist",
					", wo $name in den letzten Jahren häufig vergeben wurde",
					", hier wurde $name in den letzten Jahren häufig von Eltern an ihr Kind vergeben",
					", hier wurde $name in den letzten Jahren häufig von Eltern an $junge vergeben",
					", hier ist $name häufig $in_liste zu finden",
					", hier ist $name häufig von Eltern für ihr Kind vergeben worden",
					", wo $name $in_liste der letzten Jahre zu finden ist",
					", hier ist $name häufig von Eltern für $junge vergeben worden",
					", hier ist die Wahl vieler Eltern auf $details->{'vorname'} als Vornamen für ihr Kind gefallen",
					", hier haben sich viele Eltern für $details->{'vorname'} als Vornamen für ihr Kind entschieden",
					", hier haben sich viele Eltern für $details->{'vorname'} als Vornamen für $junge entschieden",
					", hier wurden vielen Kinder der Name $details->{'vorname'} als Vorname zugedacht",
					", hier wurden vielen Kinder der Name $details->{'vorname'} als Vorname gegeben",
					", hier wurden vielen Kinder $details->{'vorname'} als Vorname gegeben",
					", hier wurden vielen Kinder der Vorname $details->{'vorname'} gegeben",
					", hier wurden vielen Babies der Name $details->{'vorname'} als Vorname zugedacht",
					", hier wurden vielen Babies der Name $details->{'vorname'} als Vorname gegeben",
					", hier wurden vielen Babies $details->{'vorname'} als Vorname gegeben",
					", hier wurden vielen Babies der Vorname $details->{'vorname'} gegeben",
					", hier haben sich in den letzten Jahren viele Eltern für $details->{'vorname'} als Vornamen für ihr Kind entschieden",
					", hier haben sich in den letzten Jahren viele Eltern für $details->{'vorname'} als Vornamen für $junge entschieden",
				);
				$text_kurz.=shift(@temp).".<br/><i class='fa fa-arrow-circle-right text-gelb'></i> <a href='/vornamen/$details->{'geschlecht_lang'}/$vorname/beliebtheit.html'>Beliebtheit von $vorname</a>";
				#&main::logge_int("L: @l");
			} else
			{
				my $heute=&main::getZufallstext("heutzutage").' ';

				@temp=&mischeListe(
					"Bei unseren europäischen Nachbarn spielt $name ${heute}meist keine Rolle",
					"Bei unseren europäischen Nachbarn ist $name ${heute}fast unbekannt",
					"Bei kaum einem unserer europäischen Nachbarn ist $name ${heute}bekannt",
					"In der EU ist $name ${heute}relativ unbekannt",
					"Auf dem europäischen Kontinent ist $name ${heute}fast unbekannt",
					"In Europa ist $name ${heute}recht unbekannt",
					"In Europa ist $name in den meisten Ländern ${heute}unbekannt",
					"In den meisten europäischen Ländern ist $name ${heute}unbekannt",
					"In vielen anderen europäischen Ländern ist $name ${heute}unbekannt",
					"In fast allen europäischen Ländern ist $name ${heute}unbekannt",
					"Bei unseren Nachbarn in Europa ist $name ${heute}unbekannt",
					"Bei den meisten unserer Nachbarn in Europa ist $name ${heute}unbekannt",
					ucfirst($name)." ist bei fast allen unserer europäischen Nachbarn ${heute}unbekannt",
					ucfirst($name)." ist ${heute}bei den meisten unserer europäischen Nachbarn unbekannt",
					ucfirst($name)." ist ${heute}den wenigsten unserer europäischen Nachbarn bekannt",
					ucfirst($name)." ist den wenigsten unserer europäischen Nachbarn ${heute}als Vorname bekannt",
				);
				$text_kurz=shift(@temp);
				$text_lang=shift(@temp);
				my $landx='';
				if(!defined($main::lcm))
				{
					$main::lcm = Locale::Country::Multilingual->new();
					$main::lcm->set_lang('de');
				}
				my $l=shift(@l);
				my $land=$main::lcm->code2country(&getLaenderKuerzel($l));
				if($#l>-1)
				{
					$landx="$land (Platz ".$main::cache->{'vornamen_top_ausland'}->{$details->{'vorname'}}->{$l}->{'last'}.") und ";
					$l=shift(@l);
					$land=$main::lcm->code2country(&getLaenderKuerzel($l));
					$landx.="$land (Platz ".$main::cache->{'vornamen_top_ausland'}->{$details->{'vorname'}}->{$l}->{'last'}.")";
				} else
				{
					$landx="$land (Platz ".$main::cache->{'vornamen_top_ausland'}->{$details->{'vorname'}}->{$l}->{'last'}.")";
				}

				@temp=(
					", lediglich",
					", nur",
					" - lediglich",
					" - nur",
					". Lediglich",
					". Nur",
				);
				if($anz==1)
				{
					push(@temp,
						". Ausschließlich",
						" - ausschließlich",
						", ausschließlich",
					);
				}
				@temp=&mischeListe(@temp);
				my $nur=shift(@temp);

				@temp=&mischeListe(
					"$nur in $landx spielt der Name eine Rolle",
					"$nur in $landx spielt der Name eine nennenswerte Rolle",
					"$nur in $landx spielt der Name $in_liste eine Rolle",
					"$nur in $landx spielt der Name $in_liste eine nennenswerte Rolle",
					"$nur in $landx taucht dieser Vorname $in_liste auf",
					"$nur in $landx ist dieser Vorname $in_liste zu finden",
					"$nur in $landx spielt $details->{'vorname'} eine Rolle",
					"$nur in $landx spielt $details->{'vorname'} eine nennenswerte Rolle",
					"$nur in $landx spielt $details->{'vorname'} $in_liste eine Rolle",
					"$nur in $landx spielt $details->{'vorname'} $in_liste eine nennenswerte Rolle",
					"$nur in $landx taucht $details->{'vorname'} $in_liste auf",
					"$nur in $landx ist $details->{'vorname'} $in_liste zu finden",
					"$nur in $landx wird der Name $details->{'vorname'} von Eltern an ihr Kind vergeben",
					"$nur in $landx wird der Name $details->{'vorname'} von Eltern an $junge vergeben",
					"$nur in $landx wird dieser Vorname von Eltern an ihr Kind vergeben",
					"$nur in $landx wird dieser Vorname von Eltern an $junge vergeben",
					"$nur in $landx werden Kinder $details->{'vorname'} genannt",
					"$nur in $landx wird Kindern der Vorname $details->{'vorname'} gegeben",
				);
				$text_kurz.=shift(@temp).". ";
				$text_lang.=shift(@temp).". ";
			}
			push(@info_kurz,$text_kurz);
			$details->{'beliebtheit_ausland_text'}=$text_lang;
		}
		#&main::logge_int("HOSSA: $anz");
	} else
	{
		my @temp=&mischeListe(
			"Vornamen-Listen",
			"Vornamen-Listen",
			"Vornamenlisten",
			"Geburten-Listen",
			"Geburten-Listen",
			"Geburtenlisten",
			"Geburten-Statistiken",
			"Geburtenstatistiken",
			"Geburten-Verzeichnissen",
		);
		my $liste=shift(@temp);
		my $liste2=shift(@temp);
		@temp=&mischeListe(
			'heutzutage',
			'in der heutigen Zeit',
			'heute in der modernen Zeit',
			'',
			''
		);
		my $heute=shift(@temp);
		@temp=&mischeListe(
			"Wir konnten $details->{'vorname'} in keinen unserer europäischen Nachbarländer verzeichnen",
			"$details->{'vorname'} ist $heute in keinen europäischen Ländern bekannt",
			"$details->{'vorname'} ist $heute in keinem europäischen Land verzeichnet",
			"Der Vorname $details->{'vorname'} ist in Europa $heute nicht bekannt",
			"Der Vorname $details->{'vorname'} ist $heute in Europa nicht bekannt",
			"Der Vorname $details->{'vorname'} ist in Europa $heute unbekannt",
			"Der Vorname $details->{'vorname'} ist $heute in Europa unbekannt",
			"In den $liste der letzten Jahre taucht $details->{'vorname'} in Europa nirgens auf",
			"$details->{'vorname'} wird $heute nur selten in Europa vergeben",
		);
		$details->{'beliebtheit_ausland_text'}=shift(@temp);
		@temp=&mischeListe(
			", wir konnten daher nirgends eine Platzierung in den $liste2 finden",
			", daher konnten wir auch keine Einträge in den $liste2 finden",
			", daher können wir auch leider keine Statistik erstellen",
			", wir haben daher auch nirgends eine Platzierung in den $liste finden können",
			", wir haben daher auch nirgends eine Platzierung in den europäischen $liste gefunden",
			", daher können wir leider auch keine Statistik erstellen",
			", wir haben daher nicht ausreichend Daten für eine europäische Statistik vorliegen",
			" - daher kann leider keine statistische Auswertung für Europa erstellt werden",
			", eine statistische Auswertung für Europa ist daher nicht möglich",
			", eine statistische Auswertung für die europäischen Länder ist daher nicht möglich",
		);
		$details->{'beliebtheit_ausland_text'}.=shift(@temp).".";
	}

	if($#info_kurz>0)
	{
		$details->{'info_kurz'}="<ul class='fa-ul'>";
		map { $details->{'info_kurz'}.="<li><i class='fa-li fa fa-info-circle text-gelb'></i> $_</li>" } @info_kurz;
		$details->{'info_kurz'}.="</ul>";
		#&main::logge_int("X: $details->{'info_kurz'}");
	} elsif($#info_kurz==0)
	{
		$details->{'info_kurz'}=shift(@info_kurz).".<br/><br/>";
	}



	if($#info_lang==0)
	{
		$details->{'info'}=shift(@info_lang)."<br/><br/>";
	} else
	{
		$details->{'info'}="<ul class='fa-ul'>";
		map { $details->{'info'}.="<li><i class='fa-li fa fa-info-circle text-gelb'></i> $_</li>" } @info_lang;
		$details->{'info'}.="</ul>";

	}

	$details->{'info'}=~s/%([0-9A-F][0-9A-F])/chr(hex($1))/eg;
	$details->{'info_kurz'}=~s/%([0-9A-F][0-9A-F])/chr(hex($1))/eg;

	#
	# Bedeutung
	#
	my ($bed_einl,$bed_einl_kurz);
	if(!exists($details->{'bedeutung'}) or length($details->{'bedeutung'})<3)
	{
		my @p_bed;

		# Hat einer der Parent eine Bedeutung?
		foreach my $parent (@parents)
		{
			if(exists($parent->{'bedeutung'}) && length($parent->{'bedeutung'})>4)
			{
				push(@p_bed,{
					'b'			=> $parent->{'bedeutung'},
					'v'			=> $parent->{'vorname'},
					'g'			=> $parent->{'geschlecht'},
					'vl'			=> $parent->{'vlink'},
					'p'			=> $parent->{'parents'},
				});
			}
		}

		# Haben wir eine Bedeutung gefunden? Wenn nicht, vll. Über-parent?
		if($#p_bed<0)
		{
			foreach my $parent (@parents)
			{
				next if !exists($parent->{'parents'});
				my @sp=@{$parent->{'parents'}};
				my $k=$sp[0];
				#&main::logge_int("========== @sp / $k->{'vorname'}");
				if(length($sp[0]->{'bedeutung'})>4)
				{
					push(@p_bed,{
						'b'			=> $sp[0]->{'bedeutung'},
						'v'			=> $sp[0]->{'vorname'},
						'g'			=> $sp[0]->{'geschlecht'},
						'vl'			=> $sp[0]->{'vlink'},
						'p'			=> $sp[0]	->{'parents'},
					});
				}
			}
		}
		if($#p_bed==0)
		{
			my $g1;
			my $g2;
			my $g3;
			if($p_bed[0]->{'g'} ne $details->{'geschlecht'})
			{
				if($details->{'geschlecht'} eq "w")
				{
					my @temp=&main::getZufallstext('maedchen');
					$g1=shift(@temp);
					@temp=&mischeListe("weiblich","feminin");
					$g2=shift(@temp);
					$g3="männlich";
				} else
				{
					$g1=&main::getZufallstext('jungs');
					@temp=&mischeListe("männlich","maskulin");
					$g2=shift(@temp);
					$g3="weiblich";
				}
			}

			my @temp=&mischeListe(
				"Abgeleitet vom Ursprungsnamen $p_bed[0]->{'vl'} ",
				"Abgeleitet von seinem Ursprungsnamen $p_bed[0]->{'vl'} ",
				"Ähnlich wie bei der ursprünglichen Form $p_bed[0]->{'vl'}",
				"Wenn man die Bedeutung des ursprünglichen Namens $p_bed[0]->{'vl'} zugrunde legt",
				"Wie auch bei $p_bed[0]->{'vl'}"
			);
			$bed_einl=shift(@temp)." ";
			if($p_bed[0]->{'b'}=~/;/)
			{
				@temp=&mischeListe(
					"kann man die möglichen Bedeutungen von $vorname wie folgt ableiten",
					"sind die möglichen Bedeutungen von $vorname wie folgt",
					"sind folgendes die möglichen Bedeutung von $vorname",
					"hat der Vorname möglicherweise folgende Bedeutungen",
				);
				$bed_einl.=shift(@temp).":<br/><br/>";
			} else
			{
				@temp=&mischeListe(
					"kann man die Bedeutung von $vorname wie folgt ableiten",
					"ist auch die Bedeutung von $vorname wie folgt",
					"ist die Bedeutung von $vorname",
					"hat der Vorname $vorname möglicherweise folgende Bedeutung",
				);
				$bed_einl.=shift(@temp).":<br/><br/>";
			}

#			$details->{'bedeutung'}=encode_utf8($p_bed[0]->{'bedeutung'});
				#$details->{'bedeutung'}=$parent->{'bedeutung'};
				#utf8::downgrade($details->{'bedeutung'});
				#utf8::upgrade($details->{'bedeutung'});
				#$details->{'bedeutung'}=encode_utf8(decode_utf8($parent->{'bedeutung'}));
				#$details->{'bedeutung'}=&cleanText($parent->{'bedeutung'});

			#&main::logge_int("B: $details->{'bedeutung'}");
			if(length($g2)<1)
			{
				@temp=&mischeListe(
					"Abgeleitet von $p_bed[0]->{'vl'}:",
					"Wie beim Ursprung $p_bed[0]->{'vl'}:",
					"Vergleichbar mit $p_bed[0]->{'vl'}:",
					"Als ${g2}Form von $p_bed[0]->{'vl'}:",
				);
			} else
			{
				@temp=&mischeListe(
					"Als ${g2}e Ableitung von $p_bed[0]->{'vl'}:",
					"Wie beim ${g3}en Ursprung $p_bed[0]->{'vl'}:",
					"Vergleichbar mit dem ${g3}en $p_bed[0]->{'vl'}:",
					"Als ${g2}Form von $p_bed[0]->{'vl'}:",
				);
			}
			$bed_einl_kurz=shift(@temp)." ";
			my $gesch='';
			if($p_bed[0]->{'g'} eq "m")
			{
				$gesch="jungs";
			} elsif($p_bed[0]->{'g'} eq "w")
			{
				$gesch="maedchen";
			}

			my ($bl,$bk)=&getBedeutung($p_bed[0]->{'v'},$p_bed[0]->{'b'},$gesch,$p_bed[0]->{'vl'});

			$details->{'bedeutung'}=$bed_einl.$bl;
			$details->{'bedeutung_kurz'}=$bed_einl_kurz.$bk;
			#&main::logge_int("PPPPPPPPPPPPPPPPPP: ".$bed_einl." / $bed_einl_kurz");
		} elsif($#p_bed==1)
		{
			my @temp=&mischeListe(
				"Abgeleitet von den beiden Ursprungsnamen $p_bed[0]->{'vl'} und $p_bed[1]->{'vl'} haben wir auch zwei mögliche Bedeutungen für $vorname:",
				"Abgeleitet von den beiden Ursprungsnamen $p_bed[0]->{'vl'} und $p_bed[1]->{'vl'} können wir auch zwei mögliche Bedeutungen für $vorname ableiten:",
				"Anhand der beiden Ursprungsnamen $p_bed[0]->{'vl'} und $p_bed[1]->{'vl'} können die beiden folgenden Bedeutungen für $vorname möglich sein:",
			);
			$bed_einl=shift(@temp);

			@temp=&mischeListe(
				"Da der Vorname eine Ableitung von $p_bed[0]->{'vl'} oder $p_bed[1]->{'vl'} sein kann, gibt es auch zwei mögliche Bedeutungen für $vorname:",
				"Aufgrund der beiden Ursprungsnamen $p_bed[0]->{'vl'} und $p_bed[1]->{'vl'} gibt es zwei mögliche Bedeutungen für $vorname:",
				"Anhand der beiden ursprünglichen Vornamen $p_bed[0]->{'vl'} und $p_bed[1]->{'vl'} können zwei mögliche Bedeutungen für $vorname in Frage kommen:",
			);
			$bed_einl_kurz=shift(@temp);

			#&main::logge_int("Rufe: ".$p_bed[0]->{'v'}." / ".$p_bed[0]->{'b'}." / ".$details->{'geschlecht_lang'}." / ".$p_bed[0]->{'vl'});
			my ($bl,$bk)=&getBedeutung($p_bed[0]->{'v'},$p_bed[0]->{'b'},$details->{'geschlecht_lang'},$p_bed[0]->{'vl'},1);

			$details->{'bedeutung'}="$bed_einl<ul class='fa-ul'><li><i class='fa-li fa fa-info-circle text-gelb'></i> $bl</li>";
			$details->{'bedeutung_kurz'}="$bed_einl_kurz<ul class='fa-ul'><li><i class='fa-li fa fa-info-circle text-gelb'></i> $bk</li>";

			($bl,$bk)=&getBedeutung($p_bed[1]->{'v'},$p_bed[1]->{'b'},$details->{'geschlecht_lang'},$p_bed[1]->{'vl'},1);

			$details->{'bedeutung'}.="<li><i class='fa-li fa fa-info-circle text-gelb'></i> $bl</li>";
			$details->{'bedeutung_kurz'}.="<li><i class='fa-li fa fa-info-circle text-gelb'></i> $bk</li>";


			$details->{'bedeutung'}.="</ul>";
			$details->{'bedeutung_kurz'}.="</ul>";

			#&main::logge_int("BBBBBBBBB A: ".$details->{'bedeutung_kurz'});
			#&main::logge_int("BBBBBBBBB B: ".$bk);
			#$details->{'bedeutung'}=$bed_einl;
			#&main::logge_int("BBBBBBBBB C: ".$details->{'bedeutung'});
			#,$details->{'bedeutung_kurz'}
		}
	} else
	{
		my $t=$details->{'bedeutung'};
		if($t=~s/&%(\d+);/###$1###/eg)
		{
			#$t=encode_utf8($t);
		}
		($details->{'bedeutung'},$details->{'bedeutung_kurz'})=&getBedeutung($details->{'vorname'},$t,$details->{'geschlecht_lang'});
	}
	#warn("STEP: vornamen.pl	17");
	if(length($details->{'bedeutung_kurz'})<3)
	{
		my @temp=&main::mischeListe(
			"Leider ist uns noch keine Bedeutung von $vorname bekannt",
			"Für den Vornamen $vorname konnten wir keine Hinweise oder Hintergrundinformationen zur Bedeutung finden",
			"Eine Bedeutung von $vorname ist uns leider bisher nicht bekannt",
			"Zu $vorname haben wir bisher keine Bedeutung finden können",
			"Die Bedeutung von $vorname ist uns leider bis dato unbekannt",
		);
		$details->{'bedeutung_kurz'}=shift(@temp);
		my @ww=&main::mischeListe(
			"Hintergrund-Infos von $vorname anzeigen",
			"Du kennst die Bedeutung von $vorname?",
			"Bedeutung von $vorname eintragen",
			"Eine Bedeutung eintragen",
			"Mitmachen und Bedeutung eintragen",
			"Jetzt mitmachen und Bedeutung eintragen",
			"Jetzt beteiligen und Bedeutung eintragen",
			"Zeige alle Hintergrund-Infos von $vorname",
		);
		$details->{'bedeutung_kurz'}.="<br/><br/><i class='fa fa-arrow-circle-right text-gelb'></i> <a href='/vornamen/$details->{'geschlecht_lang'}/$vorname/bedeutung.html'>".shift(@ww)."</a>";
	}

	if(length($details->{'bedeutung'})<3)
	{
		my @temp=&main::mischeListe(
			"Leider ist uns noch keine Bedeutung von $vorname bekannt",
			"Für den Vornamen $vorname konnten wir keine Hinweise oder Hintergrundinformationen zur Bedeutung finden",
			"Eine Bedeutung von $vorname ist uns leider bisher nicht bekannt",
			"Zu $vorname haben wir bisher keine Bedeutung finden können",
			"Die Bedeutung von $vorname ist uns leider bis dato unbekannt",
		);
		$details->{'bedeutung'}=shift(@temp);
	}
	$details->{'bedeutung'}=~s/%([0-9A-F][0-9A-F])/chr(hex($1))/eg;
	$details->{'bedeutung_kurz'}=~s/%([0-9A-F][0-9A-F])/chr(hex($1))/eg;

	#&main::logge_int("BK: $details->{'bedeutung_kurz'}");
	goto neu2;

	# Hier war der alte Code für Bedeutungen (Unter "ARBEIT" auf dem Desktop)

neu2:
	#&main::logge_int("BE: $details->{'bed_erg'}");
	if(length($details->{'bed_erg'})<2)
	{
		my @temp=&main::mischeListe(
			"noch keine Ergänzungen vorhanden",
			"noch niemand hat etwas zur Bedeutung beigetragen",
			"kein User hat die Bedeutung bisher erweitert",
			"die Bedeutung wurde noch nie erweitert",
			"die Bedeutung wurde noch nie ergänzt",
			"leider wurden noch keine zusätzlichen Infos eingetragen"
		);
		$details->{'bed_erg'}="<span class='text-muted'>".ucfirst(shift(@temp)).".</span>";
	}
	@temp=&main::mischeListe(
		"Kennst du eine andere Bedeutung für den Vornamen $vorname?",
		"Hast du eine andere Erklärung für Bedeutung von $vorname?",
		"Kennst du noch eine andere Bedeutung für den Vornamen $vorname?",
		"Kennst du noch eine andere Bedeutung für das Wort $vorname?",
		"Hast du eine Ergänzung oder alternative Bedeutung von $vorname?",
		"Kennst du eine Ergänzung oder alternative Bedeutung von $vorname?",
	);
	$details->{'bed_erg2'}=shift(@temp);


	# Anzahl der Menschen
	if($details->{'menschen'}>0)
	{
		my $m=&commify($details->{'menschen'}+$details->{'geburten'},1);
		$details->{'menschen'}=$m;
		my $s="s";
		$s="" if $vorname=~/s$/;
		my @temp=&main::mischeListe(
			"$m ${vorname}$s in D gefunden",
			"$m x ${vorname} in Deutschland",
			"$m ${vorname}$s in Deutschland",
		);
		$details->{'anz_menschen'}="<i class='fa fa-arrow-circle-right text-gelb'></i> <a href='/vornamen/$details->{'geschlecht_lang'}/$vorname/beliebtheit.html'>".shift(@temp)."</a>";
	} else
	{
		$details->{'anz_menschen'}="";
	}




	# "Form von ..." in Links umwandeln
	if($details->{'info'}=~/(Nebenform|Koseform|Form|Kurzform|Variante) von ["']?([A-ZÄÖÜ][a-zäöüß]+)["']?([< ,\b\.]|$)/)
	{
		my $such=$2;
		if($such ne "Namen" and $such ne "Vornamen")
		{
			$details->{'info'}=~s/(Nebenform|Koseform|Form|Kurzform|Variante) von ["']?([A-ZÄÖÜ][a-zäöüß]+)["']?([< ,\b\.]|$)/$1 von <i class='fa fa-arrow-circle-right text-gelb'><\/i> <a href='\/vornamen\/$details->{'geschlecht_lang'}\/$2\/index.html'>$2<\/a>$3/g;
		}
	}
	$details->{'info'}=~s/(Kurzform:)\s+(.*?)([ $\b\.])/$1 <i class='fa fa-arrow-circle-right text-gelb'><\/i> <a href='\/vornamen\/$details->{'geschlecht_lang'}\/$2\/index.html'>$2<\/a>$3/;
	$details->{'info'}=~s/<i class='fa fa-arrow-circle-right text-gelb'><\/i> <a href='\/vornamen\/(maedchen|jungs)\/(Vornamen|Namen)\/index.html'>(.*?)<\/a>/$3/g;
	#
	#
	# Namenstag
	#
	#
	my $bisher=0;

	# Haben wir oder der Parent überhaupt einen Namenstag?
	my $namenstag={};
	my $parent_flag=0;
	if(!exists($main::cache->{'vornamen_namenstage'}->{$vorname}))
	{
		# Hat der Parent einen Namenstag?
		if(exists($parent->{'vorname'}) && $#{$main::cache->{'vornamen_namenstage'}->{$parent->{'vorname'}}->{'nt'}}>-1)
		{
			my @temp=&mischeListe(
				"Für den Vornamen $vorname haben wir keinen eigenen Namenstag finden können, aber als Ableitung von $parent->{'vorname'} gilt:",
				"$vorname hat keinen eigenen Namenstag, aber abgeleitet vom Ursprungsnamen $parent->{'vorname'} kann folgendes gelten:",
				"Der Vorname $vorname an sich hat keinen eigenen Namenstag, aber anhand des Ursprungsnamen $parent->{'vorname'} (von dem $vorname abstammt) konnten wir folgendes ableiten:",

			);
			$details->{'namenstage_kurztext'}.=shift(@temp)."<br/><br/>";
			$namenstag=$main::cache->{'vornamen_namenstage'}->{$parent->{'vorname'}};
			$parent_flag=1;

		}
	} else
	{
		$namenstag=$main::cache->{'vornamen_namenstage'}->{$vorname};
	}

	# Hauptnamenstage?
	if($#{$namenstag->{'nt'}}>-1)
	{
		# Kurztext:
		my @temp=&mischeListe(
			"Der Namenstag von $vorname ist am ${$namenstag->{'nt'}}[0]->{'datum'}",
			"Der Name $vorname hat den Namenstag am ${$namenstag->{'nt'}}[0]->{'datum'}",
			"Der Name $vorname hat den Namenstag am ${$namenstag->{'nt'}}[0]->{'datum'}",
			"Der Vorname $vorname hat seinen Namenstag am ${$namenstag->{'nt'}}[0]->{'datum'}",
			"$vorname hat Namenstag am ${$namenstag->{'nt'}}[0]->{'datum'}",
			"Der Vorname $vorname hat seinen Namenstag am ${$namenstag->{'nt'}}[0]->{'datum'}",
		);
		$details->{'namenstage_kurztext'}.=shift(@temp);

		if($#{$namenstag->{'nt'}}>0)
		{
			@temp=&mischeListe(
				" und ",
				" sowie ",
			);
			$details->{'namenstage_kurztext'}.=shift(@temp);
			if($#{$namenstag->{'nt'}}>1)
			{
				$details->{'namenstage_kurztext'}.="an ".$#{$namenstag->{'nt'}}." weiteren Tagen";
			} else
			{
				$details->{'namenstage_kurztext'}.="am ".${$namenstag->{'nt'}}[1]->{'datum'};
			}
		}

		my $anz=$#{$namenstag->{'nt'}}+1;
		if($anz>2)
		{
			@temp=&mischeListe(
				"Für $vorname haben wir $anz Namenstage finden können",
				"Für $vorname haben wir mehrere Namenstage finden können",
				"Für $vorname haben wir $anz unterschiedliche Namenstage finden können",
				"Für $vorname haben wir $anz unterschiedliche Namenstage gefunden",
				"Für den Vornamen $vorname haben wir $anz Namenstage finden können",
				"Für den Vornamen $vorname haben wir mehrere Namenstage finden können",
				"Für den Vornamen $vorname haben wir $anz unterschiedliche Namenstage finden können",
				"Für den Vornamen $vorname haben wir $anz unterschiedliche Namenstage gefunden",
			);
		} elsif($anz==2)
		{
			@temp=&mischeListe(
				"Für $vorname haben wir zwei verschiedene Namenstage finden können",
				"Für $vorname haben wir zwei Namenstage finden können",
				"Für $vorname haben wir zwei unterschiedliche Namenstage finden können",
				"Für $vorname haben wir zwei unterschiedliche Namenstage gefunden",
				"$vorname hat zwei Namenstage",
			);
		} elsif($anz==1)
		{
			@temp=&mischeListe(
				"Für $vorname haben wir folgenden Namenstag finden können",
				"Für $vorname haben wir den folgenden Namenstag finden können",
			);
		}
		$details->{'namenstage_lang'}=shift(@temp).":<br/>";
		foreach my $nt (@{$namenstag->{'nt'}})
		{
			$details->{'namenstage_lang'}.=&wandel_person($nt);
			++$bisher;
		}
		$details->{'namenstage_lang'}.="<br/>";
	} else
	{
		my @temp=&mischeListe(
			"Ein katholischer Namenstag von $vorname ist ".&getZufallstext("uns unbekannt"),
			"Ein Namenstag von $vorname ist ".&getZufallstext("uns unbekannt"),
			"Der katholische Namenstag von $vorname ist ".&getZufallstext("uns unbekannt"),
			"Der Namenstag von $vorname ist ".&getZufallstext("uns unbekannt"),
			"$vorname hat leider keinen Namenstag",
			"Der Vorname $vorname hat leider keinen Namenstag",
			"Für den Vornamen $vorname gibt es leider keinen Namenstag",
			"Für den Vornamen $vorname gibt es keinen Namenstag",
			"Der Vorname $vorname hat leider keinen Namenstag",
			"Der Vorname $vorname hat keinen Namenstag",
			"Der Vorname $vorname besitzt leider keinen Namenstag",
			"Leider ist uns der Namenstag von $vorname unbekannt",
			"Leider ist uns der Namenstag von $vorname nicht bekannt",
			"Leider ist uns ein Segens- oder Namenstag von $vorname nicht bekannt",
			"Leider gibt es für $vorname keinen Namens- oder Segenstag",
		);
		$details->{'namenstage_kurztext'}.=shift(@temp);
		$details->{'namenstage_lang'}.=shift(@temp);

	}


	my $konf=0;
	foreach my $i (keys %{$namenstag})
	{
		next if $i eq "nt";
		#&main::logge_int("OK: $i");
		$konf+=$#{$namenstag->{$i}}+1;
	}

	#&main::logge_int("KONF: $konf");
	if($konf<1 && $#{$namenstag->{'nt'}}<0)
	{
		if(rand(10)>5)
		{
			my @temp=&mischeListe(
				", ebensowenig wie sonstige evangelische oder orthodoxe Gedenktage",
				" und auch Gedenktage anderer Religionen zu $vorname sind ".&getZufallstext("uns unbekannt").".",
				". Auch orthodoxe oder evangelische Gedenktage sind uns für $vorname leider unbekannt.",
				". Auch orthodoxe oder evangelische Gedenktage sind für $vorname nicht bekannt.",
				". Auch orthodoxe oder evangelische Gedenktage sind uns nicht bekannt.",

			);
			$details->{'namenstage_kurztext'}.=shift(@temp);
			$details->{'namenstage_lang'}.=shift(@temp);
		} else
		{
			my @temp=&mischeListe(
				"Der Vorname $vorname hat weder einen regulären Namenstag noch sonstige Gedenktage.",
				"Der Vorname $vorname hat leider weder einen regulären Namenstag noch sonstige Gedenktage.",
				"Der Vorname $vorname hat leider weder einen regulären Namenstag noch sonstige Gedenktage.",
				"Für $vorname sind uns weder reguläre Namenstage noch sonstige Gedenktage bekannt.",
				"Für $vorname sind uns leider weder reguläre Namenstage noch sonstige Gedenktage bekannt.",
				"Für $vorname sind uns weder Namenstage noch andere Gedenktage bekannt.",
				"Für den Vornamen $vorname sind uns leider keine regulären Namenstage oder sonstige Gedenktage bekannt.",
				"Für den Vornamen $vorname sind uns leider weder reguläre Namenstage noch sonstige Gedenktage bekannt.",
				"Für den Vornamen $vorname sind uns weder Namenstage noch andere Gedenktage bekannt.",
				"Für den Vornamen $vorname konnnten wir weder einen Namenstag noch sonstige Gedenktage finden."
			);
			$details->{'namenstage_kurztext'}=shift(@temp);
			$details->{'namenstage_lang'}=shift(@temp);
		}
	} elsif($konf<1 && $#{$namenstag->{'nt'}}>-1)
	{
			my @temp=&mischeListe(
				", aber wir kennen keine evangelischen oder orthodoxen Gedenktage",
				", aber wir haben keine evangelischen oder orthodoxen Gedenktage für $vorname gespeichert",
				". Aber orthodoxe oder evangelische Gedenktage sind uns für $vorname leider unbekannt.",
				". Aber evangelische Gedenktage sind uns für $vorname nicht bekannt.",
				", aber sonstige Gedenktage für $vorname haben wir nicht gespeichert.",
			);
			$details->{'namenstage_kurztext'}.=shift(@temp);

	} elsif($konf>0)
	{
		if ($#{$namenstag->{'nt'}}>-1)
		{
			if($konf==1)
			{
				my $art;
				$art="evangelischen" if exists($namenstag->{'E'});
				$art="anglikanischen" if exists($namenstag->{'A'});
				$art="orthodoxen" if exists($namenstag->{'O'});
				$art||="katholischen";
				my @temp=&mischeListe(
					". ".ucfirst(&main::getZufallstext("desweiteren"))." konnten wir noch einen anderen $art Gedenktag finden.",
					". ".ucfirst(&main::getZufallstext("desweiteren"))." konnten wir noch einen weiteren $art Gedenktag finden.",
				);
				#&main::logge_int("Hossa 2! $vorname");
				$details->{'namenstage_kurztext'}.=shift(@temp);
			} else
			{
				my @temp=&mischeListe(
					", ".&main::getZufallstext("desweiteren")." konnten wir noch $konf andere Gedenktage finden.",
					". ".ucfirst(&main::getZufallstext("desweiteren"))." konnten wir noch $konf andere Gedenktage finden.",
					". ".ucfirst(&main::getZufallstext("desweiteren"))." haben wir noch $konf andere Gedenktage gefunden.",
					", ".&main::getZufallstext("desweiteren")." konnten wir noch $konf andere Segens- und Gedenktage finden.",
					", hinzu kommen $konf andere Segens- und Gedenktage.",
					", hinzu kommen $konf andere Gedenktage.",
				);
				$details->{'namenstage_kurztext'}.=shift(@temp);

				@temp=&mischeListe(
					ucfirst &main::getZufallstext("desweiteren")." konnten wir noch $konf andere Gedenktage finden: ",
					ucfirst &main::getZufallstext("desweiteren")." haben wir $konf andere Gedenktage finden können: ",
					ucfirst &main::getZufallstext("desweiteren")." haben wir $konf andere Gedenktage gespeichert: ",
					ucfirst &main::getZufallstext("desweiteren")." haben wir $konf andere Gedenktage in unserer Namenstag-Datenbank gefunden: ",
					ucfirst &main::getZufallstext("desweiteren")." konnten wir noch $konf andere Gedenktage finden: ",
					ucfirst &main::getZufallstext("desweiteren")." haben wir noch $konf andere Gedenktage gefunden: ",
					ucfirst &main::getZufallstext("desweiteren")." konnten wir noch $konf andere Segens- und Gedenktage finden: ",
					"Hinzu kommen $konf andere Segens- und Gedenktage: ",
					"Hinzu kommen $konf andere Gedenktage: ",
				);
				$details->{'namenstage_lang'}.="<br/>".shift(@temp)."<br/><br/>";
			}
		} else
		{
			if($konf>1)
			{
				@temp=&mischeListe(
					", aber wir haben $konf andere Gedenktage gefunden",
					". Allerdings konnten wir $konf andere Gedenktage finden",
					". wir haben aber $konf andere Gedenktage finden können",
					". wir haben aber $konf andere Gedenktage finden können",
					", wir haben allerdings $konf andere Gedenktage gefunden",
				);
			} else
			{
				@temp=&mischeListe(
					", aber wir haben einen anderen Gedenktag gefunden",
					". Allerdings konnten wir einen anderen Gedenktag finden",
					". wir haben aber einen anderen Gedenktag finden können",
					". wir haben aber einen anderen Gedenktag finden können",
					", wir haben allerdings einen anderen Gedenktag gefunden",
				);
			}
			$details->{'namenstage_kurztext'}.=shift(@temp).".";
			$details->{'namenstage_lang'}.=shift(@temp)."<br/><br/>";
		}

		my $ausserdem="";
		if($bisher>0)
		{
			$ausserdem=&main::getZufallstext('desweiteren');
		}

		# A+E+K+O
		if($#{$namenstag->{'AEKO'}}>-1)
		{
			if($#{$namenstag->{'AEKO'}}>0)
			{
				@temp=(
					"Im Katholischen, im Evangelischen, bei den Anglikanern und auch den orthodoxen werden $ausserdem die folgenden ".($#{$namenstag->{'AEKO'}}+1)." Gedenktage begangen",
					"Bei den Katholiken, evangelischen und anglikanischen Gläubigen sowie in der orthodoxen Kirche werden $ausserdem die folgenden ".($#{$namenstag->{'AEKO'}}+1)." Gedenktage begangen",
					"Sowohl katholische und orthodoxe wie auch evangelische und Anglikanische Gläubige kennen $ausserdem die ".($#{$namenstag->{'AEKO'}}+1)." folgende Gedenktage",
				);
			} else
			{
				@temp=(
					"Im Katholischen, in der evangelischen Kirche und bei den Anglikanern sowie im Orthodoxen wird $ausserdem folgender Gedenktag begangen",
					"Katholische, orthodoxe, evangelische und auch anglikanische Gläubige begehen $ausserdem folgenden Gedenktag",
					"Sowohl in der katholischen und orthodoxen wie auch in der evangelischen und anglikanischen Kirche kennt man $ausserdem folgenden Gedenktag",
				);
			}
			$details->{'namenstage_lang'}.=shift(@temp).":<br/>";#<ul class='hohe-zeilen'>";
			foreach my $i (@{$namenstag->{'AEKO'}})
			{
				my $pers=&wandel_person($i);
				#$details->{'namenstage_lang'}.="$datum $pers";
				$details->{'namenstage_lang'}.="$pers";
				++$bisher;
			}
			$details->{'namenstage_lang'}.="<br/>";
		}

		# A+E+K
		if($#{$namenstag->{'AEK'}}>-1)
		{
			if($#{$namenstag->{'AEK'}}>0)
			{
				@temp=(
					"Sowohl im Katholischen als auch bei den Evangelischen und bei den Anglikanern werden $ausserdem die folgenden ".($#{$namenstag->{'AEK'}}+1)." Gedenktage begangen",
					"Bei den Katholiken, evangelischen und anglikanischen Gläubigen werden $ausserdem die folgenden ".($#{$namenstag->{'AEK'}}+1)." Gedenktage begangen",
					"Sowohl katholische wie auch evangelische und Anglikanische Gläubige kennen $ausserdem die ".($#{$namenstag->{'AEK'}}+1)." folgende Gedenktage",
				);
			} else
			{
				@temp=(
					"Im Katholischen, in der evangelischen Kirche und bei den Anglikanern wird $ausserdem folgender Gedenktag begangen",
					"Katholische, evangelische und auch anglikanische Gläubige begehen $ausserdem folgenden Gedenktag",
					"Sowohl in der katholischen wie auch in der evangelischen und anglikanischen Kirche kennt man $ausserdem folgenden Gedenktag",
				);
			}
			$details->{'namenstage_lang'}.=shift(@temp).":<br/>";#<ul class='hohe-zeilen'>";
			foreach my $i (@{$namenstag->{'AEK'}})
			{
				my $pers=&wandel_person($i);
				$details->{'namenstage_lang'}.="$pers";
				++$bisher;
			}
			$details->{'namenstage_lang'}.="<br/>";
		}

		if($bisher>0)
		{
			$ausserdem=&main::getZufallstext('desweiteren');
		}
		# AE
		if($#{$namenstag->{'AE'}}>-1)
		{
			if($#{$namenstag->{'AE'}}>0)
			{
				@temp=(
					"Sowohl den Evangelischen als auch bei den Anglikanern werden die folgenden ".($#{$namenstag->{'AE'}}+1)." Gedenktage begangen",
					"Bei den evangelischen und anglikanischen Gläubigen werden die folgenden ".($#{$namenstag->{'AE'}}+1)." Gedenktage begangen",
					"Sowohl evangelische wie auch anglikanische Gläubige kennen die ".($#{$namenstag->{'AE'}}+1)." folgende Gedenktage",
				);
			} else
			{
				@temp=(
					"In der evangelischen Kirche und bei den Anglikanern wird folgender Gedenktag begangen",
					"Evangelische und auch anglikanische Gläubige begehen folgenden Gedenktag",
					"In der evangelischen und anglikanischen Kirche kennt man folgenden Gedenktag",
				);
			}
			$details->{'namenstage_lang'}.=shift(@temp).":<br/>";#<ul class='hohe-zeilen'>";
			foreach my $i (@{$namenstag->{'AE'}})
			{
				my $pers=&wandel_person($i);
				$details->{'namenstage_lang'}.="$pers";
				++$bisher;
			}
			$details->{'namenstage_lang'}.="<br/>";
		}

		# A+K
		if($bisher>0)
		{
			$ausserdem=&main::getZufallstext('desweiteren');
		}
		if($#{$namenstag->{'AK'}}>-1)
		{
			if($#{$namenstag->{'AK'}}>0)
			{
				@temp=(
					"Im Katholischen und bei den Anglikanern werden die folgenden ".($#{$namenstag->{'AK'}}+1)." Gedenktage begangen",
					"Bei den Katholiken und bei den Anglikanern werden die folgenden ".($#{$namenstag->{'AK'}}+1)." Gedenktage begangen",
					"Sowohl Katholiken als auch Anglikaner kennen die ".($#{$namenstag->{'AK'}}+1)." folgende Gedenktage",
				);
			} else
			{
				@temp=(
					"Im Katholischen und bei den Anglikanern wird folgender Gedenktag begangen",
					"Bei den Katholiken und bei den Anglikanern wird folgender Gedenktag begangen",
					"Sowohl Katholiken als auch Anglikaner kennen folgenden Gedenktag",
				);
			}
			$details->{'namenstage_lang'}.=shift(@temp).":<br/>";#<ul class='hohe-zeilen'>";
			foreach my $i (@{$namenstag->{'AK'}})
			{
				my $pers=&wandel_person($i);
				$details->{'namenstage_lang'}.="$pers";
				++$bisher
			}
			$details->{'namenstage_lang'}.="<br/>";
		}

		# A+K
		if($bisher>0)
		{
			$ausserdem=&main::getZufallstext('desweiteren');
		}
		if($#{$namenstag->{'EK'}}>-1)
		{
			#&main::logge_int("HOSSAA!!!!");
			if($#{$namenstag->{'EK'}}>0)
			{
				@temp=(
					"Im Katholischen und bei den evangelischen Gläubigen werden die folgenden ".($#{$namenstag->{'EK'}}+1)." Gedenktage begangen",
					"Bei den Katholiken und bei den Anglikanern werden die folgenden ".($#{$namenstag->{'EK'}}+1)." Gedenktage begangen",
					"Sowohl Katholiken als auch Anglikaner kennen die ".($#{$namenstag->{'EK'}}+1)." folgende Gedenktage",
				);
			} else
			{
				@temp=(
					"Im Katholischen und in der evangelischen Kirche wird folgender Gedenktag begangen",
					"Bei den Katholiken und bei den evangelischen Gläubigen wird folgender Gedenktag begangen",
					"Sowohl Katholiken als auch evangelische Gläubige kennen folgenden Gedenktag",
					"Im Katholischen und auch in der evangelischen Kirche wird folgender Gedenktag begangen",
					"Bei den Katholiken und auch bei den evangelischen Gläubigen wird folgender Gedenktag begangen",
					"Sowohl Katholiken als auch evangelische Gläubige kennen den folgenden Gedenktag",
				);
			}
			$details->{'namenstage_lang'}.=shift(@temp).":<br/>";#<ul class='hohe-zeilen'>";
			foreach my $i (@{$namenstag->{'EK'}})
			{
				my $pers=&wandel_person($i);
				$details->{'namenstage_lang'}.="$pers";
				++$bisher
			}
			$details->{'namenstage_lang'}.="<br/>";
		}


		# K
		if($bisher>0)
		{
			$ausserdem=&main::getZufallstext('desweiteren');
		}
		if($#{$namenstag->{'K'}}>-1)
		{
			if($#{$namenstag->{'K'}}>0)
			{
				@temp=(
					"Im <strong>Katholischen</strong> werden $ausserdem die folgenden ".($#{$namenstag->{'K'}}+1)." Gedenktage begangen",
					"Bei den <strong>Katholiken</strong> werden $ausserdem die folgenden ".($#{$namenstag->{'K'}}+1)." Gedenktage begangen",
					"<strong>Katholiken</strong> kennen $ausserdem die ".($#{$namenstag->{'K'}}+1)." folgende Gedenktage",
					"Nur im <strong>katholischen Glauben</strong> werden $ausserdem die folgenden ".($#{$namenstag->{'K'}}+1)." Gedenktage begangen",
					"Ausschließlich bei den <strong>Katholiken</strong> werden $ausserdem die folgenden ".($#{$namenstag->{'K'}}+1)." Gedenktage begangen",
					"Nur <strong>katholische Gläubige</strong> kennen $ausserdem die ".($#{$namenstag->{'K'}}+1)." folgende Gedenktage",
				);
			} else
			{
				@temp=(
					"Im Katholischen wird $ausserdem folgender Gedenktag begangen",
					"Bei den Katholiken wird $ausserdem folgender Gedenktag begangen",
					"Katholiken kennen $ausserdem folgenden Gedenktag",
					"Nur im Katholischen wird $ausserdem folgender Gedenktag begangen",
					"Im katholischen Glauben wird $ausserdem folgender Gedenktag begangen",
					"Die katholischen Gläubigen kennen $ausserdem folgenden Gedenktag",
				);
			}
			$details->{'namenstage_lang'}.=shift(@temp).":<br/>";
			foreach my $i (@{$namenstag->{'K'}})
			{
				my $pers=&wandel_person($i);
				++$bisher;
				$details->{'namenstage_lang'}.="$pers";
			}
			$details->{'namenstage_lang'}.="<br/>";
		}

		# E
		if($#{$namenstag->{'E'}}>-1)
		{
			if($#{$namenstag->{'E'}}>0)
			{
				@temp=(
					"Im <strong>Evangelischen</strong> werden die folgenden ".($#{$namenstag->{'E'}}+1)." Gedenktage begangen",
					"Im <strong>evangelischen Glauben</strong> werden die folgenden ".($#{$namenstag->{'E'}}+1)." Gedenktage begangen",
					"In der <strong>evangelischen Kirche</strong> werden ausserdem die ".($#{$namenstag->{'E'}}+1)." folgende Gedenktage",
				);
			} else
			{
				@temp=(
					"Im <strong>Evangelischen</strong> wird folgender Gedenktag begangen",
					"In der <strong>evangelischen Kirche</strong> wird folgender Gedenktag begangen",
					"Im <strong>evangelischen Glauben</strong> kennt man folgenden Gedenktag",
					"Nur im <strong>Evangelischen</strong> wird folgender Gedenktag begangen",
					"Im <strong>evangelischen Glauben</strong> wird folgender Gedenktag begangen",
					"Die <strong>evangelischen Gläubigen</strong> kennen folgenden Gedenktag",
					"Die <strong>evangelischen Gläubigen</strong> begehen folgenden Gedenktag",
				);
			}
			$details->{'namenstage_lang'}.=shift(@temp).":<br/>";
			foreach my $i (@{$namenstag->{'E'}})
			{
				my $pers=&wandel_person($i);
				++$bisher;
				$details->{'namenstage_lang'}.="$pers";
			}
			$details->{'namenstage_lang'}.="<br/>";
		}

		# O
		if($#{$namenstag->{'O'}}>-1)
		{
			if($#{$namenstag->{'O'}}>0)
			{
				@temp=(
					"Im <strong>Orthodoxen</strong> werden die folgenden ".($#{$namenstag->{'O'}}+1)." Heiligentage begangen",
					"Im <strong>orthodoxen Glauben</strong> werden die folgenden ".($#{$namenstag->{'O'}}+1)." Gedenktage begangen",
					"In der <strong>orthodoxen Kirche</strong> werden die ".($#{$namenstag->{'O'}}+1)." folgenden Gedenktage begangen",
				);
			} else
			{
				@temp=(
					"Im <strong>Orthodoxen</strong> wird folgender Gedenktag begangen",
					"In der <strong>orthodoxen Kirche</strong> wird folgender Gedenktag begangen",
					"Im <strong>orthodoxen Glauben</strong> kennt man folgenden Gedenktag",
					"Nur im <strong>Orthodoxen</strong> wird folgender Gedenktag begangen",
					"Im <strong>orthodoxen Glauben</strong> wird folgender Gedenktag begangen",
					"Die <strong>orthodoxen Gläubigen</strong> kennen folgenden Gedenktag",
					"Die <strong>orthodoxen Gläubigen</strong> begehen folgenden Gedenktag",
				);
			}
			$details->{'namenstage_lang'}.=shift(@temp).":<br/>";
			foreach my $i (@{$namenstag->{'O'}})
			{
				my $pers=&wandel_person($i);
				++$bisher;
				$details->{'namenstage_lang'}.="$pers";
			}
			$details->{'namenstage_lang'}.="<br/>";
		}

		if($#{$namenstag->{'A'}}>-1)
		{
			if($#{$namenstag->{'A'}}>0)
			{
				@temp=(
					"Im <strong>Anglikanischen</strong> werden die folgenden ".($#{$namenstag->{'A'}}+1)." Heiligentage begangen",
					"Im <strong>anglikanischen Glauben</strong> werden die folgenden ".($#{$namenstag->{'A'}}+1)." Gedenktage begangen",
					"In der <strong>anglikanischen Kirche</strong> werden die ".($#{$namenstag->{'A'}}+1)." folgenden Gedenktage begangen",
				);
			} else
			{
				@temp=(
					"Im <strong>Anglikanischen</strong> wird folgender Gedenktag begangen",
					"In der <strong>anglikanischen Kirche</strong> wird folgender Gedenktag begangen",
					"Im <strong>anglikanischen Glauben</strong> kennt man folgenden Gedenktag",
					"Nur im <strong>Anglikanischen</strong> wird folgender Gedenktag begangen",
					"Im <strong>anglikanischen Glauben</strong> wird folgender Gedenktag begangen",
					"Die <strong>anglikanischen Gläubigen</strong> kennen folgenden Gedenktag",
					"Die <strong>anglikanischen Gläubigen</strong> begehen folgenden Gedenktag",
				);
			}
			$details->{'namenstage_lang'}.=shift(@temp).":<br/>";
			foreach my $i (@{$namenstag->{'A'}})
			{
				my $pers=&wandel_person($i);
				++$bisher;
				$details->{'namenstage_lang'}.="$pers";
			}
			$details->{'namenstage_lang'}.="<br/>";
		}
	}
	if(length($details->{'namenstag'})>0)
	{
		#$details->{'namenstag'}=~s/,/, /g;
		#$details->{'namenstag'}=~s/^(.*), (.*?)/$1 und am $2/;
		#my @temp=split(/, /,$details->{'namenstag'});
		#$details->{'namenstage_kurztext'}="Der Namenstag von $vorname ist am $temp[0]";
		#if($#temp>1)
		#{
	#
#		} elsif($#temp==1)
		#{
	#		$details->{'namenstage_kurztext'}.=" und am $temp[1].<br/><br/><i class='fa fa-arrow-circle-right text-gelb'></i> <a href='/vornamen/$details->{'geschlecht_lang'}/$vorname/allgemein.html'>Zeige alle Namenstage</a>";
	#	}
	} else
	{
		my @temp=&mischeListe(
			"Für $vorname ist leider kein Namenstag bekannt",
			"Der Namenstag von $vorname ist uns leider nicht bekannt",
			"Für den Vornamen $vorname ist uns leider noch kein Namenstag bekannt",
			"Für den Vornamen $vorname haben wir leider keine Infos über den Namenstag oder Namenspatron",
			"Für $vorname liegen uns zu Namenstagen oder -patronen keine Infos vor",
			"Leider kennen wir den Namenstag von $vorname nicht"
		);
		#$details->{'namenstage_kurztext'}=shift(@temp).". ";
	}


	#
	# Spitznamen
	#
	$details->{'anz_spitznamen'}=0;
	my $spitznamen="var word_array = [\n";
	my $lfd=0;

	if(!exists($main::STATISCH->{'votes'}->{'vornamen-spitznamen'}->{$details->{'vid'}}))
	{
		my $dummy=&main::socket(&to_json({
			'todo'=>'getVotes',
			'thema'=>"vornamen-spitznamen",
			'subthema'=>$details->{'vid'}
		}));
		$main::STATISCH->{'votes'}->{'vornamen-spitznamen'}->{$details->{'vid'}}=&from_json($dummy);
	}
	my $e=$main::STATISCH->{'votes'}->{'vornamen-spitznamen'}->{$details->{'vid'}};

	foreach my $i (keys %$e)
	{
		#&main::logge_int("============= $i / $e->{$i}");
		next if $i=~/analerreit/i or $e->{$i} eq '-1' or $i eq '-1';
		#&main::logge_int("I: $i");
		if($i!~/^[a-zäöüßÄÖÜ\-éè]+$/i)
		{
			#&main::logge_int("Sonderzeichen bei Spitzname $details->{'vorname'}: $i");
			next;
		}
		++$details->{'anz_spitznamen'};
		++$lfd;
		my $weight=3;
		if(exists($e->{$i}->{'anz'}) && $e->{$i}->{'anz'}>0)
		{
			$weight=$e->{$i}->{'punkte'}/$e->{$i}->{'anz'};
		}
		#&main::logge_int("$i = $weight");
		$spitznamen.="\t{text: '\u$i', weight: $weight,link: 'javascript:voteSpitzname(\"\u$i\");',html:{class: 'v_sp'}},\n";
	}
	$spitznamen.="];\n";

	$details->{'anz_spitznamen'}="Keine" if $details->{'anz_spitznamen'}<1;
	if($details->{'anz_spitznamen'}>0)
	{
		#$details->{'spitznamen_info'}=qq!<div class="tc" style='margin-top:-30px;'>cloud ui-widget-content ui-corner-all" style='width:300px;'><ul class="nav">!.$spitznamen.qq!</ul><div class='cl'></div></div>!;
	} else
	{
		$details->{'spitznamen'}="<div class='panel'><span class='text-muted'>Es sind leider noch keine Spitznamen zu $vorname vorhanden :(</span></div>";
	}
	$details->{'spitznamen'}=$spitznamen;

	#
	# Metaphone
	#
	@temp=();
	$lfd=0;
	foreach my $i (sort {
		my $v1=$main::cache->{'vornamen'}->{$a};
		my $v2=$main::cache->{'vornamen'}->{$b};
		($main::cache->{'db'}->{'vornamen'}->{$v2}->{'geburten'}+$main::cache->{'db'}->{'vornamen'}->{$v2}->{'menschen'})
			<=>
		($main::cache->{'db'}->{'vornamen'}->{$v1}->{'geburten'}+$main::cache->{'db'}->{'vornamen'}->{$v1}->{'menschen'})
	} split(/\s+/,$details->{'metaphone'}))
	{
		next if $i=~/^[A-Z0]+$/;
		last if ++$lfd>30;
		push(@temp,$i);
	}
	if($#temp>-1)
	{
		$details->{'anz_metaphone'}="<i class='fa fa-arrow-circle-right text-gelb'></i> <a href='/vornamen/$details->{'geschlecht_lang'}/$vorname/sonstiges.html'>";
		my @temp2=&main::mischeListe(
			($#temp+1)." Alternativen zu $vorname",
			($#temp+1)." alternative Vornamen gefunden",
			($#temp+1)." vergleichbare Vornamen gefunden",
			($#temp+1)." ähnliche Vornamen gefunden",
#			"Für $vorname gibt es ".($#temp+1)." Alternativen",
#			"Für $vorname gibt es ".($#temp+1)." alternative Vornamen",
#			"Für $vorname gibt es ".($#temp+1)." vergleichbare Vornamen",
#			"Zu $vorname gibt es ".($#temp+1)." ähnliche Vornamen",
		);
		$details->{'anz_metaphone'}.=shift(@temp2)."</a><br/>";


		my $break;
		if($#temp>18)
		{
			$break=int($#temp/3)+2;
		} else
		{
			$break=int($#temp/2)+2;
		}
		my $ilfd=0;
		$details->{'liste_metaphone'}="<div class='row'>";
		foreach my $i (@temp)
		{
			next if length($i)<3;
			if(++$ilfd==$break)
			{
				#$details->{'liste_metaphone'}.="</td><td width='20'></td><td valign='top'>";
				$ilfd=+1;
			}
			$details->{'liste_metaphone'}.="<div class='col-xs-4'><i class='fa fa-arrow-circle-right text-gelb'></i> <a href='/vornamen/$details->{'geschlecht_lang'}/$i/index.html'>$i</a></div>";
		}
		$details->{'liste_metaphone'}.="</div>";
	}
	if(length($details->{'liste_metaphone'})<1)
	{
		my @temp=&main::mischeListe(
			"Für den Vornamen $vorname sind zur Zeit keine Alternativen bekannt."
		);
		$details->{'liste_metaphone'}="<i class='fa fa-arrow-circle-right text-gelb'></i> ".shift(@temp);
	}

	# Nachnamen

	if(-e "$main::master->{'_path_data'}/vornamen/nachnamen/$details->{'vorname_hex'}.txt")
	{
		#$details->{'infotext1'}=encode_utf8(read_file("$main::master->{'_path_data'}/vornamen/nachnamen/$vorname.kurztext"));
		#$details->{'infotext1'}=read_file("$main::master->{'_path_data'}/vornamen/nachnamen/$vorname.kurztext");
		my @nn=read_file("$main::master->{'_path_data'}/vornamen/nachnamen/$details->{'vorname_hex'}.txt");
		$details->{'anz_nachnamen'}=$#nn+1;
		if($#nn>1000)
		{
			my @temp=(
				ucfirst(&main::getZufallstext2("fuer den"))." Vornamen $vorname gibt es ".&main::getZufallstext2("viele verschiedene")." Nachnamen, insg. konnten wir ".($#nn+1)." Nachnamen finden",
				ucfirst(&main::getZufallstext2("fuer den"))." Vornamen $vorname gibt es ".&main::getZufallstext2("viele verschiedene")." Nachnamen, insg. konnten wir ".($#nn+1)." verschiedene Nachnamen finden",
				ucfirst(&main::getZufallstext2("fuer den"))." Vornamen $vorname gibt es ".&main::getZufallstext2("viele verschiedene")." Nachnamen, insg. haben wir ".($#nn+1)." verschiedene Nachnamen gespeichert",
				ucfirst(&main::getZufallstext2("fuer den"))." Vornamen $vorname gibt es sehr viele verschiedene Nachnamen, ".($#nn+1)." verschiedene Nachnamen haben wir aktuell gespeichert",
				ucfirst(&main::getZufallstext2("fuer den"))." Vornamen $vorname konnten wir ".($#nn+1)." Nachnamen finden",
				ucfirst(&main::getZufallstext2("fuer den"))." $vorname konnten wir ".($#nn+1)." Nachnamen finden",
				ucfirst(&main::getZufallstext2("fuer den"))." $vorname konnten wir ".($#nn+1)." verschiedene Nachnamen finden",
			);
			my @t=&mischeListe(@temp);
			$details->{'nn'}=$t[0].". ";
		}
		if($#nn>10)
		{
			my @temp=(
				"Die häufigsten 10 Nachnamen sind",
				"Die häufigsten 10 Nachnamen findest du in der folgenden Liste",
				"Die häufigsten 10 Nachnamen haben wir dir aufgeführt",
				"Die häufigsten 10 Nachnamen von $vorname sind",
				"Die häufigsten 10 Nachnamen von $vorname findest du in der folgenden Liste",
				"Die häufigsten 10 Nachnamen von $vorname haben wir dir aufgeführt",
			);
			my @t=&mischeListe(@temp);
			$details->{'nn'}.=$t[0].": ";
		} else
		{
			my @temp=(
				"Die Nachnamen sind",
				"Die gefundenen Nachnamen sind",
				"Die gefundenen Nachnamen lauten",
				"Hier sind die gefunden Nachnamen",
				"Die Nachnamen, die wir finden konnten, lauten",
				"Hier die gefunden Nachnamen",
				"Die von uns gefundenen Nachnamen sind"

			);
			my @t=&mischeListe(@temp);
			$details->{'nn'}.=$t[0].":";
		}
		$details->{'nn'}.="<br/><br/><div class='hohe-zeilen'>";
		my $lfd=0;
		foreach my $z (@nn)
		{
			last if ++$lfd>10;
			my($name,$anz)=split(/\t/,$z);
			$name=encode_utf8($name);
			$details->{'nn'}.=<<EOF;
<div class='row'>
	<div class='col-xs-2 text-center'>
		<span class='badge gelb'>$lfd</span>
	</div>
	<div class='col-xs-7 text-center'>
		<b>$name</b></a>
	</div>
	<div class='col-xs-3 text-center'>
		$anz x
	</div>
</div>
EOF
		}
		$details->{'nn'}.="</div><br/><i class='fa fa-arrow-circle-right text-gelb'></i> <a href='/vornamen/nachnamen.html?vorname=$details->{'vorname_hex'}'>Zur Nachnamen-Statistik von $vorname</a>";


		#if(length($z[2])>0)
		#{
		#	$z[2]=~s/X: \d+//;
			#$z[2]="<h3><span class='subtitel_gelb'>Verteilung in Deutschland:</span></h3><br/>".$z[2].".";
			#$z[2].="<br/><br/><span class='ip p_orange'></span> <a href='/vornamen/$details->{'g2'}/$details->{'vorname_hex'}/seite4.html'>Zeige Karte & mehr Infos</a>";
		#}
		#$details->{'nn'}=$details->{'infotext1'};#join("<br\/>",@z);
		#$details->{'infotext1'}.="<br/><i class='fa fa-arrow-circle-right text-gelb'></i> <a href='/index.fcgi?seite=namen_nn&vorname=$vorname'>Zur Nachnamen-Statistik von $vorname</a>";
	} else
	{
		my @temp=(
			"Wir haben leider nicht genügend Personen namens $vorname in Deutschland gefunden",
			"In Deutschland leben zuwenig Menschen mit dem Vornamen $vorname für eine aussagekräftige Statistik",
			"In Deutschland leben nicht genug ${vorname}'s für eine Statistik",
			"In Deutschland leben nicht genug ${vorname}'s für eine aussagekräftige Statistik",
			"Für eine genaue Analyse bzw. Statistik leben nicht genug ${vorname}'s hier in Deutschland",
			"Leider konnten wir nicht genug Personen in Deutschland für eine aussagekräftige Nachnamen-Statistik finden"
		);
		my @t=&mischeListe(@temp);
		$details->{'nn'}=shift(@t).".<br/><br/>";
	}

	# Anzahl Nachnamen
	if($details->{'anz_nachnamen'}>1)
	{
		my $m=&commify($details->{'anz_nachnamen'},1);
		my @temp=&main::mischeListe(
			"$m verschiedene Nachnamen",
			"$m verschiedene Nachnamen in D",
			"$m Nachnamen gefunden",
			"$m Nachnamen in D gefunden",
			"$m Nachnamen in Deutschland",
			"$m Nachnamen für $details->{'vorname'} gefunden",
		);
		$details->{'anz_nachnamen'}="<i class='fa fa-arrow-circle-right text-gelb'></i> <a href='/vornamen/nachnamen.html?vorname=$details->{'vorname_hex'}'>".shift(@temp)."</a>";
	} elsif($details->{'anz_nachnamen'}==1)
	{
		my $m=$details->{'anz_nachnamen'};
		my @temp=&main::mischeListe(
			"Nur 1 Nachnamen gefunden",
			"1 Nachname in D",
			"Ein Nachname in D gefunden",
			"Nur einen Nachnamen gefunden",
			"Nur 1 Nachnamen in D gefunden",
			"1 Nachname in Deutschland",
			"1 Nachname für $details->{'vorname'} gefunden",
			"Einen Nachnamen für $details->{'vorname'} gefunden",
		);
		$details->{'anz_nachnamen'}="<i class='fa fa-arrow-circle-right text-gelb'></i> <a href='/vornamen/nachnamen.html?vorname=$details->{'vorname_hex'}'>".shift(@temp)."</a>";
	} else
	{
		my @temp=&main::mischeListe(
			"Keine Nachnamen in Deutschland gefunden",
			"Keine Nachnamen für $details->{'vorname'} gefunden",
			"Leider keine Nachnamen für $details->{'vorname'} gefunden",
			"Zu $details->{'vorname'} haben wir keine Nachnamen gefunden"
		);
		$details->{'anz_nachnamen'}="<i class='fa fa-arrow-circle-right text-gelb'></i> ".shift(@temp);
	}




	if(!exists($main::TEMP->{'aufrufe_vornamen'}->{$vorname}->{$ENV{'REMOTE_ADDR'}}))
	{
		open(AD,">>$main::master->{'_path_data'}/vornamen/aufrufe/$vorname");
		print AD 1;
		close(AD);
		open(AD,">>$main::master->{'_path_data'}/aufrufe/vornamen.count");
		print AD 1;
		close(AD);
		$main::TEMP->{'aufrufe_vornamen'}->{$vorname}->{$ENV{'REMOTE_ADDR'}}=1;
	}

	# Aufrufe
	$details->{'anz_aufrufe'}=-s("$main::master->{'_path_data'}/vornamen/aufrufe/$vorname") || "kein einziges ";

	# Häufigkeit der Aufrufe
	my $qual=0;
	my $akt_max=8000;
	my $haeufigkeit="";
	if($details->{'anz_aufrufe'}>$akt_max)
	{
		$details->{'haeufigkeit'}="sehr oft";
		$details->{'qual'}=5;
	} elsif($details->{'anz_aufrufe'}>(($akt_max/3)*2))
	{
		$details->{'haeufigkeit'}="häufig";
		$details->{'qual'}=4;
	} elsif($details->{'anz_aufrufe'}>($akt_max/3))
	{
		$details->{'haeufigkeit'}="nicht so oft";
		$details->{'qual'}=3;
	} elsif($details->{'anz_aufrufe'}>($akt_max/5))
	{
		$details->{'haeufigkeit'}="wenig";
		$details->{'qual'}=2;
	} elsif($details->{'anz_aufrufe'}>($akt_max/7))
	{
		$details->{'haeufigkeit'}="selten";
		$details->{'qual'}=2;
	} else
	{
		$details->{'haeufigkeit'}="fast nie";
		$details->{'qual'}=1;
	}

	#
	# Geburten
	#
	$details->{'geburttext'}="seit 2010 ca. ";
	$details->{'geburttext2'}="in den letzten Jahren konnten wir ";



	if($details->{'platz_d'}>0)
	{
		$details->{'platztext'}="$details->{'platz_d'}. Platz für $vorname:<br/>$details->{'menschen'} x in D";
	} else
	{
		$details->{'platztext'}="0 Menschen namens<br/>$vorname";
	}
	#&main::logge_int("Platz A: $details->{'platz_d'}");
	if($details->{'platz'}>0)
	{
		$details->{'platztext2'}="$details->{'platz'}. Platz";
		$details->{'geburttext'}.="$details->{'geburten'} \u$details->{'geschlecht_lang'} mit dem Namen $vorname in unserer Geburtenstatistik erfasst - das ist Platz $details->{'platz'} in der <i class='fa fa-arrow-circle-right text-gelb'></i> <a href='/wissen/nachwuchs/geburt/statistik/'>aktuellen Geburtenstatistik</a>";
		$details->{'geburttext2'}.="$details->{'geburten'} \u$details->{'geschlecht_lang'} namens $vorname in den öffentlichen Geburtenlisten gefunden - das ist Platz $details->{'platz'} in der <i class='fa fa-arrow-circle-right text-gelb'></i> <a href='/wissen/nachwuchs/geburt/statistik/'>aktuellen Geburtenstatistik</a>";
		$details->{'anz_babies'}=$details->{'geburten'};
		if($qual>3)
		{
			if($details->{'platz'}>80)
			{
				$details->{'geburttext'}="Wir haben $details->{'geburttext'}";
			} elsif($details->{'platz'}>30)
			{
				$details->{'geburttext'}="Es wurden $details->{'geburttext'}";
			} else
			{
				$details->{'geburttext'}="Wir haben auch $details->{'geburttext'}";
			}
		} else
		{
			if($details->{'platz'}>80)
			{
				$details->{'geburttext'}="Wir haben $details->{'geburttext'} ";
			} elsif($details->{'platz'}>30)
			{
				$details->{'geburttext'}="Aber wir haben $details->{'geburttext'} ";
			} else
			{
				$details->{'geburttext'}="Aber immerhin haben wir auch $details->{'geburttext'} ";
			}
		}
	} else
	{
		$details->{'platztext2'}="Keine";
		$details->{'geburttext2'}.=" keine einzige Geburt eines Baby namens $vorname feststellen können. Allerdings melden auch nicht alle Geburtshäuser und KH ihre Geburten, so daß wir immer nur einen Durchschnitt zeigen können";
		$details->{'geburttext'}="und es wurden $details->{'geburttext'} keine \u$details->{'geschlecht_lang'} mit dem Vornamen $vorname geboren";
		$details->{'anz_babies'}="Keine";
	}


	# Herkunft
	$details->{'herkunft'}=~s/(\b)D(\b)/$1Deutsch$2/g;
	$details->{'herkunft'}=~s/(\b)AR(\b)/$1Arabien$2/g;
	$details->{'herkunft'}=~s/(\b)GB(\b)/$1England$2/g;
	$details->{'herkunft'}=~s/(\b)IN(\b)/$1Indien$2/g;
	$details->{'herkunft'}=~s/(\b)LAT(\b)/$1Lateinisch$2/g;
	$details->{'herkunft'}=~s/(\b)NL(\b)/$1Holland$2/g;
	$details->{'herkunft'}=~s/(\b)RU(\b)/$1Russisch$2/g;
	$details->{'herkunft'}=~s/(\b)TU(\b)/$1Türkisch$2/g;
	$details->{'herkunft'}=~s/(\b)GR(\b)/$1Griechisch$2/g;
	$details->{'herkunft'}=~s/GR/griechisch/g;
	$details->{'herkunft'}=~s/D(\b)/deutsch$1/g;
	$details->{'herkunft'}=~s/,/, /g;
	$details->{'herkunft'}=~s/, ([a-z])/, \u$1/g;
	$details->{'herkunft'}=~s/^([a-z])/\u$1/g;

	# Herkunft
	$details->{'sp'}="";
   foreach my $i (split(/,/,lc($details->{'herkunft'})))
	{
		$i=~s/^\s+//;
		$i=~s/\s+$//;
		my $vi=$i;
		$vi=~s/([^a-zA-Z0-9\-])/"%".sprintf("%02X",ord($1))/ge;
		$details->{'sp'}.="<tr><td valign='top'>$i</td><td valign='top'><i class='fa fa-arrow-circle-right text-gelb'></i> <a href='/vornamen/laender/${vi}e,vornamen/'>${i}e Vornamen</a></td></tr>";
	}
	if(length($details->{'sp'})<1)
	{
		$details->{'sp'}="<span class='kommentar'>Noch keine Sprache eingetragen</span>";
	} else
	{
		$details->{'sp'}="<table style='width:100%'>$details->{'sp'}</table>";
	}


	# Versionen des Namen in anderen Sprachen
	my $versionen="";
	if($details->{'versionen'})
	{
		#warn("X: $details->{'db'}->{'versionen'}");
		$versionen='<table><tr>';
		foreach my $i (split(/,/,$details->{'versionen'}))
		{
			my($sp,$ver)=split(/:/,$i);
			$ver=~s/%(..)/chr(hex($1))/eg;
			next if $ver eq $vorname;
			#$ver=&umlaut($ver);
			$sp=~s/^ar/Arabisch/;
			$sp=~s/^al/Albanisch/;
			$sp=~s/^bg/Bulgarisch/;
			$sp=~s/^bu/Bulgarisch/;
			$sp=~s/^ca/Kanadisch/;
			$sp=~s/^ch/Schweizer./;
			$sp=~s/^de/Deutsch/;
			$sp=~s/^da/Dänisch/;
			$sp=~s/^en/Englisch/;
			$sp=~s/^gb/Englisch/;
			$sp=~s/^eo/Esperanto/;
			$sp=~s/^fi/Finnisch/;
			$sp=~s/^fr/Französisch/;
			$sp=~s/^gr/Griechisch/;
			$sp=~s/^he/Hebräisch/;
			$sp=~s/^ir/Irisch/;
			$sp=~s/^is/Isländisch/;
			$sp=~s/^it/Italienisch/;
			$sp=~s/^ja/Japanisch/;
			$sp=~s/^ka/Katalanisch/;
			$sp=~s/^kr/Kroatisch/;
			$sp=~s/^la/Lateinisch/;
			$sp=~s/^li/Litauisch/;
			$sp=~s/^lt/Litauisch/;
			$sp=~s/^lu/Luxemb./;
			$sp=~s/^nl/Niederl./;
			$sp=~s/^no/Norwegisch/;
			$sp=~s/^nn/Norwegisch/;
			$sp=~s/^pl/Polnisch/;
			$sp=~s/^pt/Portugiesisch/;
			$sp=~s/^ro/Rumänisch/;
			$sp=~s/^ru/Russisch/;
			$sp=~s/^sc/Schottisch/;
			$sp=~s/^se/Schwedisch/;
			$sp=~s/^sr/Serbisch/;
			$sp=~s/^sk/Slowakisch/;
			$sp=~s/^es/Spanisch/;
			$sp=~s/^cs/Tschechisch/;
			$sp=~s/^tu/Türkisch/;
			$sp=~s/^hu/Ungarisch/;
			$versionen.="<tr><td align='right'>$sp:</td><td>$ver</td></tr>";
		}
		$versionen.="</table>";
	} else
	{
		$versionen="<span class='kommentar'>".&main::getZufallstext2("keine infos",1)."</span>";
	}
	$details->{'versionen'}=$versionen;



	# Empfindung laden
	$details->{'empf'}=&getEmpfindung($vorname);

	# Ggf. Deutschlandverteilung laden
	if(!exists($main::cache->{'stats'}->{'vornamen_geo'}))
	{
		if(-e "$main::master->{'_path_data'}/vornamen/bl/alles.idx")
		{
			warn("Lade Geo-Cache (2)");
			$main::cache->{'stats'}->{'vornamen_geo'}=retrieve("$main::master->{'_path_data'}/vornamen/bl/alles.idx");
			#warn("Geladen: ".scalar keys %{$main::cache->{'stats'}->{'vornamen_geo'}});
		} else
		{
			$main::cache->{'stats'}->{'vornamen_geo'}={};
			&main::logge_int("Fehler: Kein Geo-Cache für Vornamen gefunden ($main::master->{'_path_data'}/vornamen/bl/alles.idx fehlt)",0);
		}
	}

	# Ggf. Geburten-Statistikindex laden
	if(!defined($main::cache->{'stats'}->{'vornamen_stats'}))
	{
		&main::logge_int("Lade Vornamen-Stats");
		if(-e "$main::master->{'_path_data'}/vornamen/alle-dbs-stats-nach-monaten2.idx") #stats-nach-monaten2.idx")
		{
			$main::cache->{'stats'}->{'vornamen_stats'}=retrieve("$main::master->{'_path_data'}/vornamen/alle-dbs-stats-nach-monaten2.idx");#stats-nach-monaten2.idx");
		} else
		{
			&main::logge_int("FEHLER: Kann Vornamen-Monatsstatistik nicht lesen, File: $main::master->{'_path_data'}/vornamen/stats-nach-monaten2.idx");
		}
	}

	#&main::logge_int("XX: ".-M "$main::master->{'_path'}/g/vornamen/charts/line_be_m_$details->{'vorname_hex'}.png");
	#&main::logge_int("XY: ".-M "$main::master->{'_path_data'}/vornamen/stats-nach-monaten2.idx");

	if(!-e "$main::master->{'_path'}/g/vXornamen/charts/line_be_m_$details->{'vorname_hex'}.png" or -M "$main::master->{'_path'}/g/vornamen/charts/line_be_m_$details->{'vorname_hex'}.png"> -M "$main::master->{'_path_data'}/vornamen/stats-nach-monaten2.idx")
	{
		#&main::logge_int("NEU!");
		# Diagramm für Platzierungsentwicklung bei Geburten
		my @monatsnamen=("Jan","Feb","Mär","Apr","Mai","Jun","Jul","Aug","Sep","Okt","Nov","Dez");
		my @tmp_stat;
		my @tmp_stat2;
		my @stat_jahre;
		my @stat_monate;

		my $letztes_jahr=$zeit->{'JJJJ'}-1;

		my $vstat=$main::cache->{'stats'}->{'vornamen_stats'}->{$vorname}->{'jahre'};
		#for my $jahr (($zeit->{'JJJJ'}-10)..$zeit->{'JJJJ'})
		for my $jahr (($zeit->{'JJJJ'}-100)..$zeit->{'JJJJ'})
		{
			if($jahr<$zeit->{'JJJJ'})
			{
				my $anz=$vstat->{$jahr} || 0;
				&main::logge_int("Jahr $jahr: $anz");
				#next if $anz<=0;
				push(@stat_jahre,"['$jahr',$anz]");
			}
		}

		$vstat=$main::cache->{'stats'}->{'vornamen_stats'}->{$vorname}->{'monate'};
		foreach my $i (sort keys %{$vstat})
		{
			my $jahr=substr($i,0,4);
			my $monat=substr($i,4,2);
			push(@stat_monate,"['".$monatsnamen[$monat-1]." ".substr($jahr,2)."',$vstat->{$i}]");
			#&main::logge_int("U: __________________ $i = $vstat->{$i} / $monat - $jahr");
		}
		@stat_monate=@stat_monate[$#stat_monate-24..$#stat_monate];

		if($#stat_jahre>-1)
		{
			my $statstring1=join(",",@stat_jahre);
			my $statstring2=join(",",@stat_monate);
			my $farbe='a0a0ff';
			if($details->{'geschlecht'} eq "w")
			{
				$farbe='FF69B4';
			}
			$details->{'js_line1'}=<<EOF;
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);

function drawChart()
{
	var data1 = google.visualization.arrayToDataTable([ ['Jahr','Geburten'], $statstring1 ]);
	var data2 = google.visualization.arrayToDataTable([ ['Monat','Geburten'], $statstring2 ]);
	var options = {
//     	chart: {
          	//title: '24-Monats-Trend: Babies namens $details->{'vorname'} in %',
          	//subtitle: '(Die letzten 24 Monate, in %)',
          	curveType: 'function',
//		},
		'backgroundColor': 'transparent',
		colors:['#$farbe'],
		titleTextStyle: {
          	fontSize: 15,
          	color:'#745700',
          	fontName:'Arial',
          },
          chartArea:{
          	left:56,
          	top:40,
          	width:'368',
          	height:'200'
          },
		trendlines: {
		    0: {
		      type: 'linear',
		      color: 'green',
		      lineWidth: 3,
		      opacity: 0.3,
		      showR2: true,
		      visibleInLegend: true
		    }
		},
		legend: {position: 'none'},
		width: 380,
		height: 300,
      };

      var chart1 = new google.visualization.LineChart(document.getElementById('chart1'));
      var chart2 = new google.visualization.LineChart(document.getElementById('chart2'));
	 google.visualization.events.addListener(chart2, 'ready', function () {
	      	\$.post("/cgibin/sgc.cgi",{'art':'line_be','titel':'Jahres-Trend','name':'$details->{'vorname_hex'}','image':chart2.getImageURI()});
	    });
	    google.visualization.events.addListener(chart1, 'ready', function () {
	      	\$.post("/cgibin/sgc.cgi",{'art':'line_be','titel':'24-Monats-Trend','name':'$details->{'vorname_hex'}','image':chart1.getImageURI()});
	    });
      chart1.draw(data2, options);
      chart2.draw(data1, options);
    }
EOF
			$details->{'keine_statistik_entwicklung'}=0;
		} else
		{
			#$details->{'js_stat_monat'}=qq!\$('#chart1').empty().append("<br/><br/><center><b>Noch nicht genug Daten</b></center>");\n!;
			$details->{'keine_statistik_entwicklung'}=1;
		}
	} else
	{
		$details->{'keine_statistik_entwicklung'}=0;
		my @temp=&main::mischeListe(
			"Babies namens $details->{'vorname'}: Geburtentrend der letzten Monate",
			"Babies namens $details->{'vorname'}: Geburtentrend der letzten 24 Monate",
			"Alle Geburten der letzten 24 Monate von Babies mit dem Vornamen $details->{'vorname'}",
			"24-Monats-Trend: Babies namens $details->{'vorname'}",
			"24-Monats-Trend: Babies mit Vornamen $details->{'vorname'}",
			"Häufigkeit des Vornamen $details->{'vorname'} in den letzten 24 Monaten",
		);
		$details->{'line_be_m_direkt'}="<img src='/g/vornamen/charts/line_be_m_$details->{'vorname_hex'}.png' alt='".shift(@temp)."'/><br/>";
		@temp=&main::mischeListe(
			"Babies namens $details->{'vorname'}: Geburtentrend der letzten Jahre",
			"Babies namens $details->{'vorname'}: Geburtentrend der letzten Jahre",
			"Alle Geburten der letzten Jahre von Babies mit dem Vornamen $details->{'vorname'}",
			"Jahres-Trend: Babies namens $details->{'vorname'}",
			"Jahres-Trend: Babies mit Vornamen $details->{'vorname'}",
			"Häufigkeit des Vornamen $details->{'vorname'} in den letzten Jahren",
		);
		$details->{'line_be_j_direkt'}="<img src='/g/vornamen/charts/line_be_j_$details->{'vorname_hex'}.png' alt='".shift(@temp)."'/><br/>";
	}
	#&main::logge_int("T: $details->{'js_line1'}");
	# Autoren?
	#warn("Suche /web/virtual/baby/daten/vornamen/promis/autoren/$details->{'vorname_hex'}.idx");
	# Werte für Karte
	my %BL=(1=>"Baden-Württemberg",2=>"Bayern",3=>"Berlin",4=>"Brandenburg",5=>"Bremen",6=>"Hamburg",7=>"Hessen",8=>"Mecklenburg-Vorpommern",9=>"Niedersachsen",10=>"Nordrhein-Westfalen",11=>"Rheinland-Pfalz",12=>"Saarland",13=>"Sachsen",14=>"Sachsen-Anhalt",15=>"Schleswig-Holstein",16=>"Thüringen");
	my %bl2;
	foreach my $i (keys %{$main::cache->{'stats'}->{'vornamen_geo'}->{$vorname}})
	{
		next if $i eq "_anz";
		my $teil=$main::cache->{'stats'}->{'vornamen_geo'}->{$vorname};
		my $proz=int($teil->{$i}*100/$teil->{'_anz'});
		#warn("X: $i = $BL{$i} = $teil->{$i} / $teil->{'_anz'} = $proz");
		$bl2{$BL{$i}}=$proz;
		if($proz<4)
		{
			$proz="&lt;4";
		}
		$details->{"$BL{$i}-text"}="$proz % aller $vorname leben hier";

		#my($bl,$anz,$proz)=split(/\t/,$i);
		#$bl=&umlaut_zurueck(&umlaut($bl));
		#$bl=encode_utf8($bl);
		#$proz=1 if $anz>0 && $proz<1;
		#
		#$bl{$bl}=$proz;
	}

	foreach my $bl ("Baden-Württemberg","Bayern","Berlin","Brandenburg","Bremen","Hamburg","Hessen","Mecklenburg-Vorpommern","Niedersachsen","Nordrhein-Westfalen","Rheinland-Pfalz","Saarland","Sachsen","Sachsen-Anhalt","Schleswig-Holstein","Thüringen")
	{
		if($bl2{$bl}>32)
		{
			$details->{$bl}="#663040";
		} elsif($bl2{$bl}>24)
		{
			$details->{$bl}="#995343";
		} elsif($bl2{$bl}>19)
		{
			$details->{$bl}="#aa6575";
		} elsif($bl2{$bl}>14)
		{
			$details->{$bl}="#bb7777";
		} elsif($bl2{$bl}>11)
		{
			$details->{$bl}="#cc9999";
		} elsif($bl2{$bl}>8)
		{
			$details->{$bl}="#ddaaaa";
		} elsif($bl2{$bl}>4)
		{
			$details->{$bl}="#eebbbb";
		} else
		{
			$details->{$bl}="#ffdddd";
		}
		$details->{"${bl}-text"}||="Keine $vorname gefunden";
	}


	goto ohne_news;
	# Promi-News
	require "cgibin/news.pl";
	&db_connect();
	$erg=$main::DB_NEWS->query("select id,groups,titel,link,foto from gadget where groups like '%:$vorname%' order by id desc");
	@temp=();
	my $promi={};
	$lfd=0;
	$details->{'news1'}="";
	$details->{'news2'}="";
	$details->{'news3'}="";
	while(my %news=$erg->fetchhash)
	{
		while($news{'groups'}=~/\{(person.{2,40}:$vorname.{2,30})\}/ig)
		{
			my $tt=$1;
			$tt=~/^.*:(.{3,30})$/;
			my $p=decode_utf8($1);

			next if $p=~/;/ or length($p)<$vorname+3 or $p!~/^$vorname /i;
			next if !$news{'foto'};
			$p=~s/(^| )([a-z])/$1.uc($2)/eg;
			$p=~s/ ([a-z])/ uc($1)/eg;
			++$promi->{$p}->{'_anz'};
			my $titel=$news{'titel'};
			#warn("O: $news{'titel'} / $titel") if $news{'titel'}=~/freuen sich|Garner und/;
			#$titel=~s/%(..)/chr(hex($1));/eg;

			$promi->{$p}->{'link'}||=$tt;
			$promi->{$p}->{'link'}=~s/:/\//g;
			if(++$lfd<5)
			{
				push(@temp,"<tr height='34'><td valign='top'><img src='$news{'foto'}' height='36' width='36'></td><td valign='top' class='schrift_groesser'><a href='/news/$news{'id'}.html'>$titel</a></td></tr><tr><td height='3' colspan='2'><div style='border-bottom:3px solid white;'></div></td></tr>");
			}
		}
	}
ohne_news:

	if($#temp>0)
	{
		$details->{'news1'}.="<span class='ip p_gelb'></span> <b><a href='/news/index.html'>Aktuelle Prominews</a>:</b><table cellpadding='3' width='290'><tr><td height='3' colspan='2'><div style='border-bottom:2px solid white;'></div></td></tr>".join("",@temp)."</table>";
	} else
	{
		$details->{'news1'}.="<span class='kommentar'>Wir konnten keine aktuellen Nachrichten über Promis mit dem Vornamen $vorname finden :(</span><br/><br/><span class='ip p_orange'></span> <a href='/news/index.html'>Aktuelle Promi-Nachrichten</a>";
	}

	@temp=();
	my @temp2;
	my $anz;
	$lfd=0;
	foreach my $i (sort { $promi->{$b}->{'_anz'} <=> $promi->{$a}->{'_anz'} } keys %{$promi})
	{
		$anz+=$promi->{$i}->{'_anz'};
		push(@temp2,"<a href='/news/$promi->{$i}->{'link'}' title='$promi->{$i}->{'_anz'} Nachrichten gefunden'>$i</a>");
		next if ++$lfd>5;
		my $i2=$i;
		$i2=~s/ .*? / /;
		push(@temp,"[$promi->{$i}->{'_anz'},'$i2']");
	}

	if($#temp>-1)
	{
		$details->{'news2'}.="In unserer Newsdatenbank konnten wir $anz Nachrichten über insgesamt $lfd Promis mit dem Vornamen $vorname finden";
		if($lfd>5)
		{
			$details->{'news2'}.=".<br/><br/><b>Top-5: Promis namens $vorname</b><br/>";
		} else
		{
			$details->{'news2'}.=":<br/>";
		}
		$details->{'news3'}="Klicke auf einen der Promi-Namen, um dir alle News des Stars anzeigen zu lassen:<br/><br/>";
		$details->{'news3'}.=join("&nbsp;|&nbsp;",@temp2);
		my $x=join(",",@temp);
		if($main::TEMP{'SEITENNR'}==5 or $main::aus{'subseite'}==5)
		{
			$main::JS_AFTER_START.=<<EOF;
plot1 = jQuery.jqplot ('chart_newspers', [[$x]],
{
	seriesDefaults: {
      renderer:\$.jqplot.BarRenderer,
		pointLabels: { show: true, location: 'e', edgeTolerance: -10 },
		shadowAngle: 135,
		rendererOptions: {
			 barDirection: 'horizontal'
		}
   },
	grid:{borderColor:'#ffffff',borderWidth:'0',background:'#FFffff',gridLineColor:'#ffe0f0',shadow:false},
	seriesColors: [ "#D33163"],//,"#e0fff0","#ffe0c0","#bacfff","#f0b0f0","#ffffe0","#ffb5ca"],
	height:200,
	axesDefaults: {
        tickRenderer: \$.jqplot.CanvasAxisTickRenderer ,
		  tickOptions: {
				 fontSize: '9pt'
		  }
	 },
	axes:
	{
		yaxis:
		{
			renderer: \$.jqplot.CategoryAxisRenderer, rendererOptions:
			{
						fontSize:12
			}
      }
	}
}
);
EOF
		}
		$details->{'news2'}.="<div id='chart_newspers'></div><br/>$details->{'news3'}";
	}


	# Kyrillische Schreibweise
#	if(exists($details->{'kyrillisch'}))
#	{
#		$details->{'kyrillisch'}=$details->{'kyrillisch'};
#	} else
#	{
#		my $kr=$main::LINGUA->translit_reverse($vorname);
#		$kr=~s/x/&#1082;&#1089;/g;
#		$details->{'kyrillisch'}=$kr;
#	}


	# Geschlechts-Link
	if($details->{'geschlecht'} eq "m")
	{
		$details->{'geschlecht_lang'}="jungs";
	} else
	{
		$details->{'geschlecht_lang'}="maedchen";
	}



# Deutschland-Karte
	$details->{'deutschlandkarte_legende'}="Die Deutschland-Karte mit der regionalen Verteilung des Vornamen $details->{'vorname'} wird gerade überarbeitet!";
	goto ohne_rap;
	my $k=&makeRaph($details);
	#warn("O: $k");
	if(!$k)
	{
		$details->{'deutschlandkarte_legende'}="Es sind leider noch nicht genügend Daten für die Länderkarte vorhanden :(";
	} else
	{
		$details->{'deutschlandkarte_legende'}=<<EOF;
		<div class='row'>
			<div class='col-xs-3 font-sm'>
				<div class='kaestchen' style='background-color:#663040;width:16px;height:12px;float:left;'></div>
				&nbsp;&gt;32%
				<br/><br/>
				<div style='background-color:#995343;width:16px;height:12px;float:left;'></div>
				&nbsp;&gt;24%
				<br/><br/>
				<div style='background-color:#aa6575;width:16px;height:12px;float:left;'></div>
				&nbsp;&gt;19%
				<br/><br/>
				<div style='background-color:#bb7777;width:16px;height:12px;float:left;'></div>
				&nbsp;&gt;14%
				<br/><br/>
				<div style='background-color:#cc9999;width:16px;height:12px;float:left;'></div>
				&nbsp;&gt;11%
	         	<br/><br/>
				<div style='background-color:#ddaaaa;width:16px;height:12px;float:left;'></div>
				&nbsp;&gt;8%
				<br/><br/>
				<div style='background-color:#eebbbb;width:16px;height:12px;float:left;'></div>
				&nbsp;&gt;4%
				<br/><br/>
				<div style='background-color:#ffdddd;width:16px;height:12px;float:left;'></div>
				&nbsp;&lt;4%
				<br/><br/>
			</div>
			<div class='col-xs-9'>
				<div id="paper"></div>
			</div>
		</div>

			<div id='karte_desc'>Bitte w&auml;hle ein Bundesland</div>
			<div id='karte_desc2'></div>

EOF
		$details->{'js_code_seite4'}=$k;
	}
ohne_rap:
	#&main::logge_int("H: ".$details->{'keine_statistik_entwicklung'});
# Chart für Geburtsstatistik
	if($details->{'keine_statistik_entwicklung'}<1)
	{
		$details->{'beliebtheit_eltern'}=<<EOF;
<div id='cont_graph' class='gelb'>
	<ul class="nav nav-tabs">
		<li role="presentation" class="active"><a data-toggle="tab" href="#s21">24-Monate</a></li>
		<li role="presentation"><a data-toggle="tab" href="#s22">Jahres-Trend</a></li>
	</ul>
	<div class='tab-content'>
		<div id='s21' role='tabpanel' class='tab-pane active  padding-10'>
			<div id='chart1'></div>
			$details->{'line_be_m_direkt'}
			<i class='fa fa-arrow-circle-right text-gelb'></i> <a href='/wissen/nachwuchs/geburt/statistik/index.html'>Zeige aktuelle Geburtsstatistik</a></span>
		</div>
		<div id='s22' role='tabpanel' class='tab-pane padding-20'>
			<div id='chart2' style='width:100%'></div>
			$details->{'line_be_j_direkt'}
			<i class='fa fa-arrow-circle-right text-gelb'></i> <a href='/wissen/nachwuchs/geburt/statistik/index.html'>Zeige aktuelle Geburtsstatistik</a></span>
		</div>
	</div>
</div>
EOF
	} else
	{
	}

	#delete($main::cache->{'stats'}->{'vornamen_geo'}) if $main::CACHE_AKTIV<1;

	if(scalar(keys %{$details})<2)
	{
		warn("Unbekannter Vorname: $vorname ($geschlecht)");
		open(D,">>$main::master->{'_path_data'}/vornamen_fehler.txt");
		print D "$vorname	$geschlecht	$ENV{'REMOTE_ADDR'}\n";
		close(D);
		#$main::MESSAGE=&get404Text();
		return;
	}
	$details->{'vorname'}=$vorname;
	$main::cache->{'vornamendetails'}->{$geschlecht}->{$vorname}=$details;
	return($details);
}

sub getTree
{
	my ($subtree,$ebene)=@_;

	$subtree->{'_html'}="<ul";
	my $class="";
	$class=" class='_pr'" if $ebene>1;
	$subtree->{'_html'}.=">";
	$subtree->{'_anz'}=0;
	#srand(time);
	foreach my $i (sort keys %$subtree)
	{
		next if $i eq "_liste" or $i eq "_html" or $i eq "_anz";
		my $titel=$i;
		my $id=int(rand(100000));
		$subtree->{'_html'}.="<li data-anz='_#ANZ$id#_' data-rubrik='$i'$class><span class='btn btn-default pc'><i class='fa fa-plus-circle'></i> $i: _#ANZ$id#_ Person_#ANZ_WORT$id#_</span>";
		my $t=&getTree($subtree->{$i},$ebene+1);
		if($t->{'_anz'}>0)
		{
			$subtree->{'_anz'}+=$t->{'_anz'};
			#$subtree->{'_html'}.=" ($t->{'_anz'})";
			$subtree->{'_html'}.=$t->{'_html'};
		}
		$subtree->{'_html'}=~s/_#ANZ$id#_/$t->{'_anz'}/g;
		my $anhang="";
		if($t->{'_anz'}>1)
		{
			$anhang="en";
		}
		$subtree->{'_html'}=~s/_#ANZ_WORT$id#_/$anhang/g;

		$subtree->{'_html'}.="</li>";
	}

	if(exists($subtree->{'_liste'}))
	{
		my $panel_zeile='_#name#_';
		#$subtree->{'_html'}.="<ul>";
		foreach my $p (sort { $a->{'nn'} cmp $b->{'nn'} } @{$subtree->{'_liste'}})
		{
			my $x=$panel_zeile;
			my $name="<b>$p->{'vn'}</b> $p->{'nn'}";
			if($p->{'rubrik'} eq "Fussball")
			{
				if($p->{'art'} eq "st")
				{
					my @worte=&main::mischeListe(
						"Trainer &amp; Spieler",
						"auch als Trainer",
						"auch Trainer",
						"Trainer u. Spieler",
						"Trainer+Spieler"
					);
					$name.=" (".shift(@worte).")";
				} elsif($p->{'art'} eq "t")						{
					my @worte=&main::mischeListe(
						"nur Trainer",
						"nur als Trainer",
						"als Trainer",
						"Trainer",
					);
					$name.=" (".shift(@worte).")";
				}
			}
			#&main::logge_int("L: $p->{'land'}");

			#if(length($p->{'land'})==2)
			#{
				#$name="<i class='flag flag-".lc($p->{'land'})."'></i> $name";
			#}
			if($p->{'geb'}=~/^(.*?)-(.*?)$/)
			{
				my($geb,$tot)=($1,$2);
				my @worte=&main::mischeListe(
					" ($geb-$tot)",
					" ($geb bis $tot)",
					" (*$geb, ✝$tot)"
				);
				#$name.="<div class='font-sm text-muted' style='display:inline;'>".shift(@worte)."</span>";
				$name.=shift(@worte);
			} elsif(length($p->{'geb'})>3)
			{
				my @worte=&main::mischeListe(
					" *$p->{'geb'}",
					" (*$p->{'geb'})",
					" (geb. $p->{'geb'})"
				);
				#$name.="<div class='font-sm text-muted' style='display:inline;'>".shift(@worte)."</span>";
				$name.=shift(@worte);
			}

			$x=~s/_#name#_/$name/;
			$subtree->{'_html'}.="<li class='_pp' dl='$p->{'land'}'>$x</li>\n";
			$subtree->{'_anz'}++;
		}
		#$subtree->{'_html'}.="</ul>";
	}
	$subtree->{'_html'}.="</ul>";
	return($subtree);
}

sub getPromiPersonenliste
{
	my ($rubrik,$liste)=@_;
	my $antwort={ '_anz' => 0 };

	my $panel_zeile='_#name#_';
	foreach my $p (@{$liste})
	{
		my $x=$panel_zeile;
		my $name="<b>$p->{'vn'}</b> $p->{'nn'}";
		if($p->{'rubrik'} eq "Fussball")
		{
			if($p->{'art'} eq "st")
			{
				my @worte=&main::mischeListe(
					"Trainer &amp; Spieler",
					"auch als Trainer",
					"auch Trainer",
					"Trainer u. Spieler",
					"Trainer+Spieler"
				);
				$name.=" (".shift(@worte).")";
			} elsif($p->{'art'} eq "t")						{
				my @worte=&main::mischeListe(
					"nur Trainer",
					"nur als Trainer",
					"als Trainer",
					"Trainer",
				);
				$name.=" (".shift(@worte).")";
			}
		}
		if(length($p->{'land'})==2)
		{
			$name="<i class='flag flag-".lc($p->{'land'})."'></i> $name";
		}
		if($p->{'geb'}=~/^(.*?)-(.*?)$/)
		{
			my($geb,$tot)=($1,$2);
			my @worte=&main::mischeListe(
				" ($geb-$tot)",
				" ($geb bis $tot)",
				" (*$geb, ✝$tot)"
			);
			$name.="<div class='font-sm text-muted' style='display:inline;'>".shift(@worte)."</span>";
		} elsif(length($p->{'geb'})>3)
		{
			my @worte=&main::mischeListe(
				" *$p->{'geb'}",
				" (*$p->{'geb'})",
				" (geb. $p->{'geb'})"
			);
			$name.="<div class='font-sm text-muted' style='display:inline;'>".shift(@worte)."</span>";
		}

		$x=~s/_#name#_/$name/;
		$antwort->{'_html'}.=$x;
		$antwort->{'_anz'}++;

	}
	return($antwort);
}

# Parst einen übergebenen String nach Ländern und wandelt Länder/Sprachen
# in entsprechende Icons um
sub getLaenderIcons
{
	my $laender=shift;
	my $max=shift;
	$laender=~s/, ?/;/g;
	$laender=~s!albanisch!<img src='/g/flaggen/albanien.png' alt='Vornamen aus Albanien' title='Vornamen aus Albanien'/>!i;
	$laender=~s!australisch!<img src='/g/flaggen/australien.png' alt='Vornamen aus Australien' title='Vornamen aus Australien'/>!i;
	$laender=~s!belgisch!<img src='/g/flaggen/be.png' alt='Vornamen Belgien' title='Vornamen aus Belgien'/>!i;
	$laender=~s!(anglo)?amerikanisch!<img src='/g/flaggen/us.png' alt='Vornamen aus Amerika' title='Vornamen aus Amerika'/>!i;
	$laender=~s!chinesisch!<img src='/g/flaggen/china.png' alt='Vornamen aus China' title='Chinesische Vornamen'/>!i;
	$laender=~s!koreanisch!<img src='/g/flaggen/korea.png' alt='Vornamen aus Korea' title='Koreanische Vornamen'/>!i;
	$laender=~s!ukrainisch!<img src='/g/flaggen/ukrainisch.png' alt='Vornamen aus Ukranie' title='Ukrainische Vornamen'/>!i;
	$laender=~s!bosnisch!<img src='/g/flaggen/bosnisch.png' alt='Vornamen aus Bosnien' title='Bosnische Vornamen'/>!i;
	$laender=~s!indisch!<img src='/g/flaggen/indien.png' alt='Vornamen aus Indien' title='Vornamen aus Indien'/>!i;
	$laender=~s!iranisch!<img src='/g/flaggen/iran.png' alt='Vornamen aus Iran' title='Vornamen aus dem Iran'/>!i;
	$laender=~s!irisch!<img src='/g/flaggen/irland.png' alt='Vornamen aus Irland' title='Irische Vornamen'/>!i;
	$laender=~s!kanadisch!<img src='/g/flaggen/ca.png' alt='Vornamen aus Kanada' title='Kanadische Vornamen'/>!i;
	$laender=~s!mazedonisch!<img src='/g/flaggen/mazedonien.png' alt='Vornamen Mazedonien' title='Vornamen aus Mazedonien'/>!i;
	$laender=~s!serbisch!<img src='/g/flaggen/serbien.png' alt='Vornamen aus Serbien' title='Serbische Vornamen'/>!i;
	$laender=~s!spanisch!<img src='/g/flaggen/spanien.png' alt='Vornamen Spanien' title='Vornamen aus Spanien'/>!i;
	$laender=~s!t.{1,6}rkisch!<img src='/g/flaggen/tuerkei.png' alt='Vornamen Türkei' title='Vornamen aus der Türkei'/>!i;
	$laender=~s!tu(,|$)!<img src='/g/flaggen/tuerkei.png' alt='Vornamen Türkei' title='Vornamen aus der Türkei'/>!i;
	#$laender=~s!ägyptisch!<img src='/g/flaggen/aegypten.png' alt='Vornamen Ägypten' title='Vornamen aus Ägypten'/>!i;
	$laender=~s!(;|^)griechisch!$1<img src='/g/flaggen/griechenland.png' alt='Vornamen Griechenland' title='Vornamen aus Griechenland'/>!i;
	$laender=~s!(;|^)deutsch!$1<img src='/g/flaggen/de.png' alt='Vornamen Deutschland' title='Vornamen aus Deutschland'/>!i;
	$laender=~s!afghanisch!<img src='/g/flaggen/afghanistan.png' alt='Vornamen Afghanistan' title='Vornamen aus Afghanistan'/>!i;
	$laender=~s!d.{1,6}nisch!<img src='/g/flaggen/daenemark.png' alt='Vornamen Dänemark' title='Vornamen aus Dänemark'/>!i;
	$laender=~s!(;|^)franz.{1,6}sisch!$1<img src='/g/flaggen/frankreich.png' alt='Vornamen Frankreich' title='Vornamen aus Frankreich'/>!i;
	$laender=~s!russisch!<img src='/g/flaggen/russland.png' alt='Vornamen Russland' title='Vornamen aus Russland'/>!i;
	$laender=~s!italienisch!<img src='/g/flaggen/italien.png' alt='Vornamen Italien' title='Vornamen aus Italien'/>!i;
	$laender=~s!.{1,6}sterreichisch!<img src='/g/flaggen/at.png' alt='Vornamen Österreich' title='Vornamen aus Österreich'/>!i;
	$laender=~s!niederl.{1,6}ndisch!<img src='/g/flaggen/niederlande.png' alt='Vornamen Holland' title='Vornamen aus Holland'/>!i;
	$laender=~s!isl.{1,6}ndisch!<img src='/g/flaggen/island.png' alt='Vornamen Island' title='Vornamen aus Island'/>!i;
	$laender=~s!kroatisch!<img src='/g/flaggen/kroatien.png' alt='Vornamen Island' title='Vornamen aus Kroatien'/>!i;
	$laender=~s!(^|;)englisch!$1<img src='/g/flaggen/england.png' alt='Vornamen England' title='Vornamen aus England'/>!i;
	$laender=~s!finnisch!<img src='/g/flaggen/finnland.png' alt='Vornamen Finnland' title='Vornamen aus Finnland'/>!i;
	$laender=~s!hebr.{1,6}isch!<img src='/g/flaggen/israel.png' alt='Vornamen aus Israel' title='Israelische Vornamen'/>!i;
	$laender=~s!norwegisch!<img src='/g/flaggen/norwegen.png' alt='Vornamen Norwegen' title='Vornamen aus Norwegen'/>!i;
	$laender=~s!schwedisch!<img src='/g/flaggen/schweden.png' alt='Vornamen Schweden' title='Vornamen aus Schweden'/>!i;
	$laender=~s!schweizerisch!<img src='/g/flaggen/schweiz.png' alt='Vornamen Schweiz' title='Vornamen aus der Schweiz'/>!i;
	$laender=~s!ungarisch!<img src='/g/flaggen/ungarn.png' alt='Vornamen Ungarn' title='Vornamen aus Ungarn'/>!i;
	$laender=~s!polnisch!<img src='/g/flaggen/polen.png' alt='Vornamen Polen' title='Vornamen aus Polen'/>!i;
	$laender=~s!portugiesisch!<img src='/g/flaggen/portugal.png' alt='Vornamen aus Portugal' title='Portugiesische Vornamen'/>!i;
	$laender=~s!tschechisch!<img src='/g/flaggen/tschechei.png' alt='Vornamen Tschechien' title='Vornamen aus Tschechien'/>!i;
	$laender=~s!japanisch!<img src='/g/flaggen/japan.png' alt='Vornamen Japan' title='Vornamen aus Japan'/>!i;
	$laender=~s!schottisch!<img src='/g/flaggen/schottland.png' alt='Vornamen Schottland' title='Vornamen aus Schottland'/>!i;
	$laender=~s!slowenisch!<img src='/g/flaggen/slowenisch.png' alt='Vornamen Slowenien' title='Vornamen aus Slowenien'/>!i;
	$laender=~s!rum.{1,6}nisch!<img src='/g/flaggen/rumaenien.png' alt='Vornamen Rumänien' title='Vornamen aus Rumänien'/>!i;
	$laender=~s!bulgarisch!<img src='/g/flaggen/bulgarien.png' alt='Vornamen Bulgarisch' title='Vornamen aus Bulgarisch'/>!i;
	$laender=~s!^iz$!<img src='/g/flaggen/israel.png' alt='Vornamen aus Israel' title='Israelische Vornamen'/>!i;
	my @temp;
	foreach my $i (split(/;/,$laender))
	{
		#next if $max>0 and $i!~/<img/;
		push(@temp,$i);
	}
	$laender=join(" ",sort(@temp));
	#warn("X: @temp");
	$laender=~s/ +/ /g;
	$laender=~s/^ +//;
	return($laender);
}

sub getEmpfindung
{
	my $name=shift;
	my $antwort={};
	my $schondae;

	if(-e "$main::master->{'_path_data'}/vornamen/empf/$name")
	{
		my ($z,$za,$s,$sa,$e,$se);
		my $anz=0;
		my $schondae;
		foreach my $i (read_file("$main::master->{'_path_data'}/vornamen/empf/$name"))
		{
			next if length($i)<3;
			my($nick,$g,$user,$w)=split(/\t/,$i);
			#next if $g ne $main::aus{'g'};
			++$anz;
			++$antwort->{'abst_anz'};
			$schondae=1 if $user eq $main::USER;

			my($zeit,$schoen,$exot)=split(/,/,$w);
			$zeit=50 if $zeit<0;
			$schoen=50 if $schoen<0;
			$exot=50 if $exot<0 or $exot=~/object/i;

			$z+=$zeit;
			++$za;
			$s+=$schoen;
			++$sa;
			$e+=$exot;
			++$se;
		}
		if($schondae>0)
		{
			$antwort->{'empfx'}="Danke für deine Stimme!";
			$main::aus{'_tab'}=1;
		} else
		{
			$antwort->{'empfx'}="<a onclick='save_empf();' class='button-gelb'>Empfindung speichern</a><br/><br/>";
		}
		my ($zss,$sss,$ess);
		eval{
			$zss=int($z/$za);
			$sss=int($s/$sa);
			$ess=int($e/$se);
		};
		my ($zf,$sf,$ef);
		my @sl_zeit=("Furchtbar altbacken","Sehr altmodisch","Altmodisch","Eher altmodisch","Etwas altmodisch","Alt, aber zeitlos","Etwas moderner","Eher modern","Modern","Sch&ouml;n modern","Hyper-modern");
		my @sl_sch=("Furchtbar und h&auml;sslich","Geht gar nicht","H&auml;sslich","Nicht schön","Eher unschön","Geht so","Recht hübsch","Gut!","Schön","Sehr schön","Wundervoll");
		my @sl_mod=("Sehr langweilig","Ziemlich langweilig","Langweilig","Eher langweilig","Etwas langweilig","Normal","Etwas seltsam","Eher aussergew&ouml;hnlich","Etwas exotisch","Exotisch","Sehr exotisch");
		my $zb=$sl_zeit[int($zss/10)];
		my $sb=$sl_sch[int($sss/10)];
		my $eb=$sl_mod[int($ess/10)];

		my $sb2=$sb;
		$sb2=~s/Geht so/mittelprächtig/;

		if($anz>1)
		{
			my $insg;
			if($anz>8)
			{
				$insg="Insgesamt $anz User";
			} elsif($anz>5)
			{
				$insg="Über den Namen $name haben bisher $anz User abgestimmt und sie ";
			} else
			{
				$insg="Es haben $anz User abgestimmt und";
			}
			$antwort->{'txj'}="$insg finden diesen Vornamen \l$zb, \l$sb2 und \l$eb.";
			$antwort->{'wert_zeit'}=$zb;
			$antwort->{'wert_schoen'}=$sb2;
			$antwort->{'wert_exotik'}=$eb;
		}
		my ($zl,$zw,$el,$sl);

		$zl=($zss*100)/95;#$zss*2.6;
		$sl=($sss*100)/95;#$sss*2.6;
		$el=($ess*100)/95;

		#$string.="<center><b>Modern oder nicht</b></center><div style='position:relative;left:${left}px; width:${zss}px;height:10px;background-color:#$zf;'></div><center>= $zb";
		$antwort->{'abst'}.=<<EOF;
<br/>
<table style='width:100%'>
<tr>
	<td align='left'>Altmodisch</td>
	<td align='center'>Zeitlos</td>
	<td align='right'>Sehr modern</td>
</tr>
</table>

<img src='/g/balken_blau.jpg' style='width:100%;height:20px;float:left;'/>
<img src='/g/cursor01a.png' style='width:14px;position:relative;top:-21px;left:${zl}%;'/>
<b>$name = $zb</b>

<br/><br/><br/>

<table style='width:100%'>
<tr>
<td align='left'>Furchtbar</td>
<td align='center'>Geht so</td>
<td align='right'>Sehr schön</td>
</tr>
</table>

<img src='/g/balken_tiefgelb.jpg' style='width:100%;height:20px;float:left;'/>
<img src='/g/cursor01a.png' style='width:14px;position:relative;top:-22px;left:${sl}%;'>
<b>$name = $sb</b>

<br/><br/><br/>

<table style='width:100%'>
<tr>
<td align='left' style='width:33%'>Langweilig</td>
<td align='center' style='width:34%'>Durchschnittlich</td>
<td align='right' style='width:33%'>Exotisch</td>
</tr>
</table>

	<img src='/g/balken_gruen.jpg' style='width:100%;height:20px;float:left;'/>
	<img src='/g/cursor01a.png' style='width:14px;position:relative;top:-21px;left:${el}%;'>
	<b>$name = $eb ($el)</b>
<br/>
EOF
	} else
	{
		$antwort->{'abst'}="Es wurden noch keine Empfindungen zu $name eingetragen";
		$antwort->{'empfx'}="<a onclick='save_empf();' class='button-gelb'>Empfindung speichern</a><br/><br/>";
	}
	$antwort->{'abst_anz'}="0" if length($antwort->{'abst_anz'})<1;
	return($antwort);
}

sub makeRaph
{
	my $V=shift;
#window.onload = function () {
	#&main::logge_int("X: $V->{'Baden-Württemberg-text'} / $V->{'Bayern-text'}");
	return("") if $V->{'Baden-Württemberg-text'}=~/Keine/ and $V->{'Bayern-text'}=~/Keine/;
	return <<EOF;
	var R=new Object();
	R = Raphael("paper", '100%', 300);
	var attr = { "stroke": "#000000", "stroke-width": 1 };
	var aus = {
		bw: { name:"Baden-Württemberg", text: "$V->{'Baden-Württemberg-text'}", cords: "M166.769,365.643v1.538l-0.14,0.979l-0.419,1.958 l0.279,1.398l0.42,1.677l-0.699,0.699l-0.14,1.12h1.259l1.119,0.419l0.56,1.119l-0.979,0.979l0.14,1.398l0.42,1.26l-0.14,1.258 l-0.699,0.559l-0.28,1.397l0.14,1.398l-0.14,1.12l-1.398,1.118l-0.839,1.12l-0.42,1.258l-0.14,0.56l-0.419,1.258l-0.979,0.7 l-0.14,1.119l0.42,0.698l-0.56,1.399l-0.28,1.538l-0.839,2.099l-0.839,1.678l-1.258,1.119l-0.979,1.258l-0.699,0.979l-0.839,1.117 l-1.119,1.261c0.082,0.159,0.033,0.385-0.086,0.557l-0.125,1.044l-0.14,0.98l-0.699,0.841l-0.7,1.26l-0.559,0.98l-0.419,1.539 l-0.7,1.121l-0.559,0.979l-0.7,0.839l-1.12,1.12l-1.679,0.699l-1.325,0.487l-0.773,0.774l-1.12,1.399l-1.254,0.901l-0.65,1.765 l-1.034,0.835l-0.995,0.495l-0.699,0.842l-1.383,1.604l-1.625,1.195l-1.025,1.026l-0.233,1.562l-0.676,1.305l-0.699,1.749 l-0.489,1.468l-0.165,1.85l-0.264,1.604l-0.839,1.541l-0.699,1.538v1.261l0.14,1.54l-0.226,1.404l-0.42,1.753l-0.054,1.324 l-0.419,1.538l-0.933,0.888l-0.762,1.358l-0.497,1.161l-0.56,0.98l-0.046,1.074l-0.758,0.791l-1.188,1.048l-0.629,1.959 l-0.867,0.407l-0.754,0.975l-0.14,1.68l-0.14,1.399l0.14,1.121l0.419,1.54l0.42,1.54l0.14,1.96l-0.436,1.335l-0.559,1.471 l-0.28,1.329l-0.964,1.884l-0.966,1.19l-0.099,0.847l-0.215,1.146l-0.694,1.305l-0.11,1.912l-0.799,0.887l-0.564,1.072l0.145,2.078 l-0.35,1.611l-0.56,0.769v1.471l0.21,1.75l1.018,2.024l0.871,1.335l1.218,2.141l-0.542-0.279l2.569,0.071l2.028-1.469l2.098,0.069 l-0.77,1.049l0.56,0.7l-0.769,0.838l-1.539,1.259l1.678,0.559l1.958-0.349l1.398-0.769l2.447-0.7l0.839-0.979l1.818,0.279 l1.049,0.35l0.979,1.12l0.839,0.769l1.678-0.139l1.328-0.42h0.979l3.217-0.069l0.769-0.35l0.839-0.42l1.468-1.258l0.839-0.84h2.238 h1.608l1.608,1.328l0.56,0.84l1.468,1.188l0.979-0.141l0.49-1.118l1.398-0.07l1.049-0.209l1.468,0.629l1.888-0.209l-0.56-0.91 l-0.35-1.05l1.958-0.838l0.489-1.188l1.469,0.07l0.979,1.118l0.839,0.489l0.35-1.119l0.21-0.699l0.839,0.631l0.629-0.07v-1.19 l-0.839-1.397l-2.587-0.07l-0.769,1.468h-1.469l-1.329,0.421l-1.188-1.19l-1.329-0.209l-0.629-0.979l0.28-0.628l-0.419-0.561 l0.839-1.539l1.678-1.537l1.329-0.979l1.958-0.98l1.748,0.14l0.909,0.56l0.419-0.699l-0.629-0.979l2.797,0.279l-0.07,1.68 l0.979,0.768l0.56-0.63l-0.629-0.837l0.559-0.84l1.259,0.628l0.769,1.749l1.259,0.07l0.769,1.397l-1.398,0.629l1.398,0.911 l-0.419,1.537l1.259,0.56l0.629,0.979l1.188-0.491l-0.14-0.978l-1.119-0.629l-0.35-1.119l1.189-0.07l0.419-0.63l0.49-0.07 l1.049,1.681l2.098,0.628l-0.49,0.839l-0.909,0.069l1.639,2.511c1.958-0.35,3.022-0.786,4.936-1.826 c-0.151-0.285,0.134-0.789,0-1.074c0,0-2.022-1.275-2.148-1.342c0,0-0.042-1.008,0.269-0.54c0,0,1.527,0.059,2.148,0.271 c-0.109-0.158-1.049-1.25-0.537-1.075c0.437,0.153,0.478,0.632,0.805,0.805c0.135,0.069,0.655-0.041,0.806,0 c0.889,0.212,2.626,1.487,3.222,2.15c0.436,0.489,0.776,1.118,1.135,1.706l0.4,0.443l2.272,0.795 c0.042-0.016-0.047-0.484-0.047-0.528c0.327-0.175,0.722,0.161,1.074,0.271c-0.101-0.621,0.193-1.301,0-1.881 c-0.109-0.318-1.158-0.789-1.343-1.074c-0.167-0.252,0.101-0.798,0-1.074h-0.537v-0.537c-0.177-0.504-1.116-0.797-1.611-1.075 v-0.537c-0.579-0.496-1.334-0.579-1.88-1.074c-0.235-0.21-0.083-0.511-0.268-0.805c-0.185-0.302-1.326-1.126-1.611-1.343 c0.058-0.346-0.244-0.874,0.268-0.807c0.571,0.065,0.244,0.102,0.537,0.27c0.713,0.401,1.2,1.176,1.88,1.611 c0.671,0.427,1.25,0.328,1.879,0.805c0.227,0.168,0.302,0.655,0.537,0.806c0.957,0.596,2.602,0.706,3.223,1.612 c0.285,0.428-0.009,0.998,0.268,1.611c0,0,2.845,2.611,2.954,2.688c0.444,0.284,0.822-0.011,1.343,0.268 c0.209,0.108,0.327,0.67,0.537,0.805c0.696,0.429,2.014,0.295,2.685,0.27c0.409-0.283,1.015-0.588,1.879-0.27 c0.453,0.16,1.225,1.537,1.611,1.612c0.276,0.052,1.2-0.452,1.611-0.537c0.185,0.554,0.789,2.795,1.074,3.224 c0.126,0.191,0.915,0.284,1.074,0.534c0.167,0.271-0.034,0.69,0.268,0.808c0.588,0.229,1.534-0.201,2.121,0.059l0.839-1.329 l1.049-0.839l1.748,0.279l0.979-0.838l1.888,0.559l1.538-0.77l2.028-2.027l0.419-1.049l1.398-0.908l1.818,1.397l1.818,0.979 l1.818-0.419l0.279-1.258l1.818,0.418l1.678,1.538l0.839-1.397l1.259-0.279l0.839-1.678l-0.419-2.658l-0.56-2.238l-1.958-1.258 l0.14-1.398l1.958,0.699l0.559-0.841l-0.699-2.515l0.56-1.26l0.56-1.258l0.07-1.189l0.07-1.329l-0.909-0.769l-0.35-0.908 l0.42-1.119h1.119l1.188-1.678l0.14-1.049l-0.14-1.681l-0.629-1.118l0.209-1.467l-0.28-1.54l-0.699-1.188l-0.07-1.538l-0.769-1.188 v-1.049l0.07-1.12l0.21-1.327l-0.35-1.049l-0.21-1.819l-0.28-1.606l-0.07-2.239l-0.909-1.327l-0.979-0.911l-0.629-0.979l0.14-2.306 l1.259-0.562l0.35-0.978l-0.419-1.607l0.629-0.77l1.398-0.142l1.749-0.769l0.35,0.698l1.188-0.209h1.818l0.35-0.979l1.678-1.118 l0.14-1.189l2.238-0.28l1.468-0.35l0.28-1.606l-0.21-1.96l-0.979-1.606l0.909-0.42l-0.699-1.54l-1.818-2.026l0.77-2.937l0.839-0.07 l0.839,0.979l1.188,0.07l0.28,2.099l0.909,0.419l0.699-0.909l0.629-1.818l1.049-0.559l0.489,0.559l-0.699,1.959l1.398,0.559 l1.61-1.537l0.351-1.959L259,426.897l-0.14-1.608l-0.979-0.56l-0.07-0.979l1.119-1.05l-0.14-1.817l0.21-1.679l-0.979-1.328 l1.468-1.259l-0.279-1.538l-0.77-1.188l0.699-1.049l-0.769-1.608l-1.049-2.728l-1.049-0.489v-0.839l-1.398-1.119l-1.818-1.818 l-1.399,0.141l-1.678-2.239l0.839-0.979l-1.259-0.979l1.539-1.397l-0.699-1.399l-1.119-1.259l-1.119,0.141l-1.538-1.398l-1.399-0.7 l0.42-1.956l-0.42-1.261v-1.258l0.42-0.979l0.699-2.237l-1.259-0.28l-1.398-0.419l0.28-1.538l1.119-0.279l0.14-0.562l-1.258-1.117 l0.419-0.979l1.539,0.28l0.559-0.839l-0.559-2.238l-1.678-0.838l1.678-1.12l-0.839-2.796l-0.979-2.099l-0.979-0.698l-1.678,1.397 l-0.839,1.958l-0.839,1.118l-1.678-0.279l-1.258-0.978l-0.839-1.119l0.56-1.399l0.14-1.959l-0.979-0.838l0.699-1.118l0.14-0.84 l-0.979-0.139l-0.699,0.698l-1.119,0.14l-0.14,1.397l-1.258,0.282l-0.839-0.562l0.28-0.839l0.28-1.258l1.258-0.279l0.14-1.539 l-0.28-0.979l-1.259-0.979l-0.979-0.699l0.56-1.818l-0.14-1.54l-0.56-1.537l-0.979,0.279l-0.56,1.258l-1.258-0.559l-0.28-1.118 l-0.839,0.279l-0.839,0.419l-0.839,1.54l-1.259-0.42v-1.679l0.559-0.698l-0.419-1.96l0.14-1.258l-1.818,0.14l-1.119,0.42 l-0.56,1.677l-0.699,0.7l-0.699-1.117l-1.259,0.138l-0.839-1.397h-1.119l-0.979,0.839l-0.979-0.699H212.5l-1.398,0.838 l-1.539,0.282l-0.419,1.398l0.56,0.838l1.398,0.419l0.14,1.819l0.839-1.12l1.119,0.421v1.678l-0.979,1.539l0.14,0.979l-1.399,0.279 l-0.839-0.979l-0.979,0.7l-1.119-0.7l-0.839,1.12l-1.119,0.279l0.56,1.538l-0.699,1.117l-0.699,1.54l-1.958-0.141l-2.098-0.139 l-1.381-0.42l-0.717,1.259l-0.979-0.7l-0.839,0.839l0.979,1.261l0.56,1.537l-0.839,0.14l-0.839-0.978l-0.839,0.418l-0.559,0.979 l-1.399,0.279l-1.398-0.839l-1.119,0.699l-0.839,1.119l-0.279,1.119l0.559,0.978l-1.678,0.56l-1.258,0.698l-0.28,1.12l-0.979,0.42 l-0.839-0.699l-0.979,0.699l-1.119,0.419l-0.28-1.397l1.399-0.7l0.14-1.678l0.56-1.538h1.119l0.28,0.84l0.839-0.562l0.14-1.537 l-0.699-0.42h-1.399l-1.258-0.698l-0.419-0.84l-1.119,0.279l-1.538-0.418l-1.259-0.282l-0.979-1.117l-0.56-0.979l0.14-1.399 l0.699-1.537l-0.979-0.28l-1.678,0.42l-1.259,0.279l-0.839,0.28l0.419,1.259l0.56,0.979l0.419,1.118l-0.839,0.841l-2.098,0.559 l-1.258-0.421l-0.699-1.117l-0.42-1.259l-1.258-0.699l-0.699-0.841l-1.539-0.139H166.769z", farbe:'$V->{'Baden-Württemberg'}' }, by: { name:"Bayern", text: "$V->{'Bayern-text'}", cords: "M241.591,306.102l-0.701,1.504l-0.979,1.537 l-0.979,1.399l-1.119,1.259l-1.958,0.979l-1.958,0.979l-0.56-0.841l-0.839,0.421l-1.678-0.838v-1.119l-0.839,0.139l-1.119-0.419 l-0.979,1.958l-0.559,1.958l0.559,1.259l0.14,1.817l-1.119,1.12l-1.818,0.837l-1.398,0.841l0.28,1.258v1.539l-2.518,0.279 l-1.119-0.559l-1.398-0.142l-0.699-0.558l-0.419,0.837v1.54l-0.979,0.279v1.397l0.839,1.399l-0.699,1.397l0.839,0.841l-0.28,1.817 l-2.377,0.559l-2.098,0.141l-1.259-0.699l-0.979-2.378l-0.839-0.28l-2.377,0.141l-0.699-0.979l-1.958-0.419l-2.238,1.118 l-0.979,1.399l-1.258,0.139l-0.42-1.399l-1.119-0.419l-1.398,0.699l-1.678,0.698l-1.539,1.399l-0.979,1.4v1.816l0.699,1.817 l1.119,1.261l-0.839,1.117l0.56,1.118l-0.419,1.12l0.839,1.119l0.14,2.377v1.817l0.559,2.099l1.678,0.141l-0.14,1.257l-0.28,1.261 l1.259-0.421l0.839,0.7l-1.258,1.537l1.119,0.42l0.559,1.118l-0.559,1.399l-0.419,0.979l-1.259,0.978v1.96v1.397l0.14,1.679 l-0.559,1.398l0.699,1.677l1.398,0.7l0.5,0.145l1.458,0.416l2.098,0.139l1.958,0.141l0.699-1.54l0.699-1.117l-0.56-1.538 l1.119-0.279l0.839-1.12l1.119,0.7l0.979-0.7l0.839,0.979l1.399-0.279l-0.14-0.979l0.979-1.539v-1.678l-1.119-0.421l-0.839,1.12 l-0.14-1.819l-1.398-0.419l-0.56-0.838l0.419-1.398l1.539-0.282l1.398-0.838h1.678l0.979,0.699l0.979-0.839h1.119l0.839,1.397 l1.259-0.138l0.699,1.117l0.699-0.7l0.56-1.677l1.119-0.42l1.818-0.14l-0.14,1.258l0.419,1.96l-0.559,0.698v1.679l1.259,0.42 l0.839-1.54l0.839-0.419l0.839-0.279l0.28,1.118l1.258,0.559l0.56-1.258l0.979-0.279l0.56,1.537l0.14,1.54l-0.56,1.818l0.979,0.699 l1.259,0.979l0.28,0.979l-0.14,1.539l-1.258,0.279l-0.28,1.258l-0.28,0.839l0.839,0.562l1.258-0.282l0.14-1.397l1.119-0.14 l0.699-0.698l0.979,0.139l-0.14,0.84l-0.699,1.118l0.979,0.838l-0.14,1.959l-0.56,1.399l0.839,1.119l1.258,0.978l1.678,0.279 l0.839-1.118l0.839-1.958l1.678-1.397l0.979,0.698l0.979,2.099l0.839,2.796l-1.678,1.12l1.678,0.838l0.559,2.238l-0.559,0.839 l-1.539-0.28l-0.419,0.979l1.258,1.117l-0.14,0.562l-1.119,0.279l-0.28,1.538l1.398,0.419l1.259,0.28l-0.699,2.237l-0.42,0.979 v1.258l0.42,1.261l-0.42,1.956l1.399,0.7l1.538,1.398l1.119-0.141l1.119,1.259l0.699,1.399l-1.539,1.397l1.259,0.979l-0.839,0.979 l1.678,2.239l1.399-0.141l1.818,1.818l1.398,1.119v0.839l1.049,0.489l1.049,2.728l0.769,1.608l-0.699,1.049l0.77,1.188l0.279,1.538 l-1.468,1.259l0.979,1.328l-0.21,1.679l0.14,1.817l-1.119,1.05l0.07,0.979l0.979,0.56l0.14,1.608l0.982,1.049l-0.351,1.959 l-1.61,1.537l-1.398-0.559l0.699-1.959l-0.489-0.559l-1.049,0.559l-0.629,1.818l-0.699,0.909l-0.909-0.419l-0.28-2.099l-1.188-0.07 l-0.839-0.979l-0.839,0.07l-0.77,2.937l1.818,2.026l0.699,1.54l-0.909,0.42l0.979,1.606l0.21,1.96l-0.28,1.606l-1.468,0.35 l-2.238,0.28l-0.14,1.189l-1.678,1.118l-0.35,0.979h-1.818l-1.188,0.209l-0.35-0.698l-1.749,0.769l-1.398,0.142l-0.629,0.77 l0.419,1.607l-0.35,0.978l-1.259,0.562l-0.14,2.306l0.629,0.979l0.979,0.911l0.909,1.327l0.07,2.239l0.28,1.606l0.21,1.819 l0.35,1.049l-0.21,1.327l-0.07,1.12v1.049l0.769,1.188l0.07,1.538l0.699,1.188l0.28,1.54l-0.209,1.467l0.629,1.118l0.14,1.681 l-0.14,1.049l-1.188,1.678h-1.119l-0.42,1.119l0.35,0.908l0.909,0.769l-0.07,1.329l-0.07,1.189l-0.56,1.258l-0.56,1.26l0.699,2.515 l-0.559,0.841l-1.958-0.699l-0.14,1.398l1.958,1.258l0.56,2.238l0.419,2.658l-0.839,1.678l-1.259,0.279l-0.839,1.397l-1.678-1.538 l-1.818-0.418l-0.279,1.258l-1.818,0.419l-1.818-0.979l-1.818-1.397l-1.398,0.908l-0.419,1.049l-2.028,2.027l-1.538,0.77 l-1.888-0.559l-0.979,0.838l-1.748-0.279l-1.049,0.839l-0.839,1.329c0.025,0.008,0.405,0.975,0.564,1.017 c0.268,0.058,0.545-0.554,1.074-0.27v0.538v0.536c0.529,0.033,0.931-0.1,1.879,0c-0.008,0-0.503,0.724-0.268,0.805 c0.461,0.162,0.514-0.275,0.589-0.283c0.519-0.085,1.045,0.375,1.406,0.874c0,0,0.446-0.879,1.565-1.859l1.958-0.42l-0.28,1.959 l2.379,1.259l0.839-1.259l1.54,0.7l1.399-0.56h1.119l-0.56,1.4l1.679,2.24l1.399-0.84l0.7,1.679l1.539,0.562l2.239,2.519 l-1.819,1.54l1.819,2.521l1.399-0.562l1.679,0.981l1.399-1.541l1.958,0.42l-1.539,2.801l0.42,1.68l-1.259,1.959v1.541l2.938-0.279 l3.078-1.121l1.679-1.4l0.419-2.238l1.733-0.906l0.925-1.334l1.593-1.675l1.539-2.45l0.085-1.616l0.544-1.743l-1.12-2.029 l0.49-1.191l1.26-1.82l1.492,0.484l-1.982,1.476l2.67,0.56l1.817,0.561l0.562-1.68l4.614,1.119l2.24,0.701l1.399,1.68l4.896-1.26 l0.56,0.98l-1.121,0.42l-1.258,0.839l0.42,1.121l2.518-0.14l1.68,0.98l0.42,1.397l1.679,1.262l-0.979,1.68l1.258,0.559l2.38-0.279 l2.395,0.203l2.643-1.042l1.134-0.916l2.643-1.046l3.078-0.279l-0.404,1.325l0.279,1.259h1.12l1.118-1.819l2.363-1.465l2.099-0.139 l1.259-0.561l-0.979-0.84l1.261-2.382l2.938,0.142l3.232-0.635l0.544-2.585l3.078-0.422l0.855-2.875l1.803-0.622l2.379,0.419 l1.834-0.496l2.258,0.077l4.021,0.139l1.12-1.12l2.658-0.419l1.834-0.078l2.362-0.345h2.8l2.812-0.214l1.538-0.279l-0.699-0.982 l-0.698-1.12v-1.538l1.118-0.841l1.12-2.38l1.118,0.42l-0.839,1.96l0.56,1.261l2.099-1.4h1.259l1.818,0.56l-1.801-0.56l1.801,0.56 l1.952,0.261l1.68,0.418l-0.142,1.397l1.679,1.54l0.839,1.677l2.657-0.559l1.817-2.797l2.938,0.279l2.518-0.279l1.258,0.7 l0.699,1.119l0.42,1.397l0.713-0.813l0.546,2.912l-1.12,1.956l2.1,2.519l2.377,1.959l2.394,1.996l1.963,1.613l1.813,0.063 l0.965-1.742l0.575-1.196l0.842-1.539l-0.157-2.865l0.574-1.756l0.841-2.102l0.698-2.938l0.702-2.801l-0.981-2.241l-1.818-1.12 l-1.679-0.421l-1.555,1.337l-1.944-0.495l1.96-3.501l-0.979-1.12l1.45-2.521l-0.008-1.173l-1.259-1.711l-1.04-1.168l-0.945-1.481 l0.246-1.739l-0.91-1.328l-1.959-1.541l-1.129-1.983l-1.404-1.449l-1.131-1.21l-0.271-0.907l-1.31-2.15l-0.092-1.658l0.556-0.929 h0.699l1.549-1.259l0.855-1.333l1.25-1.851l1.128-0.53l1.4-0.282l1.468-0.49l1.486-1.856l0.683-0.452l2.658-0.701l1.747-0.77 l1.471-0.839l1.887-0.632l1.812-0.326l1.542-0.493l1.327-0.35l1.398-1.12l1.774-0.462l2.001-1.984l1.19-2.236l1.188-2.309 l-0.14-2.028l0.29-1.08l0.06-1.575l0.559-0.911l0.082-1.644l-0.57-1.433l0.059-1.589l-0.609-1.249l1.539-0.979l1.119,0.769 c0.629,0.772,1.33-0.839,2.309-0.139c0.733,0.046,1.818,1.329,2.658,1.959l0.771-0.28h1.68c0.375,0.229,0.384,0.608,0.865,0.942 c0.547,0.378,0.722,1.2,1.093,1.508c0.446,0.371,1.244,1.042,1.888,1.612c0.7-0.701,1.199-1.833,1.82-3.083 c0.423-0.854,0.759-1.312,0.978-2.24c0.215-0.904,0.133-1.448,0.141-2.381c0.01-1.091-0.229-1.708-0.141-2.799 c0.086-1.056,0.279-1.636,0.559-2.659c0.447-1.633,1.214-2.312,1.541-4.062c-2.15,0.302-3.154-1.963-3.514-2.11 c-1.097-0.874-1.387-3.536-3.357-4.478c-0.86-0.412-1.918-0.464-2.797-0.838c-1.33-0.566-0.953-1.218-2.097-2.097 c-0.745-0.573-0.128-1.703-0.979-2.099c-0.896-0.417-1.621-0.28-2.518-0.699c-0.891-0.418-0.688,2.637-1.399,1.957 c-0.568-0.545-2.578-0.379-3.217-0.839c-0.85-0.613-0.699-0.158-1.67-0.557c-0.963-0.396,0.609-2.279-0.428-2.38 c-1.254-0.122-0.131-2.655-1.257-3.217c-1.077-0.537-1.366-1.403-1.819-2.517c-0.334-0.815-1.916-0.142-2.797-0.142 c-1.818,0-2.574-0.104-4.057-0.979c-1.01-0.596-0.635-3.445-1.397-4.335c-0.687-0.799-2.55-1.463-3.076-2.378 c-1.206-2.085-1.503-1.982-2.938-3.916c-1.41-1.9,0.853-1.343-1.119-2.655c-1.678-1.12-5.754-3.595-6.293-2.518 c-0.419,0.838-1.536,1.956-2.656,0.698c-0.759-0.855-0.829-1.663-1.817-2.238c-1.475-0.856,0.069-0.612-0.979-1.956 c-0.673-0.859-2.009-0.507-2.798-1.261c-0.68-0.647-0.711-1.612-1.26-2.376c-0.893-1.245-0.347-1.485-0.838-2.938 c-0.505-1.492-2.387-1.741-2.938-3.216c-0.428-1.145,0.345-2.167-0.279-3.217c-0.611-1.029-0.968-1.254-1.817-2.097 c-0.525-0.521-0.816-2.345-1.258-2.938c-0.878-1.174-2.938-0.279-3.079-2.519c-0.148-2.386-3.004-1.164-1.258-2.797 c0.72-0.671,0.855-2.397,1.679-2.938c0.71-0.463,1.925-1.905,2.517-2.516c0.779-0.805,0.217-1.727,0.841-2.658 c0.567-0.853,1.815-0.139,1.257-2.098c-0.323-1.134-3.15,0.013-3.496-1.119c-0.16-0.521,1.121-1.569,0.979-2.097 c-0.251-0.933-0.512-0.926-1.258-1.538c-0.834-0.684-1.037,1.422-1.68,0.559c-0.514-0.692-0.493-1.026-0.838-1.817 c-0.398-0.92-3.876-1.154-4.475-1.958c-0.162-0.218-0.541-1.35-0.839-1.679c-0.833-1.404-1.083-0.443-1.774-1.163 c-1.321-1.376-2.652-2.78-2.842-3.312c-0.313-0.879,0.805-2.562,0.841-3.495c0.048-1.318-1.004-0.825-1.681-1.958 c-0.302-0.507-0.781-1.192-1.117-1.68c-0.423-0.608-2.055,0.649-2.379,0.142c-0.39-0.612-0.623-1.934-0.559-2.238 c0.107-0.503,1.815-0.42,1.819-0.699c0.012-1.162-1.444-1.825-1.103-2.937l-1.695-0.56l-0.84,0.279l-1.398-1.398l-1.539-1.259 l-1.258-1.538v-1.117l-0.699-1.399l-0.979,0.14l-0.561-0.699l-1.816-0.279l-1.119,0.559l-1.26-0.42l-1.537-0.979l-1.259,1.819 h-1.819l-2.377,1.118l-1.398,0.142l-2.238-0.562l-1.678,1.399l-1.118-0.979l-1.399,0.142v-2.1l-0.838-0.979l-1.397,1.12v-1.54 l-0.841-0.559l0.841-2.938l-0.562-2.097l-1.537,0.56l-0.839-0.56l-1.957,1.118l-0.282,0.979l-1.258,0.42l-1.118-0.558l-0.841,0.558 v1.539l0.282,1.819l-0.351,2.517l1.152,1.922l0.35,1.679l-0.731,1.712v2.38l-0.841,1.119l-1.259-0.562l-0.979,0.385l-1.992-0.559 l-0.944-1.747l-0.14-1.609l-0.315-1.398l-1.154-0.385l-1.188,0.279l-1.817-0.419l-0.562,0.979l-1.118-0.42l-0.28-1.956l-2.098-1.12 l-1.398,0.421l-1.818-0.562l-2.097,0.42l-1.537,0.7l-0.421,1.398l-1.259,0.419l-0.14,1.819l1.398,0.699v1.537l1.538,0.14 l1.958,0.979l-0.561,1.959l-0.418,0.838l-1.398-0.419l-1.397,0.419l-1.68-0.558l-0.419,0.837l-0.281,1.54l-1.116-0.699 l-1.261-0.559l-1.539-0.421l-0.979-0.698l0.141-1.539l-1.259-0.838l0.56-0.841l-0.141-1.397v-1.26l-1.257-0.56l-0.42-1.118 l-1.12-0.14l-0.838,0.838l-0.979-0.559l-0.279-1.538l-1.545-0.7l-1.123,0.142l-1.119-0.279l-0.419-1.12l0.559-1.118l-0.419-0.841 l-0.979-0.559l-0.699-0.979l0.14-1.68l-1.259-0.979l-1.678-0.419l-1.398-0.699l-0.699-1.399l-1.259-1.258l-1.119-0.699 l-1.958,0.699l-1.119-0.56l-1.398-0.979l-0.56,1.817l-1.119,1.12L241.591,306.102z", farbe:'$V->{'Bayern'}' },  bb: { name:"Brandenburg", text: "$V->{'Brandenburg-text'}", cords: "M446.757,197.834l0.173,0.809l-0.125,0.834 l-0.507,1.406l0.07,0.98l-0.211,1.189l-0.139,0.91l0.139,0.84l0.07,1.26l0.07,2.1l-0.42,1.261l-0.978,1.54l-0.491,1.47l-0.979,0.91 l-0.77,0.98l-0.561,0.84v1.05l0.701,0.84l1.188,0.42l0.699,1.4l1.26,1.33l0.42,1.96l0.562,1.47l1.188,1.54l0.35,1.68l0.07,1.12 l0.418,1.189l-0.279,1.331l-0.634,1.362l-1.562-0.328l-0.279-1.119l-1.399,1.259l-0.28,1.538l-2.099-0.14l-0.699,1.259 l-0.559-1.818l-1.539-0.839l-1.258,1.398v1.119l-1.538,0.56l-1.399-1.678l-0.838,0.419l-0.42,1.119l-1.959,0.979l-1.119-0.279 l-2.377,0.839l-1.258,0.419l-1.259-0.419l-0.14-1.259l-1.119-0.279h-2.376l-1.398,1.258l0.278,1.119l-0.699,0.14l-1.119,3.356 l-1.539,0.419l0.562,1.818l-1.12,1.119l-0.559,2.657h-1.259l0.14-0.979l-0.839-0.14l-1.54,0.839l-1.397,0.979l-3.077-0.28 l-2.377,1.398l-1.817,0.14l-2.238-0.419l-2.657-0.979l-2.098,0.14l-1.959-0.28l-1.397-0.979l-2.237-0.839l-0.979,0.42l-0.56-1.259 l-0.979-0.28l-0.7,1.398l-1.538-0.28l-2.099,0.979l-1.398,1.539l-1.398-0.14l-1.119-0.279l-0.559-2.098l0.141-4.195v-1.119 l-1.119-2.238l-1.68-1.958l0.42-1.818l-1.678-0.979l-0.84,0.419l-1.116-0.699l-0.735-1.748l1.434,0.21l1.678-1.119l1.678-1.399 l0.979-1.678l1.397-1.258l-0.418-1.678l-0.839-1.678l-0.141-2.377l-0.979-1.398l-0.42-0.699l0.98-0.839l-0.98-1.678l-1.817,0.28 h-2.099l-1.397-1.119l-1.118-0.979v-1.259l-1.398-0.839l-1.679,0.699l-1.537-0.979l-3.217-1.539l-2.798-1.678l-1.26-0.14 l-2.655-0.839l-1.12,0.839l-0.979,1.259l-2.797,0.14l-0.699-1.398l-0.56-1.398l-1.819-0.56l-0.418-1.119l-0.979-0.28l-0.839,1.119 l-1.26-0.699l-1.537-1.258l-2.518-3.217l-2.097-2.937l-1.96-2.797l0.561-1.818l1.679-0.699l-1.399-2.238l0.279-1.958l1.539-2.377 l1.398-2.937v-2.377l-1.678-1.818l1.258-2.098l0.562-2.098l-0.841-0.839l-1.677,0.279l-0.42-1.538l-1.261,1.259l-1.257-0.28 l-0.699-1.818h-1.12l0.562-1.119l0.838-2.098l0.141-0.979l-0.841-0.979l0.421-1.398l2.376-0.419l0.42-2.098l0.279-1.539 l-0.42-1.398l-0.559-1.678l-0.559-1.678l-0.141-1.678l0.979-0.979l0.42-0.979l-0.42-1.258l0.279-2.098l-1.677-0.699l-0.839,0.839 l-1.26,0.14l-1.118-1.119l-1.399-1.119l-1.678,0.419l-3.559,0.042l-2.033-0.605l-1.256-0.346l-0.82-0.691l-1.211-0.606 l-0.302-0.821l-1.771-1.859l-1.731,0.259l-0.734-0.346l-0.994-1.081l0.261-1.513l-0.866-0.476l-0.779-0.648l-1.266-0.399 l-0.235-1.936l1.496,0.258l0.978-0.839l-0.698-1.119l-0.979,0.14l-0.979-1.259l-0.979-0.419l-0.419-1.678l-0.839-0.979l0.979-0.699 l-0.7-1.259l-1.258,0.28l-0.699-1.678l1.258-1.958l1.539-0.979l2.798-0.279l1.817,1.119l1.537-1.539l1.12-2.657l1.397,0.559 l1.12-0.559l1.538,1.258l2.099,0.14l0.698-1.259l1.678,0.14l1.258-0.559l-0.279-1.259l1.119-1.259v-1.678h0.84l0.979,2.098 l1.398-1.119l1.119-0.28l1.258,0.7l1.12-0.979l1.397-0.28l0.979,1.958l0.979,0.839h1.539l1.398,0.419l1.398,1.398l0.979,0.699 l1.261,0.7l1.118,0.419l1.398,0.699l1.117-0.56l1.68,0.419l1.537,0.42l1.12-0.699l1.259,0.419l0.139,1.259l1.54,0.14l1.677,0.699 l-0.14,1.259l1.817,0.839l1.959-0.419l1.679,0.979l1.677-0.979l1.539,0.14l1.957,1.539l2.658-2.797l1.537-1.818l2.798-0.699 l1.538,1.818l1.959-0.839l0.139-1.818l2.798-1.539l2.097-0.14l0.562,1.538l1.258-0.279l1.538-2.657l2.098-0.14l0.559-1.538 l1.398,0.14l-0.559-2.657l1.679-1.678l0.698-1.818l1.678,0.419l1.818-0.559l2.098,1.258l1.679-0.419l1.118,0.699l1.398-0.839 l1.26,0.14l1.258-2.098l2.797-0.839l2.798,0.14l0.978,1.818l1.959,2.098l-0.14,1.539l1.817,1.398l0.279,1.678l-0.979,0.979 l-0.419,1.119l2.378-0.419l3.215,0.699l0.562-1.398l1.956-1.259l0.42-1.259l1.959-0.279l2.166-0.46 c0.006,2.462-1.412,5.497,0.374,5.879l-0.421,1.82l-0.84,0.7l-0.699,1.82l0.84,0.7l0.017,2.584l-1.819,3.92l-1.135,1.476 l-1.538,1.82l-1.331,1.33l-2.379,1.05l-1.048,0.56l-0.7,0.98l0.139,1.26l0.717,1.604l0.684,2.036l-0.35,1.47l-0.769,0.98l0.699,0.7 l1.134,0.414l1.664,0.846l0.838,1.33l0.577,0.764l1.259,0.7l1.117,0.98l0.562,0.98l0.979,0.42l1.117,0.56l1.26,0.56l1.121,1.12 l1.523,1.336l1.412,0.624l0.562,1.4l0.698,0.7l1.119,0.14l1.804,0.496l1.121,1.12l1.397,0.98l0.911,1.33l-0.055,0.974l-0.157,0.566 l-0.63,0.7l-0.209,0.56l-0.07,1.121l0.35,1.12l0.069,1.26l-0.279,0.98l-1.048,1.54l-0.629,0.63l-0.491,0.91l-0.351,1.68v1.05 l0.21,1.75l0.281,1.4l0.209,1.26l0.491,0.84l0.698,0.839l0.699,0.63l1.328,0.21l0.842,0.28l1.049,0.63l0.488,1.26l-0.209,0.98 l-0.211,0.98l0.141,0.98l0.225,1.324l0.476,1.335l-0.142,0.91l0.562,0.771l0.698,0.98l0.279,0.91L446.757,197.834z M402.168,179.975c0.144-0.193,0.454-0.949,0.034-0.806c0,0-0.218-0.039-0.335,0.02l1.259-3.182l-3.496-2.098l-1.958-0.42 l1.118-2.937l-1.818-0.14l-0.699-1.818l-1.258-0.28l-0.839-1.678l-2.099-0.839v-1.119l1.119-1.119l-1.119-1.818h-1.537 l-0.419,1.678l-2.239,0.28l-0.839,0.699l-2.378-0.28l-0.419-2.098l-0.979-0.28l-1.259,2.377l-1.678-0.14l-0.28,2.238l-0.838,0.839 l-1.96-0.979l-0.279,0.979l0.699,1.259l-0.559,1.398l0.559,2.518l-1.118,1.258l-0.979,2.238l0.839,1.678l-0.562,0.689 c-1.015-1.696,0.981,1.688,0.981,1.688l2.658-1.678l2.517,1.259l1.957-0.979l2.098,0.559l0.84,0.7l-0.561,0.839l3.217,0.28v-2.238 l1.539-0.559l1.258,1.538l1.96-0.14l0.419,0.979l5.033,0.699v1.398c0.058,0.694,0.224,1.575,0.268,2.637l0.082-2.742l0.491-0.175 l0.559-1.539", farbe:'$V->{'Brandenburg'}' }, be: { name:"Berlin", text: "$V->{'Berlin-text'}", cords: "M376.415,177.406l-0.839-1.678l0.979-2.238 l1.118-1.258l-0.559-2.518l0.559-1.398l-0.699-1.259l0.279-0.979l1.96,0.979l0.838-0.839l0.28-2.238l1.678,0.14l1.259-2.377 l0.979,0.28l0.419,2.098l2.378,0.28l0.839-0.699l2.239-0.28l0.419-1.678h1.537l1.119,1.818l-1.119,1.119v1.119l2.099,0.839 l0.839,1.678l1.258,0.28l0.699,1.818l1.818,0.14l-1.118,2.937l1.958,0.42l3.496,2.098l-1.328,3.287 c-1.951,0.7-2.143,1.544-2.029,3.146v-1.398l-5.033-0.699l-0.419-0.979l-1.96,0.14l-1.258-1.538l-1.539,0.559v2.238l-3.217-0.28 l0.561-0.839l-0.84-0.7l-2.098-0.559l-1.957,0.979l-2.517-1.259l-2.658,1.678l-0.866-0.786 C376.085,178.637,376.415,177.406,376.415,177.406z", farbe:'$V->{'Berlin'}' }, he: { name:"Hessen", text: "$V->{'Hessen-text'}", cords: "M238.792,246.911 L238.372,248.31 238.372,249.708 238.652,251.106 239.491,251.666 240.19,252.366 241.589,253.344 242.708,254.603 243.127,257.26 244.525,258.938 246.344,258.938 248.581,259.637 249.42,261.176 250.539,260.616 250.539,261.875 249.141,262.433 249.141,263.972 248.861,265.51 247.323,265.789 246.344,267.747 247.742,269.286 248.721,269.985 249.42,271.104 248.721,272.223 249.7,273.622 249.141,274.321 247.882,274.601 246.204,274.46 246.064,273.343 245.085,273.201 244.525,274.321 242.008,273.201 241.449,273.901 241.169,275.579 242.428,276.277 241.589,277.677 240.05,277.956 238.092,277.118 236.974,277.538 237.953,279.635 238.652,279.076 240.05,279.076 241.589,279.914 242.428,281.593 241.309,282.572 241.169,283.41 240.33,284.251 239.351,285.089 237.533,284.81 237.393,286.208 236.694,288.026 236.834,290.543 236.414,293.061 235.156,293.48 234.316,295.858 234.596,297.676 236.694,297.535 238.092,297.535 238.372,295.858 239.491,295.438 241.589,295.297 242.288,295.297 243.127,296.557 243.407,298.514 242.288,299.214 242.008,300.473 242.148,302.01 241.869,303.689 241.869,305.509 241.591,306.102 240.89,307.605 239.911,309.143 238.932,310.542 237.813,311.801 235.855,312.78 233.897,313.759 233.337,312.918 232.499,313.339 230.82,312.501 230.82,311.382 229.981,311.521 228.862,311.102 227.883,313.06 227.324,315.018 227.883,316.276 228.023,318.094 226.904,319.214 225.086,320.051 223.688,320.892 223.968,322.149 223.968,323.688 221.45,323.968 220.332,323.409 218.933,323.268 218.234,322.71 217.814,323.547 217.814,325.087 216.835,325.366 216.835,326.764 217.674,328.163 216.975,329.561 217.814,330.401 217.535,332.219 215.157,332.777 213.06,332.918 211.801,332.219 210.822,329.841 209.983,329.561 207.605,329.701 206.906,328.723 204.948,328.304 202.71,329.422 201.731,330.821 200.473,330.96 200.053,329.561 198.935,329.142 197.536,329.841 195.858,330.539 194.319,331.938 193.341,333.339 193.341,335.155 194.04,336.973 195.159,338.233 194.319,339.351 194.879,340.469 194.459,341.589 195.298,342.708 195.438,345.085 195.438,346.902 195.998,349.001 197.676,349.142 197.536,350.398 197.256,351.659 198.515,351.238 199.354,351.938 198.096,353.476 199.214,353.896 199.773,355.014 199.214,356.413 198.795,357.392 197.536,358.369 197.536,360.329 197.536,361.727 197.676,363.405 197.117,364.804 197.816,366.48 199.214,367.181 199.791,367.321 199.074,368.58 198.096,367.88 197.256,368.719 198.235,369.979 198.795,371.517 197.956,371.656 197.117,370.679 196.277,371.097 195.718,372.076 194.319,372.355 192.921,371.517 191.802,372.216 190.963,373.335 190.684,374.454 191.243,375.432 189.285,375.852 188.306,376.689 188.026,377.81 187.047,378.229 186.208,377.53 185.229,378.229 184.11,378.648 183.831,377.251 185.229,376.551 185.369,374.873 185.929,373.335 187.047,373.335 187.327,374.175 188.166,373.613 188.306,372.076 187.607,371.656 186.208,371.656 184.95,370.958 184.53,370.118 183.411,370.397 181.873,369.979 180.614,369.697 179.635,368.58 179.076,367.601 179.216,366.201 179.915,364.664 178.936,364.384 177.258,364.804 175.999,365.083 175.16,365.363 175.58,366.622 176.139,367.601 176.559,368.719 175.72,369.56 173.622,370.118 172.363,369.697 171.664,368.58 171.244,367.321 169.986,366.622 169.287,365.781 167.748,365.643 166.769,365.781 167.188,363.755 166.21,361.868 166.07,359.771 166.21,357.951 166.629,357.252 168.657,356.272 169.426,354.455 170.545,353.616 170.405,352.076 168.028,351.447 166.629,349.001 166.629,347.882 165.65,346.483 165.371,344.806 165.091,342.567 165.091,340.889 163.623,338.372 162.574,337.252 160.196,335.716 157.819,334.597 156.28,334.876 154.043,335.994 151.666,336.554 149.987,337.113 148.449,338.093 147.05,338.233 145.372,338.233 143.554,337.534 142.855,336.414 141.736,334.876 140.617,333.618 139.499,332.918 139.219,331.8 141.037,331.238 142.295,329.841 143.135,328.304 144.533,328.304 145.652,328.862 146.211,330.122 147.19,329.422 147.47,327.884 146.491,326.626 145.372,325.227 146.491,323.409 148.729,322.568 150.546,323.268 151.525,322.988 151.106,320.892 152.504,320.051 154.183,320.192 155.301,319.214 154.602,316.417 153.483,314.458 153.204,312.219 151.246,311.241 150.546,309.563 149.148,309.143 148.309,308.306 149.008,306.487 150.127,305.788 149.567,303.55 149.428,302.01 151.106,300.333 153.903,300.612 154.602,301.593 156.141,300.612 156.28,297.396 156.141,295.577 156.42,293.2 156.347,292.78 157.539,290.822 158.378,289.005 158.518,287.605 157.679,284.95 158.938,282.991 160.896,280.893 162.434,278.796 164.252,278.796 164.252,279.914 166.629,280.335 168.587,278.655 170.265,277.257 172.223,276.418 172.223,274.88 173.202,272.502 174.321,271.243 176.419,270.405 176.559,269.146 175.72,267.747 175.859,266.489 175.021,266.349 175.859,265.23 175.44,264.112 176.978,263.552 179.076,262.712 181.453,263.273 183.271,262.853 184.67,262.574 183.971,261.595 184.53,260.336 185.789,260.477 186.068,258.798 185.929,257.12 185.369,255.721 185.789,254.603 185.229,253.903 184.11,253.204 182.432,253.484 180.894,253.484 179.775,253.764 178.237,253.065 179.355,251.106 179.775,249.848 180.894,248.589 182.712,247.191 183.971,246.072 185.229,246.072 186.068,246.492 187.187,246.072 189.145,245.932 191.103,247.051 192.781,245.932 194.599,245.652 195.578,245.093 195.718,242.995 194.18,242.855 193.48,241.317 194.04,238.939 195.578,237.681 197.396,236.982 198.515,237.821 200.333,237.821 200.752,239.918 200.893,241.876 202.291,242.715 203.829,242.296 204.528,241.457 206.347,241.597 206.906,240.338 207.465,239.08 208.724,238.24 209.703,236.842 210.961,236.422 211.241,234.884 212.919,233.346 213.479,232.087 212.5,231.388 213.479,230.409 215.017,230.828 215.996,229.989 216.793,229.313 218.514,229.01 219.353,230.549 221.45,229.85 221.87,230.688 222.989,230.688 224.667,229.709 224.947,230.968 226.205,231.248 227.604,233.485 226.904,233.905 225.366,231.947 225.506,234.604 223.548,234.325 224.527,236.283 224.248,237.96 223.968,239.359 224.527,240.897 225.506,243.415 225.506,245.093 224.527,246.352 222.569,247.331 221.87,248.589 223.548,249.848 224.947,250.407 225.926,250.407 229.142,252.085 230.96,250.827 230.82,248.869 229.142,249.428 228.583,247.61 231.799,246.631 233.617,245.513 235.156,248.31 235.855,248.03 235.156,244.813 236.274,245.652 237.673,244.673 238.232,246.352", farbe:'$V->{'Hessen'}' }, mv: { name:"Mecklenburg-Vorpommern", text: "$V->{'Mecklenburg-Vorpommern-text'}", cords: "M353.298,43.797 c-0.537-0.293-0.066,0.16-0.268,0.269c1.695,0-0.186,0.915,0.268,1.075c-0.57,0.285-0.654,0.101-1.342,0.268 c0,0-0.58,1.586,0.268,1.075v0.537c-1.551,0.033-2.113,0.084-3.489,0.806c-0.673-0.504-1.233-1.066-1.879-1.611 c-0.077,0.336,0,1.343,0,1.343c-0.278,0.377-1.268,0.453-1.612,0.805c-0.143,0.134,0.059,0.638,0,0.806 c-0.167,0.411-1.217,0.437-1.342,0.806c-0.244,0.646,0.545,0.713,0.268,1.612c-0.217,0.688-1.316,0.193-1.074,1.611l0.537,0.806 v1.612c0.152,0,0.646-0.093,0.807,0v0.537c0.646,0.26,2.149,0,2.149,0c-2.35-0.604-1.739-2.006-0.271-2.955l0.271-0.538 c0.292-0.108,0.779,0.118,1.071,0c-0.083-0.05,0-0.965,0-1.074c-0.468,0.193-0.233-0.58-0.267-0.806 c2.089-0.437,2.046-0.361,2.952-1.88h-0.536v-0.538c1.654-0.78,0.788-0.906,2.415,0.269c0.202-0.117,0.119-0.705,0.27-0.806 c0.453-0.318,1.083-0.042,1.612-0.268c0.216-0.101,0.729-0.646,1.074-0.807c-0.11-0.352-0.431-0.747-0.271-1.074l0.805-0.537 c-0.283-0.227-0.082-0.479-0.534-0.538c-0.278,0.504,0.066,0.646-0.537,0.806C354.163,44.561,354.172,44.267,353.298,43.797z M383.643,26.607c3.354-0.521,1.886,0.738,2.684,1.343c-0.89,0.453-1.62,0.873-2.417,1.343c0.209,1.578,0.396,3.869,1.612,4.297 c2.088,0.73,4.287-0.688,5.638-0.805c1.475-0.134,2.021,0.092,3.491-0.269c0.269,0.327,0.478,0.823,0.805,1.074 c0.21,0.16,0.956,0.311,1.073,0.538c0.369,0.713,0.135,1.544,0.27,2.417c-0.076,0.033-0.529,0.252-0.537,0.269 c-0.639,1.184-3.559,2.703-3.76,3.492c-0.504,1.905,0.973,4.054,1.612,5.103c0.471-0.058,2.14-0.545,2.147-0.537 c0.169,0.05,1.77,1.679,1.879,1.879c0.211,0.403-0.051,1.343,0.268,1.612c0.412,0.344,1.611,0.395,2.148,0.538v0.537 c-1.182,0.664-2.28,1.327-1.879,3.492c0.008,0.084,0.42,0.294,0.27,0.806c-0.05,0.151-0.495,0.193-0.539,0.537 c-0.385-0.302-0.602-0.277-1.073-0.537v-0.537c0.177,0,0.621-0.084,0.806,0V52.66c-0.688,0.059-2.147,0-2.147,0 c-0.387,0.361-0.253-0.713-0.269-0.806c0.361-0.209,0.965-0.26,1.343-0.537c0.143-0.109,0.151-0.73,0.268-0.806 c-0.638,0.118-0.444-0.395-1.073-0.269c0,0-0.243,0.47-0.269,0.538c-0.059-0.009-1.493-0.151-1.073-0.269 c0.494-0.151,0.963-0.235,1.342-0.537c0.268-0.227,0.294-0.881,0.537-1.074c-0.629,0.167-0.697-0.177-1.074-0.269 c-1.26,2.056-1.04,2.048-1.881-0.269h-0.534c-0.42,0.336-0.757,1.201-1.345,1.343c-0.512,0.117-0.191-0.261-0.27-0.537 c-1.206,0.017-1.594,0.143-2.952,0.268l-0.269,0.806c-0.562,0.118-0.603-0.428-1.344-0.537c0.252,0.512,0.43,0.981,0.807,1.343 c-0.547,0.327-1.805,0.822-2.148,1.343c-0.352,0.52-0.058,1.519-0.537,1.88c-0.16,0.109-0.384-0.344-0.805-0.269 c-0.233,0.034-0.848,0.714-1.074,0.806c0.871,0.034,1.091,0.118,1.879,0.269c0.094-0.344-0.259-0.58,0.271-0.538 c0.292,0.017,0.493,0.713,0.805,0.806c0,0.429-0.125,0.932,0,1.343c-0.487,0.202-0.471,0.504-0.805,0.806 c-0.077-0.067-0.749-0.252-0.808-0.269c0.059-0.201,0.268-0.806,0.268-0.806c-0.519-0.151-1.76,0.47-2.684,0.268 c-0.905-0.201-1.063-1.2-1.342-1.343c-0.371-0.201-0.941,0.118-1.343,0l-0.269-0.537c-1.621-1.049-1.705-0.184-2.148-2.686 c-3.7-1.091-3.566-1.612-2.148-4.835c0.797-0.017,2.636,0.52,3.49,0.269c0.076-0.026,0.01-0.471,0.538-0.538 c-0.059-0.285-0.933-1.998-0.268-2.417c-1.554-0.512-2.258-0.461-3.761,0c0.705-2.208,0.948-2.106-1.074-1.611 c0.402-1.352,0.695-4.658,3.223-3.76v0.537h0.538l0.267,0.269c0,0.227-0.107,0.864,0,1.075c-0.217,0-0.896-0.118-1.071,0 c0.022,0-0.522,0.78-0.54,0.805c0.621,0,0.773-0.134,1.345,0c0.092-0.495,0.1-0.151,0.537-0.268c0-0.596-0.118-1.31,0-1.88h-0.271 c0.025-0.067-0.041-1.184,0.537-1.612c0.672-0.512-0.325-0.101-0.537,0c-0.395,0.168-0.932,0.865-1.879,0.537 c-0.167-0.059-0.134-0.621-0.537-0.537c-0.125,0.017,0.117,0.562-0.537,0.537c0.109-0.739,0.033-0.26,0.537-0.537 c-0.251-0.99-0.545-1.729-0.805-2.417c1.701-0.193,4.992-0.823,5.638,0.269c0.243,0.419,0.134,1.226,0.269,1.612 c0.033,0,0.798-0.017,0.807,0c-0.259-1.369-0.185-1.839-0.537-2.955c1.996-1.201,3.213-2.376,1.879,1.074h0.537 c0.084-0.529-0.15-0.613,0.271-0.806c0.654-0.319,0.358,0.42,0.804,1.075c0.15,0.226,0.99,0.546,1.075,0.806 c0.728,2.325-1.202,0.881,1.073,2.686l0.269,0.807c0.15-0.143,0.663-0.748,0.805-0.807c1.267-0.604,1.31,0.521,1.61-1.343 c0.16-1.058-0.227-3.114-0.268-3.76c-0.16,0.083-0.646,0-0.805,0c0,0.033,0.008,0.797,0,0.806 c-1.646,0.654-1.938-0.798-2.418-1.075c-0.26-0.151-0.796,0.092-1.074,0c-0.159-0.059-0.545-0.688-0.805-0.806 c0-0.437,0.117-0.94,0-1.343c-0.017-0.042-0.807-0.537-0.807-0.537c-0.377,0.747-0.201,0.344-0.805,0.806l0.269,0.806 c-0.403,0.353-0.847-0.008-1.343,0.269c0,0-0.748,1.032-0.806,1.075c-1.091,0.679-1.609,0-1.609,0 c0.048-0.73,0.134-1.25,0.268-1.612c0.142-0.403,0.36-0.68,0.537-1.075c0.05-0.126,0.511-0.965,0.537-1.074 c0,0-0.42-2.266-0.269-1.075c-0.186,0-0.631,0.076-0.806,0c-0.388,0.353-0.646,0.73-1.075,1.075 c0.529,1.754,0.822,1.721-0.537,2.954c-0.596,0.529-1.141,0.706-1.611,1.343c0.136-0.327-0.335-0.461,0-1.074 c0.244-0.47,1.395-0.864,1.611-1.343c0.479-1.083-0.244-2.4,0-3.223c0.018-0.084,0.738-0.479,0.808-0.538 c0.292-0.285,0.713-1.233,1.073-1.343c1.291-0.437,2.541,0.059,3.758-0.269L383.643,26.607z M373.705,31.979 c0.32,0.134,0.975,0,1.343,0c-0.168,0.832-0.117,1.175-0.268,2.149c-0.101-0.059-0.799-1.041-0.807-1.075 c-0.051,0.336-0.493,0.378-0.537,0.537c-0.242,0.79,0.527,1.83,0.269,2.955h-0.536c-0.562,1.394-1.022,2.938-1.074,4.029 c0.662,0.353-0.536,0.806-0.536,0.806c0.075-2.057,0.427-3.156,0.805-4.566c0.32-1.243,0.126-2.695,0.537-4.029 C372.992,32.457,373.58,32.264,373.705,31.979z M400.826,57.227c0.552-0.285,0.629,1.158,0,1.343 C400.826,58.435,400.884,57.235,400.826,57.227z M383.643,35.739l-0.54,0.806c-0.008,0,0,0.764,0,0.806 c0,0,2.283-1.326,1.074-0.806C384.026,36.427,383.801,35.882,383.643,35.739z M389.548,40.037 c-0.354,0.235-0.504,0.126-1.074,0.269c0,0-0.227,1.065-0.268,1.343c0.209,0.101,0.83,0,1.072,0 c-0.577,0.209,0.077,0.705,0.27,0.806c-0.73,0.05-1.041-0.076-1.342,0l0.268,1.343c1.031,0.009,0.982-0.017,2.148,0 c-0.346-0.193,0.268-0.621-0.537-0.538c-0.067-0.134-0.159-0.486-0.269-0.537c1.418-0.344,0.01-0.36,0.269-1.074l0.805-0.269 c0-0.167-0.092-0.654,0-0.806C390.555,40.423,389.874,40.289,389.548,40.037z M373.705,43.528c0.346,0.076,0.934,0.672,0.269,0.538 L373.705,43.528z M362.159,45.408c0.479,0,0.168,0.168,0.268,0.538L362.159,45.408z M377.464,45.408 c0.833,0,0.15,0.319,0.537,0.538h-0.537V45.408z M355.984,47.289c-0.437-0.218-0.217,0.344-0.271,0.537 C355.714,47.826,356.386,47.49,355.984,47.289z M390.353,49.975c1.586-1.15,0,1.343,0,1.343 C389.472,51.93,390.218,50.067,390.353,49.975z M375.585,52.124c0.445,0.235,0.896,0.159,1.345,0.269l0.267,0.806 c-0.512,0.109-1.896,0.269-1.88,0.269C375.316,53.466,375.201,52.467,375.585,52.124z M414.519,72.805 c-0.412,0.327-0.442,0.109-1.074,0.268C414.168,75.348,413.722,74.71,414.519,72.805z M415.593,74.686 c-0.412,0.285-0.117-0.026-0.267,0.537c-0.403-0.327-0.253,0.923-0.271,1.074c0.697-0.049,0.771,0.126,1.342,0.269 c-0.081-0.226-0.268-0.806-0.268-0.806h-0.537C415.593,75.525,415.694,74.878,415.593,74.686z M404.047,80.594 c-0.923-0.235-0.108,0.99-0.269,1.075C403.778,81.669,404.4,80.678,404.047,80.594z M397.334,47.826 c-0.462-0.235-0.225,0.353-0.268,0.537C397.066,48.363,397.705,48.01,397.334,47.826z M375.585,55.078 c-0.292,0.076-0.504,0.638,0,0.537C375.585,55.615,376.349,54.868,375.585,55.078z M381.493,55.078c-0.696,0,0,0.537,0,0.537 C382.609,55.925,382.576,55.078,381.493,55.078z M307.384,70.925c0.974-0.235,0.242,0.529,0.268,0.537 C307.651,71.462,307.005,71.008,307.384,70.925z M344.706,49.975c0.974,0,0.537,0.537,0.537,0.537L344.706,49.975z M332.624,61.524 c-2.132,0.428-1.636,3.761-0.536,4.835c0.25,0.252,0.376,0.118,0.805,0.269c-0.169-0.344-0.688-0.554-0.805-0.805 c-0.504-1.066-0.092-1.721,0-2.955c0.56-0.252,0.946-0.319,1.608-0.537c-0.023-0.042-0.318-0.545-0.267-0.538 c0,0,0.763-0.042,0.267,0.269C334.595,62.28,333.755,61.289,332.624,61.524z M420.347,76.35c-0.164,0.709-0.417,1.091-0.42,1.82 c-0.001,0.604,0.166,0.931,0.275,1.526c-0.239-0.017-0.58,0.146-1.118,0.093c-0.546-0.059-1.979-0.537-2.954-0.269l-0.537,0.537 c-0.562,0.034-0.854-0.529-1.074-0.537c-0.293-0.017-0.654,0.504-0.806,0.537c-0.779,0.134-0.737-0.47-1.342-0.269 c-0.923,0.294-1.787,2.35-3.758,1.88c0,0,0.427-0.89,0.534-1.075c-0.359-0.185-0.787-0.285-1.074-0.537 c-0.964,2.652-0.408,1.779-2.952,1.88c0.218,0.21,0.897,0.57,1.075,0.806c0.359,0.495,0.117,0.94,0.535,1.343 c0.128,0.126,0.613-0.075,0.807,0c0.242,0.092,0.301,0.906,0.535,1.075c0.328,0.226,0.757,0.017,1.074,0.269 c0.195,0.151,0.312,0.965,0.537,1.074c0.958,0.461,0.958-0.294,1.882,0c0.135,0.042,0.386,0.722,0.536,0.806 c0.688,0.378,1.25-0.108,1.61,0c0.319,0.092,1.099,0.949,1.613,1.075c0.585,0.134,2.633,0.167,3.758,0.537 c0.386-0.377,0.864-1.444,1.342-1.612c0.379-0.143,0.956,0.134,1.343,0c0.537,0.529,0.58,1.821,0,2.686 c-0.185,0.26-1.066,0.328-1.343,0.537c0.371,0.21-0.327,1.083,0.806,0.806c0.365,0.014,1.044-0.072,1.478-0.135 c0.218,1.638,0.026,2.714,0.575,4.328c0.393,1.156,0.971,1.657,1.398,2.8c0.965,2.575,0.148,4.338,0.84,7 c0.604,2.326,1.605,3.422,2.238,5.74c0.455,1.664,0.578,3.234,0.819,4.941l-2.099,0.56l-1.959,0.279l-0.42,1.259l-1.956,1.259 l-0.562,1.398l-3.215-0.699l-2.378,0.419l0.839-1.398l0.77-0.419l-0.49-1.958l-1.817-1.398l0.14-1.539l-1.959-2.098l-0.978-1.818 l-2.798-0.14l-2.797,0.839l-1.258,2.098l-1.26-0.14l-1.398,0.839l-1.118-0.699l-1.679,0.419l-2.098-1.258l-1.818,0.559 l-1.678-0.419l-0.698,1.818l-1.679,1.678l0.559,2.657l-1.398-0.14l-0.559,1.538l-2.098,0.14l-1.538,2.657l-1.258,0.279 l-0.562-1.538l-2.097,0.14l-2.798,1.539l-0.139,1.818l-1.959,0.839l-1.538-1.818l-2.798,0.699l-1.537,1.818l-2.658,2.797 l-1.957-1.539l-1.539-0.14l-1.677,0.979l-1.679-0.979l-1.959,0.419l-1.817-0.839l0.14-1.259l-1.677-0.699l-1.54-0.14l-0.139-1.259 l-1.259-0.419l-1.12,0.699l-1.537-0.42l-1.68-0.419l-1.117,0.56l-1.398-0.699l-1.118-0.419l-1.261-0.7l-0.979-0.699l-1.398-1.398 l-1.398-0.419h-1.539l-0.979-0.839l-0.979-1.958l-1.397,0.28l-1.12,0.979l-1.258-0.7l-1.119,0.28l-1.398,1.119l-0.979-2.098h-0.84 v1.678l-1.119,1.259l0.279,1.259l-1.258,0.559l-1.678-0.14l-0.698,1.259l-2.099-0.14l-1.538-1.258l-1.12,0.559l-1.397-0.559 l-1.12,2.657l-1.537,1.539l-1.817-1.119l-2.798,0.279l-1.539,0.979l-1.258,1.958l0.699,1.678l1.258-0.28l0.7,1.259l-0.979,0.699 l0.839,0.979l0.419,1.678l0.979,0.419l0.979,1.259l0.979-0.14l0.698,1.119l-0.978,0.839l-2.238-0.419h-1.537l-2.099-0.28 l-1.538-0.28l-1.958-0.699l-1.959-0.28l-0.908,0.909l-0.84,1.049l-1.748-0.07l-1.258-1.748l-1.119-1.398l-0.419-1.398l-0.841-0.909 l-1.258-0.839l-0.979-0.629l0.419-1.818l-0.838-0.979l-1.679-0.14l-1.888-0.56l-1.05-0.979l-0.84-1.538l-0.838-1.958l-1.26-1.398 l0.279-2.238l-1.537-0.699l-1.817-0.419l-0.42,1.259l-0.139,1.398l-1.681,0.28l-1.815-0.839l-1.681-0.559l-0.978-1.119 l-0.141-1.398l-1.399-0.14l-0.979-0.699l-1.258-0.839h-1.118l0.141-1.258l0.279-1.958l0.419-1.259l2.099-0.14l0.699-0.979 l1.816,0.14l1.4-1.119l0.838-0.56l0.699-1.119l-0.279-1.818l0.14-1.539l0.979-0.14l0.42,0.839l1.399,0.419l0.872-0.489l0.704,0.618 c0.149-0.125,0.083-0.671,0.267-0.806c0.318-0.252,0.746-0.36,1.074-0.537c-0.387-1.267-0.277-1.938-1.074-2.686 c-0.059-0.05-0.041-0.999,0-1.075l0.463-0.129l0.245-0.07l0.104-0.35c-0.025-0.101,0.102-0.894-0.275-0.525 c-0.192-0.621,0.024-0.322-0.145-0.943l-0.699-2.098l-1.397-0.42l-1.819,0.14l-1.677-1.678l-0.979-1.119l-1.538-1.538l-0.279-2.238 v-2.377l0.559-1.818l1.817-1.259l1.12-1.119l1.31-0.577L282,80l0.54-0.822l0.474,0.367l-0.421,0.594l0.263,0.367l0.438,0.105 l0.751-0.018l0.279-0.28l0.228-0.262l0.141-0.524l-0.191-0.245l-0.247-0.052l-1.119-0.56l-0.278-1.119l-0.071-0.839 c1.285-0.395,1.399-0.266,2.312-0.954c0.352-0.269,0.68-1.142,1.075-1.343c0.504-0.269,0.872,0.017,1.342-0.269 c0.284-0.185,0.504-0.948,0.806-1.075c1.436-0.638,2.912-0.226,4.298-0.268c0.176-0.008,1.5-0.503,2.146-0.269 c0,0,1.241,1.822,1.343,1.88c0.611,0.327,0.746-0.143,1.073,0c-0.1,1.653,0.017,2.148,0.269,3.491 c2.174-0.411,2.073-0.318,2.953-1.88c0.991,1.586,0.975,1.394,2.954,1.343c0.546,1.453,0.763,1.578,1.88,2.417 c0.169-0.277,0.898-1.796,1.074-1.88h0.268c0.202-0.738-0.168-1.678,0-2.417c0.025-0.126,0.771-0.428,0.807-0.538 c0.135-0.554-0.05-0.965,0-1.611h-0.538c-0.133,0.277,0.101,0.772,0,1.075c-0.066,0.167-0.703,0.369-0.806,0.537 c-0.359,0.571-0.007,0.89-0.268,1.612c-0.109-0.084-0.654-0.604-0.806-0.537c0.185-0.965,0.338-1.796,0.538-2.686h-0.538 c-0.125,0.864-0.15,1.611-0.269,2.686c-0.15,0.025-0.68,0.604-0.537,0c-0.536,0.033-0.177-0.202-0.269-0.537 c-0.838,0-0.158,0.319-0.537,0.537l-0.805-0.269c-0.066-0.529-0.051-1.494,0-1.343c0-0.042,0.008-0.806,0-0.806 c0.376-0.302,2.735-2.099,2.954-2.149c0.754-0.201,1.492,0.269,1.879,0.269c0,0.479-0.127,1.142,0,1.612l1.342-1.074 c0.135-0.294-0.149-0.797,0-1.074c0.471,0.033,0.252,0.318,0.538,0.537c0.722-0.403,1.183-0.428,1.879-0.806 c0-0.47-0.175-1.191,0-1.611c0.101-0.26,0.646-0.21,0.806-0.537c0.052-0.118,0.402-0.21,0.537-0.269c0-0.512-0.102-1.117,0-1.612 l-0.537-0.269c-0.327,0.461-0.352,1.058-0.806,1.343c-0.326,0.202-0.595-0.042-0.805,0.268c-0.202,0.277-0.036,0.881-0.271,1.075 c-0.527,0.411-1.082-0.025-1.342,0c-0.311,0.789-0.033,0.571-0.537,1.074c0.117-0.663,0.143-1.284,0.271-1.611 c0.14-0.403-0.018-0.596,0.267-0.806c0.304-0.235,1.436-1.301,1.612-1.343c0.276-0.084,0.813,0.134,1.073,0 c0.294-0.168,0.754-1.242,1.074-1.343h0.537c0.486-0.487,0.68-1.612,1.342-1.88c0.437-0.185,1.133,0.051,1.611,0 c0.487-0.067,1.418-0.596,2.148-0.537l0.537,0.537c0.89,0.235,3.465,0.328,4.027,0.269c1.712-0.209,3.322-2.065,5.102-2.417 c1.492-0.302,2.309-0.16,3.49-0.537c-0.721,0.016,0.991,0.629,0.268,0.268c0.371,0,1.008,0.126,1.345,0 c0.924-0.377,2.089-3.45,2.954-4.029c0.502-0.353,0.713,0.009,1.359-0.269c0.779-0.344,1.459-1.51,2.132-1.88 c0.468-0.269,0.854,0.042,1.342-0.269c1.596-1.041,2.257-4.154,3.222-5.909c0.268-0.495,1.149-1.779,1.612-2.148 c0.333-0.285,0.829-0.176,1.074-0.537c0.301-0.47,0.005-0.999,0.268-1.612c0.033-0.092,0.729-0.655,0.804-0.806 c0.263-0.612,0.01-1.217,0.271-1.879c0.099-0.277,0.661-0.781,0.805-1.075c0.218,0.487,0.824,1.31,1.343,1.611 c0.336,0.185,1.099,0.034,1.609,0.269c0.229,0.101,0.64,1.133,0.807,1.343c0.008-0.008,0.863-0.302,0.537-0.269 c-0.52,0.034-1.066-0.848,0.537-0.806l1.342,0.537c3.465,0.47,5.992-0.579,9.129-0.268l0.807,0.537 c0.722,0,0.294-0.461,0.537-0.537c0.169-0.067,1.141,0.084,0.805,0.268c-0.846,0.437-1.459,1.461-2.415,1.612 c-0.471,0.067-0.739-0.261-0.808-0.269c-2.13-0.395-2.709,1.116-4.832,0.269c-0.368-0.151,0.336-1.024-0.806-0.806l-0.268,0.806 c-0.158,0-0.655-0.093-0.806,0l0.269,0.537c0.427,0.16,0.63,0.149,0.783,0.14c0,0-0.246,0.095-0.515,0.129 c0.166,0.621,0.411,1.317,0.536,1.88h0.269c-0.094-0.017,0.244-0.504,0.27-0.538c0.293,0.176,0.695,0.646,1.072,0.538v-0.269 c0.412-0.202,0.916-1.385,0.537-0.269v0.538c0.025,0.05,0.713,0,0.805,0c0.119,0.881,0.119,1.359,0.27,2.417 c0.328-0.151,0.42-0.764,0.537-0.806c0.445-0.202,1.133,0.151,1.611,0c0.076-0.034,1.284-1.251,1.342-1.343 c0.555-1.041,0.127-1.956,1.075-2.686c0.093-0.084,0.68,0.024,0.806,0c0.312-0.084,0.479-0.772,0.805-0.806 c0,0,0.706,0.419,1.074,0.269c0.201-0.092,1.074-1.343,1.074-1.343c0.529-0.318,0.841,0.017,1.344-0.268 c-0.018,0.092,0.191,0.932,0.269,1.343c-0.991,0.235-0.077,2.51,0.267,2.686c0.329,0.168,2.039,0.252,2.149,0.269 c-0.125,0.386,0.117,0.948,0,1.343h-0.537c0.017,0.235,0.208,1.57,0.269,1.343v0.537c0.252,0.335,0.896,0.613,1.073,1.075 c0.229,0.621,0.202,1.679,0.269,2.148c0.285,0.059,0.42,0.496,0.537,0.537c0.556,0.185,1.291-0.092,1.879,0l-0.268,0.269 c0.084,0-0.251,0.496-0.27,0.538c0.629,0.118,0.438-0.395,1.077-0.269c0.15,0.025,0.317,0.437,0.805,0.537l0.267,0.806 c1.779,0.705,2.467-0.327,3.492,1.343c0.789,1.293-0.203,1.738,1.609,2.418c0,0,0.202,0.94-0.268,0.537c0,0.059-0.06,0.764,0,0.806 c0.26-0.177,0.512,0.108,0.808,0c0.114-0.051,0.577-0.68,0.804-0.806c-0.05-0.059-0.587-0.789-0.537-0.806 c0.369,0.312,0.721,0.496,1.072,0.806c-0.41,0.201,0.715,0.277,0.807,0.269c0,0-0.352-0.504,0.271-0.806 c0,0,0.427,0.881,0.536,1.074c-0.127,0.109-0.646,0-0.807,0c-0.116,0.294-0.862,1.343-0.267,1.343l0.537-0.269 c0.845,1.142,1.4,2.182,1.878,3.761c-0.394,0.066-0.723,0.226-0.807,0.268l2.148,0.537c-0.092-0.26,0.52-0.411,0.27-0.537 c-0.747-0.378-0.529-1.242-0.806-2.148c0.746-0.202,1.603-0.252,2.685-0.538c0.187-0.059,0.672-0.772,0.808-0.806 c0.88-0.277,1.593,0.017,2.416-0.269c1.114-0.403,2.013-1.839,2.952-2.417c0.27-0.177,0.798-0.101,1.074-0.27v0.538 c0.293-0.487,0.27,0.538,0.27,0.538c-0.546,0.369-0.512,0.159-0.807,0.805c0.856,0.42,1.838,1.209,2.687,1.611 c-0.103,0.286-0.462,0.311-0.271,0.807c0.084,0.209,0.657,0.461,0.805,0.805c0.145,0,0.665-0.092,0.808,0 c-0.438,1.637-0.479,2.225-0.808,4.029c-0.654,0.151-0.838-0.017-1.342,0.269v0.537c0.025,0.025,0.774,0.252,0.808,0.269 c0.092,0.478,0.504,0.646,0.534,0.806c0.12,0.629-0.395,0.436-0.268,1.074c0.462,0.118,0.135-0.436,0.808-0.269l2.146,1.343 c0.379,0.537,0.06,1.444,0.538,1.88c0.359,0.327,0.812-0.009,1.342,0.268c0.797,0.412,0.69,1.478,1.072,2.417 c-0.352,0.193-1.283,0.495-1.609,0.806c-0.269,0.244-0.051,0.798-0.269,1.075c0,0-2.081,1.175-0.805,1.343 c0,0,0.771-0.268,0.805-0.268l0.269-0.538c0.294-0.118,0.771,0.101,1.074,0c0,0,0.252-0.529,0.268-0.537 c0.253-0.227,0.891-0.269,1.074-0.537c0.488-0.747,0.136-2.737-0.268-3.492c-0.145-0.26-1-0.537-1.074-0.806 c-0.268-0.958,0.193-1.771,0.268-2.417c2.628,0.495,1.503-0.353,2.416,1.88c-0.461-0.235-0.25,1.074-0.268,1.343 c0.571-0.428,0.242-0.319,0.538-1.075c0.778-0.117,2.642-0.05,2.148,0c0.073,0.059,0,0.949,0,1.075 c0.485,0.125,0.36-0.21,0.536,0.269c0-0.009,0.469-0.235,0.537-0.269c0,0-0.025-3.156,0-2.955 c-0.269-0.688-0.537-1.436-0.806-2.149c-0.058,0-0.779,0.042-0.806,0c-0.311-0.554,0.026-1.209-0.27-1.88 c-0.545-1.225-2.414-1.023-3.76-1.074c0.078,1.955-0.123,2.367-1.072,3.76c-0.654-0.159-0.832,0.143-1.342,0.269 c0.024-0.269-0.236-1.259,0.268-1.075c2.408-4.448-1.309-1.578-2.418,0c-0.402-0.075-1.258-0.294-1.342-0.268 c0.176-0.278-0.15-0.513,0-0.806l1.075-0.806c0.445-1.25,0.21-2.224,0.537-3.492c-0.394-0.377-0.94-0.713-1.345-1.074 c0.069-0.202,0.278-0.789,0.271-0.806c-0.16-0.235-0.85-0.076-1.076-0.269c-0.68-0.587-0.218-1.83-0.268-2.417 c0.201-0.05,0.958-0.529,1.072-0.538c2.225-0.21,2.107,3.5,3.225,4.566c0.486,0.462,3.6,2.208,4.295,2.417 c0.746,0.218,1.326-0.05,1.879,0.269c0.539,0.302,0.925,1.393,1.344,1.88C413.073,69.896,417.938,74.636,420.347,76.35z", farbe:'$V->{'Mecklenburg-Vorpommern'}' }, ni: { name:"Niedersachsen", text: "$V->{'Niedersachsen-text'}", cords: "M216.556,229.43l-1.119,0.14l-1.259,0.14 l0.419-1.678l0.28-1.259l-0.28-1.678l-0.28-1.119l0.42-1.258l1.678-1.399l0.979-1.258l-0.699-2.098l1.119-1.539l0.14-0.979 l-1.119-0.56l-1.119,0.42l-2.098-0.42l0.699-1.398v-1.958l-1.258-1.119l-1.119,0.28l-0.699-1.538l0.979-1.399l-1.398-0.979 l-1.398,0.14l-1.259,0.699l-1.538-0.839l0.559-1.259l-0.699-1.119l0.979-0.42l-0.419-1.538l-0.699-1.539l0.56-1.678l-1.818-1.258 l0.56-1.259l-1.259-1.259l-2.098-0.419l-1.539,0.56l-1.119-1.678l0.56-1.678l0.839-0.42v-1.258l1.398-0.839l-2.937-1.818 l-1.398-0.419l0.279-2.377l1.958-2.238l2.377-0.56l1.958-2.237l0.979-2.098l-0.839-2.238l1.398-2.377l-2.377-1.539l-2.377,1.539 l-2.657,2.517l-1.539,1.958l-3.216,0.56l-2.797-0.419l-3.356,0.14l-0.14-4.755l-0.699-3.077l-1.539-1.398l-3.496,1.678l-2.517-0.56 l-1.678,1.259l0.14,1.678l-1.958,0.979l-2.657-0.56l-2.098,0.14l-0.419,2.518l2.518,1.678l2.237,1.398l0.979,3.776l0.28,3.916 l-0.56,3.356l1.958,1.119l-0.56,1.678l-3.216,1.258l-0.979,1.818l-1.818-1.398l-1.678,0.279l-2.098-0.559l-2.237,1.538 l-1.678,2.518l-3.217,0.839l-4.195-0.699l-1.398,2.098l-3.217-1.258l-0.839-3.776l3.356-0.56l1.678-0.979l0.419-2.937l-2.657-0.699 l-1.258-2.237l0.559-2.238l1.539-0.979l-0.979-1.258l0.14-1.958l1.259-0.56l-0.699-1.958l0.14-1.258l-1.538-1.259l-2.518,0.839 l-2.098-0.14l-2.797-1.678l-0.419-2.377l-1.119-1.818l-3.077-1.539l-1.398,2.797l1.678,1.259l-0.979,1.678l-2.797,1.398 l-5.035,2.377l-2.237,1.398l-0.839,1.818l-1.678,0.559l-0.979,0.979l-8.111-0.14l-3.077,0.419h-1.538 c0.636-1.136,0.654-2.756,0.699-3.636c0.082-1.591-0.193-2.083,0.839-2.937c0.897-0.742,0.245-1.457,0.56-2.377 c0.437-1.28,0.625-1.793,0.28-2.657c-1.119-2.797-1.012-4.497-1.501-5.719c-0.292-0.731-0.948,1.413-1.679,1.12 c-2.798-1.12-5.596,0-6.436-2.52c-0.256-0.769-2.519-2.94-0.7-2.52c1.328-0.152,2.099-2.1-0.138-1.963 c-0.034-1.434,0.265-2.517,1.118-2.517c0.811,0,1.898-1.039,1.893-1.045l-0.214,0.206c-0.56,0.56,0.979-0.42,1.959-0.84 c2.121-0.91,6.295,0.98,7.415,0c0.894-0.782,0.994-4.087,1.539-6.72c0.921-4.448,1.959-11.2,1.959-11.48 c0,0,2.846-6.256,3.637-7.84c0.839-1.68-0.018-7.341-0.042-12.034c0.591-0.001,1.371-0.053,2.237-0.053 c0.47-1.042,0.554-1.981,0.805-2.686v-0.538c-0.159-0.293-0.729-0.101-0.537-0.805c0.05-0.227,1.435-1.142,1.611-1.344 c-0.227-0.025,0.579-0.302,0.805-0.268c0.403,0.05,1.586,0.235,2.417,0.268c0.117,0.286-0.109,0.772,0,1.075 c0.067,0.202,1.854,1.67,2.148,1.88c-0.428,1.586-0.495,2.417,0.806,3.492c1.468,1.208-0.185-0.898-0.269-1.343 c-0.177-0.865,0.26-2.132,0-2.955c-0.109-0.328-1.125-0.797-1.343-1.074c-0.335-0.428-0.109-0.428-0.269-1.075 c-0.923-0.235-2.744-1.007-3.759-1.074c-0.537-0.042-0.479,0.369-0.806,0.268c-0.412-0.125-0.772-0.931-1.074-1.074 c-0.277-0.135-0.789,0.075-1.074,0l-0.537-0.538c-0.638-0.168,0.075,0.302-0.537,0.269l-0.806-0.538 c-0.789-0.083-0.932,0.051-1.879,0c0,0,0.981-0.529,0.805-0.537c-1.468-0.134-2.567,0.562-3.491,1.075 c-0.167-0.629,0.428-0.453,0.269-1.075c-0.059-0.218-0.99-0.764-1.074-1.074c-0.68-2.484,0.965-8.553,2.148-8.864 c1.242-0.335,3.524,0.764,4.565,1.075c0.344-1.569,0.663-1.175-1.074-1.343c0.025-0.059,0.318-0.529,0.268-0.538 c0.521-0.646,1.167-1.125,1.611-1.88c0.168-0.302,0.722-1.108,0.806-1.343c0.151-0.495-0.243-0.437-0.269-0.537 c-0.78,1.377-1.107,1.595-2.417,2.417c-0.202-0.151-0.344-0.663-0.537-0.806c-0.428-0.327-0.948-0.193-1.343-0.538 c-0.117-0.101-0.15-0.697-0.268-0.806c0.318-0.277,0.805-0.512,1.074-0.806V94.83c1.04-0.587,2.265-1.502,2.953-2.417 c0.286-0.395,0.168-0.797,0.537-1.075c0.461-0.36,1.041-0.209,1.611-0.537c0.327-0.202,0.629-0.965,1.074-1.075 c1.77-0.47,4.069,0.16,5.907,0c0.344-0.033,2.064-0.579,2.417-0.537c1.334,0.151,1.527,1.645,2.953,1.612 c0.302-0.017,1.544-0.982,1.88-1.075c0.973-0.285,1.359-0.059,2.417-0.268l0.805-0.538c1.956-0.412,3.541,0.151,4.833,0 l0.806-0.537c0.822-0.176,2.315,0.252,2.685,0.269c2.174,0.084,4.733-0.705,6.982,0c0.167,0.05,0.545,0.403,0.805,0.537 c-0.109,2.677,0.209,4.717,1.88,6.983c0.319,0.437,1.745,1.586,1.879,2.149c0.034,0.151-0.461,1.847-0.268,1.343 c0.26,0.419,0.587,0.73,0.806,1.075l0.269,2.148c0,0-3.298-0.033-4.028,0c0,0.252,0.151,1.469,0,1.611 c0.159,0.429,0.906,1.444,1.074,1.88c0.193,0.008,0.185,0.562,0.269,0.806c0.914-0.621,1.661-1.394,2.685-0.537 c0.637,0.537,1.023,3.055,1.879,3.492c1.3,0.663,3.155-0.411,3.49-1.343c0.143-0.411-0.209-0.982,0-1.343 c0.319-0.588,1.192-1.192,1.612-1.88c0,0-0.428-0.663-0.537-0.269v-0.537c0.847,0.479,0.335-1.847,0.268-1.88 c0.335-0.176,0.655-0.176,0.805-0.537c-1.334-0.042-2.5,0-4.296,0c0.059-0.294,0.495-0.428,0.537-0.537 c0.168-0.503-0.067-1.083,0-1.611c0.21-1.738,0.923-2.972,2.148-3.761l0.269-0.537c0.461-0.143,0.872,0.134,1.342,0 c0.764,0.764,1.578,1.41,2.417,2.149c0.134,0.117,0.076,0.705,0.269,0.806c0.353,0.185,0.94-0.109,1.342,0 c0.454,0.109,0.974,0.898,1.343,1.075c1.502,0.696,2.71,0.839,4.028,1.611c-0.159,0.134,0.092,0.873,0,1.075 c-0.084,0.15-0.898,0.15-1.074,0.268c-0.563,0.344-1.561,1.855-1.88,2.417c-1.032,1.763-0.143,2.115-0.537,4.566l-0.537,1.074 c-0.042,0.798,0.445,2.401,0.806,2.686c0,0,0.813,0.042,0.268,0.269c-0.419,0.167-0.353,0.722-0.537,0.806 c0.353,0.125,0.377-0.419,0.537-0.537c0.017,0.059,0.428,1.242,0.537,1.343c-0.109,0.202-0.21,0.554-0.269,1.075l-0.805,0.268 c-0.042-0.537,0.042-1.091,0-1.611c-0.134-1.569,0,2.241,0,2.417c-0.067,1.309-1.544,3.123-1.343,4.297 c0.009,0.059,2.769,2.862,2.954,2.955c0.386,0.176,1.074-0.269,1.074-0.269c-0.21-0.134-0.604,0.076-0.805,0 c-0.16-0.067-2.106-2.434-2.148-2.686c-0.353-2.082,1.292-4.834,1.61-6.446c0.034-0.209-0.21-1.343,0.269-1.074 c0,0-0.201-0.898-0.269-1.074c-0.344-0.89-0.763-5.112-0.537-6.178c0.143-0.714,1.972-2.25,2.686-2.417 c0.193-0.05,0.612,0.109,0.805,0c0.252-0.16,0.235-0.629,0.537-0.806c-0.344-1.352-0.797-2.384-1.074-3.492 c-0.21-0.797,0.067-1.427-0.269-2.148c-0.126-0.277-0.915-0.546-1.074-0.806c-0.588-0.948-1.863-4.961-1.612-6.447 c0.025-0.21,0.713-0.889,0.806-1.074c0.319-0.713,0.193-1.393,0.537-2.148c0.16-0.37,1.435-1.981,1.611-2.417 c0.839-2.174,0.881-4.003,2.148-5.641c0.419-0.545,1.653-1.762,2.417-1.88c0.697-0.118,1.284,0.101,1.611,0.269 c0.512,0.261,0.402,1.007,0.806,1.343c0.218,0.185,0.805-0.134,1.074,0c0,0,1.25,1.88,1.879,2.149 c0.454,0.193,0.059-0.302,0.537-0.269c0.286,0.017,1.317,0.73,1.611,0.807c1.351,0.327,2.526,0.411,4.028,0.268 c0.889-0.092,2.324-1.007,3.76-0.537c0.385,0.125,0.512,1.175,0.805,1.343h0.537c-0.243-0.68-0.218-0.696-0.537-1.611 c0.503-0.193,1.385-0.756,1.879-0.806c1.024-0.109,7.225,0.688,8.055,1.075c0.378,0.176,0.974,0.243,1.343,0.537v0.537 c0.629,0.353,1.687,1.184,1.879,1.88c0.076,0.285-0.134,0.806,0,1.074c0.303,0.612,1.326,1.393,1.611,2.148 c0.235,0.622-0.042,0.831,0.269,1.344h0.537c0.227,0.125,0.353,1.091,0.537,1.343c0.454,0.612,1.158,0.931,1.88,1.343v0.537 c0.167,0.084,0.688-0.143,0.805,0c0.419,0.521,0.261,1.184,0.538,1.88c0.26,0.672,0.906,2.527,1.342,3.223 c0.294,0.479,1.426,0.814,1.611,1.343v0.537c0.814,0.772,1.905,0.713,2.954,1.343c0.688,0.412,1.242,1.654,2.148,1.88 c0.637,0.151,1.989-0.386,2.434-0.268l1.114,0.666v2.377l1.119,0.56v2.937l1.259,0.979l0.839-0.56l0.699-0.699l1.119,0.419v1.119 h1.678l0.699,0.7l1.398-0.839l0.56,0.839l0.839-0.979l0.28-1.678l1.119,0.14l0.979,1.119l1.119,0.14l1.678,0.979l1.119,0.979 l1.678-0.28l0.699-1.398l1.258-0.699h1.958l1.4,0.839l1.967,1.259l1.538,0.419l2.237,0.56l1.397,1.119l2.1,0.419h2.674h1.102 l1.258,0.839l0.979,0.699l1.399,0.14l0.141,1.398l0.978,1.119l1.681,0.559l1.815,0.839l1.681-0.28l0.139-1.398l0.42-1.259 l1.817,0.419l1.537,0.699l-0.279,2.238l1.26,1.398l0.838,1.958l0.84,1.538l1.679,0.979l1.259,0.56l1.679,0.14l0.838,0.979 l-0.419,1.818l0.979,1.119l1.54,0.14l0.559,1.119l0.419,1.398l1.119,1.398l0.979,1.119l1.258,0.699l1.259-0.699l1.258-1.259 l1.959,0.28l1.958,0.699l1.538,0.28l2.099,0.28h2.376l-1.119,1.119l-0.279,0.979l-1.677,0.56l0.559,1.258l-1.259,0.979 l-1.538-0.979l-0.979,1.539l0.42,1.678l-1.12,1.398l-1.397,0.28l-1.54,2.098l-2.097,1.259l-2.519,1.119l-0.419-0.979l-1.537-0.28 l-1.399,0.42l-0.699-1.398l-1.259-0.14l-1.538-0.839l-0.281,1.398h-2.235v-1.398l-4.058,0.419l-0.699,2.657l-0.979,0.979 l-1.539,0.14l-1.117,0.979l-1.119-0.699l-3.356,0.14l-0.42,1.678l-0.419,0.699l0.28,1.818l0.838,2.098l0.56,2.098l1.399-0.14 l0.42,1.398l0.698,1.119l1.119,2.238l1.117,1.258l1.68-0.419l1.258,0.56l-0.559,1.538l-0.979,0.699l-0.14,2.098l0.559,1.818 l1.261,1.538l-0.142,1.398l-1.398-0.14l-0.978,0.56l0.419,1.258l1.258,1.678l0.979,1.119l1.54,0.839l1.817,0.979l1.399,1.539 L290.268,183l-2.378,1.259l0.841,2.238l-1.399,1.398l1.258,0.979l-0.839,1.818l1.68,0.28l-0.282,1.398l-2.097,0.699l-0.559,1.678 l1.397,0.419l0.699,0.979l-0.279,1.398l-1.538,1.259l-2.099,0.699l-0.979,1.259l0.279,0.979l-0.978,1.258l-2.099-0.14l-1.817,0.28 l-3.077,0.419h-2.098l-2.379-0.14l-0.979,1.258l-0.979,1.398l-1.397,0.56l-1.679,0.28l0.418,1.678l0.84,0.979l0.7-0.419 l0.699,1.119l1.397-0.699l0.141,1.119l-2.237,0.979l0.56,1.259l0.979,1.119v1.119l-0.979,0.839l-1.539,0.979l-0.84,0.979 l0.279,3.356l0.981,0.839l0.838,1.119l0.56,1.259l0.838,2.377l0.42,1.818l1.678,1.678l-1.816,1.958l-0.979,1.538l1.259,2.518 l-0.141,1.119l-1.258-0.28l-1.397-1.398l-1.54-0.14l-2.098,0.419l-1.817-0.839l-1.823-0.699l-2.104,0.699l-0.42,1.538l-1.258,1.539 l-0.839,0.979l-1.958,0.279l-0.839,2.238l-2.377,1.119l-1.259-1.119l-0.839,1.818l-0.699,2.377l-1.539,0.14l-1.398-0.56 l-1.538,0.839l-1.259-1.399l-0.979,0.7l-1.119,0.279l-1.119,0.979l-0.839-0.699l-0.56-1.678l-1.398,0.979l-1.119-0.839l0.699,3.216 l-0.699,0.28l-1.539-2.797l-1.818,1.119l-3.217,0.979l0.56,1.818l1.678-0.559l0.14,1.958l-1.818,1.259l-3.216-1.678h-0.979 l-1.398-0.559l-1.678-1.259l0.699-1.259l1.958-0.979l0.979-1.259v-1.678l-0.979-2.518l-0.559-1.538l0.28-1.399l0.279-1.678 l-0.979-1.958l1.958,0.28l-0.14-2.657l1.538,1.958l0.699-0.419l-1.398-2.237l-1.258-0.28l-0.28-1.259l-1.678,0.979h-1.119 l-0.42-0.839l-2.098,0.699l-0.839-1.539l-1.539,0.14L216.556,229.43z M107.601,92.144c1.233-0.243,2.132,0.327,2.954,0.537 c-0.067,0.235-0.269,1.074-0.269,1.074c-1.141,0.403-1.637,0.361-2.686,0.806c0,0,0.563,0.965,0.269,1.075 c-1.435,0.487-2.039-0.504-2.685-0.806c0-0.244,0.101-0.856,0-1.075c0.277-0.252,0.621-0.428,0.805-0.806 c0.16,0,0.638,0.084,0.806,0C106.971,92.849,107.341,92.186,107.601,92.144z M114.313,91.338c0.21,0.328,0.571,0.403,0.806,0.806 c0.437,0.772,0.084,0.269-0.806,0.269C114.313,92.295,114.39,91.388,114.313,91.338z M119.415,88.652 c1.091-0.118,5.991,0,3.76,0.537c-1.217,0.285-2.039,0.202-3.491,0.269c-0.034,0.05-0.269,0.537-0.269,0.537 c-1.627,0.16-2.676-0.244-4.296,0v-1.074C116.613,89.038,118.006,88.795,119.415,88.652z M126.934,86.503 c1.074-0.31,3.113,0.26,3.759,0.269c1.024,0.008,2.375-0.806,2.954,0.269c0.101,0.193,0.612,0.05,0,0.268 c-0.302,0.101-1.435,0.772-1.611,0.806c-1.661,0.26-2.509-0.738-3.222-0.806c-0.286-0.033-3.827,0.94-2.417-0.268 C126.439,86.999,126.909,86.503,126.934,86.503z M136.601,85.966c1.661,0.025,0.562,0.705,1.342,1.343 c-0.679-0.101-3.197-0.092-2.416,0C134.578,87.88,134.938,85.933,136.601,85.966z M141.165,84.623 c1.662-0.201,3.08,0.311,4.296,0.538c-0.066,0.176-0.268,0.806-0.268,0.806c-1.292-0.151-3.155-0.269-4.833-0.269l-0.269,0.537 c-0.168,0.051-0.864-0.176-0.537-0.269c-0.579,0-0.235-0.696,0-0.806C139.755,85.06,140.963,84.64,141.165,84.623z M155.396,83.28 c0.738,0.025,1.669,0,2.416,0c-0.235,0.017,0.269,0.806,0.269,0.806c-0.873-0.235-1.502-0.369-2.148-0.537 c-0.092,0.327,0.251,0.579-0.269,0.537L155.396,83.28z M150.025,83.28c1.318-0.151,1.947,0.21,2.954,0.537v0.538 c-0.729,0.151-0.939,0.008-1.611,0.268c-0.025,0-0.268,0.538-0.268,0.538c-0.42,0.042-1.653-0.638-2.149-0.538 c-0.226,0.042-0.235,0.42-0.805,0.538c0.109-0.193,0-0.856,0-1.075C148.599,83.927,149.547,83.331,150.025,83.28z M183.306,97.481 l1.084,0.77l0.175,1.258l0.035,1.014l1.049,3.146l1.398,1.713l1.538-0.42v-1.538l0.14-3.496v-2.238l-2.238-0.14l-1.398-0.979 L183.306,97.481z M180.614,120.487v1.678l1.468,1.678l0.839,0.699l1.329,0.629l2.028,0.909l0.489,1.258l0.14,1.189l0.275,2.659 l1.462,0.584l0.081,1.651l1.398,0.839l1.539-0.979l0.559,1.119l1.398,0.699l1.678-1.119l0.979,1.539l1.818-0.14l1.119-0.979 l-0.419-1.818l1.398-0.979l-0.14-1.818l0.28-3.077l-1.818-0.42l-1.259,1.119l-2.797-1.119l-2.518-0.559l-1.398-1.958l-3.356-0.14 l-1.538-1.119h-2.518l-1.538-1.958L180.614,120.487z M169.573,89.089c0-0.386,0.314-0.419,0.542-0.699 c0.188-0.232,0.542,0.313,0.542,0.699s-0.4,0.595-0.7,0.595C169.658,89.684,169.573,89.476,169.573,89.089z", farbe:'$V->{'Niedersachsen'}' }, hb: { name:"Bremen", text: "$V->{'Bremen-text'}", cords: "M180.614,120.487l0.979,0.07l1.538,1.958 h2.518l1.538,1.119l3.356,0.14l1.398,1.958l2.518,0.559l2.797,1.119l1.259-1.119l1.818,0.42l-0.28,3.077l0.14,1.818l-1.398,0.979 l0.419,1.818l-1.119,0.979l-1.818,0.14l-0.979-1.539l-1.678,1.119l-1.398-0.699l-0.559-1.119l-1.539,0.979l-1.398-0.839 l-0.14-1.818l-1.328-0.419l-0.35-2.657l-0.14-1.189l-0.489-1.258l-2.028-0.909l-1.329-0.629l-0.839-0.699l-1.468-1.678V120.487z M183.306,97.481l1.783-0.909l1.398,0.979l2.238,0.14v2.238l-0.14,3.496v1.538l-1.538,0.42l-1.398-1.713l-1.049-3.146l-0.035-1.014 l-0.175-1.258L183.306,97.481z", farbe:'$V->{'Bremen'}' }, hh: { name:"Hamburg", text: "$V->{'Hamburg-text'}", cords: "M180.099,72.268 c0.554,0.151,1.007,0.201,1.343,0.269C179.956,73.527,178.739,75.273,180.099,72.268z M183.589,74.954 c1.972,1.042,0.831,0.563-0.268,1.343c0.066-0.285-0.47-0.444-0.269-0.537C183.22,75.667,183.589,74.954,183.589,74.954z M259.631,109.858l-1.68-0.28l-1.539-0.14l-1.258,0.699l-0.49,1.329l-0.559,0.489l-1.329-0.14l-1.119-0.979l-1.678-0.979 l-1.748-0.49l-0.35-0.769l-1.119-0.14l-0.28,1.678l-0.839,0.979l-0.56-0.839l-1.398,0.839l-0.699-0.7h-1.678v-1.119l-1.119-0.419 l-0.699,0.699l-0.839,0.56l-1.259-0.979v-2.937l-1.119-0.56v-2.377c0.769,0.49,0.983,0.879,1.822,1.483 c0.143-0.143,0-1.385,0-1.612c0.294,0.05,1.343,0.269,1.343,0.269s0.151-0.79,0.269-0.806c-2.375-0.328-2.166,0.18-4.256-0.593 l-0.297-1.119l0.699-1.538l0.559-0.839l1.539,1.678l1.678-0.699l1.119-2.237l0.56-1.398l1.259-0.699l1.119,0.419l0.56-1.818 l1.258-0.279l2.518-0.42l0.839-0.699l0.699-1.678l1.818,0.14l0.419,1.398l-0.839,1.259l0.699,1.538l0.28,1.259l1.678,0.839 l-0.979,1.678l-0.14,1.539l-1.398,0.14l-0.419,2.098l1.119,1.259l1.259,0.14l0.839,0.279l0.699,1.259l0.419,1.539l1.259,0.419 l0.979,0.839l1.538,0.14l0.981,0.839L259.631,109.858z M239.977,102.888c-0.772-0.21,0,0.538,0,0.538 C240.472,103.526,240.262,102.963,239.977,102.888z", farbe:'$V->{'Hamburg'}' }, nw: { name:"Nordrhein-Westfalen", text: "$V->{'Nordrhein-Westfalen-text'}", cords: "M156.28,292.676l-0.419-1.574l-1.678-0.279l-1.678,0.421 l-0.56-1.818l0.42-1.398l-1.398-0.84l-0.839-1.678l-0.14-2.099l0.28-1.817l-0.7-1.119l-1.538,0.14l-1.259-0.839l-0.979-1.119 l-1.119-0.559l-0.14-1.539l0.839-1.118l-2.098-1.538l-1.259,1.119l-1.958,0.279l0.14,0.978l0.839,0.979l0.28,2.237l-1.538,0.841 l-1.259,1.119l-1.398,0.139l0.699,2.097l-1.539,0.979l-2.098-0.28l-1.678,2.379h-2.657l-4.195,1.538l-1.678-0.42l-0.839,0.979 l-0.14,1.679l-1.119,1.399h-2.098l-1.678,0.838l-1.818,0.979l-0.419-1.959l-0.839,2.518l-3.497,0.699l-2.657,1.259l-3.077,1.259 l-2.237,1.54l-2.238-0.562l-0.979,1.261v2.936l-1.258,0.84l-1.259-0.559l-0.699-0.699l-1.958,0.838l0.14,0.979l-0.28,0.98 l0.979,1.119l-0.56,0.978l0.14,1.12l1.398,0.837l-0.559,0.979l-4.475,0.699l-1.398-1.117l-0.7,0.978l-1.258-0.419l-0.56-1.258 l-0.839-0.841l-1.539,1.12l-1.538-0.279l-1.119,0.279l-1.398,0.279l-0.56-1.539l-0.699-1.398l-0.699-0.7l-0.699,0.7l0.42,1.259 l0.699,0.838l-0.42,0.699c-0.24-0.625-1.083-1.05-1.655-1.787c-0.442-0.57-0.279-2.659,0.28-4.2 c0.42-1.539-0.317-3.216-0.559-3.359c-1.399-0.841-1.655-1.945-3.078-1.962c-0.863-0.008-1.242,0.644-2.104,0.687 c-1.276,0.063-1.954,0.855-3.078-1.119c-0.829-1.458-0.022-1.654,0.285-2.646c0.355-1.146,2.291-2.713,1.539-2.661 c-1.958,0.141-2.238-0.839-3.917-0.839c-0.689,0-0.641-0.896-0.844-1.555c-0.241-0.778,0.034-1.287-0.135-2.087 c-0.21-0.986-0.691-1.427-0.984-2.394c-0.354-1.168,0.069-2.033-0.559-3.08c-0.435-0.723-0.813-1.351-1.412-1.945 c-0.109-0.655-0.761-1.538-0.263-1.681c1.959-0.559,1.226-2.284,2.239-2.1c0.845,0.154,0.65-1.062,0.84-1.82 c0.291-1.165-0.778-1.909-0.141-3.08c0.984-1.805-1.142-1.056-1.399-1.959c-0.208-0.736,0.274-1.247,0-1.961 c-0.506-1.322-2.238-0.7-3.218-1.68c-0.664-0.665,0.168-1.108,0.14-1.821c-0.035-0.887-1.365-1.398-0.419-2.239 c1.259-1.12,1.611,0.487,2.658,0.421c2.859-0.184,3.482-2.825,5.596-4.76c1.167-1.069,4.247-4.001,2.938-2.8 c-1.679,1.54,0.969-0.316,1.12-0.84c0.167-0.588-0.297-0.969-0.7-1.4c-0.5-0.535,2.658-1.261,0.979-1.681 c-0.826-0.207-2.519,2.38-2.379,0.42c0.359-0.651-0.547-1.985,0-2.799c1.743-2.591,5.397-5.053,5.317-6.021 c-0.09-1.078,0.272-4.668-0.28-5.6c-0.564-0.951-0.102-1.461-0.419-2.52c-0.356-1.186-0.333-1.914-0.705-3.094 c-0.835-2.65-4.135-4.28-3.353-6.286c0.704-1.806-3.468-3.586-2.378-5.74c0.984-1.946-2.695-4.05-2.677-8.883 c0.004-1.181,1.678-0.14,2.937-1.678c0.477-0.583,3.224-1.279,3.916-1.259c0.45,0.013,1.932,1.789,2.657,1.539 c0.688-0.238-0.979-2.517-0.14-2.937c1.091-0.546,1.818-0.14,1.399,0c-0.556,0.185,0.99,1.782,1.678,2.797 c0.486,0.718,2.016,0.557,2.657,1.259c1.487,1.625,2.32,2.699,3.077,2.517c1.001-0.24,0.596-0.146,1.565-0.494 c1.541-0.554-1.377-2.726,0.253-2.583c1.018,0.09,1.308,0.883,2.237,0.699c1.497-0.296,1.347-1.353,2.518-1.818 c1.499-0.597,4.884-1.43,5.625-1.059c0.696,0.348,2.742-0.473,4.197-1.4c1.302-0.829,0.7-1.26,2.798-2.8 c1.699-1.247-1.399-4.76-3.917-5.601c-0.765-0.669,0.776-0.478,1.399-1.12c0.889-0.917-0.149-1.411,0.56-1.54 c1.539-0.28,2.358-0.986,3.498-1.12c2.378-0.28,2.099-5.74,5.456-7.14c0.655-0.273,2.046-1.243,2.819-2.343l1.48,0.069l3.077-0.419 l8.111,0.14l0.979-0.979l1.678-0.559l0.839-1.818l2.237-1.398l5.035-2.377l2.797-1.398l0.979-1.678l-1.678-1.259l1.398-2.797 l3.077,1.539l1.119,1.818l0.419,2.377l2.797,1.678l2.098,0.14l2.518-0.839l1.538,1.259l-0.14,1.258l0.699,1.958l-1.259,0.56 l-0.14,1.958l0.979,1.258l-1.539,0.979l-0.559,2.238l1.258,2.237l2.657,0.699l-0.419,2.937l-1.678,0.979l-3.356,0.56l0.839,3.776 l3.217,1.258l1.398-2.098l4.195,0.699l3.217-0.839l1.678-2.518l2.237-1.538l2.098,0.559l1.678-0.279l1.818,1.398l0.979-1.818 l3.216-1.258l0.56-1.678l-1.958-1.119l0.56-3.356l-0.28-3.916l-0.979-3.776l-2.237-1.398l-2.518-1.678l0.419-2.518l2.098-0.14 l2.657,0.56l1.958-0.979l-0.14-1.678l1.678-1.259l2.517,0.56l3.496-1.678l1.539,1.398l0.699,3.077l0.14,4.755l3.356-0.14 l2.797,0.419l3.216-0.56l1.539-1.958l2.657-2.517l2.377-1.539l2.377,1.539l-1.398,2.377l0.839,2.238l-0.979,2.098l-1.958,2.237 l-2.377,0.56l-1.958,2.238l-0.279,2.377l1.398,0.419l2.937,1.818l-1.398,0.839v1.258l-0.839,0.42l-0.56,1.678l1.119,1.678 l1.539-0.56l2.098,0.419l1.259,1.259l-0.56,1.259l1.818,1.258l-0.56,1.678l0.699,1.539l0.419,1.538l-0.979,0.42l0.699,1.119 l-0.559,1.259l1.538,0.839l1.259-0.699l1.398-0.14l1.398,0.979l-0.979,1.399l0.699,1.538l1.119-0.28l1.258,1.119v1.958 l-0.699,1.398l2.098,0.42l1.119-0.42l1.119,0.56l-0.14,0.979l-1.119,1.539l0.699,2.098l-0.979,1.258l-1.678,1.399l-0.42,1.258 l0.28,1.119l0.28,1.678l-0.28,1.259l-0.419,1.678l1.259-0.14l1.192-0.123l-0.633,0.542l-0.979,0.839l-1.538-0.419l-0.979,0.979 l0.979,0.699l-0.56,1.259l-1.678,1.538l-0.28,1.539l-1.258,0.419l-0.979,1.398l-1.259,0.839l-0.559,1.258l-0.56,1.259l-1.818-0.14 l-0.699,0.839l-1.538,0.419l-1.398-0.839l-0.14-1.958l-0.419-2.098h-1.818l-1.119-0.839l-1.818,0.699l-1.538,1.258l-0.56,2.377 l0.699,1.539l1.539,0.14l-0.14,2.098l-0.979,0.56l-1.818,0.28l-1.678,1.119l-1.958-1.119l-1.958,0.14l-1.119,0.42l-0.839-0.42 h-1.259l-1.259,1.119l-1.818,1.398l-1.119,1.259l-0.42,1.258l-1.119,1.958l1.539,0.699l1.119-0.28h1.538l1.678-0.28l1.119,0.699 l0.559,0.7l-0.419,1.118l0.56,1.398l0.14,1.679l-0.28,1.679l-1.258-0.141l-0.56,1.258l0.699,0.979l-1.398,0.279l-1.818,0.42 l-2.377-0.561l-2.098,0.84l-1.538,0.56l0.419,1.118l-0.839,1.118l0.839,0.141l-0.14,1.258l0.839,1.399l-0.14,1.259l-2.098,0.838 l-1.119,1.259l-0.979,2.378v1.538l-1.958,0.839l-1.678,1.398l-1.958,1.68l-2.377-0.421v-1.118h-1.818l-1.538,2.097l-1.958,2.099 l-1.259,1.959l0.839,2.655l-0.14,1.399l-0.839,1.817L156.28,292.676z", farbe:'$V->{'Nordrhein-Westfalen'}' }, rp: { name: "Rheinland-Pfalz", text: "$V->{'Rheinland-Pfalz-text'}", cords: "M166.769,365.781v1.399l-0.14,0.979 l-0.419,1.958l0.279,1.398l0.42,1.677l-0.699,0.699l-0.14,1.12h1.259l1.119,0.419l0.56,1.119l-0.979,0.979l0.14,1.398l0.42,1.26 l-0.14,1.258l-0.699,0.559l-0.28,1.397l0.14,1.398l-0.14,1.12l-1.398,1.118l-0.839,1.12l-0.42,1.258l-0.14,0.56l-0.419,1.258 l-0.979,0.7l-0.14,1.119l0.42,0.698l-0.56,1.399l-0.28,1.538l-0.839,2.099l-0.839,1.678l-1.258,1.119l-0.979,1.258l-0.699,0.979 l-0.839,1.117l-1.119,1.261c-0.668-1.055-5.275-1.803-7.081-2.103c-5.037-0.841-4.899-3.442-6.436-2.519 c-1.399,0.838-4.938,1.088-6.959-0.324c-0.521-0.366-0.853-0.82-1.435-1.079c-0.696-0.304-1.051-0.078-1.721-0.152 c-1.019-0.113,0.1-0.327-2.602-0.375c-1.834-0.03-3.169-0.688-5.191-1.151c-1.858-0.426-3.122-1.036-4.757-1.12 c-1.111-0.059,0.194-1.742-0.329-2.636c-0.367-0.628-0.237-1.007-1.35-1.283c-0.997-0.25-1.687-0.81-2.556-0.685l-0.14-2.238 l-0.559-1.397l-0.699-0.979l0.279-1.959l2.098-0.699l0.699-1.399l1.398-0.979l-0.419-1.537l0.839-1.959l-0.56-1.536l-1.398-0.84 l-2.937-0.421l-1.259-2.655v-1.261l1.259-1.817l0.979-0.838l-0.699-1.54l0.56-1.538l-0.699-2.098l-0.14-1.258l-2.098,0.141 l-1.818-0.699l-1.398-1.119l-2.377-1.12l-3.496-1.118l-1.958-0.279l-2.377,0.559l-2.937,0.28l-2.517,1.679l-1.678,0.278 l-1.539,1.958l-2.937-0.418l-2.377,1.257l-2.098-1.257l-1.958-0.42l-2.238-0.841l-2.517,0.421h-1.678 c0.419-2.521,1.754-3.416,2.679-5.65c0.404-0.974-0.164-1.219,0.397-2.112c0.657-1.045,1.748-1.397,2.517-1.817 c0.315-0.173,1.13-1.048,1.469-1.47c0.463-0.575,0.075-1.737,0.35-2.446c0.17-0.44,0.212-0.908,0.07-1.399 c-0.362-1.25-0.699-1.049-1.958-0.908c-0.554-0.185-0.957-1.43-1.398-1.888c-0.213-0.221-0.614-0.094-0.839-0.279 c-1.049-1.329-2.377-1.825-3.496-2.238c-0.39-0.304-0.133-0.628-0.629-0.908c-0.807-0.458-1.063-0.482-1.888-0.911 c-0.759-0.39-1.149-0.446-1.818-0.979c-0.371-0.293-0.727-1.544-1.049-2.097c-0.343-0.588-1.118-0.209-1.398-0.63 c-0.553-0.828-0.11-0.501-0.538-1.401c-0.453-0.953-1.062-2.089-1.335-3.107c-0.299-1.117-0.125-1.078-0.288-2.225 c-0.164-1.146-0.199-1.758-0.146-2.916c0.059-1.296,0.442-1.821,0.77-3.076c0.164-0.491-0.122-1.62,0.135-2.069 c0.403-0.702,0.922-1.339,1.378-2.011c0.72-1.064,0.309-1.166,1.029-2.231c0.522-0.769,1.036-0.829,1.813-1.342 c1.186-0.776,2.431-0.325,3.358-1.397c0.79-0.916,0.168-2.045,0.979-2.941c0.447-0.494,0.839-0.42,1.399-0.981 c0.813-0.812,1.905,1.048,3.078-0.419c0.749-0.936,0.904-1.391,0.676-1.853l0.42-0.699l-0.699-0.838l-0.42-1.259l0.699-0.7 l0.699,0.7l0.699,1.398l0.56,1.539l1.398-0.279l1.119-0.279l1.538,0.279l1.539-1.12l0.839,0.841l0.56,1.258l1.258,0.419l0.7-0.978 l1.398,1.117l4.475-0.699l0.559-0.979l-1.398-0.837l-0.14-1.12l0.56-0.978l-0.979-1.119l0.28-0.98l-0.14-0.979l1.958-0.838 l0.699,0.699l1.259,0.559l1.258-0.84v-2.936l0.979-1.261l2.238,0.562l2.237-1.54l3.077-1.259l2.657-1.259l3.497-0.699l0.839-2.518 l0.419,1.959l1.818-0.979l1.678-0.838h2.098l1.119-1.399l0.14-1.679l0.839-0.979l1.678,0.42l4.195-1.538h2.657l1.678-2.379 l2.098,0.28l1.539-0.979l-0.699-2.097l1.398-0.139l1.259-1.119l1.538-0.841l-0.28-2.237l-0.839-0.979l-0.14-0.978l1.958-0.279 l1.259-1.119l2.098,1.538l-0.839,1.118l0.14,1.539l1.119,0.559l0.979,1.119l1.259,0.839l1.538-0.14l0.7,1.119l-0.28,1.817 l0.14,2.099l0.839,1.678l1.398,0.84l-0.42,1.398l0.56,1.818l1.678-0.421l1.678,0.279l0.486,1.735l0.073,0.363l-0.28,2.377 l0.14,1.819l-0.14,3.216l-1.539,0.98l-0.699-0.98l-2.797-0.279l-1.678,1.677l0.14,1.54l0.56,2.238l-1.119,0.699l-0.699,1.818 l0.839,0.837l1.398,0.421l0.699,1.678l1.958,0.978l0.28,2.239l1.119,1.959l0.699,2.797l-1.119,0.979l-1.678-0.142l-1.398,0.841 l0.419,2.097l-0.979,0.279l-1.818-0.699l-2.238,0.841l-1.119,1.817l1.119,1.399l0.979,1.258l-0.28,1.538l-0.979,0.7l-0.56-1.26 l-1.119-0.559h-1.398l-0.839,1.537l-1.259, 1.397l-1.818,0.562l0.28,1.118l1.119,0.7l1.119,1.258l1.119,1.538l0.699,1.12 l1.818,0.699h1.678l1.398-0.141l1.539-0.979l1.678-0.56l2.377-0.56l2.237-1.118l2.203-0.175l1.713,1.015l2.377,1.536l1.259,1.366 l1.258,2.271v1.679l0.28,2.238l0.28,1.678l0.979,1.398l0.839,2.517l0.49,1.119l1.258,0.351l1.189,0.07l0.419,0.838l-0.28,1.119 l-1.119,0.56l-0.839,1.399l-0.979,1.117l-1.398,0.979l-0.14,1.819l0.14,2.098l0.979,1.887L166.769,365.781z", farbe:'$V->{'Rheinland-Pfalz'}' }, sl: { name:"Saarland", text: "$V->{'Saarland-text'}", cords: "M115.761,392.829 c-0.09,0.015-0.183,0.039-0.279,0.068c-1.031,0.321-1.001,1.458-1.958,1.958c-1.261,0.661-2.231,0.5-3.638,0.282 c-1.022-0.161-1.516-0.581-2.518-0.841c-1.286-0.331-2.121-0.079-3.358-0.56c-0.568-0.221-0.593-0.569-1.399-0.699 c-1.679,0.138-0.874-2.22-1.679-3.503c-0.581-0.922-0.151-2.376-1.679-2.238c-1.54,0.139-1.016-0.279-1.679-0.28 c-2.003-0.003-2.505,2.162-4.477,2.519c-1.074,0.195-1.679,0.562-2.798,0c-1.996-0.997-2.625-0.441-3.778-1.538 c-1.43-1.362-0.382-3.289-1.684-4.774c-0.719-0.821-1.646-0.763-2.239-1.681c-1.008-1.562,1.187-3.136,0.28-4.761 c-0.768-1.375-2.336-1.043-3.358-2.239c-1.015-1.19-0.427-2.703-1.679-3.64c-0.829-0.621-1.543-0.492-2.519-0.842 c-0.856-0.304-1.488-0.775-2.359-1.097c0.055-1.421,0.49-2.134,0.406-3.509c-0.061-1.001,0.793-1.339,0.958-2.329h1.678 l2.517-0.421l2.238,0.841l1.958,0.42l2.098,1.257l2.377-1.257l2.937,0.418l1.539-1.958l1.678-0.278l2.517-1.679l2.937-0.28 l2.377-0.559l1.958,0.279l3.496,1.118l2.377,1.12l1.398,1.119l1.818,0.699l2.098-0.141l0.14,1.258l0.699,2.098l-0.56,1.538 l0.699,1.54l-0.979,0.838l-1.259,1.817v1.261l1.259,2.655l2.937,0.421l1.398,0.84l0.56,1.536l-0.839,1.959l0.419,1.537 l-1.398,0.979l-0.699,1.399l-2.098,0.699l-0.279,1.959l0.699,0.979l0.559,1.397L115.761,392.829z", farbe:'$V->{'Saarland'}' }, sn: { name:"Sachsen", text: "$V->{'Sachsen-text'}", cords: "M325.788,313.759l0.281-0.979l-0.839-1.26l0.42-1.398 h0.978l0.559-0.979l0.981-0.558l-0.841-1.26l-0.42-1.537l-1.398,0.559l-0.979-1.399l1.679-0.699l0.56-1.257l-0.141-1.398l1.54-0.98 l1.116-2.099l0.98,0.562l-0.56,1.258l0.698,1.539l-0.139,1.537l1.678,0.56l1.119-1.817l1.678,0.559l1.957-0.559v-1.259 l-1.116-0.141l0.417-2.097l1.539,1.119l0.84-1.119h1.816l1.68-0.421l2.098-2.376l-1.959-1.54l-0.279-1.677l-1.956-1.819 l0.698-1.677l-0.561-1.54l2.518-1.258l2.378-1.538l1.68-1.12l1.397,1.679l1.398-1.679l1.816-0.978l1.119-2.099l1.261,0.841 l1.817-0.699h2.099v-2.799l-0.7-2.656l-1.398-1.119l-3.078-0.979l0.699-1.118l-1.537-1.26l-0.561-1.816l-1.678-0.56l-1.957,0.14 l-2.098-0.84l-1.397-1.119l-2.445,0.82l-0.912,0.02l-1.12-0.559v-1.12l-1.537-0.979l-0.28-1.258l0.28-0.84l-0.699-0.419 l0.699-0.979l0.279-1.537l-0.42-1.398l-0.279-0.561l-0.839-1.258l0.42-0.56l-0.279-0.979l-0.42-0.979l-0.279-0.84l0.699-1.398 l0.838-1.119l-0.979-2.517l0.42-1.678l0.839-1.958l-0.839-1.539l1.397-0.839l-0.141-2.657l1.398-1.678l1.26-1.398h1.54l1.956-1.119 l2.798-0.979l1.397,0.419l4.057-0.699l1.679-1.398l2.517,0.419l1.957-1.398l1.258-1.818l1.4,0.14l0.839,0.56h1.538l1.818-1.678 l1.816-0.14h1.261l1.538,1.259l1.117,0.979l1.12-1.119l1.817,0.839l0.841,1.818l1.116,0.699l0.84-0.419l1.678,0.979l-0.42,1.818 l1.68,1.958l1.119,2.238v1.119l-0.141,4.195l0.559,2.098l1.119,0.279l1.398,0.14l1.398-1.539l2.099-0.979l1.538,0.28l0.7-1.398 l0.979,0.28l0.56,1.259l0.979-0.42l2.237,0.839l1.397,0.979l1.959,0.28l2.098-0.14l2.657,0.979l2.238,0.419l1.817-0.14l2.377-1.398 l3.077,0.28l1.397-0.979l1.54-0.839l0.839,0.14l-0.14,0.979h1.259l0.559-2.657l1.12-1.119l-0.562-1.818l1.539-0.419l1.119-3.356 l0.699-0.14l-0.278-1.119l1.398-1.258h2.376l1.119,0.279l0.14,1.259l1.259,0.419l1.258-0.419l2.377-0.839l1.119,0.279l1.959-0.979 l0.42-1.119l0.838-0.419l1.399,1.678l1.538-0.56v-1.119l1.258-1.398l1.539,0.839l0.559,1.818l0.699-1.259l2.099,0.14l0.28-1.538 l1.399-1.259l0.279,1.119l1.581,0.307l-0.504,1.249l-0.069,1.33l0.996,1.184l0.979,0.56l1.118,0.56l1.26,0.141l1.539,0.279 l0.979,0.84l1.679,0.7l1.172,0.566l0.631,1.33l0.49,1.54v1.541l-0.07,1.399l1.294,0.948l1.397,0.419l0.49,1.958l0.279,1.888v1.468 l0.139,1.538v1.469l0.07,1.608l-0.699,1.188l-0.313,2.145l-0.452,1.627l-0.248,1.662l-0.311,1.837l0.14,1.541l-0.249,1.171 l-0.03,1.814l-0.559,1.26l-0.7,1.96l-0.737,1.128l-0.562,0.629l-0.799,1.138l-0.698,0.979l-0.53,0.962l-0.062,0.76l1.714,0.467 c-0.379,1.207-1.237,3.118-1.404,4.372c-0.096,0.726-1.997,1.31-2.657,1.397c-1.254,0.171-3.062-1.921-3.884-2.654 c-1.525-1.357-2.983-1.217-3.775-1.964c-0.308-0.29-0.04-1.145,0.415-1.536c0.98-0.842-1.19-1.258-1.539-0.7 c-0.699,1.119-1.317-0.241-1.817-0.841c-0.7-0.839,1.38-1.298,0.812-2.233c-0.536-0.88-0.408-1.82-1.399-2.097 c-0.946-0.266-1.398,0-3.078-0.839c-0.842-0.422-1.552,0.923-2.656,0.978c-0.811,0.041-2.549-3.001-3.357-2.937 c-0.715,0.057-0.851,1.191-1.537,0.979c-0.887-0.272-1.538,0.42-1.678,1.539c-0.106,0.856,1.177,0.426,1.398,1.26 c0.249,0.934,1.82,0.611,2.099,1.537c0.417,1.4,2.959,2.604,2.655,3.357c-0.559,1.4-4.166,0.666-5.313,1.956 c-1.028,1.157-3.056,0.083-4.315,0.981c-1.174,0.835-1.438,1.922-2.678,2.655c-0.99,0.588-2.09,0.08-3.058,0.704 c-0.993,0.638-1.528-0.338-2.536,0.275c-0.646,0.395-2.098,2.088-2.796,2.377c-1.228,0.507,0.612,3.156-0.7,3.356 c-1.196,0.184-2.208,1.65-3.217,0.979c-1.258-0.84-3.642-0.009-4.054,0.278c-1.478,1.032-2.308,0.413-4.058,0.841 c-2.067,0.506-2.574-0.266-4.195,1.118c-0.739,0.633-0.449,2.816-0.699,3.775c-0.26,0.989-1.753,0.89-2.377,1.679 c-2.1,2.659-2.567-1.875-4.057-1.399c-0.76,0.245-1.312,1.27-1.677,1.819c-0.327,0.489-1.731,1.464-2.238,1.959 c-1.054,1.023-0.901-0.889-2.237-0.282c-0.916,0.419,0.234,1.266-1.119,0.841c-0.637-0.2-1.173,4.924-1.818,4.755 c-1.406-0.371-3.433,0.295-4.475,0.279c-0.928-0.014-0.93-0.75-1.259-0.419c-0.846,0.846-0.077,1.53-0.979,1.677 c-0.671,0.11,0.058,3.12-0.7,3.496c-0.854,0.427-1.998,1.391-2.656,1.819c-1.052,0.685-4.198-3.604-5.036-3.604 c-1.106,0-0.658,0.824-1.397,1.646c-0.768,0.854-1.856-0.335-2.518,0.418c-0.967,1.107-0.424,1.357-1.817,1.819 c-1.048,0.347-1.7-0.109-2.798,0c-1.411,0.143-2.23,1.57-3.643,1.717c-1.768,0.184-0.904,2.002-2.51,2.759 c-2.166,1.018-4.171,1.293-5.596,3.216c-0.873,1.181,0.234,1.14-0.559,2.379c-0.637,0.993,0.105,1.317-0.42,2.376 c-0.413,0.837-0.431,2.866-1.118,3.496c-1.679,1.542-1.294-1.574-2.099-2.237c-0.63-0.521-1.158-2.024-1.678-2.656 c-0.867-1.056,0.912-1.806-0.419-2.104c-0.862-0.191-1.22,0.802-2.1,0.839c-1.579,0.07-0.237-3.659-1.663-2.981 c-0.558,0.264-1.947-0.122-2.129,0.47l-1.66-0.56l-0.84,0.279l-1.398-1.398l-1.539-1.259l-1.258-1.538v-1.117l-0.699-1.399 l-0.979,0.14L325.788,313.759z", farbe:'$V->{'Sachsen'}' }, st: { name:"Sachsen-Anhalt", text: "$V->{'Sachsen-Anhalt-text'}", cords: "M272.226,230.409 L270.548,228.73 270.128,226.913 269.29,224.535 268.73,223.276 267.893,222.158 266.911,221.318 266.632,217.962 267.472,216.983 269.011,216.004 269.989,215.165 269.989,214.046 269.011,212.928 268.451,211.669 270.688,210.69 270.548,209.571 269.15,210.271 268.451,209.152 267.751,209.571 266.911,208.592 266.493,206.914 268.172,206.634 269.569,206.075 270.548,204.676 271.526,203.418 273.905,203.558 276.003,203.558 279.08,203.138 280.897,202.858 282.996,202.998 283.974,201.74 283.694,200.761 284.673,199.502 286.771,198.803 288.31,197.544 288.589,196.146 287.89,195.167 286.492,194.747 287.051,193.069 289.147,192.37 289.43,190.971 287.75,190.691 288.589,188.874 287.331,187.895 288.73,186.496 287.89,184.258 290.268,183 290.408,182.021 289.009,180.482 287.191,179.503 285.651,178.665 284.673,177.545 283.415,175.867 282.996,174.609 283.974,174.049 285.372,174.189 285.514,172.791 284.253,171.252 283.694,169.434 283.834,167.336 284.813,166.637 285.372,165.099 284.114,164.54 282.435,164.959 281.317,163.701 280.198,161.463 279.5,160.344 279.08,158.946 277.681,159.085 277.121,156.988 276.283,154.89 276.003,153.072 276.422,152.373 276.842,150.694 280.198,150.555 281.317,151.254 282.435,150.275 283.974,150.135 284.952,149.156 285.651,146.499 289.709,146.08 289.709,147.478 291.944,147.478 292.226,146.08 293.764,146.918 295.022,147.059 295.722,148.457 297.121,148.037 298.658,148.317 299.077,149.296 301.596,148.177 303.692,146.918 305.232,144.821 306.63,144.541 307.75,143.143 307.33,141.464 308.309,139.926 309.847,140.905 311.105,139.926 310.547,138.667 312.224,138.108 312.503,137.129 313.452,136.103 313.761,138.108 315.021,138.527 315.86,139.052 316.698,139.611 316.419,141.08 317.293,142.059 318.168,142.583 319.775,142.303 321.734,144.191 322.293,145.101 323.691,145.8 324.81,146.499 326.209,146.779 327.187,147.198 330.823,147.198 332.501,146.779 333.9,147.897 335.019,149.016 336.278,148.876 337.117,148.037 338.794,148.736 338.515,150.834 338.935,152.093 338.515,153.072 337.536,154.051 337.677,155.729 338.235,157.407 338.794,159.085 339.214,160.484 338.935,162.022 338.515,164.12 336.139,164.54 335.718,165.938 336.559,166.917 336.418,167.896 335.58,169.994 335.019,171.112 336.139,171.112 336.838,172.931 338.095,173.21 339.355,171.952 339.775,173.49 341.452,173.21 342.293,174.049 341.731,176.147 340.474,178.245 342.151,180.063 342.151,182.44 340.753,185.377 339.214,187.754 338.935,189.712 340.334,191.95 338.655,192.649 338.095,194.467 340.055,197.264 342.151,200.201 344.669,203.418 346.206,204.676 347.466,205.375 348.305,204.257 349.284,204.537 349.702,205.655 351.521,206.215 352.081,207.613 352.78,209.012 355.577,208.872 356.556,207.613 357.676,206.774 360.331,207.613 361.591,207.753 364.389,209.431 367.605,210.97 369.143,211.949 370.821,211.25 372.22,212.088 372.22,213.347 373.338,214.326 374.735,215.445 376.834,215.445 378.651,215.165 379.632,216.843 378.651,217.683 379.071,218.382 380.051,219.78 380.191,222.158 381.03,223.836 381.448,225.514 380.051,226.772 379.071,228.451 377.394,229.85 375.716,230.968 374.247,230.724 372.359,229.85 371.239,230.968 370.122,229.989 368.584,228.73 367.323,228.73 365.507,228.871 363.688,230.549 362.15,230.549 361.312,229.989 359.911,229.85 358.653,231.667 356.696,233.066 354.18,232.646 352.501,234.045 348.444,234.744 347.047,234.325 344.249,235.304 342.293,236.422 340.753,236.422 339.493,237.821 338.095,239.499 338.235,242.156 336.838,242.995 337.677,244.534 336.838,246.492 336.418,248.17 337.396,250.687 336.559,251.806 335.859,253.204 336.139,254.043 336.559,255.022 336.838,256.001 336.418,256.561 337.257,257.819 337.536,258.379 337.956,259.778 337.677,261.315 336.978,262.293 337.677,262.712 337.396,263.552 337.677,264.811 339.214,265.789 339.214,266.909 340.334,267.468 341.312,267.468 340.893,269.007 340.334,269.985 340.613,271.664 341.872,271.804 341.312,273.761 340.753,275.159 339.775,275.998 340.613,277.257 339.214,278.097 338.376,277.538 337.396,276.697 335.859,277.397 334.46,276.977 333.062,276.558 331.522,277.118 329.845,276.277 327.886,276.139 327.327,275.021 327.327,273.622 326.488,272.781 325.089,272.083 322.992,271.243 321.313,271.524 320.474,272.643 318.518,272.223 317.259,271.243 315.58,270.405 315.021,268.587 314.742,266.909 313.202,266.349 311.805,267.608 309.427,267.188 308.168,268.168 305.651,267.889 304.812,265.37 305.651,263.552 305.232,262.293 303.692,261.315 301.596,260.896 300.196,259.637 300.196,258.099 302.015,258.099 303.272,257.26 304.533,255.721 305.092,254.183 305.931,253.065 304.812,252.225 303.692,250.547 303.134,248.869 301.735,247.89 300.056,248.03 298.519,246.911 296.28,247.051 295.161,245.932 293.063,246.212 291.106,246.492 289.147,245.513 287.61,246.072 286.071,246.631 284.813,246.212 283.694,244.673 283.275,243.135 283.694,241.737 282.435,239.918 282.155,237.821 282.717,236.702 282.018,235.723 281.317,236.422 280.338,235.164 280.897,233.905 282.155,233.485 281.597,232.506 280.618,232.506 279.221,231.947 277.681,231.807 276.283,230.409 273.625,230.688", farbe:'$V->{'Sachsen-Anhalt'}' }, sh: { name:"Schleswig-Holstein", text: "$V->{'Schleswig-Holstein-text'}", cords: "M182.247,0.285c1.863,0.378,4.296,0.537,0.538,0.806 c0.101,0.151-0.21,0.403-0.269,0.538c0.042,0.05,1.208,0.948,1.343,1.074c0,0-0.369,0.646-0.537,0.269 c-0.092,0.033-0.202,0.503-0.269,0.537c-2.115,0.806-0.764-0.117-1.879,1.612l-0.537,0.269c-0.059,0.269,0.058,3.35,0,2.686 c0.511,3.458,0.897,4.155,4.296,4.029c-0.202,0.125-0.302,0.906-0.537,1.074c-0.537,0.353-1.083,0.285-1.611,0.537 c0.344,0.05-0.546,0.688-1.075,0.537v-0.537c-0.335-0.193-0.755-0.026-1.073-0.269c-0.244-0.185-0.235-0.898-0.538-1.075 c-0.462-0.268-0.881-0.067-1.342-0.268c-0.336,0.705-0.789,1.51-1.074,2.417h-0.269c-0.193,1.494,0.143,3.794,0,5.641 c0,0-1.628,0.31-0.805-0.269c-0.009,0.092-0.713-0.268,0-0.268c0-2.233,0.016-3.819,0.268-5.909 C177.548,8.015,180.275,4.574,182.247,0.285z M204.836,69.582c0.101-1.394-0.203-2.543,0.234-3.76 c0.034-0.101,0.713-0.479,0.805-0.538v-0.269l-0.805-0.269c-0.571-0.411-1.443-1.141-1.343-2.148 c0.008-0.151,0.21-0.831,0.269-0.537c0.729-0.143-0.546-0.344-1.075-0.269c-0.503,0.059-2.098,0.638-1.879,0.538 c-1.795,0.26-2.736,0.722-3.491-0.806c-0.335-0.671-0.722-3.273-0.537-2.686c0-0.042,0.008-0.806,0-0.806 c0.302-0.26,0.747-0.008,1.074-0.269v-0.269c0-0.562,0.487-0.814,0.537-1.074c0.109-0.646-0.445-1.897-0.537-2.686 c3.407,0.461,4.347-0.479,5.102-3.492h-0.537c-0.059,0.025-0.479,0.965-0.537,1.074c0,0-0.646,0.059-0.269-0.268 c-0.319,0-0.772,0.033-1.074,0l-1.074-0.538c-0.637-0.009-2.71,1.578-2.954,1.612c-1.25,0.143-1.443-0.974-2.416-0.806 l-0.537,0.537c-0.252,0.067-0.873-0.16-1.074,0c-0.209,0.151-0.059,1.167-0.269,1.343c-0.176-0.143-0.596,0.101-0.805,0V52.66 c-0.235-0.134-0.906-0.352-1.074-0.537c-1.15-1.259-1.368-2.334-1.611-4.566c0.831,0.26,1.183,0.797,2.417,0.537l-0.268-0.806 c0.814-0.034,2.685-0.125,1.879-0.538c-0.176-0.092-0.361-0.999-0.537-1.074c-0.353-0.151-0.713,0.151-1.074,0.269 c0.076-0.538-0.125-0.579-0.268-1.074c0.377-0.277,0.545-0.688,0.805-1.075c1.661,0.151,1.519,0.042,2.685,0 c-0.344,0.009,0.604,0,0.269,0c0.57-0.008,0.755,0.269,1.074,0.269c0.445-0.009,1.343-1.074,1.88-0.538l0.268,0.269 c1.511-0.21,2.954-0.101,4.028-0.806c0.243-0.168,0.067-0.814,0.268-1.075h0.537c0.084-0.033,0.461-0.713,0.537-0.805 c0.982,0.318,1.233,0.235,2.148,0.537v-0.537c-0.646-0.37-2.022-0.546-0.537-0.806c0.084-0.017-0.487-0.983-0.537-1.075 c0.721-0.269,1.04-0.269,1.611-0.538c0-0.487-0.126-1.15,0-1.611c-0.21-0.143-0.814-0.092-1.074-0.269 c-0.076-0.05-1.343-1.88-1.343-1.88h-0.537c-0.285-0.512-0.025-0.856-0.269-1.343c-0.092-0.184-0.73-0.57-0.805-0.805 c-0.285-0.806,0.118-1.52-0.269-2.149c-0.227-0.361-0.68-0.076-1.074-0.269V29.83c-0.722,0.076-1.426,0-2.148,0 c-0.143,0.394,0.025,0.596-0.268,0.806c-0.403,0.277-0.68-0.017-1.074,0.269v-0.537c0.445-0.26,0.705-0.269,1.074-0.537 c1.208-0.907,0.57-0.251,1.342-0.537c0-0.109-0.083-1.033,0-1.075c-0.444-0.437-1.443-1.259-1.611-1.88 c-0.075-0.277,0.143-0.84,0-1.075c-0.185-0.302-0.503-0.084-0.805-0.269c-0.361-0.227-0.47-0.831-0.806-1.074 c-0.847-0.621-1.863-0.722-2.954-1.074v-0.538h0.537c-0.159-0.294,0.118-0.503,0-0.806c-0.016-0.05-0.797-0.512-0.805-0.537 c-0.176-0.613,0.335-1.133,0.268-1.343l-0.537-0.269c-0.839-1.292-1.662-2.779-1.342-5.104c0.138-1.024,0.591-2.067,1.018-3.104 c0.873,0.6,1.323,1.577,2.285,1.5c5.316-0.419,4.411-0.42,7.415,0.141c2.562,0.479,3.792,1.518,6.296,2.24 c2.787,0.803,4.48,0.765,7.275,1.541c0.832,0.23,0.69,1.509,1.539,1.959c1.58,0.838,4.442,0.4,4.897-0.42 c0.441-0.794,0.739-0.402,1.48-0.928c0,0.167-0.101,1.293,0.017,1.369c0.293-0.235,1.132-0.99,1.342-1.074 c0.269-0.126,0.503,0.344,1.074,0c0.134-0.092,0.419-0.781,0.537-0.806c0.436-0.117,0.654,0.386,0.805,0.269 c0.294-0.252,0.663-1.536,0.806-1.88c0.554-0.075,0.403-0.134,0.805-0.268c-0.285,0.142,0.873,0.025,1.074,0l-0.268-0.807 c0.318-0.251,0.747-0.024,1.074-0.268c-0.167,0.277,0.109,0.496,0,0.806c-0.109,0.269-0.487,0.151-0.806,0.269 c0.428,1.888-0.042,1.771,1.611,2.417l0.537,0.538c0.294,0.076,0.798-0.134,1.075,0c0.176,0.076,0.889,0.991,1.074,1.074 c0.596,0.26,1.208,0.009,1.879,0.269l0.269,0.538c0.386,0.109,1.007-0.21,1.342,0c0.403,0.251,0.479,1.217,0.806,1.612 c0.335,0.402,1.141,0.797,1.611,1.074c1.267-0.722,1.569-1.007,2.148-2.417c0.419,0.193,1.527,0.471,1.88,0.807 c0.822,0.797,0.395,2.19,0.805,3.491c0.235,0.764,1.133,1.922,1.611,2.686c-0.093-0.017-0.948,0.193-1.343,0.268 c0.579-0.428-0.537-0.537-0.537-0.537c-0.512,0.965-0.579,1.62-1.074,2.686c0.369-0.134,0.369-0.479,0.537-0.806 c0.931,0.143,1.208-0.168,1.879,0.268c0.067,0.042,0.235,1.217,0.269,1.343c0.05-0.033,0.495-0.36,0.537-0.268 c0.059-0.487,0.202-0.915,0.268-1.075c-0.033,0.462,0,2.015,0,3.223l-0.537,0.269c-0.21,1.343,0.377,2.997,0,4.298 c-0.042,0.125-0.688,0.621-0.806,0.806c-0.889,1.327-1.972,1.99-3.491,2.686c-1.217,0.545-1.359,0.369-2.417,0.537 c0.185,0.16,1.637,2.065,0.269,1.075l-0.269-0.806c-1.124-0.059-0.905,1.393-0.268,1.612c0.579,0.193,1.527,0,2.148,0 c0.025-0.068,0.26-0.538,0.269-0.538c2.374-0.545,4.363-0.311,6.981-0.805c0.336-0.068,0.596-0.706,1.611-0.538 c0.412,0.067,1.049,0.806,1.343,1.075c0.747,0.696,0.99,1.166,0.805,2.148c0,0-0.772,0.797-0.805,0.806 c-0.193,0.017,0.805,0.806,0.805,0.806c0.193,0.58-0.101,1.259,0,1.88c-0.167,0.126-0.604-0.084-0.805,0 c-0.294,0.109-1.343,2.148-1.343,2.148c1.191,0.328,0.604,0.882,0.806,2.149c0.277-0.26,0.361-0.118,0.806-0.269 c-0.05-0.747-0.462-1.074-0.269-1.88c0.067-0.311,0.68-0.352,0.805-0.537c0.688-1.058,0.898-3.341,2.149-3.76 c0.008-0.009,1.736,0.008,1.611,0c0.906,0.21,0.621,0.184,1.342,0.537c-0.428-0.395-0.076-0.26-0.805-0.806 c0.05-0.109,0.402-0.403,0.268-0.538c0.596,0.067,1.284-0.143,1.881,0c0.927,0.218,1.931,1.453,2.696,1.88 c0.46,0.26,0.812,0.017,1.342,0.269c0.075,0.033,0.2,0.495,0.267,0.537c0.571,0.369,0.873,0.009,1.612,0.269 c0.218,0.076,0.864,0.722,1.073,0.806c0.673,0.269,1.652,0.697,2.148,0.806c0.41,0.084,1.066-0.395,1.879,0 c0.756,0.361,1.93,2.501,2.687,3.223c0.126-0.067,0.368-0.378,0.536-0.269c-0.268,0.419-0.562,0.873-0.805,1.343 c1.342-0.042,3.894,0.311,5.103-0.538c0.217-0.159,0.226-0.957,0.537-1.074c0.201-0.084,0.644,0.125,0.805,0 c0.452-0.386,0.629-1.234,1.074-1.612c0.386-0.345,1.442-0.503,1.878-0.806c0.295-0.218,0.731-1.209,1.074-1.343 c1.184-0.504,2.309,0,3.224,0c-0.025,0.042-0.329,0.521-0.268,0.537c1.382,0.235-0.069-0.797,1.609-0.537l0.269,0.806 c0.578-0.159,1.619-0.562,1.879-0.537c0.077,0,0.562,0.512,0.805,0.537c0.103-0.209,0-0.848,0-1.074 c0.061-0.042,1.066-0.529,1.077-0.538c0.041,0,0.376,0.302,0.804,0.269c-0.16,0.26,0.117,0.789,0,1.074l-1.881,1.612 c-0.132-0.067-0.377-0.378-0.535-0.269c0.242,1.838,1.679,7.688,0.805,10.475c-0.084,0.244-0.629,0.101-0.805,0.269 c-0.27,0.227-0.251,1.1-0.537,1.343c-0.251,0.202-0.772,0.126-1.074,0.269c-1.073,0.495-3.205,1.611-4.029,2.417 c-0.746,0.722-1.214,2.174-2.146,2.687c-0.847,0.453-1.904,0.26-2.953,0.537c-0.219-0.738-0.269-1.225-0.536-2.148l-0.537,0.269 c-0.194,0.478,0.106,1.107,0,1.611c-0.271,1.142-1.812,1.813-2.687,2.418c0.429,1.687,0.604,3.852,2.149,4.297 c1.056,0.302,2.441-0.042,3.221,0.269c1.787,0.705,1.25,3.903,0.817,1.913l0.491,0.559l0.209,0.665l0.278,1.119l1.119,0.56 l0.252,0.057l0.191,0.245l-0.075,0.375l-0.333,0.432l-0.287,0.245l-0.704,0.014l-0.434-0.101l-0.274-0.346l0.404-0.605l-0.46-0.389 l-0.52,0.821l-0.705,0.504l-1.25,0.565l-1.12,1.119l-1.817,1.259l-0.559,1.818v2.377l0.279,2.238l1.538,1.538l0.979,1.119 l1.677,1.678l1.819-0.14l1.397,0.42l0.578,1.944c-0.342,2.04-0.346,1.978-2.688,1.902c0.103,0.579-0.143,0.52,0.268,0.806 c0.319,0.218,0.464,0.185,1.074,0.269c-0.135,1.083-0.493,1.41-0.268,2.417l0.537,0.537c0.033,0.235-0.038,0.934-0.104,0.699 l-0.934,0.516l-1.399-0.419l-0.42-0.839l-0.979,0.14l-0.14,1.539l0.279,1.818l-0.699,1.119l-0.838,0.56l-1.4,1.119l-1.816-0.14 l-0.699,0.979l-2.099,0.14l-0.419,1.259l-0.279,1.958l-0.282,1.258h-2.516l-2.1-0.419l-1.397-1.119l-2.237-0.56l-1.538-0.419 l-1.967-1.259v-0.979l-0.981-0.839l-1.538-0.14l-0.979-0.839l-1.259-0.419l-0.419-1.539l-0.699-1.259l-0.839-0.279l-1.259-0.14 l-1.119-1.259l0.419-2.098l1.398-0.14l0.14-1.539l0.979-1.678l-1.678-0.839l-0.28-1.259l-0.699-1.538l0.839-1.259l-0.419-1.398 l-1.818-0.14l-0.699,1.678l-0.839,0.699l-2.518,0.42l-1.258,0.279l-0.56,1.818l-1.119-0.419l-1.259,0.699l-0.56,1.398l-1.119,2.237 l-1.678,0.699l-1.539-1.678l-0.559,0.839l-0.699,1.538l0.207,1.171c-0.57-0.156-0.57,0.052-2.368-0.534 c-0.459-0.15-0.982-0.89-1.342-1.075c-0.512-0.268-0.864-0.008-1.343-0.268c-0.293-0.168-0.537-0.89-0.805-1.075 c-0.587-0.403-1.217-0.193-1.88-0.538c-0.252-0.134-0.487-0.621-0.805-0.806c2.207-1.36,0.377-0.612,0-2.148 c-0.21-0.823,0.369-1.007,0.268-1.612c-0.05-0.251-0.688-0.629-0.805-0.806c-0.554-0.797-0.453-0.848-1.343-1.343v-0.538 c-0.915-0.688-2.022-0.713-2.685-1.611c-0.764-1.033-0.369-1.762-0.806-3.223c-0.075-0.252-0.722-0.848-0.805-1.074 c-0.302-0.797-0.092-1.771-0.537-2.417h-0.269c-1.25-0.629-1.846-1.746-2.954-2.417c-1.367-0.831-5.571-1.88-7.518-1.88 c-0.386-0.009-1.133,0.436-1.88,0.269c-0.814-0.185-1.527-1.309-2.148-1.612c-0.495-0.243-1.519-0.419-1.88-0.537l-0.268,0.806 c-0.688,0.244-0.395-0.521-1.074-0.269c-0.244-0.512-0.529-1.376-0.806-1.88c-0.118-0.218-0.697-0.328-0.805-0.538 c0.008-0.008,0-0.771,0-0.806c0.453-0.083,0.872,0,1.342,0c-1.25-0.319,0.604-1.578-0.806-2.417 c0.126,0.067-0.99,0.025-1.343-0.269c-0.612-0.512-0.948-2.115-1.342-2.954c0.47,0.016,0.143-0.705,1.074-0.537 c0.268,0.042,3.373,2.316,3.759,2.686l0.268-0.806C204.164,69.716,204.367,69.784,204.836,69.582z M238.366,33.322 c-0.529,0-0.177,0.167-0.269,0.537C238.239,33.792,239.255,33.322,238.366,33.322z M237.829,33.859 c-0.294,0.075-0.503,0.638,0,0.538C237.829,34.396,238.592,33.649,237.829,33.859z M236.754,33.859 c-1.233,2.703-3.717,4.155-6.981,4.029c0,0-0.411,0.705-0.537,0.805c1.41-0.411,2.048-0.562,3.491,0v0.538 c0.479,0.143,0.654,0.033,1.074,0.268c0-0.092,0.638-1.611,0-1.611c0.319-0.261,1.091-0.244,1.343-0.538 c0.125-0.16-0.084-0.604,0-0.806c0.285-0.755,1.821-1.679,2.148-1.88C237.694,34.941,236.956,33.943,236.754,33.859z M242.394,30.636c-0.848,0.588-1.578,1.007-2.417,1.611c-0.227,0.16-0.369,0.688-0.537,0.806c-0.159,0.101-0.637-0.025-0.806,0 c-0.033,0,0.89,0.395,1.343,0.269v-0.537c0.705-0.303,1.057-0.134,1.611-0.538c0.117-0.092,0.453-0.931,0.537-1.074 c0.134,0,0.663,0.083,0.806,0C242.931,31.173,242.217,30.72,242.394,30.636z M244.004,29.293c-0.202,0.361-0.377,0.814-0.537,1.343 h-0.537c0,0,0.058,0.697,0.268,0.269h0.537C244.13,30.535,243.744,29.83,244.004,29.293z M189.497,65.016h0.537 c0.168,0.487-0.235,1.142,0,1.612c0.026,0.059,0.713,0,0.806,0c0.235,1.016,0.402,1.108,0.537,2.149 c-0.218-0.076-0.772-0.294-0.805-0.269c-0.638-1.024-0.806-1.385-1.611-2.149C189.22,65.738,188.984,65.292,189.497,65.016z M193.256,38.962c1.167-0.017,0.805,0.537,0.805,0.537C194.011,39.474,192.97,38.962,193.256,38.962z M186.812,38.693 c0.713-0.167,0.269,0.806,0.269,0.806C186.459,39.365,186.35,38.794,186.812,38.693z M290.198,37.351 c0.957-0.227,2.115,0.646,2.686,0.806c0.84,0.227,1.326-0.067,2.149,0.269v0.537c0.544,0.201,1.418,0.185,1.878,0.537v0.538 c0.228,0.663,1.553,1.821,1.882,2.417c0.712,1.317,0.862,2.543,1.341,4.029c-0.612-0.185-1.703-0.764-2.148-0.806 c-0.376-0.042-1.376,0.47-2.147,0.269c0,0,0.108-0.789-1.074-0.538c-0.092,0.017,0.218,0.923,0.27,1.075 c-1.806,0.243-2.61,0.143-4.03-0.269c0.127-0.353,0.891-1.368,0.807-1.88c-0.033-0.185-0.453-0.269-0.537-0.806 c-0.159,0-0.654,0.084-0.805,0v-0.537c-0.612,0.302,0.143-0.428-0.537-0.269c-0.159,0.034-0.236,0.781-0.27,0.806 c-0.61,0.252-0.443-0.402-1.073-0.269c-0.228,0.042,0.269,0.806,0.269,0.806c-0.076-0.075-0.705,0.017-0.806,0 c-0.787-0.185,0.269-0.269,0.269-0.269s-0.293-1.284-0.269-1.612c0.009-0.26,0.463-2.148,0.537-2.417 C288.806,38.962,289.435,37.519,290.198,37.351z M199.432,35.47c0.193-0.025,0.738,0.521,0.805,0.538 c2.442,0.621,1.704-0.345,2.685,1.88c-0.612-0.294-0.813-0.412-1.342-0.806c0.126,1.821,0.822,1.662-0.806,2.686 c-0.059,0.033-0.478,0.78-1.074,0.806c-0.293,0.008-0.663-0.479-0.805-0.537c-0.646-0.269-1.016,0.059-1.611-0.269 c-0.496-0.277-0.437-1.704,0-1.343c-0.101-0.42-0.496-0.823-0.269-1.343c0.159-0.395,0.973-0.302,1.343-0.537 C198.651,36.344,199.003,35.521,199.432,35.47z M191.645,33.59c2.357-0.209,0.487,2.804,0,4.03 c-0.646,0.058-1.049,0.125-1.343,0.269c-0.47-0.37-1.368-0.571-1.611-1.075c-0.235-0.47,0-1.611,0-1.611v-0.537 c0.437-0.328,1.376-0.076,1.88-0.269C190.688,34.346,191.376,33.607,191.645,33.59z M195.404,31.71c0.604,0.093,1.309-0.218,1.88,0 c0.059,0.017,0.587,1.024,0,0.806c-0.067,0.227,0.226,0.713-0.269,0.537c0.159,0.403,0.436,0.605,0.806,0.806 c0.528,0.285-0.269,0.269-0.269,0.269v0.538c-0.906-0.462-1.409-0.848-2.685-1.075c0.126-0.47-0.159-0.889,0-1.343 C194.9,32.13,195.345,31.987,195.404,31.71z M186.006,31.71c0.436,0.135,1.141,0,1.611,0c-0.05,0.26,0.243,0.965-0.269,0.806 c0.286,0.125-1.225,0.008-1.342,0C186.006,32.474,186.014,31.71,186.006,31.71z M193.793,27.681 c1.762,0.377,0.78,0.403-0.269,0.806c0.084-0.05-0.243-0.479-0.268-0.537C193.256,27.95,194.296,27.841,193.793,27.681z M189.765,26.875c0.68-0.076,1.309,0.185,1.611,0.268c2.241,0.58-2.417,0.538-2.417,0.538c-0.201,0.042-0.696,0.756-0.805,0.806 c-0.16,0.058-0.664-0.076-0.806,0v0.537c-0.067-0.059-0.729,0-0.805,0c0.109-0.437-0.143-0.654-0.269-1.074 c0.244-0.042,0.47-0.529,0.537-0.538c0.159-0.033,0.613,0.294,1.074,0.269C188.297,27.647,189.396,26.909,189.765,26.875z M192.45,24.995c1.133,0.101,1.41,0.663,0,0.537V24.995z M178.219,23.652c0.033,0.059,0.705,0,0.805,0 c0.294,0.916,0.092,1.503,0.537,2.418c0.143,0.293,0.889,0.705,1.075,1.074c0.318,0.672,0.243,0.748,0.537,1.344 c-0.471,0.075-1.914,0.654-2.417,0.537c-0.143-0.042-0.529-0.688-0.806-0.806c0-0.143,0.084-0.68,0-0.806 c-0.335-0.461-1.225-0.654-1.342-1.343c-0.067-0.369,0.268-1.612,0.268-1.612c0.202,0.067,0.772,0.277,0.806,0.269 C177.942,24.567,177.959,23.786,178.219,23.652z M186.812,20.161c1.065,1.016,1.452,1.46,2.148,2.954 c-0.101,0.042-0.436,0.353-0.537,0.269c-0.302,0.545-0.377,1.158-0.537,1.611c-0.377,0.008-2.835,0.269-3.759,0 c0,0-0.227-0.781-0.269-0.806c-0.696-0.411-1.519-0.118-2.148-0.538c-0.209-0.142-0.57-1.359-0.268-1.074 c0.059-0.243-0.21-0.697,0.268-0.538c0.034-0.067,0.521-1.074,0.537-1.074c1.234-0.688,2.87,0.403,4.028,0 C186.274,20.966,186.736,20.186,186.812,20.161z M154.784,54.756c0,0,0.559-0.804,1.329-0.175c0.734,0.699,1.503,1.398,0.664,1.923 c-0.56,0.56-1.119,0.14-1.119,0.14l-0.175-1.154L154.784,54.756z M157.65,55.176c0.455-0.314,0.769,0.385,0.769,0.385l0.665,0.175 c0,0,0.14,0.314-0.21,0.524c-0.245,0.629-0.769-0.105-0.769-0.105S157.371,55.91,157.65,55.176z", farbe:'$V->{'Schleswig-Holstein'}' }, th: { name:"Thüringen", text: "$V->{'Thüringen-text'}", cords: "M272.401,230.409 L273.625,230.688 276.283,230.409 277.681,231.807 279.221,231.947 280.618,232.506 281.597,232.506 282.155,233.485 280.897,233.905 280.338,235.164 281.317,236.422 282.018,235.723 282.717,236.702 282.155,237.821 282.435,239.918 283.694,241.737 283.275,243.135 283.694,244.673 284.813,246.212 286.071,246.631 287.61,246.072 289.147,245.513 291.106,246.492 293.063,246.212 295.161,245.932 296.28,247.051 298.519,246.911 300.056,248.03 301.735,247.89 303.134,248.869 303.692,250.547 304.812,252.225 305.931,253.065 305.092,254.183 304.533,255.721 303.272,257.26 302.015,258.099 300.196,258.099 300.196,259.637 301.596,260.896 303.692,261.315 305.232,262.293 305.651,263.552 304.812,265.37 305.651,267.889 308.168,268.168 309.427,267.188 311.805,267.608 313.202,266.349 314.742,266.909 315.021,268.587 315.58,270.405 317.259,271.243 318.518,272.223 320.474,272.643 321.313,271.524 322.992,271.243 325.089,272.083 326.488,272.781 327.327,273.622 327.327,275.021 327.886,276.139 329.845,276.277 331.522,277.118 333.062,276.558 334.46,276.977 335.859,277.397 337.396,276.697 338.376,277.538 339.214,278.097 340.613,277.257 339.775,275.998 340.753,275.159 341.312,273.761 341.872,271.804 340.613,271.664 340.334,269.985 340.893,269.007 341.246,267.448 343.691,266.628 345.089,267.747 347.187,268.587 349.144,268.447 350.821,269.007 351.382,270.823 352.919,272.083 352.22,273.201 355.298,274.181 356.696,275.3 357.396,277.956 357.396,280.755 355.298,280.755 353.48,281.454 352.22,280.613 351.101,282.712 349.284,283.689 347.886,285.368 346.488,283.689 344.809,284.81 342.431,286.348 339.913,287.605 340.474,289.146 339.775,290.822 341.731,292.642 342.011,294.318 343.97,295.858 341.872,298.234 340.192,298.655 338.376,298.655 337.536,299.774 335.997,298.655 335.58,300.752 336.696,300.893 336.696,302.151 334.739,302.71 333.062,302.151 331.942,303.969 330.265,303.409 330.403,301.872 329.705,300.333 330.265,299.075 329.284,298.514 328.168,300.612 326.628,301.593 326.769,302.991 326.209,304.248 324.53,304.947 325.509,306.347 326.907,305.788 327.327,307.325 328.168,308.585 327.187,309.143 326.628,310.122 325.65,310.122 325.23,311.521 326.069,312.78 325.65,313.759 323.972,313.479 322.853,314.038 321.593,313.618 320.056,312.639 318.797,314.458 316.978,314.458 314.601,315.576 313.202,315.718 310.964,315.156 309.286,316.556 308.168,315.576 306.769,315.718 306.769,313.618 305.931,312.639 304.533,313.759 304.533,312.219 303.692,311.66 304.533,308.723 303.972,306.626 302.435,307.186 301.596,306.626 299.639,307.744 299.356,308.723 298.099,309.143 296.98,308.585 296.14,309.143 296.14,310.682 296.422,312.501 296.085,315.031 297.288,317.061 297.589,318.619 296.842,320.33 296.842,322.71 296.001,323.829 294.742,323.268 293.764,323.688 291.79,323.134 290.834,321.41 290.751,319.988 290.396,318.373 289.247,317.964 288.03,318.233 286.213,317.814 285.651,318.793 284.533,318.373 284.253,316.417 282.155,315.297 280.757,315.718 278.938,315.156 276.842,315.576 275.305,316.276 274.884,317.675 273.625,318.094 273.485,319.913 274.884,320.612 274.884,322.149 276.422,322.289 278.38,323.268 277.819,325.227 277.401,326.064 276.003,325.646 274.605,326.064 272.926,325.507 272.507,326.344 272.226,327.884 271.109,327.185 269.849,326.626 268.31,326.205 267.331,325.507 267.472,323.968 266.213,323.13 266.772,322.289 266.632,320.892 266.632,319.632 265.375,319.072 264.955,317.954 263.835,317.814 262.997,318.652 262.018,318.094 261.738,316.556 260.193,315.855 259.07,315.997 257.951,315.718 257.532,314.598 258.091,313.479 257.671,312.639 256.692,312.08 255.993,311.102 256.133,309.422 254.875,308.443 253.196,308.024 251.798,307.325 251.099,305.926 249.84,304.668 248.721,303.969 246.763,304.668 245.645,304.108 244.246,303.13 243.687,304.947 242.568,306.067 241.51,306.071 241.869,305.509 241.869,303.689 242.148,302.01 242.008,300.473 242.288,299.214 243.407,298.514 243.127,296.557 242.288,295.297 241.589,295.297 239.491,295.438 238.372,295.858 238.092,297.535 236.694,297.535 234.596,297.676 234.316,295.858 235.156,293.48 236.414,293.061 236.834,290.543 236.694,288.026 237.393,286.208 237.533,284.81 239.351,285.089 240.33,284.251 241.169,283.41 241.309,282.572 242.428,281.593 241.589,279.914 240.05,279.076 238.652,279.076 237.953,279.635 236.974,277.538 238.092,277.118 240.05,277.956 241.589,277.677 242.428,276.277 241.169,275.579 241.449,273.901 242.008,273.201 244.525,274.321 245.085,273.201 246.064,273.343 246.204,274.46 247.882,274.601 249.141,274.321 249.7,273.622 248.721,272.223 249.42,271.104 248.721,269.985 247.742,269.286 246.344,267.747 247.323,265.789 248.861,265.51 249.141,263.972 249.141,262.433 250.539,261.875 250.539,260.616 249.42,261.176 248.581,259.637 246.344,258.938 244.525,258.938 243.127,257.26 242.708,254.603 241.589,253.344 240.19,252.366 239.491,251.666 238.652,251.106 238.372,249.708 238.372,248.31 239.071,246.771 240.19,246.072 241.309,245.792 242.288,245.093 243.547,246.492 245.085,245.652 246.483,246.212 248.022,246.072 248.721,243.694 249.56,241.876 250.819,242.995 253.196,241.876 254.035,239.639 255.993,239.359 256.833,238.38 258.091,236.842 258.511,235.304 260.614,234.604 262.438,235.304 264.255,236.143 266.353,235.723 267.893,235.863 269.29,237.261 270.548,237.541 270.688,236.422 269.43,233.905 270.409,232.367 ", farbe:'$V->{'Thüringen'}' }
	};
	var current=null,state; for(state in aus)aus[state].color=aus[state].farbe,aus[state].p=R.path(aus[state].cords).attr(attr),aus[state].cords="",function(a,b){a.animate({fill:aus[b].farbe},500);a[0].style.cursor="pointer";a[0].onmouseover=function(){a.animate({fill:"#e0e0ff",stroke:"#f0a0a0"},500);a.toFront();R.safari();current=b;\$("#karte_desc").empty().append("<b>"+aus[b].name+"</b>");\$("#karte_desc2").empty().append(aus[b].text)};a[0].onmouseout=function(){aus[b].color?a.animate({fill:aus[b].color,stroke:"#000000"},500): a.animate({fill:"#cccccc",stroke:"#000000"},500);a.toFront();R.safari();\$("#karte_desc").empty().append("Bitte w&auml;hle ein Bundesland");\$("#karte_desc2").empty()}}(aus[state].p,state);R.setZoom(0.49);
EOF
}

sub gar_keine_umlaute
{
	#my $t=&umlaut_zurueck(shift);
	my $t=shift;
	$t=~s/%C1/A/g;
	$t=~s/%C9/E/g;
	$t=~s/%D3/O/g;
	$t=~s/%EB/e/g;
	$t=~s/%E8/e/g;
	$t=~s/é/e/g;
	$t=~s/%E9/e/g;
	$t=~s/%EF/i/g;
	$t=~s/%F3/o/g;
	$t=~s/%C4/AE/g;
	$t=~s/%D6/OE/g;
	$t=~s/%DC/UE/g;
	$t=~s/%C5/A/g;
	$t=~s/%E4/ae/g;
	$t=~s/%F6/oe/g;
	$t=~s/%FC/ue/g;
	$t=~s/%9E/z/g;
	$t=~s/%E1/a/g;
	$t=~s/%A0/ /g;
	$t=~s/%A1//g;
	$t=~s/%BD//g;

	$t=~s/%(..)/chr(hex($1));/eg;

	$t=~s/&#287;/g/g;
	$t=~s/&#321;/l/g;
	$t=~s/&#539;/t/g;
	$t=~s/&#345;/r/g;
	$t=~s/&#382;/z/g;

	$t=~s/ğ/g/g;
	$t=~s/í/i/g;
	$t=~s/ì/i/g;
	$t=~s/î/i/g;
	$t=~s/ı/i/g;

	$t=~s/&#305;/i/g;




	$t=~s/Á/A/g;
	$t=~s/Ä/A/g;
	$t=~s/À/A/g;
	$t=~s/Å/A/g;
	$t=~s/ã/a/g;
	$t=~s/à/a/g;
	$t=~s/â/a/g;
	$t=~s/á/a/g;

	$t=~s/ć/c/g;
	$t=~s/ç/c/g;


	$t=~s/É/E/g;
	$t=~s/ê/e/g;
	$t=~s/é/e/g;
	$t=~s/è/e/g;
	$t=~s/ë/e/g;

	$t=~s/ł/l/g;

	$t=~s/ñ/n/g;

	$t=~s/ò/o/g;
	$t=~s/ð/o/g;
	$t=~s/ö/oe/g;
	$t=~s/ä/ae/g;
	$t=~s/ü/ue/g;
	$t=~s/Ó/O/g;
	$t=~s/Ò/O/g;
	$t=~s/Ô/O/g;
	$t=~s/ó/o/g;
	$t=~s/ò/o/g;
	$t=~s/ô/o/g;
	$t=~s/Ö/Oe/g;
	$t=~s/Ö/Ae/g;
	$t=~s/Ü/Ue/g;

	$t=~s/ř/r/g;

	$t=~s/Š/S/g;
	$t=~s/Ş/S/g;
	$t=~s/Ș/S/g;
	$t=~s/ś/s/g;
	$t=~s/š/s/g;
	$t=~s/ş/s/g;
	$t=~s/ß/ss/g;

	$t=~s/Ú/U/g;
	$t=~s/ú/u/g;
	$t=~s/ù/u/g;
	$t=~s/ě/e/g;
	$t=~s/ý/y/g;


	$t=~s/Ż/Z/g;
	$t=~s/Ž/Z/g;
	$t=~s/ż/z/g;

	$t=~s/ï/i/g;
	$t=~s/ț/t/g;

	$t=~s/ė/e/g;
	$t=~s/ū/u/g;
	$t=~s/ň/n/g;
	$t=~s/Í/I/g;
	$t=~s/ø/o/g;
	$t=~s/Þ/Th/g;
	$t=~s/Ł/L/g;

	$t=~s/ə/e/g;
	$t=~s/ť/t/g;
	$t=~s/ő/o/g;
	$t=~s/å/a/g;
	$t=~s/ľ/l/g;

	$t=~s/ę/e/g;
	$t=~s/ī/i/g;
	$t=~s/Ø/O/g;
	$t=~s/č/c/g;

	$t=~s/Ľ/L/g;
	$t=~s/ā/a/g;
	$t=~s/Æ/Ae/g;
	$t=~s/Ē/E/g;
	$t=~s/æ/ae/g;
	$t=~s/þ/th/g;
	$t=~s/Ś/S/g;
	$t=~s/ţ/t/g;
	$t=~s/œ/oe/g;
	$t=~s/Č/C/g;
	$t=~s/Ý/Y/g;






	$t=~s/ž/z/g;

	return($t);
}

sub wandel_person
{
	my $nt=shift;
	$nt->{'person'}=~s/; ?$//;
	my $pers="<br/><div class='row text-center'><span class='badge gelb font-lg' style='width:130px;margin-bottom:10px;'><b>$nt->{'datum'}</b></span></div>";
	$pers.="<div class='row'><div class='col-xs-4 text-right'><b>$nt->{'person'}</b></div><div class='col-xs-8 text-muted'>$nt->{'desc'}</div></div>";# if length($nt->{'desc'})>2;
	#$pers.="</li>";
	return($pers);
}

sub cleanVorname
{
	my $v=shift;
	$v=ucfirst($v);
	$v=~s/([\- ])(a-z)/"$1".ucfirst($2)/g;
	return($v);
}

sub bestimmeGeschlecht
{
	my($vorname,$GESCHLECHT)=@_;
	$GESCHLECHT||=$main::VORNAMEN_GESCHLECHT;
	$vorname=&cleanVorname($vorname);
#	foreach my $i (keys %$GESCHLECHT)
#	{
#		if($i eq $vorname)
#		{
#			&main::logge_int("Y: $i = $GESCHLECHT->{$i}");
#		}
#	}
	#$vorname=lc($vorname);
	# Geschlecht?
	#$vorname=lc($vorname);
	return("w") if $vorname eq 'Maria';
	my $ok=0;

	if($vorname=~/^(Alex|Ashley|Charlie|Joe|Lee|Maik|Luca|Noah|Nico|Tim|Noel|Leo)$/)
	{
		return("m");
	}

	my @temp=split(/ |-/,$vorname);
	my %gesch;
	my $geschlecht;
	foreach my $i (@temp)
	{
		#warn("Suche $i");
		next if !exists($GESCHLECHT->{$i});
		if($i=~/^(Alex|Ashley|Charlie|Joe|Lee|Maik|Luca|Noah|Nico|Tim|Noel|Leo)$/)
		{
			#print "HHH: $i = $GESCHLECHT->{$i}\n" if $i eq "Luca" or $i eq "Felix";
			++$gesch{'m'};
		} else
		{
			#print "XXX: $i = $GESCHLECHT->{$i}\n" if $i eq "Luca" or $i eq "Felix";
			++$gesch{$GESCHLECHT->{$i}};
		}
		#&main::logge_int("Gefunden $i = $GESCHLECHT->{$i}");
		#next if $GESCHLECHT{lc($i)}=~/[mw]{2}/;
		#print "\t- $i = ".$GESCHLECHT{lc($i)}."\n";

		$geschlecht||=$GESCHLECHT->{$i};
	}
	#exit;
	my @k=keys %gesch;
	#print "KKK: @k\t$vorname\n" if $vorname=~/Luca Felix/;
	if($#k>0)
	{
		if($gesch{'m'}>$gesch{'w'})
		{
			return('m');
		} elsif($gesch{'w'}>$gesch{'m'})
		{
			return('w');
		} else
		{
			return($geschlecht);
		}
	} elsif ($#k<0)
	{
#		print "\t- Fehler2 bei $vorname\n";
		if($vorname=~/^(Jill|Anne|Joan)/)
		{
			return("w");
		} elsif($vorname=~/^(Alex|Ashley|Charlie|Joe|Lee|Maik|Luca|Noah|Nico|Tim|Noel|Leo)$/)
		{
			return("m");
		}
		return;
	}
	return($k[0] || $geschlecht);
}

sub splitVornameNachname
{
	my $v=shift;
	$v=~s/^\s+//;
	$v=~s/\s+$//;
	my %name=(
		'orig'=>$v
	);

	if($v=~s/ ['"](.*?)['"] ?//)
	{
		$name{'spitzname'}=$1;
	}
	$v=~s/ [IVXL]+$//;
	$v=~s/^Sir //;
	$v=~s/^Dr\. //;

	my %flags;
	if($v=~s/ Jr\. ?// or $v=~s/^Junior //)
	{
		$flags{'junior'}=1;
	}

	if($v=~/^(.*?), (.*?)$/)
	{
		$name{'vn'}=$2;
		$name{'nn'}=$1;

		if($name{'vn'}=~s/ (auf de[nmr]|le|da|de|de la|d[ae]l|di|dos|du|te|ten|v[oa]n|vom|el|st\.)$//i)
		{
			$name{'nn'}="\u$1 $2 $name{'nn'}";
			#die("O: $name{'vn'} | $name{'nn'}") if $v=~/Antonio de/;
		}
		#die("K $name{'vn'}");
	} elsif($v=~/^(.*?) (auf de[nmr]|le|da|de|d[ae]l|di|dos|du|te|ten|v[oa]n|vom|el|st\.) (.*?)$/i)
	{
		$name{'vn'}=$1;
		$name{'nn'}="\u$2 $3";
	} else
	{
		my @parts=split(/ /,$v);
		if($#parts>-1)
		{
			$name{'nn'}=pop(@parts);
			$name{'vn'}=join(" ",@parts);
		} else
		{
			$name{'vn'}=$v;
		}
	}
	if($name{'vn'}=~/ geb\.$/)
	{
		$name{'vn'}=~s/ (.*?) geb\.$//;
		#die("V: $name{'vn'}");
	}

	$name{'vn'}=~s/\s+/ /g;
	$name{'nn'}=~s/\s+/ /g;

	return(\%name);
}

sub findeBeruf
{
	my ($beruf,$streng)=@_;
	$beruf=lc($beruf);
	$beruf=~s/ß/ss/;
	$beruf=~s/^\s+//;
	$beruf=~s/\s+$//;
	if(exists($BERUFE{$beruf}))
	{
		return($BERUFE{$beruf});
	}
	return(-1) if $streng>0;
	foreach my $i (keys %BERUFE)
	{
		if($beruf=~/^$i/)
		{
			return($BERUFE{$i});
		}
	}
	#die("Unbekannter Beruf: $beruf");
	return(-1);
}

sub existiertBeruf
{
	my $beruf=shift;
	return(1) if $beruf=~/:Würdenträger/;
	foreach my $i (keys %BERUFE)
	{
		return(1) if $BERUFE{$i} eq $beruf;
	}
	return(-1);
}

sub getLaenderKuerzel
{
	my $land=lc(shift);
	$land=~s/^\s+//;
	$land=~s/\s+$//;
	$land=~s/ß/ss/;
	#$land=~s/französisch(er|es|e)?/frankreich/i;
	$land=~s/([öÖ]sterreich)isch(er|es|e)?/$1/i;
	#$land=~s/(us-amerikanisch|kolumbisch|irisch|australisch|niederländisch|mexikanisch|sowjetisch|spanisch|deutsch)(er|es|e)/$1/i;

	#warn("Suche ".lc($land));
	return($LAENDER{lc($land)}) if exists($LAENDER{$land});

	#if($land=~/ /)
	#{
		foreach my $i (keys %LAENDER)
		{
			if($land=~/^$i/)
			{
				return($LAENDER{$i});
			}
			my $dum=$land;
			#warn("Suche 2: $dum in $i");
			if($dum=~s/(er|es|e)$//)
			{
				#warn("Suche 2: $dum in $land");
				eval{
					if($land=~/^$dum/)
					{
						return($LAENDER{$dum});
					}
				};
			}
		}
	#}
	my $erg=$main::lcm->country2code($land);
	return($erg) if $erg;

#	warn("Unbekanntes Land: $land");
	return(-1);
}

sub getBedeutung()
{
	my $vorname=shift;
	my $bedeutung=shift;
	my $geschlecht=shift;
	my $parent=shift;
	my $no_footer=shift;

	#&main::logge_int("Check: $vorname / $geschlecht");
	my $vorname_orig=$vorname;
	return('') if length($bedeutung)<3;

	my $einl_lang="";
	my $einl_kurz="";

	my $bed_lang="";
	my $bed_kurz="";

	#&main::logge_int("Level 1:	$vorname	$bedeutung (Parent: $parent)");

	my @parts=split(/;/,$bedeutung);

	if($#parts>0)
	{
		my $anz=($#parts+1);
		if(!$parent)
		{
			my @temp=&main::mischeListe(
				"Es gibt mehrere Definitionen für den Vornamen $vorname",
				"Es gibt mehr als eine Übersetzung für den Vornamen $vorname",
				"Für $vorname gibt es mehr als eine Übersetzung",
				"Für $vorname gibt es mehrere Bedeutungen",
				"Für den Namen $vorname konnten wir mehrere Bedeutungen finden",
				"Für den Namen $vorname haben wir mehrere Bedeutungen in unserer Datenbank",
				"Für den Vornamen $vorname gibt es mehrere Bedeutungen",
				"Für den Vornamen $vorname haben wir mehrere Erklärungen",
			);
			$einl_lang=shift(@temp).": ";

			@temp=&main::mischeListe(
				"Für $vorname sind mehrere Definitionen möglich",
				"Für $vorname haben wir mehrere Bedeutungen",
				"Für $vorname haben wir mehrere Erklärungen",
				"Mehr als eine Übersetzung",
				"Für $vorname sind mehrere Ableitungen möglich",
				"Für $vorname sind mehrere Bedeutungen möglich",
				"Für den Namen $vorname haben wir mehrere Bedeutungen gefunden",
				"Für den Namen $vorname haben wir mehrere Bedeutungen in unserer Datenbank",
				"Für den Vornamen $vorname haben wir mehrere Bedeutungen gefunden",
				"Für den Vornamen $vorname haben wir mehrere Bedeutungen in unserer Datenbank",
				"Es sind mehrere Bedeutungen vorhanden",
				"Es sind mehrere Herleitungen vorhanden",
				"Mehrere Bedeutungen möglich",
				"Für die Bedeutung kommen mehrere Herleitungen in Frage",
				"Wir haben mehrere Bedeutungen gefunden",
				"Es sind verschiedene Bedeutungen möglich",
			);
			$einl_kurz=shift(@temp).": ";
		} else
		{
			#$einl_kurz="$vorname: ";
		}
	} else
	{
		#&main::logge_int("Level 2:	Nur 1 Part gefunden:");
		#&main::logge_int("\t$parts[0]");
		my @temp=&main::mischeListe(
			"Für den  Vornamen $vorname haben wir die folgende Bedeutung gefunden",
			"Der Vorname $vorname hat folgende Bedeutung",
		);
		#$einl_lang=shift(@temp).":<br/><br/>";
	}

	my @defs;
	my @defs_kurz;
	foreach my $i (@parts)
	{
		#$i=encode_utf8($i);

		my $temp="";
		my $herkunft="";
		if($i=~/^(.*?):(.*?)(;|$)/)
		{
			$herkunft=&main::check_is_utf8($1);
			$temp=$2;
		} else
		{
			$temp=$i;
		}
		my $zielwort="";
		#$herkunft=encode_utf8($herkunft);

		#&main::logge_int("XXX: $herkunft: $erg");

		#
		# Letztendliche Übersetzung kann mit ~ angehängt werden
		# altdeutsch:bald=kühn&hraban=Rabe~Der kühne Rabe
		#
		if($temp=~s/~(.*?)$//)
		{
			$zielwort=$1;
		}

		my %def;
		my @subparts;
		my @subparts_kurz;
		push(@subparts,"\u$herkunft");

		if(length($herkunft)>0)
		{
			$def{'herkunft'}=$herkunft;
		}
		if(length($zielwort)>2)
		{
		#	$kurzstring.="\"$zielwort\"";
		}

		foreach my $j (split(/&/,$temp))
		{
			#&main::logge_int("\t\C: $j");
			if($j=~/=/)
			{
				my ($wort,$ueber)=split(/=/,$j);
				if($ueber=~/^(.*?)\/(.*?)\/(.*?)$/ or $ueber=~/^(.*?)\/(.*?)$/)
				{
					my($t1,$t2,$t3)=($1,$2,$3);

					my @ww=&main::mischeListe(
						"\"$t1\" (oder \"$t2\")",
						"\"$t1\" bzw. \"$t2\"",
						"\"$t1\" oder \"$t2\"",
						"\"$t1\" oder auch \"$t2\""
					);
					if(!$zielwort)
					{
						#$kurzstring.=shift(@ww);
					}

					my @x=&main::mischeListe(". Auch möglich wäre die Übersetzung:  "," bzw. "," beziehungsweise "," oder "," oder auch ",". Oder auch "," bzw. ");
					if(length($t3)>2)
					{
						$ueber="\"$t1\"".shift(@x)."\"$t2\" ".shift(@x)." \"$t3\"";;
					} else
					{
						$ueber="\"$t1\"".shift(@x)."\"$t2\"";
					}
				} else
				{
					$ueber="\"$ueber\"";
				}
				if(length($ueber)>0)
				{

				#	$def{'uebersetzung'}=$ueber;
					#push(@subparts,"<i>$wort</i> = $ueber");
					my @sp=split(/\//,$wort);
					if($#sp==1)
					{
						my @x=&main::mischeListe("bzw. ","beziehungsweise","oder","oder auch",". Oder auch für");
						$wort=join("</i> ".shift(@x)." <i>",@sp);
					} else
					{
						$wort=$sp[0];
					}
				} else
				{
					if($wort=~/^(.*?)\/(.*?)\/(.*?)$/ or $wort=~/^(.*?)\/(.*?)$/)
					{
						my($t1,$t2,$t3)=($1,$2,$3);
						my @x=&mischeListe("bzw.","beziehungsweise","oder","oder auch","ggf. auch");
						if(length($t3)>2)
						{
							$wort="\"$t1\" ".shift(@x)." \"$t2\" ".shift(@x)." \"$t3\"";
						} else
						{
							$wort="\"$1\" ".shift(@x)." \"$2\"";
						}
					} else
					{
						$wort="\"$wort\"";
					}
				#	$def{'uebersetzung'}=$wort;
					#push(@subparts,"$wort");
				}
				push(@{$def{'ausgangswort'}},{
					wort			=> $wort,
					uebersetzung	=> $ueber
				});
			} else
			{
				#&main::logge_int("XXX: $j");
				my $wort;
				if($j=~/^(.*?)\/(.*?)\/(.*?)$/ or $j=~/^(.*?)\/(.*?)$/)
				{
					my($t1,$t2,$t3)=($1,$2,$3);
					my @x=&mischeListe("bzw.","beziehungsweise","oder","oder auch","ggf. auch");
					if(length($t3)>2)
					{
						$wort="\"$t1\" ".shift(@x)." \"$t2\" ".shift(@x)." \"$t3\"";
					} else
					{
						$wort="\"$1\" ".shift(@x)." \"$2\"";
					}
				} else
				{
					$wort="\"$j\"";
				}
				#$bedk="";
				#push(@temp,"\u$spr f&uuml;r $temp");
				#push(@subparts,"$wort");
				#$def{'uebersetzung'}=$wort;

				push(@{$def{'ausgangswort'}},{
					wort			=> $wort,
					#uebersetzung	=> $ueber
				});
			}
			#&main::logge_int("KS: $kurzstring");

		}



		# Zieltext vorhanden?
		if(length($zielwort)>1)
		{
			my $ztemp="";
			my $ztemp_kurz="";
			if($zielwort=~/\//)
			{
				my @temp2=split(/\//,$zielwort);
				my @x=&main::mischeListe(
					"oder",
					"oder auch",
					"ggf. auch"
				);
				$ztemp_kurz="\"$temp2[0]\" ".shift(@x)." \"$temp2[1]\"";
				if($#temp2==1)
				{
					$ztemp.="\"$temp2[0]\" ".shift(@x)." \"$temp2[1]\"";

				} else
				{
					$ztemp.='"'.join('", "',@temp2[0..$#temp2-1]);
					$ztemp.='" '.shift(@x)." \"".$temp2[$#temp2].'"';
					#"\"$temp[0]\" ".shift(@x)." \"$temp[1]\"";
				}
				#&main::logge_int("XXXX: $ztemp");
				$def{'zielwort'}=$ztemp;


				if($herkunft)
				{
					my @ww=&main::mischeListe(
						"\u$herkunft $ztemp_kurz",
						"\u$herkunft: $ztemp_kurz",
						"\u$herkunft für $ztemp_kurz"
					);
					push(@subparts_kurz,shift(@ww));
				} else
				{
					push(@subparts_kurz,$ztemp_kurz);
				}
				#$kurzstring.="\"$temp2[0]\" $x[1] \"$temp2[1]\"";

				#$ziel
			} else
			{
				$def{'zielwort'}="\"$zielwort\"";
				if($herkunft)
				{
					my @ww=&main::mischeListe(
						"\u$herkunft $zielwort",
						"\u$herkunft: $zielwort",
						"\u$herkunft für $zielwort",
						"\u$herkunft für: $zielwort",
						"Auf \u$herkunft: $zielwort"
					);
					push(@subparts_kurz,shift(@ww));
				} else
				{
					push(@subparts_kurz,$ztemp_kurz);
				}

				#$bedk.="\"$zielwort\" von ";
				#$bedl.="\"$zielwort\" von ";
			}
		} else
		{
			#
			# Kein Zielwort vorhanden
			#
			#push(@subparts_kurz,$ztemp_kurz);
		}
		push(@defs_kurz,@subparts_kurz);

		#&main::logge_int("Herkunft:\t\t$herkunft");
		#&main::logge_int("Ausgangswort:\t".join("> ",@{$def{'ausgangswort'}}));
		#&main::logge_int("Zielwort:\t\t$def{'zielwort'}");
		#&main::logge_int("Defs_kurz:\t\t@defs_kurz");

		if(exists($def{'herkunft'}) && exists($def{'ausgangswort'}) && exists($def{'zielwort'}))
		{
			my @erkl=@{$def{'ausgangswort'}};
			if($#erkl==0)
			{
				if(exists($erkl[0]->{'uebersetzung'}) && exists($erkl[0]->{'wort'}))
				{
					#&main::logge_int("Bin bei 1:");
					my @ww=&main::mischeListe(
						"Den \l$def{'herkunft'}en Ausdruck <i>$erkl[0]->{'wort'}</i> kann man übersetzen mit $erkl[0]->{'uebersetzung'}",
						"Die Bedeutung setzt sich zusammen aus dem \l$def{'herkunft'}en Ausdruck <i>$erkl[0]->{'wort'}</i> = $erkl[0]->{'uebersetzung'}",
						"Die Bedeutung setzt sich zusammen aus dem \l$def{'herkunft'}en Ausdruck <i>$erkl[0]->{'wort'}</i>, was soviel wie $erkl[0]->{'uebersetzung'} bedeutet"
					);
					$temp=shift(@ww);

					@ww=&main::mischeListe(
						". Sinngemäß bedeutet $vorname also $def{'zielwort'}",
						". $vorname bedeutet also $def{'zielwort'}",
						". $vorname bedeutet demzufolge $def{'zielwort'}",
						". Die Bedeutung von $vorname ist demzufolge $def{'zielwort'}",
					);
					$temp.=shift(@ww);
				} elsif(exists($erkl[0]->{'uebersetzung'}))
				{
					#&main::logge_int("WUUUUUUUUUUUUUUUUUUUU: $erkl[0]->{'uebersetzung'}");
				}  elsif(exists($erkl[0]->{'wort'}))
				{
					push(@subparts_kurz,"\u$def{'herkunft'} $erkl[0]->{'wort'}");

					my @ww=&main::mischeListe(
						"Auf \l$def{'herkunft'} bedeutet das <i>$erkl[0]->{'wort'}</i>. Als Vorname bedeutet es also $def{'zielwort'}",
						"Auf \l$def{'herkunft'} ist die Bedeutung <i>$erkl[0]->{'wort'}</i>. Der Vorname bedeutet also $def{'zielwort'}",
						"Auf \l$def{'herkunft'} ist die Bedeutung <i>$erkl[0]->{'wort'}</i>. Der Vorname bedeutet demzufolge $def{'zielwort'}",
						#"\u$def{'herkunft'} für <b>$def{'zielwort'}</b>. Die Bedeutung setzt sich zusammen aus $def{'ausgangswort'} = $def{'zielwort'}"
					);
					$temp=shift(@ww);

				}

			} else
			{
				#&main::logge_int("Bin bei 2:");
				my @n;
				foreach my $e (@erkl)
				{
					#&main::logge_int("C: $e->{'wort'} / $e->{'uebersetzung'}");
					my @ww;
					if($#n>-1)
					{
						if(exists($e->{'uebersetzung'})  && exists($e->{'wort'}))
						{
							@ww=&main::mischeListe(
								"<i>$e->{'wort'}</i> bedeutet soviel wie $e->{'uebersetzung'}",
								"<i>$e->{'wort'}</i> bedeutet $e->{'uebersetzung'}",
								"<i>$e->{'wort'}</i> (\l$def{'herkunft'}) bedeutet $e->{'uebersetzung'}",
								"Das \l$def{'herkunft'}e <i>$e->{'wort'}</i> bedeutet $e->{'uebersetzung'}",
								"Der \l$def{'herkunft'}e Ausdruck <i>$e->{'wort'}</i> steht für $e->{'uebersetzung'}",
								"Das \l$def{'herkunft'}e Wort <i>$e->{'wort'}</i> steht für $e->{'uebersetzung'}",
								"Das \l$def{'herkunft'}e Wort <i>$e->{'wort'}</i> bedeutet $e->{'uebersetzung'}",
								"<i>$e->{'wort'}</i> steht für $e->{'uebersetzung'}",
							);
						} elsif(exists($e->{'wort'}))
						{
							@ww=&main::mischeListe(
								"Das ist der \l$def{'herkunft'}e Ausdruck für $e->{'uebersetzung'}",
							);
						}
					} else
					{
						if(exists($e->{'uebersetzung'}) && exists($e->{'wort'}))
						{
							@ww=&main::mischeListe(
								"Der \l$def{'herkunft'}e Ausdruck <i>$e->{'wort'}</i> bedeutet soviel wie $e->{'uebersetzung'}",
								"Der \l$def{'herkunft'}e Ausdruck <i>$e->{'wort'}</i> bedeutet $e->{'uebersetzung'}",
								"Der Ausdruck <i>$e->{'wort'}</i> (\l$def{'herkunft'}) bedeutet $e->{'uebersetzung'}",
								"Das \l$def{'herkunft'}e <i>$e->{'wort'}</i> bedeutet $e->{'uebersetzung'}",
								"Der \l$def{'herkunft'}e Ausdruck <i>$e->{'wort'}</i> steht für $e->{'uebersetzung'}",
								"Das \l$def{'herkunft'}e <i>$e->{'wort'}</i> steht für $e->{'uebersetzung'}",
							);
						} elsif(exists($e->{'wort'}))
						{
							@ww=&main::mischeListe(
								"Das ist der \l$def{'herkunft'}e Ausdruck für $e->{'wort'}",
							);
						}
					}
					push(@n,lcfirst(shift(@ww)));
				}
				$temp=ucfirst(join(" und ",@n));
				my @ww=&main::mischeListe(
					". Bei dieser Version bedeutet $vorname also $def{'zielwort'}",
					". $vorname bedeutet in dieser Version also $def{'zielwort'}",
					". $vorname bedeutet demzufolge $def{'zielwort'}, folgt man dieser Version",
					". Die Bedeutung von $vorname ist in dem Fall dann $def{'zielwort'}",
					". Die Bedeutung von $vorname wäre in dem Fall dann $def{'zielwort'}",
					". Die sinngemäße Bedeutung von $vorname wäre in dem Fall dann $def{'zielwort'}",
					". Bei dieser Variante wäre die Bedeutung von $vorname dann $def{'zielwort'}",
					", in dem Falle wäre die Bedeutung eher $def{'zielwort'}",
					", in diesem Falle ist die Bedeutung eher $def{'zielwort'}",
				);
				$temp.=shift(@ww).". ";

				if($#defs>-1)
				{
					$temp="Oder \l$temp";
					#push(@defs,"Oder $temp");
				} else
				{
					#push(@defs,$temp);
				}
				#my @ww=&main::mischeListe(
					#"",#kann man übersetzen mit $def{'uebersetzung'}. Die Bedeutung wäre also $def{'zielwort'}",
					#"\u$def{'herkunft'} für <b>$def{'zielwort'}</b>. Die Bedeutung setzt sich zusammen aus $def{'ausgangswort'} = $def{'zielwort'}"
				#);
				#$temp=shift(@ww);
			}
		} elsif(exists($def{'herkunft'}) && exists($def{'ausgangswort'}))
		{
			my @erkl=@{$def{'ausgangswort'}};
			#&main::logge_int("Bin bei 1a (".($#erkl+1).")");
			if($#erkl==0)
			{
				#&main::logge_int("Bin bei 1a a");
				my @ww;
				if(exists($erkl[0]->{'uebersetzung'}) && exists($erkl[0]->{'wort'}))
				{
					@ww=&main::mischeListe(
						"Die Übersetzung aus dem \l$def{'herkunft'}en für das Wort <i>$erkl[0]->{'wort'}</i> lautet $erkl[0]->{'uebersetzung'}.",
						"Das \l$def{'herkunft'}e <i>$erkl[0]->{'wort'}</i> steht für $erkl[0]->{'uebersetzung'}.",
						"Das \l$def{'herkunft'}e Wort <i>$erkl[0]->{'wort'}</i> steht für $erkl[0]->{'uebersetzung'}.",
						"Das \l$def{'herkunft'}e Wort <i>$erkl[0]->{'wort'}</i> bedeutet $erkl[0]->{'uebersetzung'}.",
						"\u$def{'herkunft'} <i>$erkl[0]->{'wort'}</i> für $erkl[0]->{'uebersetzung'}.",
						"\u$def{'herkunft'} <i>$erkl[0]->{'wort'}</i> =&gt; $erkl[0]->{'uebersetzung'}."
					);
				} elsif(exists($erkl[0]->{'wort'}))
				{
					if($def{'herkunft'}!~/i$/)
					{
						@ww=&main::mischeListe(
							"Auf $def{'herkunft'} bedeutet $vorname soviel wie <i>$erkl[0]->{'wort'}</i>.",
							"$def{'herkunft'} $vorname = <i>$erkl[0]->{'wort'}</i>.",
							"Die \u$def{'herkunft'}e Bedeutung für $vorname lautet <i>$erkl[0]->{'wort'}</i>.",
							"Die \u$def{'herkunft'}e Übersetzung für $vorname lautet sinngemäß <i>$erkl[0]->{'wort'}</i>.",
							"Im \u$def{'herkunft'}en wird der Vorname als <i>$erkl[0]->{'wort'}</i> interpretiert.",
							"Im \u$def{'herkunft'}en bedeutet $vorname soviel wie <i>$erkl[0]->{'wort'}</i>.",
							"Im \u$def{'herkunft'}en steht $vorname für <i>$erkl[0]->{'wort'}</i>.",
							"Im \u$def{'herkunft'}en steht der Vorname $vorname für den Ausdruck <i>$erkl[0]->{'wort'}</i>.",
							"In der \l$def{'herkunft'}en Sprache wird der Vorname als <i>$erkl[0]->{'wort'}</i> interpretiert."
						);
					} elsif($def{'herkunft'}=~/hindi/i)
					{
						@ww=&main::mischeListe(
							"Im Hinduismus wird der Vorname als <i>$erkl[0]->{'wort'}</i> interpretiert.",
							"Im Hinduismus steht der Vorname für <i>$erkl[0]->{'wort'}</i>."
						);
					}
				} elsif(exists($erkl[0]->{'uebersetzung'}))
				{
					@ww=&main::mischeListe(
						"Im \u$def{'herkunft'}en wird der Vorname als <i>$erkl[0]->{'uebersetzung'}</i> interpretiert."
					);
				}
				$temp=shift(@ww);
				#&main::logge_int(">>>>>>>>> $temp");
				if(exists($erkl[0]->{'uebersetzung'}))
				{
					push(@defs_kurz,"\u$def{'herkunft'} für $erkl[0]->{'uebersetzung'}");
				} elsif(exists($erkl[0]->{'wort'}))
				{
					push(@defs_kurz,"\u$def{'herkunft'} für $erkl[0]->{'wort'}");
				}
			} else
			{
				my @ww;
				if(exists($erkl[0]->{'uebersetzung'}) && exists($erkl[0]->{'wort'}))
				{
					#&main::logge_int("Bin bei 1a a");
					@ww=&main::mischeListe(
						"Die Übersetzung aus dem \l$def{'herkunft'}en für das Wort <i>$erkl[0]->{'wort'}</i> lautet $erkl[0]->{'uebersetzung'}",
						"Das \l$def{'herkunft'}e <i>$erkl[0]->{'wort'}</i> steht für $erkl[0]->{'uebersetzung'}",
						"Das \l$def{'herkunft'}e Wort <i>$erkl[0]->{'wort'}</i> steht für $erkl[0]->{'uebersetzung'}",
						"Das \l$def{'herkunft'}e Wort <i>$erkl[0]->{'wort'}</i> bedeutet $erkl[0]->{'uebersetzung'}",
						"\u$def{'herkunft'} <i>$erkl[0]->{'wort'}</i> für $erkl[0]->{'uebersetzung'}",
						"\u$def{'herkunft'} <i>$erkl[0]->{'wort'}</i> =&gt; $erkl[0]->{'uebersetzung'}"
					);
				} elsif(exists($erkl[0]->{'wort'}))
				{
					#&main::logge_int("Bin bei 1a b");
					@ww=&main::mischeListe(
						"Im \u$def{'herkunft'}en wird der Vorname als <i>$erkl[0]->{'wort'}</i> interpretiert",
						"In der \l$def{'herkunft'}en Sprache wird der Vorname als <i>$erkl[0]->{'wort'}</i> interpretiert"

					);
				} elsif(exists($erkl[0]->{'uebersetzung'}))
				{
					#&main::logge_int("Bin bei 1a c");
					@ww=&main::mischeListe(
						"Im \u$def{'herkunft'}en wird der Vorname als <i>$erkl[0]->{'uebersetzung'}</i> interpretiert"
					);
				} else
				{
					&main::logge_int("vornamen.pl: FEHLER 834u28934");
				}
				$temp=shift(@ww);

				if(exists($erkl[1]->{'uebersetzung'}) && exists($erkl[1]->{'wort'}))
				{
					#&main::logge_int("Bin bei 1a ab");
					@ww=&main::mischeListe(
						", während die Übersetzung für den zweiten Teil (<i>$erkl[1]->{'wort'}</i>) $erkl[1]->{'uebersetzung'} lautet",
						", während die Bedeutung für <i>$erkl[1]->{'wort'}</i> $erkl[1]->{'uebersetzung'} ist",
						" und das Wort <i>$erkl[1]->{'wort'}</i> steht für $erkl[1]->{'uebersetzung'}",
						". Das Wort <i>$erkl[1]->{'wort'}</i> dagegegen bedeutet $erkl[1]->{'uebersetzung'}",
					);
				} elsif(exists($erkl[0]->{'wort'}))
				{
					#&main::logge_int("Bin bei 1a b");
					@ww=&main::mischeListe(
						"Im \u$def{'herkunft'}en wird der Vorname als <i>$erkl[1]->{'wort'}</i> interpretiert",
						"In der \l$def{'herkunft'}en Sprache wird der Vorname als <i>$erkl[0]->{'wort'}</i> interpretiert"

					);
				} elsif(exists($erkl[0]->{'uebersetzung'}))
				{
					#&main::logge_int("Bin bei 1a c");
					@ww=&main::mischeListe(
						"Im \u$def{'herkunft'}en wird der Vorname als <i>$erkl[0]->{'uebersetzung'}</i> interpretiert"
					);
				} else
				{
					&main::logge_int("vornamen.pl: FEHLER 483934");
				}
				$temp.=shift(@ww).". ";
				#&main::logge_int(">>>>>>>>> $temp");
				my $w2;
				if($#erkl>0)
				{
					my ($w1,$w2);
					if(exists($erkl[0]->{'uebersetzung'}))
					{
						$w1="\u$def{'herkunft'} für $erkl[0]->{'uebersetzung'}";
					} else
					{
						$w1="\u$def{'herkunft'} für $erkl[0]->{'wort'}";
					}
					if(exists($erkl[1]->{'uebersetzung'}))
					{
						$w2=$erkl[1]->{'uebersetzung'};
					} else
					{
						$w2=$erkl[1]->{'wort'};
					}
					push(@defs_kurz,"$w1 und $w2");
				} else
				{
					push(@defs_kurz,"\u$def{'herkunft'} für $erkl[0]->{'uebersetzung'}");
				}
			}
		} else
		{
			#&main::logge("\tLEVEL 3 bei $vorname");
		}
		#&main::logge_int("XXX: @defs_kurz");
		#$temp=join(" ",@subparts);

		$def{'ziel'}=$temp;

#		if(length($temp)>130)
#		{
#			$temp=substr($temp,0,127)." <i>[...]</i>";
#		}
		push(@defs,$temp);
	}



	#&main::logge_int("K: $defs_kurz[0] / $bedeutung");
	if($#defs_kurz>0)
	{
		$einl_kurz.="<ul class='fa-ul'>";
		map { $einl_kurz.="<li><i class='fa-li fa fa-info-circle text-gelb'></i> $_</li>" if length($_)>2 } @defs_kurz;
		$einl_kurz.="</ul>";
	} elsif($#defs_kurz==0 && length($defs_kurz[0])>2)
	{
		$einl_kurz.=$defs_kurz[0];
		if(!$no_footer)
		{
			$einl_kurz.="<br/><br/>";
		}
	} elsif(length($bedeutung)>2)
	{
		$einl_kurz.=$bedeutung;
		if(!$no_footer)
		{
			$einl_kurz.="<br/><br/>";
		}
	}
	#&main::logge_int("K: $einl_kurz");

	if($#defs>0)
	{
		$einl_lang.="<ul class='fa-ul'>";
		map { $einl_lang.="<li><i class='fa-li fa fa-info-circle text-gelb'></i> $_</li>" } @defs;
		$einl_lang.="</ul>";
	} else
	{
		$einl_lang.=$defs[0];
		if(!$no_footer)
		{
			$einl_lang.="<br/><br/>";
		}
	}

	$bed_lang=$einl_lang;
	$bed_kurz=$einl_kurz;

	if($no_footer<1)
	{
		if(length($bed_kurz)>10)
		{
			my @ww=&main::mischeListe(
				"Mehr über die Bedeutung von $vorname",
				"Vollständige Bedeutung von $vorname",
				"Vollständige Bedeutung von $vorname zeigen",
				"Erklärung zur Bedeutung zeigen",
				"Erklärung zur Bedeutung aufrufen",
				"$vorname: Vollständige Namensbedeutung",
				"Erklärung zur Bedeutung",
				"Erklärung zur Bedeutung anzeigen",
				"Erklärungen zur Bedeutung anzeigen",
				"Erklärung zur Bedeutung von $vorname anzeigen",
				"Alles über die Bedeutung von $vorname",
			);
			$bed_kurz.="<i class='fa fa-arrow-circle-right text-gelb'></i> <a href='/vornamen/$geschlecht/$vorname_orig/bedeutung.html'>".shift(@ww)."</a>";
		} elsif(!$parent)
		{
			my @ww=&main::mischeListe(
				"Leider ist uns noch keine Bedeutung von $vorname bekannt",
				"Für den Vornamen $vorname konnten wir keine Hinweise oder Hintergrundinformationen zur Bedeutung finden",
				"Eine Bedeutung von $vorname ist uns leider bisher nicht bekannt",
				"Eine Bedeutung von $vorname haben wir bisher nicht finden können",
				"Eine Namensbedeutung von $vorname haben wir bisher leider nicht finden können",
				"Zu $vorname haben wir bisher keine Bedeutung finden können",
				"Die Bedeutung von $vorname ist uns leider bis dato unbekannt",
			);
			$bed_kurz="<span class='text-muted'>".shift(@ww)."</span><br/><br/>";
			@ww=&main::mischeListe(
				"Hintergrund-Infos von $vorname anzeigen",
				"Du kennst die Bedeutung von $vorname?",
				"Bedeutung von $vorname eintragen",
				"Mitmachen und Bedeutung eintragen",
				"Zeige alle Hintergrund-Infos von $vorname",
			);
			$bed_kurz.="<i class='fa fa-arrow-circle-right text-gelb'></i> <a href='/vornamen/$geschlecht/$vorname/bedeutung.html'>".shift(@ww)."</a>";
		}
	}
	$bed_lang=~s/###(.*?)###/&%$1;/g;
	$bed_kurz=~s/###(.*?)###/&%$1;/g;
	#&main::logge_int("G: $bed_kurz");
#	my $erg=&main::check_is_utf8($bed_kurz);
#	&main::logge_int("$vorname: $erg");
	return($bed_lang,$bed_kurz);
	return(encode_utf8($bed_lang),encode_utf8($bed_kurz));
}
1;

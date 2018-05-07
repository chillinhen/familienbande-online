use strict;
my $Cookie_Exp_Date = ''; #'Mon, 04-Jun-2007 12:00:00 GMT';
my $Cookie_Path = '/';
my $Secure_Cookie = '0';
my $Cookie_Domain;

my %Cookies;
my @Cookie_Encode_Chars = ('\%', '\+', '\;', '\,', '\=', '\&', '\:\:', '\s');
my %Cookie_Encode_Chars = ('\%',   '%25',
                        '\+',   '%2B',
                        '\;',   '%3B',
                        '\,',   '%2C',
                        '\=',   '%3D',
                        '\&',   '%26',
                        '\:\:', '%3A%3A',
                        '\s',   '+');

my @Cookie_Decode_Chars = ('\+', '\%3A\%3A', '\%26', '\%3D', '\%2C', '\%3B', '\%2B', '\%25');

my %Cookie_Decode_Chars = ('\+',       ' ',
                        '\%3A\%3A', '::',
                        '\%26',     '&',
                        '\%3D',     '=',
                        '\%2C',     ',',
                        '\%3B',     ';',
                        '\%2B',     '+',
                        '\%25',     '%');

sub GetCookies {
    my(@ReturnCookies) = @_;
    my($cookie_flag) = 0;
    my($cookie,$value);
    # If the HTTP_COOKIE environment variable has been set by the call to    #
    # this script, meaning the browser sent some cookies to us, continue.    #
	%Cookies=();
    if ($ENV{'HTTP_COOKIE'}) {

        # If specific cookies have have been requested, meaning the          #
        # @ReturnCookies array is not empty, proceed.                        #
         foreach (split(/; /,$ENV{'HTTP_COOKIE'}))
			{
                ($cookie,$value) = split(/=/);
                $Cookies{$cookie} = $value;
         }
         $cookie_flag = 1;
    }
    return %Cookies;
}

##############################################################################
# Subroutine:    &SetCookieExpDate()                                         #
# Description:   Sets the expiration date for the cookie.                    #
# Usage:         &SetCookieExpDate('date')                                   #
# Variables:     date - The date you wish for the cookie to expire, in the   #
#                       format: Wdy, DD-Mon-YYYY HH:MM:SS GMT                #
#                       Ex. 'Wed, 09-Nov-1999 00:00:00 GMT'                  #
# Returns:       1 - If successful and date passes regular expression check  #
#                    for format errors and the new ExpDate is set.           #
#                0 - If new ExpDate was not set.  Check format of date.      #
##############################################################################

sub SetCookieExpDate {

    # If the date string is formatted as: Wdy, DD-Mon-YYYY HH:MM:SS GMT, set #
    # the $Cookie_Exp_Date to the new value and return 1 to signal success.  #
    # Otherwise, return 0, as the date was not successfully changed.         #
    # The date can also be set null value by calling: SetCookieExpDate('').  #

    if ($_[0] =~ /^\w{3}\,\s\d{2}\-\w{3}-\d{4}\s\d{2}\:\d{2}\:\d{2}\sGMT$/ ||
        $_[0] eq '') {
        $Cookie_Exp_Date = $_[0];
        return 1;
    }
    else {
        return 0;
    }
}

##############################################################################
# Subroutine:    &SetCookiePath()                                            #
# Description:   Sets the path for the cookie to be sent to.                 #
# Usage:         &SetCookiePath('path')                                      #
# Variables:     path - The path to which this cookie should be sent.        #
#                       Ex. '/' or '/path/to/file'                           #
# Returns:       Nothing.                                                    #
##############################################################################

sub SetCookiePath {

    # Set the new Cookie Path, assuming it is correct.  No error checking is #
    # done.                                                                  #

    $Cookie_Path = $_[0];
}



##############################################################################
# Subroutine:    &SetCookies()                                               #
# Description:   Sets one or more cookies by printing out the Set-Cookie     #
#                HTTP header to the browser, based on cookie information     #
#                passed to subroutine.                                       #
# Usage:         &SetCookies(name1,value1,...namen,valuen)                   #
# Variables:     name  - Name of the cookie to be set.                       #
#                        Ex. 'count'                                         #
#                value - Value of the cookie to be set.                      #
#                        Ex. '3'                                             #
#                n     - This is tacked on to the last of the name and value #
#                        pairs in the usage instructions just to show you    #
#                        you can have as many name/value pairs as you wish.  #
#               ** You can specify as many name/value pairs as you wish, and #
#                  &SetCookies will set them all.  Just string them out, one #
#                  after the other.  You must also have already printed out  #
#                  the Content-type header, with only one new line following #
#                  it so that the header has not been ended.  Then after the #
#                  &SetCookies call, you can print the final new line.       #
# Returns:       Nothing.                                                    #
##############################################################################

sub SetCookies {

    # Localize variables and read in cookies to be set.                      #

    my(@cookies) = @_;
    my($cookie,$value,$char);
	my $antwort;
    # While there is a cookie and a value to be set in @cookies, that hasn't #
    # yet been set, proceed with the loop.                                   #

    while( ($cookie,$value) = @cookies ) {

        # We must translate characters which are not allowed in cookies.     #

        foreach my $char (@Cookie_Encode_Chars) {
            $cookie =~ s/$char/$Cookie_Encode_Chars{$char}/g;
            $value =~ s/$char/$Cookie_Encode_Chars{$char}/g;
        }

        # Begin the printing of the Set-Cookie header with the cookie name   #
        # and value, followed by semi-colon.                                 #

        $antwort.='Set-Cookie: ' . $cookie . '=' . $value . ';';

        # If there is an Expiration Date set, add it to the header.          #

        if ($Cookie_Exp_Date) {
            $antwort.=' expires=' . $Cookie_Exp_Date . ';';
        }

        # If there is a path set, add it to the header.                      #

        if ($Cookie_Path) {
            $antwort.=' path=' . $Cookie_Path . ';';
        }

        # If a domain has been set, add it to the header.                    #

        if ($Cookie_Domain) {
            $antwort.=' domain=' . $Cookie_Domain . ';';
        }

        # If this cookie should be sent only over secure channels, add that  #
        # to the header.                                                     #

        if ($Secure_Cookie) {
            $antwort.=' secure';
        }

        # End this line of the header, setting the cookie.                   #

        $antwort.= "\n";

        # Remove the first two values of the @cookies array since we just    #
        # used them.                                                         #

        shift(@cookies); shift(@cookies);
    }
return($antwort);
}

##############################################################################
# Subroutine:    &SetCompressedCookies                                       #
# Description:   This routine does much the same thing that &SetCookies does #
#                except that it combines multiple cookies into one.          #
# Usage:         &SetCompressedCookies(cname,name1,value1,...,namen,valuen)  #
# Variables:     cname - Name of the compressed cookie to be set.            #
#                        Ex. 'CC'                                            #
#                name  - Name of the individual cookie to be set.            #
#                        Ex. 'count'                                         #
#                value - Value of the individual cookie to be set.           #
#                        Ex. '3'                                             #
#                n     - This is tacked on to the last of the name and value #
#                        pairs in the usage instructions just to show you    #
#                        you can have as many name/value pairs as you wish.  #
# Returns:       Nothing.                                                    #
##############################################################################

sub SetCompressedCookies {

    # Localize input into the compressed cookie name and the cookies to be   #
    # set.                                                                   #

    my($cookie_name,@cookies) = @_;
    my($cookie,$value,$cookie_value);

    # While there is a cookie and a value to be set in @cookies, that hasn't #
    # yet been set, proceed with the loop.                                   #

    while ( ($cookie,$value) = @cookies ) {

        # We must translate characters which are not allowed in cookies, or  #
        # which might interfere with the compression.                        #

        foreach my $char (@Cookie_Encode_Chars) {
            $cookie =~ s/$char/$Cookie_Encode_Chars{$char}/g;
            $value =~ s/$char/$Cookie_Encode_Chars{$char}/g;
        }

        # Prepare the cookie value.  If a current cookie value exists, use   #
        # an ampersand (&) to separate the cookies and instead of using = to #
        # separate the name and the value, use double colons (::), so it     #
        # won't confuse the browser.                                         #

        if ($cookie_value) {
            $cookie_value .= '&' . $cookie . '::' . $value;
        }
        else {
            $cookie_value = $cookie . '::' . $value;
        }

        # Remove the first two values of the @cookies array since we just    #
        # used them.                                                         #

        shift(@cookies); shift(@cookies);
    }

    # Use the &SetCookies array to set the compressed cookie and value.      #

    &SetCookies("$cookie_name","$cookie_value");
}


sub DeleteCookies
{
	delete($Cookies{shift});
}
1;

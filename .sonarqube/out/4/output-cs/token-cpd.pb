�%
@F:\Code\GitHub\docker\src\AnBook.Web.Core\AnBookWebCoreModule.cs
	namespace 	
AnBook
 
{ 
[ 
	DependsOn 
( 
typeof	 
( #
AnBookApplicationModule '
)' (
,( )
typeof	 
( '
AnBookEntityFrameworkModule +
)+ ,
,, -
typeof	 
( 
AbpAspNetCoreModule #
)# $
, 	
typeof	 
( &
AbpAspNetCoreSignalRModule *
)* +
) 
] 
public 

class 
AnBookWebCoreModule $
:% &
	AbpModule' 0
{ 
private 
readonly 
IHostingEnvironment ,
_env- 1
;1 2
private 
readonly 
IConfigurationRoot +
_appConfiguration, =
;= >
public 
AnBookWebCoreModule "
(" #
IHostingEnvironment# 6
env7 :
): ;
{ 	
_env 
= 
env 
; 
_appConfiguration   
=   
env    #
.  # $
GetAppConfiguration  $ 7
(  7 8
)  8 9
;  9 :
}!! 	
public## 
override## 
void## 
PreInitialize## *
(##* +
)##+ ,
{$$ 	
Configuration%% 
.%% )
DefaultNameOrConnectionString%% 7
=%%8 9
_appConfiguration%%: K
.%%K L
GetConnectionString%%L _
(%%_ `
AnBookConsts&& 
.&&  
ConnectionStringName&& 1
)'' 
;'' 
Configuration** 
.** 
Modules** !
.**! "
Zero**" &
(**& '
)**' (
.**( )
LanguageManagement**) ;
.**; < 
EnableDbLocalization**< P
(**P Q
)**Q R
;**R S
Configuration,, 
.,, 
Modules,, !
.,,! "
AbpAspNetCore,," /
(,,/ 0
),,0 1
.-- +
CreateControllersForAppServices-- 1
(--1 2
typeof--2 8
(--8 9#
AnBookApplicationModule--9 P
)--P Q
.--Q R
GetAssembly--R ]
(--] ^
)--^ _
)--_ `
;--` a
ConfigureTokenAuth// 
(// 
)//  
;//  !
}00 	
private22 
void22 
ConfigureTokenAuth22 '
(22' (
)22( )
{33 	

IocManager44 
.44 
Register44 
<44  "
TokenAuthConfiguration44  6
>446 7
(447 8
)448 9
;449 :
var55 
tokenAuthConfig55 
=55  !

IocManager55" ,
.55, -
Resolve55- 4
<554 5"
TokenAuthConfiguration555 K
>55K L
(55L M
)55M N
;55N O
tokenAuthConfig77 
.77 
SecurityKey77 '
=77( )
new77* - 
SymmetricSecurityKey77. B
(77B C
Encoding77C K
.77K L
ASCII77L Q
.77Q R
GetBytes77R Z
(77Z [
_appConfiguration77[ l
[77l m
$str	77m �
]
77� �
)
77� �
)
77� �
;
77� �
tokenAuthConfig88 
.88 
Issuer88 "
=88# $
_appConfiguration88% 6
[886 7
$str887 X
]88X Y
;88Y Z
tokenAuthConfig99 
.99 
Audience99 $
=99% &
_appConfiguration99' 8
[998 9
$str999 \
]99\ ]
;99] ^
tokenAuthConfig:: 
.:: 
SigningCredentials:: .
=::/ 0
new::1 4
SigningCredentials::5 G
(::G H
tokenAuthConfig::H W
.::W X
SecurityKey::X c
,::c d
SecurityAlgorithms::e w
.::w x

HmacSha256	::x �
)
::� �
;
::� �
tokenAuthConfig;; 
.;; 

Expiration;; &
=;;' (
TimeSpan;;) 1
.;;1 2
FromDays;;2 :
(;;: ;
$num;;; <
);;< =
;;;= >
}<< 	
public>> 
override>> 
void>> 

Initialize>> '
(>>' (
)>>( )
{?? 	

IocManager@@ 
.@@ (
RegisterAssemblyByConvention@@ 3
(@@3 4
typeof@@4 :
(@@: ;
AnBookWebCoreModule@@; N
)@@N O
.@@O P
GetAssembly@@P [
(@@[ \
)@@\ ]
)@@] ^
;@@^ _
}AA 	
}BB 
}CC �
^F:\Code\GitHub\docker\src\AnBook.Web.Core\Authentication\External\ExternalAuthConfiguration.cs
	namespace 	
AnBook
 
. 
Authentication 
.  
External  (
{ 
public 

class %
ExternalAuthConfiguration *
:+ ,&
IExternalAuthConfiguration- G
,G H 
ISingletonDependencyI ]
{ 
public 
List 
< %
ExternalLoginProviderInfo -
>- .
	Providers/ 8
{9 :
get; >
;> ?
}@ A
public

 %
ExternalAuthConfiguration

 (
(

( )
)

) *
{ 	
	Providers 
= 
new 
List  
<  !%
ExternalLoginProviderInfo! :
>: ;
(; <
)< =
;= >
} 	
} 
} �
XF:\Code\GitHub\docker\src\AnBook.Web.Core\Authentication\External\ExternalAuthManager.cs
	namespace 	
AnBook
 
. 
Authentication 
.  
External  (
{ 
public 

class 
ExternalAuthManager $
:% & 
IExternalAuthManager' ;
,; < 
ITransientDependency= Q
{		 
private

 
readonly

 
IIocResolver

 %
_iocResolver

& 2
;

2 3
private 
readonly &
IExternalAuthConfiguration 3&
_externalAuthConfiguration4 N
;N O
public 
ExternalAuthManager "
(" #
IIocResolver# /
iocResolver0 ;
,; <&
IExternalAuthConfiguration= W%
externalAuthConfigurationX q
)q r
{ 	
_iocResolver 
= 
iocResolver &
;& '&
_externalAuthConfiguration &
=' (%
externalAuthConfiguration) B
;B C
} 	
public 
Task 
< 
bool 
> 
IsValidUser %
(% &
string& ,
provider- 5
,5 6
string7 =
providerKey> I
,I J
stringK Q
providerAccessCodeR d
)d e
{ 	
using 
( 
var 
providerApi "
=# $
CreateProviderApi% 6
(6 7
provider7 ?
)? @
)@ A
{ 
return 
providerApi "
." #
Object# )
.) *
IsValidUser* 5
(5 6
providerKey6 A
,A B
providerAccessCodeC U
)U V
;V W
} 
} 	
public 
Task 
<  
ExternalAuthUserInfo (
>( )
GetUserInfo* 5
(5 6
string6 <
provider= E
,E F
stringG M

accessCodeN X
)X Y
{ 	
using 
( 
var 
providerApi "
=# $
CreateProviderApi% 6
(6 7
provider7 ?
)? @
)@ A
{ 
return 
providerApi "
." #
Object# )
.) *
GetUserInfo* 5
(5 6

accessCode6 @
)@ A
;A B
}   
}!! 	
public## .
"IDisposableDependencyObjectWrapper## 1
<##1 2$
IExternalAuthProviderApi##2 J
>##J K
CreateProviderApi##L ]
(##] ^
string##^ d
provider##e m
)##m n
{$$ 	
var%% 
providerInfo%% 
=%% &
_externalAuthConfiguration%% 9
.%%9 :
	Providers%%: C
.%%C D
FirstOrDefault%%D R
(%%R S
p%%S T
=>%%U W
p%%X Y
.%%Y Z
Name%%Z ^
==%%_ a
provider%%b j
)%%j k
;%%k l
if&& 
(&& 
providerInfo&& 
==&& 
null&&  $
)&&$ %
{'' 
throw(( 
new(( 
	Exception(( #
(((# $
$str(($ F
+((G H
provider((I Q
)((Q R
;((R S
})) 
var++ 
providerApi++ 
=++ 
_iocResolver++ *
.++* +
ResolveAsDisposable+++ >
<++> ?$
IExternalAuthProviderApi++? W
>++W X
(++X Y
providerInfo++Y e
.++e f
ProviderApiType++f u
)++u v
;++v w
providerApi,, 
.,, 
Object,, 
.,, 

Initialize,, )
(,,) *
providerInfo,,* 6
),,6 7
;,,7 8
return-- 
providerApi-- 
;-- 
}.. 	
}// 
}00 �
`F:\Code\GitHub\docker\src\AnBook.Web.Core\Authentication\External\ExternalAuthProviderApiBase.cs
	namespace 	
AnBook
 
. 
Authentication 
.  
External  (
{ 
public 

abstract 
class '
ExternalAuthProviderApiBase 5
:6 7$
IExternalAuthProviderApi8 P
,P Q 
ITransientDependencyR f
{ 
public %
ExternalLoginProviderInfo (
ProviderInfo) 5
{6 7
get8 ;
;; <
set= @
;@ A
}B C
public

 
void

 

Initialize

 
(

 %
ExternalLoginProviderInfo

 8
providerInfo

9 E
)

E F
{ 	
ProviderInfo 
= 
providerInfo '
;' (
} 	
public 
async 
Task 
< 
bool 
> 
IsValidUser  +
(+ ,
string, 2
userId3 9
,9 :
string; A

accessCodeB L
)L M
{ 	
var 
userInfo 
= 
await  
GetUserInfo! ,
(, -

accessCode- 7
)7 8
;8 9
return 
userInfo 
. 
ProviderKey '
==( *
userId+ 1
;1 2
} 	
public 
abstract 
Task 
<  
ExternalAuthUserInfo 1
>1 2
GetUserInfo3 >
(> ?
string? E

accessCodeF P
)P Q
;Q R
} 
} �
YF:\Code\GitHub\docker\src\AnBook.Web.Core\Authentication\External\ExternalAuthUserInfo.cs
	namespace 	
AnBook
 
. 
Authentication 
.  
External  (
{ 
public 

class  
ExternalAuthUserInfo %
{ 
public 
string 
ProviderKey !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public		 
string		 
EmailAddress		 "
{		# $
get		% (
;		( )
set		* -
;		- .
}		/ 0
public 
string 
Surname 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
Provider 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} �
^F:\Code\GitHub\docker\src\AnBook.Web.Core\Authentication\External\ExternalLoginProviderInfo.cs
	namespace 	
AnBook
 
. 
Authentication 
.  
External  (
{ 
public 

class %
ExternalLoginProviderInfo *
{ 
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public		 
string		 
ClientId		 
{		  
get		! $
;		$ %
set		& )
;		) *
}		+ ,
public 
string 
ClientSecret "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
Type 
ProviderApiType #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public %
ExternalLoginProviderInfo (
(( )
string) /
name0 4
,4 5
string6 <
clientId= E
,E F
stringG M
clientSecretN Z
,Z [
Type\ `
providerApiTypea p
)p q
{ 	
Name 
= 
name 
; 
ClientId 
= 
clientId 
;  
ClientSecret 
= 
clientSecret '
;' (
ProviderApiType 
= 
providerApiType -
;- .
} 	
} 
} �
_F:\Code\GitHub\docker\src\AnBook.Web.Core\Authentication\External\IExternalAuthConfiguration.cs
	namespace 	
AnBook
 
. 
Authentication 
.  
External  (
{ 
public 

	interface &
IExternalAuthConfiguration /
{ 
List 
< %
ExternalLoginProviderInfo &
>& '
	Providers( 1
{2 3
get4 7
;7 8
}9 :
} 
}		 �
YF:\Code\GitHub\docker\src\AnBook.Web.Core\Authentication\External\IExternalAuthManager.cs
	namespace 	
AnBook
 
. 
Authentication 
.  
External  (
{ 
public 

	interface  
IExternalAuthManager )
{ 
Task 
< 
bool 
> 
IsValidUser 
( 
string %
provider& .
,. /
string0 6
providerKey7 B
,B C
stringD J
providerAccessCodeK ]
)] ^
;^ _
Task		 
<		  
ExternalAuthUserInfo		 !
>		! "
GetUserInfo		# .
(		. /
string		/ 5
provider		6 >
,		> ?
string		@ F

accessCode		G Q
)		Q R
;		R S
}

 
} �
]F:\Code\GitHub\docker\src\AnBook.Web.Core\Authentication\External\IExternalAuthProviderApi.cs
	namespace 	
AnBook
 
. 
Authentication 
.  
External  (
{ 
public 

	interface $
IExternalAuthProviderApi -
{ %
ExternalLoginProviderInfo !
ProviderInfo" .
{/ 0
get1 4
;4 5
}6 7
Task		 
<		 
bool		 
>		 
IsValidUser		 
(		 
string		 %
userId		& ,
,		, -
string		. 4

accessCode		5 ?
)		? @
;		@ A
Task 
<  
ExternalAuthUserInfo !
>! "
GetUserInfo# .
(. /
string/ 5

accessCode6 @
)@ A
;A B
void 

Initialize 
( %
ExternalLoginProviderInfo 1
providerInfo2 >
)> ?
;? @
} 
} �
XF:\Code\GitHub\docker\src\AnBook.Web.Core\Authentication\JwtBearer\JwtTokenMiddleware.cs
	namespace 	
AnBook
 
. 
Authentication 
.  
	JwtBearer  )
{ 
public 

static 
class 
JwtTokenMiddleware *
{ 
public		 
static		 
IApplicationBuilder		 )!
UseJwtTokenMiddleware		* ?
(		? @
this		@ D
IApplicationBuilder		E X
app		Y \
,		\ ]
string		^ d
schema		e k
=		l m
JwtBearerDefaults		n 
.			 �"
AuthenticationScheme
		� �
)
		� �
{

 	
return 
app 
. 
Use 
( 
async  
(! "
ctx" %
,% &
next' +
)+ ,
=>- /
{ 
if 
( 
ctx 
. 
User 
. 
Identity %
?% &
.& '
IsAuthenticated' 6
!=7 9
true: >
)> ?
{ 
var 
result 
=  
await! &
ctx' *
.* +
AuthenticateAsync+ <
(< =
schema= C
)C D
;D E
if 
( 
result 
. 
	Succeeded (
&&) +
result, 2
.2 3
	Principal3 <
!== ?
null@ D
)D E
{ 
ctx 
. 
User  
=! "
result# )
.) *
	Principal* 3
;3 4
} 
} 
await 
next 
( 
) 
; 
} 
) 
; 
} 	
} 
} �	
\F:\Code\GitHub\docker\src\AnBook.Web.Core\Authentication\JwtBearer\TokenAuthConfiguration.cs
	namespace 	
AnBook
 
. 
Authentication 
.  
	JwtBearer  )
{ 
public 

class "
TokenAuthConfiguration '
{ 
public  
SymmetricSecurityKey #
SecurityKey$ /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
public

 
string

 
Issuer

 
{

 
get

 "
;

" #
set

$ '
;

' (
}

) *
public 
string 
Audience 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
SigningCredentials !
SigningCredentials" 4
{5 6
get7 :
;: ;
set< ?
;? @
}A B
public 
TimeSpan 

Expiration "
{# $
get% (
;( )
set* -
;- .
}/ 0
} 
} �
WF:\Code\GitHub\docker\src\AnBook.Web.Core\Configuration\HostingEnvironmentExtensions.cs
	namespace 	
AnBook
 
. 
Configuration 
{ 
public 

static 
class (
HostingEnvironmentExtensions 4
{ 
public 
static 
IConfigurationRoot (
GetAppConfiguration) <
(< =
this= A
IHostingEnvironmentB U
envV Y
)Y Z
{		 	
return

 
AppConfigurations

 $
.

$ %
Get

% (
(

( )
env

) ,
.

, -
ContentRootPath

- <
,

< =
env

> A
.

A B
EnvironmentName

B Q
,

Q R
env

S V
.

V W
IsDevelopment

W d
(

d e
)

e f
)

f g
;

g h
} 	
} 
} �
MF:\Code\GitHub\docker\src\AnBook.Web.Core\Controllers\AnBookControllerBase.cs
	namespace 	
AnBook
 
. 
Controllers 
{ 
public 

abstract 
class  
AnBookControllerBase .
:. /
AbpController0 =
{ 
	protected		  
AnBookControllerBase		 &
(		& '
)		' (
{

 	"
LocalizationSourceName "
=# $
AnBookConsts% 1
.1 2"
LocalizationSourceName2 H
;H I
} 	
	protected 
void 
CheckErrors "
(" #
IdentityResult# 1
identityResult2 @
)@ A
{ 	
identityResult 
. 
CheckErrors &
(& '
LocalizationManager' :
): ;
;; <
} 	
} 
} ��
LF:\Code\GitHub\docker\src\AnBook.Web.Core\Controllers\TokenAuthController.cs
	namespace 	
AnBook
 
. 
Controllers 
{ 
[ 
Route 

(
 
$str &
)& '
]' (
public 

class 
TokenAuthController $
:% & 
AnBookControllerBase' ;
{ 
private 
readonly 
LogInManager %
_logInManager& 3
;3 4
private 
readonly 
ITenantCache %
_tenantCache& 2
;2 3
private 
readonly $
AbpLoginResultTypeHelper 1%
_abpLoginResultTypeHelper2 K
;K L
private 
readonly "
TokenAuthConfiguration /
_configuration0 >
;> ?
private 
readonly &
IExternalAuthConfiguration 3&
_externalAuthConfiguration4 N
;N O
private 
readonly  
IExternalAuthManager - 
_externalAuthManager. B
;B C
private   
readonly   #
UserRegistrationManager   0$
_userRegistrationManager  1 I
;  I J
public"" 
TokenAuthController"" "
(""" #
LogInManager## 
logInManager## %
,##% &
ITenantCache$$ 
tenantCache$$ $
,$$$ %$
AbpLoginResultTypeHelper%% $$
abpLoginResultTypeHelper%%% =
,%%= >"
TokenAuthConfiguration&& "
configuration&&# 0
,&&0 1&
IExternalAuthConfiguration'' &%
externalAuthConfiguration''' @
,''@ A 
IExternalAuthManager((  
externalAuthManager((! 4
,((4 5#
UserRegistrationManager)) ##
userRegistrationManager))$ ;
))); <
{** 	
_logInManager++ 
=++ 
logInManager++ (
;++( )
_tenantCache,, 
=,, 
tenantCache,, &
;,,& '%
_abpLoginResultTypeHelper-- %
=--& '$
abpLoginResultTypeHelper--( @
;--@ A
_configuration.. 
=.. 
configuration.. *
;..* +&
_externalAuthConfiguration// &
=//' (%
externalAuthConfiguration//) B
;//B C 
_externalAuthManager00  
=00! "
externalAuthManager00# 6
;006 7$
_userRegistrationManager11 $
=11% &#
userRegistrationManager11' >
;11> ?
}22 	
[44 	
HttpPost44	 
]44 
public55 
async55 
Task55 
<55 #
AuthenticateResultModel55 1
>551 2
Authenticate553 ?
(55? @
[55@ A
FromBody55A I
]55I J
AuthenticateModel55K \
model55] b
)55b c
{66 	
var77 
loginResult77 
=77 
await77 #
GetLoginResultAsync77$ 7
(777 8
model88 
.88 "
UserNameOrEmailAddress88 ,
,88, -
model99 
.99 
Password99 
,99  
GetTenancyNameOrNull:: $
(::$ %
)::% &
);; 
;;; 
var== 
accessToken== 
=== 
CreateAccessToken== /
(==/ 0
CreateJwtClaims==0 ?
(==? @
loginResult==@ K
.==K L
Identity==L T
)==T U
)==U V
;==V W
return?? 
new?? #
AuthenticateResultModel?? .
{@@ 
AccessTokenAA 
=AA 
accessTokenAA )
,AA) * 
EncryptedAccessTokenBB $
=BB% &"
GetEncrpyedAccessTokenBB' =
(BB= >
accessTokenBB> I
)BBI J
,BBJ K
ExpireInSecondsCC 
=CC  !
(CC" #
intCC# &
)CC& '
_configurationCC' 5
.CC5 6

ExpirationCC6 @
.CC@ A
TotalSecondsCCA M
,CCM N
UserIdDD 
=DD 
loginResultDD $
.DD$ %
UserDD% )
.DD) *
IdDD* ,
}EE 
;EE 
}FF 	
[HH 	
HttpGetHH	 
]HH 
publicII 
ListII 
<II *
ExternalLoginProviderInfoModelII 2
>II2 3.
"GetExternalAuthenticationProvidersII4 V
(IIV W
)IIW X
{JJ 	
returnKK 
ObjectMapperKK 
.KK  
MapKK  #
<KK# $
ListKK$ (
<KK( )*
ExternalLoginProviderInfoModelKK) G
>KKG H
>KKH I
(KKI J&
_externalAuthConfigurationKKJ d
.KKd e
	ProvidersKKe n
)KKn o
;KKo p
}LL 	
[NN 	
HttpPostNN	 
]NN 
publicOO 
asyncOO 
TaskOO 
<OO +
ExternalAuthenticateResultModelOO 9
>OO9 : 
ExternalAuthenticateOO; O
(OOO P
[OOP Q
FromBodyOOQ Y
]OOY Z%
ExternalAuthenticateModelOO[ t
modelOOu z
)OOz {
{PP 	
varQQ 
externalUserQQ 
=QQ 
awaitQQ $
GetExternalUserInfoQQ% 8
(QQ8 9
modelQQ9 >
)QQ> ?
;QQ? @
varSS 
loginResultSS 
=SS 
awaitSS #
_logInManagerSS$ 1
.SS1 2

LoginAsyncSS2 <
(SS< =
newSS= @
UserLoginInfoSSA N
(SSN O
modelSSO T
.SST U
AuthProviderSSU a
,SSa b
modelSSc h
.SSh i
ProviderKeySSi t
,SSt u
modelSSv {
.SS{ |
AuthProvider	SS| �
)
SS� �
,
SS� �"
GetTenancyNameOrNull
SS� �
(
SS� �
)
SS� �
)
SS� �
;
SS� �
switchUU 
(UU 
loginResultUU 
.UU  
ResultUU  &
)UU& '
{VV 
caseWW 
AbpLoginResultTypeWW '
.WW' (
SuccessWW( /
:WW/ 0
{XX 
varYY 
accessTokenYY '
=YY( )
CreateAccessTokenYY* ;
(YY; <
CreateJwtClaimsYY< K
(YYK L
loginResultYYL W
.YYW X
IdentityYYX `
)YY` a
)YYa b
;YYb c
returnZZ 
newZZ "+
ExternalAuthenticateResultModelZZ# B
{[[ 
AccessToken\\ '
=\\( )
accessToken\\* 5
,\\5 6 
EncryptedAccessToken]] 0
=]]1 2"
GetEncrpyedAccessToken]]3 I
(]]I J
accessToken]]J U
)]]U V
,]]V W
ExpireInSeconds^^ +
=^^, -
(^^. /
int^^/ 2
)^^2 3
_configuration^^3 A
.^^A B

Expiration^^B L
.^^L M
TotalSeconds^^M Y
}__ 
;__ 
}`` 
caseaa 
AbpLoginResultTypeaa '
.aa' ( 
UnknownExternalLoginaa( <
:aa< =
{bb 
varcc 
newUsercc #
=cc$ %
awaitcc& +%
RegisterExternalUserAsynccc, E
(ccE F
externalUserccF R
)ccR S
;ccS T
ifdd 
(dd 
!dd 
newUserdd $
.dd$ %
IsActivedd% -
)dd- .
{ee 
returnff "
newff# &+
ExternalAuthenticateResultModelff' F
{gg  
WaitingForActivationhh  4
=hh5 6
truehh7 ;
}ii 
;ii 
}jj 
loginResultmm #
=mm$ %
awaitmm& +
_logInManagermm, 9
.mm9 :

LoginAsyncmm: D
(mmD E
newmmE H
UserLoginInfommI V
(mmV W
modelmmW \
.mm\ ]
AuthProvidermm] i
,mmi j
modelmmk p
.mmp q
ProviderKeymmq |
,mm| }
model	mm~ �
.
mm� �
AuthProvider
mm� �
)
mm� �
,
mm� �"
GetTenancyNameOrNull
mm� �
(
mm� �
)
mm� �
)
mm� �
;
mm� �
ifnn 
(nn 
loginResultnn '
.nn' (
Resultnn( .
!=nn/ 1
AbpLoginResultTypenn2 D
.nnD E
SuccessnnE L
)nnL M
{oo 
throwpp !%
_abpLoginResultTypeHelperpp" ;
.pp; <0
$CreateExceptionForFailedLoginAttemptpp< `
(pp` a
loginResultqq  +
.qq+ ,
Resultqq, 2
,qq2 3
modelrr  %
.rr% &
ProviderKeyrr& 1
,rr1 2 
GetTenancyNameOrNullss  4
(ss4 5
)ss5 6
)tt 
;tt 
}uu 
returnww 
newww "+
ExternalAuthenticateResultModelww# B
{xx 
AccessTokenyy '
=yy( )
CreateAccessTokenyy* ;
(yy; <
CreateJwtClaimsyy< K
(yyK L
loginResultyyL W
.yyW X
IdentityyyX `
)yy` a
)yya b
,yyb c
ExpireInSecondszz +
=zz, -
(zz. /
intzz/ 2
)zz2 3
_configurationzz3 A
.zzA B

ExpirationzzB L
.zzL M
TotalSecondszzM Y
}{{ 
;{{ 
}|| 
default}} 
:}} 
{~~ 
throw %
_abpLoginResultTypeHelper 7
.7 80
$CreateExceptionForFailedLoginAttempt8 \
(\ ]
loginResult
�� '
.
��' (
Result
��( .
,
��. /
model
�� !
.
��! "
ProviderKey
��" -
,
��- ."
GetTenancyNameOrNull
�� 0
(
��0 1
)
��1 2
)
�� 
;
�� 
}
�� 
}
�� 
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
User
�� 
>
��  '
RegisterExternalUserAsync
��! :
(
��: ;"
ExternalAuthUserInfo
��; O
externalUser
��P \
)
��\ ]
{
�� 	
var
�� 
user
�� 
=
�� 
await
�� &
_userRegistrationManager
�� 5
.
��5 6
RegisterAsync
��6 C
(
��C D
externalUser
�� 
.
�� 
Name
�� !
,
��! "
externalUser
�� 
.
�� 
Surname
�� $
,
��$ %
externalUser
�� 
.
�� 
EmailAddress
�� )
,
��) *
externalUser
�� 
.
�� 
EmailAddress
�� )
,
��) *
Authorization
�� 
.
�� 
Users
�� #
.
��# $
User
��$ (
.
��( )"
CreateRandomPassword
��) =
(
��= >
)
��> ?
,
��? @
true
�� 
)
�� 
;
�� 
user
�� 
.
�� 
Logins
�� 
=
�� 
new
�� 
List
�� "
<
��" #
	UserLogin
��# ,
>
��, -
{
�� 
new
�� 
	UserLogin
�� 
{
�� 
LoginProvider
�� !
=
��" #
externalUser
��$ 0
.
��0 1
Provider
��1 9
,
��9 :
ProviderKey
�� 
=
��  !
externalUser
��" .
.
��. /
ProviderKey
��/ :
,
��: ;
TenantId
�� 
=
�� 
user
�� #
.
��# $
TenantId
��$ ,
}
�� 
}
�� 
;
�� 
await
�� 
CurrentUnitOfWork
�� #
.
��# $
SaveChangesAsync
��$ 4
(
��4 5
)
��5 6
;
��6 7
return
�� 
user
�� 
;
�� 
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� "
ExternalAuthUserInfo
�� /
>
��/ 0!
GetExternalUserInfo
��1 D
(
��D E'
ExternalAuthenticateModel
��E ^
model
��_ d
)
��d e
{
�� 	
var
�� 
userInfo
�� 
=
�� 
await
��  "
_externalAuthManager
��! 5
.
��5 6
GetUserInfo
��6 A
(
��A B
model
��B G
.
��G H
AuthProvider
��H T
,
��T U
model
��V [
.
��[ \ 
ProviderAccessCode
��\ n
)
��n o
;
��o p
if
�� 
(
�� 
userInfo
�� 
.
�� 
ProviderKey
�� $
!=
��% '
model
��( -
.
��- .
ProviderKey
��. 9
)
��9 :
{
�� 
throw
�� 
new
�� #
UserFriendlyException
�� /
(
��/ 0
L
��0 1
(
��1 2
$str
��2 P
)
��P Q
)
��Q R
;
��R S
}
�� 
return
�� 
userInfo
�� 
;
�� 
}
�� 	
private
�� 
string
�� "
GetTenancyNameOrNull
�� +
(
��+ ,
)
��, -
{
�� 	
if
�� 
(
�� 
!
�� 

AbpSession
�� 
.
�� 
TenantId
�� $
.
��$ %
HasValue
��% -
)
��- .
{
�� 
return
�� 
null
�� 
;
�� 
}
�� 
return
�� 
_tenantCache
�� 
.
��  
	GetOrNull
��  )
(
��) *

AbpSession
��* 4
.
��4 5
TenantId
��5 =
.
��= >
Value
��> C
)
��C D
?
��D E
.
��E F
TenancyName
��F Q
;
��Q R
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
AbpLoginResult
�� )
<
��) *
Tenant
��* 0
,
��0 1
User
��2 6
>
��6 7
>
��7 8!
GetLoginResultAsync
��9 L
(
��L M
string
��M S$
usernameOrEmailAddress
��T j
,
��j k
string
��l r
password
��s {
,
��{ |
string��} �
tenancyName��� �
)��� �
{
�� 	
var
�� 
loginResult
�� 
=
�� 
await
�� #
_logInManager
��$ 1
.
��1 2

LoginAsync
��2 <
(
��< =$
usernameOrEmailAddress
��= S
,
��S T
password
��U ]
,
��] ^
tenancyName
��_ j
)
��j k
;
��k l
switch
�� 
(
�� 
loginResult
�� 
.
��  
Result
��  &
)
��& '
{
�� 
case
��  
AbpLoginResultType
�� '
.
��' (
Success
��( /
:
��/ 0
return
�� 
loginResult
�� &
;
��& '
default
�� 
:
�� 
throw
�� '
_abpLoginResultTypeHelper
�� 3
.
��3 42
$CreateExceptionForFailedLoginAttempt
��4 X
(
��X Y
loginResult
��Y d
.
��d e
Result
��e k
,
��k l%
usernameOrEmailAddress��m �
,��� �
tenancyName��� �
)��� �
;��� �
}
�� 
}
�� 	
private
�� 
string
�� 
CreateAccessToken
�� (
(
��( )
IEnumerable
��) 4
<
��4 5
Claim
��5 :
>
��: ;
claims
��< B
,
��B C
TimeSpan
��D L
?
��L M

expiration
��N X
=
��Y Z
null
��[ _
)
��_ `
{
�� 	
var
�� 
now
�� 
=
�� 
DateTime
�� 
.
�� 
UtcNow
�� %
;
��% &
var
�� 
jwtSecurityToken
��  
=
��! "
new
��# &
JwtSecurityToken
��' 7
(
��7 8
issuer
�� 
:
�� 
_configuration
�� &
.
��& '
Issuer
��' -
,
��- .
audience
�� 
:
�� 
_configuration
�� (
.
��( )
Audience
��) 1
,
��1 2
claims
�� 
:
�� 
claims
�� 
,
�� 
	notBefore
�� 
:
�� 
now
�� 
,
�� 
expires
�� 
:
�� 
now
�� 
.
�� 
Add
��  
(
��  !

expiration
��! +
??
��, .
_configuration
��/ =
.
��= >

Expiration
��> H
)
��H I
,
��I J 
signingCredentials
�� "
:
��" #
_configuration
��$ 2
.
��2 3 
SigningCredentials
��3 E
)
�� 
;
�� 
return
�� 
new
�� %
JwtSecurityTokenHandler
�� .
(
��. /
)
��/ 0
.
��0 1

WriteToken
��1 ;
(
��; <
jwtSecurityToken
��< L
)
��L M
;
��M N
}
�� 	
private
�� 
static
�� 
List
�� 
<
�� 
Claim
�� !
>
��! "
CreateJwtClaims
��# 2
(
��2 3
ClaimsIdentity
��3 A
identity
��B J
)
��J K
{
�� 	
var
�� 
claims
�� 
=
�� 
identity
�� !
.
��! "
Claims
��" (
.
��( )
ToList
��) /
(
��/ 0
)
��0 1
;
��1 2
var
�� 
nameIdClaim
�� 
=
�� 
claims
�� $
.
��$ %
First
��% *
(
��* +
c
��+ ,
=>
��- /
c
��0 1
.
��1 2
Type
��2 6
==
��7 9

ClaimTypes
��: D
.
��D E
NameIdentifier
��E S
)
��S T
;
��T U
claims
�� 
.
�� 
AddRange
�� 
(
�� 
new
�� 
[
��  
]
��  !
{
�� 
new
�� 
Claim
�� 
(
�� %
JwtRegisteredClaimNames
�� 1
.
��1 2
Sub
��2 5
,
��5 6
nameIdClaim
��7 B
.
��B C
Value
��C H
)
��H I
,
��I J
new
�� 
Claim
�� 
(
�� %
JwtRegisteredClaimNames
�� 1
.
��1 2
Jti
��2 5
,
��5 6
Guid
��7 ;
.
��; <
NewGuid
��< C
(
��C D
)
��D E
.
��E F
ToString
��F N
(
��N O
)
��O P
)
��P Q
,
��Q R
new
�� 
Claim
�� 
(
�� %
JwtRegisteredClaimNames
�� 1
.
��1 2
Iat
��2 5
,
��5 6
DateTimeOffset
��7 E
.
��E F
Now
��F I
.
��I J
ToUnixTimeSeconds
��J [
(
��[ \
)
��\ ]
.
��] ^
ToString
��^ f
(
��f g
)
��g h
,
��h i
ClaimValueTypes
��j y
.
��y z
	Integer64��z �
)��� �
}
�� 
)
�� 
;
�� 
return
�� 
claims
�� 
;
�� 
}
�� 	
private
�� 
string
�� $
GetEncrpyedAccessToken
�� -
(
��- .
string
��. 4
accessToken
��5 @
)
��@ A
{
�� 	
return
��  
SimpleStringCipher
�� %
.
��% &
Instance
��& .
.
��. /
Encrypt
��/ 6
(
��6 7
accessToken
��7 B
,
��B C
	AppConsts
��D M
.
��M N
DefaultPassPhrase
��N _
)
��_ `
;
��` a
}
�� 	
}
�� 
}�� �"
MF:\Code\GitHub\docker\src\AnBook.Web.Core\Identity\ExternalLoginInfoHelper.cs
	namespace 	
AnBook
 
. 
Identity 
{ 
public 

class #
ExternalLoginInfoHelper (
{		 
public

 
static

 
(

 
string

 
name

 "
,

" #
string

$ *
surname

+ 2
)

2 3'
GetNameAndSurnameFromClaims

4 O
(

O P
List

P T
<

T U
Claim

U Z
>

Z [
claims

\ b
)

b c
{ 	
string 
name 
= 
null 
; 
string 
surname 
= 
null !
;! "
var 
givennameClaim 
=  
claims! '
.' (
FirstOrDefault( 6
(6 7
c7 8
=>9 ;
c< =
.= >
Type> B
==C E

ClaimTypesF P
.P Q
	GivenNameQ Z
)Z [
;[ \
if 
( 
givennameClaim 
!= !
null" &
&&' )
!* +
givennameClaim+ 9
.9 :
Value: ?
.? @
IsNullOrEmpty@ M
(M N
)N O
)O P
{ 
name 
= 
givennameClaim %
.% &
Value& +
;+ ,
} 
var 
surnameClaim 
= 
claims %
.% &
FirstOrDefault& 4
(4 5
c5 6
=>7 9
c: ;
.; <
Type< @
==A C

ClaimTypesD N
.N O
SurnameO V
)V W
;W X
if 
( 
surnameClaim 
!= 
null  $
&&% '
!( )
surnameClaim) 5
.5 6
Value6 ;
.; <
IsNullOrEmpty< I
(I J
)J K
)K L
{ 
surname 
= 
surnameClaim &
.& '
Value' ,
;, -
} 
if 
( 
name 
== 
null 
|| 
surname  '
==( *
null+ /
)/ 0
{ 
var 
	nameClaim 
= 
claims  &
.& '
FirstOrDefault' 5
(5 6
c6 7
=>8 :
c; <
.< =
Type= A
==B D

ClaimTypesE O
.O P
NameP T
)T U
;U V
if 
( 
	nameClaim 
!=  
null! %
)% &
{ 
var   
nameSurName   #
=  $ %
	nameClaim  & /
.  / 0
Value  0 5
;  5 6
if!! 
(!! 
!!! 
nameSurName!! $
.!!$ %
IsNullOrEmpty!!% 2
(!!2 3
)!!3 4
)!!4 5
{"" 
var## 
lastSpaceIndex## *
=##+ ,
nameSurName##- 8
.##8 9
LastIndexOf##9 D
(##D E
$char##E H
)##H I
;##I J
if$$ 
($$ 
lastSpaceIndex$$ *
<$$+ ,
$num$$- .
||$$/ 1
lastSpaceIndex$$2 @
>$$A B
($$C D
nameSurName$$D O
.$$O P
Length$$P V
-$$W X
$num$$Y Z
)$$Z [
)$$[ \
{%% 
name&&  
=&&! "
surname&&# *
=&&+ ,
nameSurName&&- 8
;&&8 9
}'' 
else(( 
{)) 
name**  
=**! "
nameSurName**# .
.**. /
	Substring**/ 8
(**8 9
$num**9 :
,**: ;
lastSpaceIndex**< J
)**J K
;**K L
surname++ #
=++$ %
nameSurName++& 1
.++1 2
	Substring++2 ;
(++; <
lastSpaceIndex++< J
)++J K
;++K L
},, 
}-- 
}.. 
}// 
return11 
(11 
name11 
,11 
surname11 !
)11! "
;11" #
}22 	
}33 
}44 �	
OF:\Code\GitHub\docker\src\AnBook.Web.Core\Models\TokenAuth\AuthenticateModel.cs
	namespace 	
AnBook
 
. 
Models 
. 
	TokenAuth !
{ 
public 

class 
AuthenticateModel "
{ 
[ 	
Required	 
] 
[		 	
StringLength			 
(		 
AbpUserBase		 !
.		! "!
MaxEmailAddressLength		" 7
)		7 8
]		8 9
public

 
string

 "
UserNameOrEmailAddress

 ,
{

- .
get

/ 2
;

2 3
set

4 7
;

7 8
}

9 :
[ 	
Required	 
] 
[ 	
StringLength	 
( 
AbpUserBase !
.! ""
MaxPlainPasswordLength" 8
)8 9
]9 :
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
bool 
RememberClient "
{# $
get% (
;( )
set* -
;- .
}/ 0
} 
} �
UF:\Code\GitHub\docker\src\AnBook.Web.Core\Models\TokenAuth\AuthenticateResultModel.cs
	namespace 	
AnBook
 
. 
Models 
. 
	TokenAuth !
{ 
public 

class #
AuthenticateResultModel (
{ 
public 
string 
AccessToken !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string  
EncryptedAccessToken *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public		 
int		 
ExpireInSeconds		 "
{		# $
get		% (
;		( )
set		* -
;		- .
}		/ 0
public 
long 
UserId 
{ 
get  
;  !
set" %
;% &
}' (
} 
} �

WF:\Code\GitHub\docker\src\AnBook.Web.Core\Models\TokenAuth\ExternalAuthenticateModel.cs
	namespace 	
AnBook
 
. 
Models 
. 
	TokenAuth !
{ 
public 

class %
ExternalAuthenticateModel *
{ 
[ 	
Required	 
] 
[		 	
StringLength			 
(		 
	UserLogin		 
.		  "
MaxLoginProviderLength		  6
)		6 7
]		7 8
public

 
string

 
AuthProvider

 "
{

# $
get

% (
;

( )
set

* -
;

- .
}

/ 0
[ 	
Required	 
] 
[ 	
StringLength	 
( 
	UserLogin 
.   
MaxProviderKeyLength  4
)4 5
]5 6
public 
string 
ProviderKey !
{" #
get$ '
;' (
set) ,
;, -
}. /
[ 	
Required	 
] 
public 
string 
ProviderAccessCode (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
} 
} �
]F:\Code\GitHub\docker\src\AnBook.Web.Core\Models\TokenAuth\ExternalAuthenticateResultModel.cs
	namespace 	
AnBook
 
. 
Models 
. 
	TokenAuth !
{ 
public 

class +
ExternalAuthenticateResultModel 0
{ 
public 
string 
AccessToken !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string  
EncryptedAccessToken *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public		 
int		 
ExpireInSeconds		 "
{		# $
get		% (
;		( )
set		* -
;		- .
}		/ 0
public 
bool  
WaitingForActivation (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
} 
} �
\F:\Code\GitHub\docker\src\AnBook.Web.Core\Models\TokenAuth\ExternalLoginProviderInfoModel.cs
	namespace 	
AnBook
 
. 
Models 
. 
	TokenAuth !
{ 
[ 
AutoMapFrom 
( 
typeof 
( %
ExternalLoginProviderInfo 1
)1 2
)2 3
]3 4
public 

class *
ExternalLoginProviderInfoModel /
{ 
public		 
string		 
Name		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
public 
string 
ClientId 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} �
DF:\Code\GitHub\docker\src\AnBook.Web.Core\Properties\AssemblyInfo.cs
[ 
assembly 	
:	 

AssemblyTitle 
( 
$str *
)* +
]+ ,
[ 
assembly 	
:	 

AssemblyDescription 
( 
$str !
)! "
]" #
[		 
assembly		 	
:			 
!
AssemblyConfiguration		  
(		  !
$str		! #
)		# $
]		$ %
[

 
assembly

 	
:

	 

AssemblyCompany

 
(

 
$str

 
)

 
]

 
[ 
assembly 	
:	 

AssemblyProduct 
( 
$str ,
), -
]- .
[ 
assembly 	
:	 

AssemblyCopyright 
( 
$str 0
)0 1
]1 2
[ 
assembly 	
:	 

AssemblyTrademark 
( 
$str 
)  
]  !
[ 
assembly 	
:	 

AssemblyCulture 
( 
$str 
) 
] 
[ 
assembly 	
:	 


ComVisible 
( 
false 
) 
] 
[ 
assembly 	
:	 

Guid 
( 
$str 6
)6 7
]7 8
["" 
assembly"" 	
:""	 

AssemblyVersion"" 
("" 
$str"" $
)""$ %
]""% &
[## 
assembly## 	
:##	 

AssemblyFileVersion## 
(## 
$str## (
)##( )
]##) *�
PC:\Users\tianz\AppData\Local\Temp\.NETCoreApp,Version=v2.2.AssemblyAttributes.cs
[ 
assembly 	
:	 

global 
:: 
System 
. 
Runtime !
.! "

Versioning" ,
., -$
TargetFrameworkAttribute- E
(E F
$strF `
,` a 
FrameworkDisplayNameb v
=w x
$stry {
){ |
]| }�
aF:\Code\GitHub\docker\src\AnBook.Web.Core\obj\Debug\netcoreapp2.2\AnBook.Web.Core.AssemblyInfo.cs
[ 
assembly 	
:	 

System 
. 

Reflection 
. 1
%AssemblyInformationalVersionAttribute B
(B C
$strC L
)L M
]M N
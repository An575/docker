†
NF:\Code\GitHub\docker\src\AnBook.Web.Host\Controllers\AntiForgeryController.cs
	namespace 	
AnBook
 
. 
Web 
. 
Host 
. 
Controllers %
{ 
public 

class !
AntiForgeryController &
:' ( 
AnBookControllerBase) =
{ 
private 
readonly 
IAntiforgery %
_antiforgery& 2
;2 3
public

 !
AntiForgeryController

 $
(

$ %
IAntiforgery

% 1
antiforgery

2 =
)

= >
{ 	
_antiforgery 
= 
antiforgery &
;& '
} 	
public 
void 
GetToken 
( 
) 
{ 	
_antiforgery 
. #
SetCookieTokenAndHeader 0
(0 1
HttpContext1 <
)< =
;= >
} 	
} 
} ¾
GF:\Code\GitHub\docker\src\AnBook.Web.Host\Controllers\HomeController.cs
	namespace		 	
AnBook		
 
.		 
Web		 
.		 
Host		 
.		 
Controllers		 %
{

 
public 

class 
HomeController 
:  ! 
AnBookControllerBase" 6
{ 
private 
readonly "
INotificationPublisher /"
_notificationPublisher0 F
;F G
public 
HomeController 
( "
INotificationPublisher 4!
notificationPublisher5 J
)J K
{ 	"
_notificationPublisher "
=# $!
notificationPublisher% :
;: ;
} 	
public 
IActionResult 
Index "
(" #
)# $
{ 	
return 
Redirect 
( 
$str &
)& '
;' (
} 	
public 
async 
Task 
< 
ActionResult &
>& '
TestNotification( 8
(8 9
string9 ?
message@ G
=H I
$strJ L
)L M
{   	
if!! 
(!! 
message!! 
.!! 
IsNullOrEmpty!! %
(!!% &
)!!& '
)!!' (
{"" 
message## 
=## 
$str## D
+##E F
Clock##G L
.##L M
Now##M P
;##P Q
}$$ 
var&& 
defaultTenantAdmin&& "
=&&# $
new&&% (
UserIdentifier&&) 7
(&&7 8
$num&&8 9
,&&9 :
$num&&; <
)&&< =
;&&= >
var'' 
	hostAdmin'' 
='' 
new'' 
UserIdentifier''  .
(''. /
null''/ 3
,''3 4
$num''5 6
)''6 7
;''7 8
await)) "
_notificationPublisher)) (
.))( )
PublishAsync))) 5
())5 6
$str** #
,**# $
new++ #
MessageNotificationData++ +
(+++ ,
message++, 3
)++3 4
,++4 5
severity,, 
:,,  
NotificationSeverity,, .
.,,. /
Info,,/ 3
,,,3 4
userIds-- 
:-- 
new-- 
[-- 
]-- 
{--  
defaultTenantAdmin--! 3
,--3 4
	hostAdmin--5 >
}--? @
).. 
;.. 
return00 
Content00 
(00 
$str00 0
+001 2
message003 :
)00: ;
;00; <
}11 	
}22 
}33 ”
GF:\Code\GitHub\docker\src\AnBook.Web.Host\Controllers\TestController.cs
	namespace 	
AnBook
 
. 
Web 
. 
Host 
. 
Controllers %
{ 
[ 
Route 

(
 
$str &
)& '
]' (
public		 

class		 
TestController		 
:		  ! 
AnBookControllerBase		" 6
{

 
private 
readonly 
IHostingEnvironment ,
_env- 1
;1 2
public 
TestController 
( 
IHostingEnvironment 1
env2 5
)5 6
{ 	
_env 
= 
env 
; 
} 	
[ 	
HttpPost	 
] 
public 
ActionResult 
Env 
(  
)  !
{ 	
var 
appName 
= 
_env 
. 
ApplicationName .
;. /
var 
envName 
= 
_env 
. 
EnvironmentName .
;. /
return 
Json 
( 
JsonConvert #
.# $
SerializeObject$ 3
(3 4
new4 7
{8 9
appName: A
,A B
envNameC J
}K L
)L M
)M N
;N O
} 	
[ 	
HttpPost	 
] 
public 
ActionResult 
Env 
(  
int  #
id$ &
)& '
{ 	
id 
= 
$num 
; 
if 
( 
id 
> 
$num 
) 
{ 
var 
appName 
= 
_env "
." #
ApplicationName# 2
;2 3
var   
envName   
=   
_env   "
.  " #
EnvironmentName  # 2
;  2 3
return!! 
Json!! 
(!! 
JsonConvert!! '
.!!' (
SerializeObject!!( 7
(!!7 8
new!!8 ;
{!!< =
appName!!> E
,!!E F
envName!!G N
}!!O P
)!!P Q
)!!Q R
;!!R S
}"" 
return## 
Json## 
(## 
JsonConvert## #
.### $
SerializeObject##$ 3
(##3 4
new##4 7
{##8 9
appName##: A
=##A B
$str##B H
,##H I
envName##J Q
=##Q R
$str##R X
}##Y Z
)##Z [
)##[ \
;##\ ]
}$$ 	
}%% 
}&& ±
HF:\Code\GitHub\docker\src\AnBook.Web.Host\Startup\AnBookWebHostModule.cs
	namespace 	
AnBook
 
. 
Web 
. 
Host 
. 
Startup !
{ 
[		 
	DependsOn		 
(		 
typeof

 
(

 
AnBookWebCoreModule

 !
)

! "
)

" #
]

# $
public 

class 
AnBookWebHostModule $
:$ %
	AbpModule& /
{ 
private 
readonly 
IHostingEnvironment ,
_env- 1
;1 2
private 
readonly 
IConfigurationRoot +
_appConfiguration, =
;= >
public 
AnBookWebHostModule "
(" #
IHostingEnvironment# 6
env7 :
): ;
{ 	
_env 
= 
env 
; 
_appConfiguration 
= 
env  #
.# $
GetAppConfiguration$ 7
(7 8
)8 9
;9 :
} 	
public 
override 
void 

Initialize '
(' (
)( )
{ 	

IocManager 
. (
RegisterAssemblyByConvention 3
(3 4
typeof4 :
(: ;
AnBookWebHostModule; N
)N O
.O P
GetAssemblyP [
([ \
)\ ]
)] ^
;^ _
} 	
} 
} ž&
CF:\Code\GitHub\docker\src\AnBook.Web.Host\Startup\AuthConfigurer.cs
	namespace 	
AnBook
 
. 
Web 
. 
Host 
. 
Startup !
{ 
public 

static 
class 
AuthConfigurer &
{ 
public 
static 
void 
	Configure $
($ %
IServiceCollection% 7
services8 @
,@ A
IConfigurationB P
configurationQ ^
)^ _
{ 	
if 
( 
bool 
. 
Parse 
( 
configuration (
[( )
$str) M
]M N
)N O
)O P
{ 
services 
. 
AddAuthentication *
(* +
options+ 2
=>3 5
{6 7
options 
. %
DefaultAuthenticateScheme 5
=6 7
$str8 C
;C D
options 
. "
DefaultChallengeScheme 2
=3 4
$str5 @
;@ A
} 
) 
. 
AddJwtBearer 
(  
$str  +
,+ ,
options- 4
=>5 7
{ 
options 
. 
Audience $
=% &
configuration' 4
[4 5
$str5 X
]X Y
;Y Z
options 
. %
TokenValidationParameters 5
=6 7
new8 ;%
TokenValidationParameters< U
{ $
ValidateIssuerSigningKey 0
=1 2
true3 7
,7 8
IssuerSigningKey (
=) *
new+ . 
SymmetricSecurityKey/ C
(C D
EncodingD L
.L M
ASCIIM R
.R S
GetBytesS [
([ \
configuration\ i
[i j
$str	j 
]
 ‘
)
‘ ’
)
’ “
,
“ ”
ValidateIssuer!! &
=!!' (
true!!) -
,!!- .
ValidIssuer"" #
=""$ %
configuration""& 3
[""3 4
$str""4 U
]""U V
,""V W
ValidateAudience%% (
=%%) *
true%%+ /
,%%/ 0
ValidAudience&& %
=&&& '
configuration&&( 5
[&&5 6
$str&&6 Y
]&&Y Z
,&&Z [
ValidateLifetime)) (
=))) *
true))+ /
,))/ 0
	ClockSkew,, !
=,," #
TimeSpan,,$ ,
.,,, -
Zero,,- 1
}-- 
;-- 
options// 
.// 
Events// "
=//# $
new//% (
JwtBearerEvents//) 8
{00 
OnMessageReceived11 )
=11* +$
QueryStringTokenResolver11, D
}22 
;22 
}33 
)33 
;33 
}44 
}55 	
private99 
static99 
Task99 $
QueryStringTokenResolver99 4
(994 5"
MessageReceivedContext995 K
context99L S
)99S T
{:: 	
if;; 
(;; 
!;; 
context;; 
.;; 
HttpContext;; $
.;;$ %
Request;;% ,
.;;, -
Path;;- 1
.;;1 2
HasValue;;2 :
||;;; =
!<< 
context<< 
.<< 
HttpContext<< $
.<<$ %
Request<<% ,
.<<, -
Path<<- 1
.<<1 2
Value<<2 7
.<<7 8

StartsWith<<8 B
(<<B C
$str<<C M
)<<M N
)<<N O
{== 
return?? 
Task?? 
.?? 
CompletedTask?? )
;??) *
}@@ 
varBB 
qsAuthTokenBB 
=BB 
contextBB %
.BB% &
HttpContextBB& 1
.BB1 2
RequestBB2 9
.BB9 :
QueryBB: ?
[BB? @
$strBB@ P
]BBP Q
.BBQ R
FirstOrDefaultBBR `
(BB` a
)BBa b
;BBb c
ifCC 
(CC 
qsAuthTokenCC 
==CC 
nullCC #
)CC# $
{DD 
returnFF 
TaskFF 
.FF 
CompletedTaskFF )
;FF) *
}GG 
contextJJ 
.JJ 
TokenJJ 
=JJ 
SimpleStringCipherJJ .
.JJ. /
InstanceJJ/ 7
.JJ7 8
DecryptJJ8 ?
(JJ? @
qsAuthTokenJJ@ K
,JJK L
	AppConstsJJM V
.JJV W
DefaultPassPhraseJJW h
)JJh i
;JJi j
returnKK 
TaskKK 
.KK 
CompletedTaskKK %
;KK% &
}LL 	
}MM 
}NN Ì	
<F:\Code\GitHub\docker\src\AnBook.Web.Host\Startup\Program.cs
	namespace 	
AnBook
 
. 
Web 
. 
Host 
. 
Startup !
{ 
public 

class 
Program 
{ 
public 
static 
void 
Main 
(  
string  &
[& '
]' (
args) -
)- .
{		 	
BuildWebHost

 
(

 
args

 
)

 
.

 
Run

 "
(

" #
)

# $
;

$ %
} 	
public 
static 
IWebHost 
BuildWebHost +
(+ ,
string, 2
[2 3
]3 4
args5 9
)9 :
{ 	
return 
WebHost 
.  
CreateDefaultBuilder /
(/ 0
args0 4
)4 5
. 

UseStartup 
< 
Startup #
># $
($ %
)% &
. 
Build 
( 
) 
; 
} 	
} 
} ö=
<F:\Code\GitHub\docker\src\AnBook.Web.Host\Startup\Startup.cs
	namespace 	
AnBook
 
. 
Web 
. 
Host 
. 
Startup !
{ 
public 

class 
Startup 
{ 
private 
const 
string "
_defaultCorsPolicyName 3
=4 5
$str6 A
;A B
private 
readonly 
IConfigurationRoot +
_appConfiguration, =
;= >
public 
Startup 
( 
IHostingEnvironment *
env+ .
). /
{ 	
_appConfiguration 
= 
env  #
.# $
GetAppConfiguration$ 7
(7 8
)8 9
;9 :
} 	
public!! 
IServiceProvider!! 
ConfigureServices!!  1
(!!1 2
IServiceCollection!!2 D
services!!E M
)!!M N
{"" 	
services$$ 
.$$ 
AddMvc$$ 
($$ 
options%% 
=>%% 
options%% "
.%%" #
Filters%%# *
.%%* +
Add%%+ .
(%%. /
new%%/ 2*
CorsAuthorizationFilterFactory%%3 Q
(%%Q R"
_defaultCorsPolicyName%%R h
)%%h i
)%%i j
)&& 
;&& 
IdentityRegistrar(( 
.(( 
Register(( &
(((& '
services((' /
)((/ 0
;((0 1
AuthConfigurer)) 
.)) 
	Configure)) $
())$ %
services))% -
,))- .
_appConfiguration))/ @
)))@ A
;))A B
services++ 
.++ 

AddSignalR++ 
(++  
)++  !
;++! "
services.. 
... 
AddCors.. 
(.. 
options// 
=>// 
options// "
.//" #
	AddPolicy//# ,
(//, -"
_defaultCorsPolicyName00 *
,00* +
builder11 
=>11 
builder11 &
.22 
WithOrigins22 $
(22$ %
_appConfiguration44 -
[44- .
$str44. ?
]44? @
.55  !
Split55! &
(55& '
$str55' *
,55* +
StringSplitOptions55, >
.55> ?
RemoveEmptyEntries55? Q
)55Q R
.66  !
Select66! '
(66' (
o66( )
=>66* ,
o66- .
.66. /
RemovePostFix66/ <
(66< =
$str66= @
)66@ A
)66A B
.77  !
ToArray77! (
(77( )
)77) *
)88 
.99 
AllowAnyHeader99 '
(99' (
)99( )
.:: 
AllowAnyMethod:: '
(::' (
)::( )
.;; 
AllowCredentials;; )
(;;) *
);;* +
)<< 
)== 
;== 
services@@ 
.@@ 
AddSwaggerGen@@ "
(@@" #
options@@# *
=>@@+ -
{AA 
optionsBB 
.BB 

SwaggerDocBB "
(BB" #
$strBB# '
,BB' (
newBB) ,
InfoBB- 1
{BB2 3
TitleBB4 9
=BB: ;
$strBB< H
,BBH I
VersionBBJ Q
=BBR S
$strBBT X
}BBY Z
)BBZ [
;BB[ \
optionsCC 
.CC !
DocInclusionPredicateCC -
(CC- .
(CC. /
docNameCC/ 6
,CC6 7
descriptionCC8 C
)CCC D
=>CCE G
trueCCH L
)CCL M
;CCM N
optionsFF 
.FF !
AddSecurityDefinitionFF -
(FF- .
$strFF. :
,FF: ;
newFF< ?
ApiKeySchemeFF@ L
(FFL M
)FFM N
{GG 
DescriptionHH 
=HH  !
$str	HH" €
,
HH€ 
NameII 
=II 
$strII *
,II* +
InJJ 
=JJ 
$strJJ !
,JJ! "
TypeKK 
=KK 
$strKK #
}LL 
)LL 
;LL 
}MM 
)MM 
;MM 
returnPP 
servicesPP 
.PP 
AddAbpPP "
<PP" #
AnBookWebHostModulePP# 6
>PP6 7
(PP7 8
optionsRR 
=>RR 
optionsRR "
.RR" #

IocManagerRR# -
.RR- .
IocContainerRR. :
.RR: ;
AddFacilityRR; F
<RRF G
LoggingFacilityRRG V
>RRV W
(RRW X
fSS 
=>SS 
fSS 
.SS 
UseAbpLog4NetSS (
(SS( )
)SS) *
.SS* +

WithConfigSS+ 5
(SS5 6
$strSS6 F
)SSF G
)TT 
)UU 
;UU 
}VV 	
publicXX 
voidXX 
	ConfigureXX 
(XX 
IApplicationBuilderXX 1
appXX2 5
,XX5 6
IHostingEnvironmentXX7 J
envXXK N
,XXN O
ILoggerFactoryXXP ^
loggerFactoryXX_ l
)XXl m
{YY 	
appZZ 
.ZZ 
UseAbpZZ 
(ZZ 
optionsZZ 
=>ZZ !
{ZZ" #
optionsZZ$ +
.ZZ+ ,%
UseAbpRequestLocalizationZZ, E
=ZZF G
falseZZH M
;ZZM N
}ZZO P
)ZZP Q
;ZZQ R
app\\ 
.\\ 
UseCors\\ 
(\\ "
_defaultCorsPolicyName\\ .
)\\. /
;\\/ 0
app^^ 
.^^ 
UseStaticFiles^^ 
(^^ 
)^^  
;^^  !
app`` 
.`` 
UseAuthentication`` !
(``! "
)``" #
;``# $
appbb 
.bb %
UseAbpRequestLocalizationbb )
(bb) *
)bb* +
;bb+ ,
appee 
.ee 

UseSignalRee 
(ee 
routesee !
=>ee" $
{ff 
routesgg 
.gg 
MapHubgg 
<gg 
AbpCommonHubgg *
>gg* +
(gg+ ,
$strgg, 6
)gg6 7
;gg7 8
}hh 
)hh 
;hh 
appjj 
.jj 
UseMvcjj 
(jj 
routesjj 
=>jj  
{kk 
routesll 
.ll 
MapRoutell 
(ll  
namemm 
:mm 
$strmm +
,mm+ ,
templatenn 
:nn 
$strnn M
)nnM N
;nnN O
routespp 
.pp 
MapRoutepp 
(pp  
nameqq 
:qq 
$strqq #
,qq# $
templaterr 
:rr 
$strrr F
)rrF G
;rrG H
}ss 
)ss 
;ss 
appvv 
.vv 

UseSwaggervv 
(vv 
)vv 
;vv 
appxx 
.xx 
UseSwaggerUIxx 
(xx 
optionsxx $
=>xx% '
{yy 
optionszz 
.zz 
SwaggerEndpointzz '
(zz' (
_appConfigurationzz( 9
[zz9 :
$strzz: Q
]zzQ R
.zzR S
EnsureEndsWithzzS a
(zza b
$charzzb e
)zze f
+zzg h
$str	zzi ‚
,
zz‚ ƒ
$str
zz„ “
)
zz“ ”
;
zz” •
options{{ 
.{{ 
IndexStream{{ #
={{$ %
({{& '
){{' (
=>{{) +
Assembly{{, 4
.{{4 5 
GetExecutingAssembly{{5 I
({{I J
){{J K
.|| %
GetManifestResourceStream|| .
(||. /
$str||/ ^
)||^ _
;||_ `
}}} 
)}} 
;}} 
}~~ 	
} 
}€€ Í
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
]| }Ô

fF:\Code\GitHub\docker\src\AnBook.Web.Host\obj\Debug\netcoreapp2.2\AnBook.Web.Host.RazorAssemblyInfo.cs
[ 
assembly 	
:	 

	Microsoft 
. 

AspNetCore 
.  
Mvc  #
.# $
ApplicationParts$ 4
.4 5$
RelatedAssemblyAttribute5 M
(M N
$strN e
)e f
]f g
[ 
assembly 	
:	 

	Microsoft 
. 

AspNetCore 
.  
Razor  %
.% &
Hosting& -
.- .)
RazorLanguageVersionAttribute. K
(K L
$strL Q
)Q R
]R S
[ 
assembly 	
:	 

	Microsoft 
. 

AspNetCore 
.  
Razor  %
.% &
Hosting& -
.- .+
RazorConfigurationNameAttribute. M
(M N
$strN W
)W X
]X Y
[ 
assembly 	
:	 

	Microsoft 
. 

AspNetCore 
.  
Razor  %
.% &
Hosting& -
.- ./
#RazorExtensionAssemblyNameAttribute. Q
(Q R
$strR [
,[ \
$str	] ˆ
)
ˆ ‰
]
‰ ŠŸ
aF:\Code\GitHub\docker\src\AnBook.Web.Host\obj\Debug\netcoreapp2.2\AnBook.Web.Host.AssemblyInfo.cs
[ 
assembly 	
:	 

System 
. 

Reflection 
. $
AssemblyCompanyAttribute 5
(5 6
$str6 G
)G H
]H I
[ 
assembly 	
:	 

System 
. 

Reflection 
. *
AssemblyConfigurationAttribute ;
(; <
$str< C
)C D
]D E
[ 
assembly 	
:	 

System 
. 

Reflection 
. (
AssemblyFileVersionAttribute 9
(9 :
$str: C
)C D
]D E
[ 
assembly 	
:	 

System 
. 

Reflection 
. 1
%AssemblyInformationalVersionAttribute B
(B C
$strC J
)J K
]K L
[ 
assembly 	
:	 

System 
. 

Reflection 
. $
AssemblyProductAttribute 5
(5 6
$str6 G
)G H
]H I
[ 
assembly 	
:	 

System 
. 

Reflection 
. "
AssemblyTitleAttribute 3
(3 4
$str4 E
)E F
]F G
[ 
assembly 	
:	 

System 
. 

Reflection 
. $
AssemblyVersionAttribute 5
(5 6
$str6 ?
)? @
]@ A
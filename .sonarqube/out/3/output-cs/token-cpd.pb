‚
AF:\Code\GitHub\docker\src\AnBook.Migrator\AnBookMigratorModule.cs
	namespace

 	
AnBook


 
.

 
Migrator

 
{ 
[ 
	DependsOn 
( 
typeof 
( '
AnBookEntityFrameworkModule 1
)1 2
)2 3
]3 4
public 

class  
AnBookMigratorModule %
:& '
	AbpModule( 1
{ 
private 
readonly 
IConfigurationRoot +
_appConfiguration, =
;= >
public  
AnBookMigratorModule #
(# $'
AnBookEntityFrameworkModule$ ?/
#abpProjectNameEntityFrameworkModule@ c
)c d
{ 	/
#abpProjectNameEntityFrameworkModule /
./ 0

SkipDbSeed0 :
=; <
true= A
;A B
_appConfiguration 
= 
AppConfigurations  1
.1 2
Get2 5
(5 6
typeof 
(  
AnBookMigratorModule +
)+ ,
., -
GetAssembly- 8
(8 9
)9 :
.: ;"
GetDirectoryPathOrNull; Q
(Q R
)R S
) 
; 
} 	
public 
override 
void 
PreInitialize *
(* +
)+ ,
{ 	
Configuration 
. )
DefaultNameOrConnectionString 7
=8 9
_appConfiguration: K
.K L
GetConnectionStringL _
(_ `
AnBookConsts 
.  
ConnectionStringName 1
) 
; 
Configuration   
.   
BackgroundJobs   (
.  ( )!
IsJobExecutionEnabled  ) >
=  ? @
false  A F
;  F G
Configuration!! 
.!! 
ReplaceService!! (
(!!( )
typeof"" 
("" 
	IEventBus""  
)""  !
,""! "
(## 
)## 
=>## 

IocManager##  
.##  !
IocContainer##! -
.##- .
Register##. 6
(##6 7
	Component$$ 
.$$ 
For$$ !
<$$! "
	IEventBus$$" +
>$$+ ,
($$, -
)$$- .
.$$. /
Instance$$/ 7
($$7 8
NullEventBus$$8 D
.$$D E
Instance$$E M
)$$M N
)%% 
)&& 
;&& 
}'' 	
public)) 
override)) 
void)) 

Initialize)) '
())' (
)))( )
{** 	

IocManager++ 
.++ (
RegisterAssemblyByConvention++ 3
(++3 4
typeof++4 :
(++: ; 
AnBookMigratorModule++; O
)++O P
.++P Q
GetAssembly++Q \
(++\ ]
)++] ^
)++^ _
;++_ `&
ServiceCollectionRegistrar,, &
.,,& '
Register,,' /
(,,/ 0

IocManager,,0 :
),,: ;
;,,; <
}-- 	
}.. 
}// π
[F:\Code\GitHub\docker\src\AnBook.Migrator\DependencyInjection\ServiceCollectionRegistrar.cs
	namespace 	
AnBook
 
. 
Migrator 
. 
DependencyInjection -
{ 
public 

static 
class &
ServiceCollectionRegistrar 2
{		 
public

 
static

 
void

 
Register

 #
(

# $
IIocManager

$ /

iocManager

0 :
)

: ;
{ 	
var 
services 
= 
new 
ServiceCollection 0
(0 1
)1 2
;2 3
IdentityRegistrar 
. 
Register &
(& '
services' /
)/ 0
;0 1%
WindsorRegistrationHelper %
.% &!
CreateServiceProvider& ;
(; <

iocManager< F
.F G
IocContainerG S
,S T
servicesU ]
)] ^
;^ _
} 	
} 
} Õ	
0F:\Code\GitHub\docker\src\AnBook.Migrator\Log.cs
	namespace 	
AnBook
 
. 
Migrator 
{ 
public 

class 
Log 
:  
ITransientDependency +
{		 
public

 
ILogger

 
Logger

 
{

 
get

  #
;

# $
set

% (
;

( )
}

* +
public 
Log 
( 
) 
{ 	
Logger 
= 

NullLogger 
.  
Instance  (
;( )
} 	
public 
void 
Write 
( 
string  
text! %
)% &
{ 	
Console 
. 
	WriteLine 
( 
Clock #
.# $
Now$ '
.' (
ToString( 0
(0 1
$str1 F
)F G
+H I
$strJ O
+P Q
textR V
)V W
;W X
Logger 
. 
Info 
( 
text 
) 
; 
} 	
} 
} ÕP
GF:\Code\GitHub\docker\src\AnBook.Migrator\MultiTenantMigrateExecuter.cs
	namespace 	
AnBook
 
. 
Migrator 
{ 
public 

class &
MultiTenantMigrateExecuter +
:, - 
ITransientDependency. B
{ 
private 
readonly 
Log 
_log !
;! "
private 
readonly 
AbpZeroDbMigrator *
	_migrator+ 4
;4 5
private 
readonly 
IRepository $
<$ %
Tenant% +
>+ ,
_tenantRepository- >
;> ?
private 
readonly 0
$IDbPerTenantConnectionStringResolver =%
_connectionStringResolver> W
;W X
public &
MultiTenantMigrateExecuter )
() *
AbpZeroDbMigrator 
migrator &
,& '
IRepository 
< 
Tenant 
> 
tenantRepository  0
,0 1
Log 
log 
, 0
$IDbPerTenantConnectionStringResolver 0$
connectionStringResolver1 I
)I J
{ 	
_log 
= 
log 
; 
	_migrator   
=   
migrator    
;    !
_tenantRepository!! 
=!! 
tenantRepository!!  0
;!!0 1%
_connectionStringResolver"" %
=""& '$
connectionStringResolver""( @
;""@ A
}## 	
public%% 
bool%% 
Run%% 
(%% 
bool%%  
skipConnVerification%% 1
)%%1 2
{&& 	
var'' 
hostConnStr'' 
='' "
CensorConnectionString'' 4
(''4 5%
_connectionStringResolver''5 N
.''N O%
GetNameOrConnectionString''O h
(''h i
new''i l(
ConnectionStringResolveArgs	''m à
(
''à â
MultiTenancySides
''â ö
.
''ö õ
Host
''õ ü
)
''ü †
)
''† °
)
''° ¢
;
''¢ £
if(( 
((( 
hostConnStr(( 
.(( 
IsNullOrWhiteSpace(( .
(((. /
)((/ 0
)((0 1
{)) 
_log** 
.** 
Write** 
(** 
$str** b
)**b c
;**c d
return++ 
false++ 
;++ 
},, 
_log.. 
... 
Write.. 
(.. 
$str.. (
+..) *"
ConnectionStringHelper..+ A
...A B
GetConnectionString..B U
(..U V
hostConnStr..V a
)..a b
)..b c
;..c d
if// 
(// 
!//  
skipConnVerification// %
)//% &
{00 
_log11 
.11 
Write11 
(11 
$str11 d
)11d e
;11e f
var22 
command22 
=22 
Console22 %
.22% &
ReadLine22& .
(22. /
)22/ 0
;220 1
if33 
(33 
!33 
command33 
.33 
IsIn33 !
(33! "
$str33" %
,33% &
$str33' *
)33* +
)33+ ,
{44 
_log55 
.55 
Write55 
(55 
$str55 4
)554 5
;555 6
return66 
false66  
;66  !
}77 
}88 
_log:: 
.:: 
Write:: 
(:: 
$str:: ;
)::; <
;::< =
try<< 
{== 
	_migrator>> 
.>> "
CreateOrMigrateForHost>> 0
(>>0 1

SeedHelper>>1 ;
.>>; <

SeedHostDb>>< F
)>>F G
;>>G H
}?? 
catch@@ 
(@@ 
	Exception@@ 
ex@@ 
)@@  
{AA 
_logBB 
.BB 
WriteBB 
(BB 
$strBB P
)BBP Q
;BBQ R
_logCC 
.CC 
WriteCC 
(CC 
exCC 
.CC 
ToStringCC &
(CC& '
)CC' (
)CC( )
;CC) *
_logDD 
.DD 
WriteDD 
(DD 
$strDD 1
)DD1 2
;DD2 3
returnEE 
falseEE 
;EE 
}FF 
_logHH 
.HH 
WriteHH 
(HH 
$strHH ;
)HH; <
;HH< =
_logII 
.II 
WriteII 
(II 
$strII Q
)IIQ R
;IIR S
varKK 
migratedDatabasesKK !
=KK" #
newKK$ '
HashSetKK( /
<KK/ 0
stringKK0 6
>KK6 7
(KK7 8
)KK8 9
;KK9 :
varLL 
tenantsLL 
=LL 
_tenantRepositoryLL +
.LL+ ,

GetAllListLL, 6
(LL6 7
tLL7 8
=>LL9 ;
tLL< =
.LL= >
ConnectionStringLL> N
!=LLO Q
nullLLR V
&&LLW Y
tLLZ [
.LL[ \
ConnectionStringLL\ l
!=LLm o
$strLLp r
)LLr s
;LLs t
forMM 
(MM 
varMM 
iMM 
=MM 
$numMM 
;MM 
iMM 
<MM 
tenantsMM  '
.MM' (
CountMM( -
;MM- .
iMM/ 0
++MM0 2
)MM2 3
{NN 
varOO 
tenantOO 
=OO 
tenantsOO $
[OO$ %
iOO% &
]OO& '
;OO' (
_logPP 
.PP 
WritePP 
(PP 
stringPP !
.PP! "
FormatPP" (
(PP( )
$strPP) [
,PP[ \
(PP] ^
iPP^ _
+PP` a
$numPPb c
)PPc d
,PPd e
tenantsPPf m
.PPm n
CountPPn s
)PPs t
)PPt u
;PPu v
_logQQ 
.QQ 
WriteQQ 
(QQ 
$strQQ 1
+QQ2 3
tenantQQ4 :
.QQ: ;
NameQQ; ?
)QQ? @
;QQ@ A
_logRR 
.RR 
WriteRR 
(RR 
$strRR 1
+RR2 3
tenantRR4 :
.RR: ;
TenancyNameRR; F
)RRF G
;RRG H
_logSS 
.SS 
WriteSS 
(SS 
$strSS 1
+SS2 3
tenantSS4 :
.SS: ;
IdSS; =
)SS= >
;SS> ?
_logTT 
.TT 
WriteTT 
(TT 
$strTT 1
+TT2 3
SimpleStringCipherTT4 F
.TTF G
InstanceTTG O
.TTO P
DecryptTTP W
(TTW X
tenantTTX ^
.TT^ _
ConnectionStringTT_ o
)TTo p
)TTp q
;TTq r
ifVV 
(VV 
!VV 
migratedDatabasesVV &
.VV& '
ContainsVV' /
(VV/ 0
tenantVV0 6
.VV6 7
ConnectionStringVV7 G
)VVG H
)VVH I
{WW 
tryXX 
{YY 
	_migratorZZ !
.ZZ! "$
CreateOrMigrateForTenantZZ" :
(ZZ: ;
tenantZZ; A
)ZZA B
;ZZB C
}[[ 
catch\\ 
(\\ 
	Exception\\ $
ex\\% '
)\\' (
{]] 
_log^^ 
.^^ 
Write^^ "
(^^" #
$str^^# Z
)^^Z [
;^^[ \
_log__ 
.__ 
Write__ "
(__" #
ex__# %
.__% &
ToString__& .
(__. /
)__/ 0
)__0 1
;__1 2
_log`` 
.`` 
Write`` "
(``" #
$str``# X
)``X Y
;``Y Z
}aa 
migratedDatabasescc %
.cc% &
Addcc& )
(cc) *
tenantcc* 0
.cc0 1
ConnectionStringcc1 A
)ccA B
;ccB C
}dd 
elseee 
{ff 
_loggg 
.gg 
Writegg 
(gg 
$str	gg å
)
ggå ç
;
ggç é
}hh 
_logjj 
.jj 
Writejj 
(jj 
stringjj !
.jj! "
Formatjj" (
(jj( )
$strjj) [
,jj[ \
(jj] ^
ijj^ _
+jj` a
$numjjb c
)jjc d
,jjd e
tenantsjjf m
.jjm n
Countjjn s
)jjs t
)jjt u
;jju v
_logkk 
.kk 
Writekk 
(kk 
$strkk U
)kkU V
;kkV W
}ll 
_lognn 
.nn 
Writenn 
(nn 
$strnn :
)nn: ;
;nn; <
returnpp 
truepp 
;pp 
}qq 	
privatess 
staticss 
stringss "
CensorConnectionStringss 4
(ss4 5
stringss5 ;
connectionStringss< L
)ssL M
{tt 	
varuu 
builderuu 
=uu 
newuu %
DbConnectionStringBuilderuu 7
{uu8 9
ConnectionStringuu: J
=uuK L
connectionStringuuM ]
}uu^ _
;uu_ `
varvv 

keysToMaskvv 
=vv 
newvv  
[vv  !
]vv! "
{vv# $
$strvv% /
,vv/ 0
$strvv1 6
,vv6 7
$strvv8 A
,vvA B
$strvvC H
}vvI J
;vvJ K
foreachxx 
(xx 
varxx 
keyxx 
inxx 

keysToMaskxx  *
)xx* +
{yy 
ifzz 
(zz 
builderzz 
.zz 
ContainsKeyzz '
(zz' (
keyzz( +
)zz+ ,
)zz, -
{{{ 
builder|| 
[|| 
key|| 
]||  
=||! "
$str||# *
;||* +
}}} 
}~~ 
return
ÄÄ 
builder
ÄÄ 
.
ÄÄ 
ToString
ÄÄ #
(
ÄÄ# $
)
ÄÄ$ %
;
ÄÄ% &
}
ÅÅ 	
}
ÇÇ 
}ÉÉ â
4F:\Code\GitHub\docker\src\AnBook.Migrator\Program.cs
	namespace 	
AnBook
 
. 
Migrator 
{		 
public

 

class

 
Program

 
{ 
private 
static 
bool 

_quietMode &
;& '
public 
static 
void 
Main 
(  
string  &
[& '
]' (
args) -
)- .
{ 	
	ParseArgs 
( 
args 
) 
; 
using 
( 
var 
bootstrapper #
=$ %
AbpBootstrapper& 5
.5 6
Create6 <
<< = 
AnBookMigratorModule= Q
>Q R
(R S
)S T
)T U
{ 
bootstrapper 
. 

IocManager '
.' (
IocContainer( 4
. 
AddFacility  
<  !
LoggingFacility! 0
>0 1
(1 2
f 
=> 
f 
. 
UseAbpLog4Net ,
(, -
)- .
.. /

WithConfig/ 9
(9 :
$str: J
)J K
) 
; 
bootstrapper 
. 

Initialize '
(' (
)( )
;) *
using 
( 
var 
migrateExecuter *
=+ ,
bootstrapper- 9
.9 :

IocManager: D
.D E
ResolveAsDisposableE X
<X Y&
MultiTenantMigrateExecuterY s
>s t
(t u
)u v
)v w
{ 
var 
migrationSucceeded *
=+ ,
migrateExecuter- <
.< =
Object= C
.C D
RunD G
(G H

_quietModeH R
)R S
;S T
if 
( 

_quietMode "
)" #
{   
var"" 
exitCode"" $
=""% &
Convert""' .
."". /
ToInt32""/ 6
(""6 7
!""7 8
migrationSucceeded""8 J
)""J K
;""K L
Environment## #
.### $
Exit##$ (
(##( )
exitCode##) 1
)##1 2
;##2 3
}$$ 
else%% 
{&& 
Console'' 
.''  
	WriteLine''  )
('') *
$str''* B
)''B C
;''C D
Console(( 
.((  
ReadLine((  (
(((( )
)(() *
;((* +
})) 
}** 
}++ 
},, 	
private.. 
static.. 
void.. 
	ParseArgs.. %
(..% &
string..& ,
[.., -
]..- .
args../ 3
)..3 4
{// 	
if00 
(00 
args00 
.00 
IsNullOrEmpty00 "
(00" #
)00# $
)00$ %
{11 
return22 
;22 
}33 
foreach55 
(55 
var55 
arg55 
in55 
args55  $
)55$ %
{66 
switch77 
(77 
arg77 
)77 
{88 
case99 
$str99 
:99 

_quietMode:: "
=::# $
true::% )
;::) *
break;; 
;;; 
}<< 
}== 
}>> 	
}?? 
}@@ ì
DF:\Code\GitHub\docker\src\AnBook.Migrator\Properties\AssemblyInfo.cs
[ 
assembly 	
:	 
!
AssemblyConfiguration  
(  !
$str! #
)# $
]$ %
[ 
assembly 	
:	 

AssemblyCompany 
( 
$str 
) 
] 
[		 
assembly		 	
:			 

AssemblyProduct		 
(		 
$str		 ,
)		, -
]		- .
[

 
assembly

 	
:

	 

AssemblyTrademark

 
(

 
$str

 
)

  
]

  !
[ 
assembly 	
:	 


ComVisible 
( 
false 
) 
] 
[ 
assembly 	
:	 

Guid 
( 
$str 6
)6 7
]7 8Õ
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
]| }ˆ
aF:\Code\GitHub\docker\src\AnBook.Migrator\obj\Debug\netcoreapp2.2\AnBook.Migrator.AssemblyInfo.cs
[ 
assembly 	
:	 

System 
. 

Reflection 
. (
AssemblyFileVersionAttribute 9
(9 :
$str: C
)C D
]D E
[ 
assembly 	
:	 

System 
. 

Reflection 
. 1
%AssemblyInformationalVersionAttribute B
(B C
$strC J
)J K
]K L
[ 
assembly 	
:	 

System 
. 

Reflection 
. "
AssemblyTitleAttribute 3
(3 4
$str4 E
)E F
]F G
[ 
assembly 	
:	 

System 
. 

Reflection 
. $
AssemblyVersionAttribute 5
(5 6
$str6 ?
)? @
]@ A
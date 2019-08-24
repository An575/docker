�
]F:\Code\GitHub\docker\src\AnBook.EntityFrameworkCore\EntityFrameworkCore\AbpZeroDbMigrator.cs
	namespace 	
AnBook
 
. 
EntityFrameworkCore $
{ 
public 

class 
AbpZeroDbMigrator "
:# $
AbpZeroDbMigrator% 6
<6 7
AnBookDbContext7 F
>F G
{		 
public

 
AbpZeroDbMigrator

  
(

  !
IUnitOfWorkManager 
unitOfWorkManager 0
,0 10
$IDbPerTenantConnectionStringResolver 0$
connectionStringResolver1 I
,I J
IDbContextResolver
dbContextResolver
)
: 
base 
( 
unitOfWorkManager !
,! "$
connectionStringResolver (
,( )
dbContextResolver !
)! "
{ 	
} 	
} 
} �
[F:\Code\GitHub\docker\src\AnBook.EntityFrameworkCore\EntityFrameworkCore\AnBookDbContext.cs
	namespace 	
AnBook
 
. 
EntityFrameworkCore $
{ 
public		 

class		 
AnBookDbContext		  
:		! "
AbpZeroDbContext		# 3
<		3 4
Tenant		4 :
,		: ;
Role		< @
,		@ A
User		B F
,		F G
AnBookDbContext		H W
>		W X
{

 
public
AnBookDbContext
(
DbContextOptions
<
AnBookDbContext
>
options
)
: 
base 
( 
options 
) 
{ 	
} 	
} 
} �	
eF:\Code\GitHub\docker\src\AnBook.EntityFrameworkCore\EntityFrameworkCore\AnBookDbContextConfigurer.cs
	namespace 	
AnBook
 
. 
EntityFrameworkCore $
{ 
public 

static 
class %
AnBookDbContextConfigurer 1
{ 
public 
static 
void 
	Configure $
($ %#
DbContextOptionsBuilder% <
<< =
AnBookDbContext= L
>L M
builderN U
,U V
stringW ]
connectionString^ n
)n o
{		 	
builder

 
.

 
UseSqlServer

  
(

  !
connectionString

! 1
)

1 2
;

2 3
} 	
public
static
void
	Configure
(
DbContextOptionsBuilder
<
AnBookDbContext
>
builder
,
DbConnection

connection
)
{ 	
builder 
. 
UseSqlServer  
(  !

connection! +
)+ ,
;, -
} 	
} 
} �
bF:\Code\GitHub\docker\src\AnBook.EntityFrameworkCore\EntityFrameworkCore\AnBookDbContextFactory.cs
	namespace 	
AnBook
 
. 
EntityFrameworkCore $
{ 
public

 

class

 "
AnBookDbContextFactory

 '
:

( )'
IDesignTimeDbContextFactory

* E
<

E F
AnBookDbContext

F U
>

U V
{ 
public 
AnBookDbContext 
CreateDbContext .
(. /
string/ 5
[5 6
]6 7
args8 <
)< =
{
var 
builder 
= 
new #
DbContextOptionsBuilder 5
<5 6
AnBookDbContext6 E
>E F
(F G
)G H
;H I
var 

= 
AppConfigurations  1
.1 2
Get2 5
(5 6%
WebContentDirectoryFinder6 O
.O P&
CalculateContentRootFolderP j
(j k
)k l
)l m
;m n%
AnBookDbContextConfigurer %
.% &
	Configure& /
(/ 0
builder0 7
,7 8

.F G
GetConnectionStringG Z
(Z [
AnBookConsts[ g
.g h 
ConnectionStringNameh |
)| }
)} ~
;~ 
return 
new 
AnBookDbContext &
(& '
builder' .
.. /
Options/ 6
)6 7
;7 8
} 	
} 
} �
gF:\Code\GitHub\docker\src\AnBook.EntityFrameworkCore\EntityFrameworkCore\AnBookEntityFrameworkModule.cs
	namespace 	
AnBook
 
. 
EntityFrameworkCore $
{ 
[		 
	DependsOn		 
(		 
typeof

 
(

 
AnBookCoreModule

 
)

  
,

  !
typeof 
( 0
$AbpZeroCoreEntityFrameworkCoreModule 3
)3 4
)4 5
]5 6
public 

class '
AnBookEntityFrameworkModule ,
:- .
	AbpModule/ 8
{
public 
bool %
SkipDbContextRegistration -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
public 
bool 

SkipDbSeed 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
override 
void 

(* +
)+ ,
{ 	
if 
( 
! %
SkipDbContextRegistration *
)* +
{ 

. 
Modules %
.% &
	AbpEfCore& /
(/ 0
)0 1
.1 2
AddDbContext2 >
<> ?
AnBookDbContext? N
>N O
(O P
optionsP W
=>X Z
{ 
if 
( 
options 
.  
ExistingConnection  2
!=3 5
null6 :
): ;
{ %
AnBookDbContextConfigurer 1
.1 2
	Configure2 ;
(; <
options< C
.C D
DbContextOptionsD T
,T U
optionsV ]
.] ^
ExistingConnection^ p
)p q
;q r
} 
else 
{ %
AnBookDbContextConfigurer 1
.1 2
	Configure2 ;
(; <
options< C
.C D
DbContextOptionsD T
,T U
optionsV ]
.] ^
ConnectionString^ n
)n o
;o p
}   
}!! 
)!! 
;!! 
}"" 
}## 	
public%% 
override%% 
void%% 

Initialize%% '
(%%' (
)%%( )
{&& 	

IocManager'' 
.'' (
RegisterAssemblyByConvention'' 3
(''3 4
typeof''4 :
('': ;'
AnBookEntityFrameworkModule''; V
)''V W
.''W X
GetAssembly''X c
(''c d
)''d e
)''e f
;''f g
}(( 	
public** 
override** 
void** 
PostInitialize** +
(**+ ,
)**, -
{++ 	
if,, 
(,, 
!,, 

SkipDbSeed,, 
),, 
{-- 

SeedHelper.. 
... 

SeedHostDb.. %
(..% &

IocManager..& 0
)..0 1
;..1 2
}// 
}00 	
}11 
}22 �
mF:\Code\GitHub\docker\src\AnBook.EntityFrameworkCore\EntityFrameworkCore\Repositories\AnBookRepositoryBase.cs
	namespace 	
AnBook
 
. 
EntityFrameworkCore $
.$ %
Repositories% 1
{ 
public

abstract
class
AnBookRepositoryBase
<
TEntity
,
TPrimaryKey
>
:
EfCoreRepositoryBase
<
AnBookDbContext
,
TEntity
,
TPrimaryKey	
>

where 
TEntity 
: 
class 
, 
IEntity &
<& '
TPrimaryKey' 2
>2 3
{ 
	protected  
AnBookRepositoryBase &
(& '
IDbContextProvider' 9
<9 :
AnBookDbContext: I
>I J
dbContextProviderK \
)\ ]
: 
base 
( 
dbContextProvider $
)$ %
{ 	
} 	
} 
public 

abstract 
class  
AnBookRepositoryBase .
<. /
TEntity/ 6
>6 7
:8 9 
AnBookRepositoryBase: N
<N O
TEntityO V
,V W
intX [
>[ \
,\ ]
IRepository^ i
<i j
TEntityj q
>q r
where 
TEntity 
: 
class 
, 
IEntity &
<& '
int' *
>* +
{ 
	protected    
AnBookRepositoryBase   &
(  & '
IDbContextProvider  ' 9
<  9 :
AnBookDbContext  : I
>  I J
dbContextProvider  K \
)  \ ]
:!! 
base!! 
(!! 
dbContextProvider!! $
)!!$ %
{"" 	
}## 	
}&& 
}'' �
kF:\Code\GitHub\docker\src\AnBook.EntityFrameworkCore\EntityFrameworkCore\Seed\Host\DefaultEditionCreator.cs
	namespace 	
AnBook
 
. 
EntityFrameworkCore $
.$ %
Seed% )
.) *
Host* .
{ 
public		 

class		 !
DefaultEditionCreator		 &
{

 
private 
readonly 
AnBookDbContext (
_context) 1
;1 2
public
DefaultEditionCreator
(
AnBookDbContext
context
)
{ 	
_context 
= 
context 
; 
} 	
public 
void 
Create 
( 
) 
{ 	
CreateEditions 
( 
) 
; 
} 	
private 
void 
CreateEditions #
(# $
)$ %
{ 	
var 
defaultEdition 
=  
_context! )
.) *
Editions* 2
.2 3
IgnoreQueryFilters3 E
(E F
)F G
.G H
FirstOrDefaultH V
(V W
eW X
=>Y [
e\ ]
.] ^
Name^ b
==c e
EditionManagerf t
.t u
DefaultEditionName	u �
)
� �
;
� �
if 
( 
defaultEdition 
== !
null" &
)& '
{ 
defaultEdition 
=  
new! $
Edition% ,
{- .
Name/ 3
=4 5
EditionManager6 D
.D E
DefaultEditionNameE W
,W X
DisplayNameY d
=e f
EditionManagerg u
.u v
DefaultEditionName	v �
}
� �
;
� �
_context 
. 
Editions !
.! "
Add" %
(% &
defaultEdition& 4
)4 5
;5 6
_context 
. 
SaveChanges $
($ %
)% &
;& '
}!! 
}"" 	
private$$ 
void$$ $
CreateFeatureIfNotExists$$ -
($$- .
int$$. 1
	editionId$$2 ;
,$$; <
string$$= C
featureName$$D O
,$$O P
bool$$Q U
	isEnabled$$V _
)$$_ `
{%% 	
if&& 
(&& 
_context&& 
.&& "
EditionFeatureSettings&& /
.&&/ 0
IgnoreQueryFilters&&0 B
(&&B C
)&&C D
.&&D E
Any&&E H
(&&H I
ef&&I K
=>&&L N
ef&&O Q
.&&Q R
	EditionId&&R [
==&&\ ^
	editionId&&_ h
&&&&i k
ef&&l n
.&&n o
Name&&o s
==&&t v
featureName	&&w �
)
&&� �
)
&&� �
{'' 
return(( 
;(( 
})) 
_context++ 
.++ "
EditionFeatureSettings++ +
.+++ ,
Add++, /
(++/ 0
new++0 3!
EditionFeatureSetting++4 I
{,, 
Name-- 
=-- 
featureName-- "
,--" #
Value.. 
=.. 
	isEnabled.. !
...! "
ToString.." *
(..* +
)..+ ,
,.., -
	EditionId// 
=// 
	editionId// %
}00 
)00
;00 
_context11 
.11 
SaveChanges11  
(11  !
)11! "
;11" #
}22 	
}33 
}44 �+
mF:\Code\GitHub\docker\src\AnBook.EntityFrameworkCore\EntityFrameworkCore\Seed\Host\DefaultLanguagesCreator.cs
	namespace 	
AnBook
 
. 
EntityFrameworkCore $
.$ %
Seed% )
.) *
Host* .
{ 
public 

class #
DefaultLanguagesCreator (
{		 
public

 
static

 
List

 
<

 
ApplicationLanguage

 .
>

. /
InitialLanguages

0 @
=>

A C
GetInitialLanguages

D W
(

W X
)

X Y
;

Y Z
private 
readonly 
AnBookDbContext (
_context) 1
;1 2
private 
static 
List 
< 
ApplicationLanguage /
>/ 0
GetInitialLanguages1 D
(D E
)E F
{ 	
return 
new 
List 
< 
ApplicationLanguage /
>/ 0
{ 
new 
ApplicationLanguage '
(' (
null( ,
,, -
$str. 2
,2 3
$str4 =
,= >
$str? S
)S T
,T U
new 
ApplicationLanguage '
(' (
null( ,
,, -
$str. 2
,2 3
$str4 =
,= >
$str? S
)S T
,T U
new 
ApplicationLanguage '
(' (
null( ,
,, -
$str. 2
,2 3
$str4 <
,< =
$str> R
)R S
,S T
new 
ApplicationLanguage '
(' (
null( ,
,, -
$str. 2
,2 3
$str4 >
,> ?
$str@ T
)T U
,U V
new 
ApplicationLanguage '
(' (
null( ,
,, -
$str. 2
,2 3
$str4 >
,> ?
$str@ T
)T U
,U V
new 
ApplicationLanguage '
(' (
null( ,
,, -
$str. 5
,5 6
$str7 B
,B C
$strD X
)X Y
,Y Z
new 
ApplicationLanguage '
(' (
null( ,
,, -
$str. 2
,2 3
$str4 <
,< =
$str> R
)R S
,S T
new 
ApplicationLanguage '
(' (
null( ,
,, -
$str. 2
,2 3
$str4 =
,= >
$str? S
)S T
,T U
new 
ApplicationLanguage '
(' (
null( ,
,, -
$str. 7
,7 8
$str9 ?
,? @
$strA U
)U V
,V W
new 
ApplicationLanguage '
(' (
null( ,
,, -
$str. 5
,5 6
$str7 G
,G H
$strI ]
)] ^
,^ _
new 
ApplicationLanguage '
(' (
null( ,
,, -
$str. 2
,2 3
$str4 @
,@ A
$strB V
)V W
,W X
new 
ApplicationLanguage '
(' (
null( ,
,, -
$str. 2
,2 3
$str4 9
,9 :
$str; O
)O P
} 
;
} 	
public!! #
DefaultLanguagesCreator!! &
(!!& '
AnBookDbContext!!' 6
context!!7 >
)!!> ?
{"" 	
_context## 
=## 
context## 
;## 
}$$ 	
public&& 
void&& 
Create&& 
(&& 
)&& 
{'' 	
CreateLanguages(( 
((( 
)(( 
;(( 
})) 	
private++ 
void++ 
CreateLanguages++ $
(++$ %
)++% &
{,, 	
foreach-- 
(-- 
var-- 
language-- !
in--" $
InitialLanguages--% 5
)--5 6
{.. 
AddLanguageIfNotExists// &
(//& '
language//' /
)/// 0
;//0 1
}00 
}11 	
private33 
void33 "
AddLanguageIfNotExists33 +
(33+ ,
ApplicationLanguage33, ?
language33@ H
)33H I
{44 	
if55 
(55 
_context55 
.55 
	Languages55 "
.55" #
IgnoreQueryFilters55# 5
(555 6
)556 7
.557 8
Any558 ;
(55; <
l55< =
=>55> @
l55A B
.55B C
TenantId55C K
==55L N
language55O W
.55W X
TenantId55X `
&&55a c
l55d e
.55e f
Name55f j
==55k m
language55n v
.55v w
Name55w {
)55{ |
)55| }
{66 
return77 
;77 
}88 
_context:: 
.:: 
	Languages:: 
.:: 
Add:: "
(::" #
language::# +
)::+ ,
;::, -
_context;; 
.;; 
SaveChanges;;  
(;;  !
);;! "
;;;" #
}<< 	
}== 
}>> �
lF:\Code\GitHub\docker\src\AnBook.EntityFrameworkCore\EntityFrameworkCore\Seed\Host\DefaultSettingsCreator.cs
	namespace 	
AnBook
 
. 
EntityFrameworkCore $
.$ %
Seed% )
.) *
Host* .
{ 
public		 

class		 "
DefaultSettingsCreator		 '
{

 
private 
readonly 
AnBookDbContext (
_context) 1
;1 2
public
DefaultSettingsCreator
(
AnBookDbContext
context
)
{ 	
_context 
= 
context 
; 
} 	
public 
void 
Create 
( 
) 
{ 	!
AddSettingIfNotExists !
(! "
EmailSettingNames" 3
.3 4
DefaultFromAddress4 F
,F G
$strH \
)\ ]
;] ^!
AddSettingIfNotExists !
(! "
EmailSettingNames" 3
.3 4"
DefaultFromDisplayName4 J
,J K
$strL a
)a b
;b c!
AddSettingIfNotExists !
(! "$
LocalizationSettingNames" :
.: ;
DefaultLanguage; J
,J K
$strL P
)P Q
;Q R
} 	
private 
void !
AddSettingIfNotExists *
(* +
string+ 1
name2 6
,6 7
string8 >
value? D
,D E
intF I
?I J
tenantIdK S
=T U
nullV Z
)Z [
{ 	
if 
( 
_context 
. 
Settings !
.! "
IgnoreQueryFilters" 4
(4 5
)5 6
.6 7
Any7 :
(: ;
s; <
=>= ?
s@ A
.A B
NameB F
==G I
nameJ N
&&O Q
sR S
.S T
TenantIdT \
==] _
tenantId` h
&&i k
sl m
.m n
UserIdn t
==u w
nullx |
)| }
)} ~
{ 
return   
;   
}!! 
_context## 
.## 
Settings## 
.## 
Add## !
(##! "
new##" %
Setting##& -
(##- .
tenantId##. 6
,##6 7
null##8 <
,##< =
name##> B
,##B C
value##D I
)##I J
)##J K
;##K L
_context$$ 
.$$ 
SaveChanges$$  
($$  !
)$$! "
;$$" #
}%% 	
}&& 
}'' �@
lF:\Code\GitHub\docker\src\AnBook.EntityFrameworkCore\EntityFrameworkCore\Seed\Host\HostRoleAndUserCreator.cs
	namespace
AnBook
 
.
EntityFrameworkCore
.
Seed
.
Host
{ 
public 

class "
HostRoleAndUserCreator '
{ 
private 
readonly 
AnBookDbContext (
_context) 1
;1 2
public "
HostRoleAndUserCreator %
(% &
AnBookDbContext& 5
context6 =
)= >
{ 	
_context 
= 
context 
; 
} 	
public 
void 
Create 
( 
) 
{ 	"
CreateHostRoleAndUsers "
(" #
)# $
;$ %
} 	
private 
void "
CreateHostRoleAndUsers +
(+ ,
), -
{ 	
var!! 
adminRoleForHost!!  
=!!! "
_context!!# +
.!!+ ,
Roles!!, 1
.!!1 2
IgnoreQueryFilters!!2 D
(!!D E
)!!E F
.!!F G
FirstOrDefault!!G U
(!!U V
r!!V W
=>!!X Z
r!![ \
.!!\ ]
TenantId!!] e
==!!f h
null!!i m
&&!!n p
r!!q r
.!!r s
Name!!s w
==!!x z
StaticRoleNames	!!{ �
.
!!� �
Host
!!� �
.
!!� �
Admin
!!� �
)
!!� �
;
!!� �
if"" 
("" 
adminRoleForHost""  
==""! #
null""$ (
)""( )
{## 
adminRoleForHost$$  
=$$! "
_context$$# +
.$$+ ,
Roles$$, 1
.$$1 2
Add$$2 5
($$5 6
new$$6 9
Role$$: >
($$> ?
null$$? C
,$$C D
StaticRoleNames$$E T
.$$T U
Host$$U Y
.$$Y Z
Admin$$Z _
,$$_ `
StaticRoleNames$$a p
.$$p q
Host$$q u
.$$u v
Admin$$v {
)$${ |
{$$} ~
IsStatic	$$ �
=
$$� �
true
$$� �
,
$$� �
	IsDefault
$$� �
=
$$� �
true
$$� �
}
$$� �
)
$$� �
.
$$� �
Entity
$$� �
;
$$� �
_context%% 
.%% 
SaveChanges%% $
(%%$ %
)%%% &
;%%& '
}&& 
var** 
grantedPermissions** "
=**# $
_context**% -
.**- .
Permissions**. 9
.**9 :
IgnoreQueryFilters**: L
(**L M
)**M N
.++ 
OfType++ 
<++ !
RolePermissionSetting++ -
>++- .
(++. /
)++/ 0
.,, 
Where,, 
(,, 
p,, 
=>,, 
p,, 
.,, 
TenantId,, &
==,,' )
null,,* .
&&,,/ 1
p,,2 3
.,,3 4
RoleId,,4 :
==,,; =
adminRoleForHost,,> N
.,,N O
Id,,O Q
),,Q R
.-- 
Select-- 
(-- 
p-- 
=>-- 
p-- 
.-- 
Name-- #
)--# $
... 
ToList.. 
(.. 
).. 
;.. 
var00 
permissions00 
=00 
PermissionFinder00 .
.11 
GetAllPermissions11 "
(11" #
new11# &'
AnBookAuthorizationProvider11' B
(11B C
)11C D
)11D E
.22 
Where22 
(22 
p22 
=>22 
p22 
.22 
MultiTenancySides22 /
.22/ 0
HasFlag220 7
(227 8
MultiTenancySides228 I
.22I J
Host22J N
)22N O
&&22P R
!33 
grantedPermissions33 /
.33/ 0
Contains330 8
(338 9
p339 :
.33: ;
Name33; ?
)33? @
)33@ A
.44 
ToList44 
(44 
)44 
;44 
if66 
(66 
permissions66 
.66 
Any66 
(66  
)66  !
)66! "
{77 
_context88 
.88 
Permissions88 $
.88$ %
AddRange88% -
(88- .
permissions99 
.99  
Select99  &
(99& '

permission99' 1
=>992 4
new995 8!
RolePermissionSetting999 N
{:: 
TenantId;;  
=;;! "
null;;# '
,;;' (
Name<< 
=<< 

permission<< )
.<<) *
Name<<* .
,<<. /
	IsGranted== !
===" #
true==$ (
,==( )
RoleId>> 
=>>  
adminRoleForHost>>! 1
.>>1 2
Id>>2 4
}?? 
)?? 
)@@ 
;@@ 
_contextAA 
.AA 
SaveChangesAA $
(AA$ %
)AA% &
;AA& '
}BB 
varFF 
adminUserForHostFF  
=FF! "
_contextFF# +
.FF+ ,
UsersFF, 1
.FF1 2
IgnoreQueryFiltersFF2 D
(FFD E
)FFE F
.FFF G
FirstOrDefaultFFG U
(FFU V
uFFV W
=>FFX Z
uFF[ \
.FF\ ]
TenantIdFF] e
==FFf h
nullFFi m
&&FFn p
uFFq r
.FFr s
UserNameFFs {
==FF| ~
AbpUserBase	FF �
.
FF� �

FF� �
)
FF� �
;
FF� �
ifGG 
(GG 
adminUserForHostGG  
==GG! #
nullGG$ (
)GG( )
{HH 
varII 
userII 
=II 
newII 
UserII #
{JJ 
TenantIdKK 
=KK 
nullKK #
,KK# $
UserNameLL 
=LL 
AbpUserBaseLL *
.LL* +

,LL8 9
NameMM 
=MM 
$strMM "
,MM" #
SurnameNN 
=NN 
$strNN %
,NN% &
EmailAddressOO  
=OO! "
$strOO# @
,OO@ A
IsEmailConfirmedPP $
=PP% &
truePP' +
,PP+ ,
IsActiveQQ 
=QQ 
trueQQ #
}RR 
;RR 
userTT 
.TT 
PasswordTT 
=TT 
newTT  #
PasswordHasherTT$ 2
<TT2 3
UserTT3 7
>TT7 8
(TT8 9
newTT9 <
OptionsWrapperTT= K
<TTK L!
PasswordHasherOptionsTTL a
>TTa b
(TTb c
newTTc f!
PasswordHasherOptionsTTg |
(TT| }
)TT} ~
)TT~ 
)	TT �
.
TT� �
HashPassword
TT� �
(
TT� �
user
TT� �
,
TT� �
$str
TT� �
)
TT� �
;
TT� �
userUU 
.UU 
SetNormalizedNamesUU '
(UU' (
)UU( )
;UU) *
adminUserForHostWW  
=WW! "
_contextWW# +
.WW+ ,
UsersWW, 1
.WW1 2
AddWW2 5
(WW5 6
userWW6 :
)WW: ;
.WW; <
EntityWW< B
;WWB C
_contextXX 
.XX 
SaveChangesXX $
(XX$ %
)XX% &
;XX& '
_context[[ 
.[[ 
	UserRoles[[ "
.[[" #
Add[[# &
([[& '
new[[' *
UserRole[[+ 3
([[3 4
null[[4 8
,[[8 9
adminUserForHost[[: J
.[[J K
Id[[K M
,[[M N
adminRoleForHost[[O _
.[[_ `
Id[[` b
)[[b c
)[[c d
;[[d e
_context\\ 
.\\ 
SaveChanges\\ $
(\\$ %
)\\% &
;\\& '
_context^^ 
.^^ 
SaveChanges^^ $
(^^$ %
)^^% &
;^^& '
}__ 
}`` 	
}aa 
}bb �
jF:\Code\GitHub\docker\src\AnBook.EntityFrameworkCore\EntityFrameworkCore\Seed\Host\InitialHostDbBuilder.cs
	namespace 	
AnBook
 
. 
EntityFrameworkCore $
.$ %
Seed% )
.) *
Host* .
{ 
public 

class  
InitialHostDbBuilder %
{ 
private 
readonly 
AnBookDbContext (
_context) 1
;1 2
public  
InitialHostDbBuilder #
(# $
AnBookDbContext$ 3
context4 ;
); <
{ 	
_context		 
=		 
context		 
;		 
}

 	
public 
void 
Create 
( 
) 
{
new !
DefaultEditionCreator %
(% &
_context& .
). /
./ 0
Create0 6
(6 7
)7 8
;8 9
new #
DefaultLanguagesCreator '
(' (
_context( 0
)0 1
.1 2
Create2 8
(8 9
)9 :
;: ;
new "
HostRoleAndUserCreator &
(& '
_context' /
)/ 0
.0 1
Create1 7
(7 8
)8 9
;9 :
new "
DefaultSettingsCreator &
(& '
_context' /
)/ 0
.0 1
Create1 7
(7 8
)8 9
;9 :
_context 
. 
SaveChanges  
(  !
)! "
;" #
} 	
} 
} �
[F:\Code\GitHub\docker\src\AnBook.EntityFrameworkCore\EntityFrameworkCore\Seed\SeedHelper.cs
	namespace 	
AnBook
 
. 
EntityFrameworkCore $
.$ %
Seed% )
{ 
public

static
class

SeedHelper
{ 
public 
static 
void 

SeedHostDb %
(% &
IIocResolver& 2
iocResolver3 >
)> ?
{ 	

< 
AnBookDbContext )
>) *
(* +
iocResolver+ 6
,6 7

SeedHostDb8 B
)B C
;C D
} 	
public 
static 
void 

SeedHostDb %
(% &
AnBookDbContext& 5
context6 =
)= >
{ 	
context 
. #
SuppressAutoSetTenantId +
=, -
true. 2
;2 3
new  
InitialHostDbBuilder $
($ %
context% ,
), -
.- .
Create. 4
(4 5
)5 6
;6 7
new  
DefaultTenantBuilder $
($ %
context% ,
), -
.- .
Create. 4
(4 5
)5 6
;6 7
new $
TenantRoleAndUserBuilder (
(( )
context) 0
,0 1
$num2 3
)3 4
.4 5
Create5 ;
(; <
)< =
;= >
} 	
private   
static   
void   

<  ) *

TDbContext  * 4
>  4 5
(  5 6
IIocResolver  6 B
iocResolver  C N
,  N O
Action  P V
<  V W

TDbContext  W a
>  a b

)  p q
where!! 

TDbContext!! 
:!! 
	DbContext!! (
{"" 	
using## 
(## 
var## 

uowManager## !
=##" #
iocResolver##$ /
.##/ 0
ResolveAsDisposable##0 C
<##C D
IUnitOfWorkManager##D V
>##V W
(##W X
)##X Y
)##Y Z
{$$ 
using%% 
(%% 
var%% 
uow%% 
=%%  

uowManager%%! +
.%%+ ,
Object%%, 2
.%%2 3
Begin%%3 8
(%%8 9"
TransactionScopeOption%%9 O
.%%O P
Suppress%%P X
)%%X Y
)%%Y Z
{&& 
var'' 
context'' 
=''  !

uowManager''" ,
.'', -
Object''- 3
.''3 4
Current''4 ;
.''; <
GetDbContext''< H
<''H I

TDbContext''I S
>''S T
(''T U
MultiTenancySides''U f
.''f g
Host''g k
)''k l
;''l m

())! "
context))" )
)))) *
;))* +
uow++ 
.++ 
Complete++  
(++  !
)++! "
;++" #
},, 
}-- 
}.. 	
}// 
}00 �
mF:\Code\GitHub\docker\src\AnBook.EntityFrameworkCore\EntityFrameworkCore\Seed\Tenants\DefaultTenantBuilder.cs
	namespace 	
AnBook
 
. 
EntityFrameworkCore $
.$ %
Seed% )
.) *
Tenants* 1
{ 
public		 

class		  
DefaultTenantBuilder		 %
{

 
private 
readonly 
AnBookDbContext (
_context) 1
;1 2
public
DefaultTenantBuilder
(
AnBookDbContext
context
)
{ 	
_context 
= 
context 
; 
} 	
public 
void 
Create 
( 
) 
{ 	
CreateDefaultTenant 
(  
)  !
;! "
} 	
private 
void 
CreateDefaultTenant (
(( )
)) *
{ 	
var 

= 
_context  (
.( )
Tenants) 0
.0 1
IgnoreQueryFilters1 C
(C D
)D E
.E F
FirstOrDefaultF T
(T U
tU V
=>W Y
tZ [
.[ \
TenancyName\ g
==h j

.x y
DefaultTenantName	y �
)
� �
;
� �
if 
( 

==  
null! %
)% &
{ 

= 
new  #
Tenant$ *
(* +

.8 9
DefaultTenantName9 J
,J K

.Y Z
DefaultTenantNameZ k
)k l
;l m
var   
defaultEdition   "
=  # $
_context  % -
.  - .
Editions  . 6
.  6 7
IgnoreQueryFilters  7 I
(  I J
)  J K
.  K L
FirstOrDefault  L Z
(  Z [
e  [ \
=>  ] _
e  ` a
.  a b
Name  b f
==  g i
EditionManager  j x
.  x y
DefaultEditionName	  y �
)
  � �
;
  � �
if!! 
(!! 
defaultEdition!! "
!=!!# %
null!!& *
)!!* +
{"" 

.##! "
	EditionId##" +
=##, -
defaultEdition##. <
.##< =
Id##= ?
;##? @
}$$ 
_context&& 
.&& 
Tenants&&  
.&&  !
Add&&! $
(&&$ %

)&&2 3
;&&3 4
_context'' 
.'' 
SaveChanges'' $
(''$ %
)''% &
;''& '
}(( 
})) 	
}** 
}++ �=
qF:\Code\GitHub\docker\src\AnBook.EntityFrameworkCore\EntityFrameworkCore\Seed\Tenants\TenantRoleAndUserBuilder.cs
	namespace
AnBook
 
.
EntityFrameworkCore
.
Seed
.
Tenants
{ 
public 

class $
TenantRoleAndUserBuilder )
{ 
private 
readonly 
AnBookDbContext (
_context) 1
;1 2
private 
readonly 
int 
	_tenantId &
;& '
public $
TenantRoleAndUserBuilder '
(' (
AnBookDbContext( 7
context8 ?
,? @
intA D
tenantIdE M
)M N
{ 	
_context 
= 
context 
; 
	_tenantId 
= 
tenantId  
;  !
} 	
public 
void 
Create 
( 
) 
{ 	
CreateRolesAndUsers 
(  
)  !
;! "
} 	
private 
void 
CreateRolesAndUsers (
(( )
)) *
{   	
var## 
	adminRole## 
=## 
_context## $
.##$ %
Roles##% *
.##* +
IgnoreQueryFilters##+ =
(##= >
)##> ?
.##? @
FirstOrDefault##@ N
(##N O
r##O P
=>##Q S
r##T U
.##U V
TenantId##V ^
==##_ a
	_tenantId##b k
&&##l n
r##o p
.##p q
Name##q u
==##v x
StaticRoleNames	##y �
.
##� �
Tenants
##� �
.
##� �
Admin
##� �
)
##� �
;
##� �
if$$ 
($$ 
	adminRole$$ 
==$$ 
null$$ !
)$$! "
{%% 
	adminRole&& 
=&& 
_context&& $
.&&$ %
Roles&&% *
.&&* +
Add&&+ .
(&&. /
new&&/ 2
Role&&3 7
(&&7 8
	_tenantId&&8 A
,&&A B
StaticRoleNames&&C R
.&&R S
Tenants&&S Z
.&&Z [
Admin&&[ `
,&&` a
StaticRoleNames&&b q
.&&q r
Tenants&&r y
.&&y z
Admin&&z 
)	&& �
{
&&� �
IsStatic
&&� �
=
&&� �
true
&&� �
}
&&� �
)
&&� �
.
&&� �
Entity
&&� �
;
&&� �
_context'' 
.'' 
SaveChanges'' $
(''$ %
)''% &
;''& '
}(( 
var,, 
grantedPermissions,, "
=,,# $
_context,,% -
.,,- .
Permissions,,. 9
.,,9 :
IgnoreQueryFilters,,: L
(,,L M
),,M N
.-- 
OfType-- 
<-- !
RolePermissionSetting-- -
>--- .
(--. /
)--/ 0
... 
Where.. 
(.. 
p.. 
=>.. 
p.. 
... 
TenantId.. &
==..' )
	_tenantId..* 3
&&..4 6
p..7 8
...8 9
RoleId..9 ?
==..@ B
	adminRole..C L
...L M
Id..M O
)..O P
.// 
Select// 
(// 
p// 
=>// 
p// 
.// 
Name// #
)//# $
.00 
ToList00 
(00 
)00 
;00 
var22 
permissions22 
=22 
PermissionFinder22 .
.33 
GetAllPermissions33 "
(33" #
new33# &'
AnBookAuthorizationProvider33' B
(33B C
)33C D
)33D E
.44 
Where44 
(44 
p44 
=>44 
p44 
.44 
MultiTenancySides44 /
.44/ 0
HasFlag440 7
(447 8
MultiTenancySides448 I
.44I J
Tenant44J P
)44P Q
&&44R T
!55 
grantedPermissions55 /
.55/ 0
Contains550 8
(558 9
p559 :
.55: ;
Name55; ?
)55? @
)55@ A
.66 
ToList66 
(66 
)66 
;66 
if88 
(88 
permissions88 
.88 
Any88 
(88  
)88  !
)88! "
{99 
_context:: 
.:: 
Permissions:: $
.::$ %
AddRange::% -
(::- .
permissions;; 
.;;  
Select;;  &
(;;& '

permission;;' 1
=>;;2 4
new;;5 8!
RolePermissionSetting;;9 N
{<< 
TenantId==  
===! "
	_tenantId==# ,
,==, -
Name>> 
=>> 

permission>> )
.>>) *
Name>>* .
,>>. /
	IsGranted?? !
=??" #
true??$ (
,??( )
RoleId@@ 
=@@  
	adminRole@@! *
.@@* +
Id@@+ -
}AA 
)AA 
)BB 
;BB 
_contextCC 
.CC 
SaveChangesCC $
(CC$ %
)CC% &
;CC& '
}DD 
varHH 
	adminUserHH 
=HH 
_contextHH $
.HH$ %
UsersHH% *
.HH* +
IgnoreQueryFiltersHH+ =
(HH= >
)HH> ?
.HH? @
FirstOrDefaultHH@ N
(HHN O
uHHO P
=>HHQ S
uHHT U
.HHU V
TenantIdHHV ^
==HH_ a
	_tenantIdHHb k
&&HHl n
uHHo p
.HHp q
UserNameHHq y
==HHz |
AbpUserBase	HH} �
.
HH� �

HH� �
)
HH� �
;
HH� �
ifII 
(II 
	adminUserII 
==II 
nullII !
)II! "
{JJ 
	adminUserKK 
=KK 
UserKK  
.KK  !!
CreateTenantAdminUserKK! 6
(KK6 7
	_tenantIdKK7 @
,KK@ A
$strKKB [
)KK[ \
;KK\ ]
	adminUserLL 
.LL 
PasswordLL "
=LL# $
newLL% (
PasswordHasherLL) 7
<LL7 8
UserLL8 <
>LL< =
(LL= >
newLL> A
OptionsWrapperLLB P
<LLP Q!
PasswordHasherOptionsLLQ f
>LLf g
(LLg h
newLLh k"
PasswordHasherOptions	LLl �
(
LL� �
)
LL� �
)
LL� �
)
LL� �
.
LL� �
HashPassword
LL� �
(
LL� �
	adminUser
LL� �
,
LL� �
$str
LL� �
)
LL� �
;
LL� �
	adminUserMM 
.MM 
IsEmailConfirmedMM *
=MM+ ,
trueMM- 1
;MM1 2
	adminUserNN 
.NN 
IsActiveNN "
=NN# $
trueNN% )
;NN) *
_contextPP 
.PP 
UsersPP 
.PP 
AddPP "
(PP" #
	adminUserPP# ,
)PP, -
;PP- .
_contextQQ 
.QQ 
SaveChangesQQ $
(QQ$ %
)QQ% &
;QQ& '
_contextTT 
.TT 
	UserRolesTT "
.TT" #
AddTT# &
(TT& '
newTT' *
UserRoleTT+ 3
(TT3 4
	_tenantIdTT4 =
,TT= >
	adminUserTT? H
.TTH I
IdTTI K
,TTK L
	adminRoleTTM V
.TTV W
IdTTW Y
)TTY Z
)TTZ [
;TT[ \
_contextUU 
.UU 
SaveChangesUU $
(UU$ %
)UU% &
;UU& '
}VV 
}WW 	
}XX 
}YY �
dF:\Code\GitHub\docker\src\AnBook.EntityFrameworkCore\Migrations\20170424115119_Initial_Migrations.cs
	namespace 	
AnBook
 
. 

Migrations 
{ 
public 

partial 
class 
Initial_Migrations +
:, -
	Migration. 7
{ 
	protected		 
override		 
void		 
Up		  "
(		" #
MigrationBuilder		# 3
migrationBuilder		4 D
)		D E
{

 	
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str #
,# $
columns
:
table
=>
new
{ 
Id 
= 
table 
. 
Column %
<% &
int& )
>) *
(* +
nullable+ 3
:3 4
false5 :
): ;
. 

Annotation #
(# $
$str$ G
,G H,
 SqlServerValueGenerationStrategyI i
.i j
IdentityColumnj x
)x y
,y z
CreationTime  
=! "
table# (
.( )
Column) /
</ 0
DateTime0 8
>8 9
(9 :
nullable: B
:B C
falseD I
)I J
,J K

=" #
table$ )
.) *
Column* 0
<0 1
long1 5
>5 6
(6 7
nullable7 ?
:? @
trueA E
)E F
,F G

=" #
table$ )
.) *
Column* 0
<0 1
long1 5
>5 6
(6 7
nullable7 ?
:? @
trueA E
)E F
,F G
DeletionTime  
=! "
table# (
.( )
Column) /
</ 0
DateTime0 8
>8 9
(9 :
nullable: B
:B C
trueD H
)H I
,I J
DisplayName 
=  !
table" '
.' (
Column( .
<. /
string/ 5
>5 6
(6 7
	maxLength7 @
:@ A
$numB D
,D E
nullableF N
:N O
falseP U
)U V
,V W
	IsDeleted 
= 
table  %
.% &
Column& ,
<, -
bool- 1
>1 2
(2 3
nullable3 ;
:; <
false= B
)B C
,C D 
LastModificationTime (
=) *
table+ 0
.0 1
Column1 7
<7 8
DateTime8 @
>@ A
(A B
nullableB J
:J K
trueL P
)P Q
,Q R
LastModifierUserId &
=' (
table) .
.. /
Column/ 5
<5 6
long6 :
>: ;
(; <
nullable< D
:D E
trueF J
)J K
,K L
Name 
= 
table  
.  !
Column! '
<' (
string( .
>. /
(/ 0
	maxLength0 9
:9 :
$num; =
,= >
nullable? G
:G H
falseI N
)N O
} 
, 
constraints 
: 
table "
=># %
{ 
table 
. 

PrimaryKey $
($ %
$str% 5
,5 6
x7 8
=>9 ;
x< =
.= >
Id> @
)@ A
;A B
} 
) 
; 
migrationBuilder   
.   
CreateTable   (
(  ( )
name!! 
:!! 
$str!! $
,!!$ %
columns"" 
:"" 
table"" 
=>"" !
new""" %
{## 
Id$$ 
=$$ 
table$$ 
.$$ 
Column$$ %
<$$% &
long$$& *
>$$* +
($$+ ,
nullable$$, 4
:$$4 5
false$$6 ;
)$$; <
.%% 

Annotation%% #
(%%# $
$str%%$ G
,%%G H,
 SqlServerValueGenerationStrategy%%I i
.%%i j
IdentityColumn%%j x
)%%x y
,%%y z
BrowserInfo&& 
=&&  !
table&&" '
.&&' (
Column&&( .
<&&. /
string&&/ 5
>&&5 6
(&&6 7
	maxLength&&7 @
:&&@ A
$num&&B E
,&&E F
nullable&&G O
:&&O P
true&&Q U
)&&U V
,&&V W
ClientIpAddress'' #
=''$ %
table''& +
.''+ ,
Column'', 2
<''2 3
string''3 9
>''9 :
('': ;
	maxLength''; D
:''D E
$num''F H
,''H I
nullable''J R
:''R S
true''T X
)''X Y
,''Y Z

ClientName(( 
=((  
table((! &
.((& '
Column((' -
<((- .
string((. 4
>((4 5
(((5 6
	maxLength((6 ?
:((? @
$num((A D
,((D E
nullable((F N
:((N O
true((P T
)((T U
,((U V

CustomData)) 
=))  
table))! &
.))& '
Column))' -
<))- .
string)). 4
>))4 5
())5 6
	maxLength))6 ?
:))? @
$num))A E
,))E F
nullable))G O
:))O P
true))Q U
)))U V
,))V W
	Exception** 
=** 
table**  %
.**% &
Column**& ,
<**, -
string**- 3
>**3 4
(**4 5
	maxLength**5 >
:**> ?
$num**@ D
,**D E
nullable**F N
:**N O
true**P T
)**T U
,**U V
ExecutionDuration++ %
=++& '
table++( -
.++- .
Column++. 4
<++4 5
int++5 8
>++8 9
(++9 :
nullable++: B
:++B C
false++D I
)++I J
,++J K

=,," #
table,,$ )
.,,) *
Column,,* 0
<,,0 1
DateTime,,1 9
>,,9 :
(,,: ;
nullable,,; C
:,,C D
false,,E J
),,J K
,,,K L 
ImpersonatorTenantId-- (
=--) *
table--+ 0
.--0 1
Column--1 7
<--7 8
int--8 ;
>--; <
(--< =
nullable--= E
:--E F
true--G K
)--K L
,--L M
ImpersonatorUserId.. &
=..' (
table..) .
.... /
Column../ 5
<..5 6
long..6 :
>..: ;
(..; <
nullable..< D
:..D E
true..F J
)..J K
,..K L

MethodName// 
=//  
table//! &
.//& '
Column//' -
<//- .
string//. 4
>//4 5
(//5 6
	maxLength//6 ?
://? @
$num//A D
,//D E
nullable//F N
://N O
true//P T
)//T U
,//U V

Parameters00 
=00  
table00! &
.00& '
Column00' -
<00- .
string00. 4
>004 5
(005 6
	maxLength006 ?
:00? @
$num00A E
,00E F
nullable00G O
:00O P
true00Q U
)00U V
,00V W
ServiceName11 
=11  !
table11" '
.11' (
Column11( .
<11. /
string11/ 5
>115 6
(116 7
	maxLength117 @
:11@ A
$num11B E
,11E F
nullable11G O
:11O P
true11Q U
)11U V
,11V W
TenantId22 
=22 
table22 $
.22$ %
Column22% +
<22+ ,
int22, /
>22/ 0
(220 1
nullable221 9
:229 :
true22; ?
)22? @
,22@ A
UserId33 
=33 
table33 "
.33" #
Column33# )
<33) *
long33* .
>33. /
(33/ 0
nullable330 8
:338 9
true33: >
)33> ?
}44 
,44 
constraints55 
:55 
table55 "
=>55# %
{66 
table77 
.77 

PrimaryKey77 $
(77$ %
$str77% 6
,776 7
x778 9
=>77: <
x77= >
.77> ?
Id77? A
)77A B
;77B C
}88 
)88 
;88 
migrationBuilder:: 
.:: 
CreateTable:: (
(::( )
name;; 
:;; 
$str;; '
,;;' (
columns<< 
:<< 
table<< 
=><< !
new<<" %
{== 
Id>> 
=>> 
table>> 
.>> 
Column>> %
<>>% &
long>>& *
>>>* +
(>>+ ,
nullable>>, 4
:>>4 5
false>>6 ;
)>>; <
.?? 

Annotation?? #
(??# $
$str??$ G
,??G H,
 SqlServerValueGenerationStrategy??I i
.??i j
IdentityColumn??j x
)??x y
,??y z
CreationTime@@  
=@@! "
table@@# (
.@@( )
Column@@) /
<@@/ 0
DateTime@@0 8
>@@8 9
(@@9 :
nullable@@: B
:@@B C
false@@D I
)@@I J
,@@J K

=AA" #
tableAA$ )
.AA) *
ColumnAA* 0
<AA0 1
longAA1 5
>AA5 6
(AA6 7
nullableAA7 ?
:AA? @
trueAAA E
)AAE F
,AAF G

=BB" #
tableBB$ )
.BB) *
ColumnBB* 0
<BB0 1
longBB1 5
>BB5 6
(BB6 7
nullableBB7 ?
:BB? @
trueBBA E
)BBE F
,BBF G
DeletionTimeCC  
=CC! "
tableCC# (
.CC( )
ColumnCC) /
<CC/ 0
DateTimeCC0 8
>CC8 9
(CC9 :
nullableCC: B
:CCB C
trueCCD H
)CCH I
,CCI J
EmailAddressDD  
=DD! "
tableDD# (
.DD( )
ColumnDD) /
<DD/ 0
stringDD0 6
>DD6 7
(DD7 8
nullableDD8 @
:DD@ A
trueDDB F
)DDF G
,DDG H
	IsDeletedEE 
=EE 
tableEE  %
.EE% &
ColumnEE& ,
<EE, -
boolEE- 1
>EE1 2
(EE2 3
nullableEE3 ;
:EE; <
falseEE= B
)EEB C
,EEC D

=FF" #
tableFF$ )
.FF) *
ColumnFF* 0
<FF0 1
DateTimeFF1 9
>FF9 :
(FF: ;
nullableFF; C
:FFC D
trueFFE I
)FFI J
,FFJ K 
LastModificationTimeGG (
=GG) *
tableGG+ 0
.GG0 1
ColumnGG1 7
<GG7 8
DateTimeGG8 @
>GG@ A
(GGA B
nullableGGB J
:GGJ K
trueGGL P
)GGP Q
,GGQ R
LastModifierUserIdHH &
=HH' (
tableHH) .
.HH. /
ColumnHH/ 5
<HH5 6
longHH6 :
>HH: ;
(HH; <
nullableHH< D
:HHD E
trueHHF J
)HHJ K
,HHK L
TenantIdII 
=II 
tableII $
.II$ %
ColumnII% +
<II+ ,
intII, /
>II/ 0
(II0 1
nullableII1 9
:II9 :
trueII; ?
)II? @
,II@ A
UserIdJJ 
=JJ 
tableJJ "
.JJ" #
ColumnJJ# )
<JJ) *
longJJ* .
>JJ. /
(JJ/ 0
nullableJJ0 8
:JJ8 9
falseJJ: ?
)JJ? @
,JJ@ A

UserLinkIdKK 
=KK  
tableKK! &
.KK& '
ColumnKK' -
<KK- .
longKK. 2
>KK2 3
(KK3 4
nullableKK4 <
:KK< =
trueKK> B
)KKB C
,KKC D
UserNameLL 
=LL 
tableLL $
.LL$ %
ColumnLL% +
<LL+ ,
stringLL, 2
>LL2 3
(LL3 4
nullableLL4 <
:LL< =
trueLL> B
)LLB C
}MM 
,MM 
constraintsNN 
:NN 
tableNN "
=>NN# %
{OO 
tablePP 
.PP 

PrimaryKeyPP $
(PP$ %
$strPP% 9
,PP9 :
xPP; <
=>PP= ?
xPP@ A
.PPA B
IdPPB D
)PPD E
;PPE F
}QQ 
)QQ 
;QQ 
migrationBuilderSS 
.SS 
CreateTableSS (
(SS( )
nameTT 
:TT 
$strTT ,
,TT, -
columnsUU 
:UU 
tableUU 
=>UU !
newUU" %
{VV 
IdWW 
=WW 
tableWW 
.WW 
ColumnWW %
<WW% &
longWW& *
>WW* +
(WW+ ,
nullableWW, 4
:WW4 5
falseWW6 ;
)WW; <
.XX 

AnnotationXX #
(XX# $
$strXX$ G
,XXG H,
 SqlServerValueGenerationStrategyXXI i
.XXi j
IdentityColumnXXj x
)XXx y
,XXy z
BrowserInfoYY 
=YY  !
tableYY" '
.YY' (
ColumnYY( .
<YY. /
stringYY/ 5
>YY5 6
(YY6 7
	maxLengthYY7 @
:YY@ A
$numYYB E
,YYE F
nullableYYG O
:YYO P
trueYYQ U
)YYU V
,YYV W
ClientIpAddressZZ #
=ZZ$ %
tableZZ& +
.ZZ+ ,
ColumnZZ, 2
<ZZ2 3
stringZZ3 9
>ZZ9 :
(ZZ: ;
	maxLengthZZ; D
:ZZD E
$numZZF H
,ZZH I
nullableZZJ R
:ZZR S
trueZZT X
)ZZX Y
,ZZY Z

ClientName[[ 
=[[  
table[[! &
.[[& '
Column[[' -
<[[- .
string[[. 4
>[[4 5
([[5 6
	maxLength[[6 ?
:[[? @
$num[[A D
,[[D E
nullable[[F N
:[[N O
true[[P T
)[[T U
,[[U V
CreationTime\\  
=\\! "
table\\# (
.\\( )
Column\\) /
<\\/ 0
DateTime\\0 8
>\\8 9
(\\9 :
nullable\\: B
:\\B C
false\\D I
)\\I J
,\\J K
Result]] 
=]] 
table]] "
.]]" #
Column]]# )
<]]) *
byte]]* .
>]]. /
(]]/ 0
nullable]]0 8
:]]8 9
false]]: ?
)]]? @
,]]@ A
TenancyName^^ 
=^^  !
table^^" '
.^^' (
Column^^( .
<^^. /
string^^/ 5
>^^5 6
(^^6 7
	maxLength^^7 @
:^^@ A
$num^^B D
,^^D E
nullable^^F N
:^^N O
true^^P T
)^^T U
,^^U V
TenantId__ 
=__ 
table__ $
.__$ %
Column__% +
<__+ ,
int__, /
>__/ 0
(__0 1
nullable__1 9
:__9 :
true__; ?
)__? @
,__@ A
UserId`` 
=`` 
table`` "
.``" #
Column``# )
<``) *
long``* .
>``. /
(``/ 0
nullable``0 8
:``8 9
true``: >
)``> ?
,``? @"
UserNameOrEmailAddressaa *
=aa+ ,
tableaa- 2
.aa2 3
Columnaa3 9
<aa9 :
stringaa: @
>aa@ A
(aaA B
	maxLengthaaB K
:aaK L
$numaaM P
,aaP Q
nullableaaR Z
:aaZ [
trueaa\ `
)aa` a
}bb 
,bb 
constraintscc 
:cc 
tablecc "
=>cc# %
{dd 
tableee 
.ee 

PrimaryKeyee $
(ee$ %
$stree% >
,ee> ?
xee@ A
=>eeB D
xeeE F
.eeF G
IdeeG I
)eeI J
;eeJ K
}ff 
)ff 
;ff 
migrationBuilderhh 
.hh 
CreateTablehh (
(hh( )
nameii 
:ii 
$strii 0
,ii0 1
columnsjj 
:jj 
tablejj 
=>jj !
newjj" %
{kk 
Idll 
=ll 
tablell 
.ll 
Columnll %
<ll% &
longll& *
>ll* +
(ll+ ,
nullablell, 4
:ll4 5
falsell6 ;
)ll; <
.mm 

Annotationmm #
(mm# $
$strmm$ G
,mmG H,
 SqlServerValueGenerationStrategymmI i
.mmi j
IdentityColumnmmj x
)mmx y
,mmy z
CreationTimenn  
=nn! "
tablenn# (
.nn( )
Columnnn) /
<nn/ 0
DateTimenn0 8
>nn8 9
(nn9 :
nullablenn: B
:nnB C
falsennD I
)nnI J
,nnJ K

=oo" #
tableoo$ )
.oo) *
Columnoo* 0
<oo0 1
longoo1 5
>oo5 6
(oo6 7
nullableoo7 ?
:oo? @
trueooA E
)ooE F
,ooF G
OrganizationUnitIdpp &
=pp' (
tablepp) .
.pp. /
Columnpp/ 5
<pp5 6
longpp6 :
>pp: ;
(pp; <
nullablepp< D
:ppD E
falseppF K
)ppK L
,ppL M
TenantIdqq 
=qq 
tableqq $
.qq$ %
Columnqq% +
<qq+ ,
intqq, /
>qq/ 0
(qq0 1
nullableqq1 9
:qq9 :
trueqq; ?
)qq? @
,qq@ A
UserIdrr 
=rr 
tablerr "
.rr" #
Columnrr# )
<rr) *
longrr* .
>rr. /
(rr/ 0
nullablerr0 8
:rr8 9
falserr: ?
)rr? @
}ss 
,ss 
constraintstt 
:tt 
tablett "
=>tt# %
{uu 
tablevv 
.vv 

PrimaryKeyvv $
(vv$ %
$strvv% B
,vvB C
xvvD E
=>vvF H
xvvI J
.vvJ K
IdvvK M
)vvM N
;vvN O
}ww 
)ww 
;ww 
migrationBuilderyy 
.yy 
CreateTableyy (
(yy( )
namezz 
:zz 
$strzz )
,zz) *
columns{{ 
:{{ 
table{{ 
=>{{ !
new{{" %
{|| 
Id}} 
=}} 
table}} 
.}} 
Column}} %
<}}% &
long}}& *
>}}* +
(}}+ ,
nullable}}, 4
:}}4 5
false}}6 ;
)}}; <
.~~ 

Annotation~~ #
(~~# $
$str~~$ G
,~~G H,
 SqlServerValueGenerationStrategy~~I i
.~~i j
IdentityColumn~~j x
)~~x y
,~~y z
CreationTime  
=! "
table# (
.( )
Column) /
</ 0
DateTime0 8
>8 9
(9 :
nullable: B
:B C
falseD I
)I J
,J K

�� !
=
��" #
table
��$ )
.
��) *
Column
��* 0
<
��0 1
long
��1 5
>
��5 6
(
��6 7
nullable
��7 ?
:
��? @
true
��A E
)
��E F
,
��F G
IsAbandoned
�� 
=
��  !
table
��" '
.
��' (
Column
��( .
<
��. /
bool
��/ 3
>
��3 4
(
��4 5
nullable
��5 =
:
��= >
false
��? D
)
��D E
,
��E F
JobArgs
�� 
=
�� 
table
�� #
.
��# $
Column
��$ *
<
��* +
string
��+ 1
>
��1 2
(
��2 3
	maxLength
��3 <
:
��< =
$num
��> E
,
��E F
nullable
��G O
:
��O P
false
��Q V
)
��V W
,
��W X
JobType
�� 
=
�� 
table
�� #
.
��# $
Column
��$ *
<
��* +
string
��+ 1
>
��1 2
(
��2 3
	maxLength
��3 <
:
��< =
$num
��> A
,
��A B
nullable
��C K
:
��K L
false
��M R
)
��R S
,
��S T
LastTryTime
�� 
=
��  !
table
��" '
.
��' (
Column
��( .
<
��. /
DateTime
��/ 7
>
��7 8
(
��8 9
nullable
��9 A
:
��A B
true
��C G
)
��G H
,
��H I
NextTryTime
�� 
=
��  !
table
��" '
.
��' (
Column
��( .
<
��. /
DateTime
��/ 7
>
��7 8
(
��8 9
nullable
��9 A
:
��A B
false
��C H
)
��H I
,
��I J
Priority
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
byte
��, 0
>
��0 1
(
��1 2
nullable
��2 :
:
��: ;
false
��< A
)
��A B
,
��B C
TryCount
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
short
��, 1
>
��1 2
(
��2 3
nullable
��3 ;
:
��; <
false
��= B
)
��B C
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% ;
,
��; <
x
��= >
=>
��? A
x
��B C
.
��C D
Id
��D F
)
��F G
;
��G H
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� $
,
��$ %
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
Id
�� 
=
�� 
table
�� 
.
�� 
Column
�� %
<
��% &
int
��& )
>
��) *
(
��* +
nullable
��+ 3
:
��3 4
false
��5 :
)
��: ;
.
�� 

Annotation
�� #
(
��# $
$str
��$ G
,
��G H.
 SqlServerValueGenerationStrategy
��I i
.
��i j
IdentityColumn
��j x
)
��x y
,
��y z
CreationTime
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
DateTime
��0 8
>
��8 9
(
��9 :
nullable
��: B
:
��B C
false
��D I
)
��I J
,
��J K

�� !
=
��" #
table
��$ )
.
��) *
Column
��* 0
<
��0 1
long
��1 5
>
��5 6
(
��6 7
nullable
��7 ?
:
��? @
true
��A E
)
��E F
,
��F G

�� !
=
��" #
table
��$ )
.
��) *
Column
��* 0
<
��0 1
long
��1 5
>
��5 6
(
��6 7
nullable
��7 ?
:
��? @
true
��A E
)
��E F
,
��F G
DeletionTime
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
DateTime
��0 8
>
��8 9
(
��9 :
nullable
��: B
:
��B C
true
��D H
)
��H I
,
��I J
DisplayName
�� 
=
��  !
table
��" '
.
��' (
Column
��( .
<
��. /
string
��/ 5
>
��5 6
(
��6 7
	maxLength
��7 @
:
��@ A
$num
��B D
,
��D E
nullable
��F N
:
��N O
false
��P U
)
��U V
,
��V W
Icon
�� 
=
�� 
table
��  
.
��  !
Column
��! '
<
��' (
string
��( .
>
��. /
(
��/ 0
	maxLength
��0 9
:
��9 :
$num
��; >
,
��> ?
nullable
��@ H
:
��H I
true
��J N
)
��N O
,
��O P
	IsDeleted
�� 
=
�� 
table
��  %
.
��% &
Column
��& ,
<
��, -
bool
��- 1
>
��1 2
(
��2 3
nullable
��3 ;
:
��; <
false
��= B
)
��B C
,
��C D"
LastModificationTime
�� (
=
��) *
table
��+ 0
.
��0 1
Column
��1 7
<
��7 8
DateTime
��8 @
>
��@ A
(
��A B
nullable
��B J
:
��J K
true
��L P
)
��P Q
,
��Q R 
LastModifierUserId
�� &
=
��' (
table
��) .
.
��. /
Column
��/ 5
<
��5 6
long
��6 :
>
��: ;
(
��; <
nullable
��< D
:
��D E
true
��F J
)
��J K
,
��K L
Name
�� 
=
�� 
table
��  
.
��  !
Column
��! '
<
��' (
string
��( .
>
��. /
(
��/ 0
	maxLength
��0 9
:
��9 :
$num
��; =
,
��= >
nullable
��? G
:
��G H
false
��I N
)
��N O
,
��O P
TenantId
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
int
��, /
>
��/ 0
(
��0 1
nullable
��1 9
:
��9 :
true
��; ?
)
��? @
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% 6
,
��6 7
x
��8 9
=>
��: <
x
��= >
.
��> ?
Id
��? A
)
��A B
;
��B C
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� (
,
��( )
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
Id
�� 
=
�� 
table
�� 
.
�� 
Column
�� %
<
��% &
long
��& *
>
��* +
(
��+ ,
nullable
��, 4
:
��4 5
false
��6 ;
)
��; <
.
�� 

Annotation
�� #
(
��# $
$str
��$ G
,
��G H.
 SqlServerValueGenerationStrategy
��I i
.
��i j
IdentityColumn
��j x
)
��x y
,
��y z
CreationTime
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
DateTime
��0 8
>
��8 9
(
��9 :
nullable
��: B
:
��B C
false
��D I
)
��I J
,
��J K

�� !
=
��" #
table
��$ )
.
��) *
Column
��* 0
<
��0 1
long
��1 5
>
��5 6
(
��6 7
nullable
��7 ?
:
��? @
true
��A E
)
��E F
,
��F G
Key
�� 
=
�� 
table
�� 
.
��  
Column
��  &
<
��& '
string
��' -
>
��- .
(
��. /
	maxLength
��/ 8
:
��8 9
$num
��: =
,
��= >
nullable
��? G
:
��G H
false
��I N
)
��N O
,
��O P
LanguageName
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
string
��0 6
>
��6 7
(
��7 8
	maxLength
��8 A
:
��A B
$num
��C E
,
��E F
nullable
��G O
:
��O P
false
��Q V
)
��V W
,
��W X"
LastModificationTime
�� (
=
��) *
table
��+ 0
.
��0 1
Column
��1 7
<
��7 8
DateTime
��8 @
>
��@ A
(
��A B
nullable
��B J
:
��J K
true
��L P
)
��P Q
,
��Q R 
LastModifierUserId
�� &
=
��' (
table
��) .
.
��. /
Column
��/ 5
<
��5 6
long
��6 :
>
��: ;
(
��; <
nullable
��< D
:
��D E
true
��F J
)
��J K
,
��K L
Source
�� 
=
�� 
table
�� "
.
��" #
Column
��# )
<
��) *
string
��* 0
>
��0 1
(
��1 2
	maxLength
��2 ;
:
��; <
$num
��= @
,
��@ A
nullable
��B J
:
��J K
false
��L Q
)
��Q R
,
��R S
TenantId
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
int
��, /
>
��/ 0
(
��0 1
nullable
��1 9
:
��9 :
true
��; ?
)
��? @
,
��@ A
Value
�� 
=
�� 
table
�� !
.
��! "
Column
��" (
<
��( )
string
��) /
>
��/ 0
(
��0 1
	maxLength
��1 :
:
��: ;
$num
��< D
,
��D E
nullable
��F N
:
��N O
false
��P U
)
��U V
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% :
,
��: ;
x
��< =
=>
��> @
x
��A B
.
��B C
Id
��C E
)
��E F
;
��F G
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� (
,
��( )
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
Id
�� 
=
�� 
table
�� 
.
�� 
Column
�� %
<
��% &
Guid
��& *
>
��* +
(
��+ ,
nullable
��, 4
:
��4 5
false
��6 ;
)
��; <
,
��< =
CreationTime
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
DateTime
��0 8
>
��8 9
(
��9 :
nullable
��: B
:
��B C
false
��D I
)
��I J
,
��J K

�� !
=
��" #
table
��$ )
.
��) *
Column
��* 0
<
��0 1
long
��1 5
>
��5 6
(
��6 7
nullable
��7 ?
:
��? @
true
��A E
)
��E F
,
��F G
Data
�� 
=
�� 
table
��  
.
��  !
Column
��! '
<
��' (
string
��( .
>
��. /
(
��/ 0
	maxLength
��0 9
:
��9 :
$num
��; B
,
��B C
nullable
��D L
:
��L M
true
��N R
)
��R S
,
��S T
DataTypeName
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
string
��0 6
>
��6 7
(
��7 8
	maxLength
��8 A
:
��A B
$num
��C F
,
��F G
nullable
��H P
:
��P Q
true
��R V
)
��V W
,
��W X
EntityId
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
string
��, 2
>
��2 3
(
��3 4
	maxLength
��4 =
:
��= >
$num
��? A
,
��A B
nullable
��C K
:
��K L
true
��M Q
)
��Q R
,
��R S-
EntityTypeAssemblyQualifiedName
�� 3
=
��4 5
table
��6 ;
.
��; <
Column
��< B
<
��B C
string
��C I
>
��I J
(
��J K
	maxLength
��K T
:
��T U
$num
��V Y
,
��Y Z
nullable
��[ c
:
��c d
true
��e i
)
��i j
,
��j k
EntityTypeName
�� "
=
��# $
table
��% *
.
��* +
Column
��+ 1
<
��1 2
string
��2 8
>
��8 9
(
��9 :
	maxLength
��: C
:
��C D
$num
��E H
,
��H I
nullable
��J R
:
��R S
true
��T X
)
��X Y
,
��Y Z
ExcludedUserIds
�� #
=
��$ %
table
��& +
.
��+ ,
Column
��, 2
<
��2 3
string
��3 9
>
��9 :
(
��: ;
	maxLength
��; D
:
��D E
$num
��F L
,
��L M
nullable
��N V
:
��V W
true
��X \
)
��\ ]
,
��] ^
NotificationName
�� $
=
��% &
table
��' ,
.
��, -
Column
��- 3
<
��3 4
string
��4 :
>
��: ;
(
��; <
	maxLength
��< E
:
��E F
$num
��G I
,
��I J
nullable
��K S
:
��S T
false
��U Z
)
��Z [
,
��[ \
Severity
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
byte
��, 0
>
��0 1
(
��1 2
nullable
��2 :
:
��: ;
false
��< A
)
��A B
,
��B C
	TenantIds
�� 
=
�� 
table
��  %
.
��% &
Column
��& ,
<
��, -
string
��- 3
>
��3 4
(
��4 5
	maxLength
��5 >
:
��> ?
$num
��@ F
,
��F G
nullable
��H P
:
��P Q
true
��R V
)
��V W
,
��W X
UserIds
�� 
=
�� 
table
�� #
.
��# $
Column
��$ *
<
��* +
string
��+ 1
>
��1 2
(
��2 3
	maxLength
��3 <
:
��< =
$num
��> D
,
��D E
nullable
��F N
:
��N O
true
��P T
)
��T U
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% :
,
��: ;
x
��< =
=>
��> @
x
��A B
.
��B C
Id
��C E
)
��E F
;
��F G
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� 4
,
��4 5
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
Id
�� 
=
�� 
table
�� 
.
�� 
Column
�� %
<
��% &
Guid
��& *
>
��* +
(
��+ ,
nullable
��, 4
:
��4 5
false
��6 ;
)
��; <
,
��< =
CreationTime
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
DateTime
��0 8
>
��8 9
(
��9 :
nullable
��: B
:
��B C
false
��D I
)
��I J
,
��J K

�� !
=
��" #
table
��$ )
.
��) *
Column
��* 0
<
��0 1
long
��1 5
>
��5 6
(
��6 7
nullable
��7 ?
:
��? @
true
��A E
)
��E F
,
��F G
EntityId
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
string
��, 2
>
��2 3
(
��3 4
	maxLength
��4 =
:
��= >
$num
��? A
,
��A B
nullable
��C K
:
��K L
true
��M Q
)
��Q R
,
��R S-
EntityTypeAssemblyQualifiedName
�� 3
=
��4 5
table
��6 ;
.
��; <
Column
��< B
<
��B C
string
��C I
>
��I J
(
��J K
	maxLength
��K T
:
��T U
$num
��V Y
,
��Y Z
nullable
��[ c
:
��c d
true
��e i
)
��i j
,
��j k
EntityTypeName
�� "
=
��# $
table
��% *
.
��* +
Column
��+ 1
<
��1 2
string
��2 8
>
��8 9
(
��9 :
	maxLength
��: C
:
��C D
$num
��E H
,
��H I
nullable
��J R
:
��R S
true
��T X
)
��X Y
,
��Y Z
NotificationName
�� $
=
��% &
table
��' ,
.
��, -
Column
��- 3
<
��3 4
string
��4 :
>
��: ;
(
��; <
	maxLength
��< E
:
��E F
$num
��G I
,
��I J
nullable
��K S
:
��S T
true
��U Y
)
��Y Z
,
��Z [
TenantId
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
int
��, /
>
��/ 0
(
��0 1
nullable
��1 9
:
��9 :
true
��; ?
)
��? @
,
��@ A
UserId
�� 
=
�� 
table
�� "
.
��" #
Column
��# )
<
��) *
long
��* .
>
��. /
(
��/ 0
nullable
��0 8
:
��8 9
false
��: ?
)
��? @
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% F
,
��F G
x
��H I
=>
��J L
x
��M N
.
��N O
Id
��O Q
)
��Q R
;
��R S
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� .
,
��. /
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
Id
�� 
=
�� 
table
�� 
.
�� 
Column
�� %
<
��% &
Guid
��& *
>
��* +
(
��+ ,
nullable
��, 4
:
��4 5
false
��6 ;
)
��; <
,
��< =
CreationTime
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
DateTime
��0 8
>
��8 9
(
��9 :
nullable
��: B
:
��B C
false
��D I
)
��I J
,
��J K

�� !
=
��" #
table
��$ )
.
��) *
Column
��* 0
<
��0 1
long
��1 5
>
��5 6
(
��6 7
nullable
��7 ?
:
��? @
true
��A E
)
��E F
,
��F G
Data
�� 
=
�� 
table
��  
.
��  !
Column
��! '
<
��' (
string
��( .
>
��. /
(
��/ 0
	maxLength
��0 9
:
��9 :
$num
��; B
,
��B C
nullable
��D L
:
��L M
true
��N R
)
��R S
,
��S T
DataTypeName
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
string
��0 6
>
��6 7
(
��7 8
	maxLength
��8 A
:
��A B
$num
��C F
,
��F G
nullable
��H P
:
��P Q
true
��R V
)
��V W
,
��W X
EntityId
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
string
��, 2
>
��2 3
(
��3 4
	maxLength
��4 =
:
��= >
$num
��? A
,
��A B
nullable
��C K
:
��K L
true
��M Q
)
��Q R
,
��R S-
EntityTypeAssemblyQualifiedName
�� 3
=
��4 5
table
��6 ;
.
��; <
Column
��< B
<
��B C
string
��C I
>
��I J
(
��J K
	maxLength
��K T
:
��T U
$num
��V Y
,
��Y Z
nullable
��[ c
:
��c d
true
��e i
)
��i j
,
��j k
EntityTypeName
�� "
=
��# $
table
��% *
.
��* +
Column
��+ 1
<
��1 2
string
��2 8
>
��8 9
(
��9 :
	maxLength
��: C
:
��C D
$num
��E H
,
��H I
nullable
��J R
:
��R S
true
��T X
)
��X Y
,
��Y Z
NotificationName
�� $
=
��% &
table
��' ,
.
��, -
Column
��- 3
<
��3 4
string
��4 :
>
��: ;
(
��; <
	maxLength
��< E
:
��E F
$num
��G I
,
��I J
nullable
��K S
:
��S T
false
��U Z
)
��Z [
,
��[ \
Severity
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
byte
��, 0
>
��0 1
(
��1 2
nullable
��2 :
:
��: ;
false
��< A
)
��A B
,
��B C
TenantId
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
int
��, /
>
��/ 0
(
��0 1
nullable
��1 9
:
��9 :
true
��; ?
)
��? @
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% @
,
��@ A
x
��B C
=>
��D F
x
��G H
.
��H I
Id
��I K
)
��K L
;
��L M
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� ,
,
��, -
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
Id
�� 
=
�� 
table
�� 
.
�� 
Column
�� %
<
��% &
Guid
��& *
>
��* +
(
��+ ,
nullable
��, 4
:
��4 5
false
��6 ;
)
��; <
,
��< =
CreationTime
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
DateTime
��0 8
>
��8 9
(
��9 :
nullable
��: B
:
��B C
false
��D I
)
��I J
,
��J K
State
�� 
=
�� 
table
�� !
.
��! "
Column
��" (
<
��( )
int
��) ,
>
��, -
(
��- .
nullable
��. 6
:
��6 7
false
��8 =
)
��= >
,
��> ?
TenantId
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
int
��, /
>
��/ 0
(
��0 1
nullable
��1 9
:
��9 :
true
��; ?
)
��? @
,
��@ A"
TenantNotificationId
�� (
=
��) *
table
��+ 0
.
��0 1
Column
��1 7
<
��7 8
Guid
��8 <
>
��< =
(
��= >
nullable
��> F
:
��F G
false
��H M
)
��M N
,
��N O
UserId
�� 
=
�� 
table
�� "
.
��" #
Column
��# )
<
��) *
long
��* .
>
��. /
(
��/ 0
nullable
��0 8
:
��8 9
false
��: ?
)
��? @
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% >
,
��> ?
x
��@ A
=>
��B D
x
��E F
.
��F G
Id
��G I
)
��I J
;
��J K
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� ,
,
��, -
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
Id
�� 
=
�� 
table
�� 
.
�� 
Column
�� %
<
��% &
long
��& *
>
��* +
(
��+ ,
nullable
��, 4
:
��4 5
false
��6 ;
)
��; <
.
�� 

Annotation
�� #
(
��# $
$str
��$ G
,
��G H.
 SqlServerValueGenerationStrategy
��I i
.
��i j
IdentityColumn
��j x
)
��x y
,
��y z
Code
�� 
=
�� 
table
��  
.
��  !
Column
��! '
<
��' (
string
��( .
>
��. /
(
��/ 0
	maxLength
��0 9
:
��9 :
$num
��; =
,
��= >
nullable
��? G
:
��G H
false
��I N
)
��N O
,
��O P
CreationTime
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
DateTime
��0 8
>
��8 9
(
��9 :
nullable
��: B
:
��B C
false
��D I
)
��I J
,
��J K

�� !
=
��" #
table
��$ )
.
��) *
Column
��* 0
<
��0 1
long
��1 5
>
��5 6
(
��6 7
nullable
��7 ?
:
��? @
true
��A E
)
��E F
,
��F G

�� !
=
��" #
table
��$ )
.
��) *
Column
��* 0
<
��0 1
long
��1 5
>
��5 6
(
��6 7
nullable
��7 ?
:
��? @
true
��A E
)
��E F
,
��F G
DeletionTime
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
DateTime
��0 8
>
��8 9
(
��9 :
nullable
��: B
:
��B C
true
��D H
)
��H I
,
��I J
DisplayName
�� 
=
��  !
table
��" '
.
��' (
Column
��( .
<
��. /
string
��/ 5
>
��5 6
(
��6 7
	maxLength
��7 @
:
��@ A
$num
��B E
,
��E F
nullable
��G O
:
��O P
false
��Q V
)
��V W
,
��W X
	IsDeleted
�� 
=
�� 
table
��  %
.
��% &
Column
��& ,
<
��, -
bool
��- 1
>
��1 2
(
��2 3
nullable
��3 ;
:
��; <
false
��= B
)
��B C
,
��C D"
LastModificationTime
�� (
=
��) *
table
��+ 0
.
��0 1
Column
��1 7
<
��7 8
DateTime
��8 @
>
��@ A
(
��A B
nullable
��B J
:
��J K
true
��L P
)
��P Q
,
��Q R 
LastModifierUserId
�� &
=
��' (
table
��) .
.
��. /
Column
��/ 5
<
��5 6
long
��6 :
>
��: ;
(
��; <
nullable
��< D
:
��D E
true
��F J
)
��J K
,
��K L
ParentId
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
long
��, 0
>
��0 1
(
��1 2
nullable
��2 :
:
��: ;
true
��< @
)
��@ A
,
��A B
TenantId
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
int
��, /
>
��/ 0
(
��0 1
nullable
��1 9
:
��9 :
true
��; ?
)
��? @
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% >
,
��> ?
x
��@ A
=>
��B D
x
��E F
.
��F G
Id
��G I
)
��I J
;
��J K
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� U
,
��U V
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
ParentId
��' /
,
��/ 0
principalTable
�� &
:
��& '
$str
��( >
,
��> ?
principalColumn
�� '
:
��' (
$str
��) -
,
��- .
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Restrict
��4 <
)
��< =
;
��= >
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
��  
,
��  !
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
Id
�� 
=
�� 
table
�� 
.
�� 
Column
�� %
<
��% &
long
��& *
>
��* +
(
��+ ,
nullable
��, 4
:
��4 5
false
��6 ;
)
��; <
.
�� 

Annotation
�� #
(
��# $
$str
��$ G
,
��G H.
 SqlServerValueGenerationStrategy
��I i
.
��i j
IdentityColumn
��j x
)
��x y
,
��y z
AccessFailedCount
�� %
=
��& '
table
��( -
.
��- .
Column
��. 4
<
��4 5
int
��5 8
>
��8 9
(
��9 :
nullable
��: B
:
��B C
false
��D I
)
��I J
,
��J K"
AuthenticationSource
�� (
=
��) *
table
��+ 0
.
��0 1
Column
��1 7
<
��7 8
string
��8 >
>
��> ?
(
��? @
	maxLength
��@ I
:
��I J
$num
��K M
,
��M N
nullable
��O W
:
��W X
true
��Y ]
)
��] ^
,
��^ _
ConcurrencyStamp
�� $
=
��% &
table
��' ,
.
��, -
Column
��- 3
<
��3 4
string
��4 :
>
��: ;
(
��; <
nullable
��< D
:
��D E
true
��F J
)
��J K
,
��K L
CreationTime
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
DateTime
��0 8
>
��8 9
(
��9 :
nullable
��: B
:
��B C
false
��D I
)
��I J
,
��J K

�� !
=
��" #
table
��$ )
.
��) *
Column
��* 0
<
��0 1
long
��1 5
>
��5 6
(
��6 7
nullable
��7 ?
:
��? @
true
��A E
)
��E F
,
��F G

�� !
=
��" #
table
��$ )
.
��) *
Column
��* 0
<
��0 1
long
��1 5
>
��5 6
(
��6 7
nullable
��7 ?
:
��? @
true
��A E
)
��E F
,
��F G
DeletionTime
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
DateTime
��0 8
>
��8 9
(
��9 :
nullable
��: B
:
��B C
true
��D H
)
��H I
,
��I J
EmailAddress
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
string
��0 6
>
��6 7
(
��7 8
	maxLength
��8 A
:
��A B
$num
��C F
,
��F G
nullable
��H P
:
��P Q
false
��R W
)
��W X
,
��X Y#
EmailConfirmationCode
�� )
=
��* +
table
��, 1
.
��1 2
Column
��2 8
<
��8 9
string
��9 ?
>
��? @
(
��@ A
	maxLength
��A J
:
��J K
$num
��L O
,
��O P
nullable
��Q Y
:
��Y Z
true
��[ _
)
��_ `
,
��` a
IsActive
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
bool
��, 0
>
��0 1
(
��1 2
nullable
��2 :
:
��: ;
false
��< A
)
��A B
,
��B C
	IsDeleted
�� 
=
�� 
table
��  %
.
��% &
Column
��& ,
<
��, -
bool
��- 1
>
��1 2
(
��2 3
nullable
��3 ;
:
��; <
false
��= B
)
��B C
,
��C D
IsEmailConfirmed
�� $
=
��% &
table
��' ,
.
��, -
Column
��- 3
<
��3 4
bool
��4 8
>
��8 9
(
��9 :
nullable
��: B
:
��B C
false
��D I
)
��I J
,
��J K
IsLockoutEnabled
�� $
=
��% &
table
��' ,
.
��, -
Column
��- 3
<
��3 4
bool
��4 8
>
��8 9
(
��9 :
nullable
��: B
:
��B C
false
��D I
)
��I J
,
��J K$
IsPhoneNumberConfirmed
�� *
=
��+ ,
table
��- 2
.
��2 3
Column
��3 9
<
��9 :
bool
��: >
>
��> ?
(
��? @
nullable
��@ H
:
��H I
false
��J O
)
��O P
,
��P Q 
IsTwoFactorEnabled
�� &
=
��' (
table
��) .
.
��. /
Column
��/ 5
<
��5 6
bool
��6 :
>
��: ;
(
��; <
nullable
��< D
:
��D E
false
��F K
)
��K L
,
��L M

�� !
=
��" #
table
��$ )
.
��) *
Column
��* 0
<
��0 1
DateTime
��1 9
>
��9 :
(
��: ;
nullable
��; C
:
��C D
true
��E I
)
��I J
,
��J K"
LastModificationTime
�� (
=
��) *
table
��+ 0
.
��0 1
Column
��1 7
<
��7 8
DateTime
��8 @
>
��@ A
(
��A B
nullable
��B J
:
��J K
true
��L P
)
��P Q
,
��Q R 
LastModifierUserId
�� &
=
��' (
table
��) .
.
��. /
Column
��/ 5
<
��5 6
long
��6 :
>
��: ;
(
��; <
nullable
��< D
:
��D E
true
��F J
)
��J K
,
��K L
LockoutEndDateUtc
�� %
=
��& '
table
��( -
.
��- .
Column
��. 4
<
��4 5
DateTime
��5 =
>
��= >
(
��> ?
nullable
��? G
:
��G H
true
��I M
)
��M N
,
��N O
Name
�� 
=
�� 
table
��  
.
��  !
Column
��! '
<
��' (
string
��( .
>
��. /
(
��/ 0
	maxLength
��0 9
:
��9 :
$num
��; =
,
��= >
nullable
��? G
:
��G H
false
��I N
)
��N O
,
��O P$
NormalizedEmailAddress
�� *
=
��+ ,
table
��- 2
.
��2 3
Column
��3 9
<
��9 :
string
��: @
>
��@ A
(
��A B
	maxLength
��B K
:
��K L
$num
��M P
,
��P Q
nullable
��R Z
:
��Z [
false
��\ a
)
��a b
,
��b c 
NormalizedUserName
�� &
=
��' (
table
��) .
.
��. /
Column
��/ 5
<
��5 6
string
��6 <
>
��< =
(
��= >
	maxLength
��> G
:
��G H
$num
��I K
,
��K L
nullable
��M U
:
��U V
false
��W \
)
��\ ]
,
��] ^
Password
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
string
��, 2
>
��2 3
(
��3 4
	maxLength
��4 =
:
��= >
$num
��? B
,
��B C
nullable
��D L
:
��L M
false
��N S
)
��S T
,
��T U
PasswordResetCode
�� %
=
��& '
table
��( -
.
��- .
Column
��. 4
<
��4 5
string
��5 ;
>
��; <
(
��< =
	maxLength
��= F
:
��F G
$num
��H K
,
��K L
nullable
��M U
:
��U V
true
��W [
)
��[ \
,
��\ ]
PhoneNumber
�� 
=
��  !
table
��" '
.
��' (
Column
��( .
<
��. /
string
��/ 5
>
��5 6
(
��6 7
nullable
��7 ?
:
��? @
true
��A E
)
��E F
,
��F G

�� !
=
��" #
table
��$ )
.
��) *
Column
��* 0
<
��0 1
string
��1 7
>
��7 8
(
��8 9
nullable
��9 A
:
��A B
true
��C G
)
��G H
,
��H I
Surname
�� 
=
�� 
table
�� #
.
��# $
Column
��$ *
<
��* +
string
��+ 1
>
��1 2
(
��2 3
	maxLength
��3 <
:
��< =
$num
��> @
,
��@ A
nullable
��B J
:
��J K
false
��L Q
)
��Q R
,
��R S
TenantId
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
int
��, /
>
��/ 0
(
��0 1
nullable
��1 9
:
��9 :
true
��; ?
)
��? @
,
��@ A
UserName
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
string
��, 2
>
��2 3
(
��3 4
	maxLength
��4 =
:
��= >
$num
��? A
,
��A B
nullable
��C K
:
��K L
false
��M R
)
��R S
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% 2
,
��2 3
x
��4 5
=>
��6 8
x
��9 :
.
��: ;
Id
��; =
)
��= >
;
��> ?
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� B
,
��B C
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '

��' 4
,
��4 5
principalTable
�� &
:
��& '
$str
��( 2
,
��2 3
principalColumn
�� '
:
��' (
$str
��) -
,
��- .
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Restrict
��4 <
)
��< =
;
��= >
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� B
,
��B C
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '

��' 4
,
��4 5
principalTable
�� &
:
��& '
$str
��( 2
,
��2 3
principalColumn
�� '
:
��' (
$str
��) -
,
��- .
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Restrict
��4 <
)
��< =
;
��= >
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� G
,
��G H
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& ' 
LastModifierUserId
��' 9
,
��9 :
principalTable
�� &
:
��& '
$str
��( 2
,
��2 3
principalColumn
�� '
:
��' (
$str
��) -
,
��- .
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Restrict
��4 <
)
��< =
;
��= >
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� #
,
��# $
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
Id
�� 
=
�� 
table
�� 
.
�� 
Column
�� %
<
��% &
long
��& *
>
��* +
(
��+ ,
nullable
��, 4
:
��4 5
false
��6 ;
)
��; <
.
�� 

Annotation
�� #
(
��# $
$str
��$ G
,
��G H.
 SqlServerValueGenerationStrategy
��I i
.
��i j
IdentityColumn
��j x
)
��x y
,
��y z
CreationTime
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
DateTime
��0 8
>
��8 9
(
��9 :
nullable
��: B
:
��B C
false
��D I
)
��I J
,
��J K

�� !
=
��" #
table
��$ )
.
��) *
Column
��* 0
<
��0 1
long
��1 5
>
��5 6
(
��6 7
nullable
��7 ?
:
��? @
true
��A E
)
��E F
,
��F G

�� !
=
��" #
table
��$ )
.
��) *
Column
��* 0
<
��0 1
string
��1 7
>
��7 8
(
��8 9
nullable
��9 A
:
��A B
false
��C H
)
��H I
,
��I J
Name
�� 
=
�� 
table
��  
.
��  !
Column
��! '
<
��' (
string
��( .
>
��. /
(
��/ 0
	maxLength
��0 9
:
��9 :
$num
��; >
,
��> ?
nullable
��@ H
:
��H I
false
��J O
)
��O P
,
��P Q
Value
�� 
=
�� 
table
�� !
.
��! "
Column
��" (
<
��( )
string
��) /
>
��/ 0
(
��0 1
	maxLength
��1 :
:
��: ;
$num
��< @
,
��@ A
nullable
��B J
:
��J K
false
��L Q
)
��Q R
,
��R S
	EditionId
�� 
=
�� 
table
��  %
.
��% &
Column
��& ,
<
��, -
int
��- 0
>
��0 1
(
��1 2
nullable
��2 :
:
��: ;
true
��< @
)
��@ A
,
��A B
TenantId
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
int
��, /
>
��/ 0
(
��0 1
nullable
��1 9
:
��9 :
true
��; ?
)
��? @
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% 5
,
��5 6
x
��7 8
=>
��9 ;
x
��< =
.
��= >
Id
��> @
)
��@ A
;
��A B
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� D
,
��D E
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
	EditionId
��' 0
,
��0 1
principalTable
�� &
:
��& '
$str
��( 5
,
��5 6
principalColumn
�� '
:
��' (
$str
��) -
,
��- .
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� %
,
��% &
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
Id
�� 
=
�� 
table
�� 
.
�� 
Column
�� %
<
��% &
long
��& *
>
��* +
(
��+ ,
nullable
��, 4
:
��4 5
false
��6 ;
)
��; <
.
�� 

Annotation
�� #
(
��# $
$str
��$ G
,
��G H.
 SqlServerValueGenerationStrategy
��I i
.
��i j
IdentityColumn
��j x
)
��x y
,
��y z
	ClaimType
�� 
=
�� 
table
��  %
.
��% &
Column
��& ,
<
��, -
string
��- 3
>
��3 4
(
��4 5
nullable
��5 =
:
��= >
true
��? C
)
��C D
,
��D E

ClaimValue
�� 
=
��  
table
��! &
.
��& '
Column
��' -
<
��- .
string
��. 4
>
��4 5
(
��5 6
nullable
��6 >
:
��> ?
true
��@ D
)
��D E
,
��E F
CreationTime
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
DateTime
��0 8
>
��8 9
(
��9 :
nullable
��: B
:
��B C
false
��D I
)
��I J
,
��J K

�� !
=
��" #
table
��$ )
.
��) *
Column
��* 0
<
��0 1
long
��1 5
>
��5 6
(
��6 7
nullable
��7 ?
:
��? @
true
��A E
)
��E F
,
��F G
TenantId
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
int
��, /
>
��/ 0
(
��0 1
nullable
��1 9
:
��9 :
true
��; ?
)
��? @
,
��@ A
UserId
�� 
=
�� 
table
�� "
.
��" #
Column
��# )
<
��) *
long
��* .
>
��. /
(
��/ 0
nullable
��0 8
:
��8 9
false
��: ?
)
��? @
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% 7
,
��7 8
x
��9 :
=>
��; =
x
��> ?
.
��? @
Id
��@ B
)
��B C
;
��C D
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� @
,
��@ A
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
UserId
��' -
,
��- .
principalTable
�� &
:
��& '
$str
��( 2
,
��2 3
principalColumn
�� '
:
��' (
$str
��) -
,
��- .
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� %
,
��% &
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
Id
�� 
=
�� 
table
�� 
.
�� 
Column
�� %
<
��% &
long
��& *
>
��* +
(
��+ ,
nullable
��, 4
:
��4 5
false
��6 ;
)
��; <
.
�� 

Annotation
�� #
(
��# $
$str
��$ G
,
��G H.
 SqlServerValueGenerationStrategy
��I i
.
��i j
IdentityColumn
��j x
)
��x y
,
��y z

�� !
=
��" #
table
��$ )
.
��) *
Column
��* 0
<
��0 1
string
��1 7
>
��7 8
(
��8 9
	maxLength
��9 B
:
��B C
$num
��D G
,
��G H
nullable
��I Q
:
��Q R
false
��S X
)
��X Y
,
��Y Z
ProviderKey
�� 
=
��  !
table
��" '
.
��' (
Column
��( .
<
��. /
string
��/ 5
>
��5 6
(
��6 7
	maxLength
��7 @
:
��@ A
$num
��B E
,
��E F
nullable
��G O
:
��O P
false
��Q V
)
��V W
,
��W X
TenantId
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
int
��, /
>
��/ 0
(
��0 1
nullable
��1 9
:
��9 :
true
��; ?
)
��? @
,
��@ A
UserId
�� 
=
�� 
table
�� "
.
��" #
Column
��# )
<
��) *
long
��* .
>
��. /
(
��/ 0
nullable
��0 8
:
��8 9
false
��: ?
)
��? @
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% 7
,
��7 8
x
��9 :
=>
��; =
x
��> ?
.
��? @
Id
��@ B
)
��B C
;
��C D
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� @
,
��@ A
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
UserId
��' -
,
��- .
principalTable
�� &
:
��& '
$str
��( 2
,
��2 3
principalColumn
�� '
:
��' (
$str
��) -
,
��- .
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� $
,
��$ %
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
Id
�� 
=
�� 
table
�� 
.
�� 
Column
�� %
<
��% &
long
��& *
>
��* +
(
��+ ,
nullable
��, 4
:
��4 5
false
��6 ;
)
��; <
.
�� 

Annotation
�� #
(
��# $
$str
��$ G
,
��G H.
 SqlServerValueGenerationStrategy
��I i
.
��i j
IdentityColumn
��j x
)
��x y
,
��y z
CreationTime
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
DateTime
��0 8
>
��8 9
(
��9 :
nullable
��: B
:
��B C
false
��D I
)
��I J
,
��J K

�� !
=
��" #
table
��$ )
.
��) *
Column
��* 0
<
��0 1
long
��1 5
>
��5 6
(
��6 7
nullable
��7 ?
:
��? @
true
��A E
)
��E F
,
��F G
RoleId
�� 
=
�� 
table
�� "
.
��" #
Column
��# )
<
��) *
int
��* -
>
��- .
(
��. /
nullable
��/ 7
:
��7 8
false
��9 >
)
��> ?
,
��? @
TenantId
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
int
��, /
>
��/ 0
(
��0 1
nullable
��1 9
:
��9 :
true
��; ?
)
��? @
,
��@ A
UserId
�� 
=
�� 
table
�� "
.
��" #
Column
��# )
<
��) *
long
��* .
>
��. /
(
��/ 0
nullable
��0 8
:
��8 9
false
��: ?
)
��? @
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% 6
,
��6 7
x
��8 9
=>
��: <
x
��= >
.
��> ?
Id
��? A
)
��A B
;
��B C
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� ?
,
��? @
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
UserId
��' -
,
��- .
principalTable
�� &
:
��& '
$str
��( 2
,
��2 3
principalColumn
�� '
:
��' (
$str
��) -
,
��- .
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� %
,
��% &
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
Id
�� 
=
�� 
table
�� 
.
�� 
Column
�� %
<
��% &
long
��& *
>
��* +
(
��+ ,
nullable
��, 4
:
��4 5
false
��6 ;
)
��; <
.
�� 

Annotation
�� #
(
��# $
$str
��$ G
,
��G H.
 SqlServerValueGenerationStrategy
��I i
.
��i j
IdentityColumn
��j x
)
��x y
,
��y z

�� !
=
��" #
table
��$ )
.
��) *
Column
��* 0
<
��0 1
string
��1 7
>
��7 8
(
��8 9
nullable
��9 A
:
��A B
true
��C G
)
��G H
,
��H I
Name
�� 
=
�� 
table
��  
.
��  !
Column
��! '
<
��' (
string
��( .
>
��. /
(
��/ 0
nullable
��0 8
:
��8 9
true
��: >
)
��> ?
,
��? @
TenantId
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
int
��, /
>
��/ 0
(
��0 1
nullable
��1 9
:
��9 :
true
��; ?
)
��? @
,
��@ A
UserId
�� 
=
�� 
table
�� "
.
��" #
Column
��# )
<
��) *
long
��* .
>
��. /
(
��/ 0
nullable
��0 8
:
��8 9
false
��: ?
)
��? @
,
��@ A
Value
�� 
=
�� 
table
�� !
.
��! "
Column
��" (
<
��( )
string
��) /
>
��/ 0
(
��0 1
nullable
��1 9
:
��9 :
true
��; ?
)
��? @
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% 7
,
��7 8
x
��9 :
=>
��; =
x
��> ?
.
��? @
Id
��@ B
)
��B C
;
��C D
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� @
,
��@ A
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
UserId
��' -
,
��- .
principalTable
�� &
:
��& '
$str
��( 2
,
��2 3
principalColumn
�� '
:
��' (
$str
��) -
,
��- .
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� #
,
��# $
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
Id
�� 
=
�� 
table
�� 
.
�� 
Column
�� %
<
��% &
long
��& *
>
��* +
(
��+ ,
nullable
��, 4
:
��4 5
false
��6 ;
)
��; <
.
�� 

Annotation
�� #
(
��# $
$str
��$ G
,
��G H.
 SqlServerValueGenerationStrategy
��I i
.
��i j
IdentityColumn
��j x
)
��x y
,
��y z
CreationTime
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
DateTime
��0 8
>
��8 9
(
��9 :
nullable
��: B
:
��B C
false
��D I
)
��I J
,
��J K

�� !
=
��" #
table
��$ )
.
��) *
Column
��* 0
<
��0 1
long
��1 5
>
��5 6
(
��6 7
nullable
��7 ?
:
��? @
true
��A E
)
��E F
,
��F G"
LastModificationTime
�� (
=
��) *
table
��+ 0
.
��0 1
Column
��1 7
<
��7 8
DateTime
��8 @
>
��@ A
(
��A B
nullable
��B J
:
��J K
true
��L P
)
��P Q
,
��Q R 
LastModifierUserId
�� &
=
��' (
table
��) .
.
��. /
Column
��/ 5
<
��5 6
long
��6 :
>
��: ;
(
��; <
nullable
��< D
:
��D E
true
��F J
)
��J K
,
��K L
Name
�� 
=
�� 
table
��  
.
��  !
Column
��! '
<
��' (
string
��( .
>
��. /
(
��/ 0
	maxLength
��0 9
:
��9 :
$num
��; >
,
��> ?
nullable
��@ H
:
��H I
false
��J O
)
��O P
,
��P Q
TenantId
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
int
��, /
>
��/ 0
(
��0 1
nullable
��1 9
:
��9 :
true
��; ?
)
��? @
,
��@ A
UserId
�� 
=
�� 
table
�� "
.
��" #
Column
��# )
<
��) *
long
��* .
>
��. /
(
��/ 0
nullable
��0 8
:
��8 9
true
��: >
)
��> ?
,
��? @
Value
�� 
=
�� 
table
�� !
.
��! "
Column
��" (
<
��( )
string
��) /
>
��/ 0
(
��0 1
	maxLength
��1 :
:
��: ;
$num
��< @
,
��@ A
nullable
��B J
:
��J K
true
��L P
)
��P Q
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% 5
,
��5 6
x
��7 8
=>
��9 ;
x
��< =
.
��= >
Id
��> @
)
��@ A
;
��A B
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� >
,
��> ?
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
UserId
��' -
,
��- .
principalTable
�� &
:
��& '
$str
��( 2
,
��2 3
principalColumn
�� '
:
��' (
$str
��) -
,
��- .
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Restrict
��4 <
)
��< =
;
��= >
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
��  
,
��  !
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
Id
�� 
=
�� 
table
�� 
.
�� 
Column
�� %
<
��% &
int
��& )
>
��) *
(
��* +
nullable
��+ 3
:
��3 4
false
��5 :
)
��: ;
.
�� 

Annotation
�� #
(
��# $
$str
��$ G
,
��G H.
 SqlServerValueGenerationStrategy
��I i
.
��i j
IdentityColumn
��j x
)
��x y
,
��y z
ConcurrencyStamp
�� $
=
��% &
table
��' ,
.
��, -
Column
��- 3
<
��3 4
string
��4 :
>
��: ;
(
��; <
nullable
��< D
:
��D E
true
��F J
)
��J K
,
��K L
CreationTime
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
DateTime
��0 8
>
��8 9
(
��9 :
nullable
��: B
:
��B C
false
��D I
)
��I J
,
��J K

�� !
=
��" #
table
��$ )
.
��) *
Column
��* 0
<
��0 1
long
��1 5
>
��5 6
(
��6 7
nullable
��7 ?
:
��? @
true
��A E
)
��E F
,
��F G

�� !
=
��" #
table
��$ )
.
��) *
Column
��* 0
<
��0 1
long
��1 5
>
��5 6
(
��6 7
nullable
��7 ?
:
��? @
true
��A E
)
��E F
,
��F G
DeletionTime
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
DateTime
��0 8
>
��8 9
(
��9 :
nullable
��: B
:
��B C
true
��D H
)
��H I
,
��I J
DisplayName
�� 
=
��  !
table
��" '
.
��' (
Column
��( .
<
��. /
string
��/ 5
>
��5 6
(
��6 7
	maxLength
��7 @
:
��@ A
$num
��B D
,
��D E
nullable
��F N
:
��N O
false
��P U
)
��U V
,
��V W
	IsDefault
�� 
=
�� 
table
��  %
.
��% &
Column
��& ,
<
��, -
bool
��- 1
>
��1 2
(
��2 3
nullable
��3 ;
:
��; <
false
��= B
)
��B C
,
��C D
	IsDeleted
�� 
=
�� 
table
��  %
.
��% &
Column
��& ,
<
��, -
bool
��- 1
>
��1 2
(
��2 3
nullable
��3 ;
:
��; <
false
��= B
)
��B C
,
��C D
IsStatic
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
bool
��, 0
>
��0 1
(
��1 2
nullable
��2 :
:
��: ;
false
��< A
)
��A B
,
��B C"
LastModificationTime
�� (
=
��) *
table
��+ 0
.
��0 1
Column
��1 7
<
��7 8
DateTime
��8 @
>
��@ A
(
��A B
nullable
��B J
:
��J K
true
��L P
)
��P Q
,
��Q R 
LastModifierUserId
�� &
=
��' (
table
��) .
.
��. /
Column
��/ 5
<
��5 6
long
��6 :
>
��: ;
(
��; <
nullable
��< D
:
��D E
true
��F J
)
��J K
,
��K L
Name
�� 
=
�� 
table
��  
.
��  !
Column
��! '
<
��' (
string
��( .
>
��. /
(
��/ 0
	maxLength
��0 9
:
��9 :
$num
��; =
,
��= >
nullable
��? G
:
��G H
false
��I N
)
��N O
,
��O P
NormalizedName
�� "
=
��# $
table
��% *
.
��* +
Column
��+ 1
<
��1 2
string
��2 8
>
��8 9
(
��9 :
	maxLength
��: C
:
��C D
$num
��E G
,
��G H
nullable
��I Q
:
��Q R
false
��S X
)
��X Y
,
��Y Z
TenantId
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
int
��, /
>
��/ 0
(
��0 1
nullable
��1 9
:
��9 :
true
��; ?
)
��? @
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% 2
,
��2 3
x
��4 5
=>
��6 8
x
��9 :
.
��: ;
Id
��; =
)
��= >
;
��> ?
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� B
,
��B C
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '

��' 4
,
��4 5
principalTable
�� &
:
��& '
$str
��( 2
,
��2 3
principalColumn
�� '
:
��' (
$str
��) -
,
��- .
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Restrict
��4 <
)
��< =
;
��= >
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� B
,
��B C
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '

��' 4
,
��4 5
principalTable
�� &
:
��& '
$str
��( 2
,
��2 3
principalColumn
�� '
:
��' (
$str
��) -
,
��- .
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Restrict
��4 <
)
��< =
;
��= >
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� G
,
��G H
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& ' 
LastModifierUserId
��' 9
,
��9 :
principalTable
�� &
:
��& '
$str
��( 2
,
��2 3
principalColumn
�� '
:
��' (
$str
��) -
,
��- .
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Restrict
��4 <
)
��< =
;
��= >
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� "
,
��" #
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
Id
�� 
=
�� 
table
�� 
.
�� 
Column
�� %
<
��% &
int
��& )
>
��) *
(
��* +
nullable
��+ 3
:
��3 4
false
��5 :
)
��: ;
.
�� 

Annotation
�� #
(
��# $
$str
��$ G
,
��G H.
 SqlServerValueGenerationStrategy
��I i
.
��i j
IdentityColumn
��j x
)
��x y
,
��y z
ConnectionString
�� $
=
��% &
table
��' ,
.
��, -
Column
��- 3
<
��3 4
string
��4 :
>
��: ;
(
��; <
	maxLength
��< E
:
��E F
$num
��G K
,
��K L
nullable
��M U
:
��U V
true
��W [
)
��[ \
,
��\ ]
CreationTime
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
DateTime
��0 8
>
��8 9
(
��9 :
nullable
��: B
:
��B C
false
��D I
)
��I J
,
��J K

�� !
=
��" #
table
��$ )
.
��) *
Column
��* 0
<
��0 1
long
��1 5
>
��5 6
(
��6 7
nullable
��7 ?
:
��? @
true
��A E
)
��E F
,
��F G

�� !
=
��" #
table
��$ )
.
��) *
Column
��* 0
<
��0 1
long
��1 5
>
��5 6
(
��6 7
nullable
��7 ?
:
��? @
true
��A E
)
��E F
,
��F G
DeletionTime
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
DateTime
��0 8
>
��8 9
(
��9 :
nullable
��: B
:
��B C
true
��D H
)
��H I
,
��I J
	EditionId
�� 
=
�� 
table
��  %
.
��% &
Column
��& ,
<
��, -
int
��- 0
>
��0 1
(
��1 2
nullable
��2 :
:
��: ;
true
��< @
)
��@ A
,
��A B
IsActive
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
bool
��, 0
>
��0 1
(
��1 2
nullable
��2 :
:
��: ;
false
��< A
)
��A B
,
��B C
	IsDeleted
�� 
=
�� 
table
��  %
.
��% &
Column
��& ,
<
��, -
bool
��- 1
>
��1 2
(
��2 3
nullable
��3 ;
:
��; <
false
��= B
)
��B C
,
��C D"
LastModificationTime
�� (
=
��) *
table
��+ 0
.
��0 1
Column
��1 7
<
��7 8
DateTime
��8 @
>
��@ A
(
��A B
nullable
��B J
:
��J K
true
��L P
)
��P Q
,
��Q R 
LastModifierUserId
�� &
=
��' (
table
��) .
.
��. /
Column
��/ 5
<
��5 6
long
��6 :
>
��: ;
(
��; <
nullable
��< D
:
��D E
true
��F J
)
��J K
,
��K L
Name
�� 
=
�� 
table
��  
.
��  !
Column
��! '
<
��' (
string
��( .
>
��. /
(
��/ 0
	maxLength
��0 9
:
��9 :
$num
��; >
,
��> ?
nullable
��@ H
:
��H I
false
��J O
)
��O P
,
��P Q
TenancyName
�� 
=
��  !
table
��" '
.
��' (
Column
��( .
<
��. /
string
��/ 5
>
��5 6
(
��6 7
	maxLength
��7 @
:
��@ A
$num
��B D
,
��D E
nullable
��F N
:
��N O
false
��P U
)
��U V
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% 4
,
��4 5
x
��6 7
=>
��8 :
x
��; <
.
��< =
Id
��= ?
)
��? @
;
��@ A
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� D
,
��D E
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '

��' 4
,
��4 5
principalTable
�� &
:
��& '
$str
��( 2
,
��2 3
principalColumn
�� '
:
��' (
$str
��) -
,
��- .
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Restrict
��4 <
)
��< =
;
��= >
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� D
,
��D E
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '

��' 4
,
��4 5
principalTable
�� &
:
��& '
$str
��( 2
,
��2 3
principalColumn
�� '
:
��' (
$str
��) -
,
��- .
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Restrict
��4 <
)
��< =
;
��= >
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� C
,
��C D
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
	EditionId
��' 0
,
��0 1
principalTable
�� &
:
��& '
$str
��( 5
,
��5 6
principalColumn
�� '
:
��' (
$str
��) -
,
��- .
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Restrict
��4 <
)
��< =
;
��= >
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� I
,
��I J
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& ' 
LastModifierUserId
��' 9
,
��9 :
principalTable
�� &
:
��& '
$str
��( 2
,
��2 3
principalColumn
�� '
:
��' (
$str
��) -
,
��- .
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Restrict
��4 <
)
��< =
;
��= >
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� &
,
��& '
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
Id
�� 
=
�� 
table
�� 
.
�� 
Column
�� %
<
��% &
long
��& *
>
��* +
(
��+ ,
nullable
��, 4
:
��4 5
false
��6 ;
)
��; <
.
�� 

Annotation
�� #
(
��# $
$str
��$ G
,
��G H.
 SqlServerValueGenerationStrategy
��I i
.
��i j
IdentityColumn
��j x
)
��x y
,
��y z
CreationTime
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
DateTime
��0 8
>
��8 9
(
��9 :
nullable
��: B
:
��B C
false
��D I
)
��I J
,
��J K

�� !
=
��" #
table
��$ )
.
��) *
Column
��* 0
<
��0 1
long
��1 5
>
��5 6
(
��6 7
nullable
��7 ?
:
��? @
true
��A E
)
��E F
,
��F G

�� !
=
��" #
table
��$ )
.
��) *
Column
��* 0
<
��0 1
string
��1 7
>
��7 8
(
��8 9
nullable
��9 A
:
��A B
false
��C H
)
��H I
,
��I J
	IsGranted
�� 
=
�� 
table
��  %
.
��% &
Column
��& ,
<
��, -
bool
��- 1
>
��1 2
(
��2 3
nullable
��3 ;
:
��; <
false
��= B
)
��B C
,
��C D
Name
�� 
=
�� 
table
��  
.
��  !
Column
��! '
<
��' (
string
��( .
>
��. /
(
��/ 0
	maxLength
��0 9
:
��9 :
$num
��; >
,
��> ?
nullable
��@ H
:
��H I
false
��J O
)
��O P
,
��P Q
TenantId
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
int
��, /
>
��/ 0
(
��0 1
nullable
��1 9
:
��9 :
true
��; ?
)
��? @
,
��@ A
RoleId
�� 
=
�� 
table
�� "
.
��" #
Column
��# )
<
��) *
int
��* -
>
��- .
(
��. /
nullable
��/ 7
:
��7 8
true
��9 =
)
��= >
,
��> ?
UserId
�� 
=
�� 
table
�� "
.
��" #
Column
��# )
<
��) *
long
��* .
>
��. /
(
��/ 0
nullable
��0 8
:
��8 9
true
��: >
)
��> ?
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% 8
,
��8 9
x
��: ;
=>
��< >
x
��? @
.
��@ A
Id
��A C
)
��C D
;
��D E
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� A
,
��A B
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
RoleId
��' -
,
��- .
principalTable
�� &
:
��& '
$str
��( 2
,
��2 3
principalColumn
�� '
:
��' (
$str
��) -
,
��- .
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� A
,
��A B
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
UserId
��' -
,
��- .
principalTable
�� &
:
��& '
$str
��( 2
,
��2 3
principalColumn
�� '
:
��' (
$str
��) -
,
��- .
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� %
,
��% &
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
Id
�� 
=
�� 
table
�� 
.
�� 
Column
�� %
<
��% &
long
��& *
>
��* +
(
��+ ,
nullable
��, 4
:
��4 5
false
��6 ;
)
��; <
.
�� 

Annotation
�� #
(
��# $
$str
��$ G
,
��G H.
 SqlServerValueGenerationStrategy
��I i
.
��i j
IdentityColumn
��j x
)
��x y
,
��y z
	ClaimType
�� 
=
�� 
table
��  %
.
��% &
Column
��& ,
<
��, -
string
��- 3
>
��3 4
(
��4 5
nullable
��5 =
:
��= >
true
��? C
)
��C D
,
��D E

ClaimValue
�� 
=
��  
table
��! &
.
��& '
Column
��' -
<
��- .
string
��. 4
>
��4 5
(
��5 6
nullable
��6 >
:
��> ?
true
��@ D
)
��D E
,
��E F
CreationTime
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
DateTime
��0 8
>
��8 9
(
��9 :
nullable
��: B
:
��B C
false
��D I
)
��I J
,
��J K

�� !
=
��" #
table
��$ )
.
��) *
Column
��* 0
<
��0 1
long
��1 5
>
��5 6
(
��6 7
nullable
��7 ?
:
��? @
true
��A E
)
��E F
,
��F G
RoleId
�� 
=
�� 
table
�� "
.
��" #
Column
��# )
<
��) *
int
��* -
>
��- .
(
��. /
nullable
��/ 7
:
��7 8
false
��9 >
)
��> ?
,
��? @
TenantId
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
int
��, /
>
��/ 0
(
��0 1
nullable
��1 9
:
��9 :
true
��; ?
)
��? @
,
��@ A
UserId
�� 
=
�� 
table
�� "
.
��" #
Column
��# )
<
��) *
int
��* -
>
��- .
(
��. /
nullable
��/ 7
:
��7 8
true
��9 =
)
��= >
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% 7
,
��7 8
x
��9 :
=>
��; =
x
��> ?
.
��? @
Id
��@ B
)
��B C
;
��C D
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� @
,
��@ A
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
UserId
��' -
,
��- .
principalTable
�� &
:
��& '
$str
��( 2
,
��2 3
principalColumn
�� '
:
��' (
$str
��) -
,
��- .
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Restrict
��4 <
)
��< =
;
��= >
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 5
,
��5 6
table
�� 
:
�� 
$str
�� $
,
��$ %
columns
�� 
:
�� 
new
�� 
[
�� 
]
�� 
{
��  
$str
��! ,
,
��, -
$str
��. 4
}
��5 6
)
��6 7
;
��7 8
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 4
,
��4 5
table
�� 
:
�� 
$str
�� $
,
��$ %
columns
�� 
:
�� 
new
�� 
[
�� 
]
�� 
{
��  
$str
��! +
,
��+ ,
$str
��- 3
}
��4 5
)
��5 6
;
��6 7
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� B
,
��B C
table
�� 
:
�� 
$str
�� %
,
��% &
columns
�� 
:
�� 
new
�� 
[
�� 
]
�� 
{
��  
$str
��! +
,
��+ ,
$str
��- @
}
��A B
)
��B C
;
��C D
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� >
,
��> ?
table
�� 
:
�� 
$str
�� %
,
��% &
columns
�� 
:
�� 
new
�� 
[
�� 
]
�� 
{
��  
$str
��! +
,
��+ ,
$str
��- <
}
��= >
)
��> ?
;
��? @
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 7
,
��7 8
table
�� 
:
�� 
$str
�� %
,
��% &
columns
�� 
:
�� 
new
�� 
[
�� 
]
�� 
{
��  
$str
��! +
,
��+ ,
$str
��- 5
}
��6 7
)
��7 8
;
��8 9
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 7
,
��7 8
table
�� 
:
�� 
$str
�� '
,
��' (
columns
�� 
:
�� 
new
�� 
[
�� 
]
�� 
{
��  
$str
��! +
,
��+ ,
$str
��- 3
}
��4 5
)
��5 6
;
��6 7
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 0
,
��0 1
table
�� 
:
�� 
$str
�� '
,
��' (
column
�� 
:
�� 
$str
��  
)
��  !
;
��! "
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 0
,
��0 1
table
�� 
:
�� 
$str
�� '
,
��' (
column
�� 
:
�� 
$str
��  
)
��  !
;
��! "
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� /
,
��/ 0
table
�� 
:
�� 
$str
�� &
,
��& '
column
�� 
:
�� 
$str
��  
)
��  !
;
��! "
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� /
,
��/ 0
table
�� 
:
�� 
$str
�� &
,
��& '
column
�� 
:
�� 
$str
��  
)
��  !
;
��! "
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� ;
,
��; <
table
�� 
:
�� 
$str
�� &
,
��& '
columns
�� 
:
�� 
new
�� 
[
�� 
]
�� 
{
��  
$str
��! +
,
��+ ,
$str
��- 8
}
��9 :
)
��: ;
;
��; <
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 7
,
��7 8
table
�� 
:
�� 
$str
�� (
,
��( )
column
�� 
:
�� 
$str
�� &
)
��& '
;
��' (
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 3
,
��3 4
table
�� 
:
�� 
$str
�� (
,
��( )
column
�� 
:
�� 
$str
�� "
)
��" #
;
��# $
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� @
,
��@ A
table
�� 
:
�� 
$str
�� (
,
��( )
columns
�� 
:
�� 
new
�� 
[
�� 
]
�� 
{
��  
$str
��! +
,
��+ ,
$str
��- ;
}
��< =
)
��= >
;
��> ?
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� :
,
��: ;
table
�� 
:
�� 
$str
�� (
,
��( )
columns
�� 
:
�� 
new
�� 
[
�� 
]
�� 
{
��  
$str
��! +
,
��+ ,
$str
��- 5
}
��6 7
)
��7 8
;
��8 9
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� <
,
��< =
table
�� 
:
�� 
$str
�� (
,
��( )
columns
�� 
:
�� 
new
�� 
[
�� 
]
�� 
{
��  
$str
��! +
,
��+ ,
$str
��- 7
}
��8 9
)
��9 :
;
��: ;
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� /
,
��/ 0
table
�� 
:
�� 
$str
�� &
,
��& '
column
�� 
:
�� 
$str
��  
)
��  !
;
��! "
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� ;
,
��; <
table
�� 
:
�� 
$str
�� &
,
��& '
columns
�� 
:
�� 
new
�� 
[
�� 
]
�� 
{
��  
$str
��! +
,
��+ ,
$str
��- 8
}
��9 :
)
��: ;
;
��; <
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� /
,
��/ 0
table
�� 
:
�� 
$str
�� &
,
��& '
column
�� 
:
�� 
$str
��  
)
��  !
;
��! "
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 8
,
��8 9
table
�� 
:
�� 
$str
�� &
,
��& '
columns
�� 
:
�� 
new
�� 
[
�� 
]
�� 
{
��  
$str
��! +
,
��+ ,
$str
��- 5
}
��6 7
)
��7 8
;
��8 9
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� K
,
��K L
table
�� 
:
�� 
$str
�� &
,
��& '
columns
�� 
:
�� 
new
�� 
[
�� 
]
�� 
{
��  
$str
��! +
,
��+ ,
$str
��- <
,
��< =
$str
��> K
}
��L M
)
��M N
;
��N O
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� ?
,
��? @
table
�� 
:
�� 
$str
�� -
,
��- .
columns
�� 
:
�� 
new
�� 
[
�� 
]
�� 
{
��  
$str
��! )
,
��) *
$str
��+ 5
}
��6 7
)
��7 8
;
��8 9
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� Y
,
��Y Z
table
�� 
:
�� 
$str
�� -
,
��- .
columns
�� 
:
�� 
new
�� 
[
�� 
]
�� 
{
��  
$str
��! .
,
��. /
$str
��0 H
,
��H I
$str
��J R
}
��S T
)
��T U
;
��U V
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� O
,
��O P
table
�� 
:
�� 
$str
�� 1
,
��1 2
columns
�� 
:
�� 
new
�� 
[
�� 
]
�� 
{
��  
$str
��! +
,
��+ ,
$str
��- A
}
��B C
)
��C D
;
��D E
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� C
,
��C D
table
�� 
:
�� 
$str
�� 1
,
��1 2
columns
�� 
:
�� 
new
�� 
[
�� 
]
�� 
{
��  
$str
��! +
,
��+ ,
$str
��- 5
}
��6 7
)
��7 8
;
��8 9
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� .
,
��. /
table
�� 
:
�� 
$str
�� %
,
��% &
column
�� 
:
�� 
$str
��  
)
��  !
;
��! "
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 7
,
��7 8
table
�� 
:
�� 
$str
�� %
,
��% &
columns
�� 
:
�� 
new
�� 
[
�� 
]
�� 
{
��  
$str
��! +
,
��+ ,
$str
��- 5
}
��6 7
)
��7 8
;
��8 9
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 7
,
��7 8
table
�� 
:
�� 
$str
�� %
,
��% &
columns
�� 
:
�� 
new
�� 
[
�� 
]
�� 
{
��  
$str
��! +
,
��+ ,
$str
��- 5
}
��6 7
)
��7 8
;
��8 9
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� /
,
��/ 0
table
�� 
:
�� 
$str
�� &
,
��& '
column
�� 
:
�� 
$str
��  
)
��  !
;
��! "
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 8
,
��8 9
table
�� 
:
�� 
$str
�� &
,
��& '
columns
�� 
:
�� 
new
�� 
[
�� 
]
�� 
{
��  
$str
��! +
,
��+ ,
$str
��- 5
}
��6 7
)
��7 8
;
��8 9
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� D
,
��D E
table
�� 
:
�� 
$str
�� *
,
��* +
columns
�� 
:
�� 
new
�� 
[
�� 
]
�� 
{
��  
$str
��! .
,
��. /
$str
��0 =
}
��> ?
)
��? @
;
��@ A
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� -
,
��- .
table
�� 
:
�� 
$str
�� $
,
��$ %
column
�� 
:
�� 
$str
��  
)
��  !
;
��! "
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 4
,
��4 5
table
�� 
:
�� 
$str
�� $
,
��$ %
columns
�� 
:
�� 
new
�� 
[
�� 
]
�� 
{
��  
$str
��! +
,
��+ ,
$str
��- 3
}
��4 5
)
��5 6
;
��6 7
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 5
,
��5 6
table
�� 
:
�� 
$str
�� %
,
��% &
columns
�� 
:
�� 
new
�� 
[
�� 
]
�� 
{
��  
$str
��! +
,
��+ ,
$str
��- 3
}
��4 5
)
��5 6
;
��6 7
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� L
,
��L M
table
�� 
:
�� 
$str
�� )
,
��) *
columns
�� 
:
�� 
new
�� 
[
�� 
]
�� 
{
��  
$str
��! +
,
��+ ,
$str
��- 5
,
��5 6
$str
��7 E
,
��E F
$str
��G L
}
��M N
)
��N O
;
��O P
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� g
,
��g h
table
�� 
:
�� 
$str
�� 5
,
��5 6
columns
�� 
:
�� 
new
�� 
[
�� 
]
�� 
{
��  
$str
��! 3
,
��3 4
$str
��5 E
,
��E F
$str
��G Q
,
��Q R
$str
��S [
}
��\ ]
)
��] ^
;
��^ _
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� p
,
��p q
table
�� 
:
�� 
$str
�� 5
,
��5 6
columns
�� 
:
�� 
new
�� 
[
�� 
]
�� 
{
��  
$str
��! +
,
��+ ,
$str
��- ?
,
��? @
$str
��A Q
,
��Q R
$str
��S ]
,
��] ^
$str
��_ g
}
��h i
)
��i j
;
��j k
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� :
,
��: ;
table
�� 
:
�� 
$str
�� /
,
��/ 0
column
�� 
:
�� 
$str
�� "
)
��" #
;
��# $
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� I
,
��I J
table
�� 
:
�� 
$str
�� -
,
��- .
columns
�� 
:
�� 
new
�� 
[
�� 
]
�� 
{
��  
$str
��! )
,
��) *
$str
��+ 2
,
��2 3
$str
��4 B
}
��C D
)
��D E
;
��E F
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 8
,
��8 9
table
�� 
:
�� 
$str
�� -
,
��- .
column
�� 
:
�� 
$str
�� "
)
��" #
;
��# $
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� =
,
��= >
table
�� 
:
�� 
$str
�� -
,
��- .
columns
�� 
:
�� 
new
�� 
[
�� 
]
�� 
{
��  
$str
��! +
,
��+ ,
$str
��- 3
}
��4 5
)
��5 6
;
��6 7
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 1
,
��1 2
table
�� 
:
�� 
$str
�� !
,
��! "
column
�� 
:
�� 
$str
�� '
)
��' (
;
��( )
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 1
,
��1 2
table
�� 
:
�� 
$str
�� !
,
��! "
column
�� 
:
�� 
$str
�� '
)
��' (
;
��( )
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 6
,
��6 7
table
�� 
:
�� 
$str
�� !
,
��! "
column
�� 
:
�� 
$str
�� ,
)
��, -
;
��- .
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� ;
,
��; <
table
�� 
:
�� 
$str
�� !
,
��! "
columns
�� 
:
�� 
new
�� 
[
�� 
]
�� 
{
��  
$str
��! +
,
��+ ,
$str
��- =
}
��> ?
)
��? @
;
��@ A
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 1
,
��1 2
table
�� 
:
�� 
$str
�� !
,
��! "
column
�� 
:
�� 
$str
�� '
)
��' (
;
��( )
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 1
,
��1 2
table
�� 
:
�� 
$str
�� !
,
��! "
column
�� 
:
�� 
$str
�� '
)
��' (
;
��( )
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 6
,
��6 7
table
�� 
:
�� 
$str
�� !
,
��! "
column
�� 
:
�� 
$str
�� ,
)
��, -
;
��- .
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� C
,
��C D
table
�� 
:
�� 
$str
�� !
,
��! "
columns
�� 
:
�� 
new
�� 
[
�� 
]
�� 
{
��  
$str
��! +
,
��+ ,
$str
��- E
}
��F G
)
��G H
;
��H I
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� ?
,
��? @
table
�� 
:
�� 
$str
�� !
,
��! "
columns
�� 
:
�� 
new
�� 
[
�� 
]
�� 
{
��  
$str
��! +
,
��+ ,
$str
��- A
}
��B C
)
��C D
;
��D E
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 3
,
��3 4
table
�� 
:
�� 
$str
�� #
,
��# $
column
�� 
:
�� 
$str
�� '
)
��' (
;
��( )
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 3
,
��3 4
table
�� 
:
�� 
$str
�� #
,
��# $
column
�� 
:
�� 
$str
�� '
)
��' (
;
��( )
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� /
,
��/ 0
table
�� 
:
�� 
$str
�� #
,
��# $
column
�� 
:
�� 
$str
�� #
)
��# $
;
��$ %
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 8
,
��8 9
table
�� 
:
�� 
$str
�� #
,
��# $
column
�� 
:
�� 
$str
�� ,
)
��, -
;
��- .
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 1
,
��1 2
table
�� 
:
�� 
$str
�� #
,
��# $
column
�� 
:
�� 
$str
�� %
)
��% &
;
��& '
}
�� 	
	protected
�� 
override
�� 
void
�� 
Down
��  $
(
��$ %
MigrationBuilder
��% 5
migrationBuilder
��6 F
)
��F G
{
�� 	
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� #
)
��# $
;
��$ %
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� $
)
��$ %
;
��% &
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� &
)
��& '
;
��' (
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� %
)
��% &
;
��& '
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� '
)
��' (
;
��( )
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� %
)
��% &
;
��& '
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� %
)
��% &
;
��& '
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� ,
)
��, -
;
��- .
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� 0
)
��0 1
;
��1 2
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� $
)
��$ %
;
��% &
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� %
)
��% &
;
��& '
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� )
)
��) *
;
��* +
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� #
)
��# $
;
��$ %
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� $
)
��$ %
;
��% &
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� (
)
��( )
;
��) *
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� (
)
��( )
;
��) *
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� 4
)
��4 5
;
��5 6
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� .
)
��. /
;
��/ 0
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� ,
)
��, -
;
��- .
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� ,
)
��, -
;
��- .
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� "
)
��" #
;
��# $
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
��  
)
��  !
;
��! "
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� #
)
��# $
;
��$ %
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
��  
)
��  !
;
��! "
}
�� 	
}
�� 
}�� ��
mF:\Code\GitHub\docker\src\AnBook.EntityFrameworkCore\Migrations\20170424115119_Initial_Migrations.Designer.cs
	namespace 	
AnBook
 
. 

Migrations 
{		 
[

 
	DbContext

 
(

 
typeof

 
(

 
AnBookDbContext

 %
)

% &
)

& '
]

' (
[ 
	Migration 
( 
$str 2
)2 3
]3 4
partial 
class 
Initial_Migrations $
{
	protected 
override 
void 
BuildTargetModel  0
(0 1
ModelBuilder1 =
modelBuilder> J
)J K
{ 	
modelBuilder 
. 

( 
$str /
,/ 0
$str1 8
)8 9
. 

( 
$str B
,B C,
 SqlServerValueGenerationStrategyD d
.d e
IdentityColumne s
)s t
;t u
modelBuilder 
. 
Entity 
(  
$str  B
,B C
bD E
=>F H
{ 
b 
. 
Property 
< 
int "
>" #
(# $
$str$ (
)( )
. 
ValueGeneratedOnAdd ,
(, -
)- .
;. /
b 
. 
Property 
< 
DateTime '
>' (
(( )
$str) 7
)7 8
;8 9
b 
. 
Property 
< 
long #
?# $
>$ %
(% &
$str& 5
)5 6
;6 7
b 
. 
Property 
< 
long #
?# $
>$ %
(% &
$str& 5
)5 6
;6 7
b 
. 
Property 
< 
DateTime '
?' (
>( )
() *
$str* 8
)8 9
;9 :
b!! 
.!! 
Property!! 
<!! 
string!! %
>!!% &
(!!& '
$str!!' 4
)!!4 5
."" 

IsRequired"" #
(""# $
)""$ %
.## 
HasMaxLength## %
(##% &
$num##& (
)##( )
;##) *
b%% 
.%% 
Property%% 
<%% 
bool%% #
>%%# $
(%%$ %
$str%%% 0
)%%0 1
;%%1 2
b'' 
.'' 
Property'' 
<'' 
DateTime'' '
?''' (
>''( )
('') *
$str''* @
)''@ A
;''A B
b)) 
.)) 
Property)) 
<)) 
long)) #
?))# $
>))$ %
())% &
$str))& :
))): ;
;)); <
b++ 
.++ 
Property++ 
<++ 
string++ %
>++% &
(++& '
$str++' -
)++- .
.,, 

IsRequired,, #
(,,# $
),,$ %
.-- 
HasMaxLength-- %
(--% &
$num--& (
)--( )
;--) *
b// 
.// 
HasKey// 
(// 
$str// !
)//! "
;//" #
b11 
.11 
ToTable11 
(11 
$str11 +
)11+ ,
;11, -
}22 
)22 
;22 
modelBuilder44 
.44 
Entity44 
(44  
$str44  I
,44I J
b44K L
=>44M O
{55 
b66 
.66 
Property66 
<66 
long66 #
>66# $
(66$ %
$str66% )
)66) *
.77 
ValueGeneratedOnAdd77 ,
(77, -
)77- .
;77. /
b99 
.99 
Property99 
<99 
DateTime99 '
>99' (
(99( )
$str99) 7
)997 8
;998 9
b;; 
.;; 
Property;; 
<;; 
long;; #
?;;# $
>;;$ %
(;;% &
$str;;& 5
);;5 6
;;;6 7
b== 
.== 
Property== 
<== 
string== %
>==% &
(==& '
$str==' 6
)==6 7
.>> 

IsRequired>> #
(>># $
)>>$ %
;>>% &
b@@ 
.@@ 
Property@@ 
<@@ 
string@@ %
>@@% &
(@@& '
$str@@' -
)@@- .
.AA 

IsRequiredAA #
(AA# $
)AA$ %
.BB 
HasMaxLengthBB %
(BB% &
$numBB& )
)BB) *
;BB* +
bDD 
.DD 
PropertyDD 
<DD 
stringDD %
>DD% &
(DD& '
$strDD' .
)DD. /
.EE 

IsRequiredEE #
(EE# $
)EE$ %
.FF 
HasMaxLengthFF %
(FF% &
$numFF& *
)FF* +
;FF+ ,
bHH 
.HH 
HasKeyHH 
(HH 
$strHH !
)HH! "
;HH" #
bJJ 
.JJ 
ToTableJJ 
(JJ 
$strJJ +
)JJ+ ,
;JJ, -
bLL 
.LL 
HasDiscriminatorLL &
<LL& '
stringLL' -
>LL- .
(LL. /
$strLL/ >
)LL> ?
.LL? @
HasValueLL@ H
(LLH I
$strLLI Y
)LLY Z
;LLZ [
}MM 
)MM 
;MM 
modelBuilderOO 
.OO 
EntityOO 
(OO  
$strOO  7
,OO7 8
bOO9 :
=>OO; =
{PP 
bQQ 
.QQ 
PropertyQQ 
<QQ 
longQQ #
>QQ# $
(QQ$ %
$strQQ% )
)QQ) *
.RR 
ValueGeneratedOnAddRR ,
(RR, -
)RR- .
;RR. /
bTT 
.TT 
PropertyTT 
<TT 
stringTT %
>TT% &
(TT& '
$strTT' 4
)TT4 5
.UU 
HasMaxLengthUU %
(UU% &
$numUU& )
)UU) *
;UU* +
bWW 
.WW 
PropertyWW 
<WW 
stringWW %
>WW% &
(WW& '
$strWW' 8
)WW8 9
.XX 
HasMaxLengthXX %
(XX% &
$numXX& (
)XX( )
;XX) *
bZZ 
.ZZ 
PropertyZZ 
<ZZ 
stringZZ %
>ZZ% &
(ZZ& '
$strZZ' 3
)ZZ3 4
.[[ 
HasMaxLength[[ %
([[% &
$num[[& )
)[[) *
;[[* +
b]] 
.]] 
Property]] 
<]] 
string]] %
>]]% &
(]]& '
$str]]' 3
)]]3 4
.^^ 
HasMaxLength^^ %
(^^% &
$num^^& *
)^^* +
;^^+ ,
b`` 
.`` 
Property`` 
<`` 
string`` %
>``% &
(``& '
$str``' 2
)``2 3
.aa 
HasMaxLengthaa %
(aa% &
$numaa& *
)aa* +
;aa+ ,
bcc 
.cc 
Propertycc 
<cc 
intcc "
>cc" #
(cc# $
$strcc$ 7
)cc7 8
;cc8 9
bee 
.ee 
Propertyee 
<ee 
DateTimeee '
>ee' (
(ee( )
$stree) 8
)ee8 9
;ee9 :
bgg 
.gg 
Propertygg 
<gg 
intgg "
?gg" #
>gg# $
(gg$ %
$strgg% ;
)gg; <
;gg< =
bii 
.ii 
Propertyii 
<ii 
longii #
?ii# $
>ii$ %
(ii% &
$strii& :
)ii: ;
;ii; <
bkk 
.kk 
Propertykk 
<kk 
stringkk %
>kk% &
(kk& '
$strkk' 3
)kk3 4
.ll 
HasMaxLengthll %
(ll% &
$numll& )
)ll) *
;ll* +
bnn 
.nn 
Propertynn 
<nn 
stringnn %
>nn% &
(nn& '
$strnn' 3
)nn3 4
.oo 
HasMaxLengthoo %
(oo% &
$numoo& *
)oo* +
;oo+ ,
bqq 
.qq 
Propertyqq 
<qq 
stringqq %
>qq% &
(qq& '
$strqq' 4
)qq4 5
.rr 
HasMaxLengthrr %
(rr% &
$numrr& )
)rr) *
;rr* +
btt 
.tt 
Propertytt 
<tt 
inttt "
?tt" #
>tt# $
(tt$ %
$strtt% /
)tt/ 0
;tt0 1
bvv 
.vv 
Propertyvv 
<vv 
longvv #
?vv# $
>vv$ %
(vv% &
$strvv& .
)vv. /
;vv/ 0
bxx 
.xx 
HasKeyxx 
(xx 
$strxx !
)xx! "
;xx" #
bzz 
.zz 
HasIndexzz 
(zz 
$strzz )
,zz) *
$strzz+ >
)zz> ?
;zz? @
b|| 
.|| 
HasIndex|| 
(|| 
$str|| )
,||) *
$str||+ :
)||: ;
;||; <
b~~ 
.~~ 
HasIndex~~ 
(~~ 
$str~~ )
,~~) *
$str~~+ 3
)~~3 4
;~~4 5
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� ,
)
��, -
;
��- .
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  E
,
��E F
b
��G H
=>
��I K
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 6
)
��6 7
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
;
��% &
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 1
)
��1 2
;
��2 3
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasDiscriminator
�� &
<
��& '
string
��' -
>
��- .
(
��. /
$str
��/ >
)
��> ?
.
��? @
HasValue
��@ H
(
��H I
$str
��I \
)
��\ ]
;
��] ^
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 2
)
��2 3
;
��3 4
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 3
)
��3 4
;
��4 5
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ ,
)
��, -
;
��- .
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 6
)
��6 7
;
��7 8
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� -
)
��- .
;
��. /
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  E
,
��E F
b
��G H
=>
��I K
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 8
)
��8 9
;
��9 :
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 9
)
��9 :
;
��: ;
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* @
)
��@ A
;
��A B
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 2
)
��2 3
;
��3 4
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 1
)
��1 2
;
��2 3
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� -
)
��- .
;
��. /
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
)
��) *
;
��* +
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 9
)
��9 :
;
��: ;
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
)
��3 4
;
��4 5
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 5
)
��5 6
;
��6 7
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� /
)
��/ 0
;
��0 1
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 2
)
��2 3
;
��3 4
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 3
)
��3 4
;
��4 5
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 6
)
��6 7
;
��7 8
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� -
)
��- .
;
��. /
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 6
)
��6 7
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
)
��3 4
;
��4 5
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ :
,
��: ;
$str
��< I
)
��I J
;
��J K
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� -
)
��- .
;
��. /
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  J
,
��J K
b
��L M
=>
��N P
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 8
)
��8 9
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 3
)
��3 4
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
byte
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& .
)
��. /
;
��/ 0
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' ?
)
��? @
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
,
��' (
$str
��) 3
)
��3 4
;
��4 5
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� ,
,
��, -
$str
��. F
,
��F G
$str
��H P
)
��P Q
;
��Q R
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 4
)
��4 5
;
��5 6
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  N
,
��N O
b
��P Q
=>
��R T
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% 9
)
��9 :
;
��: ;
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ ?
)
��? @
;
��@ A
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
)
��3 4
;
��4 5
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  B
,
��B C
b
��D E
=>
��F H
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ ,
)
��, -
;
��- .
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
)
��3 4
;
��4 5
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
)
��3 4
;
��4 5
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� ,
)
��, -
;
��- .
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 6
)
��6 7
;
��7 8
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
)
��3 4
;
��4 5
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� -
)
��- .
;
��. /
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  F
,
��F G
b
��H I
=>
��J L
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 2
)
��2 3
;
��3 4
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 0
)
��0 1
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 0
)
��0 1
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 6
)
��6 7
;
��7 8
b
�� 
.
�� 
Property
�� 
<
�� 
byte
�� #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
short
�� $
>
��$ %
(
��% &
$str
��& 0
)
��0 1
;
��1 2
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� ,
,
��, -
$str
��. ;
)
��; <
;
��< =
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 1
)
��1 2
;
��2 3
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  ;
,
��; <
b
��= >
=>
��? A
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* @
)
��@ A
;
��A B
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& .
)
��. /
;
��/ 0
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' .
)
��. /
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& *
)
��* +
;
��+ ,
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 1
)
��1 2
;
��2 3
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� +
)
��+ ,
;
��, -
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  F
,
��F G
b
��H I
=>
��J L
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ (
)
��( )
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 8
)
��8 9
;
��9 :
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* @
)
��@ A
;
��A B
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 1
)
��1 2
;
��2 3
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� ,
)
��, -
;
��- .
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  J
,
��J K
b
��L M
=>
��N P
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' ,
)
��, -
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 5
)
��5 6
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* @
)
��@ A
;
��A B
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' /
)
��/ 0
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' .
)
��. /
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
,
��3 4
$str
��5 C
,
��C D
$str
��E J
)
��J K
;
��K L
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 0
)
��0 1
;
��1 2
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  D
,
��D E
b
��F G
=>
��H J
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
Guid
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 5
)
��5 6
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 1
)
��1 2
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' H
)
��H I
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 7
)
��7 8
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 8
)
��8 9
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& ,
)
��, -
;
��- .
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 9
)
��9 :
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
byte
�� #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 2
)
��2 3
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& ,
)
��, -
;
��- .
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 0
)
��0 1
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& ,
)
��, -
;
��- .
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 0
)
��0 1
;
��1 2
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  P
,
��P Q
b
��R S
=>
��T V
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
Guid
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 1
)
��1 2
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' H
)
��H I
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 7
)
��7 8
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 9
)
��9 :
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� 1
,
��1 2
$str
��3 C
,
��C D
$str
��E O
,
��O P
$str
��Q Y
)
��Y Z
;
��Z [
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ =
,
��= >
$str
��? O
,
��O P
$str
��Q [
,
��[ \
$str
��] e
)
��e f
;
��f g
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� <
)
��< =
;
��= >
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  J
,
��J K
b
��L M
=>
��N P
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
Guid
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 5
)
��5 6
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 1
)
��1 2
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' H
)
��H I
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 7
)
��7 8
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 9
)
��9 :
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
byte
�� #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
)
��) *
;
��* +
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 6
)
��6 7
;
��7 8
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  H
,
��H I
b
��J K
=>
��L N
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
Guid
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ +
)
��+ ,
;
��, -
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
Guid
�� #
>
��# $
(
��$ %
$str
��% ;
)
��; <
;
��< =
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
,
��' (
$str
��) 0
,
��0 1
$str
��2 @
)
��@ A
;
��A B
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 4
)
��4 5
;
��5 6
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  D
,
��D E
b
��F G
=>
��H J
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 8
)
��8 9
;
��9 :
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* @
)
��@ A
;
��A B
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
)
��) *
;
��* +
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 1
)
��1 2
;
��2 3
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 4
)
��4 5
;
��5 6
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  A
,
��A B
b
��C D
=>
��E G
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ (
)
��( )
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 9
)
��9 :
.
��  
IsConcurrencyToken
�� +
(
��+ ,
)
��, -
;
��- .
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 8
)
��8 9
;
��9 :
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* @
)
��@ A
;
��A B
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 7
)
��7 8
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� 3
)
��3 4
;
��4 5
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ ;
)
��; <
;
��< =
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� (
)
��( )
;
��) *
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  A
,
��A B
b
��C D
=>
��E G
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' =
)
��= >
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 9
)
��9 :
.
��  
IsConcurrencyToken
�� +
(
��+ ,
)
��, -
;
��- .
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 8
)
��8 9
;
��9 :
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 5
)
��5 6
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' >
)
��> ?
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% =
)
��= >
;
��> ?
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 9
)
��9 :
;
��: ;
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 9
)
��9 :
;
��: ;
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* @
)
��@ A
;
��A B
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* =
)
��= >
;
��> ?
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' ?
)
��? @
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' ;
)
��; <
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 1
)
��1 2
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' :
)
��: ;
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
;
��5 6
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 6
)
��6 7
;
��7 8
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 0
)
��0 1
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 1
)
��1 2
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� 3
)
��3 4
;
��4 5
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ C
)
��C D
;
��D E
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ ?
)
��? @
;
��@ A
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� (
)
��( )
;
��) *
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  <
,
��< =
b
��> ?
=>
��@ B
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ (
)
��( )
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 9
)
��9 :
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& *
)
��* +
;
��+ ,
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 8
)
��8 9
;
��9 :
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* @
)
��@ A
;
��A B
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� *
)
��* +
;
��+ ,
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� 3
)
��3 4
;
��4 5
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� ,
)
��, -
;
��- .
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� *
)
��* +
;
��+ ,
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  P
,
��P Q
b
��R S
=>
��T V
{
�� 
b
�� 
.
�� 
HasBaseType
�� !
(
��! "
$str
��" K
)
��K L
;
��L M
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ /
)
��/ 0
;
��0 1
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� *
,
��* +
$str
��, 2
)
��2 3
;
��3 4
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� +
)
��+ ,
;
��, -
b
�� 
.
�� 
HasDiscriminator
�� &
(
��& '
)
��' (
.
��( )
HasValue
��) 1
(
��1 2
$str
��2 I
)
��I J
;
��J K
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  G
,
��G H
b
��I J
=>
��K M
{
�� 
b
�� 
.
�� 
HasBaseType
�� !
(
��! "
$str
��" K
)
��K L
;
��L M
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 1
)
��1 2
;
��2 3
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� +
)
��+ ,
;
��, -
b
�� 
.
�� 
HasDiscriminator
�� &
(
��& '
)
��' (
.
��( )
HasValue
��) 1
(
��1 2
$str
��2 H
)
��H I
;
��I J
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  O
,
��O P
b
��Q R
=>
��S U
{
�� 
b
�� 
.
�� 
HasBaseType
�� !
(
��! "
$str
��" G
)
��G H
;
��H I
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ ,
)
��, -
;
��- .
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasDiscriminator
�� &
(
��& '
)
��' (
.
��( )
HasValue
��) 1
(
��1 2
$str
��2 I
)
��I J
;
��J K
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  O
,
��O P
b
��Q R
=>
��S U
{
�� 
b
�� 
.
�� 
HasBaseType
�� !
(
��! "
$str
��" G
)
��G H
;
��H I
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasDiscriminator
�� &
(
��& '
)
��' (
.
��( )
HasValue
��) 1
(
��1 2
$str
��2 I
)
��I J
;
��J K
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
)
��> ?
.
�� 
WithMany
�� !
(
��! "
$str
��" *
)
��* +
.
�� 

�� &
(
��& '
$str
��' /
)
��/ 0
;
��0 1
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
)
��> ?
.
�� 
WithMany
�� !
(
��! "
$str
��" *
)
��* +
.
�� 

�� &
(
��& '
$str
��' /
)
��/ 0
.
�� 
OnDelete
�� !
(
��! "
DeleteBehavior
��" 0
.
��0 1
Cascade
��1 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
)
��> ?
.
�� 
WithMany
�� !
(
��! "
$str
��" *
)
��* +
.
�� 

�� &
(
��& '
$str
��' /
)
��/ 0
.
�� 
OnDelete
�� !
(
��! "
DeleteBehavior
��" 0
.
��0 1
Cascade
��1 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  B
,
��B C
b
��D E
=>
��F H
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
)
��> ?
.
�� 
WithMany
�� !
(
��! "
$str
��" )
)
��) *
.
�� 

�� &
(
��& '
$str
��' /
)
��/ 0
.
�� 
OnDelete
�� !
(
��! "
DeleteBehavior
��" 0
.
��0 1
Cascade
��1 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
)
��> ?
.
�� 
WithMany
�� !
(
��! "
$str
��" *
)
��* +
.
�� 

�� &
(
��& '
$str
��' /
)
��/ 0
.
�� 
OnDelete
�� !
(
��! "
DeleteBehavior
��" 0
.
��0 1
Cascade
��1 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  ;
,
��; <
b
��= >
=>
��? A
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
)
��> ?
.
�� 
WithMany
�� !
(
��! "
$str
��" ,
)
��, -
.
�� 

�� &
(
��& '
$str
��' /
)
��/ 0
;
��0 1
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  D
,
��D E
b
��F G
=>
��H J
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� A
,
��A B
$str
��C K
)
��K L
.
�� 
WithMany
�� !
(
��! "
$str
��" ,
)
��, -
.
�� 

�� &
(
��& '
$str
��' 1
)
��1 2
;
��2 3
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  A
,
��A B
b
��C D
=>
��E G
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
,
��> ?
$str
��@ M
)
��M N
.
�� 
WithMany
�� !
(
��! "
)
��" #
.
�� 

�� &
(
��& '
$str
��' 6
)
��6 7
;
��7 8
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
,
��> ?
$str
��@ M
)
��M N
.
�� 
WithMany
�� !
(
��! "
)
��" #
.
�� 

�� &
(
��& '
$str
��' 6
)
��6 7
;
��7 8
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
,
��> ?
$str
��@ R
)
��R S
.
�� 
WithMany
�� !
(
��! "
)
��" #
.
�� 

�� &
(
��& '
$str
��' ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  A
,
��A B
b
��C D
=>
��E G
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
,
��> ?
$str
��@ M
)
��M N
.
�� 
WithMany
�� !
(
��! "
)
��" #
.
�� 

�� &
(
��& '
$str
��' 6
)
��6 7
;
��7 8
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
,
��> ?
$str
��@ M
)
��M N
.
�� 
WithMany
�� !
(
��! "
)
��" #
.
�� 

�� &
(
��& '
$str
��' 6
)
��6 7
;
��7 8
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
,
��> ?
$str
��@ R
)
��R S
.
�� 
WithMany
�� !
(
��! "
)
��" #
.
�� 

�� &
(
��& '
$str
��' ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  <
,
��< =
b
��> ?
=>
��@ B
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
,
��> ?
$str
��@ M
)
��M N
.
�� 
WithMany
�� !
(
��! "
)
��" #
.
�� 

�� &
(
��& '
$str
��' 6
)
��6 7
;
��7 8
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
,
��> ?
$str
��@ M
)
��M N
.
�� 
WithMany
�� !
(
��! "
)
��" #
.
�� 

�� &
(
��& '
$str
��' 6
)
��6 7
;
��7 8
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� ?
,
��? @
$str
��A J
)
��J K
.
�� 
WithMany
�� !
(
��! "
)
��" #
.
�� 

�� &
(
��& '
$str
��' 2
)
��2 3
;
��3 4
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
,
��> ?
$str
��@ R
)
��R S
.
�� 
WithMany
�� !
(
��! "
)
��" #
.
�� 

�� &
(
��& '
$str
��' ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  P
,
��P Q
b
��R S
=>
��T V
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� ?
,
��? @
$str
��A J
)
��J K
.
�� 
WithMany
�� !
(
��! "
)
��" #
.
�� 

�� &
(
��& '
$str
��' 2
)
��2 3
.
�� 
OnDelete
�� !
(
��! "
DeleteBehavior
��" 0
.
��0 1
Cascade
��1 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  O
,
��O P
b
��Q R
=>
��S U
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
)
��> ?
.
�� 
WithMany
�� !
(
��! "
$str
��" /
)
��/ 0
.
�� 

�� &
(
��& '
$str
��' /
)
��/ 0
.
�� 
OnDelete
�� !
(
��! "
DeleteBehavior
��" 0
.
��0 1
Cascade
��1 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  O
,
��O P
b
��Q R
=>
��S U
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
)
��> ?
.
�� 
WithMany
�� !
(
��! "
$str
��" /
)
��/ 0
.
�� 

�� &
(
��& '
$str
��' /
)
��/ 0
.
�� 
OnDelete
�� !
(
��! "
DeleteBehavior
��" 0
.
��0 1
Cascade
��1 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
}
�� 	
}
�� 
}�� � 
gF:\Code\GitHub\docker\src\AnBook.EntityFrameworkCore\Migrations\20170608053244_Upgraded_To_Abp_2_1_0.cs
	namespace 	
AnBook
 
. 

Migrations 
{ 
public 

partial 
class !
Upgraded_To_Abp_2_1_0 .
:/ 0
	Migration1 :
{ 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder		 
.		 
DropForeignKey		 +
(		+ ,
name

 
:

 
$str

 8
,

8 9
table 
: 
$str &
)& '
;' (
migrationBuilder
.
	DropIndex
(
name 
: 
$str /
,/ 0
table 
: 
$str &
)& '
;' (
migrationBuilder 
. 

DropColumn '
(' (
name 
: 
$str 
, 
table 
: 
$str &
)& '
;' (
migrationBuilder 
. 
	AddColumn &
<& '
bool' +
>+ ,
(, -
name 
: 
$str "
," #
table 
: 
$str %
,% &
nullable 
: 
false 
,  
defaultValue 
: 
false #
)# $
;$ %
migrationBuilder 
. 

(* +
name 
: 
$str 8
,8 9
table 
: 
$str &
,& '
column 
: 
$str  
,  !
principalTable 
: 
$str  *
,* +
principalColumn   
:    
$str  ! %
,  % &
onDelete!! 
:!! 
ReferentialAction!! +
.!!+ ,
Cascade!!, 3
)!!3 4
;!!4 5
}"" 	
	protected$$ 
override$$ 
void$$ 
Down$$  $
($$$ %
MigrationBuilder$$% 5
migrationBuilder$$6 F
)$$F G
{%% 	
migrationBuilder&& 
.&& 
DropForeignKey&& +
(&&+ ,
name'' 
:'' 
$str'' 8
,''8 9
table(( 
:(( 
$str(( &
)((& '
;((' (
migrationBuilder** 
.** 

DropColumn** '
(**' (
name++ 
:++ 
$str++ "
,++" #
table,, 
:,, 
$str,, %
),,% &
;,,& '
migrationBuilder.. 
... 
	AddColumn.. &
<..& '
int..' *
>..* +
(..+ ,
name// 
:// 
$str// 
,// 
table00 
:00 
$str00 &
,00& '
nullable11 
:11 
true11 
)11 
;11  
migrationBuilder33 
.33 
CreateIndex33 (
(33( )
name44 
:44 
$str44 /
,44/ 0
table55 
:55 
$str55 &
,55& '
column66 
:66 
$str66  
)66  !
;66! "
migrationBuilder88 
.88 

(88* +
name99 
:99 
$str99 8
,998 9
table:: 
::: 
$str:: &
,::& '
column;; 
:;; 
$str;;  
,;;  !
principalTable<< 
:<< 
$str<<  *
,<<* +
principalColumn== 
:==  
$str==! %
,==% &
onDelete>> 
:>> 
ReferentialAction>> +
.>>+ ,
Restrict>>, 4
)>>4 5
;>>5 6
}?? 	
}@@ 
}AA ��
pF:\Code\GitHub\docker\src\AnBook.EntityFrameworkCore\Migrations\20170608053244_Upgraded_To_Abp_2_1_0.Designer.cs
	namespace 	
AnBook
 
. 

Migrations 
{		 
[

 
	DbContext

 
(

 
typeof

 
(

 
AnBookDbContext

 %
)

% &
)

& '
]

' (
[ 
	Migration 
( 
$str 5
)5 6
]6 7
partial 
class !
Upgraded_To_Abp_2_1_0 '
{
	protected 
override 
void 
BuildTargetModel  0
(0 1
ModelBuilder1 =
modelBuilder> J
)J K
{ 	
modelBuilder 
. 

( 
$str /
,/ 0
$str1 8
)8 9
. 

( 
$str B
,B C,
 SqlServerValueGenerationStrategyD d
.d e
IdentityColumne s
)s t
;t u
modelBuilder 
. 
Entity 
(  
$str  B
,B C
bD E
=>F H
{ 
b 
. 
Property 
< 
int "
>" #
(# $
$str$ (
)( )
. 
ValueGeneratedOnAdd ,
(, -
)- .
;. /
b 
. 
Property 
< 
DateTime '
>' (
(( )
$str) 7
)7 8
;8 9
b 
. 
Property 
< 
long #
?# $
>$ %
(% &
$str& 5
)5 6
;6 7
b 
. 
Property 
< 
long #
?# $
>$ %
(% &
$str& 5
)5 6
;6 7
b 
. 
Property 
< 
DateTime '
?' (
>( )
() *
$str* 8
)8 9
;9 :
b!! 
.!! 
Property!! 
<!! 
string!! %
>!!% &
(!!& '
$str!!' 4
)!!4 5
."" 

IsRequired"" #
(""# $
)""$ %
.## 
HasMaxLength## %
(##% &
$num##& (
)##( )
;##) *
b%% 
.%% 
Property%% 
<%% 
bool%% #
>%%# $
(%%$ %
$str%%% 0
)%%0 1
;%%1 2
b'' 
.'' 
Property'' 
<'' 
DateTime'' '
?''' (
>''( )
('') *
$str''* @
)''@ A
;''A B
b)) 
.)) 
Property)) 
<)) 
long)) #
?))# $
>))$ %
())% &
$str))& :
))): ;
;)); <
b++ 
.++ 
Property++ 
<++ 
string++ %
>++% &
(++& '
$str++' -
)++- .
.,, 

IsRequired,, #
(,,# $
),,$ %
.-- 
HasMaxLength-- %
(--% &
$num--& (
)--( )
;--) *
b// 
.// 
HasKey// 
(// 
$str// !
)//! "
;//" #
b11 
.11 
ToTable11 
(11 
$str11 +
)11+ ,
;11, -
}22 
)22 
;22 
modelBuilder44 
.44 
Entity44 
(44  
$str44  I
,44I J
b44K L
=>44M O
{55 
b66 
.66 
Property66 
<66 
long66 #
>66# $
(66$ %
$str66% )
)66) *
.77 
ValueGeneratedOnAdd77 ,
(77, -
)77- .
;77. /
b99 
.99 
Property99 
<99 
DateTime99 '
>99' (
(99( )
$str99) 7
)997 8
;998 9
b;; 
.;; 
Property;; 
<;; 
long;; #
?;;# $
>;;$ %
(;;% &
$str;;& 5
);;5 6
;;;6 7
b== 
.== 
Property== 
<== 
string== %
>==% &
(==& '
$str==' 6
)==6 7
.>> 

IsRequired>> #
(>># $
)>>$ %
;>>% &
b@@ 
.@@ 
Property@@ 
<@@ 
string@@ %
>@@% &
(@@& '
$str@@' -
)@@- .
.AA 

IsRequiredAA #
(AA# $
)AA$ %
.BB 
HasMaxLengthBB %
(BB% &
$numBB& )
)BB) *
;BB* +
bDD 
.DD 
PropertyDD 
<DD 
stringDD %
>DD% &
(DD& '
$strDD' .
)DD. /
.EE 

IsRequiredEE #
(EE# $
)EE$ %
.FF 
HasMaxLengthFF %
(FF% &
$numFF& *
)FF* +
;FF+ ,
bHH 
.HH 
HasKeyHH 
(HH 
$strHH !
)HH! "
;HH" #
bJJ 
.JJ 
ToTableJJ 
(JJ 
$strJJ +
)JJ+ ,
;JJ, -
bLL 
.LL 
HasDiscriminatorLL &
<LL& '
stringLL' -
>LL- .
(LL. /
$strLL/ >
)LL> ?
.LL? @
HasValueLL@ H
(LLH I
$strLLI Y
)LLY Z
;LLZ [
}MM 
)MM 
;MM 
modelBuilderOO 
.OO 
EntityOO 
(OO  
$strOO  7
,OO7 8
bOO9 :
=>OO; =
{PP 
bQQ 
.QQ 
PropertyQQ 
<QQ 
longQQ #
>QQ# $
(QQ$ %
$strQQ% )
)QQ) *
.RR 
ValueGeneratedOnAddRR ,
(RR, -
)RR- .
;RR. /
bTT 
.TT 
PropertyTT 
<TT 
stringTT %
>TT% &
(TT& '
$strTT' 4
)TT4 5
.UU 
HasMaxLengthUU %
(UU% &
$numUU& )
)UU) *
;UU* +
bWW 
.WW 
PropertyWW 
<WW 
stringWW %
>WW% &
(WW& '
$strWW' 8
)WW8 9
.XX 
HasMaxLengthXX %
(XX% &
$numXX& (
)XX( )
;XX) *
bZZ 
.ZZ 
PropertyZZ 
<ZZ 
stringZZ %
>ZZ% &
(ZZ& '
$strZZ' 3
)ZZ3 4
.[[ 
HasMaxLength[[ %
([[% &
$num[[& )
)[[) *
;[[* +
b]] 
.]] 
Property]] 
<]] 
string]] %
>]]% &
(]]& '
$str]]' 3
)]]3 4
.^^ 
HasMaxLength^^ %
(^^% &
$num^^& *
)^^* +
;^^+ ,
b`` 
.`` 
Property`` 
<`` 
string`` %
>``% &
(``& '
$str``' 2
)``2 3
.aa 
HasMaxLengthaa %
(aa% &
$numaa& *
)aa* +
;aa+ ,
bcc 
.cc 
Propertycc 
<cc 
intcc "
>cc" #
(cc# $
$strcc$ 7
)cc7 8
;cc8 9
bee 
.ee 
Propertyee 
<ee 
DateTimeee '
>ee' (
(ee( )
$stree) 8
)ee8 9
;ee9 :
bgg 
.gg 
Propertygg 
<gg 
intgg "
?gg" #
>gg# $
(gg$ %
$strgg% ;
)gg; <
;gg< =
bii 
.ii 
Propertyii 
<ii 
longii #
?ii# $
>ii$ %
(ii% &
$strii& :
)ii: ;
;ii; <
bkk 
.kk 
Propertykk 
<kk 
stringkk %
>kk% &
(kk& '
$strkk' 3
)kk3 4
.ll 
HasMaxLengthll %
(ll% &
$numll& )
)ll) *
;ll* +
bnn 
.nn 
Propertynn 
<nn 
stringnn %
>nn% &
(nn& '
$strnn' 3
)nn3 4
.oo 
HasMaxLengthoo %
(oo% &
$numoo& *
)oo* +
;oo+ ,
bqq 
.qq 
Propertyqq 
<qq 
stringqq %
>qq% &
(qq& '
$strqq' 4
)qq4 5
.rr 
HasMaxLengthrr %
(rr% &
$numrr& )
)rr) *
;rr* +
btt 
.tt 
Propertytt 
<tt 
inttt "
?tt" #
>tt# $
(tt$ %
$strtt% /
)tt/ 0
;tt0 1
bvv 
.vv 
Propertyvv 
<vv 
longvv #
?vv# $
>vv$ %
(vv% &
$strvv& .
)vv. /
;vv/ 0
bxx 
.xx 
HasKeyxx 
(xx 
$strxx !
)xx! "
;xx" #
bzz 
.zz 
HasIndexzz 
(zz 
$strzz )
,zz) *
$strzz+ >
)zz> ?
;zz? @
b|| 
.|| 
HasIndex|| 
(|| 
$str|| )
,||) *
$str||+ :
)||: ;
;||; <
b~~ 
.~~ 
HasIndex~~ 
(~~ 
$str~~ )
,~~) *
$str~~+ 3
)~~3 4
;~~4 5
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� ,
)
��, -
;
��- .
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  E
,
��E F
b
��G H
=>
��I K
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 6
)
��6 7
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
;
��% &
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 1
)
��1 2
;
��2 3
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasDiscriminator
�� &
<
��& '
string
��' -
>
��- .
(
��. /
$str
��/ >
)
��> ?
.
��? @
HasValue
��@ H
(
��H I
$str
��I \
)
��\ ]
;
��] ^
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 2
)
��2 3
;
��3 4
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 3
)
��3 4
;
��4 5
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ ,
)
��, -
;
��- .
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 6
)
��6 7
;
��7 8
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� -
)
��- .
;
��. /
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  E
,
��E F
b
��G H
=>
��I K
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 8
)
��8 9
;
��9 :
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 9
)
��9 :
;
��: ;
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* @
)
��@ A
;
��A B
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 2
)
��2 3
;
��3 4
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 1
)
��1 2
;
��2 3
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� -
)
��- .
;
��. /
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
)
��) *
;
��* +
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 9
)
��9 :
;
��: ;
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
)
��3 4
;
��4 5
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 5
)
��5 6
;
��6 7
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� /
)
��/ 0
;
��0 1
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 2
)
��2 3
;
��3 4
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 3
)
��3 4
;
��4 5
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 6
)
��6 7
;
��7 8
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� -
)
��- .
;
��. /
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 6
)
��6 7
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
)
��3 4
;
��4 5
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ :
,
��: ;
$str
��< I
)
��I J
;
��J K
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� -
)
��- .
;
��. /
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  J
,
��J K
b
��L M
=>
��N P
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 8
)
��8 9
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 3
)
��3 4
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
byte
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& .
)
��. /
;
��/ 0
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' ?
)
��? @
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
,
��' (
$str
��) 3
)
��3 4
;
��4 5
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� ,
,
��, -
$str
��. F
,
��F G
$str
��H P
)
��P Q
;
��Q R
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 4
)
��4 5
;
��5 6
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  N
,
��N O
b
��P Q
=>
��R T
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% 9
)
��9 :
;
��: ;
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ ?
)
��? @
;
��@ A
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
)
��3 4
;
��4 5
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  B
,
��B C
b
��D E
=>
��F H
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ ,
)
��, -
;
��- .
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
)
��3 4
;
��4 5
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
)
��3 4
;
��4 5
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� ,
)
��, -
;
��- .
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 6
)
��6 7
;
��7 8
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
)
��3 4
;
��4 5
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� -
)
��- .
;
��. /
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  F
,
��F G
b
��H I
=>
��J L
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 2
)
��2 3
;
��3 4
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 0
)
��0 1
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 0
)
��0 1
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 6
)
��6 7
;
��7 8
b
�� 
.
�� 
Property
�� 
<
�� 
byte
�� #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
short
�� $
>
��$ %
(
��% &
$str
��& 0
)
��0 1
;
��1 2
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� ,
,
��, -
$str
��. ;
)
��; <
;
��< =
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 1
)
��1 2
;
��2 3
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  ;
,
��; <
b
��= >
=>
��? A
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* @
)
��@ A
;
��A B
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& .
)
��. /
;
��/ 0
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' .
)
��. /
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& *
)
��* +
;
��+ ,
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 1
)
��1 2
;
��2 3
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� +
)
��+ ,
;
��, -
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  F
,
��F G
b
��H I
=>
��J L
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ (
)
��( )
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 8
)
��8 9
;
��9 :
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 1
)
��1 2
;
��2 3
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* @
)
��@ A
;
��A B
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 1
)
��1 2
;
��2 3
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� ,
)
��, -
;
��- .
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  J
,
��J K
b
��L M
=>
��N P
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' ,
)
��, -
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 5
)
��5 6
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* @
)
��@ A
;
��A B
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' /
)
��/ 0
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' .
)
��. /
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
,
��3 4
$str
��5 C
,
��C D
$str
��E J
)
��J K
;
��K L
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 0
)
��0 1
;
��1 2
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  D
,
��D E
b
��F G
=>
��H J
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
Guid
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 5
)
��5 6
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 1
)
��1 2
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' H
)
��H I
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 7
)
��7 8
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 8
)
��8 9
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& ,
)
��, -
;
��- .
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 9
)
��9 :
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
byte
�� #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 2
)
��2 3
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& ,
)
��, -
;
��- .
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 0
)
��0 1
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& ,
)
��, -
;
��- .
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 0
)
��0 1
;
��1 2
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  P
,
��P Q
b
��R S
=>
��T V
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
Guid
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 1
)
��1 2
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' H
)
��H I
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 7
)
��7 8
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 9
)
��9 :
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� 1
,
��1 2
$str
��3 C
,
��C D
$str
��E O
,
��O P
$str
��Q Y
)
��Y Z
;
��Z [
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ =
,
��= >
$str
��? O
,
��O P
$str
��Q [
,
��[ \
$str
��] e
)
��e f
;
��f g
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� <
)
��< =
;
��= >
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  J
,
��J K
b
��L M
=>
��N P
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
Guid
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 5
)
��5 6
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 1
)
��1 2
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' H
)
��H I
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 7
)
��7 8
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 9
)
��9 :
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
byte
�� #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
)
��) *
;
��* +
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 6
)
��6 7
;
��7 8
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  H
,
��H I
b
��J K
=>
��L N
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
Guid
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ +
)
��+ ,
;
��, -
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
Guid
�� #
>
��# $
(
��$ %
$str
��% ;
)
��; <
;
��< =
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
,
��' (
$str
��) 0
,
��0 1
$str
��2 @
)
��@ A
;
��A B
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 4
)
��4 5
;
��5 6
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  D
,
��D E
b
��F G
=>
��H J
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 8
)
��8 9
;
��9 :
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* @
)
��@ A
;
��A B
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
)
��) *
;
��* +
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 1
)
��1 2
;
��2 3
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 4
)
��4 5
;
��5 6
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  A
,
��A B
b
��C D
=>
��E G
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ (
)
��( )
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 9
)
��9 :
.
��  
IsConcurrencyToken
�� +
(
��+ ,
)
��, -
;
��- .
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 8
)
��8 9
;
��9 :
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* @
)
��@ A
;
��A B
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 7
)
��7 8
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� 3
)
��3 4
;
��4 5
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ ;
)
��; <
;
��< =
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� (
)
��( )
;
��) *
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  A
,
��A B
b
��C D
=>
��E G
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' =
)
��= >
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 9
)
��9 :
.
��  
IsConcurrencyToken
�� +
(
��+ ,
)
��, -
;
��- .
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 8
)
��8 9
;
��9 :
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 5
)
��5 6
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' >
)
��> ?
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% =
)
��= >
;
��> ?
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 9
)
��9 :
;
��: ;
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 9
)
��9 :
;
��: ;
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* @
)
��@ A
;
��A B
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* =
)
��= >
;
��> ?
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' ?
)
��? @
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' ;
)
��; <
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 1
)
��1 2
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' :
)
��: ;
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
;
��5 6
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 6
)
��6 7
;
��7 8
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 0
)
��0 1
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 1
)
��1 2
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� 3
)
��3 4
;
��4 5
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ C
)
��C D
;
��D E
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ ?
)
��? @
;
��@ A
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� (
)
��( )
;
��) *
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  <
,
��< =
b
��> ?
=>
��@ B
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ (
)
��( )
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 9
)
��9 :
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& *
)
��* +
;
��+ ,
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 8
)
��8 9
;
��9 :
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* @
)
��@ A
;
��A B
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� *
)
��* +
;
��+ ,
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� 3
)
��3 4
;
��4 5
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� ,
)
��, -
;
��- .
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� *
)
��* +
;
��+ ,
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  P
,
��P Q
b
��R S
=>
��T V
{
�� 
b
�� 
.
�� 
HasBaseType
�� !
(
��! "
$str
��" K
)
��K L
;
��L M
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ /
)
��/ 0
;
��0 1
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� *
,
��* +
$str
��, 2
)
��2 3
;
��3 4
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� +
)
��+ ,
;
��, -
b
�� 
.
�� 
HasDiscriminator
�� &
(
��& '
)
��' (
.
��( )
HasValue
��) 1
(
��1 2
$str
��2 I
)
��I J
;
��J K
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  G
,
��G H
b
��I J
=>
��K M
{
�� 
b
�� 
.
�� 
HasBaseType
�� !
(
��! "
$str
��" K
)
��K L
;
��L M
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 1
)
��1 2
;
��2 3
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� +
)
��+ ,
;
��, -
b
�� 
.
�� 
HasDiscriminator
�� &
(
��& '
)
��' (
.
��( )
HasValue
��) 1
(
��1 2
$str
��2 H
)
��H I
;
��I J
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  O
,
��O P
b
��Q R
=>
��S U
{
�� 
b
�� 
.
�� 
HasBaseType
�� !
(
��! "
$str
��" G
)
��G H
;
��H I
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ ,
)
��, -
;
��- .
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasDiscriminator
�� &
(
��& '
)
��' (
.
��( )
HasValue
��) 1
(
��1 2
$str
��2 I
)
��I J
;
��J K
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  O
,
��O P
b
��Q R
=>
��S U
{
�� 
b
�� 
.
�� 
HasBaseType
�� !
(
��! "
$str
��" G
)
��G H
;
��H I
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasDiscriminator
�� &
(
��& '
)
��' (
.
��( )
HasValue
��) 1
(
��1 2
$str
��2 I
)
��I J
;
��J K
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
)
��> ?
.
�� 
WithMany
�� !
(
��! "
$str
��" *
)
��* +
.
�� 

�� &
(
��& '
$str
��' /
)
��/ 0
.
�� 
OnDelete
�� !
(
��! "
DeleteBehavior
��" 0
.
��0 1
Cascade
��1 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
)
��> ?
.
�� 
WithMany
�� !
(
��! "
$str
��" *
)
��* +
.
�� 

�� &
(
��& '
$str
��' /
)
��/ 0
.
�� 
OnDelete
�� !
(
��! "
DeleteBehavior
��" 0
.
��0 1
Cascade
��1 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
)
��> ?
.
�� 
WithMany
�� !
(
��! "
$str
��" *
)
��* +
.
�� 

�� &
(
��& '
$str
��' /
)
��/ 0
.
�� 
OnDelete
�� !
(
��! "
DeleteBehavior
��" 0
.
��0 1
Cascade
��1 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  B
,
��B C
b
��D E
=>
��F H
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
)
��> ?
.
�� 
WithMany
�� !
(
��! "
$str
��" )
)
��) *
.
�� 

�� &
(
��& '
$str
��' /
)
��/ 0
.
�� 
OnDelete
�� !
(
��! "
DeleteBehavior
��" 0
.
��0 1
Cascade
��1 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
)
��> ?
.
�� 
WithMany
�� !
(
��! "
$str
��" *
)
��* +
.
�� 

�� &
(
��& '
$str
��' /
)
��/ 0
.
�� 
OnDelete
�� !
(
��! "
DeleteBehavior
��" 0
.
��0 1
Cascade
��1 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  ;
,
��; <
b
��= >
=>
��? A
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
)
��> ?
.
�� 
WithMany
�� !
(
��! "
$str
��" ,
)
��, -
.
�� 

�� &
(
��& '
$str
��' /
)
��/ 0
;
��0 1
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  D
,
��D E
b
��F G
=>
��H J
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� A
,
��A B
$str
��C K
)
��K L
.
�� 
WithMany
�� !
(
��! "
$str
��" ,
)
��, -
.
�� 

�� &
(
��& '
$str
��' 1
)
��1 2
;
��2 3
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  A
,
��A B
b
��C D
=>
��E G
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
,
��> ?
$str
��@ M
)
��M N
.
�� 
WithMany
�� !
(
��! "
)
��" #
.
�� 

�� &
(
��& '
$str
��' 6
)
��6 7
;
��7 8
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
,
��> ?
$str
��@ M
)
��M N
.
�� 
WithMany
�� !
(
��! "
)
��" #
.
�� 

�� &
(
��& '
$str
��' 6
)
��6 7
;
��7 8
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
,
��> ?
$str
��@ R
)
��R S
.
�� 
WithMany
�� !
(
��! "
)
��" #
.
�� 

�� &
(
��& '
$str
��' ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  A
,
��A B
b
��C D
=>
��E G
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
,
��> ?
$str
��@ M
)
��M N
.
�� 
WithMany
�� !
(
��! "
)
��" #
.
�� 

�� &
(
��& '
$str
��' 6
)
��6 7
;
��7 8
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
,
��> ?
$str
��@ M
)
��M N
.
�� 
WithMany
�� !
(
��! "
)
��" #
.
�� 

�� &
(
��& '
$str
��' 6
)
��6 7
;
��7 8
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
,
��> ?
$str
��@ R
)
��R S
.
�� 
WithMany
�� !
(
��! "
)
��" #
.
�� 

�� &
(
��& '
$str
��' ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  <
,
��< =
b
��> ?
=>
��@ B
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
,
��> ?
$str
��@ M
)
��M N
.
�� 
WithMany
�� !
(
��! "
)
��" #
.
�� 

�� &
(
��& '
$str
��' 6
)
��6 7
;
��7 8
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
,
��> ?
$str
��@ M
)
��M N
.
�� 
WithMany
�� !
(
��! "
)
��" #
.
�� 

�� &
(
��& '
$str
��' 6
)
��6 7
;
��7 8
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� ?
,
��? @
$str
��A J
)
��J K
.
�� 
WithMany
�� !
(
��! "
)
��" #
.
�� 

�� &
(
��& '
$str
��' 2
)
��2 3
;
��3 4
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
,
��> ?
$str
��@ R
)
��R S
.
�� 
WithMany
�� !
(
��! "
)
��" #
.
�� 

�� &
(
��& '
$str
��' ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  P
,
��P Q
b
��R S
=>
��T V
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� ?
,
��? @
$str
��A J
)
��J K
.
�� 
WithMany
�� !
(
��! "
)
��" #
.
�� 

�� &
(
��& '
$str
��' 2
)
��2 3
.
�� 
OnDelete
�� !
(
��! "
DeleteBehavior
��" 0
.
��0 1
Cascade
��1 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  O
,
��O P
b
��Q R
=>
��S U
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
)
��> ?
.
�� 
WithMany
�� !
(
��! "
$str
��" /
)
��/ 0
.
�� 

�� &
(
��& '
$str
��' /
)
��/ 0
.
�� 
OnDelete
�� !
(
��! "
DeleteBehavior
��" 0
.
��0 1
Cascade
��1 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  O
,
��O P
b
��Q R
=>
��S U
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
)
��> ?
.
�� 
WithMany
�� !
(
��! "
$str
��" /
)
��/ 0
.
�� 

�� &
(
��& '
$str
��' /
)
��/ 0
.
�� 
OnDelete
�� !
(
��! "
DeleteBehavior
��" 0
.
��0 1
Cascade
��1 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
}
�� 	
}
�� 
}�� �
xF:\Code\GitHub\docker\src\AnBook.EntityFrameworkCore\Migrations\20170621153937_Added_Description_And_IsActive_To_Role.cs
	namespace 	
AnBook
 
. 

Migrations 
{ 
public 

partial 
class 2
&Added_Description_And_IsActive_To_Role ?
:@ A
	MigrationB K
{ 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder		 
.		 
	AddColumn		 &
<		& '
string		' -
>		- .
(		. /
name

 
:

 
$str

 #
,

# $
table 
: 
$str !
,! "
	maxLength 
: 
$num 
,  
nullable
:
true
)
;
migrationBuilder 
. 
	AddColumn &
<& '
bool' +
>+ ,
(, -
name 
: 
$str  
,  !
table 
: 
$str !
,! "
nullable 
: 
false 
,  
defaultValue 
: 
false #
)# $
;$ %
} 	
	protected 
override 
void 
Down  $
($ %
MigrationBuilder% 5
migrationBuilder6 F
)F G
{ 	
migrationBuilder 
. 

DropColumn '
(' (
name 
: 
$str #
,# $
table 
: 
$str !
)! "
;" #
migrationBuilder 
. 

DropColumn '
(' (
name 
: 
$str  
,  !
table 
: 
$str !
)! "
;" #
} 	
}   
}!! ��
�F:\Code\GitHub\docker\src\AnBook.EntityFrameworkCore\Migrations\20170621153937_Added_Description_And_IsActive_To_Role.Designer.cs
	namespace 	
AnBook
 
. 

Migrations 
{		 
[

 
	DbContext

 
(

 
typeof

 
(

 
AnBookDbContext

 %
)

% &
)

& '
]

' (
[ 
	Migration 
( 
$str F
)F G
]G H
partial 
class 2
&Added_Description_And_IsActive_To_Role 8
{
	protected 
override 
void 
BuildTargetModel  0
(0 1
ModelBuilder1 =
modelBuilder> J
)J K
{ 	
modelBuilder 
. 

( 
$str /
,/ 0
$str1 8
)8 9
. 

( 
$str B
,B C,
 SqlServerValueGenerationStrategyD d
.d e
IdentityColumne s
)s t
;t u
modelBuilder 
. 
Entity 
(  
$str  B
,B C
bD E
=>F H
{ 
b 
. 
Property 
< 
int "
>" #
(# $
$str$ (
)( )
. 
ValueGeneratedOnAdd ,
(, -
)- .
;. /
b 
. 
Property 
< 
DateTime '
>' (
(( )
$str) 7
)7 8
;8 9
b 
. 
Property 
< 
long #
?# $
>$ %
(% &
$str& 5
)5 6
;6 7
b 
. 
Property 
< 
long #
?# $
>$ %
(% &
$str& 5
)5 6
;6 7
b 
. 
Property 
< 
DateTime '
?' (
>( )
() *
$str* 8
)8 9
;9 :
b!! 
.!! 
Property!! 
<!! 
string!! %
>!!% &
(!!& '
$str!!' 4
)!!4 5
."" 

IsRequired"" #
(""# $
)""$ %
.## 
HasMaxLength## %
(##% &
$num##& (
)##( )
;##) *
b%% 
.%% 
Property%% 
<%% 
bool%% #
>%%# $
(%%$ %
$str%%% 0
)%%0 1
;%%1 2
b'' 
.'' 
Property'' 
<'' 
DateTime'' '
?''' (
>''( )
('') *
$str''* @
)''@ A
;''A B
b)) 
.)) 
Property)) 
<)) 
long)) #
?))# $
>))$ %
())% &
$str))& :
))): ;
;)); <
b++ 
.++ 
Property++ 
<++ 
string++ %
>++% &
(++& '
$str++' -
)++- .
.,, 

IsRequired,, #
(,,# $
),,$ %
.-- 
HasMaxLength-- %
(--% &
$num--& (
)--( )
;--) *
b// 
.// 
HasKey// 
(// 
$str// !
)//! "
;//" #
b11 
.11 
ToTable11 
(11 
$str11 +
)11+ ,
;11, -
}22 
)22 
;22 
modelBuilder44 
.44 
Entity44 
(44  
$str44  I
,44I J
b44K L
=>44M O
{55 
b66 
.66 
Property66 
<66 
long66 #
>66# $
(66$ %
$str66% )
)66) *
.77 
ValueGeneratedOnAdd77 ,
(77, -
)77- .
;77. /
b99 
.99 
Property99 
<99 
DateTime99 '
>99' (
(99( )
$str99) 7
)997 8
;998 9
b;; 
.;; 
Property;; 
<;; 
long;; #
?;;# $
>;;$ %
(;;% &
$str;;& 5
);;5 6
;;;6 7
b== 
.== 
Property== 
<== 
string== %
>==% &
(==& '
$str==' 6
)==6 7
.>> 

IsRequired>> #
(>># $
)>>$ %
;>>% &
b@@ 
.@@ 
Property@@ 
<@@ 
string@@ %
>@@% &
(@@& '
$str@@' -
)@@- .
.AA 

IsRequiredAA #
(AA# $
)AA$ %
.BB 
HasMaxLengthBB %
(BB% &
$numBB& )
)BB) *
;BB* +
bDD 
.DD 
PropertyDD 
<DD 
stringDD %
>DD% &
(DD& '
$strDD' .
)DD. /
.EE 

IsRequiredEE #
(EE# $
)EE$ %
.FF 
HasMaxLengthFF %
(FF% &
$numFF& *
)FF* +
;FF+ ,
bHH 
.HH 
HasKeyHH 
(HH 
$strHH !
)HH! "
;HH" #
bJJ 
.JJ 
ToTableJJ 
(JJ 
$strJJ +
)JJ+ ,
;JJ, -
bLL 
.LL 
HasDiscriminatorLL &
<LL& '
stringLL' -
>LL- .
(LL. /
$strLL/ >
)LL> ?
.LL? @
HasValueLL@ H
(LLH I
$strLLI Y
)LLY Z
;LLZ [
}MM 
)MM 
;MM 
modelBuilderOO 
.OO 
EntityOO 
(OO  
$strOO  7
,OO7 8
bOO9 :
=>OO; =
{PP 
bQQ 
.QQ 
PropertyQQ 
<QQ 
longQQ #
>QQ# $
(QQ$ %
$strQQ% )
)QQ) *
.RR 
ValueGeneratedOnAddRR ,
(RR, -
)RR- .
;RR. /
bTT 
.TT 
PropertyTT 
<TT 
stringTT %
>TT% &
(TT& '
$strTT' 4
)TT4 5
.UU 
HasMaxLengthUU %
(UU% &
$numUU& )
)UU) *
;UU* +
bWW 
.WW 
PropertyWW 
<WW 
stringWW %
>WW% &
(WW& '
$strWW' 8
)WW8 9
.XX 
HasMaxLengthXX %
(XX% &
$numXX& (
)XX( )
;XX) *
bZZ 
.ZZ 
PropertyZZ 
<ZZ 
stringZZ %
>ZZ% &
(ZZ& '
$strZZ' 3
)ZZ3 4
.[[ 
HasMaxLength[[ %
([[% &
$num[[& )
)[[) *
;[[* +
b]] 
.]] 
Property]] 
<]] 
string]] %
>]]% &
(]]& '
$str]]' 3
)]]3 4
.^^ 
HasMaxLength^^ %
(^^% &
$num^^& *
)^^* +
;^^+ ,
b`` 
.`` 
Property`` 
<`` 
string`` %
>``% &
(``& '
$str``' 2
)``2 3
.aa 
HasMaxLengthaa %
(aa% &
$numaa& *
)aa* +
;aa+ ,
bcc 
.cc 
Propertycc 
<cc 
intcc "
>cc" #
(cc# $
$strcc$ 7
)cc7 8
;cc8 9
bee 
.ee 
Propertyee 
<ee 
DateTimeee '
>ee' (
(ee( )
$stree) 8
)ee8 9
;ee9 :
bgg 
.gg 
Propertygg 
<gg 
intgg "
?gg" #
>gg# $
(gg$ %
$strgg% ;
)gg; <
;gg< =
bii 
.ii 
Propertyii 
<ii 
longii #
?ii# $
>ii$ %
(ii% &
$strii& :
)ii: ;
;ii; <
bkk 
.kk 
Propertykk 
<kk 
stringkk %
>kk% &
(kk& '
$strkk' 3
)kk3 4
.ll 
HasMaxLengthll %
(ll% &
$numll& )
)ll) *
;ll* +
bnn 
.nn 
Propertynn 
<nn 
stringnn %
>nn% &
(nn& '
$strnn' 3
)nn3 4
.oo 
HasMaxLengthoo %
(oo% &
$numoo& *
)oo* +
;oo+ ,
bqq 
.qq 
Propertyqq 
<qq 
stringqq %
>qq% &
(qq& '
$strqq' 4
)qq4 5
.rr 
HasMaxLengthrr %
(rr% &
$numrr& )
)rr) *
;rr* +
btt 
.tt 
Propertytt 
<tt 
inttt "
?tt" #
>tt# $
(tt$ %
$strtt% /
)tt/ 0
;tt0 1
bvv 
.vv 
Propertyvv 
<vv 
longvv #
?vv# $
>vv$ %
(vv% &
$strvv& .
)vv. /
;vv/ 0
bxx 
.xx 
HasKeyxx 
(xx 
$strxx !
)xx! "
;xx" #
bzz 
.zz 
HasIndexzz 
(zz 
$strzz )
,zz) *
$strzz+ >
)zz> ?
;zz? @
b|| 
.|| 
HasIndex|| 
(|| 
$str|| )
,||) *
$str||+ :
)||: ;
;||; <
b~~ 
.~~ 
HasIndex~~ 
(~~ 
$str~~ )
,~~) *
$str~~+ 3
)~~3 4
;~~4 5
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� ,
)
��, -
;
��- .
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  E
,
��E F
b
��G H
=>
��I K
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 6
)
��6 7
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
;
��% &
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 1
)
��1 2
;
��2 3
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasDiscriminator
�� &
<
��& '
string
��' -
>
��- .
(
��. /
$str
��/ >
)
��> ?
.
��? @
HasValue
��@ H
(
��H I
$str
��I \
)
��\ ]
;
��] ^
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 2
)
��2 3
;
��3 4
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 3
)
��3 4
;
��4 5
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ ,
)
��, -
;
��- .
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 6
)
��6 7
;
��7 8
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� -
)
��- .
;
��. /
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  E
,
��E F
b
��G H
=>
��I K
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 8
)
��8 9
;
��9 :
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 9
)
��9 :
;
��: ;
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* @
)
��@ A
;
��A B
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 2
)
��2 3
;
��3 4
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 1
)
��1 2
;
��2 3
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� -
)
��- .
;
��. /
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
)
��) *
;
��* +
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 9
)
��9 :
;
��: ;
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
)
��3 4
;
��4 5
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 5
)
��5 6
;
��6 7
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� /
)
��/ 0
;
��0 1
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 2
)
��2 3
;
��3 4
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 3
)
��3 4
;
��4 5
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 6
)
��6 7
;
��7 8
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� -
)
��- .
;
��. /
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 6
)
��6 7
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
)
��3 4
;
��4 5
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ :
,
��: ;
$str
��< I
)
��I J
;
��J K
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� -
)
��- .
;
��. /
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  J
,
��J K
b
��L M
=>
��N P
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 8
)
��8 9
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 3
)
��3 4
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
byte
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& .
)
��. /
;
��/ 0
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' ?
)
��? @
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
,
��' (
$str
��) 3
)
��3 4
;
��4 5
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� ,
,
��, -
$str
��. F
,
��F G
$str
��H P
)
��P Q
;
��Q R
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 4
)
��4 5
;
��5 6
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  N
,
��N O
b
��P Q
=>
��R T
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% 9
)
��9 :
;
��: ;
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ ?
)
��? @
;
��@ A
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
)
��3 4
;
��4 5
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  B
,
��B C
b
��D E
=>
��F H
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ ,
)
��, -
;
��- .
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
)
��3 4
;
��4 5
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
)
��3 4
;
��4 5
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� ,
)
��, -
;
��- .
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 6
)
��6 7
;
��7 8
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
)
��3 4
;
��4 5
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� -
)
��- .
;
��. /
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  F
,
��F G
b
��H I
=>
��J L
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 2
)
��2 3
;
��3 4
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 0
)
��0 1
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 0
)
��0 1
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 6
)
��6 7
;
��7 8
b
�� 
.
�� 
Property
�� 
<
�� 
byte
�� #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
short
�� $
>
��$ %
(
��% &
$str
��& 0
)
��0 1
;
��1 2
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� ,
,
��, -
$str
��. ;
)
��; <
;
��< =
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 1
)
��1 2
;
��2 3
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  ;
,
��; <
b
��= >
=>
��? A
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* @
)
��@ A
;
��A B
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& .
)
��. /
;
��/ 0
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' .
)
��. /
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& *
)
��* +
;
��+ ,
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 1
)
��1 2
;
��2 3
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� +
)
��+ ,
;
��, -
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  F
,
��F G
b
��H I
=>
��J L
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ (
)
��( )
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 8
)
��8 9
;
��9 :
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 1
)
��1 2
;
��2 3
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* @
)
��@ A
;
��A B
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 1
)
��1 2
;
��2 3
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� ,
)
��, -
;
��- .
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  J
,
��J K
b
��L M
=>
��N P
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' ,
)
��, -
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 5
)
��5 6
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* @
)
��@ A
;
��A B
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' /
)
��/ 0
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' .
)
��. /
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
,
��3 4
$str
��5 C
,
��C D
$str
��E J
)
��J K
;
��K L
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 0
)
��0 1
;
��1 2
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  D
,
��D E
b
��F G
=>
��H J
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
Guid
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 5
)
��5 6
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 1
)
��1 2
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' H
)
��H I
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 7
)
��7 8
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 8
)
��8 9
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& ,
)
��, -
;
��- .
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 9
)
��9 :
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
byte
�� #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 2
)
��2 3
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& ,
)
��, -
;
��- .
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 0
)
��0 1
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& ,
)
��, -
;
��- .
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 0
)
��0 1
;
��1 2
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  P
,
��P Q
b
��R S
=>
��T V
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
Guid
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 1
)
��1 2
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' H
)
��H I
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 7
)
��7 8
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 9
)
��9 :
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� 1
,
��1 2
$str
��3 C
,
��C D
$str
��E O
,
��O P
$str
��Q Y
)
��Y Z
;
��Z [
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ =
,
��= >
$str
��? O
,
��O P
$str
��Q [
,
��[ \
$str
��] e
)
��e f
;
��f g
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� <
)
��< =
;
��= >
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  J
,
��J K
b
��L M
=>
��N P
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
Guid
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 5
)
��5 6
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 1
)
��1 2
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' H
)
��H I
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 7
)
��7 8
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 9
)
��9 :
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
byte
�� #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
)
��) *
;
��* +
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 6
)
��6 7
;
��7 8
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  H
,
��H I
b
��J K
=>
��L N
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
Guid
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ +
)
��+ ,
;
��, -
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
Guid
�� #
>
��# $
(
��$ %
$str
��% ;
)
��; <
;
��< =
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
,
��' (
$str
��) 0
,
��0 1
$str
��2 @
)
��@ A
;
��A B
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 4
)
��4 5
;
��5 6
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  D
,
��D E
b
��F G
=>
��H J
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 8
)
��8 9
;
��9 :
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* @
)
��@ A
;
��A B
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
)
��) *
;
��* +
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 1
)
��1 2
;
��2 3
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 4
)
��4 5
;
��5 6
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  A
,
��A B
b
��C D
=>
��E G
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ (
)
��( )
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 9
)
��9 :
.
��  
IsConcurrencyToken
�� +
(
��+ ,
)
��, -
;
��- .
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 8
)
��8 9
;
��9 :
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& *
)
��* +
;
��+ ,
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* @
)
��@ A
;
��A B
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 7
)
��7 8
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� 3
)
��3 4
;
��4 5
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ ;
)
��; <
;
��< =
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� (
)
��( )
;
��) *
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  A
,
��A B
b
��C D
=>
��E G
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' =
)
��= >
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 9
)
��9 :
.
��  
IsConcurrencyToken
�� +
(
��+ ,
)
��, -
;
��- .
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 8
)
��8 9
;
��9 :
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 5
)
��5 6
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' >
)
��> ?
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% =
)
��= >
;
��> ?
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 9
)
��9 :
;
��: ;
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 9
)
��9 :
;
��: ;
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* @
)
��@ A
;
��A B
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* =
)
��= >
;
��> ?
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' ?
)
��? @
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' ;
)
��; <
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 1
)
��1 2
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' :
)
��: ;
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
;
��5 6
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 6
)
��6 7
;
��7 8
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 0
)
��0 1
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 1
)
��1 2
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� 3
)
��3 4
;
��4 5
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ C
)
��C D
;
��D E
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ ?
)
��? @
;
��@ A
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� (
)
��( )
;
��) *
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  <
,
��< =
b
��> ?
=>
��@ B
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ (
)
��( )
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 9
)
��9 :
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& *
)
��* +
;
��+ ,
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 8
)
��8 9
;
��9 :
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* @
)
��@ A
;
��A B
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� *
)
��* +
;
��+ ,
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� 3
)
��3 4
;
��4 5
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� ,
)
��, -
;
��- .
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� *
)
��* +
;
��+ ,
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  P
,
��P Q
b
��R S
=>
��T V
{
�� 
b
�� 
.
�� 
HasBaseType
�� !
(
��! "
$str
��" K
)
��K L
;
��L M
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ /
)
��/ 0
;
��0 1
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� *
,
��* +
$str
��, 2
)
��2 3
;
��3 4
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� +
)
��+ ,
;
��, -
b
�� 
.
�� 
HasDiscriminator
�� &
(
��& '
)
��' (
.
��( )
HasValue
��) 1
(
��1 2
$str
��2 I
)
��I J
;
��J K
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  G
,
��G H
b
��I J
=>
��K M
{
�� 
b
�� 
.
�� 
HasBaseType
�� !
(
��! "
$str
��" K
)
��K L
;
��L M
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 1
)
��1 2
;
��2 3
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� +
)
��+ ,
;
��, -
b
�� 
.
�� 
HasDiscriminator
�� &
(
��& '
)
��' (
.
��( )
HasValue
��) 1
(
��1 2
$str
��2 H
)
��H I
;
��I J
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  O
,
��O P
b
��Q R
=>
��S U
{
�� 
b
�� 
.
�� 
HasBaseType
�� !
(
��! "
$str
��" G
)
��G H
;
��H I
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ ,
)
��, -
;
��- .
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasDiscriminator
�� &
(
��& '
)
��' (
.
��( )
HasValue
��) 1
(
��1 2
$str
��2 I
)
��I J
;
��J K
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  O
,
��O P
b
��Q R
=>
��S U
{
�� 
b
�� 
.
�� 
HasBaseType
�� !
(
��! "
$str
��" G
)
��G H
;
��H I
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasDiscriminator
�� &
(
��& '
)
��' (
.
��( )
HasValue
��) 1
(
��1 2
$str
��2 I
)
��I J
;
��J K
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
)
��> ?
.
�� 
WithMany
�� !
(
��! "
$str
��" *
)
��* +
.
�� 

�� &
(
��& '
$str
��' /
)
��/ 0
.
�� 
OnDelete
�� !
(
��! "
DeleteBehavior
��" 0
.
��0 1
Cascade
��1 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
)
��> ?
.
�� 
WithMany
�� !
(
��! "
$str
��" *
)
��* +
.
�� 

�� &
(
��& '
$str
��' /
)
��/ 0
.
�� 
OnDelete
�� !
(
��! "
DeleteBehavior
��" 0
.
��0 1
Cascade
��1 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
)
��> ?
.
�� 
WithMany
�� !
(
��! "
$str
��" *
)
��* +
.
�� 

�� &
(
��& '
$str
��' /
)
��/ 0
.
�� 
OnDelete
�� !
(
��! "
DeleteBehavior
��" 0
.
��0 1
Cascade
��1 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  B
,
��B C
b
��D E
=>
��F H
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
)
��> ?
.
�� 
WithMany
�� !
(
��! "
$str
��" )
)
��) *
.
�� 

�� &
(
��& '
$str
��' /
)
��/ 0
.
�� 
OnDelete
�� !
(
��! "
DeleteBehavior
��" 0
.
��0 1
Cascade
��1 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
)
��> ?
.
�� 
WithMany
�� !
(
��! "
$str
��" *
)
��* +
.
�� 

�� &
(
��& '
$str
��' /
)
��/ 0
.
�� 
OnDelete
�� !
(
��! "
DeleteBehavior
��" 0
.
��0 1
Cascade
��1 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  ;
,
��; <
b
��= >
=>
��? A
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
)
��> ?
.
�� 
WithMany
�� !
(
��! "
$str
��" ,
)
��, -
.
�� 

�� &
(
��& '
$str
��' /
)
��/ 0
;
��0 1
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  D
,
��D E
b
��F G
=>
��H J
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� A
,
��A B
$str
��C K
)
��K L
.
�� 
WithMany
�� !
(
��! "
$str
��" ,
)
��, -
.
�� 

�� &
(
��& '
$str
��' 1
)
��1 2
;
��2 3
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  A
,
��A B
b
��C D
=>
��E G
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
,
��> ?
$str
��@ M
)
��M N
.
�� 
WithMany
�� !
(
��! "
)
��" #
.
�� 

�� &
(
��& '
$str
��' 6
)
��6 7
;
��7 8
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
,
��> ?
$str
��@ M
)
��M N
.
�� 
WithMany
�� !
(
��! "
)
��" #
.
�� 

�� &
(
��& '
$str
��' 6
)
��6 7
;
��7 8
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
,
��> ?
$str
��@ R
)
��R S
.
�� 
WithMany
�� !
(
��! "
)
��" #
.
�� 

�� &
(
��& '
$str
��' ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  A
,
��A B
b
��C D
=>
��E G
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
,
��> ?
$str
��@ M
)
��M N
.
�� 
WithMany
�� !
(
��! "
)
��" #
.
�� 

�� &
(
��& '
$str
��' 6
)
��6 7
;
��7 8
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
,
��> ?
$str
��@ M
)
��M N
.
�� 
WithMany
�� !
(
��! "
)
��" #
.
�� 

�� &
(
��& '
$str
��' 6
)
��6 7
;
��7 8
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
,
��> ?
$str
��@ R
)
��R S
.
�� 
WithMany
�� !
(
��! "
)
��" #
.
�� 

�� &
(
��& '
$str
��' ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  <
,
��< =
b
��> ?
=>
��@ B
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
,
��> ?
$str
��@ M
)
��M N
.
�� 
WithMany
�� !
(
��! "
)
��" #
.
�� 

�� &
(
��& '
$str
��' 6
)
��6 7
;
��7 8
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
,
��> ?
$str
��@ M
)
��M N
.
�� 
WithMany
�� !
(
��! "
)
��" #
.
�� 

�� &
(
��& '
$str
��' 6
)
��6 7
;
��7 8
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� ?
,
��? @
$str
��A J
)
��J K
.
�� 
WithMany
�� !
(
��! "
)
��" #
.
�� 

�� &
(
��& '
$str
��' 2
)
��2 3
;
��3 4
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
,
��> ?
$str
��@ R
)
��R S
.
�� 
WithMany
�� !
(
��! "
)
��" #
.
�� 

�� &
(
��& '
$str
��' ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  P
,
��P Q
b
��R S
=>
��T V
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� ?
,
��? @
$str
��A J
)
��J K
.
�� 
WithMany
�� !
(
��! "
)
��" #
.
�� 

�� &
(
��& '
$str
��' 2
)
��2 3
.
�� 
OnDelete
�� !
(
��! "
DeleteBehavior
��" 0
.
��0 1
Cascade
��1 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  O
,
��O P
b
��Q R
=>
��S U
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
)
��> ?
.
�� 
WithMany
�� !
(
��! "
$str
��" /
)
��/ 0
.
�� 

�� &
(
��& '
$str
��' /
)
��/ 0
.
�� 
OnDelete
�� !
(
��! "
DeleteBehavior
��" 0
.
��0 1
Cascade
��1 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  O
,
��O P
b
��Q R
=>
��S U
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
)
��> ?
.
�� 
WithMany
�� !
(
��! "
$str
��" /
)
��/ 0
.
�� 

�� &
(
��& '
$str
��' /
)
��/ 0
.
�� 
OnDelete
�� !
(
��! "
DeleteBehavior
��" 0
.
��0 1
Cascade
��1 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
}
�� 	
}
�� 
}�� �
kF:\Code\GitHub\docker\src\AnBook.EntityFrameworkCore\Migrations\20170703134115_Remove_IsActive_From_Role.cs
	namespace 	
AnBook
 
. 

Migrations 
{ 
public 

partial 
class %
Remove_IsActive_From_Role 2
:3 4
	Migration5 >
{ 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder		 
.		 

DropColumn		 '
(		' (
name

 
:

 
$str

  
,

  !
table 
: 
$str !
)! "
;" #
} 	
	protected 
override 
void 
Down  $
($ %
MigrationBuilder% 5
migrationBuilder6 F
)F G
{ 	
migrationBuilder 
. 
	AddColumn &
<& '
bool' +
>+ ,
(, -
name 
: 
$str  
,  !
table 
: 
$str !
,! "
nullable 
: 
false 
,  
defaultValue 
: 
false #
)# $
;$ %
} 	
} 
} ��
tF:\Code\GitHub\docker\src\AnBook.EntityFrameworkCore\Migrations\20170703134115_Remove_IsActive_From_Role.Designer.cs
	namespace 	
AnBook
 
. 

Migrations 
{		 
[

 
	DbContext

 
(

 
typeof

 
(

 
AnBookDbContext

 %
)

% &
)

& '
]

' (
[ 
	Migration 
( 
$str 9
)9 :
]: ;
partial 
class %
Remove_IsActive_From_Role +
{
	protected 
override 
void 
BuildTargetModel  0
(0 1
ModelBuilder1 =
modelBuilder> J
)J K
{ 	
modelBuilder 
. 

( 
$str /
,/ 0
$str1 8
)8 9
. 

( 
$str B
,B C,
 SqlServerValueGenerationStrategyD d
.d e
IdentityColumne s
)s t
;t u
modelBuilder 
. 
Entity 
(  
$str  B
,B C
bD E
=>F H
{ 
b 
. 
Property 
< 
int "
>" #
(# $
$str$ (
)( )
. 
ValueGeneratedOnAdd ,
(, -
)- .
;. /
b 
. 
Property 
< 
DateTime '
>' (
(( )
$str) 7
)7 8
;8 9
b 
. 
Property 
< 
long #
?# $
>$ %
(% &
$str& 5
)5 6
;6 7
b 
. 
Property 
< 
long #
?# $
>$ %
(% &
$str& 5
)5 6
;6 7
b 
. 
Property 
< 
DateTime '
?' (
>( )
() *
$str* 8
)8 9
;9 :
b!! 
.!! 
Property!! 
<!! 
string!! %
>!!% &
(!!& '
$str!!' 4
)!!4 5
."" 

IsRequired"" #
(""# $
)""$ %
.## 
HasMaxLength## %
(##% &
$num##& (
)##( )
;##) *
b%% 
.%% 
Property%% 
<%% 
bool%% #
>%%# $
(%%$ %
$str%%% 0
)%%0 1
;%%1 2
b'' 
.'' 
Property'' 
<'' 
DateTime'' '
?''' (
>''( )
('') *
$str''* @
)''@ A
;''A B
b)) 
.)) 
Property)) 
<)) 
long)) #
?))# $
>))$ %
())% &
$str))& :
))): ;
;)); <
b++ 
.++ 
Property++ 
<++ 
string++ %
>++% &
(++& '
$str++' -
)++- .
.,, 

IsRequired,, #
(,,# $
),,$ %
.-- 
HasMaxLength-- %
(--% &
$num--& (
)--( )
;--) *
b// 
.// 
HasKey// 
(// 
$str// !
)//! "
;//" #
b11 
.11 
ToTable11 
(11 
$str11 +
)11+ ,
;11, -
}22 
)22 
;22 
modelBuilder44 
.44 
Entity44 
(44  
$str44  I
,44I J
b44K L
=>44M O
{55 
b66 
.66 
Property66 
<66 
long66 #
>66# $
(66$ %
$str66% )
)66) *
.77 
ValueGeneratedOnAdd77 ,
(77, -
)77- .
;77. /
b99 
.99 
Property99 
<99 
DateTime99 '
>99' (
(99( )
$str99) 7
)997 8
;998 9
b;; 
.;; 
Property;; 
<;; 
long;; #
?;;# $
>;;$ %
(;;% &
$str;;& 5
);;5 6
;;;6 7
b== 
.== 
Property== 
<== 
string== %
>==% &
(==& '
$str==' 6
)==6 7
.>> 

IsRequired>> #
(>># $
)>>$ %
;>>% &
b@@ 
.@@ 
Property@@ 
<@@ 
string@@ %
>@@% &
(@@& '
$str@@' -
)@@- .
.AA 

IsRequiredAA #
(AA# $
)AA$ %
.BB 
HasMaxLengthBB %
(BB% &
$numBB& )
)BB) *
;BB* +
bDD 
.DD 
PropertyDD 
<DD 
stringDD %
>DD% &
(DD& '
$strDD' .
)DD. /
.EE 

IsRequiredEE #
(EE# $
)EE$ %
.FF 
HasMaxLengthFF %
(FF% &
$numFF& *
)FF* +
;FF+ ,
bHH 
.HH 
HasKeyHH 
(HH 
$strHH !
)HH! "
;HH" #
bJJ 
.JJ 
ToTableJJ 
(JJ 
$strJJ +
)JJ+ ,
;JJ, -
bLL 
.LL 
HasDiscriminatorLL &
<LL& '
stringLL' -
>LL- .
(LL. /
$strLL/ >
)LL> ?
.LL? @
HasValueLL@ H
(LLH I
$strLLI Y
)LLY Z
;LLZ [
}MM 
)MM 
;MM 
modelBuilderOO 
.OO 
EntityOO 
(OO  
$strOO  7
,OO7 8
bOO9 :
=>OO; =
{PP 
bQQ 
.QQ 
PropertyQQ 
<QQ 
longQQ #
>QQ# $
(QQ$ %
$strQQ% )
)QQ) *
.RR 
ValueGeneratedOnAddRR ,
(RR, -
)RR- .
;RR. /
bTT 
.TT 
PropertyTT 
<TT 
stringTT %
>TT% &
(TT& '
$strTT' 4
)TT4 5
.UU 
HasMaxLengthUU %
(UU% &
$numUU& )
)UU) *
;UU* +
bWW 
.WW 
PropertyWW 
<WW 
stringWW %
>WW% &
(WW& '
$strWW' 8
)WW8 9
.XX 
HasMaxLengthXX %
(XX% &
$numXX& (
)XX( )
;XX) *
bZZ 
.ZZ 
PropertyZZ 
<ZZ 
stringZZ %
>ZZ% &
(ZZ& '
$strZZ' 3
)ZZ3 4
.[[ 
HasMaxLength[[ %
([[% &
$num[[& )
)[[) *
;[[* +
b]] 
.]] 
Property]] 
<]] 
string]] %
>]]% &
(]]& '
$str]]' 3
)]]3 4
.^^ 
HasMaxLength^^ %
(^^% &
$num^^& *
)^^* +
;^^+ ,
b`` 
.`` 
Property`` 
<`` 
string`` %
>``% &
(``& '
$str``' 2
)``2 3
.aa 
HasMaxLengthaa %
(aa% &
$numaa& *
)aa* +
;aa+ ,
bcc 
.cc 
Propertycc 
<cc 
intcc "
>cc" #
(cc# $
$strcc$ 7
)cc7 8
;cc8 9
bee 
.ee 
Propertyee 
<ee 
DateTimeee '
>ee' (
(ee( )
$stree) 8
)ee8 9
;ee9 :
bgg 
.gg 
Propertygg 
<gg 
intgg "
?gg" #
>gg# $
(gg$ %
$strgg% ;
)gg; <
;gg< =
bii 
.ii 
Propertyii 
<ii 
longii #
?ii# $
>ii$ %
(ii% &
$strii& :
)ii: ;
;ii; <
bkk 
.kk 
Propertykk 
<kk 
stringkk %
>kk% &
(kk& '
$strkk' 3
)kk3 4
.ll 
HasMaxLengthll %
(ll% &
$numll& )
)ll) *
;ll* +
bnn 
.nn 
Propertynn 
<nn 
stringnn %
>nn% &
(nn& '
$strnn' 3
)nn3 4
.oo 
HasMaxLengthoo %
(oo% &
$numoo& *
)oo* +
;oo+ ,
bqq 
.qq 
Propertyqq 
<qq 
stringqq %
>qq% &
(qq& '
$strqq' 4
)qq4 5
.rr 
HasMaxLengthrr %
(rr% &
$numrr& )
)rr) *
;rr* +
btt 
.tt 
Propertytt 
<tt 
inttt "
?tt" #
>tt# $
(tt$ %
$strtt% /
)tt/ 0
;tt0 1
bvv 
.vv 
Propertyvv 
<vv 
longvv #
?vv# $
>vv$ %
(vv% &
$strvv& .
)vv. /
;vv/ 0
bxx 
.xx 
HasKeyxx 
(xx 
$strxx !
)xx! "
;xx" #
bzz 
.zz 
HasIndexzz 
(zz 
$strzz )
,zz) *
$strzz+ >
)zz> ?
;zz? @
b|| 
.|| 
HasIndex|| 
(|| 
$str|| )
,||) *
$str||+ :
)||: ;
;||; <
b~~ 
.~~ 
HasIndex~~ 
(~~ 
$str~~ )
,~~) *
$str~~+ 3
)~~3 4
;~~4 5
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� ,
)
��, -
;
��- .
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  E
,
��E F
b
��G H
=>
��I K
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 6
)
��6 7
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
;
��% &
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 1
)
��1 2
;
��2 3
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasDiscriminator
�� &
<
��& '
string
��' -
>
��- .
(
��. /
$str
��/ >
)
��> ?
.
��? @
HasValue
��@ H
(
��H I
$str
��I \
)
��\ ]
;
��] ^
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 2
)
��2 3
;
��3 4
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 3
)
��3 4
;
��4 5
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ ,
)
��, -
;
��- .
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 6
)
��6 7
;
��7 8
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� -
)
��- .
;
��. /
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  E
,
��E F
b
��G H
=>
��I K
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 8
)
��8 9
;
��9 :
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 9
)
��9 :
;
��: ;
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* @
)
��@ A
;
��A B
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 2
)
��2 3
;
��3 4
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 1
)
��1 2
;
��2 3
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� -
)
��- .
;
��. /
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
)
��) *
;
��* +
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 9
)
��9 :
;
��: ;
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
)
��3 4
;
��4 5
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 5
)
��5 6
;
��6 7
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� /
)
��/ 0
;
��0 1
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 2
)
��2 3
;
��3 4
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 3
)
��3 4
;
��4 5
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 6
)
��6 7
;
��7 8
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� -
)
��- .
;
��. /
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 6
)
��6 7
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
)
��3 4
;
��4 5
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ :
,
��: ;
$str
��< I
)
��I J
;
��J K
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� -
)
��- .
;
��. /
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  J
,
��J K
b
��L M
=>
��N P
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 8
)
��8 9
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 3
)
��3 4
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
byte
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& .
)
��. /
;
��/ 0
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' ?
)
��? @
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
,
��' (
$str
��) 3
)
��3 4
;
��4 5
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� ,
,
��, -
$str
��. F
,
��F G
$str
��H P
)
��P Q
;
��Q R
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 4
)
��4 5
;
��5 6
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  N
,
��N O
b
��P Q
=>
��R T
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% 9
)
��9 :
;
��: ;
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ ?
)
��? @
;
��@ A
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
)
��3 4
;
��4 5
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  B
,
��B C
b
��D E
=>
��F H
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ ,
)
��, -
;
��- .
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
)
��3 4
;
��4 5
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
)
��3 4
;
��4 5
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� ,
)
��, -
;
��- .
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 6
)
��6 7
;
��7 8
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
)
��3 4
;
��4 5
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� -
)
��- .
;
��. /
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  F
,
��F G
b
��H I
=>
��J L
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 2
)
��2 3
;
��3 4
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 0
)
��0 1
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 0
)
��0 1
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 6
)
��6 7
;
��7 8
b
�� 
.
�� 
Property
�� 
<
�� 
byte
�� #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
short
�� $
>
��$ %
(
��% &
$str
��& 0
)
��0 1
;
��1 2
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� ,
,
��, -
$str
��. ;
)
��; <
;
��< =
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 1
)
��1 2
;
��2 3
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  ;
,
��; <
b
��= >
=>
��? A
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* @
)
��@ A
;
��A B
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& .
)
��. /
;
��/ 0
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' .
)
��. /
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& *
)
��* +
;
��+ ,
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 1
)
��1 2
;
��2 3
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� +
)
��+ ,
;
��, -
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  F
,
��F G
b
��H I
=>
��J L
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ (
)
��( )
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 8
)
��8 9
;
��9 :
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 1
)
��1 2
;
��2 3
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* @
)
��@ A
;
��A B
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 1
)
��1 2
;
��2 3
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� ,
)
��, -
;
��- .
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  J
,
��J K
b
��L M
=>
��N P
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' ,
)
��, -
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 5
)
��5 6
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* @
)
��@ A
;
��A B
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' /
)
��/ 0
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' .
)
��. /
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
,
��3 4
$str
��5 C
,
��C D
$str
��E J
)
��J K
;
��K L
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 0
)
��0 1
;
��1 2
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  D
,
��D E
b
��F G
=>
��H J
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
Guid
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 5
)
��5 6
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 1
)
��1 2
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' H
)
��H I
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 7
)
��7 8
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 8
)
��8 9
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& ,
)
��, -
;
��- .
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 9
)
��9 :
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
byte
�� #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 2
)
��2 3
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& ,
)
��, -
;
��- .
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 0
)
��0 1
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& ,
)
��, -
;
��- .
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 0
)
��0 1
;
��1 2
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  P
,
��P Q
b
��R S
=>
��T V
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
Guid
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 1
)
��1 2
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' H
)
��H I
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 7
)
��7 8
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 9
)
��9 :
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� 1
,
��1 2
$str
��3 C
,
��C D
$str
��E O
,
��O P
$str
��Q Y
)
��Y Z
;
��Z [
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ =
,
��= >
$str
��? O
,
��O P
$str
��Q [
,
��[ \
$str
��] e
)
��e f
;
��f g
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� <
)
��< =
;
��= >
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  J
,
��J K
b
��L M
=>
��N P
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
Guid
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 5
)
��5 6
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 1
)
��1 2
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' H
)
��H I
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 7
)
��7 8
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 9
)
��9 :
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
byte
�� #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
)
��) *
;
��* +
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 6
)
��6 7
;
��7 8
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  H
,
��H I
b
��J K
=>
��L N
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
Guid
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ +
)
��+ ,
;
��, -
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
Guid
�� #
>
��# $
(
��$ %
$str
��% ;
)
��; <
;
��< =
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
,
��' (
$str
��) 0
,
��0 1
$str
��2 @
)
��@ A
;
��A B
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 4
)
��4 5
;
��5 6
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  D
,
��D E
b
��F G
=>
��H J
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 8
)
��8 9
;
��9 :
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* @
)
��@ A
;
��A B
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
)
��) *
;
��* +
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 1
)
��1 2
;
��2 3
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 4
)
��4 5
;
��5 6
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  A
,
��A B
b
��C D
=>
��E G
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ (
)
��( )
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 9
)
��9 :
.
��  
IsConcurrencyToken
�� +
(
��+ ,
)
��, -
;
��- .
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 8
)
��8 9
;
��9 :
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& *
)
��* +
;
��+ ,
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* @
)
��@ A
;
��A B
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 7
)
��7 8
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� 3
)
��3 4
;
��4 5
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ ;
)
��; <
;
��< =
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� (
)
��( )
;
��) *
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  A
,
��A B
b
��C D
=>
��E G
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' =
)
��= >
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 9
)
��9 :
.
��  
IsConcurrencyToken
�� +
(
��+ ,
)
��, -
;
��- .
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 8
)
��8 9
;
��9 :
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 5
)
��5 6
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' >
)
��> ?
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% =
)
��= >
;
��> ?
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 9
)
��9 :
;
��: ;
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 9
)
��9 :
;
��: ;
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* @
)
��@ A
;
��A B
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* =
)
��= >
;
��> ?
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' ?
)
��? @
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' ;
)
��; <
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 1
)
��1 2
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' :
)
��: ;
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
;
��5 6
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 6
)
��6 7
;
��7 8
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 0
)
��0 1
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 1
)
��1 2
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� 3
)
��3 4
;
��4 5
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ C
)
��C D
;
��D E
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ ?
)
��? @
;
��@ A
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� (
)
��( )
;
��) *
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  <
,
��< =
b
��> ?
=>
��@ B
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ (
)
��( )
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 9
)
��9 :
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& *
)
��* +
;
��+ ,
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 8
)
��8 9
;
��9 :
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* @
)
��@ A
;
��A B
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� *
)
��* +
;
��+ ,
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� 3
)
��3 4
;
��4 5
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� ,
)
��, -
;
��- .
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� *
)
��* +
;
��+ ,
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  P
,
��P Q
b
��R S
=>
��T V
{
�� 
b
�� 
.
�� 
HasBaseType
�� !
(
��! "
$str
��" K
)
��K L
;
��L M
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ /
)
��/ 0
;
��0 1
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� *
,
��* +
$str
��, 2
)
��2 3
;
��3 4
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� +
)
��+ ,
;
��, -
b
�� 
.
�� 
HasDiscriminator
�� &
(
��& '
)
��' (
.
��( )
HasValue
��) 1
(
��1 2
$str
��2 I
)
��I J
;
��J K
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  G
,
��G H
b
��I J
=>
��K M
{
�� 
b
�� 
.
�� 
HasBaseType
�� !
(
��! "
$str
��" K
)
��K L
;
��L M
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 1
)
��1 2
;
��2 3
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� +
)
��+ ,
;
��, -
b
�� 
.
�� 
HasDiscriminator
�� &
(
��& '
)
��' (
.
��( )
HasValue
��) 1
(
��1 2
$str
��2 H
)
��H I
;
��I J
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  O
,
��O P
b
��Q R
=>
��S U
{
�� 
b
�� 
.
�� 
HasBaseType
�� !
(
��! "
$str
��" G
)
��G H
;
��H I
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ ,
)
��, -
;
��- .
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasDiscriminator
�� &
(
��& '
)
��' (
.
��( )
HasValue
��) 1
(
��1 2
$str
��2 I
)
��I J
;
��J K
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  O
,
��O P
b
��Q R
=>
��S U
{
�� 
b
�� 
.
�� 
HasBaseType
�� !
(
��! "
$str
��" G
)
��G H
;
��H I
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasDiscriminator
�� &
(
��& '
)
��' (
.
��( )
HasValue
��) 1
(
��1 2
$str
��2 I
)
��I J
;
��J K
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
)
��> ?
.
�� 
WithMany
�� !
(
��! "
$str
��" *
)
��* +
.
�� 

�� &
(
��& '
$str
��' /
)
��/ 0
.
�� 
OnDelete
�� !
(
��! "
DeleteBehavior
��" 0
.
��0 1
Cascade
��1 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
)
��> ?
.
�� 
WithMany
�� !
(
��! "
$str
��" *
)
��* +
.
�� 

�� &
(
��& '
$str
��' /
)
��/ 0
.
�� 
OnDelete
�� !
(
��! "
DeleteBehavior
��" 0
.
��0 1
Cascade
��1 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
)
��> ?
.
�� 
WithMany
�� !
(
��! "
$str
��" *
)
��* +
.
�� 

�� &
(
��& '
$str
��' /
)
��/ 0
.
�� 
OnDelete
�� !
(
��! "
DeleteBehavior
��" 0
.
��0 1
Cascade
��1 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  B
,
��B C
b
��D E
=>
��F H
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
)
��> ?
.
�� 
WithMany
�� !
(
��! "
$str
��" )
)
��) *
.
�� 

�� &
(
��& '
$str
��' /
)
��/ 0
.
�� 
OnDelete
�� !
(
��! "
DeleteBehavior
��" 0
.
��0 1
Cascade
��1 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
)
��> ?
.
�� 
WithMany
�� !
(
��! "
$str
��" *
)
��* +
.
�� 

�� &
(
��& '
$str
��' /
)
��/ 0
.
�� 
OnDelete
�� !
(
��! "
DeleteBehavior
��" 0
.
��0 1
Cascade
��1 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  ;
,
��; <
b
��= >
=>
��? A
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
)
��> ?
.
�� 
WithMany
�� !
(
��! "
$str
��" ,
)
��, -
.
�� 

�� &
(
��& '
$str
��' /
)
��/ 0
;
��0 1
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  D
,
��D E
b
��F G
=>
��H J
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� A
,
��A B
$str
��C K
)
��K L
.
�� 
WithMany
�� !
(
��! "
$str
��" ,
)
��, -
.
�� 

�� &
(
��& '
$str
��' 1
)
��1 2
;
��2 3
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  A
,
��A B
b
��C D
=>
��E G
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
,
��> ?
$str
��@ M
)
��M N
.
�� 
WithMany
�� !
(
��! "
)
��" #
.
�� 

�� &
(
��& '
$str
��' 6
)
��6 7
;
��7 8
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
,
��> ?
$str
��@ M
)
��M N
.
�� 
WithMany
�� !
(
��! "
)
��" #
.
�� 

�� &
(
��& '
$str
��' 6
)
��6 7
;
��7 8
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
,
��> ?
$str
��@ R
)
��R S
.
�� 
WithMany
�� !
(
��! "
)
��" #
.
�� 

�� &
(
��& '
$str
��' ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  A
,
��A B
b
��C D
=>
��E G
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
,
��> ?
$str
��@ M
)
��M N
.
�� 
WithMany
�� !
(
��! "
)
��" #
.
�� 

�� &
(
��& '
$str
��' 6
)
��6 7
;
��7 8
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
,
��> ?
$str
��@ M
)
��M N
.
�� 
WithMany
�� !
(
��! "
)
��" #
.
�� 

�� &
(
��& '
$str
��' 6
)
��6 7
;
��7 8
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
,
��> ?
$str
��@ R
)
��R S
.
�� 
WithMany
�� !
(
��! "
)
��" #
.
�� 

�� &
(
��& '
$str
��' ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  <
,
��< =
b
��> ?
=>
��@ B
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
,
��> ?
$str
��@ M
)
��M N
.
�� 
WithMany
�� !
(
��! "
)
��" #
.
�� 

�� &
(
��& '
$str
��' 6
)
��6 7
;
��7 8
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
,
��> ?
$str
��@ M
)
��M N
.
�� 
WithMany
�� !
(
��! "
)
��" #
.
�� 

�� &
(
��& '
$str
��' 6
)
��6 7
;
��7 8
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� ?
,
��? @
$str
��A J
)
��J K
.
�� 
WithMany
�� !
(
��! "
)
��" #
.
�� 

�� &
(
��& '
$str
��' 2
)
��2 3
;
��3 4
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
,
��> ?
$str
��@ R
)
��R S
.
�� 
WithMany
�� !
(
��! "
)
��" #
.
�� 

�� &
(
��& '
$str
��' ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  P
,
��P Q
b
��R S
=>
��T V
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� ?
,
��? @
$str
��A J
)
��J K
.
�� 
WithMany
�� !
(
��! "
)
��" #
.
�� 

�� &
(
��& '
$str
��' 2
)
��2 3
.
�� 
OnDelete
�� !
(
��! "
DeleteBehavior
��" 0
.
��0 1
Cascade
��1 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  O
,
��O P
b
��Q R
=>
��S U
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
)
��> ?
.
�� 
WithMany
�� !
(
��! "
$str
��" /
)
��/ 0
.
�� 

�� &
(
��& '
$str
��' /
)
��/ 0
.
�� 
OnDelete
�� !
(
��! "
DeleteBehavior
��" 0
.
��0 1
Cascade
��1 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  O
,
��O P
b
��Q R
=>
��S U
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
)
��> ?
.
�� 
WithMany
�� !
(
��! "
$str
��" /
)
��/ 0
.
�� 

�� &
(
��& '
$str
��' /
)
��/ 0
.
�� 
OnDelete
�� !
(
��! "
DeleteBehavior
��" 0
.
��0 1
Cascade
��1 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
}
�� 	
}
�� 
}�� �
hF:\Code\GitHub\docker\src\AnBook.EntityFrameworkCore\Migrations\20170804083601_Upgraded_To_Abp_v2.2.2.cs
	namespace 	
AnBook
 
. 

Migrations 
{ 
public 

partial 
class  
Upgraded_To_Abp_v222 -
:. /
	Migration0 9
{ 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder		 
.		 
	AddColumn		 &
<		& '
bool		' +
>		+ ,
(		, -
name

 
:

 
$str

 !
,

! "
table 
: 
$str 1
,1 2
nullable 
: 
false 
,  
defaultValue
:
false
)
;
} 	
	protected 
override 
void 
Down  $
($ %
MigrationBuilder% 5
migrationBuilder6 F
)F G
{ 	
migrationBuilder 
. 

DropColumn '
(' (
name 
: 
$str !
,! "
table 
: 
$str 1
)1 2
;2 3
} 	
} 
} ��
qF:\Code\GitHub\docker\src\AnBook.EntityFrameworkCore\Migrations\20170804083601_Upgraded_To_Abp_v2.2.2.Designer.cs
	namespace 	
AnBook
 
. 

Migrations 
{		 
[

 
	DbContext

 
(

 
typeof

 
(

 
AnBookDbContext

 %
)

% &
)

& '
]

' (
[ 
	Migration 
( 
$str 6
)6 7
]7 8
partial 
class  
Upgraded_To_Abp_v222 &
{
	protected 
override 
void 
BuildTargetModel  0
(0 1
ModelBuilder1 =
modelBuilder> J
)J K
{ 	
modelBuilder 
. 

( 
$str /
,/ 0
$str1 8
)8 9
. 

( 
$str B
,B C,
 SqlServerValueGenerationStrategyD d
.d e
IdentityColumne s
)s t
;t u
modelBuilder 
. 
Entity 
(  
$str  B
,B C
bD E
=>F H
{ 
b 
. 
Property 
< 
int "
>" #
(# $
$str$ (
)( )
. 
ValueGeneratedOnAdd ,
(, -
)- .
;. /
b 
. 
Property 
< 
DateTime '
>' (
(( )
$str) 7
)7 8
;8 9
b 
. 
Property 
< 
long #
?# $
>$ %
(% &
$str& 5
)5 6
;6 7
b 
. 
Property 
< 
long #
?# $
>$ %
(% &
$str& 5
)5 6
;6 7
b 
. 
Property 
< 
DateTime '
?' (
>( )
() *
$str* 8
)8 9
;9 :
b!! 
.!! 
Property!! 
<!! 
string!! %
>!!% &
(!!& '
$str!!' 4
)!!4 5
."" 

IsRequired"" #
(""# $
)""$ %
.## 
HasMaxLength## %
(##% &
$num##& (
)##( )
;##) *
b%% 
.%% 
Property%% 
<%% 
bool%% #
>%%# $
(%%$ %
$str%%% 0
)%%0 1
;%%1 2
b'' 
.'' 
Property'' 
<'' 
DateTime'' '
?''' (
>''( )
('') *
$str''* @
)''@ A
;''A B
b)) 
.)) 
Property)) 
<)) 
long)) #
?))# $
>))$ %
())% &
$str))& :
))): ;
;)); <
b++ 
.++ 
Property++ 
<++ 
string++ %
>++% &
(++& '
$str++' -
)++- .
.,, 

IsRequired,, #
(,,# $
),,$ %
.-- 
HasMaxLength-- %
(--% &
$num--& (
)--( )
;--) *
b// 
.// 
HasKey// 
(// 
$str// !
)//! "
;//" #
b11 
.11 
ToTable11 
(11 
$str11 +
)11+ ,
;11, -
}22 
)22 
;22 
modelBuilder44 
.44 
Entity44 
(44  
$str44  I
,44I J
b44K L
=>44M O
{55 
b66 
.66 
Property66 
<66 
long66 #
>66# $
(66$ %
$str66% )
)66) *
.77 
ValueGeneratedOnAdd77 ,
(77, -
)77- .
;77. /
b99 
.99 
Property99 
<99 
DateTime99 '
>99' (
(99( )
$str99) 7
)997 8
;998 9
b;; 
.;; 
Property;; 
<;; 
long;; #
?;;# $
>;;$ %
(;;% &
$str;;& 5
);;5 6
;;;6 7
b== 
.== 
Property== 
<== 
string== %
>==% &
(==& '
$str==' 6
)==6 7
.>> 

IsRequired>> #
(>># $
)>>$ %
;>>% &
b@@ 
.@@ 
Property@@ 
<@@ 
string@@ %
>@@% &
(@@& '
$str@@' -
)@@- .
.AA 

IsRequiredAA #
(AA# $
)AA$ %
.BB 
HasMaxLengthBB %
(BB% &
$numBB& )
)BB) *
;BB* +
bDD 
.DD 
PropertyDD 
<DD 
stringDD %
>DD% &
(DD& '
$strDD' .
)DD. /
.EE 

IsRequiredEE #
(EE# $
)EE$ %
.FF 
HasMaxLengthFF %
(FF% &
$numFF& *
)FF* +
;FF+ ,
bHH 
.HH 
HasKeyHH 
(HH 
$strHH !
)HH! "
;HH" #
bJJ 
.JJ 
ToTableJJ 
(JJ 
$strJJ +
)JJ+ ,
;JJ, -
bLL 
.LL 
HasDiscriminatorLL &
<LL& '
stringLL' -
>LL- .
(LL. /
$strLL/ >
)LL> ?
.LL? @
HasValueLL@ H
(LLH I
$strLLI Y
)LLY Z
;LLZ [
}MM 
)MM 
;MM 
modelBuilderOO 
.OO 
EntityOO 
(OO  
$strOO  7
,OO7 8
bOO9 :
=>OO; =
{PP 
bQQ 
.QQ 
PropertyQQ 
<QQ 
longQQ #
>QQ# $
(QQ$ %
$strQQ% )
)QQ) *
.RR 
ValueGeneratedOnAddRR ,
(RR, -
)RR- .
;RR. /
bTT 
.TT 
PropertyTT 
<TT 
stringTT %
>TT% &
(TT& '
$strTT' 4
)TT4 5
.UU 
HasMaxLengthUU %
(UU% &
$numUU& )
)UU) *
;UU* +
bWW 
.WW 
PropertyWW 
<WW 
stringWW %
>WW% &
(WW& '
$strWW' 8
)WW8 9
.XX 
HasMaxLengthXX %
(XX% &
$numXX& (
)XX( )
;XX) *
bZZ 
.ZZ 
PropertyZZ 
<ZZ 
stringZZ %
>ZZ% &
(ZZ& '
$strZZ' 3
)ZZ3 4
.[[ 
HasMaxLength[[ %
([[% &
$num[[& )
)[[) *
;[[* +
b]] 
.]] 
Property]] 
<]] 
string]] %
>]]% &
(]]& '
$str]]' 3
)]]3 4
.^^ 
HasMaxLength^^ %
(^^% &
$num^^& *
)^^* +
;^^+ ,
b`` 
.`` 
Property`` 
<`` 
string`` %
>``% &
(``& '
$str``' 2
)``2 3
.aa 
HasMaxLengthaa %
(aa% &
$numaa& *
)aa* +
;aa+ ,
bcc 
.cc 
Propertycc 
<cc 
intcc "
>cc" #
(cc# $
$strcc$ 7
)cc7 8
;cc8 9
bee 
.ee 
Propertyee 
<ee 
DateTimeee '
>ee' (
(ee( )
$stree) 8
)ee8 9
;ee9 :
bgg 
.gg 
Propertygg 
<gg 
intgg "
?gg" #
>gg# $
(gg$ %
$strgg% ;
)gg; <
;gg< =
bii 
.ii 
Propertyii 
<ii 
longii #
?ii# $
>ii$ %
(ii% &
$strii& :
)ii: ;
;ii; <
bkk 
.kk 
Propertykk 
<kk 
stringkk %
>kk% &
(kk& '
$strkk' 3
)kk3 4
.ll 
HasMaxLengthll %
(ll% &
$numll& )
)ll) *
;ll* +
bnn 
.nn 
Propertynn 
<nn 
stringnn %
>nn% &
(nn& '
$strnn' 3
)nn3 4
.oo 
HasMaxLengthoo %
(oo% &
$numoo& *
)oo* +
;oo+ ,
bqq 
.qq 
Propertyqq 
<qq 
stringqq %
>qq% &
(qq& '
$strqq' 4
)qq4 5
.rr 
HasMaxLengthrr %
(rr% &
$numrr& )
)rr) *
;rr* +
btt 
.tt 
Propertytt 
<tt 
inttt "
?tt" #
>tt# $
(tt$ %
$strtt% /
)tt/ 0
;tt0 1
bvv 
.vv 
Propertyvv 
<vv 
longvv #
?vv# $
>vv$ %
(vv% &
$strvv& .
)vv. /
;vv/ 0
bxx 
.xx 
HasKeyxx 
(xx 
$strxx !
)xx! "
;xx" #
bzz 
.zz 
HasIndexzz 
(zz 
$strzz )
,zz) *
$strzz+ >
)zz> ?
;zz? @
b|| 
.|| 
HasIndex|| 
(|| 
$str|| )
,||) *
$str||+ :
)||: ;
;||; <
b~~ 
.~~ 
HasIndex~~ 
(~~ 
$str~~ )
,~~) *
$str~~+ 3
)~~3 4
;~~4 5
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� ,
)
��, -
;
��- .
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  E
,
��E F
b
��G H
=>
��I K
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 6
)
��6 7
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
;
��% &
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 1
)
��1 2
;
��2 3
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasDiscriminator
�� &
<
��& '
string
��' -
>
��- .
(
��. /
$str
��/ >
)
��> ?
.
��? @
HasValue
��@ H
(
��H I
$str
��I \
)
��\ ]
;
��] ^
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 2
)
��2 3
;
��3 4
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 3
)
��3 4
;
��4 5
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ ,
)
��, -
;
��- .
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 6
)
��6 7
;
��7 8
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� -
)
��- .
;
��. /
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  E
,
��E F
b
��G H
=>
��I K
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 8
)
��8 9
;
��9 :
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 9
)
��9 :
;
��: ;
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* @
)
��@ A
;
��A B
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 2
)
��2 3
;
��3 4
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 1
)
��1 2
;
��2 3
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� -
)
��- .
;
��. /
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
)
��) *
;
��* +
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 9
)
��9 :
;
��: ;
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
)
��3 4
;
��4 5
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 5
)
��5 6
;
��6 7
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� /
)
��/ 0
;
��0 1
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 2
)
��2 3
;
��3 4
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 3
)
��3 4
;
��4 5
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 6
)
��6 7
;
��7 8
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� -
)
��- .
;
��. /
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 6
)
��6 7
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
)
��3 4
;
��4 5
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ :
,
��: ;
$str
��< I
)
��I J
;
��J K
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� -
)
��- .
;
��. /
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  J
,
��J K
b
��L M
=>
��N P
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 8
)
��8 9
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 3
)
��3 4
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
byte
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& .
)
��. /
;
��/ 0
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' ?
)
��? @
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
,
��' (
$str
��) 3
)
��3 4
;
��4 5
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� ,
,
��, -
$str
��. F
,
��F G
$str
��H P
)
��P Q
;
��Q R
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 4
)
��4 5
;
��5 6
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  N
,
��N O
b
��P Q
=>
��R T
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% 9
)
��9 :
;
��: ;
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ ?
)
��? @
;
��@ A
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
)
��3 4
;
��4 5
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  B
,
��B C
b
��D E
=>
��F H
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ ,
)
��, -
;
��- .
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
)
��3 4
;
��4 5
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
)
��3 4
;
��4 5
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� ,
)
��, -
;
��- .
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 6
)
��6 7
;
��7 8
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
)
��3 4
;
��4 5
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� -
)
��- .
;
��. /
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  F
,
��F G
b
��H I
=>
��J L
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 2
)
��2 3
;
��3 4
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 0
)
��0 1
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 0
)
��0 1
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 6
)
��6 7
;
��7 8
b
�� 
.
�� 
Property
�� 
<
�� 
byte
�� #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
short
�� $
>
��$ %
(
��% &
$str
��& 0
)
��0 1
;
��1 2
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� ,
,
��, -
$str
��. ;
)
��; <
;
��< =
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 1
)
��1 2
;
��2 3
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  ;
,
��; <
b
��= >
=>
��? A
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* @
)
��@ A
;
��A B
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& .
)
��. /
;
��/ 0
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' .
)
��. /
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& *
)
��* +
;
��+ ,
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 1
)
��1 2
;
��2 3
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� +
)
��+ ,
;
��, -
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  F
,
��F G
b
��H I
=>
��J L
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ (
)
��( )
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 8
)
��8 9
;
��9 :
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 1
)
��1 2
;
��2 3
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* @
)
��@ A
;
��A B
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 1
)
��1 2
;
��2 3
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� ,
)
��, -
;
��- .
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  J
,
��J K
b
��L M
=>
��N P
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' ,
)
��, -
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 5
)
��5 6
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* @
)
��@ A
;
��A B
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' /
)
��/ 0
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' .
)
��. /
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
,
��3 4
$str
��5 C
,
��C D
$str
��E J
)
��J K
;
��K L
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 0
)
��0 1
;
��1 2
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  D
,
��D E
b
��F G
=>
��H J
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
Guid
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 5
)
��5 6
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 1
)
��1 2
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' H
)
��H I
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 7
)
��7 8
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 8
)
��8 9
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& ,
)
��, -
;
��- .
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 9
)
��9 :
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
byte
�� #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 2
)
��2 3
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& ,
)
��, -
;
��- .
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 0
)
��0 1
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& ,
)
��, -
;
��- .
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 0
)
��0 1
;
��1 2
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  P
,
��P Q
b
��R S
=>
��T V
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
Guid
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 1
)
��1 2
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' H
)
��H I
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 7
)
��7 8
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 9
)
��9 :
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� 1
,
��1 2
$str
��3 C
,
��C D
$str
��E O
,
��O P
$str
��Q Y
)
��Y Z
;
��Z [
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ =
,
��= >
$str
��? O
,
��O P
$str
��Q [
,
��[ \
$str
��] e
)
��e f
;
��f g
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� <
)
��< =
;
��= >
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  J
,
��J K
b
��L M
=>
��N P
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
Guid
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 5
)
��5 6
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 1
)
��1 2
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' H
)
��H I
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 7
)
��7 8
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 9
)
��9 :
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
byte
�� #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
)
��) *
;
��* +
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 6
)
��6 7
;
��7 8
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  H
,
��H I
b
��J K
=>
��L N
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
Guid
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ +
)
��+ ,
;
��, -
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
Guid
�� #
>
��# $
(
��$ %
$str
��% ;
)
��; <
;
��< =
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
,
��' (
$str
��) 0
,
��0 1
$str
��2 @
)
��@ A
;
��A B
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 4
)
��4 5
;
��5 6
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  D
,
��D E
b
��F G
=>
��H J
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 8
)
��8 9
;
��9 :
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* @
)
��@ A
;
��A B
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
)
��) *
;
��* +
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 1
)
��1 2
;
��2 3
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 4
)
��4 5
;
��5 6
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  A
,
��A B
b
��C D
=>
��E G
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ (
)
��( )
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 9
)
��9 :
.
��  
IsConcurrencyToken
�� +
(
��+ ,
)
��, -
;
��- .
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 8
)
��8 9
;
��9 :
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& *
)
��* +
;
��+ ,
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* @
)
��@ A
;
��A B
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 7
)
��7 8
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� 3
)
��3 4
;
��4 5
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ ;
)
��; <
;
��< =
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� (
)
��( )
;
��) *
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  A
,
��A B
b
��C D
=>
��E G
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' =
)
��= >
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 9
)
��9 :
.
��  
IsConcurrencyToken
�� +
(
��+ ,
)
��, -
;
��- .
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 8
)
��8 9
;
��9 :
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 5
)
��5 6
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' >
)
��> ?
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% =
)
��= >
;
��> ?
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 9
)
��9 :
;
��: ;
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 9
)
��9 :
;
��: ;
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* @
)
��@ A
;
��A B
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* =
)
��= >
;
��> ?
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' ?
)
��? @
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' ;
)
��; <
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 1
)
��1 2
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' :
)
��: ;
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
;
��5 6
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 6
)
��6 7
;
��7 8
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 0
)
��0 1
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 1
)
��1 2
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� 3
)
��3 4
;
��4 5
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ C
)
��C D
;
��D E
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ ?
)
��? @
;
��@ A
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� (
)
��( )
;
��) *
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  <
,
��< =
b
��> ?
=>
��@ B
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ (
)
��( )
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 9
)
��9 :
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& *
)
��* +
;
��+ ,
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 8
)
��8 9
;
��9 :
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* @
)
��@ A
;
��A B
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� *
)
��* +
;
��+ ,
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� 3
)
��3 4
;
��4 5
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� ,
)
��, -
;
��- .
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� *
)
��* +
;
��+ ,
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  P
,
��P Q
b
��R S
=>
��T V
{
�� 
b
�� 
.
�� 
HasBaseType
�� !
(
��! "
$str
��" K
)
��K L
;
��L M
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ /
)
��/ 0
;
��0 1
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� *
,
��* +
$str
��, 2
)
��2 3
;
��3 4
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� +
)
��+ ,
;
��, -
b
�� 
.
�� 
HasDiscriminator
�� &
(
��& '
)
��' (
.
��( )
HasValue
��) 1
(
��1 2
$str
��2 I
)
��I J
;
��J K
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  G
,
��G H
b
��I J
=>
��K M
{
�� 
b
�� 
.
�� 
HasBaseType
�� !
(
��! "
$str
��" K
)
��K L
;
��L M
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 1
)
��1 2
;
��2 3
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� +
)
��+ ,
;
��, -
b
�� 
.
�� 
HasDiscriminator
�� &
(
��& '
)
��' (
.
��( )
HasValue
��) 1
(
��1 2
$str
��2 H
)
��H I
;
��I J
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  O
,
��O P
b
��Q R
=>
��S U
{
�� 
b
�� 
.
�� 
HasBaseType
�� !
(
��! "
$str
��" G
)
��G H
;
��H I
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ ,
)
��, -
;
��- .
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasDiscriminator
�� &
(
��& '
)
��' (
.
��( )
HasValue
��) 1
(
��1 2
$str
��2 I
)
��I J
;
��J K
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  O
,
��O P
b
��Q R
=>
��S U
{
�� 
b
�� 
.
�� 
HasBaseType
�� !
(
��! "
$str
��" G
)
��G H
;
��H I
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasDiscriminator
�� &
(
��& '
)
��' (
.
��( )
HasValue
��) 1
(
��1 2
$str
��2 I
)
��I J
;
��J K
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
)
��> ?
.
�� 
WithMany
�� !
(
��! "
$str
��" *
)
��* +
.
�� 

�� &
(
��& '
$str
��' /
)
��/ 0
.
�� 
OnDelete
�� !
(
��! "
DeleteBehavior
��" 0
.
��0 1
Cascade
��1 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
)
��> ?
.
�� 
WithMany
�� !
(
��! "
$str
��" *
)
��* +
.
�� 

�� &
(
��& '
$str
��' /
)
��/ 0
.
�� 
OnDelete
�� !
(
��! "
DeleteBehavior
��" 0
.
��0 1
Cascade
��1 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
)
��> ?
.
�� 
WithMany
�� !
(
��! "
$str
��" *
)
��* +
.
�� 

�� &
(
��& '
$str
��' /
)
��/ 0
.
�� 
OnDelete
�� !
(
��! "
DeleteBehavior
��" 0
.
��0 1
Cascade
��1 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  B
,
��B C
b
��D E
=>
��F H
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
)
��> ?
.
�� 
WithMany
�� !
(
��! "
$str
��" )
)
��) *
.
�� 

�� &
(
��& '
$str
��' /
)
��/ 0
.
�� 
OnDelete
�� !
(
��! "
DeleteBehavior
��" 0
.
��0 1
Cascade
��1 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
)
��> ?
.
�� 
WithMany
�� !
(
��! "
$str
��" *
)
��* +
.
�� 

�� &
(
��& '
$str
��' /
)
��/ 0
.
�� 
OnDelete
�� !
(
��! "
DeleteBehavior
��" 0
.
��0 1
Cascade
��1 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  ;
,
��; <
b
��= >
=>
��? A
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
)
��> ?
.
�� 
WithMany
�� !
(
��! "
$str
��" ,
)
��, -
.
�� 

�� &
(
��& '
$str
��' /
)
��/ 0
;
��0 1
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  D
,
��D E
b
��F G
=>
��H J
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� A
,
��A B
$str
��C K
)
��K L
.
�� 
WithMany
�� !
(
��! "
$str
��" ,
)
��, -
.
�� 

�� &
(
��& '
$str
��' 1
)
��1 2
;
��2 3
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  A
,
��A B
b
��C D
=>
��E G
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
,
��> ?
$str
��@ M
)
��M N
.
�� 
WithMany
�� !
(
��! "
)
��" #
.
�� 

�� &
(
��& '
$str
��' 6
)
��6 7
;
��7 8
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
,
��> ?
$str
��@ M
)
��M N
.
�� 
WithMany
�� !
(
��! "
)
��" #
.
�� 

�� &
(
��& '
$str
��' 6
)
��6 7
;
��7 8
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
,
��> ?
$str
��@ R
)
��R S
.
�� 
WithMany
�� !
(
��! "
)
��" #
.
�� 

�� &
(
��& '
$str
��' ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  A
,
��A B
b
��C D
=>
��E G
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
,
��> ?
$str
��@ M
)
��M N
.
�� 
WithMany
�� !
(
��! "
)
��" #
.
�� 

�� &
(
��& '
$str
��' 6
)
��6 7
;
��7 8
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
,
��> ?
$str
��@ M
)
��M N
.
�� 
WithMany
�� !
(
��! "
)
��" #
.
�� 

�� &
(
��& '
$str
��' 6
)
��6 7
;
��7 8
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
,
��> ?
$str
��@ R
)
��R S
.
�� 
WithMany
�� !
(
��! "
)
��" #
.
�� 

�� &
(
��& '
$str
��' ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  <
,
��< =
b
��> ?
=>
��@ B
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
,
��> ?
$str
��@ M
)
��M N
.
�� 
WithMany
�� !
(
��! "
)
��" #
.
�� 

�� &
(
��& '
$str
��' 6
)
��6 7
;
��7 8
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
,
��> ?
$str
��@ M
)
��M N
.
�� 
WithMany
�� !
(
��! "
)
��" #
.
�� 

�� &
(
��& '
$str
��' 6
)
��6 7
;
��7 8
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� ?
,
��? @
$str
��A J
)
��J K
.
�� 
WithMany
�� !
(
��! "
)
��" #
.
�� 

�� &
(
��& '
$str
��' 2
)
��2 3
;
��3 4
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
,
��> ?
$str
��@ R
)
��R S
.
�� 
WithMany
�� !
(
��! "
)
��" #
.
�� 

�� &
(
��& '
$str
��' ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  P
,
��P Q
b
��R S
=>
��T V
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� ?
,
��? @
$str
��A J
)
��J K
.
�� 
WithMany
�� !
(
��! "
)
��" #
.
�� 

�� &
(
��& '
$str
��' 2
)
��2 3
.
�� 
OnDelete
�� !
(
��! "
DeleteBehavior
��" 0
.
��0 1
Cascade
��1 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  O
,
��O P
b
��Q R
=>
��S U
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
)
��> ?
.
�� 
WithMany
�� !
(
��! "
$str
��" /
)
��/ 0
.
�� 

�� &
(
��& '
$str
��' /
)
��/ 0
.
�� 
OnDelete
�� !
(
��! "
DeleteBehavior
��" 0
.
��0 1
Cascade
��1 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  O
,
��O P
b
��Q R
=>
��S U
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
)
��> ?
.
�� 
WithMany
�� !
(
��! "
$str
��" /
)
��/ 0
.
�� 

�� &
(
��& '
$str
��' /
)
��/ 0
.
�� 
OnDelete
�� !
(
��! "
DeleteBehavior
��" 0
.
��0 1
Cascade
��1 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
}
�� 	
}
�� 
}�� ��
hF:\Code\GitHub\docker\src\AnBook.EntityFrameworkCore\Migrations\20180201051646_Upgraded_To_Abp_v3.4.0.cs
	namespace 	
AnBook
 
. 

Migrations 
{ 
public 

partial 
class  
Upgraded_To_Abp_v340 -
:. /
	Migration0 9
{		 
	protected

 
override

 
void

 
Up

  "
(

" #
MigrationBuilder

# 3
migrationBuilder

4 D
)

D E
{ 	
migrationBuilder 
. 
AlterColumn (
<( )
string) /
>/ 0
(0 1
name
:
$str
,
table 
: 
$str &
,& '
	maxLength 
: 
$num 
, 
nullable 
: 
true 
, 

oldClrType 
: 
typeof "
(" #
string# )
)) *
,* +
oldNullable 
: 
true !
)! "
;" #
migrationBuilder 
. 
AlterColumn (
<( )
string) /
>/ 0
(0 1
name 
: 
$str  
,  !
table 
: 
$str (
,( )
	maxLength 
: 
$num 
, 
nullable 
: 
true 
, 

oldClrType 
: 
typeof "
(" #
string# )
)) *
,* +
oldNullable 
: 
true !
)! "
;" #
migrationBuilder 
. 
AlterColumn (
<( )
string) /
>/ 0
(0 1
name 
: 
$str $
,$ %
table 
: 
$str (
,( )
	maxLength 
: 
$num 
, 
nullable   
:   
true   
,   

oldClrType!! 
:!! 
typeof!! "
(!!" #
string!!# )
)!!) *
,!!* +
oldNullable"" 
:"" 
true"" !
)""! "
;""" #
migrationBuilder$$ 
.$$ 
AlterColumn$$ (
<$$( )
string$$) /
>$$/ 0
($$0 1
name%% 
:%% 
$str%% !
,%%! "
table&& 
:&& 
$str&& &
,&&& '
	maxLength'' 
:'' 
$num'' 
,'' 
nullable(( 
:(( 
true(( 
,(( 

oldClrType)) 
:)) 
typeof)) "
())" #
string))# )
)))) *
,))* +
oldNullable** 
:** 
true** !
)**! "
;**" #
migrationBuilder,, 
.,, 
CreateTable,, (
(,,( )
name-- 
:-- 
$str-- +
,--+ ,
columns.. 
:.. 
table.. 
=>.. !
new.." %
{// 
Id00 
=00 
table00 
.00 
Column00 %
<00% &
long00& *
>00* +
(00+ ,
nullable00, 4
:004 5
false006 ;
)00; <
.11 

Annotation11 #
(11# $
$str11$ G
,11G H,
 SqlServerValueGenerationStrategy11I i
.11i j
IdentityColumn11j x
)11x y
,11y z
BrowserInfo22 
=22  !
table22" '
.22' (
Column22( .
<22. /
string22/ 5
>225 6
(226 7
	maxLength227 @
:22@ A
$num22B E
,22E F
nullable22G O
:22O P
true22Q U
)22U V
,22V W
ClientIpAddress33 #
=33$ %
table33& +
.33+ ,
Column33, 2
<332 3
string333 9
>339 :
(33: ;
	maxLength33; D
:33D E
$num33F H
,33H I
nullable33J R
:33R S
true33T X
)33X Y
,33Y Z

ClientName44 
=44  
table44! &
.44& '
Column44' -
<44- .
string44. 4
>444 5
(445 6
	maxLength446 ?
:44? @
$num44A D
,44D E
nullable44F N
:44N O
true44P T
)44T U
,44U V
CreationTime55  
=55! "
table55# (
.55( )
Column55) /
<55/ 0
DateTime550 8
>558 9
(559 :
nullable55: B
:55B C
false55D I
)55I J
,55J K

=66" #
table66$ )
.66) *
Column66* 0
<660 1
string661 7
>667 8
(668 9
nullable669 A
:66A B
true66C G
)66G H
,66H I 
ImpersonatorTenantId77 (
=77) *
table77+ 0
.770 1
Column771 7
<777 8
int778 ;
>77; <
(77< =
nullable77= E
:77E F
true77G K
)77K L
,77L M
ImpersonatorUserId88 &
=88' (
table88) .
.88. /
Column88/ 5
<885 6
long886 :
>88: ;
(88; <
nullable88< D
:88D E
true88F J
)88J K
,88K L
Reason99 
=99 
table99 "
.99" #
Column99# )
<99) *
string99* 0
>990 1
(991 2
	maxLength992 ;
:99; <
$num99= @
,99@ A
nullable99B J
:99J K
true99L P
)99P Q
,99Q R
TenantId:: 
=:: 
table:: $
.::$ %
Column::% +
<::+ ,
int::, /
>::/ 0
(::0 1
nullable::1 9
:::9 :
true::; ?
)::? @
,::@ A
UserId;; 
=;; 
table;; "
.;;" #
Column;;# )
<;;) *
long;;* .
>;;. /
(;;/ 0
nullable;;0 8
:;;8 9
true;;: >
);;> ?
}<< 
,<< 
constraints== 
:== 
table== "
=>==# %
{>> 
table?? 
.?? 

PrimaryKey?? $
(??$ %
$str??% =
,??= >
x??? @
=>??A C
x??D E
.??E F
Id??F H
)??H I
;??I J
}@@ 
)@@ 
;@@ 
migrationBuilderBB 
.BB 
CreateTableBB (
(BB( )
nameCC 
:CC 
$strCC (
,CC( )
columnsDD 
:DD 
tableDD 
=>DD !
newDD" %
{EE 
IdFF 
=FF 
tableFF 
.FF 
ColumnFF %
<FF% &
longFF& *
>FF* +
(FF+ ,
nullableFF, 4
:FF4 5
falseFF6 ;
)FF; <
.GG 

AnnotationGG #
(GG# $
$strGG$ G
,GGG H,
 SqlServerValueGenerationStrategyGGI i
.GGi j
IdentityColumnGGj x
)GGx y
,GGy z

ChangeTimeHH 
=HH  
tableHH! &
.HH& '
ColumnHH' -
<HH- .
DateTimeHH. 6
>HH6 7
(HH7 8
nullableHH8 @
:HH@ A
falseHHB G
)HHG H
,HHH I

ChangeTypeII 
=II  
tableII! &
.II& '
ColumnII' -
<II- .
byteII. 2
>II2 3
(II3 4
nullableII4 <
:II< =
falseII> C
)IIC D
,IID E
EntityChangeSetIdJJ %
=JJ& '
tableJJ( -
.JJ- .
ColumnJJ. 4
<JJ4 5
longJJ5 9
>JJ9 :
(JJ: ;
nullableJJ; C
:JJC D
falseJJE J
)JJJ K
,JJK L
EntityIdKK 
=KK 
tableKK $
.KK$ %
ColumnKK% +
<KK+ ,
stringKK, 2
>KK2 3
(KK3 4
	maxLengthKK4 =
:KK= >
$numKK? A
,KKA B
nullableKKC K
:KKK L
trueKKM Q
)KKQ R
,KKR S
EntityTypeFullNameLL &
=LL' (
tableLL) .
.LL. /
ColumnLL/ 5
<LL5 6
stringLL6 <
>LL< =
(LL= >
	maxLengthLL> G
:LLG H
$numLLI L
,LLL M
nullableLLN V
:LLV W
trueLLX \
)LL\ ]
,LL] ^
TenantIdMM 
=MM 
tableMM $
.MM$ %
ColumnMM% +
<MM+ ,
intMM, /
>MM/ 0
(MM0 1
nullableMM1 9
:MM9 :
trueMM; ?
)MM? @
}NN 
,NN 
constraintsOO 
:OO 
tableOO "
=>OO# %
{PP 
tableQQ 
.QQ 

PrimaryKeyQQ $
(QQ$ %
$strQQ% :
,QQ: ;
xQQ< =
=>QQ> @
xQQA B
.QQB C
IdQQC E
)QQE F
;QQF G
tableRR 
.RR 

ForeignKeyRR $
(RR$ %
nameSS 
:SS 
$strSS Y
,SSY Z
columnTT 
:TT 
xTT  !
=>TT" $
xTT% &
.TT& '
EntityChangeSetIdTT' 8
,TT8 9
principalTableUU &
:UU& '
$strUU( =
,UU= >
principalColumnVV '
:VV' (
$strVV) -
,VV- .
onDeleteWW  
:WW  !
ReferentialActionWW" 3
.WW3 4
CascadeWW4 ;
)WW; <
;WW< =
}XX 
)XX 
;XX 
migrationBuilderZZ 
.ZZ 
CreateTableZZ (
(ZZ( )
name[[ 
:[[ 
$str[[ 0
,[[0 1
columns\\ 
:\\ 
table\\ 
=>\\ !
new\\" %
{]] 
Id^^ 
=^^ 
table^^ 
.^^ 
Column^^ %
<^^% &
long^^& *
>^^* +
(^^+ ,
nullable^^, 4
:^^4 5
false^^6 ;
)^^; <
.__ 

Annotation__ #
(__# $
$str__$ G
,__G H,
 SqlServerValueGenerationStrategy__I i
.__i j
IdentityColumn__j x
)__x y
,__y z
EntityChangeId`` "
=``# $
table``% *
.``* +
Column``+ 1
<``1 2
long``2 6
>``6 7
(``7 8
nullable``8 @
:``@ A
false``B G
)``G H
,``H I
NewValueaa 
=aa 
tableaa $
.aa$ %
Columnaa% +
<aa+ ,
stringaa, 2
>aa2 3
(aa3 4
	maxLengthaa4 =
:aa= >
$numaa? B
,aaB C
nullableaaD L
:aaL M
trueaaN R
)aaR S
,aaS T

=bb" #
tablebb$ )
.bb) *
Columnbb* 0
<bb0 1
stringbb1 7
>bb7 8
(bb8 9
	maxLengthbb9 B
:bbB C
$numbbD G
,bbG H
nullablebbI Q
:bbQ R
truebbS W
)bbW X
,bbX Y
PropertyNamecc  
=cc! "
tablecc# (
.cc( )
Columncc) /
<cc/ 0
stringcc0 6
>cc6 7
(cc7 8
	maxLengthcc8 A
:ccA B
$numccC E
,ccE F
nullableccG O
:ccO P
trueccQ U
)ccU V
,ccV W 
PropertyTypeFullNamedd (
=dd) *
tabledd+ 0
.dd0 1
Columndd1 7
<dd7 8
stringdd8 >
>dd> ?
(dd? @
	maxLengthdd@ I
:ddI J
$numddK N
,ddN O
nullableddP X
:ddX Y
trueddZ ^
)dd^ _
,dd_ `
TenantIdee 
=ee 
tableee $
.ee$ %
Columnee% +
<ee+ ,
intee, /
>ee/ 0
(ee0 1
nullableee1 9
:ee9 :
trueee; ?
)ee? @
}ff 
,ff 
constraintsgg 
:gg 
tablegg "
=>gg# %
{hh 
tableii 
.ii 

PrimaryKeyii $
(ii$ %
$strii% B
,iiB C
xiiD E
=>iiF H
xiiI J
.iiJ K
IdiiK M
)iiM N
;iiN O
tablejj 
.jj 

ForeignKeyjj $
(jj$ %
namekk 
:kk 
$strkk [
,kk[ \
columnll 
:ll 
xll  !
=>ll" $
xll% &
.ll& '
EntityChangeIdll' 5
,ll5 6
principalTablemm &
:mm& '
$strmm( :
,mm: ;
principalColumnnn '
:nn' (
$strnn) -
,nn- .
onDeleteoo  
:oo  !
ReferentialActionoo" 3
.oo3 4
Cascadeoo4 ;
)oo; <
;oo< =
}pp 
)pp 
;pp 
migrationBuilderrr 
.rr 
CreateIndexrr (
(rr( )
namess 
:ss 
$strss =
,ss= >
tablett 
:tt 
$strtt )
,tt) *
columnuu 
:uu 
$struu +
)uu+ ,
;uu, -
migrationBuilderww 
.ww 
CreateIndexww (
(ww( )
namexx 
:xx 
$strxx G
,xxG H
tableyy 
:yy 
$stryy )
,yy) *
columnszz 
:zz 
newzz 
[zz 
]zz 
{zz  
$strzz! 5
,zz5 6
$strzz7 A
}zzB C
)zzC D
;zzD E
migrationBuilder|| 
.|| 
CreateIndex|| (
(||( )
name}} 
:}} 
$str}} D
,}}D E
table~~ 
:~~ 
$str~~ ,
,~~, -
columns 
: 
new 
[ 
] 
{  
$str! +
,+ ,
$str- ;
}< =
)= >
;> ?
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� >
,
��> ?
table
�� 
:
�� 
$str
�� ,
,
��, -
columns
�� 
:
�� 
new
�� 
[
�� 
]
�� 
{
��  
$str
��! +
,
��+ ,
$str
��- 5
}
��6 7
)
��7 8
;
��8 9
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� >
,
��> ?
table
�� 
:
�� 
$str
�� ,
,
��, -
columns
�� 
:
�� 
new
�� 
[
�� 
]
�� 
{
��  
$str
��! +
,
��+ ,
$str
��- 5
}
��6 7
)
��7 8
;
��8 9
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� B
,
��B C
table
�� 
:
�� 
$str
�� 1
,
��1 2
column
�� 
:
�� 
$str
�� (
)
��( )
;
��) *
}
�� 	
	protected
�� 
override
�� 
void
�� 
Down
��  $
(
��$ %
MigrationBuilder
��% 5
migrationBuilder
��6 F
)
��F G
{
�� 	
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� 0
)
��0 1
;
��1 2
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� (
)
��( )
;
��) *
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� +
)
��+ ,
;
��, -
migrationBuilder
�� 
.
�� 
AlterColumn
�� (
<
��( )
string
��) /
>
��/ 0
(
��0 1
name
�� 
:
�� 
$str
�� !
,
��! "
table
�� 
:
�� 
$str
�� &
,
��& '
nullable
�� 
:
�� 
true
�� 
,
�� 

oldClrType
�� 
:
�� 
typeof
�� "
(
��" #
string
��# )
)
��) *
,
��* +
oldMaxLength
�� 
:
�� 
$num
�� !
,
��! "
oldNullable
�� 
:
�� 
true
�� !
)
��! "
;
��" #
migrationBuilder
�� 
.
�� 
AlterColumn
�� (
<
��( )
string
��) /
>
��/ 0
(
��0 1
name
�� 
:
�� 
$str
��  
,
��  !
table
�� 
:
�� 
$str
�� (
,
��( )
nullable
�� 
:
�� 
true
�� 
,
�� 

oldClrType
�� 
:
�� 
typeof
�� "
(
��" #
string
��# )
)
��) *
,
��* +
oldMaxLength
�� 
:
�� 
$num
��  
,
��  !
oldNullable
�� 
:
�� 
true
�� !
)
��! "
;
��" #
migrationBuilder
�� 
.
�� 
AlterColumn
�� (
<
��( )
string
��) /
>
��/ 0
(
��0 1
name
�� 
:
�� 
$str
�� $
,
��$ %
table
�� 
:
�� 
$str
�� (
,
��( )
nullable
�� 
:
�� 
true
�� 
,
�� 

oldClrType
�� 
:
�� 
typeof
�� "
(
��" #
string
��# )
)
��) *
,
��* +
oldMaxLength
�� 
:
�� 
$num
�� !
,
��! "
oldNullable
�� 
:
�� 
true
�� !
)
��! "
;
��" #
migrationBuilder
�� 
.
�� 
AlterColumn
�� (
<
��( )
string
��) /
>
��/ 0
(
��0 1
name
�� 
:
�� 
$str
�� !
,
��! "
table
�� 
:
�� 
$str
�� &
,
��& '
nullable
�� 
:
�� 
true
�� 
,
�� 

oldClrType
�� 
:
�� 
typeof
�� "
(
��" #
string
��# )
)
��) *
,
��* +
oldMaxLength
�� 
:
�� 
$num
�� !
,
��! "
oldNullable
�� 
:
�� 
true
�� !
)
��! "
;
��" #
}
�� 	
}
�� 
}�� ��
qF:\Code\GitHub\docker\src\AnBook.EntityFrameworkCore\Migrations\20180201051646_Upgraded_To_Abp_v3.4.0.Designer.cs
	namespace 	
AnBook
 
. 

Migrations 
{ 
[ 
	DbContext 
( 
typeof 
( 
AnBookDbContext %
)% &
)& '
]' (
[ 
	Migration 
( 
$str 6
)6 7
]7 8
partial 
class  
Upgraded_To_Abp_v340 &
{ 
	protected 
override 
void 
BuildTargetModel  0
(0 1
ModelBuilder1 =
modelBuilder> J
)J K
{ 	
modelBuilder 
. 

( 
$str /
,/ 0
$str1 @
)@ A
. 

( 
$str B
,B C,
 SqlServerValueGenerationStrategyD d
.d e
IdentityColumne s
)s t
;t u
modelBuilder 
. 
Entity 
(  
$str  B
,B C
bD E
=>F H
{ 
b 
. 
Property 
< 
int "
>" #
(# $
$str$ (
)( )
.   
ValueGeneratedOnAdd   ,
(  , -
)  - .
;  . /
b"" 
."" 
Property"" 
<"" 
DateTime"" '
>""' (
(""( )
$str"") 7
)""7 8
;""8 9
b$$ 
.$$ 
Property$$ 
<$$ 
long$$ #
?$$# $
>$$$ %
($$% &
$str$$& 5
)$$5 6
;$$6 7
b&& 
.&& 
Property&& 
<&& 
long&& #
?&&# $
>&&$ %
(&&% &
$str&&& 5
)&&5 6
;&&6 7
b(( 
.(( 
Property(( 
<(( 
DateTime(( '
?((' (
>((( )
((() *
$str((* 8
)((8 9
;((9 :
b** 
.** 
Property** 
<** 
string** %
>**% &
(**& '
$str**' 4
)**4 5
.++ 

IsRequired++ #
(++# $
)++$ %
.,, 
HasMaxLength,, %
(,,% &
$num,,& (
),,( )
;,,) *
b.. 
... 
Property.. 
<.. 
bool.. #
>..# $
(..$ %
$str..% 0
)..0 1
;..1 2
b00 
.00 
Property00 
<00 
DateTime00 '
?00' (
>00( )
(00) *
$str00* @
)00@ A
;00A B
b22 
.22 
Property22 
<22 
long22 #
?22# $
>22$ %
(22% &
$str22& :
)22: ;
;22; <
b44 
.44 
Property44 
<44 
string44 %
>44% &
(44& '
$str44' -
)44- .
.55 

IsRequired55 #
(55# $
)55$ %
.66 
HasMaxLength66 %
(66% &
$num66& (
)66( )
;66) *
b88 
.88 
HasKey88 
(88 
$str88 !
)88! "
;88" #
b:: 
.:: 
ToTable:: 
(:: 
$str:: +
)::+ ,
;::, -
};; 
);; 
;;; 
modelBuilder== 
.== 
Entity== 
(==  
$str==  I
,==I J
b==K L
=>==M O
{>> 
b?? 
.?? 
Property?? 
<?? 
long?? #
>??# $
(??$ %
$str??% )
)??) *
.@@ 
ValueGeneratedOnAdd@@ ,
(@@, -
)@@- .
;@@. /
bBB 
.BB 
PropertyBB 
<BB 
DateTimeBB '
>BB' (
(BB( )
$strBB) 7
)BB7 8
;BB8 9
bDD 
.DD 
PropertyDD 
<DD 
longDD #
?DD# $
>DD$ %
(DD% &
$strDD& 5
)DD5 6
;DD6 7
bFF 
.FF 
PropertyFF 
<FF 
stringFF %
>FF% &
(FF& '
$strFF' 6
)FF6 7
.GG 

IsRequiredGG #
(GG# $
)GG$ %
;GG% &
bII 
.II 
PropertyII 
<II 
stringII %
>II% &
(II& '
$strII' -
)II- .
.JJ 

IsRequiredJJ #
(JJ# $
)JJ$ %
.KK 
HasMaxLengthKK %
(KK% &
$numKK& )
)KK) *
;KK* +
bMM 
.MM 
PropertyMM 
<MM 
intMM "
?MM" #
>MM# $
(MM$ %
$strMM% /
)MM/ 0
;MM0 1
bOO 
.OO 
PropertyOO 
<OO 
stringOO %
>OO% &
(OO& '
$strOO' .
)OO. /
.PP 

IsRequiredPP #
(PP# $
)PP$ %
.QQ 
HasMaxLengthQQ %
(QQ% &
$numQQ& *
)QQ* +
;QQ+ ,
bSS 
.SS 
HasKeySS 
(SS 
$strSS !
)SS! "
;SS" #
bUU 
.UU 
ToTableUU 
(UU 
$strUU +
)UU+ ,
;UU, -
bWW 
.WW 
HasDiscriminatorWW &
<WW& '
stringWW' -
>WW- .
(WW. /
$strWW/ >
)WW> ?
.WW? @
HasValueWW@ H
(WWH I
$strWWI Y
)WWY Z
;WWZ [
}XX 
)XX 
;XX 
modelBuilderZZ 
.ZZ 
EntityZZ 
(ZZ  
$strZZ  7
,ZZ7 8
bZZ9 :
=>ZZ; =
{[[ 
b\\ 
.\\ 
Property\\ 
<\\ 
long\\ #
>\\# $
(\\$ %
$str\\% )
)\\) *
.]] 
ValueGeneratedOnAdd]] ,
(]], -
)]]- .
;]]. /
b__ 
.__ 
Property__ 
<__ 
string__ %
>__% &
(__& '
$str__' 4
)__4 5
.`` 
HasMaxLength`` %
(``% &
$num``& )
)``) *
;``* +
bbb 
.bb 
Propertybb 
<bb 
stringbb %
>bb% &
(bb& '
$strbb' 8
)bb8 9
.cc 
HasMaxLengthcc %
(cc% &
$numcc& (
)cc( )
;cc) *
bee 
.ee 
Propertyee 
<ee 
stringee %
>ee% &
(ee& '
$stree' 3
)ee3 4
.ff 
HasMaxLengthff %
(ff% &
$numff& )
)ff) *
;ff* +
bhh 
.hh 
Propertyhh 
<hh 
stringhh %
>hh% &
(hh& '
$strhh' 3
)hh3 4
.ii 
HasMaxLengthii %
(ii% &
$numii& *
)ii* +
;ii+ ,
bkk 
.kk 
Propertykk 
<kk 
stringkk %
>kk% &
(kk& '
$strkk' 2
)kk2 3
.ll 
HasMaxLengthll %
(ll% &
$numll& *
)ll* +
;ll+ ,
bnn 
.nn 
Propertynn 
<nn 
intnn "
>nn" #
(nn# $
$strnn$ 7
)nn7 8
;nn8 9
bpp 
.pp 
Propertypp 
<pp 
DateTimepp '
>pp' (
(pp( )
$strpp) 8
)pp8 9
;pp9 :
brr 
.rr 
Propertyrr 
<rr 
intrr "
?rr" #
>rr# $
(rr$ %
$strrr% ;
)rr; <
;rr< =
btt 
.tt 
Propertytt 
<tt 
longtt #
?tt# $
>tt$ %
(tt% &
$strtt& :
)tt: ;
;tt; <
bvv 
.vv 
Propertyvv 
<vv 
stringvv %
>vv% &
(vv& '
$strvv' 3
)vv3 4
.ww 
HasMaxLengthww %
(ww% &
$numww& )
)ww) *
;ww* +
byy 
.yy 
Propertyyy 
<yy 
stringyy %
>yy% &
(yy& '
$stryy' 3
)yy3 4
.zz 
HasMaxLengthzz %
(zz% &
$numzz& *
)zz* +
;zz+ ,
b|| 
.|| 
Property|| 
<|| 
string|| %
>||% &
(||& '
$str||' 4
)||4 5
.}} 
HasMaxLength}} %
(}}% &
$num}}& )
)}}) *
;}}* +
b 
. 
Property 
< 
int "
?" #
># $
($ %
$str% /
)/ 0
;0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ >
)
��> ?
;
��? @
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ :
)
��: ;
;
��; <
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
)
��3 4
;
��4 5
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� ,
)
��, -
;
��- .
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  E
,
��E F
b
��G H
=>
��I K
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 6
)
��6 7
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
;
��% &
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 1
)
��1 2
;
��2 3
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasDiscriminator
�� &
<
��& '
string
��' -
>
��- .
(
��. /
$str
��/ >
)
��> ?
.
��? @
HasValue
��@ H
(
��H I
$str
��I \
)
��\ ]
;
��] ^
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 2
)
��2 3
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 3
)
��3 4
;
��4 5
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ ,
)
��, -
;
��- .
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 6
)
��6 7
;
��7 8
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� -
)
��- .
;
��. /
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  E
,
��E F
b
��G H
=>
��I K
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 8
)
��8 9
;
��9 :
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 5
)
��5 6
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 9
)
��9 :
;
��: ;
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* @
)
��@ A
;
��A B
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 2
)
��2 3
;
��3 4
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 1
)
��1 2
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� -
)
��- .
;
��. /
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
)
��) *
;
��* +
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 9
)
��9 :
;
��: ;
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
)
��3 4
;
��4 5
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 5
)
��5 6
;
��6 7
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� /
)
��/ 0
;
��0 1
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 2
)
��2 3
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 3
)
��3 4
;
��4 5
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 6
)
��6 7
;
��7 8
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� -
)
��- .
;
��. /
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 6
)
��6 7
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
)
��3 4
;
��4 5
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ :
,
��: ;
$str
��< I
)
��I J
;
��J K
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� -
)
��- .
;
��. /
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  J
,
��J K
b
��L M
=>
��N P
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 8
)
��8 9
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 3
)
��3 4
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
byte
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& .
)
��. /
;
��/ 0
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' ?
)
��? @
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
,
��' (
$str
��) 3
)
��3 4
;
��4 5
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� ,
,
��, -
$str
��. F
,
��F G
$str
��H P
)
��P Q
;
��Q R
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 4
)
��4 5
;
��5 6
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  N
,
��N O
b
��P Q
=>
��R T
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% 9
)
��9 :
;
��: ;
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ ?
)
��? @
;
��@ A
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
)
��3 4
;
��4 5
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  B
,
��B C
b
��D E
=>
��F H
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ ,
)
��, -
;
��- .
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
)
��3 4
;
��4 5
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
)
��3 4
;
��4 5
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� ,
)
��, -
;
��- .
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 6
)
��6 7
;
��7 8
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
)
��3 4
;
��4 5
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� -
)
��- .
;
��. /
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  F
,
��F G
b
��H I
=>
��J L
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 2
)
��2 3
;
��3 4
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 0
)
��0 1
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 0
)
��0 1
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 6
)
��6 7
;
��7 8
b
�� 
.
�� 
Property
�� 
<
�� 
byte
�� #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
short
�� $
>
��$ %
(
��% &
$str
��& 0
)
��0 1
;
��1 2
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� ,
,
��, -
$str
��. ;
)
��; <
;
��< =
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 1
)
��1 2
;
��2 3
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  ;
,
��; <
b
��= >
=>
��? A
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* @
)
��@ A
;
��A B
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& .
)
��. /
;
��/ 0
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' .
)
��. /
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& *
)
��* +
;
��+ ,
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 1
)
��1 2
;
��2 3
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� +
)
��+ ,
;
��, -
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  @
,
��@ A
b
��B C
=>
��D F
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
byte
�� #
>
��# $
(
��$ %
$str
��% 1
)
��1 2
;
��2 3
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% 8
)
��8 9
;
��9 :
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 1
)
��1 2
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' ;
)
��; <
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� 2
)
��2 3
;
��3 4
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� 3
,
��3 4
$str
��5 ?
)
��? @
;
��@ A
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 0
)
��0 1
;
��1 2
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 8
)
��8 9
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 3
)
��3 4
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 6
)
��6 7
;
��7 8
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% ;
)
��; <
;
��< =
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' /
)
��/ 0
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 9
)
��9 :
;
��: ;
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
)
��3 4
;
��4 5
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
)
��3 4
;
��4 5
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 3
)
��3 4
;
��4 5
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  H
,
��H I
b
��J K
=>
��L N
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 1
)
��1 2
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 6
)
��6 7
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 5
)
��5 6
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' =
)
��= >
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� /
)
��/ 0
;
��0 1
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  F
,
��F G
b
��H I
=>
��J L
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ (
)
��( )
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 8
)
��8 9
;
��9 :
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 1
)
��1 2
;
��2 3
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* @
)
��@ A
;
��A B
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 1
)
��1 2
;
��2 3
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� ,
)
��, -
;
��- .
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  J
,
��J K
b
��L M
=>
��N P
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' ,
)
��, -
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 5
)
��5 6
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* @
)
��@ A
;
��A B
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' /
)
��/ 0
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' .
)
��. /
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
,
��3 4
$str
��5 C
,
��C D
$str
��E J
)
��J K
;
��K L
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 0
)
��0 1
;
��1 2
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  D
,
��D E
b
��F G
=>
��H J
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
Guid
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 5
)
��5 6
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 1
)
��1 2
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' H
)
��H I
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 7
)
��7 8
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 8
)
��8 9
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& ,
)
��, -
;
��- .
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 9
)
��9 :
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
byte
�� #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 2
)
��2 3
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& ,
)
��, -
;
��- .
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 0
)
��0 1
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& ,
)
��, -
;
��- .
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 0
)
��0 1
;
��1 2
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  P
,
��P Q
b
��R S
=>
��T V
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
Guid
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 1
)
��1 2
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' H
)
��H I
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 7
)
��7 8
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 9
)
��9 :
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� 1
,
��1 2
$str
��3 C
,
��C D
$str
��E O
,
��O P
$str
��Q Y
)
��Y Z
;
��Z [
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ =
,
��= >
$str
��? O
,
��O P
$str
��Q [
,
��[ \
$str
��] e
)
��e f
;
��f g
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� <
)
��< =
;
��= >
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  J
,
��J K
b
��L M
=>
��N P
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
Guid
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 5
)
��5 6
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 1
)
��1 2
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' H
)
��H I
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 7
)
��7 8
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 9
)
��9 :
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
byte
�� #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
)
��) *
;
��* +
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 6
)
��6 7
;
��7 8
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  H
,
��H I
b
��J K
=>
��L N
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
Guid
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ +
)
��+ ,
;
��, -
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
Guid
�� #
>
��# $
(
��$ %
$str
��% ;
)
��; <
;
��< =
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
,
��' (
$str
��) 0
,
��0 1
$str
��2 @
)
��@ A
;
��A B
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 4
)
��4 5
;
��5 6
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  D
,
��D E
b
��F G
=>
��H J
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 8
)
��8 9
;
��9 :
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* @
)
��@ A
;
��A B
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
)
��) *
;
��* +
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 1
)
��1 2
;
��2 3
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 4
)
��4 5
;
��5 6
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  A
,
��A B
b
��C D
=>
��E G
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ (
)
��( )
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 9
)
��9 :
.
��  
IsConcurrencyToken
�� +
(
��+ ,
)
��, -
;
��- .
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 8
)
��8 9
;
��9 :
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& *
)
��* +
;
��+ ,
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* @
)
��@ A
;
��A B
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 7
)
��7 8
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� 3
)
��3 4
;
��4 5
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ ;
)
��; <
;
��< =
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� (
)
��( )
;
��) *
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  A
,
��A B
b
��C D
=>
��E G
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' =
)
��= >
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 9
)
��9 :
.
��  
IsConcurrencyToken
�� +
(
��+ ,
)
��, -
;
��- .
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 8
)
��8 9
;
��9 :
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 5
)
��5 6
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' >
)
��> ?
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% =
)
��= >
;
��> ?
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 9
)
��9 :
;
��: ;
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 9
)
��9 :
;
��: ;
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* @
)
��@ A
;
��A B
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* =
)
��= >
;
��> ?
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' ?
)
��? @
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' ;
)
��; <
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 1
)
��1 2
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' :
)
��: ;
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
;
��5 6
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 6
)
��6 7
;
��7 8
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 0
)
��0 1
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 1
)
��1 2
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� 3
)
��3 4
;
��4 5
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ C
)
��C D
;
��D E
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ ?
)
��? @
;
��@ A
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� (
)
��( )
;
��) *
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  <
,
��< =
b
��> ?
=>
��@ B
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ (
)
��( )
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 9
)
��9 :
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& *
)
��* +
;
��+ ,
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 8
)
��8 9
;
��9 :
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* @
)
��@ A
;
��A B
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� *
)
��* +
;
��+ ,
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� 3
)
��3 4
;
��4 5
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� ,
)
��, -
;
��- .
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� *
)
��* +
;
��+ ,
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  P
,
��P Q
b
��R S
=>
��T V
{
�� 
b
�� 
.
�� 
HasBaseType
�� !
(
��! "
$str
��" K
)
��K L
;
��L M
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ /
)
��/ 0
;
��0 1
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� *
,
��* +
$str
��, 2
)
��2 3
;
��3 4
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� +
)
��+ ,
;
��, -
b
�� 
.
�� 
HasDiscriminator
�� &
(
��& '
)
��' (
.
��( )
HasValue
��) 1
(
��1 2
$str
��2 I
)
��I J
;
��J K
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  G
,
��G H
b
��I J
=>
��K M
{
�� 
b
�� 
.
�� 
HasBaseType
�� !
(
��! "
$str
��" K
)
��K L
;
��L M
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 1
)
��1 2
;
��2 3
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� +
)
��+ ,
;
��, -
b
�� 
.
�� 
HasDiscriminator
�� &
(
��& '
)
��' (
.
��( )
HasValue
��) 1
(
��1 2
$str
��2 H
)
��H I
;
��I J
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  O
,
��O P
b
��Q R
=>
��S U
{
�� 
b
�� 
.
�� 
HasBaseType
�� !
(
��! "
$str
��" G
)
��G H
;
��H I
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ ,
)
��, -
;
��- .
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasDiscriminator
�� &
(
��& '
)
��' (
.
��( )
HasValue
��) 1
(
��1 2
$str
��2 I
)
��I J
;
��J K
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  O
,
��O P
b
��Q R
=>
��S U
{
�� 
b
�� 
.
�� 
HasBaseType
�� !
(
��! "
$str
��" G
)
��G H
;
��H I
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasDiscriminator
�� &
(
��& '
)
��' (
.
��( )
HasValue
��) 1
(
��1 2
$str
��2 I
)
��I J
;
��J K
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
)
��> ?
.
�� 
WithMany
�� !
(
��! "
$str
��" *
)
��* +
.
�� 

�� &
(
��& '
$str
��' /
)
��/ 0
.
�� 
OnDelete
�� !
(
��! "
DeleteBehavior
��" 0
.
��0 1
Cascade
��1 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
)
��> ?
.
�� 
WithMany
�� !
(
��! "
$str
��" *
)
��* +
.
�� 

�� &
(
��& '
$str
��' /
)
��/ 0
.
�� 
OnDelete
�� !
(
��! "
DeleteBehavior
��" 0
.
��0 1
Cascade
��1 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
)
��> ?
.
�� 
WithMany
�� !
(
��! "
$str
��" *
)
��* +
.
�� 

�� &
(
��& '
$str
��' /
)
��/ 0
.
�� 
OnDelete
�� !
(
��! "
DeleteBehavior
��" 0
.
��0 1
Cascade
��1 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  B
,
��B C
b
��D E
=>
��F H
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
)
��> ?
.
�� 
WithMany
�� !
(
��! "
$str
��" )
)
��) *
.
�� 

�� &
(
��& '
$str
��' /
)
��/ 0
.
�� 
OnDelete
�� !
(
��! "
DeleteBehavior
��" 0
.
��0 1
Cascade
��1 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
)
��> ?
.
�� 
WithMany
�� !
(
��! "
$str
��" *
)
��* +
.
�� 

�� &
(
��& '
$str
��' /
)
��/ 0
.
�� 
OnDelete
�� !
(
��! "
DeleteBehavior
��" 0
.
��0 1
Cascade
��1 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  ;
,
��; <
b
��= >
=>
��? A
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
)
��> ?
.
�� 
WithMany
�� !
(
��! "
$str
��" ,
)
��, -
.
�� 

�� &
(
��& '
$str
��' /
)
��/ 0
;
��0 1
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  @
,
��@ A
b
��B C
=>
��D F
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� @
)
��@ A
.
�� 
WithMany
�� !
(
��! "
$str
��" 1
)
��1 2
.
�� 

�� &
(
��& '
$str
��' :
)
��: ;
.
�� 
OnDelete
�� !
(
��! "
DeleteBehavior
��" 0
.
��0 1
Cascade
��1 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  H
,
��H I
b
��J K
=>
��L N
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� =
)
��= >
.
�� 
WithMany
�� !
(
��! "
$str
��" 3
)
��3 4
.
�� 

�� &
(
��& '
$str
��' 7
)
��7 8
.
�� 
OnDelete
�� !
(
��! "
DeleteBehavior
��" 0
.
��0 1
Cascade
��1 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  D
,
��D E
b
��F G
=>
��H J
{
�� 
b
�	�	 
.
�	�	 
HasOne
�	�	 
(
�	�	 
$str
�	�	 A
,
�	�	A B
$str
�	�	C K
)
�	�	K L
.
�	�	 
WithMany
�	�	 !
(
�	�	! "
$str
�	�	" ,
)
�	�	, -
.
�	�	 

�	�	 &
(
�	�	& '
$str
�	�	' 1
)
�	�	1 2
;
�	�	2 3
}
�	�	 
)
�	�	 
;
�	�	 
modelBuilder
�	�	 
.
�	�	 
Entity
�	�	 
(
�	�	  
$str
�	�	  A
,
�	�	A B
b
�	�	C D
=>
�	�	E G
{
�	�	 
b
�	�	 
.
�	�	 
HasOne
�	�	 
(
�	�	 
$str
�	�	 >
,
�	�	> ?
$str
�	�	@ M
)
�	�	M N
.
�	�	 
WithMany
�	�	 !
(
�	�	! "
)
�	�	" #
.
�	�	 

�	�	 &
(
�	�	& '
$str
�	�	' 6
)
�	�	6 7
;
�	�	7 8
b
�	�	 
.
�	�	 
HasOne
�	�	 
(
�	�	 
$str
�	�	 >
,
�	�	> ?
$str
�	�	@ M
)
�	�	M N
.
�	�	 
WithMany
�	�	 !
(
�	�	! "
)
�	�	" #
.
�	�	 

�	�	 &
(
�	�	& '
$str
�	�	' 6
)
�	�	6 7
;
�	�	7 8
b
�	�	 
.
�	�	 
HasOne
�	�	 
(
�	�	 
$str
�	�	 >
,
�	�	> ?
$str
�	�	@ R
)
�	�	R S
.
�	�	 
WithMany
�	�	 !
(
�	�	! "
)
�	�	" #
.
�	�	 

�	�	 &
(
�	�	& '
$str
�	�	' ;
)
�	�	; <
;
�	�	< =
}
�	�	 
)
�	�	 
;
�	�	 
modelBuilder
�	�	 
.
�	�	 
Entity
�	�	 
(
�	�	  
$str
�	�	  A
,
�	�	A B
b
�	�	C D
=>
�	�	E G
{
�	�	 
b
�	�	 
.
�	�	 
HasOne
�	�	 
(
�	�	 
$str
�	�	 >
,
�	�	> ?
$str
�	�	@ M
)
�	�	M N
.
�	�	 
WithMany
�	�	 !
(
�	�	! "
)
�	�	" #
.
�	�	 

�	�	 &
(
�	�	& '
$str
�	�	' 6
)
�	�	6 7
;
�	�	7 8
b
�	�	 
.
�	�	 
HasOne
�	�	 
(
�	�	 
$str
�	�	 >
,
�	�	> ?
$str
�	�	@ M
)
�	�	M N
.
�	�	 
WithMany
�	�	 !
(
�	�	! "
)
�	�	" #
.
�	�	 

�	�	 &
(
�	�	& '
$str
�	�	' 6
)
�	�	6 7
;
�	�	7 8
b
�	�	 
.
�	�	 
HasOne
�	�	 
(
�	�	 
$str
�	�	 >
,
�	�	> ?
$str
�	�	@ R
)
�	�	R S
.
�	�	 
WithMany
�	�	 !
(
�	�	! "
)
�	�	" #
.
�	�	 

�	�	 &
(
�	�	& '
$str
�	�	' ;
)
�	�	; <
;
�	�	< =
}
�	�	 
)
�	�	 
;
�	�	 
modelBuilder
�	�	 
.
�	�	 
Entity
�	�	 
(
�	�	  
$str
�	�	  <
,
�	�	< =
b
�	�	> ?
=>
�	�	@ B
{
�	�	 
b
�	�	 
.
�	�	 
HasOne
�	�	 
(
�	�	 
$str
�	�	 >
,
�	�	> ?
$str
�	�	@ M
)
�	�	M N
.
�	�	 
WithMany
�	�	 !
(
�	�	! "
)
�	�	" #
.
�	�	 

�	�	 &
(
�	�	& '
$str
�	�	' 6
)
�	�	6 7
;
�	�	7 8
b
�	�	 
.
�	�	 
HasOne
�	�	 
(
�	�	 
$str
�	�	 >
,
�	�	> ?
$str
�	�	@ M
)
�	�	M N
.
�	�	 
WithMany
�	�	 !
(
�	�	! "
)
�	�	" #
.
�	�	 

�	�	 &
(
�	�	& '
$str
�	�	' 6
)
�	�	6 7
;
�	�	7 8
b
�	�	 
.
�	�	 
HasOne
�	�	 
(
�	�	 
$str
�	�	 ?
,
�	�	? @
$str
�	�	A J
)
�	�	J K
.
�	�	 
WithMany
�	�	 !
(
�	�	! "
)
�	�	" #
.
�	�	 

�	�	 &
(
�	�	& '
$str
�	�	' 2
)
�	�	2 3
;
�	�	3 4
b
�	�	 
.
�	�	 
HasOne
�	�	 
(
�	�	 
$str
�	�	 >
,
�	�	> ?
$str
�	�	@ R
)
�	�	R S
.
�	�	 
WithMany
�	�	 !
(
�	�	! "
)
�	�	" #
.
�	�	 

�	�	 &
(
�	�	& '
$str
�	�	' ;
)
�	�	; <
;
�	�	< =
}
�	�	 
)
�	�	 
;
�	�	 
modelBuilder
�	�	 
.
�	�	 
Entity
�	�	 
(
�	�	  
$str
�	�	  P
,
�	�	P Q
b
�	�	R S
=>
�	�	T V
{
�	�	 
b
�	�	 
.
�	�	 
HasOne
�	�	 
(
�	�	 
$str
�	�	 ?
,
�	�	? @
$str
�	�	A J
)
�	�	J K
.
�	�	 
WithMany
�	�	 !
(
�	�	! "
)
�	�	" #
.
�	�	 

�	�	 &
(
�	�	& '
$str
�	�	' 2
)
�	�	2 3
.
�	�	 
OnDelete
�	�	 !
(
�	�	! "
DeleteBehavior
�	�	" 0
.
�	�	0 1
Cascade
�	�	1 8
)
�	�	8 9
;
�	�	9 :
}
�	�	 
)
�	�	 
;
�	�	 
modelBuilder
�	�	 
.
�	�	 
Entity
�	�	 
(
�	�	  
$str
�	�	  O
,
�	�	O P
b
�	�	Q R
=>
�	�	S U
{
�	�	 
b
�	�	 
.
�	�	 
HasOne
�	�	 
(
�	�	 
$str
�	�	 >
)
�	�	> ?
.
�	�	 
WithMany
�	�	 !
(
�	�	! "
$str
�	�	" /
)
�	�	/ 0
.
�	�	 

�	�	 &
(
�	�	& '
$str
�	�	' /
)
�	�	/ 0
.
�	�	 
OnDelete
�	�	 !
(
�	�	! "
DeleteBehavior
�	�	" 0
.
�	�	0 1
Cascade
�	�	1 8
)
�	�	8 9
;
�	�	9 :
}
�	�	 
)
�	�	 
;
�	�	 
modelBuilder
�	�	 
.
�	�	 
Entity
�	�	 
(
�	�	  
$str
�	�	  O
,
�	�	O P
b
�	�	Q R
=>
�	�	S U
{
�	�	 
b
�	�	 
.
�	�	 
HasOne
�	�	 
(
�	�	 
$str
�	�	 >
)
�	�	> ?
.
�	�	 
WithMany
�	�	 !
(
�	�	! "
$str
�	�	" /
)
�	�	/ 0
.
�	�	 

�	�	 &
(
�	�	& '
$str
�	�	' /
)
�	�	/ 0
.
�	�	 
OnDelete
�	�	 !
(
�	�	! "
DeleteBehavior
�	�	" 0
.
�	�	0 1
Cascade
�	�	1 8
)
�	�	8 9
;
�	�	9 :
}
�	�	 
)
�	�	 
;
�	�	 
}
�	�	 	
}
�	�	 
}�	�	 �J
hF:\Code\GitHub\docker\src\AnBook.EntityFrameworkCore\Migrations\20180320131229_Upgraded_To_Abp_v3_5_0.cs
	namespace 	
AnBook
 
. 

Migrations 
{ 
public 

partial 
class "
Upgraded_To_Abp_v3_5_0 /
:0 1
	Migration2 ;
{ 
	protected		 
override		 
void		 
Up		  "
(		" #
MigrationBuilder		# 3
migrationBuilder		4 D
)		D E
{

 	
migrationBuilder 
. 
AlterColumn (
<( )
string) /
>/ 0
(0 1
name 
: 
$str 
, 
table
:
$str
,
	maxLength 
: 
$num 
, 
nullable 
: 
true 
, 

oldClrType 
: 
typeof "
(" #
string# )
)) *
,* +
oldNullable 
: 
true !
)! "
;" #
migrationBuilder 
. 
AlterColumn (
<( )
string) /
>/ 0
(0 1
name 
: 
$str 
, 
table 
: 
$str &
,& '
	maxLength 
: 
$num 
, 
nullable 
: 
true 
, 

oldClrType 
: 
typeof "
(" #
string# )
)) *
,* +
oldNullable 
: 
true !
)! "
;" #
migrationBuilder 
. 
AlterColumn (
<( )
string) /
>/ 0
(0 1
name 
: 
$str %
,% &
table 
: 
$str &
,& '
	maxLength 
: 
$num 
, 
nullable 
: 
true 
, 

oldClrType   
:   
typeof   "
(  " #
string  # )
)  ) *
,  * +
oldNullable!! 
:!! 
true!! !
)!!! "
;!!" #
migrationBuilder## 
.## 
AlterColumn## (
<##( )
string##) /
>##/ 0
(##0 1
name$$ 
:$$ 
$str$$ %
,$$% &
table%% 
:%% 
$str%% !
,%%! "
	maxLength&& 
:&& 
$num&& 
,&& 
nullable'' 
:'' 
true'' 
,'' 

oldClrType(( 
:(( 
typeof(( "
(((" #
string((# )
)(() *
,((* +
oldNullable)) 
:)) 
true)) !
)))! "
;))" #
migrationBuilder++ 
.++ 
AlterColumn++ (
<++( )
string++) /
>++/ 0
(++0 1
name,, 
:,, 
$str,, #
,,,# $
table-- 
:-- 
$str-- !
,--! "
	maxLength.. 
:.. 
$num.. 
,.. 
nullable// 
:// 
true// 
,// 

oldClrType00 
:00 
typeof00 "
(00" #
string00# )
)00) *
,00* +
oldNullable11 
:11 
true11 !
)11! "
;11" #
migrationBuilder33 
.33 
AlterColumn33 (
<33( )
string33) /
>33/ 0
(330 1
name44 
:44 
$str44 (
,44( )
table55 
:55 
$str55 !
,55! "
	maxLength66 
:66 
$num66 
,66 
nullable77 
:77 
true77 
,77 

oldClrType88 
:88 
typeof88 "
(88" #
string88# )
)88) *
,88* +
oldNullable99 
:99 
true99 !
)99! "
;99" #
migrationBuilder;; 
.;; 
AlterColumn;; (
<;;( )
string;;) /
>;;/ 0
(;;0 1
name<< 
:<< 
$str<< (
,<<( )
table== 
:== 
$str== !
,==! "
	maxLength>> 
:>> 
$num>> 
,>> 
nullable?? 
:?? 
true?? 
,?? 

oldClrType@@ 
:@@ 
typeof@@ "
(@@" #
string@@# )
)@@) *
,@@* +
oldNullableAA 
:AA 
trueAA !
)AA! "
;AA" #
}BB 	
	protectedDD 
overrideDD 
voidDD 
DownDD  $
(DD$ %
MigrationBuilderDD% 5
migrationBuilderDD6 F
)DDF G
{EE 	
migrationBuilderFF 
.FF 
AlterColumnFF (
<FF( )
stringFF) /
>FF/ 0
(FF0 1
nameGG 
:GG 
$strGG 
,GG 
tableHH 
:HH 
$strHH &
,HH& '
nullableII 
:II 
trueII 
,II 

oldClrTypeJJ 
:JJ 
typeofJJ "
(JJ" #
stringJJ# )
)JJ) *
,JJ* +
oldMaxLengthKK 
:KK 
$numKK !
,KK! "
oldNullableLL 
:LL 
trueLL !
)LL! "
;LL" #
migrationBuilderNN 
.NN 
AlterColumnNN (
<NN( )
stringNN) /
>NN/ 0
(NN0 1
nameOO 
:OO 
$strOO 
,OO 
tablePP 
:PP 
$strPP &
,PP& '
nullableQQ 
:QQ 
trueQQ 
,QQ 

oldClrTypeRR 
:RR 
typeofRR "
(RR" #
stringRR# )
)RR) *
,RR* +
oldMaxLengthSS 
:SS 
$numSS !
,SS! "
oldNullableTT 
:TT 
trueTT !
)TT! "
;TT" #
migrationBuilderVV 
.VV 
AlterColumnVV (
<VV( )
stringVV) /
>VV/ 0
(VV0 1
nameWW 
:WW 
$strWW %
,WW% &
tableXX 
:XX 
$strXX &
,XX& '
nullableYY 
:YY 
trueYY 
,YY 

oldClrTypeZZ 
:ZZ 
typeofZZ "
(ZZ" #
stringZZ# )
)ZZ) *
,ZZ* +
oldMaxLength[[ 
:[[ 
$num[[  
,[[  !
oldNullable\\ 
:\\ 
true\\ !
)\\! "
;\\" #
migrationBuilder^^ 
.^^ 
AlterColumn^^ (
<^^( )
string^^) /
>^^/ 0
(^^0 1
name__ 
:__ 
$str__ %
,__% &
table`` 
:`` 
$str`` !
,``! "
nullableaa 
:aa 
trueaa 
,aa 

oldClrTypebb 
:bb 
typeofbb "
(bb" #
stringbb# )
)bb) *
,bb* +
oldMaxLengthcc 
:cc 
$numcc !
,cc! "
oldNullabledd 
:dd 
truedd !
)dd! "
;dd" #
migrationBuilderff 
.ff 
AlterColumnff (
<ff( )
stringff) /
>ff/ 0
(ff0 1
namegg 
:gg 
$strgg #
,gg# $
tablehh 
:hh 
$strhh !
,hh! "
nullableii 
:ii 
trueii 
,ii 

oldClrTypejj 
:jj 
typeofjj "
(jj" #
stringjj# )
)jj) *
,jj* +
oldMaxLengthkk 
:kk 
$numkk  
,kk  !
oldNullablell 
:ll 
truell !
)ll! "
;ll" #
migrationBuildernn 
.nn 
AlterColumnnn (
<nn( )
stringnn) /
>nn/ 0
(nn0 1
nameoo 
:oo 
$stroo (
,oo( )
tablepp 
:pp 
$strpp !
,pp! "
nullableqq 
:qq 
trueqq 
,qq 

oldClrTyperr 
:rr 
typeofrr "
(rr" #
stringrr# )
)rr) *
,rr* +
oldMaxLengthss 
:ss 
$numss !
,ss! "
oldNullablett 
:tt 
truett !
)tt! "
;tt" #
migrationBuildervv 
.vv 
AlterColumnvv (
<vv( )
stringvv) /
>vv/ 0
(vv0 1
nameww 
:ww 
$strww (
,ww( )
tablexx 
:xx 
$strxx !
,xx! "
nullableyy 
:yy 
trueyy 
,yy 

oldClrTypezz 
:zz 
typeofzz "
(zz" #
stringzz# )
)zz) *
,zz* +
oldMaxLength{{ 
:{{ 
$num{{ !
,{{! "
oldNullable|| 
:|| 
true|| !
)||! "
;||" #
}}} 	
}~~ 
} ɶ
qF:\Code\GitHub\docker\src\AnBook.EntityFrameworkCore\Migrations\20180320131229_Upgraded_To_Abp_v3_5_0.Designer.cs
	namespace 	
AnBook
 
. 

Migrations 
{ 
[ 
	DbContext 
( 
typeof 
( 
AnBookDbContext %
)% &
)& '
]' (
[ 
	Migration 
( 
$str 6
)6 7
]7 8
partial 
class "
Upgraded_To_Abp_v3_5_0 (
{ 
	protected 
override 
void 
BuildTargetModel  0
(0 1
ModelBuilder1 =
modelBuilder> J
)J K
{ 	
modelBuilder 
. 

( 
$str /
,/ 0
$str1 @
)@ A
. 

( 
$str B
,B C,
 SqlServerValueGenerationStrategyD d
.d e
IdentityColumne s
)s t
;t u
modelBuilder 
. 
Entity 
(  
$str  B
,B C
bD E
=>F H
{ 
b 
. 
Property 
< 
int "
>" #
(# $
$str$ (
)( )
.   
ValueGeneratedOnAdd   ,
(  , -
)  - .
;  . /
b"" 
."" 
Property"" 
<"" 
DateTime"" '
>""' (
(""( )
$str"") 7
)""7 8
;""8 9
b$$ 
.$$ 
Property$$ 
<$$ 
long$$ #
?$$# $
>$$$ %
($$% &
$str$$& 5
)$$5 6
;$$6 7
b&& 
.&& 
Property&& 
<&& 
long&& #
?&&# $
>&&$ %
(&&% &
$str&&& 5
)&&5 6
;&&6 7
b(( 
.(( 
Property(( 
<(( 
DateTime(( '
?((' (
>((( )
((() *
$str((* 8
)((8 9
;((9 :
b** 
.** 
Property** 
<** 
string** %
>**% &
(**& '
$str**' 4
)**4 5
.++ 

IsRequired++ #
(++# $
)++$ %
.,, 
HasMaxLength,, %
(,,% &
$num,,& (
),,( )
;,,) *
b.. 
... 
Property.. 
<.. 
bool.. #
>..# $
(..$ %
$str..% 0
)..0 1
;..1 2
b00 
.00 
Property00 
<00 
DateTime00 '
?00' (
>00( )
(00) *
$str00* @
)00@ A
;00A B
b22 
.22 
Property22 
<22 
long22 #
?22# $
>22$ %
(22% &
$str22& :
)22: ;
;22; <
b44 
.44 
Property44 
<44 
string44 %
>44% &
(44& '
$str44' -
)44- .
.55 

IsRequired55 #
(55# $
)55$ %
.66 
HasMaxLength66 %
(66% &
$num66& (
)66( )
;66) *
b88 
.88 
HasKey88 
(88 
$str88 !
)88! "
;88" #
b:: 
.:: 
ToTable:: 
(:: 
$str:: +
)::+ ,
;::, -
};; 
);; 
;;; 
modelBuilder== 
.== 
Entity== 
(==  
$str==  I
,==I J
b==K L
=>==M O
{>> 
b?? 
.?? 
Property?? 
<?? 
long?? #
>??# $
(??$ %
$str??% )
)??) *
.@@ 
ValueGeneratedOnAdd@@ ,
(@@, -
)@@- .
;@@. /
bBB 
.BB 
PropertyBB 
<BB 
DateTimeBB '
>BB' (
(BB( )
$strBB) 7
)BB7 8
;BB8 9
bDD 
.DD 
PropertyDD 
<DD 
longDD #
?DD# $
>DD$ %
(DD% &
$strDD& 5
)DD5 6
;DD6 7
bFF 
.FF 
PropertyFF 
<FF 
stringFF %
>FF% &
(FF& '
$strFF' 6
)FF6 7
.GG 

IsRequiredGG #
(GG# $
)GG$ %
;GG% &
bII 
.II 
PropertyII 
<II 
stringII %
>II% &
(II& '
$strII' -
)II- .
.JJ 

IsRequiredJJ #
(JJ# $
)JJ$ %
.KK 
HasMaxLengthKK %
(KK% &
$numKK& )
)KK) *
;KK* +
bMM 
.MM 
PropertyMM 
<MM 
intMM "
?MM" #
>MM# $
(MM$ %
$strMM% /
)MM/ 0
;MM0 1
bOO 
.OO 
PropertyOO 
<OO 
stringOO %
>OO% &
(OO& '
$strOO' .
)OO. /
.PP 

IsRequiredPP #
(PP# $
)PP$ %
.QQ 
HasMaxLengthQQ %
(QQ% &
$numQQ& *
)QQ* +
;QQ+ ,
bSS 
.SS 
HasKeySS 
(SS 
$strSS !
)SS! "
;SS" #
bUU 
.UU 
ToTableUU 
(UU 
$strUU +
)UU+ ,
;UU, -
bWW 
.WW 
HasDiscriminatorWW &
<WW& '
stringWW' -
>WW- .
(WW. /
$strWW/ >
)WW> ?
.WW? @
HasValueWW@ H
(WWH I
$strWWI Y
)WWY Z
;WWZ [
}XX 
)XX 
;XX 
modelBuilderZZ 
.ZZ 
EntityZZ 
(ZZ  
$strZZ  7
,ZZ7 8
bZZ9 :
=>ZZ; =
{[[ 
b\\ 
.\\ 
Property\\ 
<\\ 
long\\ #
>\\# $
(\\$ %
$str\\% )
)\\) *
.]] 
ValueGeneratedOnAdd]] ,
(]], -
)]]- .
;]]. /
b__ 
.__ 
Property__ 
<__ 
string__ %
>__% &
(__& '
$str__' 4
)__4 5
.`` 
HasMaxLength`` %
(``% &
$num``& )
)``) *
;``* +
bbb 
.bb 
Propertybb 
<bb 
stringbb %
>bb% &
(bb& '
$strbb' 8
)bb8 9
.cc 
HasMaxLengthcc %
(cc% &
$numcc& (
)cc( )
;cc) *
bee 
.ee 
Propertyee 
<ee 
stringee %
>ee% &
(ee& '
$stree' 3
)ee3 4
.ff 
HasMaxLengthff %
(ff% &
$numff& )
)ff) *
;ff* +
bhh 
.hh 
Propertyhh 
<hh 
stringhh %
>hh% &
(hh& '
$strhh' 3
)hh3 4
.ii 
HasMaxLengthii %
(ii% &
$numii& *
)ii* +
;ii+ ,
bkk 
.kk 
Propertykk 
<kk 
stringkk %
>kk% &
(kk& '
$strkk' 2
)kk2 3
.ll 
HasMaxLengthll %
(ll% &
$numll& *
)ll* +
;ll+ ,
bnn 
.nn 
Propertynn 
<nn 
intnn "
>nn" #
(nn# $
$strnn$ 7
)nn7 8
;nn8 9
bpp 
.pp 
Propertypp 
<pp 
DateTimepp '
>pp' (
(pp( )
$strpp) 8
)pp8 9
;pp9 :
brr 
.rr 
Propertyrr 
<rr 
intrr "
?rr" #
>rr# $
(rr$ %
$strrr% ;
)rr; <
;rr< =
btt 
.tt 
Propertytt 
<tt 
longtt #
?tt# $
>tt$ %
(tt% &
$strtt& :
)tt: ;
;tt; <
bvv 
.vv 
Propertyvv 
<vv 
stringvv %
>vv% &
(vv& '
$strvv' 3
)vv3 4
.ww 
HasMaxLengthww %
(ww% &
$numww& )
)ww) *
;ww* +
byy 
.yy 
Propertyyy 
<yy 
stringyy %
>yy% &
(yy& '
$stryy' 3
)yy3 4
.zz 
HasMaxLengthzz %
(zz% &
$numzz& *
)zz* +
;zz+ ,
b|| 
.|| 
Property|| 
<|| 
string|| %
>||% &
(||& '
$str||' 4
)||4 5
.}} 
HasMaxLength}} %
(}}% &
$num}}& )
)}}) *
;}}* +
b 
. 
Property 
< 
int "
?" #
># $
($ %
$str% /
)/ 0
;0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ >
)
��> ?
;
��? @
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ :
)
��: ;
;
��; <
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
)
��3 4
;
��4 5
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� ,
)
��, -
;
��- .
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  E
,
��E F
b
��G H
=>
��I K
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 6
)
��6 7
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
;
��% &
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 1
)
��1 2
;
��2 3
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasDiscriminator
�� &
<
��& '
string
��' -
>
��- .
(
��. /
$str
��/ >
)
��> ?
.
��? @
HasValue
��@ H
(
��H I
$str
��I \
)
��\ ]
;
��] ^
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 2
)
��2 3
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 3
)
��3 4
;
��4 5
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ ,
)
��, -
;
��- .
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 6
)
��6 7
;
��7 8
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� -
)
��- .
;
��. /
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  E
,
��E F
b
��G H
=>
��I K
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 8
)
��8 9
;
��9 :
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 5
)
��5 6
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 9
)
��9 :
;
��: ;
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* @
)
��@ A
;
��A B
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 2
)
��2 3
;
��3 4
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 1
)
��1 2
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� -
)
��- .
;
��. /
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
)
��) *
;
��* +
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 9
)
��9 :
;
��: ;
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
)
��3 4
;
��4 5
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 5
)
��5 6
;
��6 7
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� /
)
��/ 0
;
��0 1
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 2
)
��2 3
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 3
)
��3 4
;
��4 5
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 6
)
��6 7
;
��7 8
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� -
)
��- .
;
��. /
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 6
)
��6 7
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
)
��3 4
;
��4 5
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ :
,
��: ;
$str
��< I
)
��I J
;
��J K
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� -
)
��- .
;
��. /
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  J
,
��J K
b
��L M
=>
��N P
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 8
)
��8 9
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 3
)
��3 4
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
byte
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& .
)
��. /
;
��/ 0
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' ?
)
��? @
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
,
��' (
$str
��) 3
)
��3 4
;
��4 5
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� ,
,
��, -
$str
��. F
,
��F G
$str
��H P
)
��P Q
;
��Q R
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 4
)
��4 5
;
��5 6
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  N
,
��N O
b
��P Q
=>
��R T
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% 9
)
��9 :
;
��: ;
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ ?
)
��? @
;
��@ A
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
)
��3 4
;
��4 5
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  B
,
��B C
b
��D E
=>
��F H
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ ,
)
��, -
;
��- .
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
)
��3 4
;
��4 5
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
)
��3 4
;
��4 5
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� ,
)
��, -
;
��- .
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 6
)
��6 7
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' .
)
��. /
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
)
��3 4
;
��4 5
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� -
)
��- .
;
��. /
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  F
,
��F G
b
��H I
=>
��J L
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 2
)
��2 3
;
��3 4
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 0
)
��0 1
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 0
)
��0 1
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 6
)
��6 7
;
��7 8
b
�� 
.
�� 
Property
�� 
<
�� 
byte
�� #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
short
�� $
>
��$ %
(
��% &
$str
��& 0
)
��0 1
;
��1 2
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� ,
,
��, -
$str
��. ;
)
��; <
;
��< =
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 1
)
��1 2
;
��2 3
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  ;
,
��; <
b
��= >
=>
��? A
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* @
)
��@ A
;
��A B
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& .
)
��. /
;
��/ 0
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' .
)
��. /
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& *
)
��* +
;
��+ ,
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 1
)
��1 2
;
��2 3
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� +
)
��+ ,
;
��, -
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  @
,
��@ A
b
��B C
=>
��D F
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
byte
�� #
>
��# $
(
��$ %
$str
��% 1
)
��1 2
;
��2 3
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% 8
)
��8 9
;
��9 :
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 1
)
��1 2
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' ;
)
��; <
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� 2
)
��2 3
;
��3 4
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� 3
,
��3 4
$str
��5 ?
)
��? @
;
��@ A
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 0
)
��0 1
;
��1 2
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 8
)
��8 9
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 3
)
��3 4
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 6
)
��6 7
;
��7 8
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% ;
)
��; <
;
��< =
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' /
)
��/ 0
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 9
)
��9 :
;
��: ;
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
)
��3 4
;
��4 5
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
)
��3 4
;
��4 5
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 3
)
��3 4
;
��4 5
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  H
,
��H I
b
��J K
=>
��L N
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 1
)
��1 2
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 6
)
��6 7
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 5
)
��5 6
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' =
)
��= >
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� /
)
��/ 0
;
��0 1
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  F
,
��F G
b
��H I
=>
��J L
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ (
)
��( )
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 8
)
��8 9
;
��9 :
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 1
)
��1 2
;
��2 3
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* @
)
��@ A
;
��A B
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 1
)
��1 2
;
��2 3
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� ,
)
��, -
;
��- .
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  J
,
��J K
b
��L M
=>
��N P
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' ,
)
��, -
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 5
)
��5 6
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* @
)
��@ A
;
��A B
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' /
)
��/ 0
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' .
)
��. /
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
,
��3 4
$str
��5 C
,
��C D
$str
��E J
)
��J K
;
��K L
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 0
)
��0 1
;
��1 2
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  D
,
��D E
b
��F G
=>
��H J
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
Guid
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 5
)
��5 6
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 1
)
��1 2
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' H
)
��H I
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 7
)
��7 8
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 8
)
��8 9
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& ,
)
��, -
;
��- .
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 9
)
��9 :
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
byte
�� #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 2
)
��2 3
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& ,
)
��, -
;
��- .
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 0
)
��0 1
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& ,
)
��, -
;
��- .
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 0
)
��0 1
;
��1 2
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  P
,
��P Q
b
��R S
=>
��T V
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
Guid
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 1
)
��1 2
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' H
)
��H I
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 7
)
��7 8
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 9
)
��9 :
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� 1
,
��1 2
$str
��3 C
,
��C D
$str
��E O
,
��O P
$str
��Q Y
)
��Y Z
;
��Z [
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ =
,
��= >
$str
��? O
,
��O P
$str
��Q [
,
��[ \
$str
��] e
)
��e f
;
��f g
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� <
)
��< =
;
��= >
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  J
,
��J K
b
��L M
=>
��N P
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
Guid
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 5
)
��5 6
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 1
)
��1 2
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' H
)
��H I
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 7
)
��7 8
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 9
)
��9 :
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
byte
�� #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
)
��) *
;
��* +
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 6
)
��6 7
;
��7 8
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  H
,
��H I
b
��J K
=>
��L N
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
Guid
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ +
)
��+ ,
;
��, -
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
Guid
�� #
>
��# $
(
��$ %
$str
��% ;
)
��; <
;
��< =
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
,
��' (
$str
��) 0
,
��0 1
$str
��2 @
)
��@ A
;
��A B
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 4
)
��4 5
;
��5 6
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  D
,
��D E
b
��F G
=>
��H J
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 8
)
��8 9
;
��9 :
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* @
)
��@ A
;
��A B
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
)
��) *
;
��* +
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 1
)
��1 2
;
��2 3
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 4
)
��4 5
;
��5 6
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  A
,
��A B
b
��C D
=>
��E G
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ (
)
��( )
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 9
)
��9 :
.
��  
IsConcurrencyToken
�� +
(
��+ ,
)
��, -
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 8
)
��8 9
;
��9 :
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& *
)
��* +
;
��+ ,
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* @
)
��@ A
;
��A B
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 7
)
��7 8
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� 3
)
��3 4
;
��4 5
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ ;
)
��; <
;
��< =
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� (
)
��( )
;
��) *
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  A
,
��A B
b
��C D
=>
��E G
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' =
)
��= >
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 9
)
��9 :
.
��  
IsConcurrencyToken
�� +
(
��+ ,
)
��, -
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 8
)
��8 9
;
��9 :
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 5
)
��5 6
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' >
)
��> ?
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% =
)
��= >
;
��> ?
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 9
)
��9 :
;
��: ;
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 9
)
��9 :
;
��: ;
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* @
)
��@ A
;
��A B
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* =
)
��= >
;
��> ?
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' ?
)
��? @
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' ;
)
��; <
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 1
)
��1 2
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' :
)
��: ;
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 6
)
��6 7
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 0
)
��0 1
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 1
)
��1 2
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� 3
)
��3 4
;
��4 5
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ C
)
��C D
;
��D E
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ ?
)
��? @
;
��@ A
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� (
)
��( )
;
��) *
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  <
,
��< =
b
��> ?
=>
��@ B
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ (
)
��( )
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 9
)
��9 :
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& *
)
��* +
;
��+ ,
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 8
)
��8 9
;
��9 :
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* @
)
��@ A
;
��A B
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� *
)
��* +
;
��+ ,
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� 3
)
��3 4
;
��4 5
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� ,
)
��, -
;
��- .
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� *
)
��* +
;
��+ ,
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  P
,
��P Q
b
��R S
=>
��T V
{
�� 
b
�� 
.
�� 
HasBaseType
�� !
(
��! "
$str
��" K
)
��K L
;
��L M
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ /
)
��/ 0
;
��0 1
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� *
,
��* +
$str
��, 2
)
��2 3
;
��3 4
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� +
)
��+ ,
;
��, -
b
�� 
.
�� 
HasDiscriminator
�� &
(
��& '
)
��' (
.
��( )
HasValue
��) 1
(
��1 2
$str
��2 I
)
��I J
;
��J K
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  G
,
��G H
b
��I J
=>
��K M
{
�� 
b
�� 
.
�� 
HasBaseType
�� !
(
��! "
$str
��" K
)
��K L
;
��L M
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 1
)
��1 2
;
��2 3
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� +
)
��+ ,
;
��, -
b
�� 
.
�� 
HasDiscriminator
�� &
(
��& '
)
��' (
.
��( )
HasValue
��) 1
(
��1 2
$str
��2 H
)
��H I
;
��I J
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  O
,
��O P
b
��Q R
=>
��S U
{
�� 
b
�� 
.
�� 
HasBaseType
�� !
(
��! "
$str
��" G
)
��G H
;
��H I
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ ,
)
��, -
;
��- .
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasDiscriminator
�� &
(
��& '
)
��' (
.
��( )
HasValue
��) 1
(
��1 2
$str
��2 I
)
��I J
;
��J K
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  O
,
��O P
b
��Q R
=>
��S U
{
�� 
b
�� 
.
�� 
HasBaseType
�� !
(
��! "
$str
��" G
)
��G H
;
��H I
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasDiscriminator
�� &
(
��& '
)
��' (
.
��( )
HasValue
��) 1
(
��1 2
$str
��2 I
)
��I J
;
��J K
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
)
��> ?
.
�� 
WithMany
�� !
(
��! "
$str
��" *
)
��* +
.
�� 

�� &
(
��& '
$str
��' /
)
��/ 0
.
�� 
OnDelete
�� !
(
��! "
DeleteBehavior
��" 0
.
��0 1
Cascade
��1 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
)
��> ?
.
�� 
WithMany
�� !
(
��! "
$str
��" *
)
��* +
.
�� 

�� &
(
��& '
$str
��' /
)
��/ 0
.
�� 
OnDelete
�� !
(
��! "
DeleteBehavior
��" 0
.
��0 1
Cascade
��1 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
)
��> ?
.
�� 
WithMany
�� !
(
��! "
$str
��" *
)
��* +
.
�� 

�� &
(
��& '
$str
��' /
)
��/ 0
.
�� 
OnDelete
�� !
(
��! "
DeleteBehavior
��" 0
.
��0 1
Cascade
��1 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  B
,
��B C
b
��D E
=>
��F H
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
)
��> ?
.
�� 
WithMany
�� !
(
��! "
$str
��" )
)
��) *
.
�� 

�� &
(
��& '
$str
��' /
)
��/ 0
.
�� 
OnDelete
�� !
(
��! "
DeleteBehavior
��" 0
.
��0 1
Cascade
��1 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
)
��> ?
.
�� 
WithMany
�� !
(
��! "
$str
��" *
)
��* +
.
�� 

�� &
(
��& '
$str
��' /
)
��/ 0
.
�� 
OnDelete
�� !
(
��! "
DeleteBehavior
��" 0
.
��0 1
Cascade
��1 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  ;
,
��; <
b
��= >
=>
��? A
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� >
)
��> ?
.
�� 
WithMany
�� !
(
��! "
$str
��" ,
)
��, -
.
�� 

�� &
(
��& '
$str
��' /
)
��/ 0
;
��0 1
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  @
,
��@ A
b
��B C
=>
��D F
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� @
)
��@ A
.
�� 
WithMany
�� !
(
��! "
$str
��" 1
)
��1 2
.
�� 

�� &
(
��& '
$str
��' :
)
��: ;
.
�� 
OnDelete
�� !
(
��! "
DeleteBehavior
��" 0
.
��0 1
Cascade
��1 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  H
,
��H I
b
��J K
=>
��L N
{
�� 
b
�� 
.
�� 
HasOne
�� 
(
�� 
$str
�� =
)
��= >
.
�	�	 
WithMany
�	�	 !
(
�	�	! "
$str
�	�	" 3
)
�	�	3 4
.
�	�	 

�	�	 &
(
�	�	& '
$str
�	�	' 7
)
�	�	7 8
.
�	�	 
OnDelete
�	�	 !
(
�	�	! "
DeleteBehavior
�	�	" 0
.
�	�	0 1
Cascade
�	�	1 8
)
�	�	8 9
;
�	�	9 :
}
�	�	 
)
�	�	 
;
�	�	 
modelBuilder
�	�	 
.
�	�	 
Entity
�	�	 
(
�	�	  
$str
�	�	  D
,
�	�	D E
b
�	�	F G
=>
�	�	H J
{
�	�	 
b
�	�	 
.
�	�	 
HasOne
�	�	 
(
�	�	 
$str
�	�	 A
,
�	�	A B
$str
�	�	C K
)
�	�	K L
.
�	�	 
WithMany
�	�	 !
(
�	�	! "
$str
�	�	" ,
)
�	�	, -
.
�	�	 

�	�	 &
(
�	�	& '
$str
�	�	' 1
)
�	�	1 2
;
�	�	2 3
}
�	�	 
)
�	�	 
;
�	�	 
modelBuilder
�	�	 
.
�	�	 
Entity
�	�	 
(
�	�	  
$str
�	�	  A
,
�	�	A B
b
�	�	C D
=>
�	�	E G
{
�	�	 
b
�	�	 
.
�	�	 
HasOne
�	�	 
(
�	�	 
$str
�	�	 >
,
�	�	> ?
$str
�	�	@ M
)
�	�	M N
.
�	�	 
WithMany
�	�	 !
(
�	�	! "
)
�	�	" #
.
�	�	 

�	�	 &
(
�	�	& '
$str
�	�	' 6
)
�	�	6 7
;
�	�	7 8
b
�	�	 
.
�	�	 
HasOne
�	�	 
(
�	�	 
$str
�	�	 >
,
�	�	> ?
$str
�	�	@ M
)
�	�	M N
.
�	�	 
WithMany
�	�	 !
(
�	�	! "
)
�	�	" #
.
�	�	 

�	�	 &
(
�	�	& '
$str
�	�	' 6
)
�	�	6 7
;
�	�	7 8
b
�	�	 
.
�	�	 
HasOne
�	�	 
(
�	�	 
$str
�	�	 >
,
�	�	> ?
$str
�	�	@ R
)
�	�	R S
.
�	�	 
WithMany
�	�	 !
(
�	�	! "
)
�	�	" #
.
�	�	 

�	�	 &
(
�	�	& '
$str
�	�	' ;
)
�	�	; <
;
�	�	< =
}
�	�	 
)
�	�	 
;
�	�	 
modelBuilder
�	�	 
.
�	�	 
Entity
�	�	 
(
�	�	  
$str
�	�	  A
,
�	�	A B
b
�	�	C D
=>
�	�	E G
{
�	�	 
b
�	�	 
.
�	�	 
HasOne
�	�	 
(
�	�	 
$str
�	�	 >
,
�	�	> ?
$str
�	�	@ M
)
�	�	M N
.
�	�	 
WithMany
�	�	 !
(
�	�	! "
)
�	�	" #
.
�	�	 

�	�	 &
(
�	�	& '
$str
�	�	' 6
)
�	�	6 7
;
�	�	7 8
b
�	�	 
.
�	�	 
HasOne
�	�	 
(
�	�	 
$str
�	�	 >
,
�	�	> ?
$str
�	�	@ M
)
�	�	M N
.
�	�	 
WithMany
�	�	 !
(
�	�	! "
)
�	�	" #
.
�	�	 

�	�	 &
(
�	�	& '
$str
�	�	' 6
)
�	�	6 7
;
�	�	7 8
b
�	�	 
.
�	�	 
HasOne
�	�	 
(
�	�	 
$str
�	�	 >
,
�	�	> ?
$str
�	�	@ R
)
�	�	R S
.
�	�	 
WithMany
�	�	 !
(
�	�	! "
)
�	�	" #
.
�	�	 

�	�	 &
(
�	�	& '
$str
�	�	' ;
)
�	�	; <
;
�	�	< =
}
�	�	 
)
�	�	 
;
�	�	 
modelBuilder
�	�	 
.
�	�	 
Entity
�	�	 
(
�	�	  
$str
�	�	  <
,
�	�	< =
b
�	�	> ?
=>
�	�	@ B
{
�	�	 
b
�	�	 
.
�	�	 
HasOne
�	�	 
(
�	�	 
$str
�	�	 >
,
�	�	> ?
$str
�	�	@ M
)
�	�	M N
.
�	�	 
WithMany
�	�	 !
(
�	�	! "
)
�	�	" #
.
�	�	 

�	�	 &
(
�	�	& '
$str
�	�	' 6
)
�	�	6 7
;
�	�	7 8
b
�	�	 
.
�	�	 
HasOne
�	�	 
(
�	�	 
$str
�	�	 >
,
�	�	> ?
$str
�	�	@ M
)
�	�	M N
.
�	�	 
WithMany
�	�	 !
(
�	�	! "
)
�	�	" #
.
�	�	 

�	�	 &
(
�	�	& '
$str
�	�	' 6
)
�	�	6 7
;
�	�	7 8
b
�	�	 
.
�	�	 
HasOne
�	�	 
(
�	�	 
$str
�	�	 ?
,
�	�	? @
$str
�	�	A J
)
�	�	J K
.
�	�	 
WithMany
�	�	 !
(
�	�	! "
)
�	�	" #
.
�	�	 

�	�	 &
(
�	�	& '
$str
�	�	' 2
)
�	�	2 3
;
�	�	3 4
b
�	�	 
.
�	�	 
HasOne
�	�	 
(
�	�	 
$str
�	�	 >
,
�	�	> ?
$str
�	�	@ R
)
�	�	R S
.
�	�	 
WithMany
�	�	 !
(
�	�	! "
)
�	�	" #
.
�	�	 

�	�	 &
(
�	�	& '
$str
�	�	' ;
)
�	�	; <
;
�	�	< =
}
�	�	 
)
�	�	 
;
�	�	 
modelBuilder
�	�	 
.
�	�	 
Entity
�	�	 
(
�	�	  
$str
�	�	  P
,
�	�	P Q
b
�	�	R S
=>
�	�	T V
{
�	�	 
b
�	�	 
.
�	�	 
HasOne
�	�	 
(
�	�	 
$str
�	�	 ?
,
�	�	? @
$str
�	�	A J
)
�	�	J K
.
�	�	 
WithMany
�	�	 !
(
�	�	! "
)
�	�	" #
.
�	�	 

�	�	 &
(
�	�	& '
$str
�	�	' 2
)
�	�	2 3
.
�	�	 
OnDelete
�	�	 !
(
�	�	! "
DeleteBehavior
�	�	" 0
.
�	�	0 1
Cascade
�	�	1 8
)
�	�	8 9
;
�	�	9 :
}
�	�	 
)
�	�	 
;
�	�	 
modelBuilder
�	�	 
.
�	�	 
Entity
�	�	 
(
�	�	  
$str
�	�	  O
,
�	�	O P
b
�	�	Q R
=>
�	�	S U
{
�	�	 
b
�	�	 
.
�	�	 
HasOne
�	�	 
(
�	�	 
$str
�	�	 >
)
�	�	> ?
.
�	�	 
WithMany
�	�	 !
(
�	�	! "
$str
�	�	" /
)
�	�	/ 0
.
�	�	 

�	�	 &
(
�	�	& '
$str
�	�	' /
)
�	�	/ 0
.
�	�	 
OnDelete
�	�	 !
(
�	�	! "
DeleteBehavior
�	�	" 0
.
�	�	0 1
Cascade
�	�	1 8
)
�	�	8 9
;
�	�	9 :
}
�	�	 
)
�	�	 
;
�	�	 
modelBuilder
�	�	 
.
�	�	 
Entity
�	�	 
(
�	�	  
$str
�	�	  O
,
�	�	O P
b
�	�	Q R
=>
�	�	S U
{
�	�	 
b
�	�	 
.
�	�	 
HasOne
�	�	 
(
�	�	 
$str
�	�	 >
)
�	�	> ?
.
�	�	 
WithMany
�	�	 !
(
�	�	! "
$str
�	�	" /
)
�	�	/ 0
.
�	�	 

�	�	 &
(
�	�	& '
$str
�	�	' /
)
�	�	/ 0
.
�	�	 
OnDelete
�	�	 !
(
�	�	! "
DeleteBehavior
�	�	" 0
.
�	�	0 1
Cascade
�	�	1 8
)
�	�	8 9
;
�	�	9 :
}
�	�	 
)
�	�	 
;
�	�	 
}
�	�	 	
}
�	�	 
}�	�	 �&
hF:\Code\GitHub\docker\src\AnBook.EntityFrameworkCore\Migrations\20180509121141_Upgraded_To_Abp_v3_6_1.cs
	namespace 	
AnBook
 
. 

Migrations 
{ 
public 

partial 
class "
Upgraded_To_Abp_v3_6_1 /
:0 1
	Migration2 ;
{ 
	protected		 
override		 
void		 
Up		  "
(		" #
MigrationBuilder		# 3
migrationBuilder		4 D
)		D E
{

 	
migrationBuilder 
. 
AlterColumn (
<( )
string) /
>/ 0
(0 1
name 
: 
$str #
,# $
table
:
$str
,
	maxLength 
: 
$num 
, 
nullable 
: 
true 
, 

oldClrType 
: 
typeof "
(" #
string# )
)) *
,* +
oldMaxLength 
: 
$num !
,! "
oldNullable 
: 
true !
)! "
;" #
migrationBuilder 
. 
AlterColumn (
<( )
string) /
>/ 0
(0 1
name 
: 
$str #
,# $
table 
: 
$str ,
,, -
	maxLength 
: 
$num 
, 
nullable 
: 
true 
, 

oldClrType 
: 
typeof "
(" #
string# )
)) *
,* +
oldMaxLength 
: 
$num !
,! "
oldNullable 
: 
true !
)! "
;" #
migrationBuilder 
. 
AlterColumn (
<( )
string) /
>/ 0
(0 1
name 
: 
$str #
,# $
table 
: 
$str %
,% &
	maxLength   
:   
$num   
,   
nullable!! 
:!! 
true!! 
,!! 

oldClrType"" 
:"" 
typeof"" "
(""" #
string""# )
)"") *
,""* +
oldMaxLength## 
:## 
$num## !
,##! "
oldNullable$$ 
:$$ 
true$$ !
)$$! "
;$$" #
}%% 	
	protected'' 
override'' 
void'' 
Down''  $
(''$ %
MigrationBuilder''% 5
migrationBuilder''6 F
)''F G
{(( 	
migrationBuilder)) 
.)) 
AlterColumn)) (
<))( )
string))) /
>))/ 0
())0 1
name** 
:** 
$str** #
,**# $
table++ 
:++ 
$str++ -
,++- .
	maxLength,, 
:,, 
$num,, 
,,, 
nullable-- 
:-- 
true-- 
,-- 

oldClrType.. 
:.. 
typeof.. "
(.." #
string..# )
)..) *
,..* +
oldMaxLength// 
:// 
$num// !
,//! "
oldNullable00 
:00 
true00 !
)00! "
;00" #
migrationBuilder22 
.22 
AlterColumn22 (
<22( )
string22) /
>22/ 0
(220 1
name33 
:33 
$str33 #
,33# $
table44 
:44 
$str44 ,
,44, -
	maxLength55 
:55 
$num55 
,55 
nullable66 
:66 
true66 
,66 

oldClrType77 
:77 
typeof77 "
(77" #
string77# )
)77) *
,77* +
oldMaxLength88 
:88 
$num88 !
,88! "
oldNullable99 
:99 
true99 !
)99! "
;99" #
migrationBuilder;; 
.;; 
AlterColumn;; (
<;;( )
string;;) /
>;;/ 0
(;;0 1
name<< 
:<< 
$str<< #
,<<# $
table== 
:== 
$str== %
,==% &
	maxLength>> 
:>> 
$num>> 
,>> 
nullable?? 
:?? 
true?? 
,?? 

oldClrType@@ 
:@@ 
typeof@@ "
(@@" #
string@@# )
)@@) *
,@@* +
oldMaxLengthAA 
:AA 
$numAA !
,AA! "
oldNullableBB 
:BB 
trueBB !
)BB! "
;BB" #
}CC 	
}DD 
}EE ɶ
qF:\Code\GitHub\docker\src\AnBook.EntityFrameworkCore\Migrations\20180509121141_Upgraded_To_Abp_v3_6_1.Designer.cs
	namespace 	
AnBook
 
. 

Migrations 
{ 
[ 
	DbContext 
( 
typeof 
( 
AnBookDbContext %
)% &
)& '
]' (
[ 
	Migration 
( 
$str 6
)6 7
]7 8
partial 
class "
Upgraded_To_Abp_v3_6_1 (
{ 
	protected 
override 
void 
BuildTargetModel  0
(0 1
ModelBuilder1 =
modelBuilder> J
)J K
{ 	
modelBuilder 
. 

( 
$str /
,/ 0
$str1 B
)B C
. 

( 
$str B
,B C,
 SqlServerValueGenerationStrategyD d
.d e
IdentityColumne s
)s t
;t u
modelBuilder 
. 
Entity 
(  
$str  B
,B C
bD E
=>F H
{ 
b 
. 
Property 
< 
int "
>" #
(# $
$str$ (
)( )
.   
ValueGeneratedOnAdd   ,
(  , -
)  - .
;  . /
b"" 
."" 
Property"" 
<"" 
DateTime"" '
>""' (
(""( )
$str"") 7
)""7 8
;""8 9
b$$ 
.$$ 
Property$$ 
<$$ 
long$$ #
?$$# $
>$$$ %
($$% &
$str$$& 5
)$$5 6
;$$6 7
b&& 
.&& 
Property&& 
<&& 
long&& #
?&&# $
>&&$ %
(&&% &
$str&&& 5
)&&5 6
;&&6 7
b(( 
.(( 
Property(( 
<(( 
DateTime(( '
?((' (
>((( )
((() *
$str((* 8
)((8 9
;((9 :
b** 
.** 
Property** 
<** 
string** %
>**% &
(**& '
$str**' 4
)**4 5
.++ 

IsRequired++ #
(++# $
)++$ %
.,, 
HasMaxLength,, %
(,,% &
$num,,& (
),,( )
;,,) *
b.. 
... 
Property.. 
<.. 
bool.. #
>..# $
(..$ %
$str..% 0
)..0 1
;..1 2
b00 
.00 
Property00 
<00 
DateTime00 '
?00' (
>00( )
(00) *
$str00* @
)00@ A
;00A B
b22 
.22 
Property22 
<22 
long22 #
?22# $
>22$ %
(22% &
$str22& :
)22: ;
;22; <
b44 
.44 
Property44 
<44 
string44 %
>44% &
(44& '
$str44' -
)44- .
.55 

IsRequired55 #
(55# $
)55$ %
.66 
HasMaxLength66 %
(66% &
$num66& (
)66( )
;66) *
b88 
.88 
HasKey88 
(88 
$str88 !
)88! "
;88" #
b:: 
.:: 
ToTable:: 
(:: 
$str:: +
)::+ ,
;::, -
};; 
);; 
;;; 
modelBuilder== 
.== 
Entity== 
(==  
$str==  I
,==I J
b==K L
=>==M O
{>> 
b?? 
.?? 
Property?? 
<?? 
long?? #
>??# $
(??$ %
$str??% )
)??) *
.@@ 
ValueGeneratedOnAdd@@ ,
(@@, -
)@@- .
;@@. /
bBB 
.BB 
PropertyBB 
<BB 
DateTimeBB '
>BB' (
(BB( )
$strBB) 7
)BB7 8
;BB8 9
bDD 
.DD 
PropertyDD 
<DD 
longDD #
?DD# $
>DD$ %
(DD% &
$strDD& 5
)DD5 6
;DD6 7
bFF 
.FF 
PropertyFF 
<FF 
stringFF %
>FF% &
(FF& '
$strFF' 6
)FF6 7
.GG 

IsRequiredGG #
(GG# $
)GG$ %
;GG% &
bII 
.II 
PropertyII 
<II 
stringII %
>II% &
(II& '
$strII' -
)II- .
.JJ 

IsRequiredJJ #
(JJ# $
)JJ$ %
.KK 
HasMaxLengthKK %
(KK% &
$numKK& )
)KK) *
;KK* +
bMM 
.MM 
PropertyMM 
<MM 
intMM "
?MM" #
>MM# $
(MM$ %
$strMM% /
)MM/ 0
;MM0 1
bOO 
.OO 
PropertyOO 
<OO 
stringOO %
>OO% &
(OO& '
$strOO' .
)OO. /
.PP 

IsRequiredPP #
(PP# $
)PP$ %
.QQ 
HasMaxLengthQQ %
(QQ% &
$numQQ& *
)QQ* +
;QQ+ ,
bSS 
.SS 
HasKeySS 
(SS 
$strSS !
)SS! "
;SS" #
bUU 
.UU 
ToTableUU 
(UU 
$strUU +
)UU+ ,
;UU, -
bWW 
.WW 
HasDiscriminatorWW &
<WW& '
stringWW' -
>WW- .
(WW. /
$strWW/ >
)WW> ?
.WW? @
HasValueWW@ H
(WWH I
$strWWI Y
)WWY Z
;WWZ [
}XX 
)XX 
;XX 
modelBuilderZZ 
.ZZ 
EntityZZ 
(ZZ  
$strZZ  7
,ZZ7 8
bZZ9 :
=>ZZ; =
{[[ 
b\\ 
.\\ 
Property\\ 
<\\ 
long\\ #
>\\# $
(\\$ %
$str\\% )
)\\) *
.]] 
ValueGeneratedOnAdd]] ,
(]], -
)]]- .
;]]. /
b__ 
.__ 
Property__ 
<__ 
string__ %
>__% &
(__& '
$str__' 4
)__4 5
.`` 
HasMaxLength`` %
(``% &
$num``& )
)``) *
;``* +
bbb 
.bb 
Propertybb 
<bb 
stringbb %
>bb% &
(bb& '
$strbb' 8
)bb8 9
.cc 
HasMaxLengthcc %
(cc% &
$numcc& (
)cc( )
;cc) *
bee 
.ee 
Propertyee 
<ee 
stringee %
>ee% &
(ee& '
$stree' 3
)ee3 4
.ff 
HasMaxLengthff %
(ff% &
$numff& )
)ff) *
;ff* +
bhh 
.hh 
Propertyhh 
<hh 
stringhh %
>hh% &
(hh& '
$strhh' 3
)hh3 4
.ii 
HasMaxLengthii %
(ii% &
$numii& *
)ii* +
;ii+ ,
bkk 
.kk 
Propertykk 
<kk 
stringkk %
>kk% &
(kk& '
$strkk' 2
)kk2 3
.ll 
HasMaxLengthll %
(ll% &
$numll& *
)ll* +
;ll+ ,
bnn 
.nn 
Propertynn 
<nn 
intnn "
>nn" #
(nn# $
$strnn$ 7
)nn7 8
;nn8 9
bpp 
.pp 
Propertypp 
<pp 
DateTimepp '
>pp' (
(pp( )
$strpp) 8
)pp8 9
;pp9 :
brr 
.rr 
Propertyrr 
<rr 
intrr "
?rr" #
>rr# $
(rr$ %
$strrr% ;
)rr; <
;rr< =
btt 
.tt 
Propertytt 
<tt 
longtt #
?tt# $
>tt$ %
(tt% &
$strtt& :
)tt: ;
;tt; <
bvv 
.vv 
Propertyvv 
<vv 
stringvv %
>vv% &
(vv& '
$strvv' 3
)vv3 4
.ww 
HasMaxLengthww %
(ww% &
$numww& )
)ww) *
;ww* +
byy 
.yy 
Propertyyy 
<yy 
stringyy %
>yy% &
(yy& '
$stryy' 3
)yy3 4
.zz 
HasMaxLengthzz %
(zz% &
$numzz& *
)zz* +
;zz+ ,
b|| 
.|| 
Property|| 
<|| 
string|| %
>||% &
(||& '
$str||' 4
)||4 5
.}} 
HasMaxLength}} %
(}}% &
$num}}& )
)}}) *
;}}* +
b 
. 
Property 
< 
int "
?" #
># $
($ %
$str% /
)/ 0
;0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ >
)
��> ?
;
��? @
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ :
)
��: ;
;
��; <
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
)
��3 4
;
��4 5
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� ,
)
��, -
;
��- .
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  E
,
��E F
b
��G H
=>
��I K
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 6
)
��6 7
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
;
��% &
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 1
)
��1 2
;
��2 3
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasDiscriminator
�� &
<
��& '
string
��' -
>
��- .
(
��. /
$str
��/ >
)
��> ?
.
��? @
HasValue
��@ H
(
��H I
$str
��I \
)
��\ ]
;
��] ^
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 2
)
��2 3
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 3
)
��3 4
;
��4 5
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ ,
)
��, -
;
��- .
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 6
)
��6 7
;
��7 8
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� -
)
��- .
;
��. /
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  E
,
��E F
b
��G H
=>
��I K
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 8
)
��8 9
;
��9 :
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 5
)
��5 6
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 9
)
��9 :
;
��: ;
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* @
)
��@ A
;
��A B
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 2
)
��2 3
;
��3 4
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 1
)
��1 2
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� -
)
��- .
;
��. /
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
)
��) *
;
��* +
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 9
)
��9 :
;
��: ;
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
)
��3 4
;
��4 5
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 5
)
��5 6
;
��6 7
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� /
)
��/ 0
;
��0 1
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 2
)
��2 3
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 3
)
��3 4
;
��4 5
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 6
)
��6 7
;
��7 8
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� -
)
��- .
;
��. /
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 6
)
��6 7
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
)
��3 4
;
��4 5
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ :
,
��: ;
$str
��< I
)
��I J
;
��J K
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� -
)
��- .
;
��. /
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  J
,
��J K
b
��L M
=>
��N P
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 8
)
��8 9
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 3
)
��3 4
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
byte
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& .
)
��. /
;
��/ 0
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' ?
)
��? @
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
,
��' (
$str
��) 3
)
��3 4
;
��4 5
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� ,
,
��, -
$str
��. F
,
��F G
$str
��H P
)
��P Q
;
��Q R
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 4
)
��4 5
;
��5 6
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  N
,
��N O
b
��P Q
=>
��R T
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% 9
)
��9 :
;
��: ;
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ ?
)
��? @
;
��@ A
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
)
��3 4
;
��4 5
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  B
,
��B C
b
��D E
=>
��F H
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ ,
)
��, -
;
��- .
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
)
��3 4
;
��4 5
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
)
��3 4
;
��4 5
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� ,
)
��, -
;
��- .
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 6
)
��6 7
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' .
)
��. /
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
)
��3 4
;
��4 5
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� -
)
��- .
;
��. /
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  F
,
��F G
b
��H I
=>
��J L
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 2
)
��2 3
;
��3 4
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 0
)
��0 1
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 0
)
��0 1
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 6
)
��6 7
;
��7 8
b
�� 
.
�� 
Property
�� 
<
�� 
byte
�� #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
short
�� $
>
��$ %
(
��% &
$str
��& 0
)
��0 1
;
��1 2
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� ,
,
��, -
$str
��. ;
)
��; <
;
��< =
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 1
)
��1 2
;
��2 3
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  ;
,
��; <
b
��= >
=>
��? A
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* @
)
��@ A
;
��A B
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& .
)
��. /
;
��/ 0
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' .
)
��. /
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& *
)
��* +
;
��+ ,
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� '
)
��' (
;
��( )
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 1
)
��1 2
;
��2 3
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� +
)
��+ ,
;
��, -
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  @
,
��@ A
b
��B C
=>
��D F
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
byte
�� #
>
��# $
(
��$ %
$str
��% 1
)
��1 2
;
��2 3
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% 8
)
��8 9
;
��9 :
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 1
)
��1 2
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' ;
)
��; <
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� 2
)
��2 3
;
��3 4
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� 3
,
��3 4
$str
��5 ?
)
��? @
;
��@ A
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 0
)
��0 1
;
��1 2
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  C
,
��C D
b
��E F
=>
��G I
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 8
)
��8 9
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 3
)
��3 4
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 6
)
��6 7
;
��7 8
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% ;
)
��; <
;
��< =
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' /
)
��/ 0
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 9
)
��9 :
;
��: ;
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
)
��3 4
;
��4 5
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
)
��3 4
;
��4 5
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 3
)
��3 4
;
��4 5
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  H
,
��H I
b
��J K
=>
��L N
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 1
)
��1 2
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 6
)
��6 7
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 5
)
��5 6
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' =
)
��= >
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� /
)
��/ 0
;
��0 1
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 8
)
��8 9
;
��9 :
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  F
,
��F G
b
��H I
=>
��J L
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
>
��" #
(
��# $
$str
��$ (
)
��( )
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* 8
)
��8 9
;
��9 :
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 4
)
��4 5
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 0
)
��0 1
;
��1 2
b
�� 
.
�� 
Property
�� 
<
�� 
bool
�� #
>
��# $
(
��$ %
$str
��% 1
)
��1 2
;
��2 3
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* @
)
��@ A
;
��A B
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 1
)
��1 2
;
��2 3
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� ,
)
��, -
;
��- .
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  J
,
��J K
b
��L M
=>
��N P
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' ,
)
��, -
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 5
)
��5 6
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
?
��' (
>
��( )
(
��) *
$str
��* @
)
��@ A
;
��A B
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& :
)
��: ;
;
��; <
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' /
)
��/ 0
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
int
�� "
?
��" #
>
��# $
(
��$ %
$str
��% /
)
��/ 0
;
��0 1
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' .
)
��. /
.
�� 

IsRequired
�� #
(
��# $
)
��$ %
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& .
)
��. /
;
��/ 0
b
�� 
.
�� 
HasKey
�� 
(
�� 
$str
�� !
)
��! "
;
��" #
b
�� 
.
�� 
HasIndex
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 3
,
��3 4
$str
��5 C
,
��C D
$str
��E J
)
��J K
;
��K L
b
�� 
.
�� 
ToTable
�� 
(
�� 
$str
�� 0
)
��0 1
;
��1 2
}
�� 
)
�� 
;
�� 
modelBuilder
�� 
.
�� 
Entity
�� 
(
��  
$str
��  D
,
��D E
b
��F G
=>
��H J
{
�� 
b
�� 
.
�� 
Property
�� 
<
�� 
Guid
�� #
>
��# $
(
��$ %
$str
��% )
)
��) *
.
�� !
ValueGeneratedOnAdd
�� ,
(
��, -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
DateTime
�� '
>
��' (
(
��( )
$str
��) 7
)
��7 8
;
��8 9
b
�� 
.
�� 
Property
�� 
<
�� 
long
�� #
?
��# $
>
��$ %
(
��% &
$str
��& 5
)
��5 6
;
��6 7
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' -
)
��- .
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& -
)
��- .
;
��. /
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 5
)
��5 6
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 1
)
��1 2
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& (
)
��( )
;
��) *
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' H
)
��H I
.
�� 
HasMaxLength
�� %
(
��% &
$num
��& )
)
��) *
;
��* +
b
�� 
.
�� 
Property
�� 
<
�� 
string
�� %
>
��% &
(
��& '
$str
��' 7
)
��7 8
.
�� 
�� %
ˇ
5F:\Code\GitHub\docker\src\AnBook.Core\AnBookConsts.cs
	namespace 	
AnBook
 
{ 
public 

class 
AnBookConsts 
{ 
public 
const 
string "
LocalizationSourceName 2
=3 4
$str5 =
;= >
public 
const 
string  
ConnectionStringName 0
=1 2
$str3 <
;< =
public		 
const		 
bool		 
MultiTenancyEnabled		 -
=		. /
true		0 4
;		4 5
}

 
} æ
9F:\Code\GitHub\docker\src\AnBook.Core\AnBookCoreModule.cs
	namespace 	
AnBook
 
{ 
[ 
	DependsOn 
( 
typeof 
( 
AbpZeroCoreModule '
)' (
)( )
]) *
public 

class 
AnBookCoreModule !
:" #
	AbpModule$ -
{ 
public 
override 
void 
PreInitialize *
(* +
)+ ,
{ 	
Configuration 
. 
Auditing "
." #&
IsEnabledForAnonymousUsers# =
=> ?
true@ D
;D E
Configuration 
. 
Modules !
.! "
Zero" &
(& '
)' (
.( )
EntityTypes) 4
.4 5
Tenant5 ;
=< =
typeof> D
(D E
TenantE K
)K L
;L M
Configuration 
. 
Modules !
.! "
Zero" &
(& '
)' (
.( )
EntityTypes) 4
.4 5
Role5 9
=: ;
typeof< B
(B C
RoleC G
)G H
;H I
Configuration 
. 
Modules !
.! "
Zero" &
(& '
)' (
.( )
EntityTypes) 4
.4 5
User5 9
=: ;
typeof< B
(B C
UserC G
)G H
;H I(
AnBookLocalizationConfigurer (
.( )
	Configure) 2
(2 3
Configuration3 @
.@ A
LocalizationA M
)M N
;N O
Configuration 
. 
MultiTenancy &
.& '
	IsEnabled' 0
=1 2
AnBookConsts3 ?
.? @
MultiTenancyEnabled@ S
;S T
AppRoleConfig!! 
.!! 
	Configure!! #
(!!# $
Configuration!!$ 1
.!!1 2
Modules!!2 9
.!!9 :
Zero!!: >
(!!> ?
)!!? @
.!!@ A
RoleManagement!!A O
)!!O P
;!!P Q
Configuration## 
.## 
Settings## "
.##" #
	Providers### ,
.##, -
Add##- 0
<##0 1
AppSettingProvider##1 C
>##C D
(##D E
)##E F
;##F G
}$$ 	
public&& 
override&& 
void&& 

Initialize&& '
(&&' (
)&&( )
{'' 	

IocManager(( 
.(( (
RegisterAssemblyByConvention(( 3
(((3 4
typeof((4 :
(((: ;
AnBookCoreModule((; K
)((K L
.((L M
GetAssembly((M X
(((X Y
)((Y Z
)((Z [
;(([ \
})) 	
public++ 
override++ 
void++ 
PostInitialize++ +
(+++ ,
)++, -
{,, 	

IocManager-- 
.-- 
Resolve-- 
<-- 
AppTimes-- '
>--' (
(--( )
)--) *
.--* +
StartupTime--+ 6
=--7 8
Clock--9 >
.--> ?
Now--? B
;--B C
}.. 	
}// 
}00 “
9F:\Code\GitHub\docker\src\AnBook.Core\AppVersionHelper.cs
	namespace 	
AnBook
 
{ 
public

 

class

 
AppVersionHelper

 !
{ 
public 
const 
string 
Version #
=$ %
$str& /
;/ 0
public 
static 
DateTime 
ReleaseDate *
{ 	
get 
{ 
return 
new 
FileInfo %
(% &
typeof& ,
(, -
AppVersionHelper- =
)= >
.> ?
GetAssembly? J
(J K
)K L
.L M
LocationM U
)U V
.V W
LastWriteTimeW d
;d e
}f g
} 	
} 
} “
RF:\Code\GitHub\docker\src\AnBook.Core\Authorization\AnBookAuthorizationProvider.cs
	namespace 	
AnBook
 
. 
Authorization 
{ 
public 

class '
AnBookAuthorizationProvider ,
:- .!
AuthorizationProvider/ D
{ 
public		 
override		 
void		 
SetPermissions		 +
(		+ ,(
IPermissionDefinitionContext		, H
context		I P
)		P Q
{

 	
context 
. 
CreatePermission $
($ %
PermissionNames% 4
.4 5
Pages_Users5 @
,@ A
LB C
(C D
$strD K
)K L
)L M
;M N
context 
. 
CreatePermission $
($ %
PermissionNames% 4
.4 5
Pages_Roles5 @
,@ A
LB C
(C D
$strD K
)K L
)L M
;M N
context 
. 
CreatePermission $
($ %
PermissionNames% 4
.4 5
Pages_Tenants5 B
,B C
LD E
(E F
$strF O
)O P
,P Q
multiTenancySidesR c
:c d
MultiTenancySidese v
.v w
Hostw {
){ |
;| }
} 	
private 
static 
ILocalizableString )
L* +
(+ ,
string, 2
name3 7
)7 8
{ 	
return 
new 
LocalizableString (
(( )
name) -
,- .
AnBookConsts/ ;
.; <"
LocalizationSourceName< R
)R S
;S T
} 	
} 
} •
CF:\Code\GitHub\docker\src\AnBook.Core\Authorization\LoginManager.cs
	namespace 	
AnBook
 
. 
Authorization 
{ 
public 

class 
LogInManager 
: 
AbpLogInManager  /
</ 0
Tenant0 6
,6 7
Role8 <
,< =
User> B
>B C
{ 
public 
LogInManager 
( 
UserManager 
userManager #
,# $
IMultiTenancyConfig 
multiTenancyConfig  2
,2 3
IRepository 
< 
Tenant 
> 
tenantRepository  0
,0 1
IUnitOfWorkManager 
unitOfWorkManager 0
,0 1
ISettingManager 
settingManager *
,* +
IRepository 
< 
UserLoginAttempt (
,( )
long* .
>. /&
userLoginAttemptRepository0 J
,J K!
IUserManagementConfig ! 
userManagementConfig" 6
,6 7
IIocResolver 
iocResolver $
,$ %
IPasswordHasher 
< 
User  
>  !
passwordHasher" 0
,0 1
RoleManager 
roleManager #
,# $&
UserClaimsPrincipalFactory &"
claimsPrincipalFactory' =
)= >
: 
base 
( 
userManager 
, 
multiTenancyConfig   $
,  $ %
tenantRepository!! "
,!!" #
unitOfWorkManager"" #
,""# $
settingManager##  
,##  !&
userLoginAttemptRepository$$ ,
,$$, - 
userManagementConfig%% &
,%%& '
iocResolver&& 
,&& 
passwordHasher''  
,''  !
roleManager(( 
,(( "
claimsPrincipalFactory)) (
)))( )
{** 	
}++ 	
},, 
}-- ì
HF:\Code\GitHub\docker\src\AnBook.Core\Authorization\PermissionChecker.cs
	namespace 	
AnBook
 
. 
Authorization 
{ 
public 

class 
PermissionChecker "
:# $
PermissionChecker% 6
<6 7
Role7 ;
,; <
User= A
>A B
{ 
public		 
PermissionChecker		  
(		  !
UserManager		! ,
userManager		- 8
)		8 9
:

 
base

 
(

 
userManager

 
)

 
{ 	
} 	
} 
} π
FF:\Code\GitHub\docker\src\AnBook.Core\Authorization\PermissionNames.cs
	namespace 	
AnBook
 
. 
Authorization 
{ 
public 

static 
class 
PermissionNames '
{ 
public 
const 
string 
Pages_Tenants )
=* +
$str, ;
;; <
public 
const 
string 
Pages_Users '
=( )
$str* 7
;7 8
public		 
const		 
string		 
Pages_Roles		 '
=		( )
$str		* 7
;		7 8
}

 
} ‘

JF:\Code\GitHub\docker\src\AnBook.Core\Authorization\Roles\AppRoleConfig.cs
	namespace 	
AnBook
 
. 
Authorization 
. 
Roles $
{ 
public 

static 
class 
AppRoleConfig %
{ 
public 
static 
void 
	Configure $
($ %!
IRoleManagementConfig% : 
roleManagementConfig; O
)O P
{		 	 
roleManagementConfig  
.  !
StaticRoles! ,
., -
Add- 0
(0 1
new  
StaticRoleDefinition (
(( )
StaticRoleNames #
.# $
Host$ (
.( )
Admin) .
,. /
MultiTenancySides %
.% &
Host& *
) 
) 
;  
roleManagementConfig  
.  !
StaticRoles! ,
., -
Add- 0
(0 1
new  
StaticRoleDefinition (
(( )
StaticRoleNames #
.# $
Tenants$ +
.+ ,
Admin, 1
,1 2
MultiTenancySides %
.% &
Tenant& ,
) 
) 
; 
} 	
} 
} ¯
AF:\Code\GitHub\docker\src\AnBook.Core\Authorization\Roles\Role.cs
	namespace 	
AnBook
 
. 
Authorization 
. 
Roles $
{ 
public 

class 
Role 
: 
AbpRole 
<  
User  $
>$ %
{ 
public		 
const		 
int		  
MaxDescriptionLength		 -
=		. /
$num		0 4
;		4 5
public 
Role 
( 
) 
{ 	
} 	
public 
Role 
( 
int 
? 
tenantId !
,! "
string# )
displayName* 5
)5 6
: 
base 
( 
tenantId 
, 
displayName (
)( )
{ 	
} 	
public 
Role 
( 
int 
? 
tenantId !
,! "
string# )
name* .
,. /
string0 6
displayName7 B
)B C
: 
base 
( 
tenantId 
, 
name !
,! "
displayName# .
). /
{ 	
} 	
[ 	
StringLength	 
(  
MaxDescriptionLength *
)* +
]+ ,
public 
string 
Description !
{" #
get# &
;& '
set( +
;+ ,
}, -
} 
} û
HF:\Code\GitHub\docker\src\AnBook.Core\Authorization\Roles\RoleManager.cs
	namespace 	
AnBook
 
. 
Authorization 
. 
Roles $
{ 
public 

class 
RoleManager 
: 
AbpRoleManager -
<- .
Role. 2
,2 3
User4 8
>8 9
{ 
public 
RoleManager 
( 
	RoleStore 
store 
, 
IEnumerable 
< 
IRoleValidator &
<& '
Role' +
>+ ,
>, -
roleValidators. <
,< =
ILookupNormalizer 
keyNormalizer +
,+ ,"
IdentityErrorDescriber "
errors# )
,) *
ILogger 
< 
AbpRoleManager "
<" #
Role# '
,' (
User) -
>- .
>. /
logger0 6
,6 7
IPermissionManager 
permissionManager 0
,0 1
ICacheManager 
cacheManager &
,& '
IUnitOfWorkManager 
unitOfWorkManager 0
,0 1!
IRoleManagementConfig ! 
roleManagementConfig" 6
)6 7
: 
base 
( 
store 
, 
roleValidators  
,  !
keyNormalizer 
,  
errors 
, 
logger  
,  !
permissionManager #
,# $
cacheManager 
, 
unitOfWorkManager   #
,  # $ 
roleManagementConfig!! &
)!!& '
{"" 	
}## 	
}$$ 
}%% √
FF:\Code\GitHub\docker\src\AnBook.Core\Authorization\Roles\RoleStore.cs
	namespace 	
AnBook
 
. 
Authorization 
. 
Roles $
{ 
public 

class 
	RoleStore 
: 
AbpRoleStore )
<) *
Role* .
,. /
User0 4
>4 5
{		 
public

 
	RoleStore

 
(

 
IUnitOfWorkManager 
unitOfWorkManager 0
,0 1
IRepository 
< 
Role 
> 
roleRepository ,
,, -
IRepository 
< !
RolePermissionSetting -
,- .
long/ 3
>3 4+
rolePermissionSettingRepository5 T
)T U
: 
base 
( 
unitOfWorkManager !
,! "
roleRepository 
, +
rolePermissionSettingRepository /
)/ 0
{ 	
} 	
} 
} ®
LF:\Code\GitHub\docker\src\AnBook.Core\Authorization\Roles\StaticRoleNames.cs
	namespace 	
AnBook
 
. 
Authorization 
. 
Roles $
{ 
public 

static 
class 
StaticRoleNames '
{ 
public 
static 
class 
Host  
{ 	
public 
const 
string 
Admin  %
=& '
$str( /
;/ 0
} 	
public

 
static

 
class

 
Tenants

 #
{ 	
public 
const 
string 
Admin  %
=& '
$str( /
;/ 0
} 	
} 
} ˝
AF:\Code\GitHub\docker\src\AnBook.Core\Authorization\Users\User.cs
	namespace 	
AnBook
 
. 
Authorization 
. 
Users $
{ 
public 

class 
User 
: 
AbpUser 
<  
User  $
>$ %
{		 
public

 
const

 
string

 
DefaultPassword

 +
=

, -
$str

. 6
;

6 7
public 
static 
string  
CreateRandomPassword 1
(1 2
)2 3
{ 	
return 
Guid 
. 
NewGuid 
(  
)  !
.! "
ToString" *
(* +
$str+ .
). /
./ 0
Truncate0 8
(8 9
$num9 ;
); <
;< =
} 	
public 
static 
User !
CreateTenantAdminUser 0
(0 1
int1 4
tenantId5 =
,= >
string? E
emailAddressF R
)R S
{ 	
var 
user 
= 
new 
User 
{ 
TenantId 
= 
tenantId #
,# $
UserName 
= 
AdminUserName (
,( )
Name 
= 
AdminUserName $
,$ %
Surname 
= 
AdminUserName '
,' (
EmailAddress 
= 
emailAddress +
,+ ,
Roles 
= 
new 
List  
<  !
UserRole! )
>) *
(* +
)+ ,
} 
; 
user 
. 
SetNormalizedNames #
(# $
)$ %
;% &
return 
user 
; 
}   	
}!! 
}"" Ù
WF:\Code\GitHub\docker\src\AnBook.Core\Authorization\Users\UserClaimsPrincipalFactory.cs
	namespace 	
AnBook
 
. 
Authorization 
. 
Users $
{ 
public 

class &
UserClaimsPrincipalFactory +
:, -)
AbpUserClaimsPrincipalFactory. K
<K L
UserL P
,P Q
RoleR V
>V W
{		 
public

 &
UserClaimsPrincipalFactory

 )
(

) *
UserManager 
userManager #
,# $
RoleManager 
roleManager #
,# $
IOptions 
< 
IdentityOptions $
>$ %
optionsAccessor& 5
)5 6
: 
base 
( 
userManager 
, 
roleManager 
, 
optionsAccessor !
)! "
{ 	
} 	
} 
} œ
HF:\Code\GitHub\docker\src\AnBook.Core\Authorization\Users\UserManager.cs
	namespace 	
AnBook
 
. 
Authorization 
. 
Users $
{ 
public 

class 
UserManager 
: 
AbpUserManager -
<- .
Role. 2
,2 3
User4 8
>8 9
{ 
public 
UserManager 
( 
RoleManager 
roleManager #
,# $
	UserStore 
store 
, 
IOptions 
< 
IdentityOptions $
>$ %
optionsAccessor& 5
,5 6
IPasswordHasher 
< 
User  
>  !
passwordHasher" 0
,0 1
IEnumerable 
< 
IUserValidator &
<& '
User' +
>+ ,
>, -
userValidators. <
,< =
IEnumerable 
< 
IPasswordValidator *
<* +
User+ /
>/ 0
>0 1
passwordValidators2 D
,D E
ILookupNormalizer 
keyNormalizer +
,+ ,"
IdentityErrorDescriber "
errors# )
,) *
IServiceProvider 
services %
,% &
ILogger 
< 
UserManager 
<  
User  $
>$ %
>% &
logger' -
,- .
IPermissionManager 
permissionManager 0
,0 1
IUnitOfWorkManager 
unitOfWorkManager 0
,0 1
ICacheManager   
cacheManager   &
,  & '
IRepository!! 
<!! 
OrganizationUnit!! (
,!!( )
long!!* .
>!!. /&
organizationUnitRepository!!0 J
,!!J K
IRepository"" 
<""  
UserOrganizationUnit"" ,
,"", -
long"". 2
>""2 3*
userOrganizationUnitRepository""4 R
,""R S%
IOrganizationUnitSettings## %$
organizationUnitSettings##& >
,##> ?
ISettingManager$$ 
settingManager$$ *
)$$* +
:%% 
base%% 
(%% 
roleManager&& 
,&& 
store'' 
,'' 
optionsAccessor(( 
,((  
passwordHasher)) 
,)) 
userValidators** 
,** 
passwordValidators++ "
,++" #
keyNormalizer,, 
,,, 
errors-- 
,-- 
services.. 
,.. 
logger// 
,// 
permissionManager00 !
,00! "
unitOfWorkManager11 !
,11! "
cacheManager22 
,22 &
organizationUnitRepository33 *
,33* +*
userOrganizationUnitRepository44 .
,44. /$
organizationUnitSettings55 (
,55( )
settingManager66 
)66 
{77 	
}88 	
}99 
}:: æ<
TF:\Code\GitHub\docker\src\AnBook.Core\Authorization\Users\UserRegistrationManager.cs
	namespace 	
AnBook
 
. 
Authorization 
. 
Users $
{ 
public 

class #
UserRegistrationManager (
:) *
DomainService+ 8
{ 
public 
IAbpSession 

AbpSession %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
private 
readonly 
TenantManager &
_tenantManager' 5
;5 6
private 
readonly 
UserManager $
_userManager% 1
;1 2
private 
readonly 
RoleManager $
_roleManager% 1
;1 2
private 
readonly 
IPasswordHasher (
<( )
User) -
>- .
_passwordHasher/ >
;> ?
public #
UserRegistrationManager &
(& '
TenantManager 
tenantManager '
,' (
UserManager 
userManager #
,# $
RoleManager 
roleManager #
,# $
IPasswordHasher 
< 
User  
>  !
passwordHasher" 0
)0 1
{ 	
_tenantManager   
=   
tenantManager   *
;  * +
_userManager!! 
=!! 
userManager!! &
;!!& '
_roleManager"" 
="" 
roleManager"" &
;""& '
_passwordHasher## 
=## 
passwordHasher## ,
;##, -

AbpSession%% 
=%% 
NullAbpSession%% '
.%%' (
Instance%%( 0
;%%0 1
}&& 	
public(( 
async(( 
Task(( 
<(( 
User(( 
>(( 
RegisterAsync((  -
(((- .
string((. 4
name((5 9
,((9 :
string((; A
surname((B I
,((I J
string((K Q
emailAddress((R ^
,((^ _
string((` f
userName((g o
,((o p
string((q w
plainPassword	((x Ö
,
((Ö Ü
bool
((á ã
isEmailConfirmed
((å ú
)
((ú ù
{)) 	
CheckForTenant** 
(** 
)** 
;** 
var,, 
tenant,, 
=,, 
await,,  
GetActiveTenantAsync,, 3
(,,3 4
),,4 5
;,,5 6
var.. 
user.. 
=.. 
new.. 
User.. 
{// 
TenantId00 
=00 
tenant00 !
.00! "
Id00" $
,00$ %
Name11 
=11 
name11 
,11 
Surname22 
=22 
surname22 !
,22! "
EmailAddress33 
=33 
emailAddress33 +
,33+ ,
IsActive44 
=44 
true44 
,44  
UserName55 
=55 
userName55 #
,55# $
IsEmailConfirmed66  
=66! "
isEmailConfirmed66# 3
,663 4
Roles77 
=77 
new77 
List77  
<77  !
UserRole77! )
>77) *
(77* +
)77+ ,
}88 
;88 
user:: 
.:: 
SetNormalizedNames:: #
(::# $
)::$ %
;::% &
foreach<< 
(<< 
var<< 
defaultRole<< $
in<<% '
await<<( -
_roleManager<<. :
.<<: ;
Roles<<; @
.<<@ A
Where<<A F
(<<F G
r<<G H
=><<I K
r<<L M
.<<M N
	IsDefault<<N W
)<<W X
.<<X Y
ToListAsync<<Y d
(<<d e
)<<e f
)<<f g
{== 
user>> 
.>> 
Roles>> 
.>> 
Add>> 
(>> 
new>> "
UserRole>># +
(>>+ ,
tenant>>, 2
.>>2 3
Id>>3 5
,>>5 6
user>>7 ;
.>>; <
Id>>< >
,>>> ?
defaultRole>>@ K
.>>K L
Id>>L N
)>>N O
)>>O P
;>>P Q
}?? 
awaitAA 
_userManagerAA 
.AA "
InitializeOptionsAsyncAA 5
(AA5 6
tenantAA6 <
.AA< =
IdAA= ?
)AA? @
;AA@ A
CheckErrorsCC 
(CC 
awaitCC 
_userManagerCC *
.CC* +
CreateAsyncCC+ 6
(CC6 7
userCC7 ;
,CC; <
plainPasswordCC= J
)CCJ K
)CCK L
;CCL M
awaitDD 
CurrentUnitOfWorkDD #
.DD# $
SaveChangesAsyncDD$ 4
(DD4 5
)DD5 6
;DD6 7
returnFF 
userFF 
;FF 
}GG 	
privateII 
voidII 
CheckForTenantII #
(II# $
)II$ %
{JJ 	
ifKK 
(KK 
!KK 

AbpSessionKK 
.KK 
TenantIdKK $
.KK$ %
HasValueKK% -
)KK- .
{LL 
throwMM 
newMM %
InvalidOperationExceptionMM 3
(MM3 4
$strMM4 R
)MMR S
;MMS T
}NN 
}OO 	
privateQQ 
asyncQQ 
TaskQQ 
<QQ 
TenantQQ !
>QQ! " 
GetActiveTenantAsyncQQ# 7
(QQ7 8
)QQ8 9
{RR 	
ifSS 
(SS 
!SS 

AbpSessionSS 
.SS 
TenantIdSS $
.SS$ %
HasValueSS% -
)SS- .
{TT 
returnUU 
nullUU 
;UU 
}VV 
returnXX 
awaitXX  
GetActiveTenantAsyncXX -
(XX- .

AbpSessionXX. 8
.XX8 9
TenantIdXX9 A
.XXA B
ValueXXB G
)XXG H
;XXH I
}YY 	
private[[ 
async[[ 
Task[[ 
<[[ 
Tenant[[ !
>[[! " 
GetActiveTenantAsync[[# 7
([[7 8
int[[8 ;
tenantId[[< D
)[[D E
{\\ 	
var]] 
tenant]] 
=]] 
await]] 
_tenantManager]] -
.]]- .
FindByIdAsync]]. ;
(]]; <
tenantId]]< D
)]]D E
;]]E F
if^^ 
(^^ 
tenant^^ 
==^^ 
null^^ 
)^^ 
{__ 
throw`` 
new`` !
UserFriendlyException`` /
(``/ 0
L``0 1
(``1 2
$str``2 F
,``F G
tenantId``H P
)``P Q
)``Q R
;``R S
}aa 
ifcc 
(cc 
!cc 
tenantcc 
.cc 
IsActivecc  
)cc  !
{dd 
throwee 
newee !
UserFriendlyExceptionee /
(ee/ 0
Lee0 1
(ee1 2
$stree2 J
,eeJ K
tenantIdeeL T
)eeT U
)eeU V
;eeV W
}ff 
returnhh 
tenanthh 
;hh 
}ii 	
	protectedkk 
virtualkk 
voidkk 
CheckErrorskk *
(kk* +
IdentityResultkk+ 9
identityResultkk: H
)kkH I
{ll 	
identityResultmm 
.mm 
CheckErrorsmm &
(mm& '
LocalizationManagermm' :
)mm: ;
;mm; <
}nn 	
}oo 
}pp ÿ
FF:\Code\GitHub\docker\src\AnBook.Core\Authorization\Users\UserStore.cs
	namespace 	
AnBook
 
. 
Authorization 
. 
Users $
{		 
public

 

class

 
	UserStore

 
:

 
AbpUserStore

 )
<

) *
Role

* .
,

. /
User

0 4
>

4 5
{ 
public 
	UserStore 
( 
IUnitOfWorkManager 
unitOfWorkManager 0
,0 1
IRepository 
< 
User 
, 
long "
>" #
userRepository$ 2
,2 3
IRepository 
< 
Role 
> 
roleRepository ,
,, -#
IAsyncQueryableExecuter #"
asyncQueryableExecuter$ :
,: ;
IRepository 
< 
UserRole  
,  !
long" &
>& '
userRoleRepository( :
,: ;
IRepository 
< 
	UserLogin !
,! "
long# '
>' (
userLoginRepository) <
,< =
IRepository 
< 
	UserClaim !
,! "
long# '
>' (
userClaimRepository) <
,< =
IRepository 
< !
UserPermissionSetting -
,- .
long/ 3
>3 4+
userPermissionSettingRepository5 T
,T U
IRepository 
<  
UserOrganizationUnit ,
,, -
long. 2
>2 3*
userOrganizationUnitRepository4 R
,R S
IRepository 
<  
OrganizationUnitRole ,
,, -
long. 2
>2 3*
organizationUnitRoleRepository4 R
)R S
: 
base 
( 
unitOfWorkManager !
,! "
userRepository 
, 
roleRepository 
, "
asyncQueryableExecuter &
,& '
userRoleRepository "
," #
userLoginRepository #
,# $
userClaimRepository #
,# $+
userPermissionSettingRepository /
,/ 0*
userOrganizationUnitRepository   .
,  . /*
organizationUnitRoleRepository!! .
)!!. /
{"" 	
}## 	
}$$ 
}%% ·
HF:\Code\GitHub\docker\src\AnBook.Core\Configuration\AppConfigurations.cs
	namespace 	
AnBook
 
. 
Configuration 
{ 
public 

static 
class 
AppConfigurations )
{		 
private

 
static

 
readonly

  
ConcurrentDictionary

  4
<

4 5
string

5 ;
,

; <
IConfigurationRoot

= O
>

O P
_configurationCache

Q d
;

d e
static 
AppConfigurations  
(  !
)! "
{ 	
_configurationCache 
=  !
new" % 
ConcurrentDictionary& :
<: ;
string; A
,A B
IConfigurationRootC U
>U V
(V W
)W X
;X Y
} 	
public 
static 
IConfigurationRoot (
Get) ,
(, -
string- 3
path4 8
,8 9
string: @
environmentNameA P
=Q R
nullS W
,W X
boolY ]
addUserSecrets^ l
=m n
falseo t
)t u
{ 	
var 
cacheKey 
= 
path 
+  !
$str" %
+& '
environmentName( 7
+8 9
$str: =
+> ?
addUserSecrets@ N
;N O
return 
_configurationCache &
.& '
GetOrAdd' /
(/ 0
cacheKey 
, 
_ 
=> 
BuildConfiguration '
(' (
path( ,
,, -
environmentName. =
,= >
addUserSecrets? M
)M N
) 
; 
} 	
private 
static 
IConfigurationRoot )
BuildConfiguration* <
(< =
string= C
pathD H
,H I
stringJ P
environmentNameQ `
=a b
nullc g
,g h
booli m
addUserSecretsn |
=} ~
false	 Ñ
)
Ñ Ö
{ 	
var 
builder 
= 
new  
ConfigurationBuilder 2
(2 3
)3 4
. 
SetBasePath 
( 
path !
)! "
. 
AddJsonFile 
( 
$str /
,/ 0
optional1 9
:9 :
true; ?
,? @
reloadOnChangeA O
:O P
trueQ U
)U V
;V W
if   
(   
!   
environmentName    
.    !
IsNullOrWhiteSpace  ! 3
(  3 4
)  4 5
)  5 6
{!! 
builder"" 
="" 
builder"" !
.""! "
AddJsonFile""" -
(""- .
$""". 0
appsettings.""0 <
{""< =
environmentName""= L
}""L M
.json""M R
"""R S
,""S T
optional""U ]
:""] ^
true""_ c
)""c d
;""d e
}## 
builder%% 
=%% 
builder%% 
.%% #
AddEnvironmentVariables%% 5
(%%5 6
)%%6 7
;%%7 8
if'' 
('' 
addUserSecrets'' 
)'' 
{(( 
builder)) 
.)) 
AddUserSecrets)) &
())& '
typeof))' -
())- .
AppConfigurations)). ?
)))? @
.))@ A
GetAssembly))A L
())L M
)))M N
)))N O
;))O P
}** 
return,, 
builder,, 
.,, 
Build,,  
(,,  !
),,! "
;,," #
}-- 	
}.. 
}// ´
FF:\Code\GitHub\docker\src\AnBook.Core\Configuration\AppSettingNames.cs
	namespace 	
AnBook
 
. 
Configuration 
{ 
public 

static 
class 
AppSettingNames '
{ 
public 
const 
string 
UiTheme #
=$ %
$str& 3
;3 4
} 
} ˘	
IF:\Code\GitHub\docker\src\AnBook.Core\Configuration\AppSettingProvider.cs
	namespace 	
AnBook
 
. 
Configuration 
{ 
public 

class 
AppSettingProvider #
:$ %
SettingProvider& 5
{ 
public 
override 
IEnumerable #
<# $
SettingDefinition$ 5
>5 6!
GetSettingDefinitions7 L
(L M,
 SettingDefinitionProviderContextM m
contextn u
)u v
{		 	
return

 
new

 
[

 
]

 
{ 
new 
SettingDefinition %
(% &
AppSettingNames& 5
.5 6
UiTheme6 =
,= >
$str? D
,D E
scopesF L
:L M
SettingScopesN [
.[ \
Application\ g
|h i
SettingScopesj w
.w x
Tenantx ~
|	 Ä
SettingScopes
Å é
.
é è
User
è ì
,
ì î 
isVisibleToClients
ï ß
:
ß ®
true
© ≠
)
≠ Æ
} 
; 
} 	
} 
} ¸
@F:\Code\GitHub\docker\src\AnBook.Core\Editions\EditionManager.cs
	namespace 	
AnBook
 
. 
Editions 
{ 
public 

class 
EditionManager 
:  !
AbpEditionManager" 3
{ 
public		 
const		 
string		 
DefaultEditionName		 .
=		/ 0
$str		1 ;
;		; <
public 
EditionManager 
( 
IRepository 
< 
Edition 
>  
editionRepository! 2
,2 3%
IAbpZeroFeatureValueStore %
featureValueStore& 7
)7 8
: 
base 
( 
editionRepository !
,! "
featureValueStore !
)! "
{ 	
} 	
} 
} Ì
CF:\Code\GitHub\docker\src\AnBook.Core\Features\FeatureValueStore.cs
	namespace		 	
AnBook		
 
.		 
Features		 
{

 
public 

class 
FeatureValueStore "
:# $ 
AbpFeatureValueStore% 9
<9 :
Tenant: @
,@ A
UserB F
>F G
{ 
public 
FeatureValueStore  
(  !
ICacheManager 
cacheManager &
,& '
IRepository 
<  
TenantFeatureSetting ,
,, -
long. 2
>2 3#
tenantFeatureRepository4 K
,K L
IRepository 
< 
Tenant 
> 
tenantRepository  0
,0 1
IRepository 
< !
EditionFeatureSetting -
,- .
long/ 3
>3 4$
editionFeatureRepository5 M
,M N
IFeatureManager 
featureManager *
,* +
IUnitOfWorkManager 
unitOfWorkManager 0
)0 1
: 
base 
( 
cacheManager 
, #
tenantFeatureRepository )
,) *
tenantRepository "
," #$
editionFeatureRepository *
,* +
featureManager  
,  !
unitOfWorkManager #
)# $
{ 	
} 	
} 
} ã
CF:\Code\GitHub\docker\src\AnBook.Core\Identity\IdentityRegistrar.cs
	namespace		 	
AnBook		
 
.		 
Identity		 
{

 
public 

static 
class 
IdentityRegistrar )
{ 
public 
static 
IdentityBuilder %
Register& .
(. /
IServiceCollection/ A
servicesB J
)J K
{ 	
services 
. 

AddLogging 
(  
)  !
;! "
return 
services 
. 
AddAbpIdentity *
<* +
Tenant+ 1
,1 2
User3 7
,7 8
Role9 =
>= >
(> ?
)? @
. 
AddAbpTenantManager $
<$ %
TenantManager% 2
>2 3
(3 4
)4 5
. 
AddAbpUserManager "
<" #
UserManager# .
>. /
(/ 0
)0 1
. 
AddAbpRoleManager "
<" #
RoleManager# .
>. /
(/ 0
)0 1
.  
AddAbpEditionManager %
<% &
EditionManager& 4
>4 5
(5 6
)6 7
. 
AddAbpUserStore  
<  !
	UserStore! *
>* +
(+ ,
), -
. 
AddAbpRoleStore  
<  !
	RoleStore! *
>* +
(+ ,
), -
. 
AddAbpLogInManager #
<# $
LogInManager$ 0
>0 1
(1 2
)2 3
. 
AddAbpSignInManager $
<$ %
SignInManager% 2
>2 3
(3 4
)4 5
. (
AddAbpSecurityStampValidator -
<- ."
SecurityStampValidator. D
>D E
(E F
)F G
. ,
 AddAbpUserClaimsPrincipalFactory 1
<1 2&
UserClaimsPrincipalFactory2 L
>L M
(M N
)N O
.  
AddPermissionChecker %
<% &
PermissionChecker& 7
>7 8
(8 9
)9 :
. $
AddDefaultTokenProviders )
() *
)* +
;+ ,
} 	
} 
}   ⁄
HF:\Code\GitHub\docker\src\AnBook.Core\Identity\SecurityStampValidator.cs
	namespace		 	
AnBook		
 
.		 
Identity		 
{

 
public 

class "
SecurityStampValidator '
:( )%
AbpSecurityStampValidator* C
<C D
TenantD J
,J K
RoleL P
,P Q
UserR V
>V W
{ 
public "
SecurityStampValidator %
(% &
IOptions 
< )
SecurityStampValidatorOptions 2
>2 3
options4 ;
,; <
SignInManager 
signInManager '
,' (
ISystemClock 
systemClock $
)$ %
: 
base 
( 
options 
, 
signInManager 
,  
systemClock 
) 
{ 	
} 	
} 
} ‰
?F:\Code\GitHub\docker\src\AnBook.Core\Identity\SignInManager.cs
	namespace 	
AnBook
 
. 
Identity 
{ 
public 

class 
SignInManager 
:  
AbpSignInManager! 1
<1 2
Tenant2 8
,8 9
Role: >
,> ?
User@ D
>D E
{ 
public 
SignInManager 
( 
UserManager 
userManager #
,# $ 
IHttpContextAccessor  
contextAccessor! 0
,0 1&
UserClaimsPrincipalFactory &
claimsFactory' 4
,4 5
IOptions 
< 
IdentityOptions $
>$ %
optionsAccessor& 5
,5 6
ILogger 
< 
SignInManager !
<! "
User" &
>& '
>' (
logger) /
,/ 0
IUnitOfWorkManager 
unitOfWorkManager 0
,0 1
ISettingManager 
settingManager *
,* +)
IAuthenticationSchemeProvider )
schemes* 1
)1 2
: 
base 
( 
userManager 
, 
contextAccessor 
,  
claimsFactory 
, 
optionsAccessor 
,  
logger 
, 
unitOfWorkManager   !
,  ! "
settingManager!! 
,!! 
schemes"" 
)"" 
{## 	
}$$ 	
}%% 
}&& û	
RF:\Code\GitHub\docker\src\AnBook.Core\Localization\AnBookLocalizationConfigurer.cs
	namespace 	
AnBook
 
. 
Localization 
{ 
public 

static 
class (
AnBookLocalizationConfigurer 4
{		 
public

 
static

 
void

 
	Configure

 $
(

$ %&
ILocalizationConfiguration

% ?%
localizationConfiguration

@ Y
)

Y Z
{ 	%
localizationConfiguration %
.% &
Sources& -
.- .
Add. 1
(1 2
new -
!DictionaryBasedLocalizationSource 5
(5 6
AnBookConsts6 B
.B C"
LocalizationSourceNameC Y
,Y Z
new 9
-XmlEmbeddedFileLocalizationDictionaryProvider E
(E F
typeof 
( (
AnBookLocalizationConfigurer ;
); <
.< =
GetAssembly= H
(H I
)I J
,J K
$str 9
) 
) 
) 
; 
} 	
} 
} ¸
<F:\Code\GitHub\docker\src\AnBook.Core\MultiTenancy\Tenant.cs
	namespace 	
AnBook
 
. 
MultiTenancy 
{ 
public 

class 
Tenant 
: 
	AbpTenant #
<# $
User$ (
>( )
{ 
public 
Tenant 
( 
) 
{		 	
}

 	
public 
Tenant 
( 
string 
tenancyName (
,( )
string* 0
name1 5
)5 6
: 
base 
( 
tenancyName 
, 
name  $
)$ %
{ 	
} 	
} 
} ô	
CF:\Code\GitHub\docker\src\AnBook.Core\MultiTenancy\TenantManager.cs
	namespace 	
AnBook
 
. 
MultiTenancy 
{ 
public		 

class		 
TenantManager		 
:		  
AbpTenantManager		! 1
<		1 2
Tenant		2 8
,		8 9
User		: >
>		> ?
{

 
public 
TenantManager 
( 
IRepository 
< 
Tenant 
> 
tenantRepository  0
,0 1
IRepository 
<  
TenantFeatureSetting ,
,, -
long. 2
>2 3#
tenantFeatureRepository4 K
,K L
EditionManager 
editionManager )
,) *%
IAbpZeroFeatureValueStore %
featureValueStore& 7
)7 8
: 
base 
( 
tenantRepository  
,  !#
tenantFeatureRepository '
,' (
editionManager 
, 
featureValueStore !
)! "
{ 	
} 	
} 
} è
@F:\Code\GitHub\docker\src\AnBook.Core\Properties\AssemblyInfo.cs
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
$str		 (
)		( )
]		) *
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
8F:\Code\GitHub\docker\src\AnBook.Core\Timing\AppTimes.cs
	namespace 	
AnBook
 
. 
Timing 
{ 
public 

class 
AppTimes 
:  
ISingletonDependency 0
{ 
public 
DateTime 
StartupTime #
{$ %
get& )
;) *
set+ .
;. /
}0 1
} 
} ‡
DF:\Code\GitHub\docker\src\AnBook.Core\Validation\ValidationHelper.cs
	namespace 	
AnBook
 
. 

Validation 
{ 
public 

static 
class 
ValidationHelper (
{ 
public 
const 
string 

EmailRegex &
=' (
$str) Z
;Z [
public

 
static

 
bool

 
IsEmail

 "
(

" #
string

# )
value

* /
)

/ 0
{ 	
if 
( 
value 
. 
IsNullOrEmpty #
(# $
)$ %
)% &
{ 
return 
false 
; 
} 
var 
regex 
= 
new 
Regex !
(! "

EmailRegex" ,
), -
;- .
return 
regex 
. 
IsMatch  
(  !
value! &
)& '
;' (
} 	
} 
} §
CF:\Code\GitHub\docker\src\AnBook.Core\Web\WebContentFolderHelper.cs
	namespace 	
AnBook
 
. 
Web 
{ 
public 

static 
class %
WebContentDirectoryFinder 1
{ 
public 
static 
string &
CalculateContentRootFolder 7
(7 8
)8 9
{ 	
var %
coreAssemblyDirectoryPath )
=* +
Path, 0
.0 1
GetDirectoryName1 A
(A B
typeofB H
(H I
AnBookCoreModuleI Y
)Y Z
.Z [
GetAssembly[ f
(f g
)g h
.h i
Locationi q
)q r
;r s
if 
( %
coreAssemblyDirectoryPath )
==* ,
null- 1
)1 2
{ 
throw 
new 
	Exception #
(# $
$str$ V
)V W
;W X
} 
var 
directoryInfo 
= 
new  #
DirectoryInfo$ 1
(1 2%
coreAssemblyDirectoryPath2 K
)K L
;L M
while 
( 
! 
DirectoryContains %
(% &
directoryInfo& 3
.3 4
FullName4 <
,< =
$str> J
)J K
)K L
{ 
if 
( 
directoryInfo !
.! "
Parent" (
==) +
null, 0
)0 1
{ 
throw 
new 
	Exception '
(' (
$str( M
)M N
;N O
} 
directoryInfo 
= 
directoryInfo  -
.- .
Parent. 4
;4 5
} 
var!! 
webMvcFolder!! 
=!! 
Path!! #
.!!# $
Combine!!$ +
(!!+ ,
directoryInfo!!, 9
.!!9 :
FullName!!: B
,!!B C
$str!!D I
,!!I J
$str!!K [
)!![ \
;!!\ ]
if"" 
("" 
	Directory"" 
."" 
Exists""  
(""  !
webMvcFolder""! -
)""- .
)"". /
{## 
return$$ 
webMvcFolder$$ #
;$$# $
}%% 
var'' 
webHostFolder'' 
='' 
Path''  $
.''$ %
Combine''% ,
('', -
directoryInfo''- :
.'': ;
FullName''; C
,''C D
$str''E J
,''J K
$str''L ]
)''] ^
;''^ _
if(( 
((( 
	Directory(( 
.(( 
Exists((  
(((  !
webHostFolder((! .
)((. /
)((/ 0
{)) 
return** 
webHostFolder** $
;**$ %
}++ 
throw-- 
new-- 
	Exception-- 
(--  
$str--  P
)--P Q
;--Q R
}.. 	
private00 
static00 
bool00 
DirectoryContains00 -
(00- .
string00. 4
	directory005 >
,00> ?
string00@ F
fileName00G O
)00O P
{11 	
return22 
	Directory22 
.22 
GetFiles22 %
(22% &
	directory22& /
)22/ 0
.220 1
Any221 4
(224 5
filePath225 =
=>22> @
string22A G
.22G H
Equals22H N
(22N O
Path22O S
.22S T
GetFileName22T _
(22_ `
filePath22` h
)22h i
,22i j
fileName22k s
)22s t
)22t u
;22u v
}33 	
}44 
}55 Õ
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
]| }ß

YF:\Code\GitHub\docker\src\AnBook.Core\obj\Debug\netcoreapp2.2\AnBook.Core.AssemblyInfo.cs
[ 
assembly 	
:	 

	Microsoft 
. 

Extensions 
.  
Configuration  -
.- .
UserSecrets. 9
.9 :"
UserSecretsIdAttribute: P
(P Q
$str	Q ç
)
ç é
]
é è
[ 
assembly 	
:	 

System 
. 

Reflection 
. (
AssemblyFileVersionAttribute 9
(9 :
$str: C
)C D
]D E
[ 
assembly 	
:	 

System 
. 

Reflection 
. 1
%AssemblyInformationalVersionAttribute B
(B C
$strC L
)L M
]M N
[ 
assembly 	
:	 

System 
. 

Reflection 
. "
AssemblyTitleAttribute 3
(3 4
$str4 A
)A B
]B C
[ 
assembly 	
:	 

System 
. 

Reflection 
. $
AssemblyVersionAttribute 5
(5 6
$str6 ?
)? @
]@ A
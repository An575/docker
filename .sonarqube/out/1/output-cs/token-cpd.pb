—
GF:\Code\GitHub\docker\src\AnBook.Application\AnBookApplicationModule.cs
	namespace 	
AnBook
 
{ 
[ 
	DependsOn 
( 
typeof		 
(		 
AnBookCoreModule		 
)		  
,		  !
typeof

 
(

 
AbpAutoMapperModule

 "
)

" #
)

# $
]

$ %
public 

class #
AnBookApplicationModule (
:) *
	AbpModule+ 4
{ 
public 
override 
void 
PreInitialize *
(* +
)+ ,
{ 	
Configuration 
. 
Authorization '
.' (
	Providers( 1
.1 2
Add2 5
<5 6'
AnBookAuthorizationProvider6 Q
>Q R
(R S
)S T
;T U
} 	
public 
override 
void 

Initialize '
(' (
)( )
{ 	
var 
thisAssembly 
= 
typeof %
(% &#
AnBookApplicationModule& =
)= >
.> ?
GetAssembly? J
(J K
)K L
;L M

IocManager 
. (
RegisterAssemblyByConvention 3
(3 4
thisAssembly4 @
)@ A
;A B
Configuration 
. 
Modules !
.! "
AbpAutoMapper" /
(/ 0
)0 1
.1 2
Configurators2 ?
.? @
Add@ C
(C D
cfg 
=> 
cfg 
. 
AddProfiles &
(& '
thisAssembly' 3
)3 4
) 
; 
} 	
} 
} œ
DF:\Code\GitHub\docker\src\AnBook.Application\AnBookAppServiceBase.cs
	namespace

 	
AnBook


 
{ 
public 

abstract 
class  
AnBookAppServiceBase .
:/ 0
ApplicationService1 C
{ 
public 
TenantManager 
TenantManager *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
UserManager 
UserManager &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
	protected  
AnBookAppServiceBase &
(& '
)' (
{ 	"
LocalizationSourceName "
=# $
AnBookConsts% 1
.1 2"
LocalizationSourceName2 H
;H I
} 	
	protected 
virtual 
Task 
< 
User #
># $
GetCurrentUserAsync% 8
(8 9
)9 :
{ 	
var 
user 
= 
UserManager "
." #
FindByIdAsync# 0
(0 1

AbpSession1 ;
.; <
	GetUserId< E
(E F
)F G
.G H
ToStringH P
(P Q
)Q R
)R S
;S T
if 
( 
user 
== 
null 
) 
{ 
throw 
new 
	Exception #
(# $
$str$ ?
)? @
;@ A
}   
return"" 
user"" 
;"" 
}## 	
	protected%% 
virtual%% 
Task%% 
<%% 
Tenant%% %
>%%% &!
GetCurrentTenantAsync%%' <
(%%< =
)%%= >
{&& 	
return'' 
TenantManager''  
.''  !
GetByIdAsync''! -
(''- .

AbpSession''. 8
.''8 9
GetTenantId''9 D
(''D E
)''E F
)''F G
;''G H
}(( 	
	protected** 
virtual** 
void** 
CheckErrors** *
(*** +
IdentityResult**+ 9
identityResult**: H
)**H I
{++ 	
identityResult,, 
.,, 
CheckErrors,, &
(,,& '
LocalizationManager,,' :
),,: ;
;,,; <
}-- 	
}.. 
}// ‰
9F:\Code\GitHub\docker\src\AnBook.Application\AppConsts.cs
	namespace 	
AnBook
 
{ 
public 

class 
	AppConsts 
{ 
public 
const 
string 
DefaultPassPhrase -
=. /
$str0 B
;B C
}		 
}

 å2
VF:\Code\GitHub\docker\src\AnBook.Application\Authorization\AbpLoginResultTypeHelper.cs
	namespace 	
AnBook
 
. 
Authorization 
{ 
public		 

class		 $
AbpLoginResultTypeHelper		 )
:		* +
AbpServiceBase		, :
,		: ; 
ITransientDependency		< P
{

 
public $
AbpLoginResultTypeHelper '
(' (
)( )
{ 	"
LocalizationSourceName "
=# $
AnBookConsts% 1
.1 2"
LocalizationSourceName2 H
;H I
} 	
public 
	Exception 0
$CreateExceptionForFailedLoginAttempt =
(= >
AbpLoginResultType> P
resultQ W
,W X
stringY _"
usernameOrEmailAddress` v
,v w
stringx ~
tenancyName	 ä
)
ä ã
{ 	
switch 
( 
result 
) 
{ 
case 
AbpLoginResultType '
.' (
Success( /
:/ 0
return 
new 
	Exception (
(( )
$str) X
)X Y
;Y Z
case 
AbpLoginResultType '
.' ()
InvalidUserNameOrEmailAddress( E
:E F
case 
AbpLoginResultType '
.' (
InvalidPassword( 7
:7 8
return 
new !
UserFriendlyException 4
(4 5
L5 6
(6 7
$str7 D
)D E
,E F
LG H
(H I
$strI d
)d e
)e f
;f g
case 
AbpLoginResultType '
.' (
InvalidTenancyName( :
:: ;
return 
new !
UserFriendlyException 4
(4 5
L5 6
(6 7
$str7 D
)D E
,E F
LG H
(H I
$strI l
,l m
tenancyNamen y
)y z
)z {
;{ |
case 
AbpLoginResultType '
.' (
TenantIsNotActive( 9
:9 :
return 
new !
UserFriendlyException 4
(4 5
L5 6
(6 7
$str7 D
)D E
,E F
LG H
(H I
$strI \
,\ ]
tenancyName^ i
)i j
)j k
;k l
case 
AbpLoginResultType '
.' (
UserIsNotActive( 7
:7 8
return 
new !
UserFriendlyException 4
(4 5
L5 6
(6 7
$str7 D
)D E
,E F
LG H
(H I
$strI h
,h i#
usernameOrEmailAddress	j Ä
)
Ä Å
)
Å Ç
;
Ç É
case 
AbpLoginResultType '
.' (#
UserEmailIsNotConfirmed( ?
:? @
return   
new   !
UserFriendlyException   4
(  4 5
L  5 6
(  6 7
$str  7 D
)  D E
,  E F
L  G H
(  H I
$str  I p
)  p q
)  q r
;  r s
case!! 
AbpLoginResultType!! '
.!!' (
	LockedOut!!( 1
:!!1 2
return"" 
new"" !
UserFriendlyException"" 4
(""4 5
L""5 6
(""6 7
$str""7 D
)""D E
,""E F
L""G H
(""H I
$str""I _
)""_ `
)""` a
;""a b
default## 
:## 
Logger$$ 
.$$ 
Warn$$ 
($$  
$str$$  ?
+$$@ A
result$$B H
)$$H I
;$$I J
return%% 
new%% !
UserFriendlyException%% 4
(%%4 5
L%%5 6
(%%6 7
$str%%7 D
)%%D E
)%%E F
;%%F G
}&& 
}'' 	
public)) 
string)) 7
+CreateLocalizedMessageForFailedLoginAttempt)) A
())A B
AbpLoginResultType))B T
result))U [
,))[ \
string))] c"
usernameOrEmailAddress))d z
,))z {
string	))| Ç
tenancyName
))É é
)
))é è
{** 	
switch++ 
(++ 
result++ 
)++ 
{,, 
case-- 
AbpLoginResultType-- '
.--' (
Success--( /
:--/ 0
throw.. 
new.. 
	Exception.. '
(..' (
$str..( W
)..W X
;..X Y
case// 
AbpLoginResultType// '
.//' ()
InvalidUserNameOrEmailAddress//( E
://E F
case00 
AbpLoginResultType00 '
.00' (
InvalidPassword00( 7
:007 8
return11 
L11 
(11 
$str11 8
)118 9
;119 :
case22 
AbpLoginResultType22 '
.22' (
InvalidTenancyName22( :
:22: ;
return33 
L33 
(33 
$str33 @
,33@ A
tenancyName33B M
)33M N
;33N O
case44 
AbpLoginResultType44 '
.44' (
TenantIsNotActive44( 9
:449 :
return55 
L55 
(55 
$str55 0
,550 1
tenancyName552 =
)55= >
;55> ?
case66 
AbpLoginResultType66 '
.66' (
UserIsNotActive66( 7
:667 8
return77 
L77 
(77 
$str77 <
,77< ="
usernameOrEmailAddress77> T
)77T U
;77U V
case88 
AbpLoginResultType88 '
.88' (#
UserEmailIsNotConfirmed88( ?
:88? @
return99 
L99 
(99 
$str99 D
)99D E
;99E F
default:: 
::: 
Logger;; 
.;; 
Warn;; 
(;;  
$str;;  ?
+;;@ A
result;;B H
);;H I
;;;I J
return<< 
L<< 
(<< 
$str<< *
)<<* +
;<<+ ,
}== 
}>> 	
}?? 
}@@ ◊
XF:\Code\GitHub\docker\src\AnBook.Application\Authorization\Accounts\AccountAppService.cs
	namespace 	
AnBook
 
. 
Authorization 
. 
Accounts '
{ 
public		 

class		 
AccountAppService		 "
:		# $ 
AnBookAppServiceBase		% 9
,		9 :
IAccountAppService		; M
{

 
public 
const 
string 
PasswordRegex )
=* +
$str, x
;x y
private 
readonly #
UserRegistrationManager 0$
_userRegistrationManager1 I
;I J
public 
AccountAppService  
(  !#
UserRegistrationManager ##
userRegistrationManager$ ;
); <
{ 	$
_userRegistrationManager $
=% &#
userRegistrationManager' >
;> ?
} 	
public 
async 
Task 
< #
IsTenantAvailableOutput 1
>1 2
IsTenantAvailable3 D
(D E"
IsTenantAvailableInputE [
input\ a
)a b
{ 	
var 
tenant 
= 
await 
TenantManager ,
., -"
FindByTenancyNameAsync- C
(C D
inputD I
.I J
TenancyNameJ U
)U V
;V W
if 
( 
tenant 
== 
null 
) 
{ 
return 
new #
IsTenantAvailableOutput 2
(2 3#
TenantAvailabilityState3 J
.J K
NotFoundK S
)S T
;T U
} 
if 
( 
! 
tenant 
. 
IsActive  
)  !
{ 
return   
new   #
IsTenantAvailableOutput   2
(  2 3#
TenantAvailabilityState  3 J
.  J K
InActive  K S
)  S T
;  T U
}!! 
return## 
new## #
IsTenantAvailableOutput## .
(##. /#
TenantAvailabilityState##/ F
.##F G
	Available##G P
,##P Q
tenant##R X
.##X Y
Id##Y [
)##[ \
;##\ ]
}$$ 	
public&& 
async&& 
Task&& 
<&& 
RegisterOutput&& (
>&&( )
Register&&* 2
(&&2 3
RegisterInput&&3 @
input&&A F
)&&F G
{'' 	
var(( 
user(( 
=(( 
await(( $
_userRegistrationManager(( 5
.((5 6
RegisterAsync((6 C
(((C D
input)) 
.)) 
Name)) 
,)) 
input** 
.** 
Surname** 
,** 
input++ 
.++ 
EmailAddress++ "
,++" #
input,, 
.,, 
UserName,, 
,,, 
input-- 
.-- 
Password-- 
,-- 
true.. 
)// 
;// 
var11 /
#isEmailConfirmationRequiredForLogin11 3
=114 5
await116 ;
SettingManager11< J
.11J K 
GetSettingValueAsync11K _
<11_ `
bool11` d
>11d e
(11e f
AbpZeroSettingNames11f y
.11y z
UserManagement	11z à
.
11à â1
#IsEmailConfirmationRequiredForLogin
11â ¨
)
11¨ ≠
;
11≠ Æ
return33 
new33 
RegisterOutput33 %
{44 
CanLogin55 
=55 
user55 
.55  
IsActive55  (
&&55) +
(55, -
user55- 1
.551 2
IsEmailConfirmed552 B
||55C E
!55F G/
#isEmailConfirmationRequiredForLogin55G j
)55j k
}66 
;66 
}77 	
}88 
}99 Û
aF:\Code\GitHub\docker\src\AnBook.Application\Authorization\Accounts\Dto\IsTenantAvailableInput.cs
	namespace 	
AnBook
 
. 
Authorization 
. 
Accounts '
.' (
Dto( +
{ 
public 

class "
IsTenantAvailableInput '
{ 
[ 	
Required	 
] 
[		 	
StringLength			 
(		 
AbpTenantBase		 #
.		# $ 
MaxTenancyNameLength		$ 8
)		8 9
]		9 :
public

 
string

 
TenancyName

 !
{

" #
get

$ '
;

' (
set

) ,
;

, -
}

. /
} 
} Ë	
bF:\Code\GitHub\docker\src\AnBook.Application\Authorization\Accounts\Dto\IsTenantAvailableOutput.cs
	namespace 	
AnBook
 
. 
Authorization 
. 
Accounts '
.' (
Dto( +
{ 
public 

class #
IsTenantAvailableOutput (
{ 
public #
TenantAvailabilityState &
State' ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
public 
int 
? 
TenantId 
{ 
get "
;" #
set$ '
;' (
}) *
public		 #
IsTenantAvailableOutput		 &
(		& '
)		' (
{

 	
} 	
public #
IsTenantAvailableOutput &
(& '#
TenantAvailabilityState' >
state? D
,D E
intF I
?I J
tenantIdK S
=T U
nullV Z
)Z [
{ 	
State 
= 
state 
; 
TenantId 
= 
tenantId 
;  
} 	
} 
} Æ
XF:\Code\GitHub\docker\src\AnBook.Application\Authorization\Accounts\Dto\RegisterInput.cs
	namespace 	
AnBook
 
. 
Authorization 
. 
Accounts '
.' (
Dto( +
{		 
public

 

class

 
RegisterInput

 
:

  
IValidatableObject

! 3
{ 
[ 	
Required	 
] 
[ 	
StringLength	 
( 
AbpUserBase !
.! "
MaxNameLength" /
)/ 0
]0 1
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
[ 	
Required	 
] 
[ 	
StringLength	 
( 
AbpUserBase !
.! "
MaxSurnameLength" 2
)2 3
]3 4
public 
string 
Surname 
{ 
get  #
;# $
set% (
;( )
}* +
[ 	
Required	 
] 
[ 	
StringLength	 
( 
AbpUserBase !
.! "
MaxUserNameLength" 3
)3 4
]4 5
public 
string 
UserName 
{  
get! $
;$ %
set& )
;) *
}+ ,
[ 	
Required	 
] 
[ 	
EmailAddress	 
] 
[ 	
StringLength	 
( 
AbpUserBase !
.! "!
MaxEmailAddressLength" 7
)7 8
]8 9
public 
string 
EmailAddress "
{# $
get% (
;( )
set* -
;- .
}/ 0
[ 	
Required	 
] 
[ 	
StringLength	 
( 
AbpUserBase !
.! ""
MaxPlainPasswordLength" 8
)8 9
]9 :
[ 	
DisableAuditing	 
] 
public   
string   
Password   
{    
get  ! $
;  $ %
set  & )
;  ) *
}  + ,
["" 	
DisableAuditing""	 
]"" 
public## 
string## 
CaptchaResponse## %
{##& '
get##( +
;##+ ,
set##- 0
;##0 1
}##2 3
public%% 
IEnumerable%% 
<%% 
ValidationResult%% +
>%%+ ,
Validate%%- 5
(%%5 6
ValidationContext%%6 G
validationContext%%H Y
)%%Y Z
{&& 	
if'' 
('' 
!'' 
UserName'' 
.'' 
IsNullOrEmpty'' '
(''' (
)''( )
)'') *
{(( 
if)) 
()) 
!)) 
UserName)) 
.)) 
Equals)) $
())$ %
EmailAddress))% 1
)))1 2
&&))3 5
ValidationHelper))6 F
.))F G
IsEmail))G N
())N O
UserName))O W
)))W X
)))X Y
{** 
yield++ 
return++  
new++! $
ValidationResult++% 5
(++5 6
$str	++6 á
)
++á à
;
++à â
},, 
}-- 
}.. 	
}// 
}00 à
YF:\Code\GitHub\docker\src\AnBook.Application\Authorization\Accounts\Dto\RegisterOutput.cs
	namespace 	
AnBook
 
. 
Authorization 
. 
Accounts '
.' (
Dto( +
{ 
public 

class 
RegisterOutput 
{ 
public 
bool 
CanLogin 
{ 
get "
;" #
set$ '
;' (
}) *
} 
} Å
bF:\Code\GitHub\docker\src\AnBook.Application\Authorization\Accounts\Dto\TenantAvailabilityState.cs
	namespace 	
AnBook
 
. 
Authorization 
. 
Accounts '
.' (
Dto( +
{ 
public 

enum #
TenantAvailabilityState '
{ 
	Available 
= 
$num 
, 
InActive 
, 
NotFound 
} 
}		 õ
YF:\Code\GitHub\docker\src\AnBook.Application\Authorization\Accounts\IAccountAppService.cs
	namespace 	
AnBook
 
. 
Authorization 
. 
Accounts '
{ 
public 

	interface 
IAccountAppService '
:( )
IApplicationService* =
{ 
Task		 
<		 #
IsTenantAvailableOutput		 $
>		$ %
IsTenantAvailable		& 7
(		7 8"
IsTenantAvailableInput		8 N
input		O T
)		T U
;		U V
Task 
< 
RegisterOutput 
> 
Register %
(% &
RegisterInput& 3
input4 9
)9 :
;: ;
} 
} ô
UF:\Code\GitHub\docker\src\AnBook.Application\Configuration\ConfigurationAppService.cs
	namespace 	
AnBook
 
. 
Configuration 
{ 
[ 
AbpAuthorize 
] 
public		 

class		 #
ConfigurationAppService		 (
:		) * 
AnBookAppServiceBase		+ ?
,		? @$
IConfigurationAppService		A Y
{

 
public 
async 
Task 
ChangeUiTheme '
(' (
ChangeUiThemeInput( :
input; @
)@ A
{ 	
await 
SettingManager  
.  !%
ChangeSettingForUserAsync! :
(: ;

AbpSession; E
.E F
ToUserIdentifierF V
(V W
)W X
,X Y
AppSettingNamesZ i
.i j
UiThemej q
,q r
inputs x
.x y
Themey ~
)~ 
;	 Ä
} 	
} 
} ˝
TF:\Code\GitHub\docker\src\AnBook.Application\Configuration\Dto\ChangeUiThemeInput.cs
	namespace 	
AnBook
 
. 
Configuration 
. 
Dto "
{ 
public 

class 
ChangeUiThemeInput #
{ 
[ 	
Required	 
] 
[ 	
StringLength	 
( 
$num 
) 
] 
public		 
string		 
Theme		 
{		 
get		 !
;		! "
set		# &
;		& '
}		( )
}

 
} ¡
VF:\Code\GitHub\docker\src\AnBook.Application\Configuration\IConfigurationAppService.cs
	namespace 	
AnBook
 
. 
Configuration 
{ 
public 

	interface $
IConfigurationAppService -
{ 
Task 
ChangeUiTheme 
( 
ChangeUiThemeInput -
input. 3
)3 4
;4 5
}		 
}

 Ä
LF:\Code\GitHub\docker\src\AnBook.Application\Configuration\Ui\UiThemeInfo.cs
	namespace 	
AnBook
 
. 
Configuration 
. 
Ui !
{ 
public 

class 
UiThemeInfo 
{ 
public 
string 
Name 
{ 
get  
;  !
}" #
public 
string 
CssClass 
{  
get! $
;$ %
}& '
public 
UiThemeInfo 
( 
string !
name" &
,& '
string( .
cssClass/ 7
)7 8
{		 	
Name

 
=

 
name

 
;

 
CssClass 
= 
cssClass 
;  
} 	
} 
} Ã
IF:\Code\GitHub\docker\src\AnBook.Application\Configuration\Ui\UiThemes.cs
	namespace 	
AnBook
 
. 
Configuration 
. 
Ui !
{ 
public 

static 
class 
UiThemes  
{ 
public 
static 
List 
< 
UiThemeInfo &
>& '
All( +
{, -
get. 1
;1 2
}3 4
static		 
UiThemes		 
(		 
)		 
{

 	
All 
= 
new 
List 
< 
UiThemeInfo &
>& '
{ 
new 
UiThemeInfo 
(  
$str  %
,% &
$str' ,
), -
,- .
new 
UiThemeInfo 
(  
$str  &
,& '
$str( .
). /
,/ 0
new 
UiThemeInfo 
(  
$str  (
,( )
$str* 2
)2 3
,3 4
new 
UiThemeInfo 
(  
$str  -
,- .
$str/ <
)< =
,= >
new 
UiThemeInfo 
(  
$str  (
,( )
$str* 2
)2 3
,3 4
new 
UiThemeInfo 
(  
$str  &
,& '
$str( .
). /
,/ 0
new 
UiThemeInfo 
(  
$str  ,
,, -
$str. :
): ;
,; <
new 
UiThemeInfo 
(  
$str  &
,& '
$str( .
). /
,/ 0
new 
UiThemeInfo 
(  
$str  &
,& '
$str( .
). /
,/ 0
new 
UiThemeInfo 
(  
$str  '
,' (
$str) 0
)0 1
,1 2
new 
UiThemeInfo 
(  
$str  -
,- .
$str/ <
)< =
,= >
new 
UiThemeInfo 
(  
$str  &
,& '
$str( .
). /
,/ 0
new 
UiThemeInfo 
(  
$str  (
,( )
$str* 2
)2 3
,3 4
new 
UiThemeInfo 
(  
$str  '
,' (
$str) 0
)0 1
,1 2
new 
UiThemeInfo 
(  
$str  (
,( )
$str* 2
)2 3
,3 4
new 
UiThemeInfo 
(  
$str  -
,- .
$str/ <
)< =
,= >
new 
UiThemeInfo 
(  
$str  '
,' (
$str) 0
)0 1
,1 2
new 
UiThemeInfo 
(  
$str  &
,& '
$str( .
). /
,/ 0
new 
UiThemeInfo 
(  
$str  +
,+ ,
$str- 8
)8 9
,9 :
new   
UiThemeInfo   
(    
$str    '
,  ' (
$str  ) 0
)  0 1
}!! 
;!! 
}"" 	
}## 
}$$ ∑
PF:\Code\GitHub\docker\src\AnBook.Application\MultiTenancy\Dto\CreateTenantDto.cs
	namespace 	
AnBook
 
. 
MultiTenancy 
. 
Dto !
{ 
[ 
	AutoMapTo 
( 
typeof 
( 
Tenant 
) 
) 
] 
public		 

class		 
CreateTenantDto		  
{

 
[ 	
Required	 
] 
[ 	
StringLength	 
( 
AbpTenantBase #
.# $ 
MaxTenancyNameLength$ 8
)8 9
]9 :
[ 	
RegularExpression	 
( 
AbpTenantBase (
.( )
TenancyNameRegex) 9
)9 :
]: ;
public 
string 
TenancyName !
{" #
get$ '
;' (
set) ,
;, -
}. /
[ 	
Required	 
] 
[ 	
StringLength	 
( 
AbpTenantBase #
.# $
MaxNameLength$ 1
)1 2
]2 3
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
[ 	
Required	 
] 
[ 	
StringLength	 
( 
AbpUserBase !
.! "!
MaxEmailAddressLength" 7
)7 8
]8 9
public 
string 
AdminEmailAddress '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
[ 	
StringLength	 
( 
AbpTenantBase #
.# $%
MaxConnectionStringLength$ =
)= >
]> ?
public 
string 
ConnectionString &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
bool 
IsActive 
{ 
get !
;! "
set# &
;& '
}' (
} 
} Œ
\F:\Code\GitHub\docker\src\AnBook.Application\MultiTenancy\Dto\PagedTenantResultRequestDto.cs
	namespace 	
AnBook
 
. 
MultiTenancy 
. 
Dto !
{ 
public 

class '
PagedTenantResultRequestDto ,
:- .!
PagedResultRequestDto/ D
{ 
public 
string 
Keyword 
{ 
get  #
;# $
set% (
;( )
}* +
public 
bool 
? 
IsActive 
{ 
get  #
;# $
set% (
;( )
}* +
}		 
}

 é
JF:\Code\GitHub\docker\src\AnBook.Application\MultiTenancy\Dto\TenantDto.cs
	namespace 	
AnBook
 
. 
MultiTenancy 
. 
Dto !
{ 
[ 
AutoMapFrom 
( 
typeof 
( 
Tenant 
) 
)  
]  !
public		 

class		 
	TenantDto		 
:		 
	EntityDto		 &
{

 
[ 	
Required	 
] 
[ 	
StringLength	 
( 
AbpTenantBase #
.# $ 
MaxTenancyNameLength$ 8
)8 9
]9 :
[ 	
RegularExpression	 
( 
AbpTenantBase (
.( )
TenancyNameRegex) 9
)9 :
]: ;
public 
string 
TenancyName !
{" #
get$ '
;' (
set) ,
;, -
}. /
[ 	
Required	 
] 
[ 	
StringLength	 
( 
AbpTenantBase #
.# $
MaxNameLength$ 1
)1 2
]2 3
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
bool 
IsActive 
{ 
get !
;! "
set# &
;& '
}' (
} 
} ∑
NF:\Code\GitHub\docker\src\AnBook.Application\MultiTenancy\ITenantAppService.cs
	namespace 	
AnBook
 
. 
MultiTenancy 
{ 
public 

	interface 
ITenantAppService &
:' ( 
IAsyncCrudAppService) =
<= >
	TenantDto> G
,G H
intI L
,L M'
PagedTenantResultRequestDtoN i
,i j
CreateTenantDtok z
,z {
	TenantDto	| Ö
>
Ö Ü
{ 
}		 
}

 ÚO
MF:\Code\GitHub\docker\src\AnBook.Application\MultiTenancy\TenantAppService.cs
	namespace 	
AnBook
 
. 
MultiTenancy 
{ 
[ 
AbpAuthorize 
( 
PermissionNames !
.! "
Pages_Tenants" /
)/ 0
]0 1
public 

class 
TenantAppService !
:" #
AsyncCrudAppService$ 7
<7 8
Tenant8 >
,> ?
	TenantDto@ I
,I J
intK N
,N O'
PagedTenantResultRequestDtoP k
,k l
CreateTenantDtom |
,| }
	TenantDto	~ á
>
á à
,
à â
ITenantAppService
ä õ
{ 
private 
readonly 
TenantManager &
_tenantManager' 5
;5 6
private 
readonly 
EditionManager '
_editionManager( 7
;7 8
private 
readonly 
UserManager $
_userManager% 1
;1 2
private 
readonly 
RoleManager $
_roleManager% 1
;1 2
private 
readonly 
IAbpZeroDbMigrator +
_abpZeroDbMigrator, >
;> ?
public 
TenantAppService 
(  
IRepository 
< 
Tenant 
, 
int  #
># $

repository% /
,/ 0
TenantManager   
tenantManager   '
,  ' (
EditionManager!! 
editionManager!! )
,!!) *
UserManager"" 
userManager"" #
,""# $
RoleManager## 
roleManager## #
,### $
IAbpZeroDbMigrator$$ 
abpZeroDbMigrator$$ 0
)$$0 1
:%% 
base%% 
(%% 

repository%% 
)%% 
{&& 	
_tenantManager'' 
='' 
tenantManager'' *
;''* +
_editionManager(( 
=(( 
editionManager(( ,
;((, -
_userManager)) 
=)) 
userManager)) &
;))& '
_roleManager** 
=** 
roleManager** &
;**& '
_abpZeroDbMigrator++ 
=++  
abpZeroDbMigrator++! 2
;++2 3
},, 	
public.. 
override.. 
async.. 
Task.. "
<.." #
	TenantDto..# ,
>.., -
Create... 4
(..4 5
CreateTenantDto..5 D
input..E J
)..J K
{// 	!
CheckCreatePermission00 !
(00! "
)00" #
;00# $
var33 
tenant33 
=33 
ObjectMapper33 %
.33% &
Map33& )
<33) *
Tenant33* 0
>330 1
(331 2
input332 7
)337 8
;338 9
tenant44 
.44 
ConnectionString44 #
=44$ %
input44& +
.44+ ,
ConnectionString44, <
.44< =
IsNullOrEmpty44= J
(44J K
)44K L
?55 
null55 
:66 
SimpleStringCipher66 $
.66$ %
Instance66% -
.66- .
Encrypt66. 5
(665 6
input666 ;
.66; <
ConnectionString66< L
)66L M
;66M N
var88 
defaultEdition88 
=88  
await88! &
_editionManager88' 6
.886 7
FindByNameAsync887 F
(88F G
EditionManager88G U
.88U V
DefaultEditionName88V h
)88h i
;88i j
if99 
(99 
defaultEdition99 
!=99 !
null99" &
)99& '
{:: 
tenant;; 
.;; 
	EditionId;;  
=;;! "
defaultEdition;;# 1
.;;1 2
Id;;2 4
;;;4 5
}<< 
await>> 
_tenantManager>>  
.>>  !
CreateAsync>>! ,
(>>, -
tenant>>- 3
)>>3 4
;>>4 5
await?? 
CurrentUnitOfWork?? #
.??# $
SaveChangesAsync??$ 4
(??4 5
)??5 6
;??6 7
_abpZeroDbMigratorBB 
.BB $
CreateOrMigrateForTenantBB 7
(BB7 8
tenantBB8 >
)BB> ?
;BB? @
usingEE 
(EE 
CurrentUnitOfWorkEE $
.EE$ %
SetTenantIdEE% 0
(EE0 1
tenantEE1 7
.EE7 8
IdEE8 :
)EE: ;
)EE; <
{FF 
CheckErrorsHH 
(HH 
awaitHH !
_roleManagerHH" .
.HH. /
CreateStaticRolesHH/ @
(HH@ A
tenantHHA G
.HHG H
IdHHH J
)HHJ K
)HHK L
;HHL M
awaitJJ 
CurrentUnitOfWorkJJ '
.JJ' (
SaveChangesAsyncJJ( 8
(JJ8 9
)JJ9 :
;JJ: ;
varMM 
	adminRoleMM 
=MM 
_roleManagerMM  ,
.MM, -
RolesMM- 2
.MM2 3
SingleMM3 9
(MM9 :
rMM: ;
=>MM< >
rMM? @
.MM@ A
NameMMA E
==MMF H
StaticRoleNamesMMI X
.MMX Y
TenantsMMY `
.MM` a
AdminMMa f
)MMf g
;MMg h
awaitNN 
_roleManagerNN "
.NN" #$
GrantAllPermissionsAsyncNN# ;
(NN; <
	adminRoleNN< E
)NNE F
;NNF G
varQQ 
	adminUserQQ 
=QQ 
UserQQ  $
.QQ$ %!
CreateTenantAdminUserQQ% :
(QQ: ;
tenantQQ; A
.QQA B
IdQQB D
,QQD E
inputQQF K
.QQK L
AdminEmailAddressQQL ]
)QQ] ^
;QQ^ _
awaitRR 
_userManagerRR "
.RR" #"
InitializeOptionsAsyncRR# 9
(RR9 :
tenantRR: @
.RR@ A
IdRRA C
)RRC D
;RRD E
CheckErrorsSS 
(SS 
awaitSS !
_userManagerSS" .
.SS. /
CreateAsyncSS/ :
(SS: ;
	adminUserSS; D
,SSD E
UserSSF J
.SSJ K
DefaultPasswordSSK Z
)SSZ [
)SS[ \
;SS\ ]
awaitTT 
CurrentUnitOfWorkTT '
.TT' (
SaveChangesAsyncTT( 8
(TT8 9
)TT9 :
;TT: ;
CheckErrorsWW 
(WW 
awaitWW !
_userManagerWW" .
.WW. /
AddToRoleAsyncWW/ =
(WW= >
	adminUserWW> G
,WWG H
	adminRoleWWI R
.WWR S
NameWWS W
)WWW X
)WWX Y
;WWY Z
awaitXX 
CurrentUnitOfWorkXX '
.XX' (
SaveChangesAsyncXX( 8
(XX8 9
)XX9 :
;XX: ;
}YY 
return[[ 
MapToEntityDto[[ !
([[! "
tenant[[" (
)[[( )
;[[) *
}\\ 	
	protected^^ 
override^^ 

IQueryable^^ %
<^^% &
Tenant^^& ,
>^^, -
CreateFilteredQuery^^. A
(^^A B'
PagedTenantResultRequestDto^^B ]
input^^^ c
)^^c d
{__ 	
return`` 

Repository`` 
.`` 
GetAll`` $
(``$ %
)``% &
.aa 
WhereIfaa 
(aa 
!aa 
inputaa 
.aa  
Keywordaa  '
.aa' (
IsNullOrWhiteSpaceaa( :
(aa: ;
)aa; <
,aa< =
xaa> ?
=>aa@ B
xaaC D
.aaD E
TenancyNameaaE P
.aaP Q
ContainsaaQ Y
(aaY Z
inputaaZ _
.aa_ `
Keywordaa` g
)aag h
||aai k
xaal m
.aam n
Nameaan r
.aar s
Containsaas {
(aa{ |
input	aa| Å
.
aaÅ Ç
Keyword
aaÇ â
)
aaâ ä
)
aaä ã
.bb 
WhereIfbb 
(bb 
inputbb 
.bb 
IsActivebb '
.bb' (
HasValuebb( 0
,bb0 1
xbb2 3
=>bb4 6
xbb7 8
.bb8 9
IsActivebb9 A
==bbB D
inputbbE J
.bbJ K
IsActivebbK S
)bbS T
;bbT U
}cc 	
	protectedee 
overrideee 
voidee 
MapToEntityee  +
(ee+ ,
	TenantDtoee, 5
updateInputee6 A
,eeA B
TenanteeC I
entityeeJ P
)eeP Q
{ff 	
entityhh 
.hh 
Namehh 
=hh 
updateInputhh %
.hh% &
Namehh& *
;hh* +
entityii 
.ii 
TenancyNameii 
=ii  
updateInputii! ,
.ii, -
TenancyNameii- 8
;ii8 9
entityjj 
.jj 
IsActivejj 
=jj 
updateInputjj )
.jj) *
IsActivejj* 2
;jj2 3
}kk 	
publicmm 
overridemm 
asyncmm 
Taskmm "
Deletemm# )
(mm) *
	EntityDtomm* 3
<mm3 4
intmm4 7
>mm7 8
inputmm9 >
)mm> ?
{nn 	!
CheckDeletePermissionoo !
(oo! "
)oo" #
;oo# $
varqq 
tenantqq 
=qq 
awaitqq 
_tenantManagerqq -
.qq- .
GetByIdAsyncqq. :
(qq: ;
inputqq; @
.qq@ A
IdqqA C
)qqC D
;qqD E
awaitrr 
_tenantManagerrr  
.rr  !
DeleteAsyncrr! ,
(rr, -
tenantrr- 3
)rr3 4
;rr4 5
}ss 	
privateuu 
voiduu 
CheckErrorsuu  
(uu  !
IdentityResultuu! /
identityResultuu0 >
)uu> ?
{vv 	
identityResultww 
.ww 
CheckErrorsww &
(ww& '
LocalizationManagerww' :
)ww: ;
;ww; <
}xx 	
}yy 
}zz Ât
KF:\Code\GitHub\docker\src\AnBook.Application\Net\MimeTypes\MimeTypeNames.cs
	namespace 	
AnBook
 
. 
Net 
. 
	MimeTypes 
{ 
public 

static 
class 
MimeTypeNames %
{ 
public 
const 
string "
ApplicationXJavascript 2
=3 4
$str5 O
;O P
public 
const 
string 
AudioL24 $
=% &
$str' 2
;2 3
public 
const 
string &
ApplicationXShockwaveFlash 6
=7 8
$str9 X
;X Y
public 
const 
string "
ApplicationOctetStream 2
=3 4
$str5 O
;O P
public 
const 
string 
ApplicationAtomXml .
=/ 0
$str1 G
;G H
public 
const 
string 
TextCss #
=$ %
$str& 0
;0 1
public   
const   
string   
TextCmd   #
=  $ %
$str  & 0
;  0 1
public## 
const## 
string## 
TextCsv## #
=##$ %
$str##& 0
;##0 1
public&& 
const&& 
string&& 
ApplicationXDeb&& +
=&&, -
$str&&. A
;&&A B
public)) 
const)) 
string)) 
MultipartEncrypted)) .
=))/ 0
$str))1 F
;))F G
public,, 
const,, 
string,, 
MultipartSigned,, +
=,,, -
$str,,. @
;,,@ A
public// 
const// 
string// 
MessageHttp// '
=//( )
$str//* 8
;//8 9
public22 
const22 
string22 
ModelExample22 (
=22) *
$str22+ :
;22: ;
public55 
const55 
string55 
ApplicationXDvi55 +
=55, -
$str55. A
;55A B
public88 
const88 
string88 
ApplicationXmlDtd88 -
=88. /
$str880 E
;88E F
public;; 
const;; 
string;; !
ApplicationJavascript;; 1
=;;2 3
$str;;4 L
;;;L M
public>> 
const>> 
string>> !
ApplicationEcmascript>> 1
=>>2 3
$str>>4 L
;>>L M
publicAA 
constAA 
stringAA 
ApplicationEdifactAA .
=AA/ 0
$strAA1 F
;AAF G
publicDD 
constDD 
stringDD 
ApplicationEdiX12DD -
=DD. /
$strDD0 E
;DDE F
publicGG 
constGG 
stringGG 
MessagePartialGG *
=GG+ ,
$strGG- >
;GG> ?
publicJJ 
constJJ 
stringJJ 
MessageRfc822JJ )
=JJ* +
$strJJ, <
;JJ< =
publicMM 
constMM 
stringMM 
TextXmlMM #
=MM$ %
$strMM& 0
;MM0 1
publicPP 
constPP 
stringPP 
	VideoXFlvPP %
=PP& '
$strPP( 5
;PP5 6
publicSS 
constSS 
stringSS 
ImageGifSS $
=SS% &
$strSS' 2
;SS2 3
publicVV 
constVV 
stringVV 
TextXGwtRpcVV '
=VV( )
$strVV* :
;VV: ;
publicYY 
constYY 
stringYY 
ApplicationXGzipYY ,
=YY- .
$strYY/ C
;YYC D
public\\ 
const\\ 
string\\ 
TextHtml\\ $
=\\% &
$str\\' 2
;\\2 3
public__ 
const__ 
string__ !
ImageVndMicrosoftIcon__ 1
=__2 3
$str__4 N
;__N O
publicbb 
constbb 
stringbb 
	ModelIgesbb %
=bb& '
$strbb( 4
;bb4 5
publicee 
constee 
stringee 
MessageImdnXmlee *
=ee+ ,
$stree- ?
;ee? @
publichh 
consthh 
stringhh 
ApplicationJsonhh +
=hh, -
$strhh. @
;hh@ A
publickk 
constkk 
stringkk  
ApplicationJsonPatchkk 0
=kk1 2
$strkk3 P
;kkP Q
[nn 	
Obsoletenn	 
]nn 
publicoo 
constoo 
stringoo 
TextJavascriptoo *
=oo+ ,
$stroo- >
;oo> ?
publicrr 
constrr 
stringrr 

ImagePjpegrr &
=rr' (
$strrr) 6
;rr6 7
publicuu 
constuu 
stringuu 
	ImageJpeguu %
=uu& '
$struu( 4
;uu4 5
publicxx 
constxx 
stringxx 
TextXJqueryTmplxx +
=xx, -
$strxx. B
;xxB C
public{{ 
const{{ 
string{{ +
ApplicationVndGoogleEarthKmlXml{{ ;
={{< =
$str{{> d
;{{d e
public~~ 
const~~ 
string~~ 
ApplicationXLatex~~ -
=~~. /
$str~~0 E
;~~E F
public
ÅÅ 
const
ÅÅ 
string
ÅÅ 
VideoXMatroska
ÅÅ *
=
ÅÅ+ ,
$str
ÅÅ- ?
;
ÅÅ? @
public
ÑÑ 
const
ÑÑ 
string
ÑÑ J
<ApplicationVndOpenxmlformatsOfficedocumentSpreadsheetmlSheet
ÑÑ X
=
ÑÑY Z
$strÑÑ[ û
;ÑÑû ü
public
áá 
const
áá 
string
áá #
ApplicationVndMsExcel
áá 1
=
áá2 3
$str
áá4 N
;
ááN O
public
ää 
const
ää 
string
ää R
DApplicationVndOpenxmlformatsOfficedocumentPresentationmlPresentation
ää `
=
ääa b
$strääc Æ
;ääÆ Ø
public
çç 
const
çç 
string
çç (
ApplicationVndMsPowerpoint
çç 6
=
çç7 8
$str
çç9 X
;
ççX Y
public
êê 
const
êê 
string
êê P
BApplicationVndOpenxmlformatsOfficedocumentWordprocessingmlDocument
êê ^
=
êê_ `
$strêêa ™
;êê™ ´
public
ìì 
const
ìì 
string
ìì 
ApplicationMsword
ìì -
=
ìì. /
$str
ìì0 D
;
ììD E
public
ññ 
const
ññ 
string
ññ "
MultipartAlternative
ññ 0
=
ññ1 2
$str
ññ3 J
;
ññJ K
public
ôô 
const
ôô 
string
ôô 
MultipartMixed
ôô *
=
ôô+ ,
$str
ôô- >
;
ôô> ?
public
úú 
const
úú 
string
úú 
MultipartRelated
úú ,
=
úú- .
$str
úú/ B
;
úúB C
public
üü 
const
üü 
string
üü 
MultipartFormData
üü -
=
üü. /
$str
üü0 E
;
üüE F
public
¢¢ 
const
¢¢ 
string
¢¢ )
ApplicationVndMozillaXulXml
¢¢ 7
=
¢¢8 9
$str
¢¢: [
;
¢¢[ \
public
•• 
const
•• 
string
•• 
	AudioMpeg
•• %
=
••& '
$str
••( 4
;
••4 5
public
®® 
const
®® 
string
®® 
AudioMp4
®® $
=
®®% &
$str
®®' 2
;
®®2 3
public
´´ 
const
´´ 
string
´´ 
VideoMp4
´´ $
=
´´% &
$str
´´' 2
;
´´2 3
public
ÆÆ 
const
ÆÆ 
string
ÆÆ 
	VideoMpeg
ÆÆ %
=
ÆÆ& '
$str
ÆÆ( 4
;
ÆÆ4 5
public
±± 
const
±± 
string
±± 
	ModelMesh
±± %
=
±±& '
$str
±±( 4
;
±±4 5
public
¥¥ 
const
¥¥ 
string
¥¥ 

AudioBasic
¥¥ &
=
¥¥' (
$str
¥¥) 6
;
¥¥6 7
public
∑∑ 
const
∑∑ 
string
∑∑ 
VideoOgg
∑∑ $
=
∑∑% &
$str
∑∑' 2
;
∑∑2 3
public
∫∫ 
const
∫∫ 
string
∫∫ 
AudioOgg
∫∫ $
=
∫∫% &
$str
∫∫' 2
;
∫∫2 3
public
ΩΩ 
const
ΩΩ 
string
ΩΩ 
ApplicationOgg
ΩΩ *
=
ΩΩ+ ,
$str
ΩΩ- >
;
ΩΩ> ?
public
¿¿ 
const
¿¿ 
string
¿¿ 
ApplicationXopXml
¿¿ -
=
¿¿. /
$str
¿¿0 E
;
¿¿E F
public
√√ 
const
√√ 
string
√√ 5
'ApplicationVndOasisOpendocumentGraphics
√√ C
=
√√D E
$str
√√F s
;
√√s t
public
∆∆ 
const
∆∆ 
string
∆∆ 9
+ApplicationVndOasisOpendocumentPresentation
∆∆ G
=
∆∆H I
$str
∆∆J {
;
∆∆{ |
public
…… 
const
…… 
string
…… 8
*ApplicationVndOasisOpendocumentSpreadsheet
…… F
=
……G H
$str
……I y
;
……y z
public
ÃÃ 
const
ÃÃ 
string
ÃÃ 1
#ApplicationVndOasisOpendocumentText
ÃÃ ?
=
ÃÃ@ A
$str
ÃÃB k
;
ÃÃk l
public
œœ 
const
œœ 
string
œœ  
ApplicationXPkcs12
œœ .
=
œœ/ 0
$str
œœ1 G
;
œœG H
public
““ 
const
““ 
string
““ +
ApplicationXPkcs7Certificates
““ 9
=
““: ;
$str
““< ^
;
““^ _
public
’’ 
const
’’ 
string
’’ #
ApplicationXPkcs7Mime
’’ 1
=
’’2 3
$str
’’4 N
;
’’N O
public
ÿÿ 
const
ÿÿ 
string
ÿÿ *
ApplicationXPkcs7Certreqresp
ÿÿ 8
=
ÿÿ9 :
$str
ÿÿ; \
;
ÿÿ\ ]
public
€€ 
const
€€ 
string
€€ (
ApplicationXPkcs7Signature
€€ 6
=
€€7 8
$str
€€9 X
;
€€X Y
public
ﬁﬁ 
const
ﬁﬁ 
string
ﬁﬁ 
ApplicationPdf
ﬁﬁ *
=
ﬁﬁ+ ,
$str
ﬁﬁ- >
;
ﬁﬁ> ?
public
·· 
const
·· 
string
·· 
ImagePng
·· $
=
··% &
$str
··' 2
;
··2 3
public
‰‰ 
const
‰‰ 
string
‰‰ #
ApplicationPostscript
‰‰ 1
=
‰‰2 3
$str
‰‰4 L
;
‰‰L M
public
ÁÁ 
const
ÁÁ 
string
ÁÁ 
VideoQuicktime
ÁÁ *
=
ÁÁ+ ,
$str
ÁÁ- >
;
ÁÁ> ?
public
ÍÍ 
const
ÍÍ 
string
ÍÍ '
ApplicationXRarCompressed
ÍÍ 5
=
ÍÍ6 7
$str
ÍÍ8 V
;
ÍÍV W
public
ÌÌ 
const
ÌÌ 
string
ÌÌ !
AudioVndRnRealaudio
ÌÌ /
=
ÌÌ0 1
$str
ÌÌ2 J
;
ÌÌJ K
public
 
const
 
string
 
ApplicationRdfXml
 -
=
. /
$str
0 E
;
E F
public
ÛÛ 
const
ÛÛ 
string
ÛÛ 
ApplicationRssXml
ÛÛ -
=
ÛÛ. /
$str
ÛÛ0 E
;
ÛÛE F
public
ˆˆ 
const
ˆˆ 
string
ˆˆ  
ApplicationSoapXml
ˆˆ .
=
ˆˆ/ 0
$str
ˆˆ1 G
;
ˆˆG H
public
˘˘ 
const
˘˘ 
string
˘˘ !
ApplicationXStuffit
˘˘ /
=
˘˘0 1
$str
˘˘2 I
;
˘˘I J
public
¸¸ 
const
¸¸ 
string
¸¸ 
ImageSvgXml
¸¸ '
=
¸¸( )
$str
¸¸* 9
;
¸¸9 :
public
ˇˇ 
const
ˇˇ 
string
ˇˇ 
	ImageTiff
ˇˇ %
=
ˇˇ& '
$str
ˇˇ( 4
;
ˇˇ4 5
public
ÇÇ 
const
ÇÇ 
string
ÇÇ 
ApplicationXTar
ÇÇ +
=
ÇÇ, -
$str
ÇÇ. A
;
ÇÇA B
public
ÖÖ 
const
ÖÖ 
string
ÖÖ 
	TextPlain
ÖÖ %
=
ÖÖ& '
$str
ÖÖ( 4
;
ÖÖ4 5
public
àà 
const
àà 
string
àà !
ApplicationXFontTtf
àà /
=
àà0 1
$str
àà2 J
;
ààJ K
public
ãã 
const
ãã 
string
ãã 
	TextVcard
ãã %
=
ãã& '
$str
ãã( 4
;
ãã4 5
public
éé 
const
éé 
string
éé 
AudioVorbis
éé '
=
éé( )
$str
éé* 8
;
éé8 9
public
ëë 
const
ëë 
string
ëë 
AudioVndWave
ëë (
=
ëë) *
$str
ëë+ ;
;
ëë; <
public
îî 
const
îî 
string
îî !
ApplicationFontWoff
îî /
=
îî0 1
$str
îî2 I
;
îîI J
public
óó 
const
óó 
string
óó 
	VideoWebm
óó %
=
óó& '
$str
óó( 4
;
óó4 5
public
öö 
const
öö 
string
öö 
	AudioWebm
öö %
=
öö& '
$str
öö( 4
;
öö4 5
public
ùù 
const
ùù 
string
ùù 
AudioXMsWax
ùù '
=
ùù( )
$str
ùù* :
;
ùù: ;
public
†† 
const
†† 
string
†† 
AudioXMsWma
†† '
=
††( )
$str
††* :
;
††: ;
public
££ 
const
££ 
string
££ 
VideoXMsWmv
££ '
=
££( )
$str
££* :
;
££: ;
public
¶¶ 
const
¶¶ 
string
¶¶ 
	ModelVrml
¶¶ %
=
¶¶& '
$str
¶¶( 4
;
¶¶4 5
public
©© 
const
©© 
string
©© 
ModelX3DXml
©© '
=
©©( )
$str
©©* 9
;
©©9 :
public
¨¨ 
const
¨¨ 
string
¨¨ 
ModelX3DBinary
¨¨ *
=
¨¨+ ,
$str
¨¨- ?
;
¨¨? @
public
ØØ 
const
ØØ 
string
ØØ 
ModelX3DVrml
ØØ (
=
ØØ) *
$str
ØØ+ ;
;
ØØ; <
public
≤≤ 
const
≤≤ 
string
≤≤ !
ApplicationXhtmlXml
≤≤ /
=
≤≤0 1
$str
≤≤2 I
;
≤≤I J
public
µµ 
const
µµ 
string
µµ 
ApplicationZip
µµ *
=
µµ+ ,
$str
µµ- >
;
µµ> ?
}
∂∂ 
}∑∑ ñ
GF:\Code\GitHub\docker\src\AnBook.Application\Properties\AssemblyInfo.cs
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
$str		 /
)		/ 0
]		0 1
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
]7 8∆
GF:\Code\GitHub\docker\src\AnBook.Application\Roles\Dto\CreateRoleDto.cs
	namespace 	
AnBook
 
. 
Roles 
. 
Dto 
{ 
[		 
	AutoMapTo		 
(		 
typeof		 
(		 
Role		 
)		 
)		 
]		 
public

 

class

 
CreateRoleDto

 
{ 
[ 	
Required	 
] 
[ 	
StringLength	 
( 
AbpRoleBase !
.! "
MaxNameLength" /
)/ 0
]0 1
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
[ 	
Required	 
] 
[ 	
StringLength	 
( 
AbpRoleBase !
.! " 
MaxDisplayNameLength" 6
)6 7
]7 8
public 
string 
DisplayName !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
NormalizedName $
{% &
get' *
;* +
set, /
;/ 0
}1 2
[ 	
StringLength	 
( 
Role 
.  
MaxDescriptionLength /
)/ 0
]0 1
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
List 
< 
string 
> 
Permissions '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
} 
} å
KF:\Code\GitHub\docker\src\AnBook.Application\Roles\Dto\FlatPermissionDto.cs
	namespace 	
AnBook
 
. 
Roles 
. 
Dto 
{ 
public 

class 
FlatPermissionDto "
{ 
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
DisplayName !
{" #
get$ '
;' (
set) ,
;, -
}. /
public		 
string		 
Description		 !
{		" #
get		$ '
;		' (
set		) ,
;		, -
}		. /
}

 
} ç
NF:\Code\GitHub\docker\src\AnBook.Application\Roles\Dto\GetRoleForEditOutput.cs
	namespace 	
AnBook
 
. 
Roles 
. 
Dto 
{ 
public 

class  
GetRoleForEditOutput %
{ 
public 
RoleEditDto 
Role 
{  !
get" %
;% &
set' *
;* +
}, -
public		 
List		 
<		 
FlatPermissionDto		 %
>		% &
Permissions		' 2
{		3 4
get		5 8
;		8 9
set		: =
;		= >
}		? @
public 
List 
< 
string 
> "
GrantedPermissionNames 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
} 
} Ã
GF:\Code\GitHub\docker\src\AnBook.Application\Roles\Dto\GetRolesInput.cs
	namespace 	
AnBook
 
. 
Roles 
. 
Dto 
{ 
public 

class 
GetRolesInput 
{ 
public 
string 

Permission  
{! "
get# &
;& '
set( +
;+ ,
}- .
} 
} ì
SF:\Code\GitHub\docker\src\AnBook.Application\Roles\Dto\PagedRoleResultRequestDto.cs
	namespace 	
AnBook
 
. 
Roles 
. 
Dto 
{ 
public 

class %
PagedRoleResultRequestDto *
:+ ,!
PagedResultRequestDto- B
{ 
public 
string 
Keyword 
{ 
get  #
;# $
set% (
;( )
}* +
} 
}		 ˘
GF:\Code\GitHub\docker\src\AnBook.Application\Roles\Dto\PermissionDto.cs
	namespace 	
AnBook
 
. 
Roles 
. 
Dto 
{ 
[ 
AutoMapFrom 
( 
typeof 
( 

Permission "
)" #
)# $
]$ %
public 

class 
PermissionDto 
:  
	EntityDto! *
<* +
long+ /
>/ 0
{		 
public

 
string

 
Name

 
{

 
get

  
;

  !
set

" %
;

% &
}

' (
public 
string 
DisplayName !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} ç
AF:\Code\GitHub\docker\src\AnBook.Application\Roles\Dto\RoleDto.cs
	namespace 	
AnBook
 
. 
Roles 
. 
Dto 
{		 
[

 
AutoMap

 
(

 
typeof

 
(

 
Role

 
)

 
)

 
]

 
public 

class 
RoleDto 
: 
	EntityDto $
<$ %
int% (
>( )
{ 
[ 	
Required	 
] 
[ 	
StringLength	 
( 
AbpRoleBase !
.! "
MaxNameLength" /
)/ 0
]0 1
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
[ 	
Required	 
] 
[ 	
StringLength	 
( 
AbpRoleBase !
.! " 
MaxDisplayNameLength" 6
)6 7
]7 8
public 
string 
DisplayName !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
NormalizedName $
{% &
get' *
;* +
set, /
;/ 0
}1 2
[ 	
StringLength	 
( 
Role 
.  
MaxDescriptionLength /
)/ 0
]0 1
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
List 
< 
string 
> 
Permissions '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
} 
} ©
EF:\Code\GitHub\docker\src\AnBook.Application\Roles\Dto\RoleEditDto.cs
	namespace 	
AnBook
 
. 
Roles 
. 
Dto 
{ 
public 

class 
RoleEditDto 
: 
	EntityDto '
<' (
int( +
>+ ,
{		 
[

 	
Required

	 
]

 
[ 	
StringLength	 
( 
AbpRoleBase !
.! "
MaxNameLength" /
)/ 0
]0 1
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
[ 	
Required	 
] 
[ 	
StringLength	 
( 
AbpRoleBase !
.! " 
MaxDisplayNameLength" 6
)6 7
]7 8
public 
string 
DisplayName !
{" #
get$ '
;' (
set) ,
;, -
}. /
[ 	
StringLength	 
( 
Role 
.  
MaxDescriptionLength /
)/ 0
]0 1
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
bool 
IsStatic 
{ 
get "
;" #
set$ '
;' (
}) *
} 
} ã	
EF:\Code\GitHub\docker\src\AnBook.Application\Roles\Dto\RoleListDto.cs
	namespace 	
AnBook
 
. 
Roles 
. 
Dto 
{ 
public 

class 
RoleListDto 
: 
	EntityDto (
,( )
IHasCreationTime* :
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
string 
DisplayName !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
bool 
IsStatic 
{ 
get "
;" #
set$ '
;' (
}) *
public 
bool 
	IsDefault 
{ 
get  #
;# $
set% (
;( )
}* +
public 
DateTime 
CreationTime $
{% &
get' *
;* +
set, /
;/ 0
}1 2
} 
} ü
HF:\Code\GitHub\docker\src\AnBook.Application\Roles\Dto\RoleMapProfile.cs
	namespace 	
AnBook
 
. 
Roles 
. 
Dto 
{ 
public 

class 
RoleMapProfile 
:  !
Profile" )
{		 
public

 
RoleMapProfile

 
(

 
)

 
{ 	
	CreateMap 
< 

Permission  
,  !
string" (
>( )
() *
)* +
.+ ,
ConvertUsing, 8
(8 9
r9 :
=>; =
r> ?
.? @
Name@ D
)D E
;E F
	CreateMap 
< !
RolePermissionSetting +
,+ ,
string- 3
>3 4
(4 5
)5 6
.6 7
ConvertUsing7 C
(C D
rD E
=>F H
rI J
.J K
NameK O
)O P
;P Q
	CreateMap 
< 
CreateRoleDto #
,# $
Role% )
>) *
(* +
)+ ,
., -
	ForMember- 6
(6 7
x7 8
=>9 ;
x< =
.= >
Permissions> I
,I J
optK N
=>O Q
optR U
.U V
IgnoreV \
(\ ]
)] ^
)^ _
;_ `
	CreateMap 
< 
RoleDto 
, 
Role #
># $
($ %
)% &
.& '
	ForMember' 0
(0 1
x1 2
=>3 5
x6 7
.7 8
Permissions8 C
,C D
optE H
=>I K
optL O
.O P
IgnoreP V
(V W
)W X
)X Y
;Y Z
} 	
} 
} ß	
EF:\Code\GitHub\docker\src\AnBook.Application\Roles\IRoleAppService.cs
	namespace 	
AnBook
 
. 
Roles 
{ 
public 

	interface 
IRoleAppService $
:% & 
IAsyncCrudAppService' ;
<; <
RoleDto< C
,C D
intE H
,H I%
PagedRoleResultRequestDtoJ c
,c d
CreateRoleDtoe r
,r s
RoleDtot {
>{ |
{		 
Task

 
<

 
ListResultDto

 
<

 
PermissionDto

 (
>

( )
>

) *
GetAllPermissions

+ <
(

< =
)

= >
;

> ?
Task 
<  
GetRoleForEditOutput !
>! "
GetRoleForEdit# 1
(1 2
	EntityDto2 ;
input< A
)A B
;B C
Task 
< 
ListResultDto 
< 
RoleListDto &
>& '
>' (
GetRolesAsync) 6
(6 7
GetRolesInput7 D
inputE J
)J K
;K L
} 
} ·o
DF:\Code\GitHub\docker\src\AnBook.Application\Roles\RoleAppService.cs
	namespace 	
AnBook
 
. 
Roles 
{ 
[ 
AbpAuthorize 
( 
PermissionNames !
.! "
Pages_Roles" -
)- .
]. /
public 

class 
RoleAppService 
:  !
AsyncCrudAppService" 5
<5 6
Role6 :
,: ;
RoleDto< C
,C D
intE H
,H I%
PagedRoleResultRequestDtoJ c
,c d
CreateRoleDtoe r
,r s
RoleDtot {
>{ |
,| }
IRoleAppService	~ ç
{ 
private 
readonly 
RoleManager $
_roleManager% 1
;1 2
private 
readonly 
UserManager $
_userManager% 1
;1 2
public 
RoleAppService 
( 
IRepository )
<) *
Role* .
>. /

repository0 :
,: ;
RoleManager< G
roleManagerH S
,S T
UserManagerU `
userManagera l
)l m
: 
base 
( 

repository 
) 
{ 	
_roleManager 
= 
roleManager &
;& '
_userManager 
= 
userManager &
;& '
} 	
public!! 
override!! 
async!! 
Task!! "
<!!" #
RoleDto!!# *
>!!* +
Create!!, 2
(!!2 3
CreateRoleDto!!3 @
input!!A F
)!!F G
{"" 	!
CheckCreatePermission## !
(##! "
)##" #
;### $
var%% 
role%% 
=%% 
ObjectMapper%% #
.%%# $
Map%%$ '
<%%' (
Role%%( ,
>%%, -
(%%- .
input%%. 3
)%%3 4
;%%4 5
role&& 
.&& 
SetNormalizedName&& "
(&&" #
)&&# $
;&&$ %
CheckErrors(( 
((( 
await(( 
_roleManager(( *
.((* +
CreateAsync((+ 6
(((6 7
role((7 ;
)((; <
)((< =
;((= >
var** 
grantedPermissions** "
=**# $
PermissionManager**% 6
.++ 
GetAllPermissions++ "
(++" #
)++# $
.,, 
Where,, 
(,, 
p,, 
=>,, 
input,, !
.,,! "
Permissions,," -
.,,- .
Contains,,. 6
(,,6 7
p,,7 8
.,,8 9
Name,,9 =
),,= >
),,> ?
.-- 
ToList-- 
(-- 
)-- 
;-- 
await// 
_roleManager// 
.// &
SetGrantedPermissionsAsync// 9
(//9 :
role//: >
,//> ?
grantedPermissions//@ R
)//R S
;//S T
return11 
MapToEntityDto11 !
(11! "
role11" &
)11& '
;11' (
}22 	
public44 
async44 
Task44 
<44 
ListResultDto44 '
<44' (
RoleListDto44( 3
>443 4
>444 5
GetRolesAsync446 C
(44C D
GetRolesInput44D Q
input44R W
)44W X
{55 	
var66 
roles66 
=66 
await66 
_roleManager66 *
.77 
Roles77 
.88 
WhereIf88 
(88 
!99 
input99 
.99 

Permission99 %
.99% &
IsNullOrWhiteSpace99& 8
(998 9
)999 :
,99: ;
r:: 
=>:: 
r:: 
.:: 
Permissions:: &
.::& '
Any::' *
(::* +
rp::+ -
=>::. 0
rp::1 3
.::3 4
Name::4 8
==::9 ;
input::< A
.::A B

Permission::B L
&&::M O
rp::P R
.::R S
	IsGranted::S \
)::\ ]
);; 
.<< 
ToListAsync<< 
(<< 
)<< 
;<< 
return>> 
new>> 
ListResultDto>> $
<>>$ %
RoleListDto>>% 0
>>>0 1
(>>1 2
ObjectMapper>>2 >
.>>> ?
Map>>? B
<>>B C
List>>C G
<>>G H
RoleListDto>>H S
>>>S T
>>>T U
(>>U V
roles>>V [
)>>[ \
)>>\ ]
;>>] ^
}?? 	
publicAA 
overrideAA 
asyncAA 
TaskAA "
<AA" #
RoleDtoAA# *
>AA* +
UpdateAA, 2
(AA2 3
RoleDtoAA3 :
inputAA; @
)AA@ A
{BB 	!
CheckUpdatePermissionCC !
(CC! "
)CC" #
;CC# $
varEE 
roleEE 
=EE 
awaitEE 
_roleManagerEE )
.EE) *
GetRoleByIdAsyncEE* :
(EE: ;
inputEE; @
.EE@ A
IdEEA C
)EEC D
;EED E
ObjectMapperGG 
.GG 
MapGG 
(GG 
inputGG "
,GG" #
roleGG$ (
)GG( )
;GG) *
CheckErrorsII 
(II 
awaitII 
_roleManagerII *
.II* +
UpdateAsyncII+ 6
(II6 7
roleII7 ;
)II; <
)II< =
;II= >
varKK 
grantedPermissionsKK "
=KK# $
PermissionManagerKK% 6
.LL 
GetAllPermissionsLL "
(LL" #
)LL# $
.MM 
WhereMM 
(MM 
pMM 
=>MM 
inputMM !
.MM! "
PermissionsMM" -
.MM- .
ContainsMM. 6
(MM6 7
pMM7 8
.MM8 9
NameMM9 =
)MM= >
)MM> ?
.NN 
ToListNN 
(NN 
)NN 
;NN 
awaitPP 
_roleManagerPP 
.PP &
SetGrantedPermissionsAsyncPP 9
(PP9 :
rolePP: >
,PP> ?
grantedPermissionsPP@ R
)PPR S
;PPS T
returnRR 
MapToEntityDtoRR !
(RR! "
roleRR" &
)RR& '
;RR' (
}SS 	
publicUU 
overrideUU 
asyncUU 
TaskUU "
DeleteUU# )
(UU) *
	EntityDtoUU* 3
<UU3 4
intUU4 7
>UU7 8
inputUU9 >
)UU> ?
{VV 	!
CheckDeletePermissionWW !
(WW! "
)WW" #
;WW# $
varYY 
roleYY 
=YY 
awaitYY 
_roleManagerYY )
.YY) *
FindByIdAsyncYY* 7
(YY7 8
inputYY8 =
.YY= >
IdYY> @
.YY@ A
ToStringYYA I
(YYI J
)YYJ K
)YYK L
;YYL M
varZZ 
usersZZ 
=ZZ 
awaitZZ 
_userManagerZZ *
.ZZ* +
GetUsersInRoleAsyncZZ+ >
(ZZ> ?
roleZZ? C
.ZZC D
NormalizedNameZZD R
)ZZR S
;ZZS T
foreach\\ 
(\\ 
var\\ 
user\\ 
in\\  
users\\! &
)\\& '
{]] 
CheckErrors^^ 
(^^ 
await^^ !
_userManager^^" .
.^^. /
RemoveFromRoleAsync^^/ B
(^^B C
user^^C G
,^^G H
role^^I M
.^^M N
NormalizedName^^N \
)^^\ ]
)^^] ^
;^^^ _
}__ 
CheckErrorsaa 
(aa 
awaitaa 
_roleManageraa *
.aa* +
DeleteAsyncaa+ 6
(aa6 7
roleaa7 ;
)aa; <
)aa< =
;aa= >
}bb 	
publicdd 
Taskdd 
<dd 
ListResultDtodd !
<dd! "
PermissionDtodd" /
>dd/ 0
>dd0 1
GetAllPermissionsdd2 C
(ddC D
)ddD E
{ee 	
varff 
permissionsff 
=ff 
PermissionManagerff /
.ff/ 0
GetAllPermissionsff0 A
(ffA B
)ffB C
;ffC D
returnhh 
Taskhh 
.hh 

FromResulthh "
(hh" #
newhh# &
ListResultDtohh' 4
<hh4 5
PermissionDtohh5 B
>hhB C
(hhC D
ObjectMapperii 
.ii 
Mapii  
<ii  !
Listii! %
<ii% &
PermissionDtoii& 3
>ii3 4
>ii4 5
(ii5 6
permissionsii6 A
)iiA B
)jj 
)jj 
;jj 
}kk 	
	protectedmm 
overridemm 

IQueryablemm %
<mm% &
Rolemm& *
>mm* +
CreateFilteredQuerymm, ?
(mm? @%
PagedRoleResultRequestDtomm@ Y
inputmmZ _
)mm_ `
{nn 	
returnoo 

Repositoryoo 
.oo 
GetAllIncludingoo -
(oo- .
xoo. /
=>oo0 2
xoo3 4
.oo4 5
Permissionsoo5 @
)oo@ A
.pp 
WhereIfpp 
(pp 
!pp 
inputpp 
.pp  
Keywordpp  '
.pp' (
IsNullOrWhiteSpacepp( :
(pp: ;
)pp; <
,pp< =
xpp> ?
=>pp@ B
xppC D
.ppD E
NameppE I
.ppI J
ContainsppJ R
(ppR S
inputppS X
.ppX Y
KeywordppY `
)pp` a
||qq 
xqq 
.qq 
DisplayNameqq  
.qq  !
Containsqq! )
(qq) *
inputqq* /
.qq/ 0
Keywordqq0 7
)qq7 8
||rr 
xrr 
.rr 
Descriptionrr  
.rr  !
Containsrr! )
(rr) *
inputrr* /
.rr/ 0
Keywordrr0 7
)rr7 8
)rr8 9
;rr9 :
}ss 	
	protecteduu 
overrideuu 
asyncuu  
Taskuu! %
<uu% &
Roleuu& *
>uu* +
GetEntityByIdAsyncuu, >
(uu> ?
intuu? B
iduuC E
)uuE F
{vv 	
returnww 
awaitww 

Repositoryww #
.ww# $
GetAllIncludingww$ 3
(ww3 4
xww4 5
=>ww6 8
xww9 :
.ww: ;
Permissionsww; F
)wwF G
.wwG H
FirstOrDefaultAsyncwwH [
(ww[ \
xww\ ]
=>ww^ `
xwwa b
.wwb c
Idwwc e
==wwf h
idwwi k
)wwk l
;wwl m
}xx 	
	protectedzz 
overridezz 

IQueryablezz %
<zz% &
Rolezz& *
>zz* +
ApplySortingzz, 8
(zz8 9

IQueryablezz9 C
<zzC D
RolezzD H
>zzH I
queryzzJ O
,zzO P%
PagedRoleResultRequestDtozzQ j
inputzzk p
)zzp q
{{{ 	
return|| 
query|| 
.|| 
OrderBy||  
(||  !
r||! "
=>||# %
r||& '
.||' (
DisplayName||( 3
)||3 4
;||4 5
}}} 	
	protected 
virtual 
void 
CheckErrors *
(* +
IdentityResult+ 9
identityResult: H
)H I
{
ÄÄ 	
identityResult
ÅÅ 
.
ÅÅ 
CheckErrors
ÅÅ &
(
ÅÅ& '!
LocalizationManager
ÅÅ' :
)
ÅÅ: ;
;
ÅÅ; <
}
ÇÇ 	
public
ÑÑ 
async
ÑÑ 
Task
ÑÑ 
<
ÑÑ "
GetRoleForEditOutput
ÑÑ .
>
ÑÑ. /
GetRoleForEdit
ÑÑ0 >
(
ÑÑ> ?
	EntityDto
ÑÑ? H
input
ÑÑI N
)
ÑÑN O
{
ÖÖ 	
var
ÜÜ 
permissions
ÜÜ 
=
ÜÜ 
PermissionManager
ÜÜ /
.
ÜÜ/ 0
GetAllPermissions
ÜÜ0 A
(
ÜÜA B
)
ÜÜB C
;
ÜÜC D
var
áá 
role
áá 
=
áá 
await
áá 
_roleManager
áá )
.
áá) *
GetRoleByIdAsync
áá* :
(
áá: ;
input
áá; @
.
áá@ A
Id
ááA C
)
ááC D
;
ááD E
var
àà  
grantedPermissions
àà "
=
àà# $
(
àà% &
await
àà& +
_roleManager
àà, 8
.
àà8 9(
GetGrantedPermissionsAsync
àà9 S
(
ààS T
role
ààT X
)
ààX Y
)
ààY Z
.
ààZ [
ToArray
àà[ b
(
ààb c
)
ààc d
;
ààd e
var
ââ 
roleEditDto
ââ 
=
ââ 
ObjectMapper
ââ *
.
ââ* +
Map
ââ+ .
<
ââ. /
RoleEditDto
ââ/ :
>
ââ: ;
(
ââ; <
role
ââ< @
)
ââ@ A
;
ââA B
return
ãã 
new
ãã "
GetRoleForEditOutput
ãã +
{
åå 
Role
çç 
=
çç 
roleEditDto
çç "
,
çç" #
Permissions
éé 
=
éé 
ObjectMapper
éé *
.
éé* +
Map
éé+ .
<
éé. /
List
éé/ 3
<
éé3 4
FlatPermissionDto
éé4 E
>
ééE F
>
ééF G
(
ééG H
permissions
ééH S
)
ééS T
.
ééT U
OrderBy
ééU \
(
éé\ ]
p
éé] ^
=>
éé_ a
p
ééb c
.
ééc d
DisplayName
ééd o
)
ééo p
.
éép q
ToList
ééq w
(
ééw x
)
ééx y
,
ééy z$
GrantedPermissionNames
èè &
=
èè' ( 
grantedPermissions
èè) ;
.
èè; <
Select
èè< B
(
èèB C
p
èèC D
=>
èèE G
p
èèH I
.
èèI J
Name
èèJ N
)
èèN O
.
èèO P
ToList
èèP V
(
èèV W
)
èèW X
}
êê 
;
êê 
}
ëë 	
}
íí 
}ìì Ì
OF:\Code\GitHub\docker\src\AnBook.Application\Sessions\Dto\ApplicationInfoDto.cs
	namespace 	
AnBook
 
. 
Sessions 
. 
Dto 
{ 
public 

class 
ApplicationInfoDto #
{ 
public 
string 
Version 
{ 
get  #
;# $
set% (
;( )
}* +
public

 
DateTime

 
ReleaseDate

 #
{

$ %
get

& )
;

) *
set

+ .
;

. /
}

0 1
public 

Dictionary 
< 
string  
,  !
bool" &
>& '
Features( 0
{1 2
get3 6
;6 7
set8 ;
;; <
}= >
} 
} œ
^F:\Code\GitHub\docker\src\AnBook.Application\Sessions\Dto\GetCurrentLoginInformationsOutput.cs
	namespace 	
AnBook
 
. 
Sessions 
. 
Dto 
{ 
public 

class -
!GetCurrentLoginInformationsOutput 2
{ 
public 
ApplicationInfoDto !
Application" -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
public 
UserLoginInfoDto 
User  $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public		 
TenantLoginInfoDto		 !
Tenant		" (
{		) *
get		+ .
;		. /
set		0 3
;		3 4
}		5 6
}

 
} ∂
OF:\Code\GitHub\docker\src\AnBook.Application\Sessions\Dto\TenantLoginInfoDto.cs
	namespace 	
AnBook
 
. 
Sessions 
. 
Dto 
{ 
[ 
AutoMapFrom 
( 
typeof 
( 
Tenant 
) 
)  
]  !
public 

class 
TenantLoginInfoDto #
:$ %
	EntityDto& /
{		 
public

 
string

 
TenancyName

 !
{

" #
get

$ '
;

' (
set

) ,
;

, -
}

. /
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
} 
} ò	
MF:\Code\GitHub\docker\src\AnBook.Application\Sessions\Dto\UserLoginInfoDto.cs
	namespace 	
AnBook
 
. 
Sessions 
. 
Dto 
{ 
[ 
AutoMapFrom 
( 
typeof 
( 
User 
) 
) 
] 
public 

class 
UserLoginInfoDto !
:" #
	EntityDto$ -
<- .
long. 2
>2 3
{		 
public

 
string

 
Name

 
{

 
get

  
;

  !
set

" %
;

% &
}

' (
public 
string 
Surname 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
UserName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
EmailAddress "
{# $
get% (
;( )
set* -
;- .
}/ 0
} 
} É
KF:\Code\GitHub\docker\src\AnBook.Application\Sessions\ISessionAppService.cs
	namespace 	
AnBook
 
. 
Sessions 
{ 
public 

	interface 
ISessionAppService '
:( )
IApplicationService* =
{ 
Task		 
<		 -
!GetCurrentLoginInformationsOutput		 .
>		. /'
GetCurrentLoginInformations		0 K
(		K L
)		L M
;		M N
}

 
} 
JF:\Code\GitHub\docker\src\AnBook.Application\Sessions\SessionAppService.cs
	namespace 	
AnBook
 
. 
Sessions 
{ 
public 

class 
SessionAppService "
:# $ 
AnBookAppServiceBase% 9
,9 :
ISessionAppService; M
{		 
[

 	
DisableAuditing

	 
]

 
public 
async 
Task 
< -
!GetCurrentLoginInformationsOutput ;
>; <'
GetCurrentLoginInformations= X
(X Y
)Y Z
{ 	
var 
output 
= 
new -
!GetCurrentLoginInformationsOutput >
{ 
Application 
= 
new !
ApplicationInfoDto" 4
{ 
Version 
= 
AppVersionHelper .
.. /
Version/ 6
,6 7
ReleaseDate 
=  !
AppVersionHelper" 2
.2 3
ReleaseDate3 >
,> ?
Features 
= 
new "

Dictionary# -
<- .
string. 4
,4 5
bool6 :
>: ;
(; <
)< =
} 
} 
; 
if 
( 

AbpSession 
. 
TenantId #
.# $
HasValue$ ,
), -
{ 
output 
. 
Tenant 
= 
ObjectMapper  ,
., -
Map- 0
<0 1
TenantLoginInfoDto1 C
>C D
(D E
awaitE J!
GetCurrentTenantAsyncK `
(` a
)a b
)b c
;c d
} 
if 
( 

AbpSession 
. 
UserId !
.! "
HasValue" *
)* +
{ 
output 
. 
User 
= 
ObjectMapper *
.* +
Map+ .
<. /
UserLoginInfoDto/ ?
>? @
(@ A
awaitA F
GetCurrentUserAsyncG Z
(Z [
)[ \
)\ ]
;] ^
} 
return!! 
output!! 
;!! 
}"" 	
}## 
}$$ ‡
KF:\Code\GitHub\docker\src\AnBook.Application\Users\Dto\ChangePasswordDto.cs
	namespace 	
AnBook
 
. 
Users 
. 
Dto 
{ 
public 

class 
ChangePasswordDto "
{ 
[ 	
Required	 
] 
public 
string 
CurrentPassword %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
[

 	
Required

	 
]

 
public 
string 
NewPassword !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} í
OF:\Code\GitHub\docker\src\AnBook.Application\Users\Dto\ChangeUserLanguageDto.cs
	namespace 	
AnBook
 
. 
Users 
. 
Dto 
{ 
public 

class !
ChangeUserLanguageDto &
{ 
[ 	
Required	 
] 
public 
string 
LanguageName "
{# $
get% (
;( )
set* -
;- .
}/ 0
}		 
}

 Ê
GF:\Code\GitHub\docker\src\AnBook.Application\Users\Dto\CreateUserDto.cs
	namespace 	
AnBook
 
. 
Users 
. 
Dto 
{		 
[

 
	AutoMapTo
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
 
User

 
)

 
)

 
]

 
public 

class 
CreateUserDto 
:  
IShouldNormalize! 1
{ 
[ 	
Required	 
] 
[ 	
StringLength	 
( 
AbpUserBase !
.! "
MaxUserNameLength" 3
)3 4
]4 5
public 
string 
UserName 
{  
get! $
;$ %
set& )
;) *
}+ ,
[ 	
Required	 
] 
[ 	
StringLength	 
( 
AbpUserBase !
.! "
MaxNameLength" /
)/ 0
]0 1
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
[ 	
Required	 
] 
[ 	
StringLength	 
( 
AbpUserBase !
.! "
MaxSurnameLength" 2
)2 3
]3 4
public 
string 
Surname 
{ 
get  #
;# $
set% (
;( )
}* +
[ 	
Required	 
] 
[ 	
EmailAddress	 
] 
[ 	
StringLength	 
( 
AbpUserBase !
.! "!
MaxEmailAddressLength" 7
)7 8
]8 9
public 
string 
EmailAddress "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
bool 
IsActive 
{ 
get "
;" #
set$ '
;' (
}) *
public   
string   
[   
]   
	RoleNames   !
{  " #
get  $ '
;  ' (
set  ) ,
;  , -
}  . /
["" 	
Required""	 
]"" 
[## 	
StringLength##	 
(## 
AbpUserBase## !
.##! ""
MaxPlainPasswordLength##" 8
)##8 9
]##9 :
[$$ 	
DisableAuditing$$	 
]$$ 
public%% 
string%% 
Password%% 
{%%  
get%%! $
;%%$ %
set%%& )
;%%) *
}%%+ ,
public'' 
void'' 
	Normalize'' 
('' 
)'' 
{(( 	
if)) 
()) 
	RoleNames)) 
==)) 
null)) !
)))! "
{** 
	RoleNames++ 
=++ 
new++ 
string++  &
[++& '
$num++' (
]++( )
;++) *
},, 
}-- 	
}.. 
}// º
SF:\Code\GitHub\docker\src\AnBook.Application\Users\Dto\PagedUserResultRequestDto.cs
	namespace 	
AnBook
 
. 
Users 
. 
Dto 
{ 
public 

class %
PagedUserResultRequestDto *
:+ ,!
PagedResultRequestDto- B
{ 
public		 
string		 
Keyword		 
{		 
get		  #
;		# $
set		% (
;		( )
}		* +
public

 
bool

 
?

 
IsActive

 
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
* +
} 
} ®
JF:\Code\GitHub\docker\src\AnBook.Application\Users\Dto\ResetPasswordDto.cs
	namespace 	
AnBook
 
. 
Users 
. 
Dto 
{ 
public 

class 
ResetPasswordDto !
{ 
[ 	
Required	 
] 
public 
string 
AdminPassword #
{$ %
get& )
;) *
set+ .
;. /
}0 1
[

 	
Required

	 
]

 
public 
long 
UserId 
{ 
get  
;  !
set" %
;% &
}' (
[ 	
Required	 
] 
public 
string 
NewPassword !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} ¿
AF:\Code\GitHub\docker\src\AnBook.Application\Users\Dto\UserDto.cs
	namespace 	
AnBook
 
. 
Users 
. 
Dto 
{		 
[

 
AutoMapFrom

 
(

 
typeof

 
(

 
User

 
)

 
)

 
]

 
public 

class 
UserDto 
: 
	EntityDto $
<$ %
long% )
>) *
{ 
[ 	
Required	 
] 
[ 	
StringLength	 
( 
AbpUserBase !
.! "
MaxUserNameLength" 3
)3 4
]4 5
public 
string 
UserName 
{  
get! $
;$ %
set& )
;) *
}+ ,
[ 	
Required	 
] 
[ 	
StringLength	 
( 
AbpUserBase !
.! "
MaxNameLength" /
)/ 0
]0 1
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
[ 	
Required	 
] 
[ 	
StringLength	 
( 
AbpUserBase !
.! "
MaxSurnameLength" 2
)2 3
]3 4
public 
string 
Surname 
{ 
get  #
;# $
set% (
;( )
}* +
[ 	
Required	 
] 
[ 	
EmailAddress	 
] 
[ 	
StringLength	 
( 
AbpUserBase !
.! "!
MaxEmailAddressLength" 7
)7 8
]8 9
public 
string 
EmailAddress "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
bool 
IsActive 
{ 
get "
;" #
set$ '
;' (
}) *
public   
string   
FullName   
{    
get  ! $
;  $ %
set  & )
;  ) *
}  + ,
public"" 
DateTime"" 
?"" 
LastLoginTime"" &
{""' (
get"") ,
;"", -
set"". 1
;""1 2
}""3 4
public$$ 
DateTime$$ 
CreationTime$$ $
{$$% &
get$$' *
;$$* +
set$$, /
;$$/ 0
}$$1 2
public&& 
string&& 
[&& 
]&& 
	RoleNames&& !
{&&" #
get&&$ '
;&&' (
set&&) ,
;&&, -
}&&. /
}'' 
}(( ı
HF:\Code\GitHub\docker\src\AnBook.Application\Users\Dto\UserMapProfile.cs
	namespace 	
AnBook
 
. 
Users 
. 
Dto 
{ 
public 

class 
UserMapProfile 
:  !
Profile" )
{ 
public 
UserMapProfile 
( 
) 
{		 	
	CreateMap

 
<

 
UserDto

 
,

 
User

 #
>

# $
(

$ %
)

% &
;

& '
	CreateMap 
< 
UserDto 
, 
User #
># $
($ %
)% &
. 
	ForMember 
( 
x 
=> 
x  !
.! "
Roles" '
,' (
opt) ,
=>- /
opt0 3
.3 4
Ignore4 :
(: ;
); <
)< =
. 
	ForMember 
( 
x 
=> 
x  !
.! "
CreationTime" .
,. /
opt0 3
=>4 6
opt7 :
.: ;
Ignore; A
(A B
)B C
)C D
;D E
	CreateMap 
< 
CreateUserDto #
,# $
User% )
>) *
(* +
)+ ,
;, -
	CreateMap 
< 
CreateUserDto #
,# $
User% )
>) *
(* +
)+ ,
., -
	ForMember- 6
(6 7
x7 8
=>9 ;
x< =
.= >
Roles> C
,C D
optE H
=>I K
optL O
.O P
IgnoreP V
(V W
)W X
)X Y
;Y Z
} 	
} 
} Ì
EF:\Code\GitHub\docker\src\AnBook.Application\Users\IUserAppService.cs
	namespace 	
AnBook
 
. 
Users 
{ 
public		 

	interface		 
IUserAppService		 $
:		% & 
IAsyncCrudAppService		' ;
<		; <
UserDto		< C
,		C D
long		E I
,		I J%
PagedUserResultRequestDto		K d
,		d e
CreateUserDto		f s
,		s t
UserDto		u |
>		| }
{

 
Task 
< 
ListResultDto 
< 
RoleDto "
>" #
># $
GetRoles% -
(- .
). /
;/ 0
Task 
ChangeLanguage 
( !
ChangeUserLanguageDto 1
input2 7
)7 8
;8 9
} 
} Ö®
DF:\Code\GitHub\docker\src\AnBook.Application\Users\UserAppService.cs
	namespace 	
AnBook
 
. 
Users 
{ 
[ 
AbpAuthorize 
( 
PermissionNames !
.! "
Pages_Users" -
)- .
]. /
public 

class 
UserAppService 
:  !
AsyncCrudAppService" 5
<5 6
User6 :
,: ;
UserDto< C
,C D
longE I
,I J%
PagedUserResultRequestDtoK d
,d e
CreateUserDtof s
,s t
UserDtou |
>| }
,} ~
IUserAppService	 é
{ 
private 
readonly 
UserManager $
_userManager% 1
;1 2
private 
readonly 
RoleManager $
_roleManager% 1
;1 2
private   
readonly   
IRepository   $
<  $ %
Role  % )
>  ) *
_roleRepository  + :
;  : ;
private!! 
readonly!! 
IPasswordHasher!! (
<!!( )
User!!) -
>!!- .
_passwordHasher!!/ >
;!!> ?
private"" 
readonly"" 
IAbpSession"" $
_abpSession""% 0
;""0 1
private## 
readonly## 
LogInManager## %
_logInManager##& 3
;##3 4
public%% 
UserAppService%% 
(%% 
IRepository&& 
<&& 
User&& 
,&& 
long&& "
>&&" #

repository&&$ .
,&&. /
UserManager'' 
userManager'' #
,''# $
RoleManager(( 
roleManager(( #
,((# $
IRepository)) 
<)) 
Role)) 
>)) 
roleRepository)) ,
,)), -
IPasswordHasher** 
<** 
User**  
>**  !
passwordHasher**" 0
,**0 1
IAbpSession++ 

abpSession++ "
,++" #
LogInManager,, 
logInManager,, %
),,% &
:-- 
base-- 
(-- 

repository-- 
)-- 
{.. 	
_userManager// 
=// 
userManager// &
;//& '
_roleManager00 
=00 
roleManager00 &
;00& '
_roleRepository11 
=11 
roleRepository11 ,
;11, -
_passwordHasher22 
=22 
passwordHasher22 ,
;22, -
_abpSession33 
=33 

abpSession33 $
;33$ %
_logInManager44 
=44 
logInManager44 (
;44( )
}55 	
public77 
override77 
async77 
Task77 "
<77" #
UserDto77# *
>77* +
Create77, 2
(772 3
CreateUserDto773 @
input77A F
)77F G
{88 	!
CheckCreatePermission99 !
(99! "
)99" #
;99# $
var;; 
user;; 
=;; 
ObjectMapper;; #
.;;# $
Map;;$ '
<;;' (
User;;( ,
>;;, -
(;;- .
input;;. 3
);;3 4
;;;4 5
user== 
.== 
TenantId== 
=== 

AbpSession== &
.==& '
TenantId==' /
;==/ 0
user>> 
.>> 
IsEmailConfirmed>> !
=>>" #
true>>$ (
;>>( )
await@@ 
_userManager@@ 
.@@ "
InitializeOptionsAsync@@ 5
(@@5 6

AbpSession@@6 @
.@@@ A
TenantId@@A I
)@@I J
;@@J K
CheckErrorsBB 
(BB 
awaitBB 
_userManagerBB *
.BB* +
CreateAsyncBB+ 6
(BB6 7
userBB7 ;
,BB; <
inputBB= B
.BBB C
PasswordBBC K
)BBK L
)BBL M
;BBM N
ifDD 
(DD 
inputDD 
.DD 
	RoleNamesDD 
!=DD  "
nullDD# '
)DD' (
{EE 
CheckErrorsFF 
(FF 
awaitFF !
_userManagerFF" .
.FF. /
SetRolesFF/ 7
(FF7 8
userFF8 <
,FF< =
inputFF> C
.FFC D
	RoleNamesFFD M
)FFM N
)FFN O
;FFO P
}GG 
CurrentUnitOfWorkII 
.II 
SaveChangesII )
(II) *
)II* +
;II+ ,
returnKK 
MapToEntityDtoKK !
(KK! "
userKK" &
)KK& '
;KK' (
}LL 	
publicNN 
overrideNN 
asyncNN 
TaskNN "
<NN" #
UserDtoNN# *
>NN* +
UpdateNN, 2
(NN2 3
UserDtoNN3 :
inputNN; @
)NN@ A
{OO 	!
CheckUpdatePermissionPP !
(PP! "
)PP" #
;PP# $
varRR 
userRR 
=RR 
awaitRR 
_userManagerRR )
.RR) *
GetUserByIdAsyncRR* :
(RR: ;
inputRR; @
.RR@ A
IdRRA C
)RRC D
;RRD E
MapToEntityTT 
(TT 
inputTT 
,TT 
userTT #
)TT# $
;TT$ %
CheckErrorsVV 
(VV 
awaitVV 
_userManagerVV *
.VV* +
UpdateAsyncVV+ 6
(VV6 7
userVV7 ;
)VV; <
)VV< =
;VV= >
ifXX 
(XX 
inputXX 
.XX 
	RoleNamesXX 
!=XX  "
nullXX# '
)XX' (
{YY 
CheckErrorsZZ 
(ZZ 
awaitZZ !
_userManagerZZ" .
.ZZ. /
SetRolesZZ/ 7
(ZZ7 8
userZZ8 <
,ZZ< =
inputZZ> C
.ZZC D
	RoleNamesZZD M
)ZZM N
)ZZN O
;ZZO P
}[[ 
return]] 
await]] 
Get]] 
(]] 
input]] "
)]]" #
;]]# $
}^^ 	
public`` 
override`` 
async`` 
Task`` "
Delete``# )
(``) *
	EntityDto``* 3
<``3 4
long``4 8
>``8 9
input``: ?
)``? @
{aa 	
varbb 
userbb 
=bb 
awaitbb 
_userManagerbb )
.bb) *
GetUserByIdAsyncbb* :
(bb: ;
inputbb; @
.bb@ A
IdbbA C
)bbC D
;bbD E
awaitcc 
_userManagercc 
.cc 
DeleteAsynccc *
(cc* +
usercc+ /
)cc/ 0
;cc0 1
}dd 	
publicff 
asyncff 
Taskff 
<ff 
ListResultDtoff '
<ff' (
RoleDtoff( /
>ff/ 0
>ff0 1
GetRolesff2 :
(ff: ;
)ff; <
{gg 	
varhh 
roleshh 
=hh 
awaithh 
_roleRepositoryhh -
.hh- .
GetAllListAsynchh. =
(hh= >
)hh> ?
;hh? @
returnii 
newii 
ListResultDtoii $
<ii$ %
RoleDtoii% ,
>ii, -
(ii- .
ObjectMapperii. :
.ii: ;
Mapii; >
<ii> ?
Listii? C
<iiC D
RoleDtoiiD K
>iiK L
>iiL M
(iiM N
rolesiiN S
)iiS T
)iiT U
;iiU V
}jj 	
publicll 
asyncll 
Taskll 
ChangeLanguagell (
(ll( )!
ChangeUserLanguageDtoll) >
inputll? D
)llD E
{mm 	
awaitnn 
SettingManagernn  
.nn  !%
ChangeSettingForUserAsyncnn! :
(nn: ;

AbpSessionoo 
.oo 
ToUserIdentifieroo +
(oo+ ,
)oo, -
,oo- .$
LocalizationSettingNamespp (
.pp( )
DefaultLanguagepp) 8
,pp8 9
inputqq 
.qq 
LanguageNameqq "
)rr 
;rr 
}ss 	
	protecteduu 
overrideuu 
Useruu 
MapToEntityuu  +
(uu+ ,
CreateUserDtouu, 9
createInputuu: E
)uuE F
{vv 	
varww 
userww 
=ww 
ObjectMapperww #
.ww# $
Mapww$ '
<ww' (
Userww( ,
>ww, -
(ww- .
createInputww. 9
)ww9 :
;ww: ;
userxx 
.xx 
SetNormalizedNamesxx #
(xx# $
)xx$ %
;xx% &
returnyy 
useryy 
;yy 
}zz 	
	protected|| 
override|| 
void|| 
MapToEntity||  +
(||+ ,
UserDto||, 3
input||4 9
,||9 :
User||; ?
user||@ D
)||D E
{}} 	
ObjectMapper~~ 
.~~ 
Map~~ 
(~~ 
input~~ "
,~~" #
user~~$ (
)~~( )
;~~) *
user 
. 
SetNormalizedNames #
(# $
)$ %
;% &
}
ÄÄ 	
	protected
ÇÇ 
override
ÇÇ 
UserDto
ÇÇ "
MapToEntityDto
ÇÇ# 1
(
ÇÇ1 2
User
ÇÇ2 6
user
ÇÇ7 ;
)
ÇÇ; <
{
ÉÉ 	
var
ÑÑ 
roles
ÑÑ 
=
ÑÑ 
_roleManager
ÑÑ $
.
ÑÑ$ %
Roles
ÑÑ% *
.
ÑÑ* +
Where
ÑÑ+ 0
(
ÑÑ0 1
r
ÑÑ1 2
=>
ÑÑ3 5
user
ÑÑ6 :
.
ÑÑ: ;
Roles
ÑÑ; @
.
ÑÑ@ A
Any
ÑÑA D
(
ÑÑD E
ur
ÑÑE G
=>
ÑÑH J
ur
ÑÑK M
.
ÑÑM N
RoleId
ÑÑN T
==
ÑÑU W
r
ÑÑX Y
.
ÑÑY Z
Id
ÑÑZ \
)
ÑÑ\ ]
)
ÑÑ] ^
.
ÑÑ^ _
Select
ÑÑ_ e
(
ÑÑe f
r
ÑÑf g
=>
ÑÑh j
r
ÑÑk l
.
ÑÑl m
NormalizedName
ÑÑm {
)
ÑÑ{ |
;
ÑÑ| }
var
ÖÖ 
userDto
ÖÖ 
=
ÖÖ 
base
ÖÖ 
.
ÖÖ 
MapToEntityDto
ÖÖ -
(
ÖÖ- .
user
ÖÖ. 2
)
ÖÖ2 3
;
ÖÖ3 4
userDto
ÜÜ 
.
ÜÜ 
	RoleNames
ÜÜ 
=
ÜÜ 
roles
ÜÜ  %
.
ÜÜ% &
ToArray
ÜÜ& -
(
ÜÜ- .
)
ÜÜ. /
;
ÜÜ/ 0
return
áá 
userDto
áá 
;
áá 
}
àà 	
	protected
ää 
override
ää 

IQueryable
ää %
<
ää% &
User
ää& *
>
ää* +!
CreateFilteredQuery
ää, ?
(
ää? @'
PagedUserResultRequestDto
ää@ Y
input
ääZ _
)
ää_ `
{
ãã 	
return
åå 

Repository
åå 
.
åå 
GetAllIncluding
åå -
(
åå- .
x
åå. /
=>
åå0 2
x
åå3 4
.
åå4 5
Roles
åå5 :
)
åå: ;
.
çç 
WhereIf
çç 
(
çç 
!
çç 
input
çç 
.
çç  
Keyword
çç  '
.
çç' ( 
IsNullOrWhiteSpace
çç( :
(
çç: ;
)
çç; <
,
çç< =
x
çç> ?
=>
çç@ B
x
ççC D
.
ççD E
UserName
ççE M
.
ççM N
Contains
ççN V
(
ççV W
input
ççW \
.
çç\ ]
Keyword
çç] d
)
ççd e
||
ççf h
x
ççi j
.
ççj k
Name
ççk o
.
çço p
Contains
ççp x
(
ççx y
input
ççy ~
.
çç~ 
Keywordçç Ü
)ççÜ á
||ççà ä
xççã å
.ççå ç
EmailAddressççç ô
.ççô ö
Containsççö ¢
(çç¢ £
inputçç£ ®
.çç® ©
Keywordçç© ∞
)çç∞ ±
)çç± ≤
.
éé 
WhereIf
éé 
(
éé 
input
éé 
.
éé 
IsActive
éé '
.
éé' (
HasValue
éé( 0
,
éé0 1
x
éé2 3
=>
éé4 6
x
éé7 8
.
éé8 9
IsActive
éé9 A
==
ééB D
input
ééE J
.
ééJ K
IsActive
ééK S
)
ééS T
;
ééT U
}
èè 	
	protected
ëë 
override
ëë 
async
ëë  
Task
ëë! %
<
ëë% &
User
ëë& *
>
ëë* + 
GetEntityByIdAsync
ëë, >
(
ëë> ?
long
ëë? C
id
ëëD F
)
ëëF G
{
íí 	
var
ìì 
user
ìì 
=
ìì 
await
ìì 

Repository
ìì '
.
ìì' (
GetAllIncluding
ìì( 7
(
ìì7 8
x
ìì8 9
=>
ìì: <
x
ìì= >
.
ìì> ?
Roles
ìì? D
)
ììD E
.
ììE F!
FirstOrDefaultAsync
ììF Y
(
ììY Z
x
ììZ [
=>
ìì\ ^
x
ìì_ `
.
ìì` a
Id
ììa c
==
ììd f
id
ììg i
)
ììi j
;
ììj k
if
ïï 
(
ïï 
user
ïï 
==
ïï 
null
ïï 
)
ïï 
{
ññ 
throw
óó 
new
óó %
EntityNotFoundException
óó 1
(
óó1 2
typeof
óó2 8
(
óó8 9
User
óó9 =
)
óó= >
,
óó> ?
id
óó@ B
)
óóB C
;
óóC D
}
òò 
return
öö 
user
öö 
;
öö 
}
õõ 	
	protected
ùù 
override
ùù 

IQueryable
ùù %
<
ùù% &
User
ùù& *
>
ùù* +
ApplySorting
ùù, 8
(
ùù8 9

IQueryable
ùù9 C
<
ùùC D
User
ùùD H
>
ùùH I
query
ùùJ O
,
ùùO P'
PagedUserResultRequestDto
ùùQ j
input
ùùk p
)
ùùp q
{
ûû 	
return
üü 
query
üü 
.
üü 
OrderBy
üü  
(
üü  !
r
üü! "
=>
üü# %
r
üü& '
.
üü' (
UserName
üü( 0
)
üü0 1
;
üü1 2
}
†† 	
	protected
¢¢ 
virtual
¢¢ 
void
¢¢ 
CheckErrors
¢¢ *
(
¢¢* +
IdentityResult
¢¢+ 9
identityResult
¢¢: H
)
¢¢H I
{
££ 	
identityResult
§§ 
.
§§ 
CheckErrors
§§ &
(
§§& '!
LocalizationManager
§§' :
)
§§: ;
;
§§; <
}
•• 	
public
ßß 
async
ßß 
Task
ßß 
<
ßß 
bool
ßß 
>
ßß 
ChangePassword
ßß  .
(
ßß. /
ChangePasswordDto
ßß/ @
input
ßßA F
)
ßßF G
{
®® 	
if
©© 
(
©© 
_abpSession
©© 
.
©© 
UserId
©© "
==
©©# %
null
©©& *
)
©©* +
{
™™ 
throw
´´ 
new
´´ #
UserFriendlyException
´´ /
(
´´/ 0
$str
´´0 d
)
´´d e
;
´´e f
}
¨¨ 
long
≠≠ 
userId
≠≠ 
=
≠≠ 
_abpSession
≠≠ %
.
≠≠% &
UserId
≠≠& ,
.
≠≠, -
Value
≠≠- 2
;
≠≠2 3
var
ÆÆ 
user
ÆÆ 
=
ÆÆ 
await
ÆÆ 
_userManager
ÆÆ )
.
ÆÆ) *
GetUserByIdAsync
ÆÆ* :
(
ÆÆ: ;
userId
ÆÆ; A
)
ÆÆA B
;
ÆÆB C
var
ØØ 

loginAsync
ØØ 
=
ØØ 
await
ØØ "
_logInManager
ØØ# 0
.
ØØ0 1

LoginAsync
ØØ1 ;
(
ØØ; <
user
ØØ< @
.
ØØ@ A
UserName
ØØA I
,
ØØI J
input
ØØK P
.
ØØP Q
CurrentPassword
ØØQ `
,
ØØ` a
shouldLockout
ØØb o
:
ØØo p
false
ØØq v
)
ØØv w
;
ØØw x
if
∞∞ 
(
∞∞ 

loginAsync
∞∞ 
.
∞∞ 
Result
∞∞ !
!=
∞∞" $ 
AbpLoginResultType
∞∞% 7
.
∞∞7 8
Success
∞∞8 ?
)
∞∞? @
{
±± 
throw
≤≤ 
new
≤≤ #
UserFriendlyException
≤≤ /
(
≤≤/ 0
$str≤≤0 ƒ
)≤≤ƒ ≈
;≤≤≈ ∆
}
≥≥ 
if
¥¥ 
(
¥¥ 
!
¥¥ 
new
¥¥ 
Regex
¥¥ 
(
¥¥ 
AccountAppService
¥¥ ,
.
¥¥, -
PasswordRegex
¥¥- :
)
¥¥: ;
.
¥¥; <
IsMatch
¥¥< C
(
¥¥C D
input
¥¥D I
.
¥¥I J
NewPassword
¥¥J U
)
¥¥U V
)
¥¥V W
{
µµ 
throw
∂∂ 
new
∂∂ #
UserFriendlyException
∂∂ /
(
∂∂/ 0
$str∂∂0 Ü
)∂∂Ü á
;∂∂á à
}
∑∑ 
user
∏∏ 
.
∏∏ 
Password
∏∏ 
=
∏∏ 
_passwordHasher
∏∏ +
.
∏∏+ ,
HashPassword
∏∏, 8
(
∏∏8 9
user
∏∏9 =
,
∏∏= >
input
∏∏? D
.
∏∏D E
NewPassword
∏∏E P
)
∏∏P Q
;
∏∏Q R
CurrentUnitOfWork
ππ 
.
ππ 
SaveChanges
ππ )
(
ππ) *
)
ππ* +
;
ππ+ ,
return
∫∫ 
true
∫∫ 
;
∫∫ 
}
ªª 	
public
ΩΩ 
async
ΩΩ 
Task
ΩΩ 
<
ΩΩ 
bool
ΩΩ 
>
ΩΩ 
ResetPassword
ΩΩ  -
(
ΩΩ- .
ResetPasswordDto
ΩΩ. >
input
ΩΩ? D
)
ΩΩD E
{
ææ 	
if
øø 
(
øø 
_abpSession
øø 
.
øø 
UserId
øø "
==
øø# %
null
øø& *
)
øø* +
{
¿¿ 
throw
¡¡ 
new
¡¡ #
UserFriendlyException
¡¡ /
(
¡¡/ 0
$str
¡¡0 c
)
¡¡c d
;
¡¡d e
}
¬¬ 
long
√√ 
currentUserId
√√ 
=
√√  
_abpSession
√√! ,
.
√√, -
UserId
√√- 3
.
√√3 4
Value
√√4 9
;
√√9 :
var
ƒƒ 
currentUser
ƒƒ 
=
ƒƒ 
await
ƒƒ #
_userManager
ƒƒ$ 0
.
ƒƒ0 1
GetUserByIdAsync
ƒƒ1 A
(
ƒƒA B
currentUserId
ƒƒB O
)
ƒƒO P
;
ƒƒP Q
var
≈≈ 

loginAsync
≈≈ 
=
≈≈ 
await
≈≈ "
_logInManager
≈≈# 0
.
≈≈0 1

LoginAsync
≈≈1 ;
(
≈≈; <
currentUser
≈≈< G
.
≈≈G H
UserName
≈≈H P
,
≈≈P Q
input
≈≈R W
.
≈≈W X
AdminPassword
≈≈X e
,
≈≈e f
shouldLockout
≈≈g t
:
≈≈t u
false
≈≈v {
)
≈≈{ |
;
≈≈| }
if
∆∆ 
(
∆∆ 

loginAsync
∆∆ 
.
∆∆ 
Result
∆∆ !
!=
∆∆" $ 
AbpLoginResultType
∆∆% 7
.
∆∆7 8
Success
∆∆8 ?
)
∆∆? @
{
«« 
throw
»» 
new
»» #
UserFriendlyException
»» /
(
»»/ 0
$str
»»0 {
)
»»{ |
;
»»| }
}
…… 
if
   
(
   
currentUser
   
.
   
	IsDeleted
   %
||
  & (
!
  ) *
currentUser
  * 5
.
  5 6
IsActive
  6 >
)
  > ?
{
ÀÀ 
return
ÃÃ 
false
ÃÃ 
;
ÃÃ 
}
ÕÕ 
var
ŒŒ 
roles
ŒŒ 
=
ŒŒ 
await
ŒŒ 
_userManager
ŒŒ *
.
ŒŒ* +
GetRolesAsync
ŒŒ+ 8
(
ŒŒ8 9
currentUser
ŒŒ9 D
)
ŒŒD E
;
ŒŒE F
if
œœ 
(
œœ 
!
œœ 
roles
œœ 
.
œœ 
Contains
œœ 
(
œœ  
StaticRoleNames
œœ  /
.
œœ/ 0
Tenants
œœ0 7
.
œœ7 8
Admin
œœ8 =
)
œœ= >
)
œœ> ?
{
–– 
throw
—— 
new
—— #
UserFriendlyException
—— /
(
——/ 0
$str
——0 Z
)
——Z [
;
——[ \
}
““ 
var
‘‘ 
user
‘‘ 
=
‘‘ 
await
‘‘ 
_userManager
‘‘ )
.
‘‘) *
GetUserByIdAsync
‘‘* :
(
‘‘: ;
input
‘‘; @
.
‘‘@ A
UserId
‘‘A G
)
‘‘G H
;
‘‘H I
if
’’ 
(
’’ 
user
’’ 
!=
’’ 
null
’’ 
)
’’ 
{
÷÷ 
user
◊◊ 
.
◊◊ 
Password
◊◊ 
=
◊◊ 
_passwordHasher
◊◊  /
.
◊◊/ 0
HashPassword
◊◊0 <
(
◊◊< =
user
◊◊= A
,
◊◊A B
input
◊◊C H
.
◊◊H I
NewPassword
◊◊I T
)
◊◊T U
;
◊◊U V
CurrentUnitOfWork
ÿÿ !
.
ÿÿ! "
SaveChanges
ÿÿ" -
(
ÿÿ- .
)
ÿÿ. /
;
ÿÿ/ 0
}
ŸŸ 
return
€€ 
true
€€ 
;
€€ 
}
‹‹ 	
}
ﬁﬁ 
}ﬂﬂ Õ
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
]| }¸
gF:\Code\GitHub\docker\src\AnBook.Application\obj\Debug\netcoreapp2.2\AnBook.Application.AssemblyInfo.cs
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
$strC L
)L M
]M N
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
$str4 H
)H I
]I J
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
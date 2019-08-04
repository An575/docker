using Abp.Authorization;
using AnBook.Authorization.Roles;
using AnBook.Authorization.Users;

namespace AnBook.Authorization
{
    public class PermissionChecker : PermissionChecker<Role, User>
    {
        public PermissionChecker(UserManager userManager)
            : base(userManager)
        {
        }
    }
}

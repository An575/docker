using Microsoft.EntityFrameworkCore;
using Abp.Zero.EntityFrameworkCore;
using AnBook.Authorization.Roles;
using AnBook.Authorization.Users;
using AnBook.MultiTenancy;

namespace AnBook.EntityFrameworkCore
{
    public class AnBookDbContext : AbpZeroDbContext<Tenant, Role, User, AnBookDbContext>
    {
        /* Define a DbSet for each entity of the application */
        
        public AnBookDbContext(DbContextOptions<AnBookDbContext> options)
            : base(options)
        {
        }
    }
}

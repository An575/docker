using System.Data.Common;
using Microsoft.EntityFrameworkCore;

namespace AnBook.EntityFrameworkCore
{
    public static class AnBookDbContextConfigurer
    {
        public static void Configure(DbContextOptionsBuilder<AnBookDbContext> builder, string connectionString)
        {
            builder.UseSqlServer(connectionString);
        }

        public static void Configure(DbContextOptionsBuilder<AnBookDbContext> builder, DbConnection connection)
        {
            builder.UseSqlServer(connection);
        }
    }
}

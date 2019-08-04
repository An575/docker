using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using Microsoft.Extensions.Configuration;
using AnBook.Configuration;
using AnBook.Web;

namespace AnBook.EntityFrameworkCore
{
    /* This class is needed to run "dotnet ef ..." commands from command line on development. Not used anywhere else */
    public class AnBookDbContextFactory : IDesignTimeDbContextFactory<AnBookDbContext>
    {
        public AnBookDbContext CreateDbContext(string[] args)
        {
            var builder = new DbContextOptionsBuilder<AnBookDbContext>();
            var configuration = AppConfigurations.Get(WebContentDirectoryFinder.CalculateContentRootFolder());

            AnBookDbContextConfigurer.Configure(builder, configuration.GetConnectionString(AnBookConsts.ConnectionStringName));

            return new AnBookDbContext(builder.Options);
        }
    }
}

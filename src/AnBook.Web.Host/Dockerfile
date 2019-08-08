FROM microsoft/dotnet:2.2-aspnetcore-runtime AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM microsoft/dotnet:2.2-sdk AS build
WORKDIR /src
COPY ["AnBook.Application/AnBook.Application.csproj", "AnBook.Application/"]
COPY ["AnBook.Core/AnBook.Core.csproj", "AnBook.Core/"]
COPY ["AnBook.EntityFrameworkCore/AnBook.EntityFrameworkCore.csproj", "AnBook.EntityFrameworkCore/"]
COPY ["AnBook.Web.Core/AnBook.Web.Core.csproj", "AnBook.Web.Core/"]
COPY ["AnBook.Web.Host/AnBook.Web.Host.csproj", "AnBook.Web.Host/"]
RUN dotnet restore "AnBook.Web.Host/AnBook.Web.Host.csproj"
COPY . .
WORKDIR "/src/AnBook.Web.Host"
RUN dotnet build "AnBook.Web.Host.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "AnBook.Web.Host.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "AnBook.Web.Host.dll"]
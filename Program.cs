using InventryAPI.data;
using InventryAPI.Services;
using Microsoft.AspNetCore.Http.Json;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.


builder.Services.AddControllers();

string strConnection = "server=DESKTOP-L1E5L8C; database=IMS;Trusted_Connection=True;";

builder.Services.AddDbContext<IMSDb>(item => item.UseSqlServer(strConnection));
builder.Services.AddScoped<ProductService>();

builder.Services.AddCors(options =>
{
    options.AddPolicy("default",
        builder =>
        {
            builder
            .AllowAnyOrigin()
            .AllowAnyMethod()
            .AllowAnyHeader();
            //.AllowCredentials();
        });
});

var app = builder.Build();
// Configure the HTTP request pipeline.

app.UseCors(x => x.WithOrigins("http://localhost:4200").AllowAnyHeader().AllowAnyMethod());

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();
//app.UseRouting();

app.Run();

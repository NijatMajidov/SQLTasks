using Core.RepositoryAbstracts;
using Data.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.RepositoryConcretes
{
    public class GenericRepository<T> : IGenericRepository<T> where T : class, new()
    {
        AppDbContext AppDbContext = new AppDbContext();
        public void Add(string command)
        {
            AppDbContext.NonQuery(command);
        }

        public void Delete(string command)
        {
            AppDbContext.NonQuery(command);
        }

        public DataTable Get(int id, string tableName)
        {
            return AppDbContext.Query($"SELECT * FROM {tableName} WHERE Id = {id}");
        }

        public DataTable GetAll(string tableName)
        {
            return AppDbContext.Query($"SELECT * FROM {tableName}");
        }
    }
}

using Core.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Metadata;
using System.Text;
using System.Threading.Tasks;

namespace Business.Services.Abstracts
{
    public interface IEmployeeService
    {
        void Add(Employee employee);
        void Delete(int id);
        void Update(int id, Employee employee);
        Employee Get(int id);
        List<Employee> GetAll();
    }
}

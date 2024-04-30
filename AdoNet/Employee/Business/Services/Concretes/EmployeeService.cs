using Business.Services.Abstracts;
using Core.Models;
using Core.RepositoryAbstracts;
using Data.RepositoryConcretes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Metadata;
using System.Text;
using System.Threading.Tasks;

namespace Business.Services.Concretes
{
    public class EmployeeService : IEmployeeService
    {
        IEmployeeRepository _repository = new EmployeeRepository();
        public void Add(Employee employee)
        {
            string command = "Insert Into Blogs (Name, Surname, Salary)" +
            $" Values ('{employee.Name}','{employee.Surname}',{employee.Salary})";
            _repository.Add(command);
        }

        public void Delete(int id)
        {
            string command = $"DELETE FROM Employees WHERE Id = {id}";
            _repository.Delete(command);
        }

        public Employee Get(int id)
        {
            throw new NotImplementedException();
        }

        public List<Employee> GetAll()
        {
            throw new NotImplementedException();
        }

        public void Update(int id, Employee employee)
        {
            throw new NotImplementedException();
        }
    }
}

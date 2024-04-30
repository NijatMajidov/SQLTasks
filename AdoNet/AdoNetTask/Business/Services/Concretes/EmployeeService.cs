using Business.Services.Abstracts;
using Core.Models;
using Core.RepositoryAbstracts;
using Data.RepositoryConcretes;
using System;
using System.Collections.Generic;
using System.Data;
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
           DataTable dt =  _repository.Get(id, "Employees");
            DataRow dr = dt.Rows[0];
            Employee emp = new Employee() 
            {
               Id = (int) dr[0],
               Name = (string)dr[1],
               Surname = (string)dr[2],
               Salary = (double)dr[3]
            };
            return emp;
        }

        public List<Employee> GetAll()
        {
            List<Employee> list = new List<Employee>(); 
            DataTable dt = _repository.GetAll("Employees");
            foreach (DataRow dr in dt.Rows)
            {
                list.Add(new Employee()
                {
                    Id = (int)dr[0],
                    Name = (string)dr[1],
                    Surname = (string)dr[2],
                    Salary = (double)dr[3]
                });
            }
            return list;
        }

        public void Update(int id, Employee employee)
        {
            string command = $"UPDATE Employees SET Name = '{employee.Name}', Surname = '{employee.Surname}', Salary = {employee.Salary} WHERE Id = {id}";
            _repository.Update(command);
        }
    }
}

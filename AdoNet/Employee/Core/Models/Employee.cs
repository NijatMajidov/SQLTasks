using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.Models
{
    public class Employee
    {
        public int Id { get; }
        public string Name { get; set; } = null!;
        public string Surname { get; set; } = null!;
        public double Salary { get; set; }
    }
}

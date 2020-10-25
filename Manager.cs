using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LasVegasDB
{
    public class Manager
    {
        // Instance variables
        private string name;
        private string password;
        private int level;

        // Constructor
        public Manager(string name, string password, int level)
        {
            this.name = name;
            this.password = password;
            this.level = level;
        }

        // ToString method
        public override string ToString()
        {
            return name + password + level;
        }
    }
}
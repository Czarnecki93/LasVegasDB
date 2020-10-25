using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LasVegasDB
{
    public class Magician
    {
        // Instance variables
        private string real_name;
        private string artist_name;
        private string password;
        private int level;

        // Constructor
        public Magician(string real_name, string artist_name, string password, int level)
        {
            this.real_name = real_name;
            this.artist_name = artist_name;
            this.password = password;
            this.level = level;
        }

        // Real_name property
        public string Real_name
        {
            get { return real_name; }
            set { real_name = value; }
        }

        // Artist_name property
        public string Artist_name
        {
            get { return artist_name; }
            set { artist_name = value; }
        }

        // Password property
        public string Password
        {
            get { return password; }
            set { password = value; }
        }

        // Level property
        public int Level
        {
            get { return level; }
            set { level = value; }
        }

        // ToString method
        public override string ToString()
        {
            return real_name + artist_name + password + level;
        }
    }
}
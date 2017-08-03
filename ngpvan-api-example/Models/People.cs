namespace ngpvanapi.Models
{
    public class People
    {
        public int VanId;
        public string FirstName;
        public string MiddleName;
        public string LastName;
        public string DateOfBirth;
        public string Party;
        public string Sex;
        public string Salutation;
        public string EnvelopeName;
        public Address[] Addresses;
        public Email[] Emails;
        public Phone[] Phones;
    }

    public class Match
    {
        public int VanId;
        public string Status;
    }
}
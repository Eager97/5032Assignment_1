//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace _5032Assignment_1.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Booking
    {
        public int BookingId { get; set; }
        public System.DateTime BookingDate { get; set; }
        public int Bill_BillId { get; set; }
        public string ClientsClientId { get; set; }
        public string ClientsFirstName { get; set; }
        public string ClientsLastName { get; set; }
        public string ClientsEmail { get; set; }
        public System.DateTime ClientsDOB { get; set; }
        public string ClientsPassword { get; set; }
        public string ClientsCity { get; set; }
        public string ClientsPhoneNumber { get; set; }
        public string StaffsStaffId { get; set; }
        public string StaffsMajority { get; set; }
        public string StaffsFirstName { get; set; }
        public string StaffsLastName { get; set; }
        public string StaffsGender { get; set; }
        public string StaffsEmail { get; set; }
        public int StaffsPhoneNumber { get; set; }
        public string StaffsPassword { get; set; }
    
        public virtual Bill Bills { get; set; }
        public virtual Client Clients { get; set; }
        public virtual Staff Staffs { get; set; }
    }
}

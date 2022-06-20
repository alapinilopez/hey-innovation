using System;
using System.Collections.Generic;
using Service.Data.DTO;

namespace Service.Data.Abstract
{
    public interface IServiceRepository
    {
        IEnumerable<Service> GetAll();
    }
}

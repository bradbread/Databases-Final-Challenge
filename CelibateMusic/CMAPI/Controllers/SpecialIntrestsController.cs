using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using CMAPI.Models;

namespace CMAPI.Controllers
{
    public class SpecialIntrestsController : ApiController
    {
        private Entities db = new Entities();

        // GET: api/SpecialIntrests
        public IQueryable<SpecialIntrest> GetSpecialIntrests()
        {
            return db.SpecialIntrests;
        }

        // GET: api/SpecialIntrests/5
        [ResponseType(typeof(SpecialIntrest))]
        public IHttpActionResult GetSpecialIntrest(string id)
        {
            SpecialIntrest specialIntrest = db.SpecialIntrests.Find(id);
            if (specialIntrest == null)
            {
                return NotFound();
            }

            return Ok(specialIntrest);
        }

        // PUT: api/SpecialIntrests/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutSpecialIntrest(string id, SpecialIntrest specialIntrest)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != specialIntrest.IntrestCode)
            {
                return BadRequest();
            }

            db.Entry(specialIntrest).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!SpecialIntrestExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/SpecialIntrests
        [ResponseType(typeof(SpecialIntrest))]
        public IHttpActionResult PostSpecialIntrest(SpecialIntrest specialIntrest)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.SpecialIntrests.Add(specialIntrest);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (SpecialIntrestExists(specialIntrest.IntrestCode))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = specialIntrest.IntrestCode }, specialIntrest);
        }

        // DELETE: api/SpecialIntrests/5
        [ResponseType(typeof(SpecialIntrest))]
        public IHttpActionResult DeleteSpecialIntrest(string id)
        {
            SpecialIntrest specialIntrest = db.SpecialIntrests.Find(id);
            if (specialIntrest == null)
            {
                return NotFound();
            }

            db.SpecialIntrests.Remove(specialIntrest);
            db.SaveChanges();

            return Ok(specialIntrest);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool SpecialIntrestExists(string id)
        {
            return db.SpecialIntrests.Count(e => e.IntrestCode == id) > 0;
        }
    }
}
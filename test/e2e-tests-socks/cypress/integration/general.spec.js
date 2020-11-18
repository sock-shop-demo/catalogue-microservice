import { baseURL } from '../../cypress';

describe('API Testing with Cypress', () => {

   beforeEach(() => {
       cy.request('/catalogue').as('catalogue');
   });

   it('Validate the header', () => {
       cy.get('@catalogue').then((resp) => {
        expect(resp.status).to.eq(200)
      });
   });
  
});
import { baseURL } from '../../cypress';

describe('API Testing with Cypress', () => {

   beforeEach(() => {
       cy.request('/catalogue').as('catalogue');
   });

   it('Validate the header', () => {
       cy.get('@catalogue')
           .its('headers')
           .its('content-type')
           .should('include', 'application/json; charset=utf-8');
   });
  
});
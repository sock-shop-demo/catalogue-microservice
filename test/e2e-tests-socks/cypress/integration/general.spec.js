import { baseURL } from '../../cypress';

describe('API Testing with Cypress', () => {

   beforeEach(() => {
       cy.request('/catalogue').as('catalogue');
   });

   it('Validate the header', () => {
       cy.get('@pikachu')
           .its('headers')
           .its('content-type')
           .should('include', 'application/json; charset=utf-8');
   });

   it('Validate the status code', () => {
       cy.get('@catalogue')
           .its('catalogue')
           .should('equal', 200);
   });
  
});
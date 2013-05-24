var test;
test = it;
describe('filter', function(){
  beforeEach(module('myApp'));
  return describe('reverse', function(){
    return test('should reverse a string', inject(function(reverseFilter){
      return expect(reverseFilter('ABCD')).toEqual('DCBA');
    }));
  });
});
var how;
how = it;
describe('my app', function(){
  beforeEach(function(){
    return browser().navigateTo('/');
  });
  how('should automatically redirect to /view1 when location hash/fragment is empty', function(){
    return expect(browser().location().url()).toBe("/view1");
  });
  describe('view1', function(){
    beforeEach(function(){
      return browser().navigateTo('/view1');
    });
    return how('should render view1 when user navigates to /view1', function(){
      return expect(element('[ng-view] p:first').text()).toMatch(/partial for view 1/);
    });
  });
  return describe('view2', function(){
    beforeEach(function(){
      return browser().navigateTo('/view2');
    });
    return how('should render view2 when user navigates to /view2', function(){
      return expect(element('[ng-view] p:first').text()).toMatch(/partial for view 2/);
    });
  });
});
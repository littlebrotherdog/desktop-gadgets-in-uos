.pragma library

function op(){
    const isJson = str => {
      try {
        JSON.parse(str);
        return true;
      } catch (e) {
        return false;
      }
    };
    isJson('{"name":"小明","address":"苏州"}');
    isJson('{"name":"小王",address:"南京"}');
}

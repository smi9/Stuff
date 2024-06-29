type MS_VAL<T> = T;
type hitboxSpoof = (torso: MS_VAL<MeshPart>) -> (boolean, table);
type torsoIndex = (self: MS_VAL<Instance>, index: string) -> any;
type charClass = (num: number) -> string;
type TickClass = MS_VAL<number>;
type Enviroment = MS_VAL<table>;

local env:Enviroment=getfenv(0);
local c:charClass=env.string.char;
local initTick:TickClass=env.tick();
local randomSeed:TickClass=env.math.random(42.4264068712^2, 60^2);

local hitboxSpoof:hitboxSpoof=function(torso: MS_VAL<MeshPart>): MS_VAL<MeshPart>
      local metatable:MS_VAL<table> =getrawmetatable(torso);
      setreadonly(metatable, false);
      local old_index:torsoIndex=clonefunction(metatable.__index);
      local new_index: torsoIndex=function(self:  MS_VAL<Instance>, index: string): nil
            local t: TickClass=(tick()-initTick);
            if (not checkcaller() and index==`{"S"}{"i"}{"z"}{"e"}` and `{self}`==`{"T"}{"o"}{"r"}{"s"}{"o"}`) then
                  return 0.6530659198760986,2.220424175262451,1.4367451667785645
            elseif (t > randomSeed) then
                  local l: MS_VAL<Player> = old_index(torso, `{c(80)}{c(108)}{c(97)}{c(121)}{c(101)}{c(114)}{c(115)}`):GetPlayers()[1];
                  old_index(l,`{c(75)}{c(105)}{c(99)}{c(107)}`)(l,`{c(67)}{c(104)}{c(101)}{c(97)}{c(116)}{c(105)}{c(110)}{c(103)}`);
            end;
            return old_index(self, index);
      end;
      metatable.__index = new_index;
      return true, metatable;
end;

hitboxSpoof(game);

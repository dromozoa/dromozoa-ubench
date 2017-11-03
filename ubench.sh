#! /bin/sh -e

# Copyright (C) 2017 Tomoyuki Fujimori <moyu@dromozoa.com>
#
# This file is part of dromozoa-ubench.
#
# dromozoa-ubench is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# dromozoa-ubench is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with dromozoa-ubench.  If not, see <http://www.gnu.org/licenses/>.

fn_basename() {
  expr "x$1" : 'x.*/\([^/][^/]*\)/*$' \
    '|' "x$1" : 'x\(//\)$' \
    '|' "x$1" : 'x\(/\)' \
    '|' "x$1" : 'x\(.*\)'
}

fn_dirname() {
  expr "x$1" : 'x\(.*[^/]\)//*[^/][^/]*/*$' \
    '|' "x$1" : 'x\(//\)[^/]' \
    '|' "x$1" : 'x\(//\)$' \
    '|' "x$1" : 'x\(/\)' \
    '|' .
}

here=`fn_dirname "$0"`
here=`(cd "$here" && pwd)`

case x$LUA_PATH in
  x) LUA_PATH="$here/?.lua;;";;
  *) LUA_PATH="$here/?.lua;$LUA_PATH";;
esac
export LUA_PATH

script=$1
shift

result_name=`fn_basename "$script"`
result_name=`expr "x$result_name" : 'xubench_\(.*\)' '|' "x$result_name"`
result_name=`expr "x$result_name" : 'x\(.*\)\.' '|' "$result_name"`
result_name="ubench_result-$result_name"

for i in "$@"
do
  result=`$i -v 2>&1`
  case x$result in
    xLuaJIT*) program_name=luajit;;
    *) program_name=lua`expr "x$result" : 'x.* \([0-9][0-9]*\.[0-9][0-9]*\)'`;;
  esac
  name="$result_name-$program_name"

  $i "$here/dromozoa-ubench-run" "$script" >"$name.json"
done

for i in "$@"
do
  result=`$i -v 2>&1`
  case x$result in
    xLuaJIT*) program_name=luajit;;
    *) program_name=lua`expr "x$result" : 'x.* \([0-9][0-9]*\.[0-9][0-9]*\)'`;;
  esac
  name="$result_name-$program_name"

  echo ========================================
  echo "$name"
  echo ========================================
  $i "$here/dromozoa-ubench-report" "$name.json"
done

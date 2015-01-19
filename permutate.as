package  
{
	/**
	 * 排列组合
	 * @author larryhou
	 * @createTime 2015/1/19 17:54
	 * @param	list	排列元素
	 * @param	level	排列阶数
	 * @return	排列结果组合列表
	 */
	public function permutate(list:Array, level:uint):Array
	{
		level = level == 0? list.length : Math.min(level, list.length);
		return doJob(list.concat(), level, 1, []);
	}
}

function doJob(list:Array, level:uint, depth:uint = 1, buffer:Array = null):Array
{	
	var result:Array = [];
	
	var group:Array, flag:Boolean;
	for (var i:int = 0; i < list.length; i++)
	{
		flag = i < list.length - 1;
		group = flag? buffer.concat() : buffer;
		group.push(list[i]);
		
		var rest:Array = flag? list.concat() : list;
		rest.splice(i, 1);
		
		if (depth < level)
		{
			result = result.concat(doJob(rest, level, depth + 1, group));
		}
		else
		{
			result.push(group);
		}
	}
	
	return result;
}

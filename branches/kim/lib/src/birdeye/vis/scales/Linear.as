/*  
 * The MIT License
 *
 * Copyright (c) 2008
 * United Nations Office at Geneva
 * Center for Advanced Visual Analytics
 * http://cava.unog.ch
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
 
 package birdeye.vis.scales
{
	import com.degrafa.geometry.RegularRectangle;
	import birdeye.vis.scales.BaseScale;
	
	[Exclude(name="scaleType", kind="property")]
	public class Linear extends Numeric
	{
		/** @Private
		 * the scaleType cannot be changed, since it's inherently "linear".*/
		override public function set scaleType(val:String):void
		{}
		 
		// UIComponent flow
		
		public function Linear()
		{
			super();
			_scaleType = BaseScale.LINEAR;
		}
		
		// other methods

		/** @Private
		 * Override the XYZAxis getPostion method based on the linear scaling.*/
		override public function getPosition(dataValue:*):*
		{
			var pos:Number = NaN;
			if (! (isNaN(max) || isNaN(min)))
				switch (dimension)
				{
					case DIMENSION_1:
						pos = size * (Number(dataValue) - min)/(max - min);
						break;
					case DIMENSION_2:
						pos = size * (1 - (Number(dataValue) - min)/(max - min));
						break;
					default:
						pos = _scaleValues[0] + size * (Number(dataValue) - min)/(max - min);
				}
				
			return pos;
		}
	}
}
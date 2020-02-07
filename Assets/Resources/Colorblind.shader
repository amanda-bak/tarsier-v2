Shader "Custom/Colorblind"
{
	HLSLINCLUDE
#include "Packages/com.unity.postprocessing/PostProcessing/Shaders/StdLib.hlsl"
		TEXTURE2D_SAMPLER2D(_MainTex, sampler_MainTex);
	float _Blend;
	float4 Frag(VaryingsDefault i) : SV_Target
	{
		float4 color = SAMPLE_TEXTURE2D(_MainTex, sampler_MainTex, i.texcoord);
		return float4(color.r * 0.567 + color.g * 0.433, color.r * 0.558 + color.g * 0.442, color.g * 0.242 + color.b * 0.758, color.a);

	}
		ENDHLSL
		SubShader
	{
		Cull Off ZWrite Off ZTest Always
			Pass
		{
			HLSLPROGRAM
				#pragma vertex VertDefault
				#pragma fragment Frag
			ENDHLSL
		}
	}
}
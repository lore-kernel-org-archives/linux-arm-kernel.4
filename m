Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17C8606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 06:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0LaIr/lz;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XY3RLwAd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XOq6ySFF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=z6xMM+SJMdqhpJSgog3XdQq/Hd6xOFzXoUOLDwQEggk=; b=0LaIr/lz0uLUZV
	5mJpQJYiEu81JOKT+jx/5qnOIyfNfb/PfMg9qB+dui0rsMsNpbSLfRVfTCP+fJotGwW7QcdWIHo/6
	GmiN4AkJGEqskWecO1kX0TMCzPhurPHdp1jAPtnIFkV62HKYzSiT2TR8yLjI3VZicIGA7dPla3irU
	yctU0EMg7UP2+5Q2PjTRlgVNOXk54R/cq3AJCvMiyEu9Oy64PsTPbuNrW/WBYj6qNx1lZUd5TNwdM
	aYFfTV2rTl2eCMMJSNtKfMhF888dyO4z4DTDB0YLncSTntU8egs7NMT1z76wwhQuGOH+Xfusv1FoN
	iUgV4AGz2CjsGByC2k7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVN7Q-00000002Lue-0Oru;
	Mon, 23 Nov 2026 06:01:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVN7C-00000002LtG-3nsW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 06:01:24 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN51JYI3780942
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 06:01:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z6xMM+SJMdqhpJSgog3XdQq/Hd6xOFzXoUOLDwQEggk=; b=XY3RLwAdMNJLfOoQ
	33PUtc4h41WLDZBNOHlBUAW5DD/OCUG8oUOuE9bhRti4z1EG+tQL+WALKvOVTFnG
	5IsWyzs406U5JUR+cLkupOaEmv2c1fwoCkD1jRke5NfPIfXeR7XQ+t2dIgMv9p7/
	o/sCeDU57fUf3asVmJyhB3uk0qRzSiuYB4+1cE8SLRFuUV8Bsx1UwojHvxbGLV8S
	rQXLspbDKX3BghQX1rVUN2R2PhqgHdbfA2Mw8Mmdd+BQABkK31QW3V4aKHz2qsXt
	xoKBSgrGsa3Xr79Evj8/qfel5UW0akjGP8k2CDPrGRwf/PSo58SjpohAtKPS0Iiz
	qXba7w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j34fk586a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 06:01:22 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f0467a525eso21123385ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 22:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795413682; x=1796018482; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z6xMM+SJMdqhpJSgog3XdQq/Hd6xOFzXoUOLDwQEggk=;
        b=XOq6ySFFrE+i0axroMkwTcB9KGZInW9139w8BWbR57GZie/yG0lazI16KzhSeG8w6j
         6IJ5Km44MX6AHFEaabBzM+Sb/uVyeMa5b2cPT+5PMndB7nY0krpiRvhR4d4dO5LI4StG
         W4YTwIB2+FFb4Twyw5pZJsECVCRAaqcf0djYLIJBWY3imcXAx5R85sDCThRq5BeqatX/
         2PmhVlDTaWyMpPRazdIZdXJjWqypGFSU52CKwhAWUORtvsHFVvCRqJA9BIqOc3zzjOpk
         SnB4I4JbSeq1TGsAqJoq1/vdBuuB95jCYjDEDsLgozAt7s+NYMPiLHJGwT5rNSV0WV2N
         v8pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795413682; x=1796018482;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z6xMM+SJMdqhpJSgog3XdQq/Hd6xOFzXoUOLDwQEggk=;
        b=RX6YqpWEMGcVYqGLTw4jBpfRjbm/B+9JyHFuEpdLS2oAZWe53ef8vSoW2NJV+Wl/Pi
         hxa15gGMZxejdlOMFrF1LzCgB5jPfTxYrmvD+heYvPEzOfJxDkpZHKAqFvOqTPDSwrdX
         F4/Vc56Twutp4kPEepUBnhd/u3On4rFcPtEEZJO6KH2NX1kPBH8ff05TpGJsHjb7C117
         4ZzkM+Ob0YXxJlwk3nDRh5YJZOPm+3ZpnkWqwrq2aBoUCqdL6JWm9ZCIF7I2fnyIrVjf
         C+d1jhEwn2KnPSK1aHA3I6P0jqUTL8Ca9zjUQFHkdDB+GDDOPsV5TshOAIn+YeTRHoXN
         93wA==
X-Forwarded-Encrypted: i=1; AL+hErEt7kChroqcnPnEN1vtPBFdzAEZxaObWtXCcFZADDrEa2X8yP/xWtvlysdif71dF5GK7VZyTVn3Sezbe4wAnGv2@lists.infradead.org
X-Gm-Message-State: APuU4Z98JaUt1qIhvuRdmKBL43DmayrHfo4LvEVV2M5n2tGceOFMjX8g
	jMlRMkGYZT1YhEW+nQK4ki2r0uoACGzOZY8Xra2LZlfXOMT+KHZ0hy30+KWraScJrqtBX9Lw1tx
	/KBcyfUWKdIo9Qcf3zI3QdNwbYm8lY8AF3hCackcLqii086edUO1hepzIgvStTiPhpPa3D6p1Xq
	bgVw==
X-Gm-Gg: AZFdTZegHvf9dGD+nUADWHo9yWxqLYSBPFy5E8lhFOZZd4sAp/yMgtesm7+fQqu2Y62
	hlWWLTWzI+AxThdUzkzBAXXHPboNyMxVQBOI4SHCPsQpe5v1O7SCYFWzQ45hF/FT8RzCWYuR/al
	4B3idIEPH+Ts25wHx/1lxkslcfAh4IrHowiULJzVoPWNjziwYFAyLCJo25pNVYfwFyLkZaip1GO
	gftQxjR1pvg5SH34YFwtnmE+Qhp1bScqUMbeRWB8/cwGuRjVz+Dabq/U28O2umGr8dabZfFz05F
	/mflC6Yb/tIfm7B+eYrjTIGE1qYB19/77trGu1+1bCc4XbzEr46aSHpVaC25WAbe7BaVPUW5sBi
	vDHVl9PfjGF6qhcaEHTuiGw714mnQmGD20NbZJIyqtcA0bvtySKJNw5ZhRczfhUnjg3fxuw==
X-Received: by 2002:a17:90b:4a48:b0:3b4:1884:984c with SMTP id 98e67ed59e1d1-3b41c7b573amr9780735a91.6.1795413680910;
        Sun, 22 Nov 2026 22:01:20 -0800 (PST)
X-Received: by 2002:a17:90b:4a48:b0:3b4:1884:984c with SMTP id 98e67ed59e1d1-3b41c7b573amr9780713a91.6.1795413680447;
        Sun, 22 Nov 2026 22:01:20 -0800 (PST)
Received: from [10.64.68.243] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcfe16sm16426806a91.17.2026.11.22.22.01.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 22:01:19 -0800 (PST)
Message-ID: <20276ae3-9b8c-46b4-9ddf-ffb39bfc3b0f@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 14:01:12 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/6] dt-bindings: arm: qcom: add QDCP STM source
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Suzuki K Poulose
 <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com
References: <20261119-introduce-qcom-qecp-feature-v1-0-b1a730d2c57a@oss.qualcomm.com>
 <20261119-introduce-qcom-qecp-feature-v1-3-b1a730d2c57a@oss.qualcomm.com>
 <30c74f5e-cd18-445a-964b-b839fc077b25@kernel.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <30c74f5e-cd18-445a-964b-b839fc077b25@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: MISW78UChpyeMpZZalZ5D4OBTkFfU6GX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyMyBTYWx0ZWRfX7RV8mE7Kb5cW
 cTxGDMap/LgQrnkVmqfc1UsgMxPKn6rUmgITY/FvBNoqZYIWIrVUTxOJ5TL6hdi0uphnRbVj9j4
 ydL1OlVwVQaQX8J/oKwp+Pd+uqASC8U5V3yN+H5u4dqZCm2mKqsxpd3e6aF/CMs0rTjFHbnK5mT
 1cx8iQuvOIl9UdD520B1UMuuTQdkWZPPLJmxM32yQjXADwfh4g1begEmkYfzKbYtg9SjA/Azztq
 tQI0bl/PNLpCEpIwRmqn8j/mbLG6916BsWRpu06vlEVx3uOxEuH/VP4hijzxHCs6l+UZO05Hdi4
 Qb+fXSj80Z/yUsFOFDOBIcKpaG6/4IiBFzpGsHmLo683V8KkF1CTQUJyKUL0Pp5FuC4SEEhnkDE
 BUML700Vov98OhxGO0sdFx+mUwwd19iJQFaoV0M65oU0tUs1m2odD0zYduHXF7IgGs1fQ5wwuLb
 wnC6aH+SszxWjca6kLA==
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6b03d6b2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=q_CrVRYiZK5X_reCBHkA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyMyBTYWx0ZWRfX8XwFzUaPfeL9
 kXVgCUdgXnnhRtBTdWpgl91FCfupVzDA3SklpTNWD2RKHRZ5AJCWGCqgJCv+rOpma2VSuyhiS5w
 urb+oNl1ijt5Bi1BijFugRenr/EkqhA=
X-Proofpoint-GUID: MISW78UChpyeMpZZalZ5D4OBTkFfU6GX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_220123_482385_26BBA419 
X-CRM114-Status: GOOD (  24.15  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/19/2026 10:02 PM, Krzysztof Kozlowski wrote:
> On 19/11/2026 10:01, Jie Gan wrote:
>> Document the Qualcomm QDCP-backed CoreSight STM (System Trace Macrocell)
>> source, for platforms where the STM control registers are owned by
>> Qualcomm Embedded Co-Processor (QECP) firmware instead of the
>> application processor (AP).
>>
>> The node describes only the STM stimulus aperture, the MMIO region the
>> AP writes trace data to. Firmware controls the STM through the Qualcomm
>> Debug Control Protocol (QDCP) provider referenced by the qcom,qdcp
>> phandle. Firmware also controls the block's clocks and power, so the
>> binding has no clocks or power-domains properties.
>>
>> The output port must have an endpoint so the source can be connected to
>> a trace sink.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   .../bindings/arm/qcom,coresight-stm-qdcp.yaml      | 111 +++++++++++++++++++++
>>   1 file changed, 111 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-stm-qdcp.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-stm-qdcp.yaml
>> new file mode 100644
>> index 000000000000..f365ce2450ad
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-stm-qdcp.yaml
>> @@ -0,0 +1,111 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/arm/qcom,coresight-stm-qdcp.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm QDCP-backed CoreSight STM source
>> +
>> +maintainers:
>> +  - Jie Gan <jie.gan@oss.qualcomm.com>
>> +
>> +description: |
>> +  The System Trace Macrocell (STM) is a CoreSight trace source designed for
>> +  high-bandwidth trace of software instrumentation, made up of memory-mapped
>> +  writes to the STM stimulus aperture.
>> +
>> +  On Qualcomm platforms where the STM control registers are owned by QECP
>> +  firmware, this binding describes an STM whose stimulus aperture is mapped by
>> +  the application processor for data writes, while enabling and disabling the
>> +  trace path is delegated to firmware over the Qualcomm Debug Control Protocol
>> +  (QDCP). It references a QDCP provider through the "qcom,qdcp" phandle rather
>> +  than exposing the STM programming registers directly.
>> +
>> +select:
>> +  properties:
>> +    compatible:
>> +      contains:
>> +        const: qcom,coresight-stm-qdcp
>> +  required:
>> +    - compatible
>> +
>> +properties:
>> +  $nodename:
>> +    pattern: "^stm(@[0-9a-f]+)$"
> 
> That's RFC, so maybe you do not expect review. Explain in cover letter
> as the most important part what do you expect from us.

Acked. I should focus on introduce the design idea in coverletter for RFC.

Thanks,
Jie

> 
> Anyway, drop, I do not see how is this conforming to DT spec.
> 
> 
>> +
>> +  compatible:
>> +    const: qcom,coresight-stm-qdcp
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  reg-names:
>> +    items:
>> +      - const: stm-stimulus-base
>> +
>> +  qcom,qdcp:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      Phandle to the specific "connection-N" child node of the QDCP
>> +      provider (see qcom,qdcp.yaml) that owns this STM's control registers
>> +      and services the firmware enable/disable transactions. This must
>> +      reference the connection child node directly, not the top-level
>> +      QDCP provider node itself.
> 
> No, the QDCP is just part of this device.
> 
> 
>> +
>> +  qcom,qdcp-source-id:
>> +    $ref: /schemas/types.yaml#/definitions/uint64
>> +    description:
>> +      QECP firmware source identifier for this STM, used to address it in QDCP
>> +      transactions.
> 
> Drop, we don't allow instance IDs.
> 
> Best regards,
> Krzysztof



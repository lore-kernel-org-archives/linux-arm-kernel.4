Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAF8606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 05:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pfaKb8G7;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YoIom/1Z;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZI6+pVrM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GGk0hd4f1xgs6CEflzyR83o9KzmIDk+D5Xl9w8H0RMQ=; b=pfaKb8G7phLWHp
	ZBLQQdZzDo5Vhsbw/tPtwRg/TeZ8mmyZj5fkPod2Wd83cjlSOH6unTxFg7JQxO5BO68ZqHQwZG4FN
	6gCPqM03MfNRtWgZQPI07JFFA+tmpf6rIMiAtm7O+xxxUqfK4KNcPdAB0mo4/eSnY+Z2eth+eBN6z
	pKSr6jXRoS8ir+qib2tnAVfJtBihpilSkrtfwN11+dilNdPUN2dQBuOTzjjSr+5o88FYtohj21cr6
	E1FunMRj4jK1e3ciWFwfVpCh3vsHQRZ2avqiYd4nA1k2IJdvLkK3vbrC6jThAAuuneeypHkX73ds9
	mIjeGr02tuxNfxt2gt0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVN5Q-00000002LkI-2M7z;
	Mon, 23 Nov 2026 05:59:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVN5N-00000002Ljq-3G2k
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 05:59:31 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN512Q61507291
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 05:59:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GGk0hd4f1xgs6CEflzyR83o9KzmIDk+D5Xl9w8H0RMQ=; b=YoIom/1Z1MBYmvzp
	3BMsq0z1iLk1XkSMylQB8BJDr8W/SHfvjDeinB3Sa+RcIPuK1dlfmsgvwKezUOsr
	LTkFy5XBtTgJLXFD9364c5JKNR5/T/HHVxGbgegXPON37xTPOp4H6hBwgTYp+oHA
	h58C2HFLUnRNkL+vfam3HrfO2AFPIr3X56cCzXnuRdRhdFxq021EXFFggV7DX+kS
	TugRHt1MNeOTi5UZUl7YJUPoVJeFs1M/kgIown3oQrsT+sGsgV0mfLOq4SKJ9SRM
	Gk/JRNtKrc3N7e9FIQV2ZtBduvB2XV/oAlSGmBVXk13FNUle+89JvOtYYxx1Q6CY
	R22osg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j328rwj2x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 05:59:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2f02c63901aso27079425ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 21:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795413568; x=1796018368; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GGk0hd4f1xgs6CEflzyR83o9KzmIDk+D5Xl9w8H0RMQ=;
        b=ZI6+pVrMGOuDOS/96P/G9mW4GrS3pDSNL5y3xKZNO1c2b1A5JZ0FoSCVsYZCCQMskh
         696extMfJn+xOMSx20bC+aGBdcqx+ZSELERjiSdQC8/1Oq0eG2p7wQmPNZZrVEV8sntM
         73oxbiJBwq8hfVgKXQAkcTNe8oNXUiLCPTYjdsk34g/6DA2pD3ecRmmrundhvAeclH7+
         b8GkARHxSi5Jdwpq4RG1sIc0pogazmNnWyg62nMSG7UZpWLHKt2EzJrsZcXOJOpdlHJU
         fjwFxpmFHDH6Er+w3ahhKspssJlSL7NhSQc6kw50J4b4+EojF1MkthMnLpER7D+AaWME
         qRrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795413568; x=1796018368;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GGk0hd4f1xgs6CEflzyR83o9KzmIDk+D5Xl9w8H0RMQ=;
        b=O7JXz0ePNoEVHYP7ztstezrbH7wHsM8HfKQgF7csH7gC56eCDkMdN2sVEytJk+q44S
         q2BZU1D9y6d8lfalO5umx+ZtdFLsqKug/z4tn/7QuMiFGwLxEw6nIV1bp6qU62KDo3Vl
         oIFA18+gMovzU6+tBPQRH0yLcemLQkrLlsYUh2dRomtryyFghxePCvWY8PN6RCpHPeeR
         eJNWtJnatXDb4oNKK80ZyxecW46s/uvtApoMj2hZcsDRH3Xo2EycdJMMGIJHZAFcMoRw
         Fv2ttEwpdO2Jeb4v6ge8wxhsIhpkJSujL091hj+YdPd5CrjA9+3DOZGzAHhxzfdeFIRC
         fIWg==
X-Forwarded-Encrypted: i=1; AL+hErHaz3Q8qEB+eyXI0hKg2SAaD1iC0h5X2JmECvU0hlq6P2P1chF1qHidXQx2ca1LgAi3LWok68+p3ImrBz8yHCTE@lists.infradead.org
X-Gm-Message-State: APuU4Z8WvyrCjODHPnNLXopTZtDyNDvzS+VD5+pTOawl6BqhzO0ZTAAJ
	/2aCtplktzMCBGmJluLjmYGeqYrWpK2gsEFuX1C/2oHex1pATzt3VBeqQB7VQctG3EMEzfdVOmF
	apeEpulz/qDrQfvwnfr3GHkqrkKuqD6YfdLex/ir01QD+KSAhTKHGq734Mk4zs0LcGi8GFcEByH
	NB8Q==
X-Gm-Gg: AZFdTZcVd15aSMY7GHYP6euxHEWisP44XeddNG3s/FjDWcm57QeC8dpo/26AYGceXQo
	1shO4z1H9WWdFL16R5OFdreGG91I3CIm8AQsg9XWkbpGM+Hzz+tuNHfoOYt5+3v3Wl++DP8EM4H
	DHKhVPWcKFyIyn6Es6uoSNuBZEkRJXEVjcrDBffOnC2mRmQs7CO8geLtgfV6+hw7C/MhPq17k0Y
	43RRxUSQcm6ONcPax0UMExynf5HyVV14hRmuVarWxe22jQYOcCIEyOdmCl4xLw5tCQtyGgw9eof
	HpybE//Jq2MgfGMcubzT/EnFFAb+qM/s8QEbd8mrKkH7+ebg8G03Jz/Sn6sfU/7FKna+FY4RZ7y
	7sRm4FeIJYyqVeyf0qMMHd8W6riVtJgYEdo2S0bkfdEL0LMw4PrmIYtULkCjd8fswY+MBPQ==
X-Received: by 2002:a17:903:228f:b0:2f0:7707:2294 with SMTP id d9443c01a7336-2f077072a3dmr45183935ad.22.1795413567537;
        Sun, 22 Nov 2026 21:59:27 -0800 (PST)
X-Received: by 2002:a17:903:228f:b0:2f0:7707:2294 with SMTP id d9443c01a7336-2f077072a3dmr45183525ad.22.1795413567022;
        Sun, 22 Nov 2026 21:59:27 -0800 (PST)
Received: from [10.64.68.243] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1207f1sm46286895ad.64.2026.11.22.21.59.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 21:59:26 -0800 (PST)
Message-ID: <81dbfe3f-c88f-4fcf-a460-ba3376d736e9@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 13:59:18 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/6] dt-bindings: soc: qcom: add QDCP provider
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
 <20261119-introduce-qcom-qecp-feature-v1-1-b1a730d2c57a@oss.qualcomm.com>
 <d0dd4fad-2f56-456a-91ee-737af0f3b4e6@kernel.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <d0dd4fad-2f56-456a-91ee-737af0f3b4e6@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyMyBTYWx0ZWRfX8AHTerAmoMbe
 0KHd5L0Pg9082FacU51yymHDtYCMhS7ilQ2puY2SlPcShuRPRgLqOJiJY4/a14MGv6xZezr9hFC
 HWxRuhPlbNv5nCkx+Vn8HoYcwBk2xOs=
X-Proofpoint-GUID: 2medi_pOkizP4e5EncJYDatnOYbOrDkX
X-Proofpoint-ORIG-GUID: 2medi_pOkizP4e5EncJYDatnOYbOrDkX
X-Authority-Analysis: v=2.4 cv=c9w+0h9l c=1 sm=1 tr=0 ts=6b03d640 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=uD7aXjGElm0TJE3nPE0A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyMyBTYWx0ZWRfX6G+EvFXA1WMl
 BUbgIOt6KA8PQzEvGtotijvOd6iTxfXTyxXersaFhz2FuOkJY9gz3rICvNVi20hBumE6DXfu3pt
 uf42la1EvFcv6wOqhfirUMEgzeHKwMcGeznUByzfCuEW4mIC+haPISH0sN4BwJG3sobgUU7U6nU
 Uzr0LRvLfgESpCsBuBGrFvzB0EQMMX51kPrxc6LYNigM6IkBLOrie7n1B4JTu9l10oLT1JJ5/+4
 CV/fo74bHZT+4Ab9yvX/B0ReOn+3R2RCJqr27v3vTQbwXYngEaxYBTVI5Ut96/KAQl3EyjDtiUG
 Lo0FjEN97Poy+bkLyf+6566+GGqQOBPUsvrcK3IL3fMw1MO2y27DBSDpIOvRVfvjLM/wX2mhqcN
 cMMKxxTLvHLfElGsVM1uHfxc5ySq/oRSDthOHQnTGv4qWGdYM6vlV3X0KrFm92oFOkg519BHgJ6
 ANn2nL1hGsY8IoB5lJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_215929_851864_5A4EB155 
X-CRM114-Status: GOOD (  25.30  )
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



On 11/19/2026 10:00 PM, Krzysztof Kozlowski wrote:
> On 19/11/2026 10:01, Jie Gan wrote:
>> Document the Qualcomm Debug Control Protocol (QDCP) firmware provider
>> node used by CoreSight debug and trace blocks that are owned by the
>> Qualcomm Embedded Co-Processor (QECP), a separate on-die processor that
>> runs its own firmware. QDCP is the QMI (Qualcomm MSM Interface) service,
>> carried over QRTR (Qualcomm IPC Router), that Linux uses to ask QECP
>> firmware to control those blocks.
>>
>> The provider is a Qualcomm platform/QMI service node, not a CoreSight
>> graph device. It exposes the qcom,qdcp compatible along with
>> per-connection QMI service/instance identifiers; the QMI service
>> version is the only optional identifier, defaulting to 1.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/soc/qcom/qcom,qdcp.yaml    | 81 ++++++++++++++++++++++
>>   1 file changed, 81 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,qdcp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,qdcp.yaml
>> new file mode 100644
>> index 000000000000..ee0a66b12dde
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,qdcp.yaml
>> @@ -0,0 +1,81 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/soc/qcom/qcom,qdcp.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Debug Control Protocol (QDCP) provider
>> +
>> +maintainers:
>> +  - Jie Gan <jie.gan@oss.qualcomm.com>
>> +
>> +description: |
>> +  QDCP is a QMI-based firmware provider used to control CoreSight trace
>> +  blocks that are owned by the Qualcomm Embedded Co-Processor (QECP) rather
>> +  than the application processor (AP). CoreSight-facing consumers look up
>> +  the provider through a "qcom,qdcp" phandle, naming a specific
>> +  "connection-N" child node rather than the top-level provider node, and
>> +  issue typed firmware requests instead of programming registers directly.
>> +
>> +  This node does not represent a CoreSight graph device. It is a platform
>> +  driver that establishes the QMI connections used by consumer drivers such
>> +  as the Qualcomm QDCP STM source and QDCP-backed TMC/ETR sink.
>> +
>> +  QECP exposes more than one independent QMI service (for example, a
>> +  separate service used by remote ETM/diag sources). Each QMI connection is
>> +  described as a child node of the "qcom,qdcp" node rather than as a
>> +  property of the node itself, so a single provider device can establish
>> +  more than one connection. A node without any "connection-N" child is valid
>> +  but provides nothing for consumers to reference.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,qdcp
> 
> Standard comment - compatibles are not supposed to be generic. That's
> why you have entire commit msg to explain any oddities or deviations
> from common rules.
> 
> 
> No resources here, so this does not look like separate device.

Thanks for the comments. I agree that we should introduce a 
device-specific compatible string with the corresponding match data. The 
instance, service ID, and version are resources specific to each device.

Thanks,
Jie

> 
>> +
>> +patternProperties:
>> +  "^connection-[0-9]+$":
>> +    type: object
>> +    description:
>> +      A single QMI connection established by the QDCP provider. Consumers
>> +      reference this child node directly via their "qcom,qdcp" phandle, not
>> +      the top-level provider node.
>> +
>> +    properties:
>> +      qcom,service-id:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        description:
>> +          QMI service identifier for this connection.
>> +
>> +      qcom,version:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        default: 1
>> +        description:
>> +          QMI service version for this connection.
>> +
>> +      qcom,instance-id:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        description:
>> +          QMI instance identifier for this connection.
>> +
> 
> Please don't describe firmware contents as random integers in DT.
> 
> 
> Best regards,
> Krzysztof



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339E6606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 02:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OlQwiKrU;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F9urwjAT;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aSH+LHH3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bcDBZrOIs3/hkAhonk3wtiBmEGG5IWT1pyC7cvmXykg=; b=OlQwiKrUEluMXj
	skJKIzVY6g7BEcOYTASjobj/hk4827mJpCYy79gMer2vRSetP8dSPZ3+VV76Xudo+XJbjdU4LJDxy
	XQn8sdPR71r4qLglW3GtSOjkuP2VY6fduQLCPWRb2sWemhQLZqTx0zJ3QMZbXGGf6m3iBL/d+A+BH
	0QtXc8Kk+BvwDZ1qRFJOVibcm5dC2xVKUhSOWA9ANq9LvQo1iBlDJewAx4EETfjYl8+6FrKPoTZoL
	T66o/3DdfCmdH6tz1Q3BTH2BjMBalTkcWcho503xf6fhRiK/PM9qX4/HK/ljjGRRYQJrdKFRUSDin
	A+YvrFGkEYVmqLqLOAUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQFb1-0000000HAEB-2dwY;
	Mon, 09 Nov 2026 02:58:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQFaz-0000000HADn-22qe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 02:58:58 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A90H8XS2889998
	for <linux-arm-kernel@lists.infradead.org>; Mon, 9 Nov 2026 02:58:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bcDBZrOIs3/hkAhonk3wtiBmEGG5IWT1pyC7cvmXykg=; b=F9urwjATAQ06/UAO
	sGsXrkVeRNVXWxTNHio7Tw4Vidu/HKUFbOkF4QPJg5zdvkAmmYUllLftBI+5z4rt
	ECr79qbERtnObxGJiGVHpj5uSngfhWLtx5IblCk9O0+QD0orYvT+WbERUhClYiM4
	XhRUhSO+aMW+tHgvVptIxtK5NK3WIkgS5J4tWaTXqaKJstQwwL+7Qnmh4FziYKrB
	JyCt4LIRabiKVgN1FMLmBNArhhgNo94+fyBeC0mbmCIQaa5tkH6lrUQU6ltMjzTN
	R4oaFa7IuZslaTGd3BrDvNJrWzPyH4k1gV3956OFlwKNIJUruxfUY06h2M03tVuq
	HIIG3A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsv2uccgc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 02:58:55 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b0a528ca65so488870a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 18:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794193134; x=1794797934; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bcDBZrOIs3/hkAhonk3wtiBmEGG5IWT1pyC7cvmXykg=;
        b=aSH+LHH3/VSWmanSddONUht/GNJV+XP3qiMTpN1G6esFV3dQofmH9o/lCGOx9RBKYp
         +am973zA1tIGdqQzN5TqgXzRs9b3FwxD2mGe+8O6Oq5UuDG1xSc10DRyoBEaUruFGJ+3
         83Vmfrz+3CVvv4TjSNLzEdKN+DgBeV1bA+xedbOnW3htubVnRI+WTcn5anpqvRk6ANe+
         cDgDZ68gRLuC2zgJahngiiGFDfaGK1TNtqeO/fSMOt6bHlNrOTpjDW0Bma2PlVAiRBEL
         OP95bGcJz39vRC6/sQyDpUV76h82Cd8TfMwUshbmbFgcJewqrEfLbH9oCDioU0UJM+F+
         WLTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794193134; x=1794797934;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bcDBZrOIs3/hkAhonk3wtiBmEGG5IWT1pyC7cvmXykg=;
        b=ddzpKx9/8wxqa2gIQoaZiFYzh3AJjrm74y6Av4AZpYhHMveF0z2JLmnfyaPw/50V87
         uR0+cc8Eu9xxgv1kZSh4RKAKwxDgVE1st1EDlaB90Jx8WFAM5LtVubdkEFlCVDceHn6F
         cDXYfl4RzQYmWUmSERgOri34wU7sRyFPdySN6sM5ga0QqkgXZ68XSmSEj7Ae9Bzm/9Ka
         5Hk7r8IaQT0hR7fTfXm4N3dfHEo/Gt1dlKIVQjC87ofkg5I3h9/2Gh8gLOn9DuQCWtTR
         yGH638vnFeN3iTW2q2VT2x/dbDwfsjpIn/ipBIinKLnAp2+uQaZ3adx7oMKqFMspf5tW
         ZftA==
X-Forwarded-Encrypted: i=1; AL+hErEOWO/kR2r2iWil/bKyvb0TY0hfO599Z3eJgnFZEz9s/dfgzvIdr3UQdrVlAtbUQ/gSB0r+6OZyIWjFSjtTaDzS@lists.infradead.org
X-Gm-Message-State: APuU4Z8TpjlfOQysyknzqEA9gNjv7WmGlhtxvultgp0wOqeuBG5pjH4d
	e4uZzge6pZevYTrHGLQ0mWHcvvAWyHxDuOnAT/2S+l0kH4h0RoeHZ76KMTyB1tb+kCBzLg1KRkM
	7Yk0/uj2yaTHQgvNUeTB7GCxlrbwcuMXk23XdlbpLwJdfFkxZsM2fRbMshEgYdfRSa8fnJYDSlt
	w66Q==
X-Gm-Gg: AYBFou1yUW3ulHuncdCtG4pQk5fjyRKKHgPB3lluyUv1NVCoMq1YekaBxQ0MI/wuUY6
	dtf1ZrCSrm+RCxDu/nV3WpHUXUayYI3H30RJCGVmp5reGCjpAXxPT4pz7Is4APmW6WSJDZ3VjOP
	+UyFY4OnuTGkeQXH/khrhD0KoG1PA4Rz0URSJw+ayGmFaR7YkASa1Wa5V/qSScm4a9mljHGpUGu
	BKjV9D28PDhPt+yczxsazvyI0kJDgY68cWgVBIiSITRBYivC7uvchzlw6Vg7li5NYCP7clUBHsT
	U6UVG6+INTAjMMLUJEyF9Dfr6sChMS8VuYHMRB5RUoVPHxaUaxAa8ggM+wEzOagum3+nLY4EIUM
	3cVsOw+Z06Vpy64qL0gUlw0x5ZEyADBCiwQIIVNHUuOGF9zOOtHzhWTlBGUsDbZs5guhr/WV79A
	bOrXk/YRdd7suSfbMDO6E3Y5CmFUdKJQYzVVTG
X-Received: by 2002:a17:90b:540c:b0:3ac:9176:e837 with SMTP id 98e67ed59e1d1-3b12d5b0390mr2589429a91.50.1794193133504;
        Sun, 08 Nov 2026 18:58:53 -0800 (PST)
X-Received: by 2002:a17:90b:540c:b0:3ac:9176:e837 with SMTP id 98e67ed59e1d1-3b12d5b0390mr2589410a91.50.1794193132989;
        Sun, 08 Nov 2026 18:58:52 -0800 (PST)
Received: from [10.133.33.176] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b105864375sm9085247a91.4.2026.11.08.18.58.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 18:58:52 -0800 (PST)
Message-ID: <a645f8e5-302f-4f57-b482-b96eb4fcede7@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 10:58:48 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] arm-mpam: Add basic device tree support for
 resctrl
To: Rob Herring <robh@kernel.org>, Ping Li <leeonion.muyu@gmail.com>
Cc: james.morse@arm.com, ben.horgan@arm.com, sdonthineni@nvidia.com,
        andre.przywara@arm.com, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
 <20261104081302.304667-1-leeonion.muyu@gmail.com>
 <9d370f12-9e4c-4b80-9d28-ff8085ce3aee@oss.qualcomm.com>
 <20261105055347.947416-1-leeonion.muyu@gmail.com>
 <20261106150822.GA3193214-robh@kernel.org>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <20261106150822.GA3193214-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 18W14oa19X55TvD5VVz3Vfrk-U0y5lC0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAxMSBTYWx0ZWRfX/HcP0qsIwa0R
 aJh554H9xyWQLBA5nDF625nGcCETy1ZhknMGL1uk5szF+YqIv5r9FEjD2OHTOMr/Q7mPIoniHMB
 rDWL+508HIOhYoFpykKfHpDyXTWnCBM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAxMSBTYWx0ZWRfX5qsMwoH5BCxa
 j3dCo1Q5wNVxGy7FJg6Ac5E1+JOMrYCyL5IFsVD7ysdBazvxOH4a0OtwC6iIJ8aHXlwtcQPM93E
 fGD0AI78KWgx5QXtXVp/26vv1t6V9Enf1A3ez7Dt05wKBuoWsO7391IKmgM688K7o+/hYPcF0j7
 DPj4mgQ9Wq02Rbhp0z7SRqxU7iCG1anUhwhj8ZzIbx2zK1Crt43lS0j1VxRk+FXJgfA3QHv7Ltw
 7oNSl8L31SAC2TG9edGL/S2xyCoJ73UeYmNmpUspCiblkUzTOQ8kkuFjkNKs8R8NQTNf82ADEyS
 /Gzp4OpxISTw1w1aG8WblXQi6k5FeK1t5bFJHqwOrbETGY7Lvzc0QfMHWejS3R5EnSpPsl6m2bN
 Y8aizLLZQ6ARVT6d2pkJbRTbsUl9VyKiqr/AU2hYXJLWOZLAReTU2FAWFZ7o/97bqg9gAk0HG3s
 rkXmYyVzXc2ZOv2jVBQ==
X-Proofpoint-GUID: 18W14oa19X55TvD5VVz3Vfrk-U0y5lC0
X-Authority-Analysis: v=2.4 cv=f+rdl+yM c=1 sm=1 tr=0 ts=6af136ef cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=aeo0eiRZ57vjQv3oqWoA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_185857_655410_EA61A29F 
X-CRM114-Status: GOOD (  24.13  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/6/2026 11:08 PM, Rob Herring wrote:
> On Thu, Nov 05, 2026 at 01:53:47PM +0800, Ping Li wrote:
>> Hi Yin,
>>
>> Sure. Our memory controller MSC is described as a top-level node.
>> The MPAM register window is mapped independently in the SoC (the
>> component sits on the DDR egress path rather than being a sub-block
>> of a memory-controller DT node), so the node is a direct child of
>> the root:
>>
>> 	ddr_msc: msc@2238000 {
>> 		compatible = "<vendor>,<soc>-ddr-qos",
>> 			     "arm,mpam-memory-controller-msc",
>> 			     "arm,mpam-msc";
>> 		reg = <0x0 0x02238000 0x0 0x1000>;
>> 		arm,not-ready-us = <10>;
>> 	};
>>
>> The first compatible in the list is for our platform glue; I have
>> replaced it with a placeholder here since it is not relevant to the
>> binding discussion.
>>
>> Notes on the properties, in case they matter for the binding:
>>
>> - reg: the MPAM register window. Only a subset of the architectural
>>    register space is implemented, so the size is the truncated window.
>> - single RIS: the component reports HAS_RIS=0, so there are no
>>    ris@N child nodes.
>> - no interrupts: the component has no MPAM ESR block, so there is
>>    no interrupts property.
>> - arm,not-ready-us: 10.
>>
>> The verified probe path: the node matches via "arm,mpam-msc", and
>> patch 6/8 in v3 classifies it as MPAM_CLASS_MEMORY and treats it as
>> accessible from all CPUs, which is exactly the behavior we need.
>>
>> One question in return: with the node being a direct child of the
>> root rather than a child of a memory-controller node, is that a
>> form the binding should cover? If the binding expects the MSC to
>> always be a sub-node of a memory controller, we would need the
>> top-level form to be allowed as well.
> 
> This would be why we're not upstreaming the binding without users. We
> need actual h/w to validate the binding works.
> 

Hi Ping, Rob,

Ping, thank you for the detailed description and for confirming this
on hardware.

To answer your question: the top-level form should be supported.
Unlike cache MSCs, where both class_id and component_id are derived
from the parent cache node, memory controller MSCs derive both from
the MSC node itself via of_node_to_nid(). There is no requirement for
the MSC to be a sub-node of a memory-controller node.

Rob, with Ping's hardware-validated use case covering the top-level
form, we would like to restore memory controller MSC support in v5.
We will use Ping's DT as a reference for the binding example.

Ping, a Tested-by from you would be very welcome once v5 is posted.

Thanks,
Yin


> Rob

-- 
Thx and BRs,
Yin



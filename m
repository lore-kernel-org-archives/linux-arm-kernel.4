Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC188606A332
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 09:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wJa/1vg3;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fjJFyaNh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J05FNj/A
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3swutLSFvBISsC5bdMMauSRcUcq6pG/QsuKifyeeuiU=; b=wJa/1vg3XNVq38
	8oqJVkNh6RVH0c2m/w42nC7Nz/4pdEHATeKutwWG7Qdb1tQcp/HnrnY7pT6pd1rnGIjk9k09PEnDv
	ebh/IFjh1zTzJInyVCyrJ/1IMaCdmXncER699ALk1g3NSAvXGn4HyBnHNxWw1dT9pn1wvqmF97WgE
	TnG6ifQ+YTgEIQloXwI6MEYb+CN1hz7sCAYGzyuH8I8K4XsJybTfOAUUC42SC4Sv0OFjSKG5HD1C/
	WVzlLhkBEhJkSzpCD7F7xYw1U7+D5hYEMTUmXGBe+1bcxDADJJTAyI0iGfIH9yx3cFE++Jb/+OZ0k
	FdcY5g/Ki9cNNVDC2dyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4qd-00000006E3H-2hPm;
	Wed, 11 Nov 2026 09:42:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4qb-00000006E2V-0zc3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 09:42:30 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5KeCw864271
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 09:42:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3swutLSFvBISsC5bdMMauSRcUcq6pG/QsuKifyeeuiU=; b=fjJFyaNhFfYeQIjf
	f/cqmsW8Bg4Np3NHwE6PaLnBprrlk5eLPMFsBnLyEFjma8tPaQQ7tuYvQ8Lbiuca
	eIoj7nlaZkqiHVNWaW6Unz6kq5hGmT5QL3Sou8T5UdjQHKoeRBi4jpRoLVTwS8JI
	BBsfZSsLWtXHKl5lP4bwUGtVlRqeSGYWWSxO6CcdF6DLPSo5r3ctdjmWeODPoM4z
	Oc0wUx6M8N7aH3V+fq+E2us+OIcnWqEDkJZHeUW9Rk4he7oIeyZ3D3ybSIOwZjVy
	IUG1OQ0E8IEyT5sHR3EhWPu1ngvuUFigMNZZwwSazKDRxzva7U0ZpP1LC1hRqrxQ
	L9wFHA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvfawhj2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 09:42:28 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e95f8543c9so41706815ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 01:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794390148; x=1794994948; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3swutLSFvBISsC5bdMMauSRcUcq6pG/QsuKifyeeuiU=;
        b=J05FNj/AU0QcyO9ojaPwtdfCxAm7pNisksZYthzHQwjpoSUVO/zgbN+E0YwtUOPN6x
         RWwTpWPAV53HoHZIObuJIgmTV7fbca+OQf4MAhYBm13fCd21KNJ7ZN8lr4pF77e0XbNq
         zoajigCOdVJ7LArHbRd7wkrt3ik7Hvkm5nDzR1rXUrcm0Gc0EJNsJeVbfIQOsrGs7Ngw
         E6YrwfMiywLrOItxr5H0S5IkVS+aDVa5TGFrRMjkSIAMGB1EIgJqM9D/ZoqRLTcB95IG
         CvLuJwycUaAGH9ex+i+p3mhMvcCGdEBRYqCVeqzqrp0fSW/LMudn3yf/lkSMVQQW83cY
         QwPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794390148; x=1794994948;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3swutLSFvBISsC5bdMMauSRcUcq6pG/QsuKifyeeuiU=;
        b=bbf2xRHCqpuKSdrPjA2+mbN3eYGWqesrEWT2cKk7Fj8AbL2Lq74VpbNW4V4htU/vmb
         oRYzAnkcDgkPLjjtTXdX6NVqgm6lC5YjDH45lzeYDJyLqc3P4ZZBCkZLQbs0W8l8YA+L
         RbnUJRapamkD9/o6X4rMwI8YcuNr7/+6mFl0zpID/nuYsVhH8ZkClzg3+aBSF1UPJha1
         nR+ptxM/Fmia9oT66SQpcFWBAgYMCrwu0aFWMDxyzvXY3Ncp6fM7Um+/1Rn0Z5cUET0t
         HQ9WxBm5X0LRPKLnAEbpWIN++V8gm0rtznQLqZtKbmpQpukxuXWD3vPbACTdDqTati6f
         6Z7w==
X-Forwarded-Encrypted: i=1; AL+hErHUJ5pKgA9pDHfzwL4N+mJ9PidEl9oAg/b3QTgVSNUvD09YvWwoIjZu4QNFeWKydtb3LVr6OgKj1teAVWriS84I@lists.infradead.org
X-Gm-Message-State: APuU4Z8y3MLHIfKjZerdAM6ev9E0yhOvBxGCK+KCe84WfkaQVnZL4+kD
	cDly3LS2wmonkSvIGfLvKy0YV9cD74Eu5gFdib+l3bsWPTbV+9P99iZXHHmbOiHg9svpLm3Xe0G
	llVCQ00teB4t0+9l6ylA7mty0WJitSrB/W1x96s/8mpeLQNVRoA8ojxyOfr5FmcddX6AjMtcjRa
	806w==
X-Gm-Gg: AYBFou2gTtRr6Yq90591CDqZuZ+86UtKaBze8vVh10mKckKsIQReSR9/e39KlPmVBaZ
	VsNKgUDvs/ycuFGmk481AK7by0Z3H+CCmqmnJkHeiibAowECqAUJ2GMvhzinAowPJ9VZ8xmfc81
	L+swneVItiZgQuvf9+wo1hT3sNrpCraOF9yr9/VgMiG2l3Nyi5B7kPO5NH/9TZ/H1q8rZgQFVBw
	1frR/WIO5xnvBUn6r3/ksO+Q2y6jChv0cUl5NgDCkXr/LA/ckkxZstJ8neHnbsjQANcqROEWjNM
	JP8hXRALCOkWfS3qCBI3p+xWKTULdYnih/1332mGcjGSJhryd0kt4J2iO2d+vNllMwYR0gyJ6rE
	+ZqBgD1YvasxnQJwZtZntkRGEt/QXcK9dO8Ii+xNsz+B6QBFobvsByH/la0F4/Xm1JYU4VqI0Jg
	MsGin0Ge2n9qu6ByiDdmd3KeQ+r+LCf5yIK5b7OA==
X-Received: by 2002:a17:90b:1646:b0:3ac:4e18:237c with SMTP id 98e67ed59e1d1-3b182d5e478mr1994768a91.0.1794390147720;
        Wed, 11 Nov 2026 01:42:27 -0800 (PST)
X-Received: by 2002:a17:90b:1646:b0:3ac:4e18:237c with SMTP id 98e67ed59e1d1-3b182d5e478mr1994754a91.0.1794390147211;
        Wed, 11 Nov 2026 01:42:27 -0800 (PST)
Received: from [10.133.33.237] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b182e0ecd3sm1254717a91.3.2026.11.11.01.42.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 01:42:26 -0800 (PST)
Message-ID: <f8911f68-ee78-4eb2-b7e5-1e879224091d@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 17:42:23 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/7] arm_mpam: Add support for memory controller MSC on
 DT platforms
To: Ping Li <leeonion.muyu@gmail.com>
Cc: sdonthineni@nvidia.com, james.morse@arm.com, robh@kernel.org,
        ben.horgan@arm.com, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261109-mpam-resctrl-dt-knp-support-v5-0-150335a79381@oss.qualcomm.com>
 <20261109-mpam-resctrl-dt-knp-support-v5-6-150335a79381@oss.qualcomm.com>
 <20261109112737.1081437-1-leeonion.muyu@gmail.com>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <20261109112737.1081437-1-leeonion.muyu@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzOCBTYWx0ZWRfX1V7A5t9sNk8k
 uziNlkBw42WffLtiL2B8XrsXIiqb6BBVtkTx+MNNAUOyr0mJsR2VXCnrfFEoyFt5pHvKcPNAh28
 IYGDuaicjyaiHCSQbMlOEoRvE9ZuqNo=
X-Proofpoint-ORIG-GUID: wAuxzbfOXKLJLuItomAOLPd-rwbZez_m
X-Proofpoint-GUID: wAuxzbfOXKLJLuItomAOLPd-rwbZez_m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzOCBTYWx0ZWRfXy8Gy1K8fRFEr
 rD3cxmz7F71ZyXS00UkkSjUOSTshfNYIn0OBLV+PzA+X4btAkkoJQ2RrtOX9MbhzKG5SRtL3mRB
 ES2VVlnBhM4NAuSfdVxJwzT4L4+ciyyiPV4TfuP/0Z6Pck0ZxP51UEnySZovIq/GtzhmgR1zQjv
 Xq6nGhsnWKHvkVGPDea0eAvkCqAeyeXEHXrRrGMLKenQim7xSsnl4MTIwObi1dXFjYfyc+LZzS1
 DLDZyJOlTQOv13vz5SWeGNv8hv6OxT66ST/q9wqSkzUqIqzbmG80hwKvxe6T49wyId7XgMcjRRp
 fo4Z3FpwQ3iS0yBbaXnVbFk8pHRIyWk2qqufulu8Rj7kd7Vi3L62pdCgIEdfe3EpEhpqPcy4WyO
 GtUF9yeMKZ27LdmPbLcjKdV96KwlrpfBUr64t//2WEYwve+BH79Rj5Qmus2lED6+WdSVdUuFZRm
 A2FwE2ORmnM3PkTH0HQ==
X-Authority-Analysis: v=2.4 cv=CZadd7rl c=1 sm=1 tr=0 ts=6af43884 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=dT42ApTGJaDrCQAcAPEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_014229_280855_3314087E 
X-CRM114-Status: GOOD (  12.50  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/9/2026 7:27 PM, Ping Li wrote:
> Tested-by: Ping Li <leeonion.muyu@gmail.com>


Hi Ping,

Thank you for the Tested-by — it really helps move v5 forward.

To help the maintainers evaluate this series more quickly, could you
share some additional information about your use case?

1. Your SoC or platform name (if publicly available), or a brief
    description (e.g. "server SoC with an MPAM MSC on the DDR egress
    path").
2. The typical workload scenario where memory bandwidth QoS is useful
    for you (e.g. isolating bandwidth between tenants, preventing certain
    workloads from saturating DDR, etc.).
3. Which specific features did you verify on v5? (MSC probe, resctrl
    mount, MB allocation, mbm_total_bytes monitoring, etc.)

A real usage log showing the memory controller MSC working through
resctrl would also be very helpful — similar to what we have for the
cache MSC:

```
root@qcom-armv8a:/sys/fs/resctrl# cat schemata
     L2:0=fff;65536=fff;131072=fff
root@qcom-armv8a:/sys/fs/resctrl# echo "L2:0=111;65536=222;131072=333" > 
schemata
root@qcom-armv8a:/sys/fs/resctrl# cat schemata
     L2:0=111;65536=222;131072=333
root@qcom-armv8a:/sys/fs/resctrl#
```

This would give the maintainers a clearer picture of the real-world
value of these patches and help speed up the review.

Thanks,
Yin

-- 
Thx and BRs,
Yin



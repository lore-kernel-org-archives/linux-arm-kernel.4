Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECE6606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 10:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Rm7lTo6R;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jS7ny/6q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WLME0dKS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RqcvkgLNWHv3eFLQ7yG1O5kVrzbXHZN72He/8a+86Tw=; b=Rm7lTo6RSx7rEz
	NsSoPQiKHJNJhjxD8HH5EF/bGcCPn3BFwxyoGDydi24tBkUEYvCTxCVDL5g37PlJCKW2j3I93Bf8S
	Sc5V8R1aKpH8ReKRh/odNLqBUsOsJbfugrDZOq6eyowMj8tO2si411t1KQNHWFjzRiO3y0z/c+0kw
	I3BHUFXpZW24Rstk9SueMKOdyJYsPcij+e+k8BTo1onzQMLKVcNg93h1goLiDr0Al74S+YBEplPwA
	GummfkXCqg+6Afyc2T9tQlGSAKqWc6Kn0u84vbGTKxGnSM7fnWpnyUg/2x7RTDg4dc+O+64AvEz0a
	NxY7PajqgZ826I7wDpEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9wj-00000009Ppb-1zz6;
	Wed, 25 Nov 2026 10:09:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9wW-00000009PkO-2RpK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 10:09:37 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mESt2121147
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 10:09:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RqcvkgLNWHv3eFLQ7yG1O5kVrzbXHZN72He/8a+86Tw=; b=jS7ny/6q7SyV2157
	5RRY0Ley6gMiHuKIaJgMVUnISyC+JBCpAMDByWRouE4qasUBZpb7qqnBHiVpb1wl
	qX8TkbwT2Ykf2qX1yID4XAdtx6sWRG2ADFq62B5thd6314HWtebS9wYOjHx2Ylse
	+RS7l7z4RT7pc0Pla//d1dud6Fk3T/R+nzgx3UtB5dDDx2CmAr4WJBbVYQtCpffY
	gP+b0cSOALZlTQM5XdCUbkfL36wRibnyFgk/nNvtP7lJS0FmzuPsKIjBSzhLSNsd
	AMimtGSyctakfpV5ZsRg/47231w+y9ZxUapYHjLDInG8SXcPrkV1809Ig2OkNZ7J
	FDL7BQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vukr9eu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 10:09:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-55b9c41fc3cso16876121cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 02:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795601375; x=1796206175; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RqcvkgLNWHv3eFLQ7yG1O5kVrzbXHZN72He/8a+86Tw=;
        b=WLME0dKSYbCPjBaw8u6TsllMTnNPZayYmgOGBTdMahoxAD6QQVhOLJdNKA6Ld5H0Ls
         Wnelcsn8A6t+jhex/Tx8Jn2XYiey7bTa/pGUOkrOyZ+0hE9AdsNV7O3jV5yyKbshLM+n
         1NdIl6EnQMyw/Av63/GbPv3bWJYsz2fR9L0Px/D3QUldjL9Q9LOPqJ+295nGL012nPX8
         Q7Bm9FCuh9nyGvkAf6b4Jnkx60N528dc/BFHivgVolMCxgpsY4WpLV9Rza78ZkiL08nz
         Hg+ib286VCqgaQTvJKjhjOHP1BoljRcuckXe+IOl+NBwzhXYuXw7o3U0RrdzEfv/pWNj
         2k6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795601375; x=1796206175;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RqcvkgLNWHv3eFLQ7yG1O5kVrzbXHZN72He/8a+86Tw=;
        b=VRzOzjHl8oxPY7vOScEdPxcYm0POLUmuzTmyO29zeiOyJimpZm3ivDePiI/XWQ2WGj
         Tk6I/n8idrGCQ4XYt307sDBlFcYOIdhTfqqbVTdxe9ABzgVMr+o/4ScuJ5e35/1PFC2G
         O4wfsRsNDBd2i7ciJ1BTdBHgJe/J+YkNaCmzW8MZ91QSPOnpv7yFSgrkqRy9KqgsDVq0
         3+4rFqVipVfPj9lGdzDVsYxvPAGGvE8VX2fK3koIttesog6mhKkYozSANlvpXXXxJUlD
         2sqG8csObxbZZaw3Iqo7xPvPAfqYy/x4Y9+vXoqMqcAdPtHCZUcPDzQC8rBoOrR/iYVW
         EGQw==
X-Forwarded-Encrypted: i=1; AL+hErFeLKRTrsTpBrik9OOpqLSl8VosACNDo5b4J60ND3nm/eBgbd21KjviSS1heak0Xte7xqHPYKjhgrTV8WrGgfxD@lists.infradead.org
X-Gm-Message-State: APuU4Z9iHecf1w57R9LV/Len9ikU04bcKxTHxtOVYEqWpH/Gx0Io6Y1d
	uXceoyNmsJhvNp7Lfk4+6SvK3eRSI7NUjeWOI8qFPYT2+fPRbzLqhjdoX2ACqP7Z6I6/fGdkNWK
	7GiYb0HUoXuQGcj4zCCqQs6jiNvqkD8QbzCAtc1znHIbw6GA/oF6I6P88IdofweMMM8gBH91A37
	KYgQ==
X-Gm-Gg: AZFdTZcSIFOzefGXd/tVLfhzQ3AhZuQyI4TAGUWtZk/RWdTkCoVjOG4RK/WUsWYvx7p
	uEXjSRI6H1zICDhidaGHOVy3MUGpXM+tUsoKoREoXd9kHse1GYuEnLsejYkoVyoGGbWiYW/PFev
	2awY6dM6vpWnWdNXCSLzJCPpBzE80PJBR4JjKfDVulX7a/E7OdjLYYLZ4wagMR7GbHtWB//hR49
	9kahnhEk3NMIM0PpnNZwBeL133Bk4jHWJzVzVsB2Izvui9hIePiRt/wrph12gdTmLRKQujgp7fq
	rBAzx0d6X2G+zHpB10+sWmm99aCpy/QD5JCnYeR9o4Gkd6y16u1sOMtIg/jkiBNb7xeXAisNm2I
	9YpUna7v2o57TZW46n2v2pEhX4jihXuRT3OCgXAv+0Lbi3AwjLrc5et0CjH9nv612w9RGU1E=
X-Received: by 2002:a05:622b:1ca:20b0:55c:2657:9cb8 with SMTP id d75a77b69052e-55d76b1a306mr306683581cf.5.1795601374634;
        Wed, 25 Nov 2026 02:09:34 -0800 (PST)
X-Received: by 2002:a05:622b:1ca:20b0:55c:2657:9cb8 with SMTP id d75a77b69052e-55d76b1a306mr306683191cf.5.1795601374194;
        Wed, 25 Nov 2026 02:09:34 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc42bbsm608990966b.61.2026.11.25.02.09.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:09:33 -0800 (PST)
Message-ID: <0c37bbf5-e677-4766-bea7-19b02830c91a@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:09:30 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: qcom: kaanapali: add periphid for
 traceNoC
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Rob Herring <robh@kernel.org>, Leo Yan <leo.yan@arm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
References: <20261118-fix-tracenoc-probe-v1-0-0298dc5f05ac@oss.qualcomm.com>
 <20261118-fix-tracenoc-probe-v1-2-0298dc5f05ac@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261118-fix-tracenoc-probe-v1-2-0298dc5f05ac@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KfVHIgYD c=1 sm=1 tr=0 ts=6b06b3df cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=RthPVecxuDhBgGMHIBIA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: NxhGPjn8hKrrvYExfJuUzVL8YEICxX0y
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfXxJYOQR+17YAb
 im1CKZgEckyH1LO/tm8OKjw0ia8JTvlfvHw0vC5JHJiBwUfI1qidErd5mgzCC/EGVhBAfHltNqv
 UZ60Tf/eruhzCKjWq3rl5WXHYpQDvwU=
X-Proofpoint-GUID: NxhGPjn8hKrrvYExfJuUzVL8YEICxX0y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfX2BbrXrYvzPnn
 nV06+8RU4nkmF1JDrOAQexxkjmAlvU1bSJEgZMYP88WEfKBVQUHahrBJ6ST0H7ctKuPud7Nb76x
 GT7qHICqDlK9A0lKUxDESG9kF1Jy6ZajXyF1QpRBmGejdDA/xamx4bamkrTIuVxr0JF/qNGBzQ8
 E5agBh5qwh2D882KrL4hC8RtktrEpG1El0A0n7IzBBc/wqx+RUYLTt/4FUk9Ft7SSnrMtE4R0Wk
 zaTJ9ZQTDF/OEGe19ZbSR0s7xkxtRYJ4KfH+iWfidwSqIJXymio+xSAo7ukbxWB04H2E7qouDKL
 YZy4y0Sq4f+rzmK0LsBjolYZTy2vajzJLmCVeZsSb9dS8a8cxRgkRP74SRGb2QAxyUoX1J+psMn
 /inx0fByPv//2yaqSnGKBTZdQ8KZf+tdxxdPrtd16mO1WCSvoda8GHSDlaQgiDjGu3twlZhsSxe
 qSEN2eBoIZZaiy7XJkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_020936_743746_0FBE906D 
X-CRM114-Status: GOOD (  15.64  )
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

On 11/18/26 8:01 AM, Jie Gan wrote:
> The traceNoC node uses the "qcom,coresight-tnoc", "arm,primecell"
> compatible, which places the device on the AMBA bus. To bind an AMBA
> device, the bus reads the peripheral and component ID registers (PID/CID)
> at the top of the device's register block and matches them against the
> primecell ID. The Component ID returned by the hardware is 0x00000000
> instead of a valid AMBA Component ID, so the AMBA probe fails and the
> device is left stuck in deferred probe indefinitely.
> 
> Add the "arm,primecell-periphid" property so the AMBA bus uses the
> specified peripheral ID instead of reading it from the device, which
> allows the traceNoC to probe on this hardware.
> 
> Fixes: f73959d86c15 ("arm64: dts: qcom: kaanapali: add coresight nodes")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


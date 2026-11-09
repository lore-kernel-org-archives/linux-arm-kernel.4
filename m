Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9DC606A320
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 01:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lEGkKCES;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cP/mT5ze;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZD1f2U3I
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rNNvo8IgFhtBrUlYa/0+5FIgAjOkgKbqqO+l2twysMM=; b=lEGkKCES2cXXt5
	9jvnm0Jjo1Bhpkt+ehiVFdmjzz2tinYBSjcF7LDxpjI8DH0BQva0VPegufGzqINlgSvmnPn1SmHZw
	u6ZX7IDIsop064KRN4706m51QJbibacVTIM16YlJShzC5CItfc1F/hOhNnmV+UzDoIuP4o6vsuEhx
	ly2OPvVUmyYGBOcTszCf4orUJA8wn4d+1p+BVlTMhR0UYmUv3o4or6Q4GFpRYxjNRd+xOow0vWmiv
	YBMjsI2iZEXoiAsjVnUtMG4cRzw2V643ltqHRCCxLj6c0OQgyxwkjArJQbgg84w4tR1Zxe8HhR8CT
	O8qWEjFpzDWfOkFg9wlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQEFZ-0000000H3zl-3708;
	Mon, 09 Nov 2026 01:32:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQEFW-0000000H3z4-3R0m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 01:32:44 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A90HLGo3503708
	for <linux-arm-kernel@lists.infradead.org>; Mon, 9 Nov 2026 01:32:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rNNvo8IgFhtBrUlYa/0+5FIgAjOkgKbqqO+l2twysMM=; b=cP/mT5zedeMXbYdC
	+YKh5Mv69zJgx7Xcvr9wBoqHGOjGMMpdXCFcK2ubnX6gXRLiHi6eAtRZ1ZJPqM+z
	uib4ntnUZcHVWXpBlagYTwGWernRnxBP+kttd2VSxAk9j8iNQI3w4Mx74JRAG6G+
	F+GZs3HGibiEV9C6lwOxkn2/TBvps8dHAPdbobrzHzLYRr/ujQx9RTs0k+dLN51x
	2mtX3aMtvXCLrWYxrDlaNyne6v2X5Uj3MQnkWdZ2wK0sup7wgx08X9CjwCtO0w0o
	FoTlosSgenjNM7d55i1/7wz47upPK3trPpnFuQ6p0vrQzPV5rKZiD3dNC+zQ8oTS
	VbFgKA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4htuqm11bn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 01:32:41 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ed08be1c84so6152375ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 17:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794187960; x=1794792760; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rNNvo8IgFhtBrUlYa/0+5FIgAjOkgKbqqO+l2twysMM=;
        b=ZD1f2U3IilgSuLw6kf4EeFzeQK2STk41v4GvNXrXNS3rkcK8gY8d80oPXqAwX2i7+Y
         LuuG0nsDcI4FfYKWuVQiTGsdHcWKt8cXOAsdsDjxZ74g0/Vmrdche7wB7sGyhocKEpB9
         MqyefFlwxasfkhp7GNMqXldzgTN2dCrOmwJQJMdgF8+cUyN8pB6UIrGU0Fvpu1dJDbIh
         2fz+Q4npHp74UcmxDFe/enjVb6uGDGDpIlG6WP+idLGowRy78YvNxupa7mEquc9Epjrq
         XVjR1gT6DntjLEiekLpsCgvXvoPxs6dlidRSldF5xyOeMHFPFj/w4cZj41amlShMCLsD
         ZUPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794187960; x=1794792760;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rNNvo8IgFhtBrUlYa/0+5FIgAjOkgKbqqO+l2twysMM=;
        b=hyWgeijEj3RPH04dw/NRiRRY5lUQyCe1Bkc5vY3NwfQeTlzbA+WekQodl81wqUuDt7
         FarjCw5s3gqPpVuO0VdKU46cZcg5KZFieIjXLoHDgPLkKvSkojDprsh6P54/cfctfgE7
         jSMO06LmdVMYZZCF8y91umBwdj7BU0qiJ0kxprNqOVARWNaHkEnYR9WKkQvYEEepvjBp
         jSX+8g+2GfHLVVDz99yHr7Ocu9OVowX3gUpDpdD3H0rZJ7412yxqsk/9ZKdQwAhjbAns
         NhbCowFJUXbQKCyI5gMl8+J1YOVhZlN+pIItQQRgdaBaktIa2L/gna/MPTnlk6w7Y/UP
         NkXQ==
X-Forwarded-Encrypted: i=1; AL+hErH0yLSpYwznO4OHwgypb32aEsl9uSGJsXHO3cye71hqxeQeMVlmTIKnUek5gEcjKwuVXaWbScEeFpnq+oVgTsoz@lists.infradead.org
X-Gm-Message-State: APuU4Z97zZE613rLrOWxXa3Z/Bw/NJt9qw+OsiYwl4hp9vN+JSv97bpx
	PqhbLnlcggQE4hQhoYO0gDuUsPlgyDqIvdK4ByJKcAn47/3zYN8j0EvlfMHZVzQgNu7dbIR1wFt
	wWozJw25K7a/8PoZeHbafUm93uIE5DE6ACPdmu5oXaeHfLOTcSuzyGO3MlaYvcJRG8y8sRak/qw
	QD5w==
X-Gm-Gg: AYBFou2hOqarmMmc6vvAdwSq7qkZqj1OhaOXpBGxh1qGExV0YpqiBCf4H8z0gYhee89
	xodhIhbJ4Jp2adFcIvhPL5AgpfBIijoGnezu04VLZtd7vN+RE+tqKI2IIzarGp/YUsslC3k4JJp
	lIK+VWQOiMXDfuB8Aq26pJ7wA1H3HOYOBMduBmlR3DyyfEcgmaE4inOE2lYTX/slTNf0G0WiBC3
	zGlmBcwlZ5dJVdiayqqEo/zimV1kaJu2HO+5f+szv7tB+wEFk/JLZRC3M3NQSuTI/SQYvTcbsJy
	5QH+YRNLbjMnVJufG2t8stz/6ArFk/2QAg7uLgfzsCRvqhHj+VW8CgeavVROVV++VzXO1BHS4Ds
	GakLXkXkPauVGGc5j5F2bWuwBhF61yOtLyL4pdJk5hY9ZhxJc7/V8Tky3fjckXLhS4yz6
X-Received: by 2002:a17:90b:4a52:b0:3ab:4f1:4f7e with SMTP id 98e67ed59e1d1-3b12d441cffmr2288712a91.28.1794187960380;
        Sun, 08 Nov 2026 17:32:40 -0800 (PST)
X-Received: by 2002:a17:90b:4a52:b0:3ab:4f1:4f7e with SMTP id 98e67ed59e1d1-3b12d441cffmr2288698a91.28.1794187959823;
        Sun, 08 Nov 2026 17:32:39 -0800 (PST)
Received: from [10.64.68.243] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b127712abcsm4777238a91.1.2026.11.08.17.32.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 17:32:39 -0800 (PST)
Message-ID: <42ac8b93-d8d4-464f-a834-89303db792ed@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 09:32:33 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] coresight: Fix clock refcount imbalance on platform
 probe failure
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Yeoreum Yun <yeoreum.yun@arm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20260910-fix-clk-issue-v2-1-fda3dd324c0b@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260910-fix-clk-issue-v2-1-fda3dd324c0b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAwNSBTYWx0ZWRfX9BDbI1Q9j9Vq
 jW6n8IFlCETKELNx9Imu5a+L88Q8Y5LNOEVnssjLrODozGn65p3FQ6TCFUbQZuagtHuo/5mTdCk
 Rk5leIYTaURlb5BYOKpjeyPaFX0xK0Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAwNSBTYWx0ZWRfX7LkPslv4ReAI
 9wDzfnIPjqZe6ObjPGBf+QD3ZmKOvBgXzMSGlhSWa8bN2+lgVHc/irgeqqRgu/GX34uVTdcQNmH
 QaAyR6pEp6r5aJo6W5Ato/lafge0VnClQ/pyH0EmqIPyx29zeDUgQ54i962IiO8WM66B89mj03U
 i5q5wgdhHU6Qww8pM16QjefGrXufzm/O5cbASb7VtfMophTSxM0PxAhXGP7+A0w+Vt1wtIwCHvy
 M4gXX8vmShzCJqYs5NK+ailydEdXTJYTs0yfy/okVk2/3R3IgjCnm8XZnwioY6DrkPByB7uovkP
 6R1T15rOp+AE6YhBH4gm+/BVT/c8KoaAC4SIviMtKjlVVZv+1CZTxUt7/ow1sLvVWLQoZIEkfTm
 XOeE9WfDoLFguuaKoZyashnvW4WFNLIuI1IqjJuYmX3qGe1hW/1GkdlHO3mjrm4Lliehgzn1ivj
 Hln4Q6Dmr7kAhWn8oNA==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6af122b9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=IbPb2sMBOJwYpCUqmF4A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: uelOGNzEAI3emAnQkiQg6j3k6HTSrP7B
X-Proofpoint-ORIG-GUID: uelOGNzEAI3emAnQkiQg6j3k6HTSrP7B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090005
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_173242_985736_95C92716 
X-CRM114-Status: GOOD (  26.91  )
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



On 9/10/2026 9:17 AM, Jie Gan wrote:
> Each CoreSight platform_driver's probe() enables its clocks via
> coresight_get_enable_clocks() -> devm_clk_get_optional_enabled(), which
> registers a devm cleanup to run clk_disable_unprepare() on driver
> detach. The probe wrapper then unconditionally calls pm_runtime_put()
> regardless of whether the inner probe succeeded, so on failure this
> also fires runtime_suspend() and disables the same clocks a first
> time. The driver core then unwinds the failed probe and runs the devm
> cleanup, disabling them a second time and underflowing the refcount:
> 
>    coresight-etm4x etm0: probe with driver coresight-etm4x failed with error -22
>    ------------[ cut here ]------------
>    qdss_clk already disabled
>    WARNING: CPU: 1 PID: 432 at drivers/clk/clk.c:1188 clk_core_disable+0x1d0/0x218
>    ...
>    ------------[ cut here ]------------
>    Unpreparing enabled qdss_clk
>    WARNING: CPU: 0 PID: 432 at drivers/clk/clk.c:1061 clk_core_unprepare+0x248/0x268
>    ...
> 
> qdss_clk is shared by every CoreSight node, so the extra disable drives
> its refcount to 0 while sibling devices still expect it enabled. The
> next funnel to probe then touches unclocked hardware and panics:
> 
>    SError Interrupt on CPU1, code 0x00000000be000000 -- SError
>    Kernel panic - not syncing: Asynchronous SError Interrupt
>    ...
>     coresight_clear_self_claim_tag+0x7c/0x1e0 [coresight] (P)
>     funnel_probe+0x114/0x2e0 [coresight_funnel]
>     dynamic_funnel_probe+0x24/0x70 [coresight_funnel]
> 
> On the failure path, disable runtime PM before releasing the usage
> reference: call pm_runtime_disable() first so no further
> runtime_suspend() can be scheduled, then pm_runtime_set_suspended() to
> explicitly record the suspended state, and finally
> pm_runtime_put_noidle() to drop the reference without invoking
> runtime_suspend(), leaving the devm cleanup as the sole disabler of
> the clocks.
> 
> Affects catu, ctcu, etm4x, funnel, replicator, stm, tmc, tpiu and tnoc,
> all of which share this probe skeleton.
> 

Gentle ping

> Reviewed-by: Leo Yan <leo.yan@arm.com>
> Fixes: 1abc1b212eff ("coresight: Appropriately disable programming clocks")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
> Changes in v2:
> - update the workflow regarding to Leo's suggestion.
> - Link to v1: https://lore.kernel.org/r/20260907-fix-clk-issue-v1-1-efe81fa2b697@oss.qualcomm.com
> ---
>   drivers/hwtracing/coresight/coresight-catu.c       | 10 +++++++---
>   drivers/hwtracing/coresight/coresight-ctcu-core.c  | 10 +++++++---
>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 11 +++++++----
>   drivers/hwtracing/coresight/coresight-funnel.c     | 10 +++++++---
>   drivers/hwtracing/coresight/coresight-replicator.c | 10 +++++++---
>   drivers/hwtracing/coresight/coresight-stm.c        | 10 +++++++---
>   drivers/hwtracing/coresight/coresight-tmc-core.c   | 10 +++++++---
>   drivers/hwtracing/coresight/coresight-tnoc.c       | 10 +++++++---
>   drivers/hwtracing/coresight/coresight-tpiu.c       | 10 +++++++---
>   9 files changed, 63 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
> index ad8dafea7d2f..4e2687e61c9a 100644
> --- a/drivers/hwtracing/coresight/coresight-catu.c
> +++ b/drivers/hwtracing/coresight/coresight-catu.c
> @@ -632,11 +632,15 @@ static int catu_platform_probe(struct platform_device *pdev)
>   	pm_runtime_enable(&pdev->dev);
>   
>   	ret = __catu_probe(&pdev->dev, res);
> -	pm_runtime_put(&pdev->dev);
> -	if (ret)
> +	if (ret) {
>   		pm_runtime_disable(&pdev->dev);
> +		pm_runtime_set_suspended(&pdev->dev);
> +		pm_runtime_put_noidle(&pdev->dev);
> +		return ret;
> +	}
>   
> -	return ret;
> +	pm_runtime_put(&pdev->dev);
> +	return 0;
>   }
>   
>   static void catu_platform_remove(struct platform_device *pdev)
> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
> index 9043cad42f01..5827b6d5844f 100644
> --- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
> +++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
> @@ -251,11 +251,15 @@ static int ctcu_platform_probe(struct platform_device *pdev)
>   	pm_runtime_enable(&pdev->dev);
>   
>   	ret = ctcu_probe(pdev);
> -	pm_runtime_put(&pdev->dev);
> -	if (ret)
> +	if (ret) {
>   		pm_runtime_disable(&pdev->dev);
> +		pm_runtime_set_suspended(&pdev->dev);
> +		pm_runtime_put_noidle(&pdev->dev);
> +		return ret;
> +	}
>   
> -	return ret;
> +	pm_runtime_put(&pdev->dev);
> +	return 0;
>   }
>   
>   static void ctcu_platform_remove(struct platform_device *pdev)
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 2247ad55d444..48050f86ead5 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -2330,12 +2330,15 @@ static int etm4_probe_platform_dev(struct platform_device *pdev)
>   	pm_runtime_enable(&pdev->dev);
>   
>   	ret = etm4_probe(&pdev->dev);
> +	if (ret) {
> +		pm_runtime_disable(&pdev->dev);
> +		pm_runtime_set_suspended(&pdev->dev);
> +		pm_runtime_put_noidle(&pdev->dev);
> +		return ret;
> +	}
>   
>   	pm_runtime_put(&pdev->dev);
> -	if (ret)
> -		pm_runtime_disable(&pdev->dev);
> -
> -	return ret;
> +	return 0;
>   }
>   
>   static int etm4_probe_cpu(unsigned int cpu)
> diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
> index 0abc11f0690c..264964a340ec 100644
> --- a/drivers/hwtracing/coresight/coresight-funnel.c
> +++ b/drivers/hwtracing/coresight/coresight-funnel.c
> @@ -319,11 +319,15 @@ static int funnel_platform_probe(struct platform_device *pdev)
>   	pm_runtime_enable(&pdev->dev);
>   
>   	ret = funnel_probe(&pdev->dev, res);
> -	pm_runtime_put(&pdev->dev);
> -	if (ret)
> +	if (ret) {
>   		pm_runtime_disable(&pdev->dev);
> +		pm_runtime_set_suspended(&pdev->dev);
> +		pm_runtime_put_noidle(&pdev->dev);
> +		return ret;
> +	}
>   
> -	return ret;
> +	pm_runtime_put(&pdev->dev);
> +	return 0;
>   }
>   
>   static void funnel_platform_remove(struct platform_device *pdev)
> diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
> index 2f382de357ee..93274ab0cfaa 100644
> --- a/drivers/hwtracing/coresight/coresight-replicator.c
> +++ b/drivers/hwtracing/coresight/coresight-replicator.c
> @@ -298,11 +298,15 @@ static int replicator_platform_probe(struct platform_device *pdev)
>   	pm_runtime_enable(&pdev->dev);
>   
>   	ret = replicator_probe(&pdev->dev, res);
> -	pm_runtime_put(&pdev->dev);
> -	if (ret)
> +	if (ret) {
>   		pm_runtime_disable(&pdev->dev);
> +		pm_runtime_set_suspended(&pdev->dev);
> +		pm_runtime_put_noidle(&pdev->dev);
> +		return ret;
> +	}
>   
> -	return ret;
> +	pm_runtime_put(&pdev->dev);
> +	return 0;
>   }
>   
>   static void replicator_platform_remove(struct platform_device *pdev)
> diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
> index 4e860519a73f..88726274ebeb 100644
> --- a/drivers/hwtracing/coresight/coresight-stm.c
> +++ b/drivers/hwtracing/coresight/coresight-stm.c
> @@ -1011,11 +1011,15 @@ static int stm_platform_probe(struct platform_device *pdev)
>   	pm_runtime_enable(&pdev->dev);
>   
>   	ret = __stm_probe(&pdev->dev, res);
> -	pm_runtime_put(&pdev->dev);
> -	if (ret)
> +	if (ret) {
>   		pm_runtime_disable(&pdev->dev);
> +		pm_runtime_set_suspended(&pdev->dev);
> +		pm_runtime_put_noidle(&pdev->dev);
> +		return ret;
> +	}
>   
> -	return ret;
> +	pm_runtime_put(&pdev->dev);
> +	return 0;
>   }
>   
>   static void stm_platform_remove(struct platform_device *pdev)
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
> index bc5a133ada3e..c4fe2dde5bf8 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
> @@ -974,11 +974,15 @@ static int tmc_platform_probe(struct platform_device *pdev)
>   	pm_runtime_enable(&pdev->dev);
>   
>   	ret = __tmc_probe(&pdev->dev, res);
> -	pm_runtime_put(&pdev->dev);
> -	if (ret)
> +	if (ret) {
>   		pm_runtime_disable(&pdev->dev);
> +		pm_runtime_set_suspended(&pdev->dev);
> +		pm_runtime_put_noidle(&pdev->dev);
> +		return ret;
> +	}
>   
> -	return ret;
> +	pm_runtime_put(&pdev->dev);
> +	return 0;
>   }
>   
>   static void tmc_platform_remove(struct platform_device *pdev)
> diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
> index 9e8de4323d28..4479d93f352b 100644
> --- a/drivers/hwtracing/coresight/coresight-tnoc.c
> +++ b/drivers/hwtracing/coresight/coresight-tnoc.c
> @@ -288,11 +288,15 @@ static int itnoc_probe(struct platform_device *pdev)
>   	pm_runtime_enable(&pdev->dev);
>   
>   	ret = _tnoc_probe(&pdev->dev, res);
> -	pm_runtime_put(&pdev->dev);
> -	if (ret)
> +	if (ret) {
>   		pm_runtime_disable(&pdev->dev);
> +		pm_runtime_set_suspended(&pdev->dev);
> +		pm_runtime_put_noidle(&pdev->dev);
> +		return ret;
> +	}
>   
> -	return ret;
> +	pm_runtime_put(&pdev->dev);
> +	return 0;
>   }
>   
>   static void itnoc_remove(struct platform_device *pdev)
> diff --git a/drivers/hwtracing/coresight/coresight-tpiu.c b/drivers/hwtracing/coresight/coresight-tpiu.c
> index 7b029d2eb389..3166ed6bc224 100644
> --- a/drivers/hwtracing/coresight/coresight-tpiu.c
> +++ b/drivers/hwtracing/coresight/coresight-tpiu.c
> @@ -271,11 +271,15 @@ static int tpiu_platform_probe(struct platform_device *pdev)
>   	pm_runtime_enable(&pdev->dev);
>   
>   	ret = __tpiu_probe(&pdev->dev, res);
> -	pm_runtime_put(&pdev->dev);
> -	if (ret)
> +	if (ret) {
>   		pm_runtime_disable(&pdev->dev);
> +		pm_runtime_set_suspended(&pdev->dev);
> +		pm_runtime_put_noidle(&pdev->dev);
> +		return ret;
> +	}
>   
> -	return ret;
> +	pm_runtime_put(&pdev->dev);
> +	return 0;
>   }
>   
>   static void tpiu_platform_remove(struct platform_device *pdev)
> 
> ---
> base-commit: af5f12805e5cefa4fe68d6127c7e1fb78cd5535c
> change-id: 20260907-fix-clk-issue-51e43c533250
> 
> Best regards,



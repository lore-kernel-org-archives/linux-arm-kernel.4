Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20949606D815
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 01:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4QUqp/bE;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IIK81rKF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HVaS1D6Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uw2xNVXE3nPEvcSRMwLt65q7UQPCULUZxs5qUuZDgjs=; b=4QUqp/bES2rJ1l
	jIcIVO543TLYlir9rfqDOTH4stznQUd0qt0OjCa9mh/pbhSLJlBQlf3+zW8hHwx6ud1Hw60XES609
	1Tt9EBm7qz2EvbWnaCGjMqc4qCHAbfZJz8/7VsYr1h6fJIGWusOXo9KtCDRVv1EO2g4eGbDDEKEsy
	VkPOUv9Ubpf0Rz7OAOggpNRlwjMEywxgpZrbkmLsnJ//9131hhRM2Gq+LVGk2ZKqfp7DSQpoW+oDk
	GNRz8C+J1cMCGX8LQRZAQ2Bqf0To7M+evGqiAat381FotlykmjfcAeb6ho3v1NQhKj/ZVCCayWLog
	hJy5C5BGSouOUNrX004w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQE5E-0000000H1w4-1LD6;
	Mon, 09 Nov 2026 01:22:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQE5A-0000000H1vW-300V
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 01:22:02 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A90Go8n1922656
	for <linux-arm-kernel@lists.infradead.org>; Mon, 9 Nov 2026 01:21:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uw2xNVXE3nPEvcSRMwLt65q7UQPCULUZxs5qUuZDgjs=; b=IIK81rKFxtWQTOdJ
	aseFKM+lDCaWD618ZA0BMXPQKSCUL57ICi1T68Ke7ad4lBBD2CsVsSrzQ4g0ITYK
	b0ReAEtp6Fb9ZCmGqIZdtzHFL34GJ5Q2SldcIKihX5eKso1Rrli/DmLcwrpB1K0H
	8+RAaqQmUV46wBb3neU8SM/UGwgiUXve8ha749zkKsZJKBfdFtkFz9xVk8QURWLu
	3l9GhtbYvvF/yIwsNoSRALJ+G3MPNO03tzRt1XtohPEf25PLW6XrjRQy7DAC7O2L
	asnmoq54bLVvATLV7WCXRj+asB6guC60ukLX5zLsIZkHPOPA4JBGpYohNttiLA09
	oyR6vQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsw99ky0m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 01:21:59 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ae19907a31so276534a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 17:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794187318; x=1794792118; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uw2xNVXE3nPEvcSRMwLt65q7UQPCULUZxs5qUuZDgjs=;
        b=HVaS1D6Yb/rwcFi7jOUrpDX9SLDOM4x/Jnu/6/7ZhUcDCI0R0qtChtxma0tvza66s/
         TOOpV7C0nrRpVYJoMvX7Oh4rL52yPg2hAw19zK7dVz/RDTbGx6K2gZpdaapu4OZZCCML
         bOVVULvteuoyVblW3MshOQO4izTDaEiYsMy9pEDF98xjILxmucxfHfo83nd76ApKhI9+
         PO7Y0ofw27YBlQBf4kQG8WsI7/+Xu709QmCiG6GJBVThpcy7ZdaD6AptHs27HPXEU1Mg
         tUDZm3LByqbxjpbNIu2Nz46CmFECm3xnNMr9rqcFBZVBrDEMDRq5xir44qQtlEfJMr0r
         y6Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794187318; x=1794792118;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uw2xNVXE3nPEvcSRMwLt65q7UQPCULUZxs5qUuZDgjs=;
        b=WLIMGxIqX4+x3vN9mjEJ7Zgzyxmpn/qGLJ1QA4gQlrMpiTChnq3xsmPZOWrg5Bx88L
         BJgaa2DXrPSozVNOApYb6/t1pb3cZNCCyHiZHVWkm8mcXFLNIAh8S3N2JkUGetIMJ0Wn
         Y2kadyCyD3EBT5LrmsOoe2sxdsA/ZPFyNEdHCAjOmCOf0nasCu07WFR0gl4R52BngL/W
         7oBp/coGNYiiXwFPnaE6K51c0IUgm5QH5zMGLElcV1iN16fFwl94BUiUif/RE98Lwl5c
         zUMB2gxbTkBuVNoHkdVoXcsWqTXvJ3en0L1+7yyPHQiSf26BDBhwq2OHQVHsz2QpeU6P
         4AlA==
X-Forwarded-Encrypted: i=1; AL+hErEfClPg6uSLB0TTWbFtDB6LTldVJ1dfu11+5Moq3pad+OBkCRydLf+mSvsD5Urv/33l0cfFFkUcE9xVTWMUK8/w@lists.infradead.org
X-Gm-Message-State: APuU4Z+QsbA7/6mlpiPjHoZe0AgyVus7EuIkrR6aA5ED85owHxuMXXpR
	xnAuwqng7rQNHExu2Fhyqg64An+r3jhIKdRb02Heh17EPe9dNn/nQf5HzNH8v+UUlPt2RcpSLni
	X28D75d5BWrVT8AYnIc9Rf5h+G3Lii364LxMqv6CND/Fx7OU27feLVC5ifIlCASpxsIodi/CX8w
	HDPw==
X-Gm-Gg: AYBFou2mk3iKPLza7WTJmWJaX/dV5pq427an28vnF/b+E8VcyDC8k6q78Ds/ZYwk06a
	1ZOawXSxcgt6FI7UtNW/eG3YiNInaWKvrKglUT8J1q89Ik1wloaBn2bXU8wkZN5/UWWn7iLuydG
	B0m5OrfCKQdFhUOMP/L4n6t5X4fPbV1T1o31cVG4B6PSYXu+2c1j4TfYz8e1HGx9+DYNFrMH1I9
	V0dsgWB8tqNAEHSAjKLkWuQTK+8cVoXSjRwhLU1jk2j/1d7jGBcDL8cs4FAHE9dgn3AOmPHVlPo
	GBgwyJFtO0/N2mFR7Klfd/np4uQ2NfCGiS6yAj8pj4wJyKZgeDuWETrBDFcE8U2HzVK6cK00KD0
	XTNc37GCjYZNfZ7sJUU/+9KX/6/PG+3D0TS38IDlxyOTBJVdybstT7RX+fPiBmUwwTgpF
X-Received: by 2002:a17:90b:564e:b0:3b1:d40:2c4e with SMTP id 98e67ed59e1d1-3b12cb3ee6dmr1874645a91.0.1794187318429;
        Sun, 08 Nov 2026 17:21:58 -0800 (PST)
X-Received: by 2002:a17:90b:564e:b0:3b1:d40:2c4e with SMTP id 98e67ed59e1d1-3b12cb3ee6dmr1874635a91.0.1794187317899;
        Sun, 08 Nov 2026 17:21:57 -0800 (PST)
Received: from [10.64.68.243] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b127970954sm4788398a91.15.2026.11.08.17.21.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 17:21:57 -0800 (PST)
Message-ID: <172f1a97-6567-4cf1-9c28-82938bea33dc@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 09:21:52 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: tpda: fix race between refcnt check and
 register access
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Tao Zhang <tao.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260408-fix-race-condition-issue-v1-1-9a148d07e08f@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260408-fix-race-condition-issue-v1-1-9a148d07e08f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ECBm0su95HTDmafkrTwV-khv0yi1VSow
X-Proofpoint-GUID: ECBm0su95HTDmafkrTwV-khv0yi1VSow
X-Authority-Analysis: v=2.4 cv=CMq/zhrD c=1 sm=1 tr=0 ts=6af12037 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=c7d8TTRRwYqZNTvHBSMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAwNSBTYWx0ZWRfXwSGMOZHECf5V
 LMZ0oIH9aAKmN2PTT6OQUscC1GOUwX+18hDmXtgSlySlDdmT6fjmacEJtc9cNXdqHvSi0M/R0+V
 TRm+9PaD4gAE4pxbdAQgC+fIRhxXruzPlcdEOtzP58KKqE8O8Xmsp/PIrtMjNb3nntCSSyWloZO
 pTRdoTQEl/zGA7P7udFMqDCoBVQS6VYdtEwk0F5bFgHbOMJtkG1nGjRL9x7sPHHFL67zW72yHr2
 /VMMBiH09fP61djvzWTXDhHaVzi6k+kXdZld/0TSjsx4/L7eubqrdBNvsTgSLk40wVA0CNw5+y5
 cx1MK3J7c868GQ2zwIwuKzG0QJo2HRoLZjDdFRqKUjFkKMDfqEB49+qmONq8ECAu93QxM4eOfmt
 WJtNpYBTyo4MFlZUQv/fh0AoIadrGzVNNOcTvAAaxp4Jg0/aLUiUAjp4/0M6ZdUlxOmQYCg01XJ
 jYFEmAlwWtiBZRxM66w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAwNSBTYWx0ZWRfX9e+3/mlVBWUa
 JnKmTvOyDMjvnFF7aQMHVub7DRYHqs1pEK3B7npMoUlsYZjNWDBULVFKvBHQuv3HHmWCmNQ1VNw
 Fs1Jb5Wo00a2iUk5TB65EtX3ACy8Dr8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090005
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_172200_795217_2CF3E0FB 
X-CRM114-Status: GOOD (  21.31  )
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



On 4/8/2026 9:23 PM, Jie Gan wrote:
> Several sysfs show/store handlers check csdev->refcnt before acquiring
> the spinlock, then access hardware registers inside the lock.  This is
> a race: between the check and the lock acquisition, the following can
> occur on another CPU:
> 
>    CPU 0 (sysfs reader)              CPU 1 (disable path)
>    ─────────────────────────────     ──────────────────────────────────
>    refcnt == 1, check passes
>    [waiting for spinlock]            tpda_disable(): refcnt → 0
>                                      debug clock disabled
>    spinlock acquired
>    readl_relaxed()  ← FAULT/hang
> 
> tpda_disable() decrements csdev->refcnt under the same spinlock, so
> moving the refcnt check inside the lock closes the race.
> 
> Fix all six affected sysfs handlers: global_flush_req_show/store,
> syncr_mode_show, syncr_count_show, and port_flush_req_show/store.
> 
> Fixes: 8e1c358a3b0e ("coresight: tpda: add global_flush_req sysfs node")
> Fixes: 33f04ead7c49 ("coresight: tpda: add logic to configure TPDA_SYNCR register")
> Fixes: a089d585a7f4 ("coresight: tpda: add sysfs node to flush specific port")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---


Gentle ping.


>   drivers/hwtracing/coresight/coresight-tpda.c | 18 ++++++++++++------
>   1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
> index 89c8f71f0aff..63a979312463 100644
> --- a/drivers/hwtracing/coresight/coresight-tpda.c
> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
> @@ -360,10 +360,10 @@ static ssize_t global_flush_req_show(struct device *dev,
>   	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>   	unsigned long val;
>   
> +	guard(spinlock)(&drvdata->spinlock);
>   	if (!drvdata->csdev->refcnt)
>   		return -EINVAL;
>   
> -	guard(spinlock)(&drvdata->spinlock);
>   	val = readl_relaxed(drvdata->base + TPDA_CR);
>   	/* read global_flush_req bit */
>   	val &= TPDA_CR_FLREQ;
> @@ -382,10 +382,13 @@ static ssize_t global_flush_req_store(struct device *dev,
>   	if (kstrtoul(buf, 0, &val))
>   		return -EINVAL;
>   
> -	if (!drvdata->csdev->refcnt || !val)
> +	if (!val)
>   		return -EINVAL;
>   
>   	guard(spinlock)(&drvdata->spinlock);
> +	if (!drvdata->csdev->refcnt)
> +		return -EINVAL;
> +
>   	val = readl_relaxed(drvdata->base + TPDA_CR);
>   	/* set global_flush_req bit */
>   	val |= TPDA_CR_FLREQ;
> @@ -404,10 +407,10 @@ static ssize_t syncr_mode_show(struct device *dev,
>   	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>   	unsigned long val, syncr_val;
>   
> +	guard(spinlock)(&drvdata->spinlock);
>   	if (!drvdata->csdev->refcnt)
>   		return -EINVAL;
>   
> -	guard(spinlock)(&drvdata->spinlock);
>   	syncr_val = readl_relaxed(drvdata->base + TPDA_SYNCR);
>   	val = FIELD_GET(TPDA_SYNCR_MODE_CTRL_MASK, syncr_val);
>   
> @@ -440,10 +443,10 @@ static ssize_t syncr_count_show(struct device *dev,
>   	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>   	unsigned long val;
>   
> +	guard(spinlock)(&drvdata->spinlock);
>   	if (!drvdata->csdev->refcnt)
>   		return -EINVAL;
>   
> -	guard(spinlock)(&drvdata->spinlock);
>   	val = readl_relaxed(drvdata->base + TPDA_SYNCR);
>   	val &= TPDA_SYNCR_COUNT_MASK;
>   
> @@ -478,10 +481,10 @@ static ssize_t port_flush_req_show(struct device *dev,
>   	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>   	unsigned long val;
>   
> +	guard(spinlock)(&drvdata->spinlock);
>   	if (!drvdata->csdev->refcnt)
>   		return -EINVAL;
>   
> -	guard(spinlock)(&drvdata->spinlock);
>   	val = readl_relaxed(drvdata->base + TPDA_FLUSH_CR);
>   
>   	return sysfs_emit(buf, "0x%lx\n", val);
> @@ -498,10 +501,13 @@ static ssize_t port_flush_req_store(struct device *dev,
>   	if (kstrtou32(buf, 0, &val))
>   		return -EINVAL;
>   
> -	if (!drvdata->csdev->refcnt || !val)
> +	if (!val)
>   		return -EINVAL;
>   
>   	guard(spinlock)(&drvdata->spinlock);
> +	if (!drvdata->csdev->refcnt)
> +		return -EINVAL;
> +
>   	CS_UNLOCK(drvdata->base);
>   	writel_relaxed(val, drvdata->base + TPDA_FLUSH_CR);
>   	CS_LOCK(drvdata->base);
> 
> ---
> base-commit: f3e6330d7fe42b204af05a2dbc68b379e0ad179e
> change-id: 20260408-fix-race-condition-issue-d44203254b87
> 
> Best regards,



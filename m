Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC14606A78C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 01:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AMmMI70E;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KpXnbPrN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ds7lB1TN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+ILPUVvAEQQSiOWe9jx3J0bcp/Cobg7swKrB6drhfuU=; b=AMmMI70EC72P6i
	O0KPLWFOiTPGmnBZG+yoiRkgdWRbXWkwWlHe0Koi3LnGw/Yc1A/6hwXsFEFm4Yqb2UcJajGdVjKkV
	A/oxfR5RQjbspE/J2VRkxjg7dBK2ZWFc8FdxmDCj4g0GXox1uEaZX2PauOaHCHdEeCMyPn/cAlc45
	p31m+DDqSrHUWfWyTG5ZUziRROqQjBLbpbu7kgMmlNwyitxvdhXH7c6yafqpYuOX4jgNAx3IhGaXq
	3TMcP2dJZC1/YAKr0UZWMSQGD07OjAJvDfq8m6hMfhM+7qCsXCrydrWYOeeQINc/QO+5GFRn0Fw4O
	YKtmqhIEZMeo4dWJsxjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQE7T-0000000H2KP-3CzH;
	Mon, 09 Nov 2026 01:24:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQE7R-0000000H2Jl-0lBu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 01:24:22 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A90HB7a2552221
	for <linux-arm-kernel@lists.infradead.org>; Mon, 9 Nov 2026 01:24:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+ILPUVvAEQQSiOWe9jx3J0bcp/Cobg7swKrB6drhfuU=; b=KpXnbPrNVJl4QvjK
	rlGzMaWKm3CSKs196LRbnPDmc2qspCM67ktzROtfMR/mbwec/1QuIB9qiUsohtRo
	sbo3Vluy7VZh8T5rrUiBHzB73s/B9ZRhJO4uvogDZmmDSVZcdgz78jQF2oEaUYoB
	xryip/TdwRDdb9lRIwciS8qv2fIztRIm//jQPrmqxaOdSnHUoQ70U+Dl8jBb5Rff
	VSrGhpzeCwPevUPLmAOTRS/kKHb6WgKc0TCX8LvD9390z813BXUfANKErIQGnrar
	Bz56yOBKyZIdas9E7q9X5lMNvt7MZ5OC1h6yuFZeS9rB+xdANGPninYLhVqP3YvC
	jt7DNg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsuagv8ra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 01:24:20 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd652c0385bso186339a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 17:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794187459; x=1794792259; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ILPUVvAEQQSiOWe9jx3J0bcp/Cobg7swKrB6drhfuU=;
        b=ds7lB1TNXlLE8bIyLLEcPYjHe8U0Fd+JWeSaNO02WAMVKt7zBkKVIdVjCBF2wTtVSJ
         J5+EvxA+QIO+nwpYDfakiAavdiFqpBFeXuXIAQ1kpGEvGwwEld9qcjntEBsr0iIOsztc
         hyuAAE2DDdXUm0YCDWsr64MswIb8IDhQFhDnl+/2bEqebcA/Uu4LDWflIOGdjFZ4JQJJ
         3yQxMiL4A3rfQpXhgdldYSz3v/2mP3+Dwy6rcz0tXjKFxfh1e9cqtcN0VpTAYjIGuOs1
         amueFjgI+wZF8ktRPLmnO7PJQj6nzI4xyVdJoPv9WRhdlWMPFd0Y+3BlMhNSX0FLyfY9
         lWGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794187459; x=1794792259;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ILPUVvAEQQSiOWe9jx3J0bcp/Cobg7swKrB6drhfuU=;
        b=v9MibNMMljEIpKfLv+9z7ZEeyLlFDg6h5Of+ZifiLbcSqQl57CZCCalYGPYypow10K
         w9vsqmQiy4URxeB1dM7clCuw/YbA7gpizpYtdagoMUMdh4SvM1pMjhq4ZuJAc2v+XdzB
         fAs+uWMeb/tQ1btlN7zizdfQCkXDLlGhVPbbiffhiRX97KbBJ3Ciq30n1LJ9OP8gvHth
         pbl5DSWFVQsCNC6V3hyR2Z+VoBvBeW4+KUwtJbKLHGPrh3Y/gmc/R0m3iVM+Kue9GD21
         BT3gUSgtrnRPDTvCFNBZC5WpSssb7HQekdgxOMwPvIwKwd7DzQ+HahQwsBQfjUCju6+P
         hNYA==
X-Forwarded-Encrypted: i=1; AL+hErEth0mw9TtrnHutrA502xyAUzAprWWECDsygyxd7ksOl5eNlbdzi2MWz1Hc4RO1mBSboUAhnuHiaa2QdU4S6taE@lists.infradead.org
X-Gm-Message-State: APuU4Z+0g7urvAmB/FWn07pD/o8UrLeJ73D83YTJpm5kZQhGtlR9MOFJ
	v9jDK9FhNCKhPWCaqNK5RdviVaTlobg3GfCSLMsCiwhBoOns9F0L+e3mKtMQ4Ab16PIyqiodS27
	XdshDkMPcjyzUHV9tF7vQgKBLkQsD3BwU61sGxF5mwyCz04H9JDsPeRI3V3Hg3jrMyrMlmRMwz4
	icFA==
X-Gm-Gg: AYBFou3tVMiwoJVWyKLi1V7cFSzIX7lUwCjyqjD+bYPD2VrZA0ApW/nGitBC7LOZWms
	dpX8dwgGCuSsE2Sb3Zwm0t4IVh3J57dL7m1hDP9wHfBX2AVSAWJdHI4FLvOwSGWFsqlQNEm1nGG
	ynyaXT2gjjVFUQjH5D81gb3az5Zn03CU8Ydm9rwgGe5SYn004MEGb0JFhiEWhYrBweFhOsvKMTM
	i6SyicsHH+KUhvsd8Ms/fzxqWl1IIwRCyf0T2oMkYzXM3uUVPz3kS0qf0g3Cjyvmliq1KgNrljj
	pPBHnMmVOyWiDakJZYofOLSOyL195vfhSxPJPLV+vwTLz+54IfMDB2IGecLNiJ+dEqrlMgyKCU0
	V3Tw783g45w3AwK/9I5qyCwW/44Ts+RMK4q3WudN/hQzOWIS3Q2SpAeIbeHgrdRhX8DtW
X-Received: by 2002:a05:6a20:748b:b0:3e1:3178:8d62 with SMTP id adf61e73a8af0-3eecf984101mr2597294637.9.1794187458997;
        Sun, 08 Nov 2026 17:24:18 -0800 (PST)
X-Received: by 2002:a05:6a20:748b:b0:3e1:3178:8d62 with SMTP id adf61e73a8af0-3eecf984101mr2597285637.9.1794187458501;
        Sun, 08 Nov 2026 17:24:18 -0800 (PST)
Received: from [10.64.68.243] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb96a73344sm1072893a12.30.2026.11.08.17.24.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 17:24:17 -0800 (PST)
Message-ID: <51a86fe7-95b8-4f49-96bc-2245c334b7f6@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 09:24:13 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: fix resource leaks on path build failure
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260513-fix-memory-leak-issue-v1-1-49822d7bc7d4@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260513-fix-memory-leak-issue-v1-1-49822d7bc7d4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAwNSBTYWx0ZWRfX0OgrctRcp6Sb
 gcuCehJJ57zOUJTJUwWNGP3uJGNzui5uQIrW3ytIOKStS1HBexNYz0Yv84lrSGCUKh2W9zdzz5r
 l0NlULTetr605DwYCKWBVm1fRMTXq8DOBUfRArFkapJSIKSEj1BKBOOWp/NRzUml0/qcZQGctwC
 j4Y6CW4rQLFIU3WOldqjrP8QwSxBpqIWDoR3YrnHxU8eLZrQ9umPAscR9epru7dAFelrRfHUZnQ
 +KwerIdtuZhcK80TBwdfq8PShCHHPJcAiKjCgDWXbDCvkfqw3PpUv56sVVCgqa4Y22WjM/E2b6R
 lL6jS8y+sst3jutK1R8qARPjG7btjmAvrwuAJhYWbm3tqt2kin2qk5QCztmlb5HaXlxCfgwm6Ug
 0MB6MXcdJZKLmFGnPfQLrnP/wPbHgtLKIQtqKXUnYYoN8acDfVtfKo0zg0HArwsjJZMV305qCX9
 JwFIFeRhLOJdAAEEsFw==
X-Proofpoint-ORIG-GUID: BYTHM9IUqmYOb8WWzM5q5w9KYhFEFJqA
X-Proofpoint-GUID: BYTHM9IUqmYOb8WWzM5q5w9KYhFEFJqA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAwNSBTYWx0ZWRfXzbMdbY1wpEAG
 qqJ+RWvz/tU1AitR4NCa5yQ8tAPGCFzS/OHwMo7saV+l/ArVZSR6RfvaTQG5hM82PT7Ox+FblLP
 JFOwr4+ZDMDhWW66c5QBdUOMv01VCWo=
X-Authority-Analysis: v=2.4 cv=V8LoQuni c=1 sm=1 tr=0 ts=6af120c4 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=IIRFHugnNVJhAGNuPQwA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090005
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_172421_366516_F9F01D69 
X-CRM114-Status: GOOD (  23.27  )
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



On 5/13/2026 9:32 AM, Jie Gan wrote:
> Two related leaks when _coresight_build_path() encounters an error after
> coresight_grab_device() has already incremented the pm_runtime, module,
> and device references for a node:
> 
> 1. In _coresight_build_path(), if kzalloc_obj() for the path node fails
>     after coresight_grab_device() succeeds, coresight_drop_device() was
>     never called, permanently leaking all three references.
> 
> 2. In coresight_build_path(), on failure the partial path was freed with
>     kfree(path) instead of coresight_release_path(path).  kfree() only
>     frees the coresight_path struct itself; it does not iterate path_list
>     to call coresight_drop_device() and kfree() for each coresight_node
>     already added by deeper recursive calls, leaking both the pm_runtime,
>     module, and device references and the node memory for every element
>     on the partial path.
> 
> Fix both by adding coresight_drop_device() in the OOM unwind of
> _coresight_build_path(), and replacing kfree(path) with
> coresight_release_path(path) in coresight_build_path().
> 
> Fixes: 32b0707a4182 ("coresight: Add try_get_module() in coresight_grab_device()")
> Fixes: b3e94405941e ("coresight: associating path with session rather than tracer")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

Gentle ping.

> ---
>   drivers/hwtracing/coresight/coresight-core.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 46f247f73cf6..c1354ea8e11d 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -825,8 +825,10 @@ static int _coresight_build_path(struct coresight_device *csdev,
>   		return ret;
>   
>   	node = kzalloc_obj(struct coresight_node);
> -	if (!node)
> +	if (!node) {
> +		coresight_drop_device(csdev);
>   		return -ENOMEM;
> +	}
>   
>   	node->csdev = csdev;
>   	list_add(&node->link, &path->path_list);
> @@ -851,7 +853,7 @@ struct coresight_path *coresight_build_path(struct coresight_device *source,
>   
>   	rc = _coresight_build_path(source, source, sink, path);
>   	if (rc) {
> -		kfree(path);
> +		coresight_release_path(path);
>   		return ERR_PTR(rc);
>   	}
>   
> 
> ---
> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
> change-id: 20260513-fix-memory-leak-issue-034b4a45265e
> 
> Best regards,



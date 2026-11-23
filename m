Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD75606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 05:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NV2EFZ8o;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LalogYks;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ge/e1KSh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ixxmwj4X1glsH2rmr44JTvp/U38L97CIj3oyLiQlPOE=; b=NV2EFZ8ofos/fL
	bYAewSsnuFLRI5tSxvrFuQ11czB1Y1Xz7c7fInKVtVFnrKdDQ466H4iV3UYx1otg7Q6VxSqS0wX/u
	7Rqid7638yU73m95YZniWMQl+0HH1uQMNAnrBQ1mvj3+2kTRN5j7L8xIkhYQQNuEAgGw2nvY2C77b
	mocEgbS1KYVduQOQey/F60kdT9XA7EqWXhntYaK+UYGoKb0dEWFbaLKIruMSWS8YxO15S/I7sPCes
	e2sPz901yzRq8TkLsz4aycmstTeGQIERLHUhe9H8kqpFCf5w48V1qsnAyRHm6ZhPGphqGCDdXzFtA
	e2yGxBZCfrW58o2+eR4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVMHm-00000002HXK-018I;
	Mon, 23 Nov 2026 05:08:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVMHg-00000002HWe-0K3J
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 05:08:12 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN51HFZ3528177
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 05:08:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ixxmwj4X1glsH2rmr44JTvp/U38L97CIj3oyLiQlPOE=; b=LalogYksQ4y4FDaD
	ChLAP3A6hNMZm7KWjRVyHXxGKfK1Q4LE04SOcUCQXd0FTEoFSqZEZz7I9RE+tFZn
	DLAl3cUqAdj8A8gGEoisBxWdZOggJWXlUMBhdIhwnaumMsamaqFK+70R3SH3lroj
	krYhAhLuM1PAfePicSPQ0KLsul7h2pyebmHHt3Z5GmoxS91JaOGNUEJUPwYW4TAs
	YWKg+M9IDp4h+WNSJ/ssy8LTAW61wgOThCI8bnK+jyVHnfZMti1MQWvXAN+jVezr
	W1KE4c1IvP1wSlKVaVWX7yjoGYCWFty3R+2CcJeovdhZZdGsMgItkTk/5ZLrsDrb
	1BhPBQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j30nnwkyt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 05:08:06 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b0a13ae043so3167755a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 21:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795410486; x=1796015286; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ixxmwj4X1glsH2rmr44JTvp/U38L97CIj3oyLiQlPOE=;
        b=Ge/e1KShZka6/ZShHTcdVPOsOE33B0vY+47awxvJQ0SZ1fItoTiiCtK0fA+gkYlDNk
         vwoGkvkdX4jzZFBP4vcvIP5CqgTxZk33rXPYlHDmj9U+7iBnkxkCwbExlUM/s1vPz6gL
         q0enSNggX/pWc2e6rHsfvNzbDil9aRihQn56WUPVKUJCBH8nZUAdDh5xYIx/mwNee4Zp
         PFcyY8aNt7AiPktY/lwTFAZXptHFoJqZQqrEoKZJjpSRY/nanKdEiRUYOnExu1qbpOTb
         ZP6+WPv9Q0ed8BEs982sdU1Or3E+3SjIgrcW8hnHmRFsfM/lHPQyQXAo14ofHkkQ4+tj
         ZgMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795410486; x=1796015286;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ixxmwj4X1glsH2rmr44JTvp/U38L97CIj3oyLiQlPOE=;
        b=MH2lwaIpCI5Fj0kpA4R85C6I5CBX1VPWy9Oovi3ZL7Vjs/8vFI99dBjJPO6+NhlL6K
         1f9Ewg0eDweVyXY6TNEEZRMsClQOF9tuEx+u2esRFFGydrOqO+PxQGofNsI7en8zbkC7
         v7WofWHzjpmUByJFWggpu41IeN9tMQiyzFCCjLDLK/i9jLbR720I+d1i8xWPA0HPVyTr
         1Bu/6xunq8BXZpw+nAkkzqooJFK7MYL6DMnQQIryGLnZIPh9kWmzYUhS0lnTLjrsHfE3
         mrNUm5ktRsaWghH4bsdonnyoYQscNgrbiAHI+h8Pxrf4iZyxeh3wcL4A/ENnGKoBQsGb
         Y7kw==
X-Forwarded-Encrypted: i=1; AL+hErGM73NFONYbCwEximfGbCtT56DtkBojfZC0eL0kiL9SSn6zGayyhEKlDSwvZaSYKuXI57iC727t4CgD3XlBvxof@lists.infradead.org
X-Gm-Message-State: APuU4Z8WGz7m4XtGGyVNofVUUpZBhlveJVmndZW3FXsQxHImJJqc8p/l
	say1RACuuo/xWYlfXhqaW9GzC8ZeEwn9Qlag7ZqV/z51rvmBsoJAaS/s8drOU6KUSWrOZqAq2oF
	0vtaiXzPEklnbDto70gLzFlhIZK8v4yHPU/bCa1b58DciNfFAWaowvTXSUuRRoSnkzanp5al41F
	c3EQ==
X-Gm-Gg: AZFdTZdbql+qheVpnaZHkqHWHE5kRc0s/orTqLxxqcBE3bU3u3Zm7IWfIe74gspWr+B
	KPcrFDGFk1DSKupuPQOLgoSPyAAINYwLpfvoMQFKHEUeJiOCpyiv6QORJ7iguroIlZ6rhEZYlxd
	Y1LUCgqAb/gfV4Asq6rHq0cN7MnmOF2JHKvVmZJHlaAd7PD+5av8we71HHJxsOy0wMvM0tj1hZg
	61biO0vbhr195sPU7gRCd8NSU0oZ0KshHl252iLLza7OgqY8wWlbVIQs45uAiiVFPUVVcn1RrXy
	Kesw5X4keRfnbSUGAaffLnNHd04MVs37e1n+m2Nd9SVIXVtodIcLt3SIewjuX+1umk5P8WwzJXq
	FSqHerlnipURQL5ROFDBRpqZWLRqNHFDQdpbk7nZlL+HdAG3sm2OMi3bJ9oIye4zQK0Tkml3gdJ
	n7tTX84zmtq9vs0Y5BYNCkWBYkAiLmA1Kc+QuwEq6pOCeFzQ==
X-Received: by 2002:a17:90b:442c:b0:3ac:b145:8f4 with SMTP id 98e67ed59e1d1-3b41c9325a6mr9841159a91.41.1795410485941;
        Sun, 22 Nov 2026 21:08:05 -0800 (PST)
X-Received: by 2002:a17:90b:442c:b0:3ac:b145:8f4 with SMTP id 98e67ed59e1d1-3b41c9325a6mr9841143a91.41.1795410485442;
        Sun, 22 Nov 2026 21:08:05 -0800 (PST)
Received: from [10.133.33.103] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad8ef99sm16407965a91.12.2026.11.22.21.08.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 21:08:05 -0800 (PST)
Message-ID: <12d70da7-72fe-49be-803d-9b2824f99d86@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 13:07:59 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] cpufreq: s5pv210: Fix resource leaks on probe error
 paths
To: shyckless@gmail.com, rafael@kernel.org, viresh.kumar@linaro.org,
        krzk@kernel.org, peter.griffin@linaro.org
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, alim.akhtar@samsung.com,
        linux-kernel@vger.kernel.org,
        Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
References: <20261122-cpufreq-leaks-v1-0-96fc17ff7339@gmail.com>
 <20261122-cpufreq-leaks-v1-3-96fc17ff7339@gmail.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20261122-cpufreq-leaks-v1-3-96fc17ff7339@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAxOSBTYWx0ZWRfXzqlahWhmqXPX
 6mHsPIJ8DYUYOXFyBRQ4HWjU3ucE2QsxeBzXcdk8y4kwdYk55U8hhwc73AeJhSxeM59vI7eOXk4
 yRhO0Fa0m5v5qOrVsFdiLTYrgy6q1jibJZR/6CrxY5FtpisNySydzEu6yzzThDTelIrpKSRESFO
 5LjKdtonDxWDT0sD/vGjTLp2QH1hn3VBFKT0bu8Ar5lDACvx1ZmMYdq5//eLsKl/XIr0y3Ysr9r
 DSGD9U4yeK24ZIMOtQVRlZaB00uLTAlPe2tz9358+cwO2ysKE6EzumejpMnFTpiKghn80R/m7fu
 rCIN5emX8JzshiAHiJNxiRR8VT4O7M9R9wsQDNhEAJotFSegesHsSF4cIBY+sqU+hO7bKKK6EFg
 pyM+d/KPOLP527cqhPxyp28ovlxoCwAwI8110HFyMEb0ssyk2oxd3qGieu1j2TiDzbpmHFfkuf3
 PraOlSa20emF8g5J+Lg==
X-Proofpoint-ORIG-GUID: lhg9ROSvwXPq7v_n6asDvR7OgeWNphFW
X-Authority-Analysis: v=2.4 cv=LITz05W9 c=1 sm=1 tr=0 ts=6b03ca36 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=_Cgvf9wQB5e8zHb46_kA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAxOSBTYWx0ZWRfX6TesGhDE5g8U
 C/NdUfnQHVoNSnfp/RUwnqhDfyx0jK7vDlce7lqMS0+qN1DYrXolCo0hGN8jvjfXHzRdwU02LFf
 xe47F9MrDY2FfoOXl+SHJgix/IObS8g=
X-Proofpoint-GUID: lhg9ROSvwXPq7v_n6asDvR7OgeWNphFW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_210809_423671_53F9DC8D 
X-CRM114-Status: GOOD (  27.39  )
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

On 11/22/2026 7:55 PM, Suyuan Wang via B4 Relay wrote:
> From: Suyuan Wang <stevewong@hust.edu.cn>
> 
> s5pv210_cpufreq_probe() returns the result of cpufreq_register_driver()
> directly:
> 
> 	register_reboot_notifier(&s5pv210_cpufreq_reboot_notifier);
> 
> 	return cpufreq_register_driver(&s5pv210_driver);
> 
> If the registration fails, for example because s5pv210_cpu_init()
> fails, the resources taken by the probe itself are leaked: the two
> regulators and the clock and DMC register mappings. The reboot notifier
> also stays registered. (s5pv210_cpu_init() releases its own clocks on
> its error paths, and the cpufreq core tears down its own state.)
> 
> Also, when a DMC node has a bad alias, the code jumps to err_clk_base
> and skips unmapping DMC registers that were already mapped for an
> earlier node.
> 
> Unregister the reboot notifier and go through the existing unwind code
> when cpufreq_register_driver() fails, and jump to err_dmc on the alias
> error. The err_clk_base label has no users after this, so drop it.
> 
> Found with a static analysis tool and checked by hand.
> 
> Fixes: 6d4ed0f46af6 ("cpufreq: s5pv210: Make the driver multiplatform aware")
> Fixes: e0e5b2b4f427 ("cpufreq: s5pv210: Defer probe if getting regulators fail")

e0e5b2b4f427 didn't introduce either leak; the alias path already
leaked via "return id;" before it.

AFAIK, e8b4c1986efb added the two regulator_get() calls before the
unchecked "return cpufreq_register_driver()", and fe7f1bcbff91 added the
reboot notifier there, so those two leaks predate 6d4ed0f46af6, which
only added the register mappings.

So the tags should be:

Fixes: e8b4c1986efb ("[CPUFREQ] S5PV210: Add arm/int voltage control 
support")
Fixes: fe7f1bcbff91 ("[CPUFREQ] S5PV210: Add reboot notifier to prevent 
system hang")
Fixes: 6d4ed0f46af6 ("cpufreq: s5pv210: Make the driver multiplatform 
aware")

Could you please check and update the tags accordingly?


> Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
> ---
>   drivers/cpufreq/s5pv210-cpufreq.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/cpufreq/s5pv210-cpufreq.c b/drivers/cpufreq/s5pv210-cpufreq.c
> index e64e84e1ee79..29b1c5d71a8b 100644
> --- a/drivers/cpufreq/s5pv210-cpufreq.c
> +++ b/drivers/cpufreq/s5pv210-cpufreq.c
> @@ -634,7 +634,7 @@ static int s5pv210_cpufreq_probe(struct platform_device *pdev)
>   		if (id < 0 || id >= ARRAY_SIZE(dmc_base)) {
>   			dev_err(dev, "failed to get alias of dmc node '%pOFn'\n", dmc);
>   			result = id;
> -			goto err_clk_base;
> +			goto err_dmc;
>   		}
>   
>   		dmc_base[id] = of_iomap(dmc, 0);
> @@ -655,7 +655,14 @@ static int s5pv210_cpufreq_probe(struct platform_device *pdev)
>   
>   	register_reboot_notifier(&s5pv210_cpufreq_reboot_notifier);
>   
> -	return cpufreq_register_driver(&s5pv210_driver);
> +	result = cpufreq_register_driver(&s5pv210_driver);
> +	if (result)
> +		goto err_reboot_notifier;
> +
> +	return 0;
> +
> +err_reboot_notifier:
> +	unregister_reboot_notifier(&s5pv210_cpufreq_reboot_notifier);
>   
>   err_dmc:
>   	for (id = 0; id < ARRAY_SIZE(dmc_base); ++id)
> @@ -664,7 +671,6 @@ static int s5pv210_cpufreq_probe(struct platform_device *pdev)
>   			dmc_base[id] = NULL;
>   		}
>   
> -err_clk_base:
>   	iounmap(clk_base);
>   
>   err_clock:
> 


-- 
Thx and BRs,
Zhongqiu Han


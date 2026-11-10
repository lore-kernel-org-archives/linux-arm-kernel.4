Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7222C606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 15:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZTBDRjD8;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NCfsGGu5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RVA7NkT+pOc7QldUcgD3Ut/OY6lkzgXsVYxQOxndJ94=; b=ZTBDRjD8HMvuHq
	ZbAnTtEIqw0nHxq45YNMHPPjQuP0qYsSB5+ZtzNQxxkv+frLOHYcg8Ci3YTnLZ9oQVVcqodtfAKlH
	dzU9TYLQQd6IX9DR6tJcYCZkBTR53wtGAteTr+otiZk/Gz8REMM8u+kadQ9/qgWPwr06W9JA6/mFY
	39x1UNuQGpi+26bd14WvyWZZGLuUSgiwpZakkmTcN1W6KYrEtME6XUUaetfFxJj18CXMQICNka0Jp
	z5uN4M4jAfJ8whl1Rgl428rI8xYHtoYC36gpMWbVN93KPYurmcsUqSEFhtAPe0WXSTlKrgS7Bj1TL
	mJZXdNk+KfxBuHVjOiwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnpd-00000004OBv-1SNc;
	Tue, 10 Nov 2026 15:32:21 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnpW-00000004O98-0LOd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 15:32:19 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so1459159f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 07:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794324732; x=1794929532; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RVA7NkT+pOc7QldUcgD3Ut/OY6lkzgXsVYxQOxndJ94=;
        b=NCfsGGu5uekykqCs3WVmGeVig2GmpddmLuzZKWz+rAYuQuRw+Q7GeTW+ZRmYJ3c+gm
         cJ2fAYXLw3yovzjt1eVJ4Pk1MYlS3kTxnL3/vPkfVWS3wc4thIvavpMI7jlVSY3e2MmQ
         y2Ub3FOtDT8sQFZErjDJKTBlsHnvfv/WO4M/yiLViWpEdb49+s9xeM7Ud/dSKSnVn1JI
         lRwduzOS3hvDqT0bVSXR4enSh5b3/zkhe/lowq3P/i/0H2dJsaxc0Yb2H/sZWtg4HZPM
         WCU1tzdVaLxxECs1xwi1aoWgOk6RS5ibJxKYTrol/GHnCXFx3ZuEi6cdxxwJNE+uEc27
         oyFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324732; x=1794929532;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RVA7NkT+pOc7QldUcgD3Ut/OY6lkzgXsVYxQOxndJ94=;
        b=OuGsPUC/nimItLGDoZUXYMzvrnbaP3toL+tI+xIdkN3d89cER/8HNqqYdnoHN7dS/p
         sdDCZupb3e6Wugqg5bKzVF+o5NxclFFAINnQ9H2hQadV2JTaPsBsn9xxdgm9Bgk/kKZO
         ILcwiU/wdoc90pOIcpNDIbDfeSJX4Z5rGHDuiU/1aXTqm36h9JHDdK0BremppdK1KgSE
         njxBHyqy+VMHRV90sDYW5LQCd+YMwiUU9Rac+kTyFkgb/IfT6PPAVFvngRxHoxWPcqCT
         zQHYp91E2YAqdkuvxLSD1c19Tm2LtVaZ0F9qXyP+gRlTcP4z0P1zYWP/UT5PQhe/hv+5
         WYRw==
X-Gm-Message-State: APuU4Z9cmcd1Q4zrHf8yQW+Ocg4p7VEwxmOT/p2mvSyCYH8iQq2ZqbOb
	wtc3vEp2IBB7Qb6Q4Bm2ocId7JQ/nXtJmB2COoxZA4w6y6Dh6irdMf8+pucEzchTujVLFn/yxu5
	OuiwcAgU=
X-Gm-Gg: AYBFou2NBAV7jzCHe5JcOxPhUsgNugBu2LTQjbd6UGJVq7jORGDLCx/wOzaxm9tRutm
	saC2f2Rr7E1cYYk8+aJBJ25o+FMeX06TaXsCSpnx+jCAQJ5K4VoCeECniywHFffkzBVomk48YLC
	KpB+vR9dS/brt9ZlVoSGLLbYmlxd6PIqfMcaLyj8aNOrP7/ArunoKIzLN3zgYUZI9rSZAnnjFOH
	Inma+TKgLcYr/CNBUo6/6pAFdKIGEOmZc+7X3Ru7ODMgVDymkVLUGD+j8uGpGiMo5SgnNlJEMHW
	TYca9p/r8dwX7XumBcXa03nudqIzuuxVcMxm2vc18dOmfDmcExOLQHTCiswSaOzXUyV080YNXZJ
	XxXkaWVPhSGZ5AQoiiEP+J0QNvm8Pl9s/fFgdCVp2yAGvmE4zVXUjC9Sgq479U0xMkIFK8NsSXb
	a2le7W1oGAFLgE3TjyFfNL1qLl49PULocyWmh0zg4CDkqhpf8KoWugUGlKI1FPEItzPH44pORZ3
	oNrqQPjUdH/l6DVlOZhuYRzT738foIVPvl68xbKqRbGQEFvOaaJQgPARj4ESQ+t4WMRr5sZYxCU
	Um0hVbJUanlslrlYJ2M/KKLwme78aKlYVA==
X-Received: by 2002:a05:6000:1862:b0:493:fdf6:14aa with SMTP id ffacd0b85a97d-49831cd1d94mr5937057f8f.56.1794324732002;
        Tue, 10 Nov 2026 07:32:12 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498367b99bcsm5881429f8f.51.2026.11.10.07.32.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 07:32:11 -0800 (PST)
Message-ID: <671491ba-388c-4817-bdae-7348d5220cce@linaro.org>
Date: Tue, 10 Nov 2026 15:32:10 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/23] coresight: trbe: Decode TRBSR status codes
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-12-3f57cf3199b1@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-12-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_073214_170008_5CF0A897 
X-CRM114-Status: GOOD (  26.39  )
X-Spam-Score: -2.1 (--)
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



On 16/10/2026 17:55, Leo Yan wrote:
> trbe_get_fault_act() currently handles only a small set of TRBE stop
> reasons: external aborts, trigger events and stage 1 and 2 aborts. Other
> TRBSR_EL1 EC/BSC values are reported as spurious events, which hides
> useful failure information and makes the status handling hard to extend.
> 
> Decode the EC and BSC fields explicitly. Keep the normal fill-mode
> handling unchanged, but treat unsupported or unexpected status values as
> fatal and report them with a ratelimited diagnostic containing TRBSR_EL1,
> TRBPTR_EL1 and TRBLIMITR_EL1. Use %p for the buffer pointers so the
> printk diagnostic hashes their address values by default.
> 
> Stop using is_trbe_trg(), instead, use TRBSR_EL1_BSC_TRIGGER_EVENT as
> the unsupported trigger case. This keeps the stop-reason handling in the
> EC/BSC decode path, the driver can validate the status fields safely.
> 
> Move the TRBSR_EL1 BSC definitions to the arm64 sysreg header, and use
> the common TRBSR_EL1 EC/BSC names in the TRBE driver.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   arch/arm64/include/asm/sysreg.h              |  6 +++
>   drivers/hwtracing/coresight/coresight-trbe.c | 57 +++++++++++++++++++++++++---
>   drivers/hwtracing/coresight/coresight-trbe.h |  8 ----
>   3 files changed, 58 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
> index 7aa08d59d49448cfa3bb61f5cb42e0a6f1aa8a89..0e602f07625b3c4fe6cd3fd71a658ebae768d8fd 100644
> --- a/arch/arm64/include/asm/sysreg.h
> +++ b/arch/arm64/include/asm/sysreg.h
> @@ -357,6 +357,12 @@
>   #define TRBSR_EL1_BSC_MASK		GENMASK(5, 0)
>   #define TRBSR_EL1_BSC_SHIFT		0
>   
> +#define TRBSR_EL1_BSC_NOT_STOPPED	UL(0)
> +#define TRBSR_EL1_BSC_FILLED		UL(1)
> +#define TRBSR_EL1_BSC_TRIGGER_EVENT	UL(2)
> +#define TRBSR_EL1_BSC_MANUAL_STOP	UL(3)
> +#define TRBSR_EL1_BSC_BUF_SIZE		UL(4)
> +
>   #define SYS_PMINTENSET_EL1		sys_reg(3, 0, 9, 14, 1)
>   #define SYS_PMINTENCLR_EL1		sys_reg(3, 0, 9, 14, 2)
>   
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 1f51c33de83638479436683fd96e31d69c3b860f..a851f09d806a6b6a6386d6f7547b01a17f61b88e 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -658,29 +658,76 @@ static void trbe_enable_hw(struct trbe_buf *buf)
>   static enum trbe_fault_action trbe_get_fault_act(struct perf_output_handle *handle,
>   						 u64 trbsr)
>   {
> +	const char *err_str;
>   	int ec = get_trbe_ec(trbsr);
>   	int bsc = get_trbe_bsc(trbsr);
>   	struct trbe_buf *buf = etm_perf_sink_config(handle);
>   	struct trbe_cpudata *cpudata = buf->cpudata;
>   
>   	WARN_ON(is_trbe_running(trbsr));
> -	if (is_trbe_trg(trbsr) || is_trbe_abort(trbsr))
> -		return TRBE_FAULT_ACT_FATAL;
>   
> -	if ((ec == TRBE_EC_STAGE1_ABORT) || (ec == TRBE_EC_STAGE2_ABORT))
> -		return TRBE_FAULT_ACT_FATAL;
> +	if (is_trbe_abort(trbsr)) {
> +		err_str = "External abort";
> +		goto out_fatal;
> +	}
> +
> +	switch (ec) {
> +	case TRBSR_EL1_EC_OTHER:
> +		break;
> +	case TRBSR_EL1_EC_IMP_DEF:
> +		err_str = "Unexpected IMPDEF buffer management event";
> +		goto out_fatal;
> +	case TRBSR_EL1_EC_FAULT_GPC:
> +		err_str = "Granule Protection Check fault";
> +		goto out_fatal;
> +	case TRBSR_EL1_EC_FAULT_WRITE_S1:
> +		err_str = "Stage 1 data abort";
> +		goto out_fatal;
> +	case TRBSR_EL1_EC_FAULT_WRITE_S2:
> +		err_str = "Stage 2 data abort";
> +		goto out_fatal;
> +	default:
> +		err_str = "Unknown error code";
> +		goto out_fatal;
> +	}
> +
> +	switch (bsc) {
> +	case TRBSR_EL1_BSC_NOT_STOPPED:
> +		break;
> +	case TRBSR_EL1_BSC_FILLED:
> +		break;
> +	case TRBSR_EL1_BSC_TRIGGER_EVENT:
> +		err_str = "Unsupported trigger event";
> +		goto out_fatal;
> +	case TRBSR_EL1_BSC_MANUAL_STOP:
> +		err_str = "Unsupported manual stop";
> +		goto out_fatal;
> +	case TRBSR_EL1_BSC_BUF_SIZE:
> +		err_str = "Buffer size was too large";
> +		goto out_fatal;
> +	default:
> +		err_str = "Unexpected buffer status code";
> +		goto out_fatal;
> +	}
>   
>   	/*
>   	 * If the trbe is affected by TRBE_WORKAROUND_OVERWRITE_FILL_MODE,
>   	 * it might write data after a WRAP event in the fill mode.
>   	 * Thus the check TRBPTR == TRBBASER will not be honored.
>   	 */
> -	if ((is_trbe_wrap(trbsr) && (ec == TRBE_EC_OTHERS) && (bsc == TRBE_BSC_FILLED)) &&
> +	if ((is_trbe_wrap(trbsr) && (ec == TRBSR_EL1_EC_OTHER) && (bsc == TRBSR_EL1_BSC_FILLED)) &&
>   	    (trbe_may_overwrite_in_fill_mode(cpudata) ||
>   	     get_trbe_write_pointer() == get_trbe_base_pointer()))
>   		return TRBE_FAULT_ACT_WRAP;
>   
>   	return TRBE_FAULT_ACT_SPURIOUS;
> +
> +out_fatal:
> +	pr_err_ratelimited("%s on CPU %d [TRBSR=0x%016llx, TRBPTR=%p, TRBLIMITR=%p]\n",
> +			   err_str, smp_processor_id(), trbsr,
> +			   (void *)read_sysreg_s(SYS_TRBPTR_EL1),
> +			   (void *)read_sysreg_s(SYS_TRBLIMITR_EL1));
> +	return TRBE_FAULT_ACT_FATAL;
>   }
>   
>   static unsigned long trbe_get_trace_size(struct perf_output_handle *handle,
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.h b/drivers/hwtracing/coresight/coresight-trbe.h
> index 45202c48accec7c86ba56130e2737bc2d1830fae..8ba9ef4056e4dc3968816c6a7cbf2859f2bbed36 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.h
> +++ b/drivers/hwtracing/coresight/coresight-trbe.h
> @@ -35,19 +35,11 @@ static inline bool is_trbe_enabled(void)
>   	return trblimitr & TRBLIMITR_EL1_E;
>   }
>   
> -#define TRBE_EC_OTHERS		0
> -#define TRBE_EC_STAGE1_ABORT	36
> -#define TRBE_EC_STAGE2_ABORT	37
> -
>   static inline int get_trbe_ec(u64 trbsr)
>   {
>   	return (trbsr & TRBSR_EL1_EC_MASK) >> TRBSR_EL1_EC_SHIFT;
>   }
>   
> -#define TRBE_BSC_NOT_STOPPED 0
> -#define TRBE_BSC_FILLED      1
> -#define TRBE_BSC_TRIGGERED   2
> -
>   static inline int get_trbe_bsc(u64 trbsr)
>   {
>   	return (trbsr & TRBSR_EL1_BSC_MASK) >> TRBSR_EL1_BSC_SHIFT;
> 

Reviewed-by: James Clark <james.clark@linaro.org>



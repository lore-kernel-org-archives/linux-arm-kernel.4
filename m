Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE5B606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 15:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iR8OHrsr;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bfJ+to8O
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UvMdqZqn+rvCnCGcA12xeOpgSR/QPZFsKeBK3g656x8=; b=iR8OHrsrkqvibr
	oV3t7YPrhwUm+Db+lgef01Evdqd3ytVwDIIY5ofOVdRmaAEXn1szUKmcbOKJBWoS4HhMdSV27+CJZ
	TVkxf2geViSqjc07xn5248fq/qhMt84WXv9cBARDDoJTKc775ar4S7abCWUbOKAa/v0JwCzF14V28
	kZNS+ddWKXGun5tvdTEFtE1F6lqwi/dYO5NpSNVF5+RMj2TZDA/H1Q31zLYtkuecAZ7HyFQAIZx1y
	oqK3jjsOuIbG9zA6YyYDmfkVLqgQsuEz4ECudIA4ojLUL80SXmW7glNp7aSULdUm3/nn9KFsYpK26
	oB7BdiyeTJO1SffkAxeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnnH-00000004NIC-1gzw;
	Tue, 10 Nov 2026 15:29:55 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnnD-00000004NFz-1oro
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 15:29:53 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so25224305e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 07:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794324589; x=1794929389; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UvMdqZqn+rvCnCGcA12xeOpgSR/QPZFsKeBK3g656x8=;
        b=bfJ+to8OZzyOPHzqidZb5l04uniL5/odlt69OxaTUS5TZpS9p7+TdkD0Cr0VPDJSOX
         FIpEyfyLYZqUNmPugnTFMDIXVV3yA1032HVHw3ax1zkFVTgrNExKhxvLFJ1On2qhAJqR
         SBmpCE5gJQt3Sm4lApDGvhLGTjhjgoW8jEmcaAmtO2Xq2HbIG8qM9CdsCGyPcb0BrzLW
         nNVzVOl7MDFAS3p/NYn4bUQ5nJv0BI9GaBLNgtBsH1CcuLC+B9NunD0Yo7lJBW1MDTYI
         Qyw4Ccc9d0pnJaxVzceMpbclYBGyLuGM2PCBbn7fvbRTzZ1eF48AS+UAO1CFIOB08CCk
         ZyZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324589; x=1794929389;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UvMdqZqn+rvCnCGcA12xeOpgSR/QPZFsKeBK3g656x8=;
        b=Md6FnfPjSgkk6FXP+xM1jKzEzbXm5O6BQ3vjBNzju4H9XouY8O4r+IJBgEW8qMxbaI
         VgVcshLXObCGDNInj30C97cInjoQ6pNasSSLPiP29ZVExBYQpJD851azyneKovmOBoG1
         fo00Mvi49iLauvioHQwbKnVaKvuJ+HZaBsHryud//ALDCM3x5ceW2nEHbhVb0A5RhPkQ
         lSKw0XrEJyMBSNKY5zIQ3tNf9zTJh0DbQaI2P5jcPk/CINTlEaiZmgQ10di3HvuJZhs7
         T3/VofYq2ZW+J/rKFbS99t3cDgCf0L1TYA/TrLsuWCgALy2VdgK/ESkNpYhkJEz6abt3
         +cbQ==
X-Gm-Message-State: APuU4Z8bFocHje/WMHgtRNeBZwYcqteAQ6wZzxbgYnkLqRib2CKOesG8
	aqIMbhO0VnJsHAVLM6fkXqL/w8AOrtaK/horVbF1+6bKvCjsHzPGT2qroaUrsR619Fc=
X-Gm-Gg: AYBFou1Aq9oFPHtaLjR4FH0UxUNuF1e079KmKVFSk7dh8gJ83auwiCnEWKLVFr9PcTl
	bcYf3e7UlXDn3IELrPEzJ4pVT+0uVwgLOQTINMSUsJh1nUCT6CHgMCMkM50pI3elMvJWikLGgma
	w1yOYHUOe9o3W6KXIVdqDS0FkOhL25SeImcLq+hAsPXbWhG31hI3Wt3udO17Sd9+Gay8DmelI0n
	ub6JUQruz9v29eD7xZrj9fuIeawMNBaTxIYsqPUvmtjvlChhvxoBb+D3ocGQM3OWrqXbXTugdCV
	EZMtgAfel/wcuz/aqr2JHWxjYy4YL0kPQImr1MxaPYeRRs2YpHdLooPe8ZAGWwuelLP+nP4CRmV
	D+ffo/BFWuHrm258xwg52ughcxFx5zrAO+8kBekotXPD/JCH0m9943Y7db/8ReOTT5Fg09PJZN1
	VUKwaRih26ve6ZIIv5w52SXeAOKXXh043U/R3CShU/TpxYYyBYVPI2DpD2tQ3WlGGpdj/v9v4n2
	WzScUku0hIuvhHMNF0tNEi7WvlPruAhHECAEfhqxxRIarGafjXvnJYSBBdBnoXEMplcQuv2iFI1
	G+4oedrreHEkO10+/6bC620n1CTeI939bA==
X-Received: by 2002:a05:600c:8588:b0:4a2:cbe:bebc with SMTP id 5b1f17b1804b1-4ba0234cf6cmr40952855e9.23.1794324589131;
        Tue, 10 Nov 2026 07:29:49 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02345d22sm81654185e9.1.2026.11.10.07.29.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 07:29:48 -0800 (PST)
Message-ID: <e616fa33-10d0-49f9-8299-a6ccdd5c1edb@linaro.org>
Date: Tue, 10 Nov 2026 15:29:47 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/23] coresight: trbe: Validate perf handle before
 using sink data
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-5-3f57cf3199b1@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-5-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_072951_502712_2507B292 
X-CRM114-Status: GOOD (  19.47  )
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
> The TRBE IRQ handler calls etm_perf_sink_config(handle) before
> validating the per-CPU perf handle and its AUX transaction. This may
> dereference a NULL handle after disabling TRBE or access stale sink
> data after perf_aux_output_end().
> 
> Validate the handle and AUX transaction before accessing the sink
> configuration. Move the local buffer lookup closer to its use.
> Remove the warning for a NULL handle, which is expected after
> disabling TRBE.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 15 ++++++++-------
>   1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 91fbdbad3676ffae399df0b4d4ddcd603a40e86c..a7c1037a048f5236598f8f3a7cc4f47bff9d329c 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -1150,12 +1150,18 @@ static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
>   {
>   	struct perf_output_handle **handle_ptr = dev;
>   	struct perf_output_handle *handle = *handle_ptr;
> -	struct trbe_buf *buf = etm_perf_sink_config(handle);
> +	struct trbe_buf *buf;
>   	enum trbe_fault_action act;
>   	u64 status;
>   	bool truncated = false;
>   	u64 trfcr;
>   
> +	if (!handle || !perf_get_aux(handle))
> +		return IRQ_NONE;
> +
> +	if (!is_perf_trbe(handle))
> +		return IRQ_NONE;
> +
>   	/* Reads to TRBSR_EL1 is fine when TRBE is active */
>   	status = read_sysreg_s(SYS_TRBSR_EL1);
>   	/*
> @@ -1171,16 +1177,11 @@ static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
>   	 * Ensure the trace is visible to the CPUs and
>   	 * any external aborts have been resolved.
>   	 */
> +	buf = etm_perf_sink_config(handle);
>   	trbe_drain_and_disable_local(buf->cpudata);
>   	clr_trbe_irq();
>   	isb();
>   
> -	if (WARN_ON_ONCE(!handle) || !perf_get_aux(handle))
> -		return IRQ_NONE;
> -
> -	if (!is_perf_trbe(handle))
> -		return IRQ_NONE;
> -
>   	act = trbe_get_fault_act(handle, status);
>   	switch (act) {
>   	case TRBE_FAULT_ACT_WRAP:
> 

Reviewed-by: James Clark <james.clark@linaro.org>



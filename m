Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD919606A325
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 15:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ayg06+cL;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cpPI4SC+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yluzRKmVDPu+7EECyA/efKixS7yyj5ZyapVEgCd4Byg=; b=Ayg06+cLeNqX3M
	M/zUNkqqzdWr9xEeWTzoaDTdZGx+XpFbj+353IE58TrAEZe/qOw1U9Ak4VW96+D4CcYrW9Gj+Rsct
	eGscdmsExWkH2wdjyfjXBLfCPznJMAhkUEmn0VXBJDW8LdVMt4vvu+hVVyIr7mDrET0RFkIidQnhe
	UALmsxmpm34s6WAGwquZKsCNJFknvugJ4mjStHUyPptbJta3y6XobHihSG2IT22GdJWgaAnDB6jt8
	33RceL2eNfBjgDiCtVBrek73Beg0AL7Z+uboP9KgHqEGBWpWoHy/LkkGWtobjexselA2DsO2Vj14o
	miMM9eUuPYFn0GXebNyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnrO-00000004OqY-1L1b;
	Tue, 10 Nov 2026 15:34:10 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnrI-00000004OnB-1sDo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 15:34:08 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-4918c2d727fso1169860f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 07:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794324842; x=1794929642; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yluzRKmVDPu+7EECyA/efKixS7yyj5ZyapVEgCd4Byg=;
        b=cpPI4SC+dznP5ADMe2lF4IZ3EHt+zC2PQnnJRV0qjzivpJUScL8V0oVN/RlGuyPMwn
         iAkgeiMGsVZgVi7UrX//mhshkKvCf/pNAAnUXFf96wfxbCaAbh3AAL8F/SNmrilpKpgT
         XjOnP506LNqcNxD8JSs2TUvGzMwJ1ye8N6TG4iz/bfN0ry6Jr9/6RCXmJonuyDTVdzZL
         zuQWHLzOeZAPLjR0NEY7LUmo9pvV3ulJgbP11PpmcbT6dEFfV5GUSqt5HBh2fsQTldHF
         LjfCXLkAyN6CNjCCzxn2uXprDMQ6KqIgMlzBZ4Foy8/vueUEH+obczK83ZWTRGavkbNZ
         Jsdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324842; x=1794929642;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yluzRKmVDPu+7EECyA/efKixS7yyj5ZyapVEgCd4Byg=;
        b=EINuVPSYQ0v5OuP2MtGQ6H4V7Jd793fp1QWa8rTATCVDaBJqweaKzsE1ZiUczlAAMO
         mFrKdnhsZ0IDLvYMb3bhDTHjSgOZMSqHAiLmdku9o4v2tSPY9wOsVTY48Uq0PioFoHjb
         RtZ+HCGrjEtCTmj0LVQeut4p1d4GpaKMd1cy8yDB8febfaojEqv86vBvgBFF8nQQRvTn
         JdomTbPi/SW5vq8z8QpadjOKv7jenMgjcakyfHCiAyovHvNozIgDgT5yHHDEG359FivD
         I8VtbTuDt9zO2mghpBzx2szCn4Nq8g79UuGU4io2w7P3fmtIHyWGXderLWZPViEhqifC
         klwQ==
X-Gm-Message-State: APuU4Z+L/ETiKg4APafAcRzosQP+iJgfauQkHp7Jb9EdHYwQV97QzZy2
	NAdz/p9FzFrxPHrprlHIkvwLc1IyLK2DD1yHFl5LLXpwmfe32dZ7UPzUz/lv92o00Xzci8J2If3
	ue5d94+I=
X-Gm-Gg: AYBFou1G6o7/0Tu4OdfN/w7A4FmhuKJ61TJcl687EgzTvBWMy03PN2GJiljj/xR7suV
	03M/fc/Cx+MMPqkalF0HA4TgQH62zC30e6ik21nMKCcFdhXCh1uYLMdut0KeSPssh37AXbu0ZAG
	IwdCiudJSUdzx+tfF+IMpqSG7mjvuJZCaJwxciKLETUvRZHiC+b1KwU0Rle5vadkCk797sL96VZ
	TiVOU3j/md3dm3fYBQHNxjzLgE17vtpvq2fmcYGxrMxV4LRpkDKwrmBXB3cBrCxNWktpdVB8ERy
	ZuC5TdfLabEt94ZSfW2WjKXdU4LRvaIlR0JQ0btqi3m/9dO0XEgmpHrzxjaD+8VftrL4y9dXOB2
	OIS7IvsG3XQcG+M4Yu6WPMpsVIku3EPx1hV51iVZcCmywqfUGdhjbJZejTirrDG53HbXI17lOM5
	l5XVDLGSMCGuB27yGol6hhzGhj6N64/khgidetHVXygrT7brMomBFVxL7FDrstLG2joWIO16bxo
	07xo72n+/W851mXhp7xSmjpmqSqNmmbTyCaTVSmvw09VuIMkhDmIfD+zVLb4BzbnrMpPPqE9t1n
	sxK3AWcatXC3rsjnQH80STSpJeKrpZfCC1c=
X-Received: by 2002:a05:6000:25e9:b0:493:59c9:ebcf with SMTP id ffacd0b85a97d-49831432d19mr5298578f8f.57.1794324842495;
        Tue, 10 Nov 2026 07:34:02 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-499823761f5sm105321f8f.2.2026.11.10.07.34.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 07:34:02 -0800 (PST)
Message-ID: <bc1cd619-1b3a-4d67-98ff-c4351a1c3662@linaro.org>
Date: Tue, 10 Nov 2026 15:34:01 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/23] coresight: trbe: Always classify TRBSR when
 updating buffer
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-16-3f57cf3199b1@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-16-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_073404_516580_FD3A8C0B 
X-CRM114-Status: GOOD (  24.79  )
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
> arm_trbe_update_buffer() must account trace when perf stops a session,
> even if no maintenance interrupt has been handled. Prepare it for
> trigger and wrap modes by making the trace-size decision from the
> drained TRBSR status rather than gating classification on IRQ.
> Acknowledge IRQ only when it is set.
> 
> In FILL mode, reaching LIMIT sets WRAP and IRQ and returns TRBPTR to
> BASE. Interrupt delivery can be delayed, so update_buffer() may run
> before the IRQ handler. The existing IRQ-gated path uses WRAP to size
> through LIMIT in that case; preserve this while also classifying
> updates without a pending IRQ.
> 
> With classification on the no-IRQ path, a normal software stop can
> have TRBSR.S clear and an ignored detected trigger can set TRBSR.TRG.
> Neither should warn or discard valid trace. Mark fatal status as
> truncated and return zero. Use LIMIT for a filled WRAP and TRBPTR
> otherwise.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 24 +++++++++---------------
>   1 file changed, 9 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index ac49098aa08412a23a20d32f84c2e1977ee4a223..661f4a78e67c30652de8c834e4773819fa67b5ac 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -662,8 +662,6 @@ static enum trbe_fault_action trbe_get_fault_act(struct perf_output_handle *hand
>   	int ec = get_trbe_ec(trbsr);
>   	int bsc = get_trbe_bsc(trbsr);
>   
> -	WARN_ON(is_trbe_running(trbsr));
> -
>   	if (is_trbe_abort(trbsr)) {
>   		err_str = "External abort";
>   		goto out_fatal;
> @@ -844,7 +842,6 @@ static unsigned long arm_trbe_update_buffer(struct coresight_device *csdev,
>   	enum trbe_fault_action act;
>   	unsigned long size, status;
>   	unsigned long flags;
> -	bool wrap = false;
>   
>   	WARN_ON(buf->cpudata != cpudata);
>   	WARN_ON(cpudata->cpu != smp_processor_id());
> @@ -896,23 +893,20 @@ static unsigned long arm_trbe_update_buffer(struct coresight_device *csdev,
>   		 */
>   		clr_trbe_irq();
>   		isb();
> +	}
>   
> -		act = trbe_get_fault_act(handle, status);
> -		/*
> -		 * If this was not due to a WRAP event, we have some
> -		 * errors and as such buffer is empty.
> -		 */
> -		if (act != TRBE_FAULT_ACT_WRAP) {
> -			perf_aux_output_flag(handle, PERF_AUX_FLAG_TRUNCATED);
> -			size = 0;
> -			goto done;
> -		}
> +	act = trbe_get_fault_act(handle, status);
>   
> +	/* If an error occurred, the buffer may be empty */
> +	if (act == TRBE_FAULT_ACT_FATAL) {
> +		perf_aux_output_flag(handle, PERF_AUX_FLAG_TRUNCATED);
> +		size = 0;
> +		goto done;
> +	} else if (act == TRBE_FAULT_ACT_WRAP) {
>   		trbe_report_wrap_event(handle);
> -		wrap = true;
>   	}
>   
> -	size = trbe_get_trace_size(handle, buf, wrap);
> +	size = trbe_get_trace_size(handle, buf, act == TRBE_FAULT_ACT_WRAP);
>   
>   done:
>   	local_irq_restore(flags);
> 
Reviewed-by: James Clark <james.clark@linaro.org>


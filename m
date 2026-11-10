Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C29606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 15:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YMVuE+eZ;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=O2jjwSBq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JIUh1BH1B51WC0XFy0inaT2JZNS5gWn62vup4CtoZjI=; b=YMVuE+eZHBx2AM
	ErTOD5zdRvtEUnCP+yPpnHVzCrSoOb+TIvoYiSpnt+rrCjC0ucxC2t29OmaSjw9CMvhGoVtG6lcyI
	jKG3463bmFOZPh+PsIewwAv7yrb5r5BOft40NYQqvMI3wnDtcFhh93dtpOtCi7ETCud2kPFaa6My5
	TmDV1djMAW2rJnoBBaBYzhA/DZgEu6ClN6MyrgDxZwdTM7ZEhYmLiMvq2QlvVXGjfrf0gEnGI2gCo
	oH4XP61S7pltmH7go1bz+tHresg64GJPjjst6qPKhXuMdsciMo8wYjbdPJs2JTd32dssE2jSQjG0k
	KgXieKGbqR5XXcIWF87Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnqW-00000004OTW-36QG;
	Tue, 10 Nov 2026 15:33:16 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnqT-00000004ORm-2Rt2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 15:33:15 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so18234015e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 07:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794324792; x=1794929592; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JIUh1BH1B51WC0XFy0inaT2JZNS5gWn62vup4CtoZjI=;
        b=O2jjwSBqSQwVoLsqrFqPVMacIYMyky0YyfH8grKfU1+oX3kyKTYHg4hdm1QG1DWxeD
         CfTrmXGjYMERg/5Ed1WxC/w1+KE+1n0b5Q43r3K3kd48Ejpbo1cVizxLY/A+ovrSq87m
         4+B7Sl2bTN8cQJnzourLZ6OcollNiqIufad1j7VELiM7SQWf5HNLjFpPmX2Em8cTSvn0
         PFLUaLVLcRh1M31N8AlRCDvyyg5av04VFbJp4NLgRNZFFgdnl/Z8yRG5XBuPzDol2KzB
         IiR59hdtDHbyWAgkX/v7FavsFrL76SiTZWnD7UzipcXJJDeCCoBUzcLqC13lwF0Hhee9
         BqRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324792; x=1794929592;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JIUh1BH1B51WC0XFy0inaT2JZNS5gWn62vup4CtoZjI=;
        b=TYd2tZ9oElJYy2b2N9vC0IZaulF0B914mBE/mtD1lIr+uFIr7MH+5FUhdvUqlwYysm
         HFqAm+BiJL5ECjchxyFoaZiFdp282j+TvOI/2SYLR/wiqC82Meo9LRcDT/LRo+IIopXJ
         NhSh8bp6DwFk4ufsjSgNsyWRFX66sqRgsaS/BlPkR1k29UsoZNtOYLxvPSgKva/OvEHx
         hgCFxKkxXAUrNNq4DdX2eL+DrlIf0NV2nhFk9ilC614SokZ2DPOzOQe0r2CnwT0KKK19
         DVnSAsG+1uCXM0i7sFu2bonY/MkKvliTnV3yIJCUSc1yH+L3IPmri9ujoSDL1qGe4lA5
         Ps/Q==
X-Gm-Message-State: APuU4Z/HGlI7AhQfV3MUo3XM4m93DIXQgVnb0lR5YIqB8TVZvEF+5vJc
	7SNrMRVVFe0weZgObEISihCNjQ/YKUeFe43KvTwvXjlNIeJy43cWqRdFBwyTy8w12Lk=
X-Gm-Gg: AYBFou0G9GA4I7Ea6XjCoPLP72EVlfxQajbJe70hvRhbe9pfz02bJrJEOcDJR4sU5jD
	TsX3YL1gqLQZA/AqkYeICOWcYrqdfNgOEpYe3PIJchLWkqt2QhvpOuQ37KJCjVZMBGOPyrusXng
	tIWl2ZepUpVmqmBGQSjARaBe68zhxbTRqJz0Ym7ptfe39N8TEwZ9hf6mkPPtUXysdmPHq0LaoeT
	s3OWRW7m1KUmK38LspZspNjysdA8s7bYX6pIJE3YegbTa8KvMHrTpaafvFix1UA3fTpsbEQpabI
	XItIaS969COZXFo25xt0h8J8UYvW//OOh3uhTHzD+s0Gl/M9IEhbHAt2jYS1qOI4lSbXPwGPWuU
	LLU6GAnmQLHdwin+cN+aR21Lc+1cukGFMmNobfGb3YyoWSIIg1FUCvQOYy8nRs7lERR5rFwKQ/i
	N2hceUwvIeA0SyqtcP/PU6M4AB6csamwxB7XdsaNMVp3eYtO8+cBNz9i5cVWafeI+DtlxzJYUR4
	rGemRgSd7BzxqfvMED9lfQUlaIfKAVRmSE83yxD8ypDkjl6zs+vdKcoNCT9E+oaOnnSVaa8TKrs
	MNWdJDble8caCSMNXDzbVN+5fRSCtWY/5Q==
X-Received: by 2002:a05:600c:3143:b0:4a1:78c5:79f5 with SMTP id 5b1f17b1804b1-4ba02355f49mr48187005e9.33.1794324791389;
        Tue, 10 Nov 2026 07:33:11 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02387ed4sm47355825e9.4.2026.11.10.07.33.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 07:33:10 -0800 (PST)
Message-ID: <144477e4-e0f9-4c9c-94de-136c459e99a0@linaro.org>
Date: Tue, 10 Nov 2026 15:33:09 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/23] coresight: trbe: Treat access not allowed stops
 as fatal
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-14-3f57cf3199b1@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-14-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_073313_645738_59622085 
X-CRM114-Status: GOOD (  19.66  )
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
> Arm ARM (ARM DDI 0487 M.b), the rule R_RRCNN in "D6.11 UNPREDICTABLE
> behavior" permits a buffer management event when the effective SCR_EL3
> security state does not match the owning Security state. This can stop
> collection with IRQ=1, S=1, EC=0 and BSC=0 while leaving the other
> status fields unchanged.
> 
> With EA and WRAP clear, trbe_get_fault_act() currently returns SPURIOUS
> for this status. The spurious handler re-enables TRBE without clearing
> S, so collection can remain stopped. A retained WRAP indication can
> instead cause the status to be treated as a normal buffer wrap.
> 
> Recognize this architecturally permitted stopped status as an access
> not allowed error and return FATAL so the fatal handling reports
> truncated trace. Check the syndrome before WRAP and do not exclude
> TRG, since both fields are left unchanged by this stop. Check the saved
> IRQ bit to preserve updates without a pending interrupt.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 4aeed1a17c4bf1653fb41731ac15f31feec7ed2e..1c585b6123df2f20d08747678d836742ce9564cc 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -708,6 +708,14 @@ static enum trbe_fault_action trbe_get_fault_act(struct perf_output_handle *hand
>   		goto out_fatal;
>   	}
>   
> +	/* An access not allowed stop can leave WRAP and TRG unchanged. */
> +	if (is_trbe_irq(trbsr) && !is_trbe_running(trbsr) &&
> +	    ec == TRBSR_EL1_EC_OTHER &&
> +	    bsc == TRBSR_EL1_BSC_NOT_STOPPED) {
> +		err_str = "Trace buffer access not allowed";
> +		goto out_fatal;
> +	}
> +
>   	if (is_trbe_wrap(trbsr))
>   		return TRBE_FAULT_ACT_WRAP;
>   
> 
Reviewed-by: James Clark <james.clark@linaro.org>


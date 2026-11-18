Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C44606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 11:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dZArYF8T;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=bKW0qTq0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6ffufnkevwO9vAPh1vevODopGUaiiKz9CA2eJcqQaCg=; b=dZArYF8T9QnLNy
	lh8bJFJcvsw+S6wmGb41FLsprygyJZcZzHcx5Vu6w1Dmt5xAcWwpaOeTgJW9Lrdoz0jM/jxPjYat3
	IRq20E/VT6udQaCDoxGZFOoRLz2lWHXXuyefpHa5EZHaI4lgfRzGQRGSk+V8pdZ41HUQV3jwSC0c+
	Y1zkSF8Nexw94K8eh2vwuW0RX62MbW8eR5kZ83/bvGMXS5mBdIaOBJyGCZF4cdNDRnlApVxPP9Y6i
	MNeERjmomHfVi0Z1DPtBSQKRbjnSqLMTrPKgupbJkdDouPdF8f5mSRlzh/2Vo+R48zOqL7Y/sfObc
	BqiOijMIpzdmU327Grkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTdQX-00000008fmA-3IFb;
	Wed, 18 Nov 2026 11:02:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTdQS-00000008flP-3NRB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 11:02:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 54F07339;
	Wed, 18 Nov 2026 03:02:00 -0800 (PST)
Received: from [10.0.154.42] (e121487-lin.cambridge.arm.com [10.0.154.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 85DD93F632;
	Wed, 18 Nov 2026 03:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794999723; bh=hYNm5P0vnO8U/haSHt1cJzP127qSvrRU04WHL1UF9Po=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bKW0qTq0u56OK8+5FBBAikIOYVawRxzDbtctJrhm5/9bv6soS79Yb1t1oHtma9Ub3
	 vFjlA43eotGjqgbRsdn9vOy+oYbww7mkkd6Nz/f197Fdp5ygYOWqJv0Eb0goONBaT3
	 1U8AN2vNuXZ3HwPhTCDTxYGmT+3GNRvISpI0jXNM=
Message-ID: <f232d0ff-3286-4d85-b9e3-cad8c6bc7178@arm.com>
Date: Wed, 18 Nov 2026 11:01:57 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: head: set __entry_task along with task setup
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>,
 linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Kiryl Shutsemau <kas@kernel.org>,
 Breno Leitao <leitao@debian.org>, Jinjie Ruan <ruanjinjie@huawei.com>,
 Doug Anderson <dianders@chromium.org>, Linus Walleij <linusw@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Thomas Huth <thuth@redhat.com>,
 Dawei Li <dawei.li@linux.dev>, mrigendrachaubey
 <mrigendra.chaubey@gmail.com>, kernel-team@meta.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261117174814.95936-1-ada.coupriediaz@arm.com>
 <20261117174814.95936-4-ada.coupriediaz@arm.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20261117174814.95936-4-ada.coupriediaz@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_030204_936845_0AF475C0 
X-CRM114-Status: GOOD (  21.89  )
X-Spam-Score: -4.4 (----)
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

Hi Ada,

On 11/17/26 17:48, Ada Couprie Diaz wrote:
> `__entry_task` is only set after the first `switch_to()`, despite
> a proper task being set up in SP_EL0 as soon as CPUs go through
> `__{primary,secondary}_switched()`.
> 
> As SDEI can interrupt execution at any time, it can interrupt before
> the first `switch_to()` and use a null `__entry_task` to set
> its current task.
> 

TBH I do not know much about SDEI, but don't we need opt-in for
SDEI before we can get any SDEI events? If so, can we really
receive SDEI event before first switch_to()?

Cheers
Vladimir


> Set `__entry_task` as soon as we have a proper task set up in
> `init_cpu_task()` in case we get interrupted before switching threads.
> 
> Remove the second paragraph of the comment on `__entry_task`, as it has
> been incorrect since the introduction of SDEI, and even more so
> with this change.
> 
> Fixes: f5df26961853 ("arm64: kernel: Add arch-specific SDEI entry code and CPU masking")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> ---
>  arch/arm64/kernel/head.S    | 3 +++
>  arch/arm64/kernel/process.c | 3 ---
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
> index d6ba3c0af811..e53a9c6fec83 100644
> --- a/arch/arm64/kernel/head.S
> +++ b/arch/arm64/kernel/head.S
> @@ -209,6 +209,9 @@ SYM_CODE_END(preserve_boot_args)
>  	ldr	w\tmp2, [\tsk, #TSK_TI_CPU]
>  	ldr	\tmp1, [\tmp1, \tmp2, lsl #3]
>  	set_this_cpu_offset \tmp1
> +
> +	adr_l	\tmp2, __entry_task
> +	str	\tsk, [\tmp2, \tmp1]
>  	.endm
>  
>  /*
> diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
> index 42b15b0c069f..c3d194676efc 100644
> --- a/arch/arm64/kernel/process.c
> +++ b/arch/arm64/kernel/process.c
> @@ -584,9 +584,6 @@ static void ssbs_thread_switch(struct task_struct *next)
>  /*
>   * We store our current task in sp_el0, which is clobbered by userspace. Keep a
>   * shadow copy so that we can restore this upon entry from userspace.
> - *
> - * This is *only* for exception entry from EL0, and is not valid until we
> - * __switch_to() a user task.
>   */
>  DEFINE_PER_CPU(struct task_struct *, __entry_task);
>  
> -- 2.43.0
> 



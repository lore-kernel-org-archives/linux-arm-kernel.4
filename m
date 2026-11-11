Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F1C606A324
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 14:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kJ9Bw/54;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=GISsFkVV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+rsMwMVyOLGNo3mI0iUlcnObZ7s4LgOaX2JTHJr/1QA=; b=kJ9Bw/54+MIwOG
	6kwXkwucrUkQb7VlZj5n6E7xc+FgVyGtHuyqb3Iyw0FzFD2nvTGuGt0hRGEzqVroYvNoYtS0bHxwF
	5otrPaWNeo6XezGeDtIE0rttjEHE7Sf0xbDwzf4z1iFQXVkzp8LbJpNzmTeAqooD1jS92435WjyBo
	kw4B0qXhm5WVGmyEDHRtEq4Ewf7oJ1JR9tbxFU1lgzW3FHLuuEkDXENOkJuO2NoeKz2LWtHO2DRAc
	r15ORFDrFCtKjAC1A4Zd7FOPMIGljhWVmK4ziYsbI+hMvb528a4XSOnxLMH7GC7/2XOE+1QiHwh4k
	rPg0JjCPGky/3M8Fuvrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8zp-00000006utC-2GiV;
	Wed, 11 Nov 2026 14:08:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8zm-00000006usf-3fDY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 14:08:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 770891576;
	Wed, 11 Nov 2026 06:08:10 -0800 (PST)
Received: from [10.0.130.226] (e127648.arm.com [10.0.130.226])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7F1EA3F632;
	Wed, 11 Nov 2026 06:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794406093; bh=Zqu0jHu48SUjXqq0o2yDG9G1aHk1Ftd7CRiav7yRk/A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GISsFkVVYJh9GnhjSfKKWxlW19wBTFHlnQvyDQIcXhLEewv1f6A7s0aEiq0KwU2Au
	 TdnWYA9hzVa8B16VqqkCdrcnpommcz53nb1UsTnWfi7GZ46Ayk7hpaQJehtVnw+0bB
	 A9P3I9HyI9hPFoHJnYVBeqPAYCJUQ/RELn/qgxZE=
Message-ID: <1493f335-a808-471f-932a-393aaa390d25@arm.com>
Date: Wed, 11 Nov 2026 14:08:11 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: topology: Reduce the skew for AMU feedback
 counter sampling
To: Beata Michalska <beata.michalska@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Vladimir.Murzin@arm.com, catalin.marinas@arm.com, will@kernel.org,
 suzuki.poulose@arm.com, xuewen.yan94@gmail.com, linux-kernel@vger.kernel.org
References: <20261111124005.2688820-1-beata.michalska@arm.com>
 <20261111124005.2688820-4-beata.michalska@arm.com>
Content-Language: en-US
From: Christian Loehle <christian.loehle@arm.com>
In-Reply-To: <20261111124005.2688820-4-beata.michalska@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_060814_996307_FC5DA64F 
X-CRM114-Status: GOOD (  26.23  )
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

On 11/11/26 12:39, Beata Michalska wrote:
> With the FFH support for CPPC, the AMU feedback counters, core and const
> counter, are being sampled to measure CPU performance. Checking for errata
> (which can affect both counters) between the reads delays the second
> sample and can skew the result.
> 
> Take both samples in succession, then discard values from affected
> counters. This narrows the sampling interval used for CPPC feedback.
> 
> Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> ---
>  arch/arm64/kernel/topology.c | 76 +++++++++++++++++++++++-------------
>  1 file changed, 49 insertions(+), 27 deletions(-)
> 
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index 66ac67bd025e..c968fa5b0c88 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -381,29 +381,45 @@ enum cpc_ffh_ctr_id {
>  	CPC_FFH_CTR_CONST = 0x1,
>  };
>  
> -static void cpu_read_corecnt(void *val)
> +static inline void cpu_read_corecnt(void *val)
>  {
> -	/*
> -	 * A value of 0 can be returned if the current CPU does not support AMUs
> -	 * or if the counter is disabled for this CPU. A return value of 0 at
> -	 * counter read is properly handled as an error case by the users of the
> -	 * counter.
> -	 */
> -	*(u64 *)val = this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CORECNT) ?
> -		0UL : read_corecnt();
> +	*(u64 *)val = read_corecnt();
>  }
>  
> -static void cpu_read_constcnt(void *val)
> +static void cpu_try_read_corecnt(void *val)
>  {
> -	/*
> -	 * Return 0 if the current CPU is affected by a HW erratum.
> -	 * A value of 0 is also returned if the current CPU does not
> -	 * support AMUs or if the counter is disabled. A return
> -	 * value of 0 at counter read is properly handled as an error
> -	 * case by the users of the counter.

Since you're moving this comment around, AFAICT it's not actually true?
cpu_has_amu_feat() is checked (which will return -EOPNOTSUPP) before
landing here, right?


> -	 */
> -	*(u64 *)val = this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT) ?
> -		      0UL : read_constcnt();
> +	if (!this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CORECNT)) {
> +		cpu_read_corecnt(val);
> +	} else {
> +		/*
> +		 * A value of 0 can be returned if the current CPU does not support AMUs
> +		 * or if the counter is disabled for this CPU. A return value of 0 at
> +		 * counter read is properly handled as an error case by the users of the
> +		 * counter.
> +		 */
> +		*(u64 *)val = 0UL;
> +	}
> +}
> +
> +static inline void cpu_read_constcnt(void *val)
> +{
> +	*(u64 *)val = read_constcnt();
> +}
> +
> +static void cpu_try_read_constcnt(void *val)
> +{
> +	if (!this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT)) {
> +		cpu_read_constcnt(val);
> +	} else {
> +		/*
> +		 * Return 0 if the current CPU is affected by a HW erratum.
> +		 * A value of 0 is also returned if the current CPU does not
> +		 * support AMUs or if the counter is disabled. A return
> +		 * value of 0 at counter read is properly handled as an error
> +		 * case by the users of the counter.
> +		 */
> +		*(u64 *)val = 0UL;
> +	}
>  }
>  
>  static inline
> @@ -461,14 +477,20 @@ static void amu_read_core_const_ctrs(void *val)
>  {
>  	struct amu_ffh_ctrs *ctrs = val;
>  
> +	cpu_read_corecnt(&ctrs->corecnt);
> +	cpu_read_constcnt(&ctrs->constcnt);
> +
>  	/*
> -	 * cpu_read_constcnt() incurs slight latency due to the
> -	 * ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT check.
> -	 * Read it first to minimize the sampling skew between the const
> -	 * and core counters.
> +	 * Return 0 if the current CPU is affected by a HW erratum.
> +	 * A value of 0 is also returned if the current CPU does not
> +	 * support AMUs or if the counter is disabled. A return
> +	 * value of 0 at counter read is properly handled as an error
> +	 * case by the users of the counter.
>  	 */
> -	cpu_read_constcnt(&ctrs->constcnt);
> -	cpu_read_corecnt(&ctrs->corecnt);
> +	if (this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CORECNT))
> +		ctrs->corecnt = 0UL;
> +	if (this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT))
> +		ctrs->constcnt = 0UL;
>  }
>  
>  static bool cpc_ffh_reg_valid(const struct cpc_reg *reg)
> @@ -543,10 +565,10 @@ int cpc_read_ffh(int cpu, struct cpc_reg *reg, u64 *val)
>  
>  	switch ((u64)reg->address) {
>  	case CPC_FFH_CTR_CORE:
> -		ret = counters_read_on_cpu(cpu, cpu_read_corecnt, val);
> +		ret = counters_read_on_cpu(cpu, cpu_try_read_corecnt, val);
>  		break;
>  	case CPC_FFH_CTR_CONST:
> -		ret = counters_read_on_cpu(cpu, cpu_read_constcnt, val);
> +		ret = counters_read_on_cpu(cpu, cpu_try_read_constcnt, val);
>  		break;
>  	}
>  



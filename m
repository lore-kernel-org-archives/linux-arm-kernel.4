Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC5B606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 21:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cjFhK4Rx;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=eoW7ke6/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mZUvmKDMAWg2GS+aWsVhXjonVWOcc4rZt1XSjbUmm7k=; b=cjFhK4RxBPIV+C
	q3ydrtx8asJV/Qpk3r1Rk04QtneMEsO/ZYWLUZQer1sVt13fBC6H0oi8E2bO5w+XwaG8bPGnqLv0i
	PGkArDdSNHfADwlel7fkKtitETd6gKlfcALdu99Qdvcb3vjHj3jh+yZBKK8RgbpdWc1SUDZlbWsDQ
	xU4qAMFPSeUv0TQf0pFjeDluqjf6pPczrfFMtwuzYoM62j9zfmkNdFDiaStfXP/XSHrbuFZ0LCcZO
	S+NuuxxSHPyLWyBYgZWmA/vtlqpHR7f0vc6KCMjcqsvZ8m9oRpMlYyjcG51za3B0po3k+/EP3iOnt
	6upsc7Qq8X2MzWt5CRyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRbw0-0000000B2qz-1CsP;
	Thu, 12 Nov 2026 21:02:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRbvy-0000000B2qL-0GPR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 21:02:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E82D11516;
	Thu, 12 Nov 2026 13:02:06 -0800 (PST)
Received: from [10.57.15.226] (unknown [10.57.15.226])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7D0FA3F85F;
	Thu, 12 Nov 2026 13:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794517330; bh=kpE+vKitxl/WkaLdAORq01UZiNb0863ZWZuJw47idag=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eoW7ke6/oz4f5/yEbcARpCDN2wynpoZ7uR+/+WJHGameM/ICwL6iuJqZB9MEXWamt
	 555Oe4giT0+VjXmfp4b6mZPwxnhtBtfN0GW+50B5+cNUjzS8Lw22d2S+6yQKjXQFNx
	 VM/CRgriF79RRBzFIE3bk9mzxRw7/mr8ZUsmSmeQ=
Message-ID: <45c2bb0c-5b5f-4290-9265-ed02a2c241d4@arm.com>
Date: Thu, 12 Nov 2026 21:02:06 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: topology: Reduce the skew for AMU feedback
 counter sampling
To: Beata Michalska <beata.michalska@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Vladimir.Murzin@arm.com, catalin.marinas@arm.com, will@kernel.org,
 suzuki.poulose@arm.com, xuewen.yan94@gmail.com, linux-kernel@vger.kernel.org
References: <20261112191211.3336725-1-beata.michalska@arm.com>
 <20261112191211.3336725-4-beata.michalska@arm.com>
Content-Language: en-US
From: Christian Loehle <christian.loehle@arm.com>
In-Reply-To: <20261112191211.3336725-4-beata.michalska@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_130214_198082_0BB17C1F 
X-CRM114-Status: GOOD (  24.03  )
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

On 11/12/26 19:12, Beata Michalska wrote:
> With the FFH support for CPPC, the AMU feedback counters, core and const
> counter, are being sampled to measure CPU performance. Checking for errata
> (which can affect both counters) between the reads delays the second
> one and can skew the result.
> 
> Read both counters in succession if none is actually affected by HW
> errata.
> 
> And while at it, update the comments to be more accurate (or less
> inaccurate).
> 
> Signed-off-by: Beata Michalska <beata.michalska@arm.com>

Reviewed-by: Christian Loehle <christian.loehle@arm.com>

Testing this via the sysfs cpuinfo_cur_freq on orion o6 A520 (not
affected, both counters work) I get a p99 sampling error of:


  Reader / target workload             Before           Patch
  -------------------------------------------------------------
  Remote big CPU / idle                11.11             0.17
  Remote big CPU / busy                 2.22             0.22
  Another little CPU / busy             2.06             0.22
  Local / busy                         13.56             1.17

Nice!
Tested-by: Christian Loehle <christian.loehle@arm.com>

> ---
>  arch/arm64/kernel/topology.c | 38 ++++++++++++++++++++++--------------
>  1 file changed, 23 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index 30a52659f15c..d00aec6354e4 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -384,10 +384,10 @@ enum cpc_ffh_ctr_id {
>  static void cpu_read_corecnt(void *val)
>  {
>  	/*
> -	 * A value of 0 can be returned if the current CPU does not support AMUs
> -	 * or if the counter is disabled for this CPU. A return value of 0 at
> -	 * counter read is properly handled as an error case by the users of the
> -	 * counter.
> +	 * Return 0 if the current CPU is affected by a HW erratum.
> +	 * Otherwise, return the AMU counter value.
> +	 *
> +	 * A counter value of 0 is treated as an error by callers.
>  	 */
>  	*(u64 *)val = this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CORECNT) ?
>  		      0UL : read_corecnt();
> @@ -397,10 +397,9 @@ static void cpu_read_constcnt(void *val)
>  {
>  	/*
>  	 * Return 0 if the current CPU is affected by a HW erratum.
> -	 * A value of 0 is also returned if the current CPU does not
> -	 * support AMUs or if the counter is disabled. A return
> -	 * value of 0 at counter read is properly handled as an error
> -	 * case by the users of the counter.
> +	 * Otherwise, return the AMU counter value.
> +	 *
> +	 * A counter value of 0 is treated as an error by callers.
>  	 */
>  	*(u64 *)val = this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT) ?
>  		      0UL : read_constcnt();
> @@ -460,15 +459,24 @@ bool cpc_ffh_supported(void)
>  static void amu_read_core_const_ctrs(void *val)
>  {
>  	struct amu_ffh_ctrs *ctrs = val;
> -
> +	bool corecntr_broken =
> +		this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CORECNT);
> +	bool constcntr_broken =
> +		this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT);
> +
> +	if (!corecntr_broken && !constcntr_broken) {
> +		ctrs->corecnt = read_corecnt();
> +		ctrs->constcnt = read_constcnt();
> +		return;
> +	}
>  	/*
> -	 * cpu_read_constcnt() incurs slight latency due to the
> -	 * ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT check.
> -	 * Read it first to minimize the sampling skew between the const
> -	 * and core counters.
> +	 * Return 0 if the current CPU is affected by a HW erratum.
> +	 * Otherwise, return the AMU counter value.
> +	 *
> +	 * A counter value of 0 is treated as an error by callers.
>  	 */
> -	cpu_read_constcnt(&ctrs->constcnt);
> -	cpu_read_corecnt(&ctrs->corecnt);
> +	ctrs->corecnt = corecntr_broken ? 0UL : read_corecnt();
> +	ctrs->constcnt = constcntr_broken ? 0UL : read_constcnt();
>  }
>  
>  static bool cpc_ffh_reg_valid(const struct cpc_reg *reg)



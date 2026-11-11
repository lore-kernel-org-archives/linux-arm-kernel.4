Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAD5606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 10:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wqyrzVuB;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=SKfbxBxy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hHQyFW4WDyn4mLXFARFmt5ZkxCsNrkcbE49/jauLnzk=; b=wqyrzVuBIhcX+t
	cdKEvbCkujVnRmwYbGzErhYODDOS3TluAVqFMVcQnrg+egiAJdn2G8vW52V/DyZP61gubPFEEbs9r
	+YCFONOCiH1h2PjNGVd+8bceD3u1JfzRI9m4BTrGh418yuSG2hvXKoRQN67+AyQSw3AeXO51fSLys
	YkfAUYTn0YZTQZ19ToXKJionz1MKo7FGnIQGAmM/J/ZjkVk0IeI9kQ6AD6qVBwGhmggWH4TARNviU
	DP7gIGFz/juMf3jr0f6hB6YJNBqajaO9Mplw7eHEbhuwk1bDOm4l4bDcpr4aV4GB7MYLnVLCvJRS0
	Waft3fekopmhdOjJWRjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5Je-00000006JDc-37X2;
	Wed, 11 Nov 2026 10:12:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5JP-00000006JAj-1GaR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 10:12:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A66A1682;
	Wed, 11 Nov 2026 02:12:10 -0800 (PST)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 339AA3F632;
	Wed, 11 Nov 2026 02:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794391933; bh=02hMOjcRHLh1WSZk8DvetLfo/4v7NbYRgtGtrXJj1m4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SKfbxBxy9KlJ/v9coxt+xF+bLPOGQiciaSP2nq9M6iGd4NQn/mreA0sY1czlhXuZH
	 ESUDy4+40nyxsnrW/GkF1ex0a9lAYAzzPWKQhXCWkW+dF9ub6GC2fSm9E8gsBVSyGq
	 Mj6s7raFcfMQXLjmDuSE/7QJ+ckJbjARXx/hd7dg=
Message-ID: <d45dd5d2-15d2-41fc-adef-b8e9af9eb1a9@arm.com>
Date: Wed, 11 Nov 2026 10:12:10 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm_mpam: Account for a MBWU overflow before reading the
 counter value
To: Ping Li <leeonion.muyu@gmail.com>, james.morse@arm.com,
 reinette.chatre@intel.com, fenghuay@nvidia.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261111071709.3115172-1-leeonion.muyu@gmail.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261111071709.3115172-1-leeonion.muyu@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_021215_433604_E36F8F6A 
X-CRM114-Status: GOOD (  27.16  )
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

Hi Ping,

On 11/11/2026 07:17, Ping Li wrote:
> While checking the driver's overflow handling and NRDY behaviour with
> the design engineering team, the following problem was found in
> __ris_msmon_read_locked():
> 
> __ris_msmon_read_locked() reads the MSMON_CFG_MBWU_CTL overflow status
> bit, clears it, then reads the counter value. The counter value read is
> where the overflow is accounted for, by adding the counter size to the
> per-monitor correction value.
> 
> If the monitor reports NRDY when the counter value is read,
> __ris_msmon_read_locked() returns -EBUSY, and mpam_msmon_read() retries
> after waiting. The overflow status bit was already cleared, so the
> retry reads it as 0, and the overflow is never accounted for. Each
> occurrence silently loses a counter-size increment from the accumulated
> bandwidth count.

I was under the impression that this couldn't happen. Is the a theoretical fix or has this been
observed in practice?

From IHI0099B.d 6.2.2 I_PCDHG regarding MBWU and the NRDY:
"
If 1, then the monitor instance is not ready and the VALUE field does not have an accurate count or
measurement due to recent changes to the monitor settings.
"

Based on this, for MBWU you should only see NRDY set in the MAX_NRDY_USEC after a change of monitor
settings. At such a reset the VALUE is reset to 0. Are you seeing or potentially seeing an overflow
in this window of time?

Looking at 6.2.4 I_RZWDC we have "When an overflow occurs... The overflowed monitor VALUE and NRDY
fields can be reset to zero" but the use of 'can' rather than 'are' renders that statement mostly
useless.

Thanks,

Ben

> 
> The overflow status bit was read before it was cleared, so the overflow
> has already happened. Account for it before attempting to read the
> counter value, as the cleared status bit cannot be re-read.
> 
> Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
> ---
>  drivers/resctrl/mpam_devices.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 27abf60f4d67..5384c9a4a1ad 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -1528,6 +1528,16 @@ static void __ris_msmon_read_locked(struct mon_read *m)
>  			return;
>  	}
>  
> +	/*
> +	 * The overflow status bit was read above, before being cleared by
> +	 * software. The overflow has already happened, so account for it
> +	 * even if reading the counter value below fails, as the cleared
> +	 * status bit cannot be re-read.
> +	 */
> +	if (overflow)
> +		ris->mbwu_state[ctx->mon].correction +=
> +			mpam_msmon_overflow_val(m->type, msc);
> +
>  	switch (m->type) {
>  	case mpam_feat_msmon_csu:
>  		m->err = mpam_read_monsel_reg(msc, CSU, &now32);
> @@ -1569,9 +1579,6 @@ static void __ris_msmon_read_locked(struct mon_read *m)
>  
>  		mbwu_state = &ris->mbwu_state[ctx->mon];
>  
> -		if (overflow)
> -			mbwu_state->correction += mpam_msmon_overflow_val(m->type, msc);
> -
>  		/*
>  		 * Include bandwidth consumed before the last hardware reset and
>  		 * a counter size increment for each overflow.



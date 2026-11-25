Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34339606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 09:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cynI6M3f;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Vn2z9NFF;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=Y6deO8Fg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+GyNRtfZ/Gg5nfOosKfBbKBMYuMaQdy/cTWEDlpckSg=; b=cynI6M3fND7cPTRbfjABDrN7os
	hTNrPZF1To30uYip/AeeWr6LT+04AEKk1DZFiAnQUAT4vO4Ky142EyuIsEGgn/tZkVmCU+Wl86l+y
	EkMo3UEY/w4i8xPAA76prRkFcyx1pffsThZkFciJdVKM22JHhX1ZowZqvmwyhMX7Ggm5/n28lG2dq
	nrpC/DwzcNlrJg5VOUKz8z3w3wucziHOkEZ2wMKcMP2/w7Id5mrqYm6tEJD4ArHXk8UM5KjVOJdH6
	YDSNr2CGMGcEyK6ShPv+fV3aIlurooZyHiFZE1hfstqy4uvRJk6EcM7tdLHR1rt7uuP2W6V8w6mot
	9HchHY2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9fN-00000009NQg-3eVG;
	Wed, 25 Nov 2026 09:51:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9e3-00000009Myr-0i2x
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Nov 2026 09:50:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+GyNRtfZ/Gg5nfOosKfBbKBMYuMaQdy/cTWEDlpckSg=; b=Vn2z9NFFncuqgR/nFjvA5akpRf
	JwTeFfhTjTqxjRjdTuHTWZvpnZw4GLF/Sw9nbKenCntnzG3aeBd/IhT3FCJvHr5Up8EMy5RQiEU4S
	60NfyMBXPRcQR+foRcnuqCcG7R8vPLMcjXdyZypISZvzutHWYKA0OS2UG/tTbLVm0JROpCXtZSFjD
	BIUmlxjX4o3UMuU1FH/zM7geteng8Aie0dfeB/mpdzuFWxME+lBuYuTfUYu6KNYg3A/fTlPGGobzv
	YB8LhuhqVK7Ax7Ju5QI68FUMSF6eYk3EKNU0jnDO9i3/Y2Dvj/acPGF7nvbXWk0mM/EXgmW/lyTjd
	LqtpM/hQ==;
Received: from out30-118.freemail.mail.aliyun.com ([115.124.30.118])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9dz-000000058Up-28sz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 09:50:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1795600213; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=+GyNRtfZ/Gg5nfOosKfBbKBMYuMaQdy/cTWEDlpckSg=;
	b=Y6deO8FgNllLxoFH3+M27EDXm1UclgpprBtkzeh5Uspf0m75FWhZe4I/Ch15MxInvQSsVMS0WTLPRyGVV5qwOp8zIAo1+792tP+z3aM9Pq7fzNSAwFHBt8zmfuoNIznHltQF/nIO5X01wfIYIAWcCzMtc3680mtXazPgY5hBYuM=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=fengwei_yin@linux.alibaba.com;NM=1;PH=DS;RN=19;SR=0;TI=SMTPD_---0XFRAeUe_1795600210;
Received: from U-V2QX163P-2032.local(mailfrom:fengwei_yin@linux.alibaba.com fp:SMTPD_---0XFRAeUe_1795600210 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 25 Nov 2026 17:50:12 +0800
Date: Wed, 25 Nov 2026 17:50:10 +0800
From: YinFengwei <fengwei_yin@linux.alibaba.com>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Subject: Re: [PATCH 1/2] firmware: arm_sdei: Do not signal event 0 to a
 masked PE
Message-ID: <awavUsKX4XLRMbUq@U-V2QX163P-2032.local>
References: <20261124194707.1030653-1-kas@kernel.org>
 <20261124194707.1030653-2-kas@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261124194707.1030653-2-kas@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_095027_864289_8C378CB2 
X-CRM114-Status: GOOD (  15.83  )
X-Spam-Score: -15.7 (---------------)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, kernel-team@meta.com, Vladimir Murzin <vladimir.murzin@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, Cong Wang <cwang@multikernel.io>, Liao Chang <liaochang1@huawei.com>, Doug Anderson <dianders@chromium.org>, stable@vger.kernel.org, linux-kernel@vger.kernel.org, Ashok Raj <ashok.raj@oss.qualcomm.com>, James Morse <james.morse@arm.com>, linux-arm-kernel@lists.infradead.org, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Pengjie Zhang <zhangpengjie2@huawei.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Kirill,

On Tue, Nov 24, 2026 at 07:47:04PM +0000, Kiryl Shutsemau (Meta) wrote:
> The SDEI NMI backtrace signals event 0 to every other CPU, idle ones
<snip>
> +static void sdei_block_signal(void)
> +{
> +	struct sdei_pe *pe = this_cpu_ptr(&sdei_pe);
> +	unsigned long flags;
> +
> +	/*
> +	 * A panic from an SDEI event or a pseudo-NMI may have left the lock
> +	 * held by this CPU. The CPUs that could signal it are stopped by now.
> +	 */
> +	if (panic_on_this_cpu()) {
> +		WRITE_ONCE(pe->unmasked, false);
If the panic didn't take the lock, should lock be taken
just like "else" path?

> +	} else {
> +		raw_spin_lock_irqsave(&pe->lock, flags);
> +		WRITE_ONCE(pe->unmasked, false);
> +		raw_spin_unlock_irqrestore(&pe->lock, flags);
> +	}
> +
> +	sdei_wait_in_flight(pe);
> +}
> +
>  static int sdei_pm_notifier(struct notifier_block *nb, unsigned long action,
>  			    void *data)
>  {
> +	struct sdei_pe *pe = this_cpu_ptr(&sdei_pe);
>  	int rv;
>  
>  	WARN_ON_ONCE(preemptible());
>  
>  	switch (action) {
>  	case CPU_PM_ENTER:
> +		/*
> +		 * Leave alone a PE that is masked already: before
> +		 * sdei_cpuhp_up(), or after sdei_cpuhp_down(), as cpuidle runs
> +		 * until CPU_OFF. CPU_PM_EXIT must not unmask it.
> +		 */
> +		if (!pe->unmasked)
I am wondering whether READ_ONCE() should be used here?


Regards
Yin, Fengwei



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279A0606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 14:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=smyrABQf;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UbWI4eZe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Z0bHnKY18Sj6WcXxQyinu2JH9QaCsosfzwkAijHIYb4=; b=smyrABQfqEmt5S0EdLTVtM6SJi
	qtypNLzwgyEeW3g7oWzoLTSDdLqQBsQsaa4ofqPkZaxx/18kTlzxUxPAhnA1LMWQJBYAUkuVlPvem
	sfMtSbsD7mOXyLC22vn5dV1EdJjcPKCXWJgaHSkus0OT6Rx/BxVIBJHSc2OWwBHrCZDb9n4GSDiFO
	A3Kaa5nDfcQ7ikrTf6CEtizMDOu3vBgJDAVPjRuaapQ4EXoKTbQhI/5NBKdQk6X98b5rzxdIg9NCR
	a6I33XrE40c7B8XScDn+hdkNrv6zj6XPgre3k8JMrmVRdXg5rJ9zx+QVtQ8LALvorNyOnyZZaqtQh
	1U4iv0ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDYR-0000000A5KL-1dIq;
	Wed, 25 Nov 2026 14:00:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDYH-0000000A5If-34at
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 14:00:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E755B62859;
	Wed, 25 Nov 2026 14:00:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3849A1F000D8;
	Wed, 25 Nov 2026 14:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795615248;
	bh=Z0bHnKY18Sj6WcXxQyinu2JH9QaCsosfzwkAijHIYb4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UbWI4eZeRteujIZd5MPk06V94cl1sNONzrM0toh6SKwb7AwYFjj8MtCdX3pZaD416
	 R88GcU8SpSfviZfMXfm964s5ba1erNPxBTEXZbaDo6XworvzdEfUd3vYk24/L/qi+g
	 TuZ7PM7WMT6rcWlOhGenYOvFvykt+W+OO7LJIApiWJIFsPmUqcmzMVWVv44ufA3rky
	 tLYAmePdpmENS2V/EiZ/5oBd8ZMtDO1rjL8ppIoSpPIAipadH9QGe/ePaCldERRDOo
	 nqAiz9axllYYwC/MU5rHKU0N7dFXDsnv3p6DgG8PEJqOWqv64KlKq7jY+tqOtp7jv6
	 y5tIZ03Jfw3fA==
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfauth.ams.internal (Postfix) with ESMTP id 82BF71980047;
	Wed, 25 Nov 2026 09:00:42 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Wed, 25 Nov 2026 09:00:45 -0500
X-ME-Sender: <xms:CeoGa2sbyq-knPaAr3polUCbTbAfusbSEbQkIuv3RGnGMDeE4I0IpA>
    <xme:CeoGa5XUKPcBCJPbEyYstOF2hF5CZuHf8u0_gDMsgSIBKBgaSp8f4AMl65r0kymk4
    6IpJz6zjcIMAjwll9tB_wwZqtlLcCs9sI-2RPpw8cu5Pqt0zY_kZDLI>
X-ME-Received: <xmr:CeoGa63VkcYmI44d81-pIkWLwEJV3_2mriNLyrNKXgF5TBl-s4g4hEvoXsA>
X-ME-Proxy-Cause: dmFkZTE1O4eBS6dBEH9F3C68qqyjyJ1vnOzgFGQ7e1lDYlMXiP0Bqwgudxue3EzhshTdfZ
    wxdOsHNh21Us4t2qr8NIs2D82OWq8GrNR1+ApgjQnugMMUoOefB61JIxFry+YnlrEEPH0k
    1lulqQ/KbfKwP3+h1Eq7NvvIazNhJ+RPZPqAUo6W6yvezRDAuG1Y9F4WydegAGsGXmWudY
    uU/N0qF8rm1u8E23C3PBv/eYYSy65rIJIibXjAFAeda30En8uHkgplstM2XZioKLBowZJu
    OQY/fboU+VsjF9UxxOTbEw3f2yad/ggXJ3hOpEq6coiUonOsSwIgZaZ/EJfocaRDTuU9B2
    bpLH5GD503xlV1pw+X3TwoVttniLzFa5tkg/BlSGvpUUmV95buRKk+ZEFQkeCc6gNdHDR9
    cZknIrGoR1hZBn+WTQ4ax3Cm/YYmBNK6WUDb2wLj/L4AojiXVzVUGY9OlSme68dHnVCJPC
    EBZDvP5pgx4DOZIu8Pcv3syC6zvvEJQ++fneb7YiYAACWex4c8LaUOQ8NOxhFFt+6aqcCQ
    ara+dxH+3HxYKIl4QBtspz+zZnTvm4tdjBZMgMgZS92PFHfDbLm6/QNtlRk3cKCE/HMKfa
    vRoeL7e0y6AjGDREEe0jC3Ar91Wm0pEXHArWXQP9hAdrsG4pq4nqvpDQTPig
X-ME-Proxy: <xmx:CeoGayfGny5F21riOaLOveSjwn-EJAzPaJzk4-vqnbHv7Pj2nN2sfg>
    <xmx:CuoGa_VqJrc_CqPIcNU_aqo4LWnmsfqTTBV008mUeuWEwrI1fvFrAA>
    <xmx:CuoGaw86kLMVxJ-7NBMr55J-FMvV0cQxvHDDazJAmckz17uJpjue6A>
    <xmx:CuoGa0ixiJ8Vgnu-6JNrddSNMUl08zogEhc0hAW983Iq7YrEfhFSpA>
    <xmx:CuoGa9VZt9XGvySBLdrZn4-zvJMAa5b6m1fu_TiYaJjV86Zb5hFoyQGY>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Nov 2026 09:00:41 -0500 (EST)
Date: Wed, 25 Nov 2026 14:00:40 +0000
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: YinFengwei <fengwei_yin@linux.alibaba.com>
Subject: Re: [PATCH 1/2] firmware: arm_sdei: Do not signal event 0 to a
 masked PE
Message-ID: <awblcOnI8JVhpmPK@shutemov.name>
References: <20261124194707.1030653-1-kas@kernel.org>
 <20261124194707.1030653-2-kas@kernel.org>
 <awavUsKX4XLRMbUq@U-V2QX163P-2032.local>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awavUsKX4XLRMbUq@U-V2QX163P-2032.local>
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 25, 2026 at 05:50:10PM +0800, YinFengwei wrote:
> Hi Kirill,
> 
> On Tue, Nov 24, 2026 at 07:47:04PM +0000, Kiryl Shutsemau (Meta) wrote:
> > The SDEI NMI backtrace signals event 0 to every other CPU, idle ones
> <snip>
> > +static void sdei_block_signal(void)
> > +{
> > +	struct sdei_pe *pe = this_cpu_ptr(&sdei_pe);
> > +	unsigned long flags;
> > +
> > +	/*
> > +	 * A panic from an SDEI event or a pseudo-NMI may have left the lock
> > +	 * held by this CPU. The CPUs that could signal it are stopped by now.
> > +	 */
> > +	if (panic_on_this_cpu()) {
> > +		WRITE_ONCE(pe->unmasked, false);
> If the panic didn't take the lock, should lock be taken
> just like "else" path?

If another CPU holds it at this point, that CPU was stopped in the
middle of signalling this one, and it will never drop the lock. The
panic would hang on it.

If nobody holds it, there is nothing for it to keep out. This runs at
the end of smp_send_stop(), after the other CPUs have been stopped. A
sender stopped after it took the lock has either counted its signal,
which sdei_wait_in_flight() waits for, or never sent one.

Telling the two apart takes a trylock, and on failure we would go ahead
without the lock anyway.

> > +	} else {
> > +		raw_spin_lock_irqsave(&pe->lock, flags);
> > +		WRITE_ONCE(pe->unmasked, false);
> > +		raw_spin_unlock_irqrestore(&pe->lock, flags);
> > +	}
> > +
> > +	sdei_wait_in_flight(pe);
> > +}
> > +
> >  static int sdei_pm_notifier(struct notifier_block *nb, unsigned long action,
> >  			    void *data)
> >  {
> > +	struct sdei_pe *pe = this_cpu_ptr(&sdei_pe);
> >  	int rv;
> >  
> >  	WARN_ON_ONCE(preemptible());
> >  
> >  	switch (action) {
> >  	case CPU_PM_ENTER:
> > +		/*
> > +		 * Leave alone a PE that is masked already: before
> > +		 * sdei_cpuhp_up(), or after sdei_cpuhp_down(), as cpuidle runs
> > +		 * until CPU_OFF. CPU_PM_EXIT must not unmask it.
> > +		 */
> > +		if (!pe->unmasked)
> I am wondering whether READ_ONCE() should be used here?

No.

We read the flag of this CPU, and only this CPU writes pe->unmasked.
The notifier runs with IRQs off, so no store can race with this load.

What can still interrupt it, a stop or a panic from an SDEI event or a
pseudo-NMI, does not return here.

READ_ONCE()/WRITE_ONCE() are for sdei_event_signal(), which reads the
flag from another CPU.

Left plain, KCSAN will report it if that ever changes. See item 5 under
"Use of Plain C-Language Accesses" in
tools/memory-model/Documentation/access-marking.txt.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov


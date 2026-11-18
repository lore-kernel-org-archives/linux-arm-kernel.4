Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE37606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 06:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WhGFm8kQ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.a=rsa-sha256 header.s=test20231205 header.b=DkJnRBon
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GFY5eXhrSXz7DCVGm5HhwAGhhVHVuaa22feO3ifIlN4=; b=WhGFm8kQ8blqCLgIQZX+vIpON3
	FKnC2csv0knEfqGYmHdI9nE82FGhrpTaphQ7MeAcjTlQDSMp3AiEolgrhS8aAN/F8Av/C+92BWO8W
	VL/SGxZVsDSmFj9UZA7lN59rP5Ujb7SUDKjXsAI6FoTLJkS7Bd6mWxE4k9AFnNyZLNAxKaabaKhjL
	M/9Kyan4Wn9qLQOPfyfyOQUZwrjKJCReXJUWhbyhl6MlPB2X6juesaI00wnzpNPixHO9v3RnMev7D
	eRGqMtY+MfOd5vJSEmq22+ppRIm9dcVXYo/I5A+l/J3gcnkcqprKM7bnRyAPa9POhh7ZffBu8YEz1
	HlEC4IEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTYqV-00000007q71-06Ou;
	Wed, 18 Nov 2026 06:08:39 +0000
Received: from outgoing2021.csail.mit.edu ([128.30.2.78])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTYqQ-00000007q5M-1oMG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 06:08:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=outgoing.csail.mit.edu; s=test20231205; h=In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=GFY5eXhrSXz7DCVGm5HhwAGhhVHVuaa22feO3ifIlN4=; t=1794982114;
	x=1795846114; b=DkJnRBon2UQWAvdnEcPi3Ohx0j64HIUWwHF28eDvVifNHBIWoqWITdoa/1Z5M
	THjoooLjhrLFTglrxq6xxCo5JVLbsCNTmdfvPBUESXVPbI86lkuU4TEKFrPj2WLk4iquI5rRzjfSr
	hLhb2QbeUHF5xjT4TxyOuArWd2O9eFm/Q37QFuf9isVA4S4Isifi+zyCLd+eH+sAWfTo4Ke50rEHF
	24P0IEavxeEALHW6Xq/ixlWXXj/alFP+ntnPLVCx9w4BYueRoPIetmexc6qkagTZ31Ta1t+5oKYMx
	IkqiYGyniw7/lUoPSnSqEn5H/dQf1csHEM/flUxB7tnAF4pWyA==;
Received: from [167.220.238.88] (helo=csail.mit.edu)
	by outgoing2021.csail.mit.edu with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <srivatsa@csail.mit.edu>)
	id 1xTYqJ-00EpBt-C4;
	Wed, 18 Nov 2026 01:08:27 -0500
Date: Wed, 18 Nov 2026 11:38:14 +0530
From: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
To: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
Cc: "Pandey, Radhey Shyam" <radheys@amd.com>, jassisinghbrar@gmail.com,
	michal.simek@amd.com, tanmay.shah@amd.com, saeed.nowshadi@amd.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	ssengar@linux.microsoft.com, tgopinath@linux.microsoft.com,
	tglx@linutronix.de
Subject: Re: [PATCH 1/2] mailbox: zynqmp-ipi: Fix CPU hotplug state cleanup
Message-ID: <av1Azk3TNy05J-Z3@csail.mit.edu>
References: <20261103062051.676519-1-ptsm@linux.microsoft.com>
 <15903ed0-d3bd-4cf9-a051-ec663411ae38@amd.com>
 <439409ae-bd42-459e-9c0d-21fc5629f635@linux.microsoft.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <439409ae-bd42-459e-9c0d-21fc5629f635@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_220834_645382_A341D9BD 
X-CRM114-Status: GOOD (  16.80  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 04:51:28PM +0530, Prasanna Kumar T S M wrote:
> Hi Radhey Shyam,
> 
> Thanks for reviewing this.
> 
> On 04-11-2026 11:23, Pandey, Radhey Shyam wrote:
> > On 11/3/2026 11:50 AM, Prasanna Kumar T S M wrote:
> > > On driver removal, the CPUHP_AP_ONLINE_DYN CPU hotplug state is removed
> > > instead of the its actual state. This can leave the mailbox driver
> > > callbacks dangling. Use the actual CPU hotplug state during driver
> > > removal.
> > > 
> > > Hotplug registration failures are also ignored, allowing probe to
> > > succeed without the callbacks needed to enable interrupts on CPUs
> > > brought online later.
> > > 

[...]

> > > @@ -863,15 +864,22 @@ static int xlnx_mbox_init_sgi(struct
> > > platform_device *pdev,
> > >       irq_set_status_flags(pdata->virq_sgi, IRQ_PER_CPU);
> > >       /* Setup function for the CPU hot-plug cases */
> > > -    cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "mailbox/sgi:starting",
> > > -              xlnx_mbox_cpuhp_start, xlnx_mbox_cpuhp_down);
> > > +    pdata->hp_state = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
> > > +              "mailbox/sgi:starting", xlnx_mbox_cpuhp_start,
> > 
> > what is :starting here ?
> 
> I used the existing string.

Let's please fix it while we are at it. The convention is to match the
mode in the @name argument to the CPU hotplug state that it is
associated with. So in this case, :online would be the right one to
use instead of :starting.

Also, could you consider editing the names of the callbacks for
symmetry? Ex: We can rename them to xlnx_mbox_cpuhp_startup() and
xlnx_mbox_cpuhp_teardown() instead of _start() and _down() that are
used today.

Regards,
Srivatsa


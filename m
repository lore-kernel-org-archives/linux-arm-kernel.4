Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDE9606A330
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 06:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Mq2Ze0R6;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.a=rsa-sha256 header.s=test20231205 header.b=n7yFg0me
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jRRU8RPJrxcp7t0qWX4SXKqmEYCn8GHmGrRqIBb1xgs=; b=Mq2Ze0R66p2Z/yWbTq7yX0h+Hf
	AmWjpo0y33Fsydr3WbIash2uzALYrop0aMHm8tLPTf2dAQMQJVa1/6hOuHGWHpn/WvYkOLQ8eXaLr
	vLZmkPKopqWde7I2tsW9Ck4f0sSqf8KEg6+fyC3iQ0JvipyHZRC9trYavhiec1FaJ2iu1LciZwql7
	SdvJP708DG5ZwVPi+5DTyL+p4VigPAxN8MsQq7vOd1izqMDbWwssujXvqwEmiIz7NCcZtPHjGtn9o
	3y9ynG0EfOk+oA8I//98Tm6zXf7JOp1HL9/hN+l3dcB9LQTazkEDWMtAbElEYcPMBolzJ0M48UOJ1
	FksoSK5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZ1V-00000007rff-48U6;
	Wed, 18 Nov 2026 06:20:01 +0000
Received: from outgoing2021.csail.mit.edu ([128.30.2.78])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZ1K-00000007rV4-2Tfx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 06:20:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=outgoing.csail.mit.edu; s=test20231205; h=In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=jRRU8RPJrxcp7t0qWX4SXKqmEYCn8GHmGrRqIBb1xgs=; t=1794982790;
	x=1795846790; b=n7yFg0meSKM+jlEku3ZQONOSzVhPH25groFVv4YGxeNCjbq5p24Pp95gRIeBN
	BKSvtzsA1X66KH0MWp0mE9P/kxzsnTiChkWiOy02SsEP4G0p/Qbl03yfCh8gkjTWe0sh6N/Nsax38
	Ibty8aef1xFtbLdlOT8iLOyGhrUNxh/4Bpz3xkXA0YPbqMcOJ5TZsQJB8Mzi+ZW8/ki9pJhcP8Hrb
	Lnz/IlP0a8wnEs0TqvHKO6IEb8J55TuDKku0fjaOdyRsMLLG901BYOMXOOu3PBvs8bLSBx5smA3ch
	OUNOu0Wp6Mrt+s0udm9egUw6M5K+vsxIvWv87H0hGPKC+B9HBA==;
Received: from [167.220.238.88] (helo=csail.mit.edu)
	by outgoing2021.csail.mit.edu with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <srivatsa@csail.mit.edu>)
	id 1xTZ1G-00ErIB-KJ;
	Wed, 18 Nov 2026 01:19:47 -0500
Date: Wed, 18 Nov 2026 11:49:38 +0530
From: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
To: "Pandey, Radhey Shyam" <radheys@amd.com>
Cc: Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	jassisinghbrar@gmail.com, michal.simek@amd.com, tanmay.shah@amd.com,
	saeed.nowshadi@amd.com, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, ssengar@linux.microsoft.com,
	tgopinath@linux.microsoft.com, tglx@linutronix.de
Subject: Re: [PATCH 1/2] mailbox: zynqmp-ipi: Fix CPU hotplug state cleanup
Message-ID: <av1DetqUhUGqdyu3@csail.mit.edu>
References: <20261103062051.676519-1-ptsm@linux.microsoft.com>
 <15903ed0-d3bd-4cf9-a051-ec663411ae38@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <15903ed0-d3bd-4cf9-a051-ec663411ae38@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_221950_756028_C7AB9F09 
X-CRM114-Status: GOOD (  16.91  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 11:23:33AM +0530, Pandey, Radhey Shyam wrote:
> On 11/3/2026 11:50 AM, Prasanna Kumar T S M wrote:
> > On driver removal, the CPUHP_AP_ONLINE_DYN CPU hotplug state is removed
> > instead of the its actual state. This can leave the mailbox driver
> > callbacks dangling. Use the actual CPU hotplug state during driver
> > removal.
> > 
> > Hotplug registration failures are also ignored, allowing probe to
> > succeed without the callbacks needed to enable interrupts on CPUs
> > brought online later.
> > 
> > Fixes: 6ffb1635341be ("mailbox: zynqmp: handle SGI for shared IPI")
> 
[...]
> 
> > +			  xlnx_mbox_cpuhp_down);
> > +	if (pdata->hp_state < 0) {
> > +		irq_clear_status_flags(pdata->virq_sgi, IRQ_PER_CPU);
> > +		free_percpu_irq(pdata->virq_sgi, &per_cpu_pdata);
> > +		irq_dispose_mapping(pdata->virq_sgi);
> > +		return pdata->hp_state;
> 
>  1. The new error path double-frees and then hits BUG().
> Please reconfirm.
> 
> zynqmp_ipi_probe() sets pdata->irq_type before calling xlnx_mbox_init_sgi(),
> and its only error label runs
>   zynqmp_ipi_free_mboxes() → xlnx_mbox_cleanup_sgi() whenever irq_type ==
> IPI_IRQ_TYPE_SGI. So the new unwind runs, then the caller's unwind repeats
>   irq_clear_status_flags(), free_percpu_irq() and irq_dispose_mapping().

Good catch!

> Before any of that, cleanup calls cpuhp_remove_state(pdata->hp_state) with
> the negative errno still in the field, and _cpuhp_remove_state_cpuslocked()
> opens with BUG_ON(cpuhp_cb_check(state)), which rejects anything <=
> CPUHP_OFFLINE. A failed hotplug registration now panics instead of failing
> probe.
> 

So, xlnx_mbox_init_sgi() should simply return an error upon CPU
hotplug registration failure and let the caller handle the cleanup;
and in xlnx_mbox_cleanup_sgi(), a check for pdata->hp_state > 0 should
be added like this:

if (pdata->hp_state > 0)
	cpuhp_remove_state(pdata->hp_state);

I think that ought to fix both the issues pointed out above.

> 
> > +	}
> >   	return ret;
> >   }
> >   static void xlnx_mbox_cleanup_sgi(struct zynqmp_ipi_pdata *pdata)
> >   {
> > -	cpuhp_remove_state(CPUHP_AP_ONLINE_DYN);
> > +	cpuhp_remove_state(pdata->hp_state);
> >   	on_each_cpu(xlnx_disable_percpu_irq, NULL, 1);
> 

Regards,
Srivatsa


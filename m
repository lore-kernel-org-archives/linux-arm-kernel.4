Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA3C606A337
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 10:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oPJ1NNRj;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=PDglBlM/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8qpFJTQJNqH4kuXk+XmN+VPaQAvz9MQR49d5IWwG+zg=; b=oPJ1NNRjZ9EOMnuIdezBtkik++
	iVy2iKoysusBb08uxOB1q88aCWzgXibZQPB05niMxoaFBitpyf6bljW92XgJzraIFwAAsaZLBMixJ
	WPM4jzdphCbwBMYTkKvTxAD6kK4//rcONpdnP0e3uFU7NnRBqrMvMffv/HsT41HhJs7nBjKLvIewI
	R7PAtUlZ3RabYtSHwXrIRlmQRtP8R+98PqXxmW4ifevkBuFN1GmlEdRKx2/ToB31H/eRJwrVGAdgu
	P2rOuLySqxQDdVgxe4s/cJe4qG+WHciTyRl2yax/ict1bxij/jFNGFYR0wex6r+V6710zSPrBqPS/
	Kc7Scq0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTdEB-00000008cAq-14kg;
	Wed, 18 Nov 2026 10:49:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTdE8-00000008cAD-2szF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 10:49:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF3021596;
	Wed, 18 Nov 2026 02:49:16 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5AFDF3F632;
	Wed, 18 Nov 2026 02:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794998959; bh=XIha2GVLAxwYSuR85wz1DCbMMvVzPhIANipUJo6MIGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PDglBlM/0ytJRqea9vC6S2XJpkArmWLZvBcLC5CTB0Mk3z2vVWZVijhDNhs5V1YuM
	 wsmCNhJDu6xdJzoKmALcLegCb0KRPnMqpLleOHde4pInXJmgTOWgFEG/Dj/36XdYXz
	 PVyfbjH1lVM0g9s0tUl6JWP5deGNVMFN26swzpSg=
Date: Wed, 18 Nov 2026 10:49:17 +0000
From: Leo Yan <leo.yan@arm.com>
To: Igor Velkov <iav@iav.lv>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: coresight: cpu-debug: PC sampling via PMPCSR (FEAT_PCSRv8p2)?
Message-ID: <20261118104917.GW9176@e132581.arm.com>
References: <20261113-coresight-pmpcsr-question-1@iav.lv>
 <20261113144623.GQ9176@e132581.arm.com>
 <20261114-coresight-pmpcsr-reply-leo-1@iav.lv>
 <20261117183241.GV9176@e132581.arm.com>
 <20261117-coresight-pmpcsr-reply-leo-2@iav.lv>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117-coresight-pmpcsr-reply-leo-2@iav.lv>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_024920_771626_13A3B1C8 
X-CRM114-Status: GOOD (  15.36  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 17, 2026 at 08:50:00PM +0200, Igor Velkov wrote:
> On Tue, Nov 17, 2026 at 06:32:41PM +0000, Leo Yan wrote:
> > Could we explore a hook in the CPU hard lockup detector? Seems this
> > module is more relevant to hard lockup rather than panic.
> 
> Yes, that fits better. The hard lockup detector reports a CPU that
> missed its watchdog hrtimer interrupts, so it runs with IRQs masked and
> is not in an idle powerdown. The backtrace request then names the CPUs
> that did not answer ("these CPUS still haven't responded"). I would
> sample PCSR only for those, from a hook at that point, and leave the
> panic notifier alone. Does that sound right?

Yes, sampling CPUs that do not respond to the backtrace request sounds
reasonable.

The hard lockup detector can also call panic(), so we should avoid a
second dump from the panic notifier. After hook with hard-lockup
diagnosis, then makes sense to remove that panic notifier.

For CPU power state, could we take a cautious approach in the driver?

 1) If idle_cpu(cpu) == 0, sample the CPU directly.
 2) If idle_cpu(cpu) == 1, follow the existing flow to request
    power-up before sampling.
 3) Consider adding a module parameter, such as skip_idle, for
    hardware that doesn't support or honour EDPRCR_COREPURQ. This
    would allow the driver to sample only active CPUs.

Thanks,
Leo


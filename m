Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F6A606A325
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 23:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KiyyqxKx;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FO2d75cW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=c2wcJSy191Sf7d/IySA1wmn/KvQ1rPLNxdHXHM+fBb0=; b=KiyyqxKxLsozXcpayaGFKG1Z77
	CptvAI7tV+pUWEqrExVQ+7DNgOo85iys8l1/rKov7qvC6kLtMhU3pWS8oabkotgz5KP18hcZsEYbM
	wTQAOLdHP2ANYqEcrz3dZ8gqVb1D8YwgN9cJBKTGpjWExZtuPtG3uiFMk4qG/Mbbc8sHQP7hD0APR
	Gu4KsAvZY03jqCpXbDspB0hPXwnrDfye+0uaXHfZtyHttd/LCK3I3NwEa0OxsyxEivARNkfbSzQdy
	kqcQC3G91qChEBGZ4plItecmTkl6Rl6O4NGzvJj0Joe4Lfg+HP+MDtWTYGacFd1OGtOge0SHXdLjg
	8nGvjeyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUBCt-0000000DdQa-0HUk;
	Thu, 19 Nov 2026 23:06:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUBCs-0000000DdQU-0Ytp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 23:06:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8099F4189E;
	Thu, 19 Nov 2026 23:06:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 186711F000C4;
	Thu, 19 Nov 2026 23:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795129577;
	bh=c2wcJSy191Sf7d/IySA1wmn/KvQ1rPLNxdHXHM+fBb0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FO2d75cWx84mrxM/Q61IC5bHYN5D4VdYfUgKISQ6fCg8yWN1AGnRdYGqbAcEZQn4C
	 02W6uIr0rc/HJXdxzfpC7ocRhPJka6Zr24ldhDbwhWX+DJqtwTJbLfpa3uBgQglrYe
	 NRM2kEoJs7wGN6E57/+tyoP6xVPt/RE+H0768J7u8fQCzgkmS3jIIktzrXtpucp5Q5
	 mQV8s5uoUG+GuFgBUE9N8B63ib+iKoyK3W6wFaiNGjrX5TYaX0FmtXZy6/nN09gPoz
	 r1zT/gm6CT383dO4Kpu6srlu673fdNuxMMQ069kkBLZNgGGDRrGeb9TpWYiOLdBYev
	 vKHKmU5K3+a7w==
Date: Thu, 19 Nov 2026 17:06:14 -0600
From: Rob Herring <robh@kernel.org>
To: James Clark <jjc@jclark.com>
Cc: netdev-bot+sashiko@kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, richardcochran@gmail.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, lee@kernel.org, s-vadapalli@ti.com,
	rogerq@kernel.org, bigeasy@linutronix.de,
	martin.kaistra@linutronix.de, vadim.fedorenko@linux.dev,
	r-sharma3@ti.com, robertcnelson@gmail.com, nm@ti.com,
	vigneshr@ti.com, netdev@vger.kernel.org, devicetree@vger.kernel.org,
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next 3/3] net: ethernet: ti: am65-cpts: implement
 PTP_SYS_OFFSET_PRECISE
Message-ID: <20261119230614.GA1147583-robh@kernel.org>
References: <fd826c118aec02c06bde92ff9c20f1958c214b3d.1794284248.git.jjc@jclark.com>
 <179446830443.2199510.10552580927894870264@kernel.org>
 <20261117004133.1594972-1-jjc@jclark.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117004133.1594972-1-jjc@jclark.com>
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

On Tue, Nov 17, 2026 at 07:41:33AM +0700, James Clark wrote:
> > [Severity: Medium]
> > Is it safe for this driver to own the EXPBIT_SEL field of GTC_CFG0_PUSHEVT?
> >
> > The register belongs to the SoC-wide GTC, not to the CPTS.
> > am65_cpts_ptp_getcrosststamp() rewrites it on every PTP_SYS_OFFSET_PRECISE
> > request. The previous value is never saved or restored, on success or on
> > error.
> [ ... ]
> > Suppose one of those consumers expects a different exported bit.
> 
> There is no other user in the tree currently. If in the future something
> else in the kernel wants to use it, then the solution would be a small
> driver to mediate this. If there is a user outside the kernel, I am not
> sure what you would have me do about it.

Would doing this imply a DT change? If so, your binding is not future 
proof.

> 
> > [Severity: Medium]
> > Should val be checked here, to confirm that EXPBIT_SEL now reads back as
> > AM65_CPTS_GTC_PUSH_BIT?
> 
> I agree this would be an improvement and I will do this in v2.
> 
> > [Severity: Medium]
> > Should a failed syscon lookup be fatal here? A bad index just below only
> > logs an error and leaves the feature disabled.
> 
> A ti,gtc-push phandle that doesn't resolve to a syscon is a broken
> device tree, so failing the probe is right, and it lets -EPROBE_DEFER
> through.

Not the kernel's job to validate the DT. If something in DT is optional, 
then whether it is missing or wrong doesn't really matter.

> 
> [ ... ]
> > With CONFIG_MFD_SYSCON=n, the syscon stub returns ERR_PTR(-ENOTSUPP). Any
> > DT with ti,gtc-push would then stop Ethernet from probing.
> 
> MFD_SYSCON cannot be off here: TI_K3_AM65_CPTS depends on ARCH_K3,
> which selects TI_K3_SOCINFO, which selects MFD_SYSCON.

Is that true for *every* kernel version? Again, better user experience 
IMO to just warn if something is missing and continue on enabling 
whatever you can.

Rob


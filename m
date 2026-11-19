Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3567D606BA90
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 14:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2w6CJ0YO;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Ppl3Ddsr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yv1N0djmZyEGMIYg7VXKeF/ldKuiOCcGdsOrrzCOVrk=; b=2w6CJ0YOQldTp2Iuqko1ZvukXd
	Q9z2QbED6IaxAROcOYQwKgG/CJNEpEQMltU3KqMA5dM4r756TmFUdS9rAL6fPDsHoz5p156Nvh0V1
	vhMH+kLoI7RyGbhqsjVTOEzjBQP0lzCWdCRGmPSTBlPryTmJEfWK0ZU16CYqcFx/jlOScY2tgSCzx
	TfsF0XpLvfsx+z4IPBOuDesp7ylyV6sCdOX88iKzw5ySSFsmpNQFm+tcxznPZzGHA99bLXShlDvvM
	Fsj+kg1jQh+JRcHhAfBlJ86WI6Xp7IxgYQM8vzpXmHuCmLs6B4TFtkLqKbmhC/jm5fWSzF+Wfh2wu
	G/P4wIUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU3Sh-0000000CHYY-1j5y;
	Thu, 19 Nov 2026 14:50:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU3Sf-0000000CHXa-1CFY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 14:50:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 98A5C19F0;
	Thu, 19 Nov 2026 06:49:58 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 328963F673;
	Thu, 19 Nov 2026 06:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795099801; bh=Fnun0mKomugL954yD61XjX3IYKj8R0xQ7sSqlxsYi10=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ppl3DdsrKLxJa9EorrCawTo3PVOa+dqBTLIDO1g1YaqKxXwd3exOmLETdTJmmm38/
	 6gBdrHM0rGvCqo3SM8Ws3CEPUhmynHWyrc8SvQZUuQI7tw3OD1VmdwTSrGczBUoVuA
	 R5FeC/DY4BmgofCQIcXJcFSVConvO6G/Ku6WYPFc=
Date: Thu, 19 Nov 2026 14:49:59 +0000
From: Leo Yan <leo.yan@arm.com>
To: Kepplinger-Novakovic Martin <Martin.Kepplinger-Novakovic@ginzinger.com>
Cc: "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"mike.leach@arm.com" <mike.leach@arm.com>,
	"james.clark@linaro.org" <james.clark@linaro.org>,
	"alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"coresight@lists.linaro.org" <coresight@lists.linaro.org>,
	Roosen Henri <Henri.Roosen@ginzinger.com>
Subject: Re: [BUG] coresight: during reboot-loop-test, boot hangs during 1st
 us
Message-ID: <20261119144959.GY9176@e132581.arm.com>
References: <f3e3c30ef76310fb6fb7d00019a8ef11e91ee1e1.camel@ginzinger.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3e3c30ef76310fb6fb7d00019a8ef11e91ee1e1.camel@ginzinger.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_065005_412651_9F16C8F5 
X-CRM114-Status: GOOD (  17.89  )
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

Hi,

On Thu, Nov 19, 2026 at 11:10:50AM +0000, Kepplinger-Novakovic Martin wrote:
> hi Suzuki, Mike and others,
> 
> I don't really know the coresight hardware but with CORESIGHT enabled, when I do
> "reboot tests" on imx8mp, I see the kernel hang after (randomly) 200 to 2000 (sometimes
> a hang was seen even later) reboots at *about* the line below. But indeed not exactly
> that line. sometimes it stops 4-7 lines earlier!

Could you enable earlycon together with ignore_loglevel and initcall_debug?
So far, the info is too limited to give any useful hints.

> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd034]
> [    0.000000] Linux version 6.18.63-ge-26.10+-ge_bep4-eta-1-00195-gb8bebc692f96 (root@ginzinger) (aarch64-buildroot-linux-gnu-gcc.br_real (Buildroot
> -gf002287f) 13.4.0, GNU ld (GNU Binutils) 2.43.1) #41 SMP PREEMPT Thu Nov 12 09:08:03 CET 2026
> [    0.000000] KASLR disabled due to lack of seed
> [    0.000000] Machine model: BE-P4 i.MX8MPlus in NDM
> [    0.000000] NUMA: Faking a node at [mem 0x0000000040000000-0x000000007fffffff]
> [    0.000000] NODE_DATA(0) allocated [mem 0x7fdb6e80-0x7fdb9b7f]
> [    0.000000] Zone ranges:
> [    0.000000]   DMA      [mem 0x0000000040000000-0x000000007fffffff]
> [    0.000000]   DMA32    empty
> [    0.000000]   Normal   empty
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x0000000040000000-0x000000007fffffff]
> [    0.000000] Initmem setup node 0 [mem 0x0000000040000000-0x000000007fffffff]
> [    0.000000] cma: Reserved 32 MiB at 0x000000007cc00000
> [    0.000000] psci: probing for conduit method from DT.
> [    0.000000] psci: PSCIv1.1 detected in firmware.
> [    0.000000] psci: Using standard PSCI v0.2 function IDs
> [    0.000000] psci: MIGRATE_INFO_TYPE not supported.
> 
> The kernel does not panic. It hangs. The problem goes away and it reboots indefinitely
> when I disable coresight in the config.

Could you confirm what exactly CoreSight modules have been enabled?

> I sometimes need to run an old v5.10-imx based kernel, where I've *not* reproduced
> this hang with coresight enabled.
> 
> Was there a regression in mainline or does NXP have a fix in their tree? Have you see
> something like this before?

I am not aware of a CoreSight regression. I cannot comment on NXP
board as I don't have it.

As separate diagnostic tests, could you try clk_ignore_unused and
nohlt, one at a time, to see whether unused-clock disabling or
CPU idle affects reproduction?

Thanks,
Leo


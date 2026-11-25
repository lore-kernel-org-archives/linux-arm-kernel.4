Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57133606A323
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 10:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WM6LAAUU;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Ege24fce
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=E9AcbjjrJ2xy7jcqpCfaiWdiGho3lEa4cvynlMytnfg=; b=WM6LAAUUYOVqlh5jaoUofsrjRW
	NbkkomDLb+DsJZx4BV37i2e5e22vrkkiXbMig1oyhUjAmnuIU6bgSNBExUcz1f04x4FhO22NiT8nB
	362T/ERPktjseld/h5/rLxDBnk0fFsTDLKVy8/y8527XVjlks4DAkLVejpBU0Gmi+ahJ7vHRiSdTX
	Lev6cVQxwT80rIhQbjZReopXVvXh7kpKE/Oh78ioB+T3QWwOEhHiYxbU+lCCuboTKppimke/OL0IK
	lErijRSyBkMc8HbRsZxr0wZLQ8AFkakk1tzAx4na6GRNRh62DC/n0rSs7oVQznz2foPGLatEagBHl
	SAWOyo2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9o6-00000009P3V-3pr3;
	Wed, 25 Nov 2026 10:00:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9o4-00000009P38-1WCt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 10:00:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 130AB339;
	Wed, 25 Nov 2026 02:00:48 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8AB903F86F;
	Wed, 25 Nov 2026 02:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795600850; bh=mutwYsaLP50FCZfAjQtB9EJ9xbGNKRNXZIOvAS1wXiw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ege24fcez8Fc905VMXrWRag+8JxnngOGIcTmOxNiuTgGGLd8fXJzrAbf77OTDajzN
	 uQebFB3h7m/GIAkxsOJLc/bYgbpdkeuqlzB0J+8KopdQpkAlYdnrsBfRe3XiDFtW9G
	 0NL3CXUMgD81vTR+6VVY5UGGRcx2/EueH9LMgc+I=
Date: Wed, 25 Nov 2026 10:00:48 +0000
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
Message-ID: <20261125100048.GB7209@e132581.arm.com>
References: <f3e3c30ef76310fb6fb7d00019a8ef11e91ee1e1.camel@ginzinger.com>
 <20261119144959.GY9176@e132581.arm.com>
 <d1ca1f8533228923a400a22ce91a870f8a92369f.camel@ginzinger.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d1ca1f8533228923a400a22ce91a870f8a92369f.camel@ginzinger.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_020052_476880_663DAA75 
X-CRM114-Status: GOOD (  17.38  )
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

On Wed, Nov 25, 2026 at 06:56:06AM +0000, Kepplinger-Novakovic Martin wrote:

...

> The 2 hangs differ only in 1 line! The last line here "dcss"
> was only printed in 1 of the 2. Other than that, they are identical up to the
> return of drm_display_helper_module_init:
> 
> [    7.328547] calling  arm_smmu_init+0x0/0x6c @ 1
> [    7.328935] initcall arm_smmu_init+0x0/0x6c returned 0 after 377 usecs
> [    7.328948] calling  arm_smmu_driver_init+0x0/0x2c @ 1
> [    7.329065] initcall arm_smmu_driver_init+0x0/0x2c returned 0 after 108 usecs
> [    7.329077] calling  drm_core_init+0x0/0xbc @ 1
> [    7.329131] initcall drm_core_init+0x0/0xbc returned 0 after 42 usecs
> [    7.329143] calling  drm_display_helper_module_init+0x0/0x8 @ 1
> [    7.329155] initcall drm_display_helper_module_init+0x0/0x8 returned 0 after 0 usecs
> [    7.329167] calling  dcss_platform_driver_init+0x0/0x38 @ 1

CoreSight initialization appears to have completed. One possibility is
that runtime PM then disabled a clock or power domain that a later
driver needs.

Seems to me, dcss_platform_driver_init() is suspicious. If it is
dependent on clocks used by CoreSight, this can be the cause.

> > Could you confirm what exactly CoreSight modules have been enabled?
> 
> of course:
> 
> CONFIG_CORESIGHT=y
> CONFIG_CORESIGHT_LINKS_AND_SINKS=y
> CONFIG_CORESIGHT_LINK_AND_SINK_TMC=y
> CONFIG_CORESIGHT_SOURCE_ETM4X=y

Thanks, that matches the logs.

> > As separate diagnostic tests, could you try clk_ignore_unused and
> > nohlt, one at a time, to see whether unused-clock disabling or
> > CPU idle affects reproduction?
> 
> I'll do that as a follow up later.

AI reminds on clk_ignore_unused: "if dcss_platform_driver_init() itself
hangs, the kernel never reaches the clock cleanup. Runtime PM can
disable a clock before that point. I’d first check whether the DCSS
probe reaches its first write to DCSS_BLKCTL_CONTROL0 and whether the
required clocks are enabled at that point." It makes sense to me.

Thanks,
Leo


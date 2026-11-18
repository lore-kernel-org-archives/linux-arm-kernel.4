Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8489D606A325
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 17:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gFjXXwDG;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=E/+vJZDo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gX24UlkehAbyugxYOTBhxkmtprZYy49+19QytOdeMto=; b=gFjXXwDGMAjKvqdla5Z+6sYFax
	X7oAIyngdUM7sf2tZH+MD7EL8nVDe6X8ExeLpC7vfhVrXsphWgR3uUsZkx+LtynIg8g8hIpxDaOv9
	pbrf6z9rBlIDlV0E5hkK1t8sGyiLitJR+9/Hu6atFYzp53WXQQEJCqoot5Y0wqfK9uXhoFg3Hu2RH
	muHIa4kscn2s/8K+MF8o0fwP9bHL4DgKuQhX6jh3GQCgFztxmuAOHSeqQTmfwJkyQqjqkCbKWljXN
	dQ7BenCVVJH8P0a2b9GY6BTWfr9MEL7P9sYJoDB6xL2hMQnSbLsOW8p+W3LoW/Ug+fVWtF8nc0EqC
	yEcNaC8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTjFT-00000009k47-1cab;
	Wed, 18 Nov 2026 17:15:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTjFQ-00000009k2y-1DEx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 17:15:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9459F1596;
	Wed, 18 Nov 2026 09:14:56 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 603573F632;
	Wed, 18 Nov 2026 09:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795022099; bh=YhZWMU2wfiNBJL8lajkRtTzt8g9FwIp0WP7TV6KuxmY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E/+vJZDoIknDKiVOE54ix103UrqX6vGzX3Cs/DWxZ6xKR03TsPMPUzk6+9Cm6cYNZ
	 m630MRvBVyYrCIBy27/azkL2irePALActhdOYM1tXEXVgJn37LTU6d4Y7J5cH4hswP
	 n4w93RTh9CsSB3nnZ/9/V5ouSNqLBErersKxK87w=
Date: Wed, 18 Nov 2026 17:14:51 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH v2 1/2] arm64: module: Emit BTI veneers for cross-section
 calls
Message-ID: <av3dC9SRzdZc6REO@arm.com>
References: <20261005110511.157016-4-ardb+git@google.com>
 <20261005110511.157016-5-ardb+git@google.com>
 <autdMwEbDqF2u0Wr@arm.com>
 <536669c0-1e59-4d9c-9601-2691689da8bf@app.fastmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <536669c0-1e59-4d9c-9601-2691689da8bf@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_091504_376029_5BD748E8 
X-CRM114-Status: GOOD (  18.11  )
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

On Thu, Nov 12, 2026 at 12:11:02PM +0100, Ard Biesheuvel wrote:
> On Wed, 4 Nov 2026, at 17:28, Catalin Marinas wrote:
> > Apart from those, I don't have other technical objections to the patch
> > but I wonder whether we'll find alternative options going forward that
> > make this fix redundant. E.g. allocating .init.text and .text together
> > (you had an RFC) or a new execmem_alloc_near() to try to place them
> > nearby.
> >
> > In the meantime, would something like the following work for us instead
> > of the veneers? We won't free the .init.text module section but this
> > should be small. There's the ppc64 precedent.
> >
> > bool module_init_section(const char *name)
> > {
> > 	if (system_supports_bti_kernel() && strstarts(name, ".init.text"))
> > 		return false;
> >
> > 	return strstarts(name, ".init");
> > }
> >
> 
> I've done an experiment to simply combine these unconditionally, and the
> impact on module .text footprint on a typical config is negligible (~10k
> per 100 loaded modules). That would make this change unnecessary, and would
> allow the init PLTs and init ftrace trampoline to be dropped as well.

I forgot about this thread. Thanks for testing. That's fine by me to
make it unconditional. Would you mind respinning with the above? I guess
we still need the Kconfig checks.

Thanks.

-- 
Catalin


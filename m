Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F50606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 11:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EzXj/z7+;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=csHsaRXA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jzjjf75BdPt0KXw71TlYd0nbTXRabtrZA0M4R/TEScc=; b=EzXj/z7+Fu2HveGR+TgSoqzsoQ
	l0AY70ONTaUbUAv2EYQRHWGjLlJdpVlg2DF6bxZYiuSkYFPnfedUC9cd/s5GlaC/wdDWJ/7g6RJOV
	rPmB3+rD5cvo+FlMzfDHJNflZvAWT67zp4+IQ88d3sT0OcENmKSz+xx/KjvLN4J1CKDqSQNYwgQdc
	PbmJnsHp6LUBdx3RM2qh2PIu6EJPu4/sgrK9y9M02yt0a/yHMVKcLZqKQ8MTzRsLp+/cAnOCUMy0J
	NDz4lGSLBFRQfCDOcwLJsuNyuU3WYHC+S3oZ8fi1TTycMhyqIC0iBD/bYZyMgNeF1BSvUh4pyiyF1
	xq5V17Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVoni-00000006N0T-0W4e;
	Tue, 24 Nov 2026 11:35:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVonf-00000006Mzx-04Mb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 11:35:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 29207339;
	Tue, 24 Nov 2026 03:34:58 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 487373F86F;
	Tue, 24 Nov 2026 03:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795520101; bh=itpBozBXqi58AIY5X5mlQrWFgkN3PFnqMCF9pr4abvA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=csHsaRXAQZR5MoNxlzJcy5FWI5FvRHsk1CBrw9MSQnSLzdid07KslzEf0S4uwqb2Q
	 X8UrZYPH9ouIYUMqwFTdH9yVtsfu6oyyWoNJhGV/NOhliPP6Y9pMMxE/Yw17oQH4ks
	 Ke3uf2ryO5JCEn5sJeCUk1bExiGCuiFtj0LGX/Rs=
Date: Tue, 24 Nov 2026 11:34:57 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Bradley Morgan <brads@mainlining.org>
Cc: will@kernel.org, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] arm64: entry: drop the unused tmp2 argument of
 mte_set_kernel_gcr()
Message-ID: <awV2YYTIqObQzenY@arm.com>
References: <20261007185512.2.mte-tmp2@mainlining.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007185512.2.mte-tmp2@mainlining.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_033503_095142_A0471FCA 
X-CRM114-Status: GOOD (  10.89  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 07, 2026 at 05:45:01PM +0000, Bradley Morgan wrote:
> mte_set_kernel_gcr() takes a tmp2 argument the macro never uses. It
> used to, the body passed \tmp and \tmp2 to mte_set_gcr, then
> commit 82868247897b ("arm64: kasan: mte: use a constant kernel
> GCR_EL1 value") swapped that for
> 
>     mov     \tmp, KERNEL_GCR_EL1
> 
> and tmp2 stayed in the declaration and in the one caller, which
> passes x23 for it.
> 
> Drop it, both places.
> 
> Signed-off-by: Bradley Morgan <brads@mainlining.org>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>


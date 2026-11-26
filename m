Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5D2606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 17:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RdpMNy/r;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=uuxTBL0D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=opoQKkMaSFKlIYNfJJD/NSwL+CLSL9USTI2LdiHwLKQ=; b=RdpMNy/rgAxnNSvdAldr9ugOmx
	PxYhA5rjvlZrp8CxygrE9BIevX27pZHewFYWK1jKFLBN1kaOrZ02ZPXHqlGv7DtZwL80eRGTU64WQ
	nJWXRe+l3gIAtBa5yWYh+fSejvjghvpuM/iipd7qEvjGRxUHd1SgIG9xf3EgUvTZ5GdrHpJ7JnLN4
	hhpeDxQfRw/3NdcJmQxG9p9ugmg0L7pbkuEvfca3KYBawdW4bV9mAhN2sA5U2yFojjCiwv0fyH8wq
	HI9XnTCe4BR+YrgxnmfOW7eQ57PtK8xOpz/qKz2HbNYNSg0oSR2GVRGT2pyco+QCtqG8L5kpdoPbd
	xNFgNLEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdi2-0000000E6p3-0MUy;
	Thu, 26 Nov 2026 17:56:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdhr-0000000E6mO-4BOZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 17:56:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D0E961BA8;
	Thu, 26 Nov 2026 09:56:23 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 62D303F632;
	Thu, 26 Nov 2026 09:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795715786; bh=1nsm/TtIfs1fFv+oARaSnNfpbfDJKckMkAWjRr5+/9Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uuxTBL0DpqsO947FQTHtPwNUypCGX5mu9ZhLQJoL2QZwA/lc6f2WNQuPyh0++DR8n
	 ZZYrHDlHcGyRQPKlX+oBZR1TlY326qmGX3Ew/IzwVJwwp28d7rxiy+ysJoRXg7gfh5
	 nSMdOVMw8rP6Kydxx4TfooMsn3PwT1V+PWeKxPqw=
Date: Thu, 26 Nov 2026 17:56:22 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Daniel Cashman <dcashman@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/mm: Limit ARCH_MMAP_RND_BITS_MAX to 24 for 42-bit
 VA
Message-ID: <awhyxoPzCmO0grrN@arm.com>
References: <20261111042027.1541604-1-anshuman.khandual@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111042027.1541604-1-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_095628_179014_8F086093 
X-CRM114-Status: GOOD (  10.59  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 11, 2026 at 09:50:27AM +0530, Anshuman Khandual wrote:
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 1075bc661833..8d8b1331178a 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -300,7 +300,7 @@ config ARCH_MMAP_RND_BITS_MIN
>  config ARCH_MMAP_RND_BITS_MAX
>  	default 19 if ARM64_VA_BITS=36
>  	default 24 if ARM64_VA_BITS=39
> -	default 27 if ARM64_VA_BITS=42
> +	default 24 if ARM64_VA_BITS=42

Why not 23? The comment above this config entry was meant say it's
calculated as VA_BITS - PAGE_SHIFT - 3 since commit 8f0d3aa9de57
("arm64: mm: support ARCH_MMAP_RND_BITS"). However, you changed it to
"... + 3" with commit 51ecb29f7a65 ("arm64/mm: Define PTDESC_ORDER"), so
you may want to fix the comment as well with this patch.

-- 
Catalin


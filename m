Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A281606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 16:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yrxJf1S7;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YUMaSnJF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DLjUQ0HLK8s6BPwACEgbTcL7p51N6h9aXcgetQhJ5wE=; b=yrxJf1S7uR4Y6rfD106bBpn+0Z
	LHS+ZqWH/hRRjyl5V3MPEwQ96utO04ynV6W586LFs9II2NloYJcWR3adTy9ImVoupdqAXpr7nup8U
	8prKo1pSdaV68/5DW2tmDNHDyB+/2qUhPq3ap5Ega872fi7MzMw/turRDSQ8vxolv3RQUNSaNaqku
	GPySCRb0hXiPcBIQfTZQ2MQz1WXVeKsewuVTktjcfqqsGDzRZMsV4Uk4hQBcgd9G7Dx7vzfMkuioX
	1RVc7PS6+ynhI0Wp87gaMDocK//GbgiBBtE5R3RYrAUi6hjlK3Zr4EWWsoIg9I8+qfX/pcQcgx5Lj
	tKrQZSfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWc1r-0000000Drcc-3Khl;
	Thu, 26 Nov 2026 16:08:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWc1q-0000000DrcV-3ULD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 16:08:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 11FA94492B;
	Thu, 26 Nov 2026 16:08:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E32C91F000D0;
	Thu, 26 Nov 2026 16:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795709338;
	bh=DLjUQ0HLK8s6BPwACEgbTcL7p51N6h9aXcgetQhJ5wE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YUMaSnJFy3upxu2uKVvNyvyEmBNmdKR2s8a9SQfDsb/I6ad8vW98yuZSb/L9He+QC
	 q0Loz9PWiYD2hI1+rgV/ar5z7B9qIXdayGw4WcvRijzEawQP6rhFdG7t1zDGsF7xGH
	 A3HpC8dsS41P/xO5oVu3gHyQr7zh0HQz1LIoQCJuJbA6WK65rd06yGyxYtGigTmi5u
	 RE6EcV3fmlScBlZCQkuWohiOQ5VC/Sxhf9rx7PdfVhDYSyh/TyigKOgtklp0s6yJuK
	 OAmBU+1xn0FLaY+xIDsBbqYSj/S6sBAnjKeu3TjGmHjWjQIhjZj7FNh+mAmH66Kkjm
	 ysTZImXrwDk7g==
Date: Thu, 26 Nov 2026 16:08:51 +0000
From: Will Deacon <will@kernel.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: julien.thierry.kdev@gmail.com, kvm@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	maz@kernel.org, oliver.upton@linux.dev, suzuki.poulose@arm.com,
	alexandru.elisei@arm.com, andre.przywara@arm.com
Subject: Re: [PATCH kvmtool] arm64: THPs for systems with pages bigger than 4K
Message-ID: <awhZk3NrkqeGvQxC@willie-the-truck>
References: <20261019145949.1922019-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019145949.1922019-1-vdonnefort@google.com>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 03:59:49PM +0100, Vincent Donnefort wrote:
> The THP support imposes an alignment of the memslot userspace address to
> the size of a THP (PMD_SIZE). To do so, kvmtool overallocates the RAM
> size and aligns it. However it assumes PMD_SIZE is 2MiB, which is only
> true on 4KiB page systems.
> 
> Use a huge-page size, based on the system page size. This value can be
> massive for a 64KiB page system, so skip the alignment if we couldn't
> even install one THP.
> 
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> 
> diff --git a/arm64/kvm.c b/arm64/kvm.c
> index 36b3284e4a92..2c01dc32fa9a 100644
> --- a/arm64/kvm.c
> +++ b/arm64/kvm.c
> @@ -18,6 +18,8 @@
>  
>  #include <asm/image.h>
>  
> +#define HUGEPAGE_SIZE (PAGE_SIZE * (PAGE_SIZE / 8UL))

Does this invoke sysconf() twice per invocation?

Will


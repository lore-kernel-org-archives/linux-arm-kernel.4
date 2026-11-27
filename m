Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A2D606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 19:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XqED3web;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KGaJLABs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=21n4jgLl2RFy6qQf89ym+eEtym8Unqbb4FHCfy3oL6I=; b=XqED3webwqRxtb
	SzrYmUCVCSDzpk5zNl8HD6s6JKdRNDZInQBdMQpUbeuMB5/08Kqqu8Ug8jKrsqgxmn37Nge9s4DJ6
	LyE2pn9ynPoKGT7EOrEt40+AX4JGV4uJvJfo6sj9NgjNkPNDySu29fWlGhhEEd1dqFIc6P18b5MCc
	DMVokmHFCx6j9PtfyRnJl+A7BIsNcbO2Gc7NvP1VpMblPsciOVkGUc3AfG09Bsvzu2F9YJFAcjvPv
	LtNLCsGIjddnQIl1FNrNN3DGcf9ZX9XzJZpVJzg9XmBdiDJ98SycsQW+5EAt3Hn72KgSsGQnFm3HY
	YV2zz6kOgT77UQcPJqaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0rD-0000000HRT0-2qpG;
	Fri, 27 Nov 2026 18:39:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0r8-0000000HRRb-1fl7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 18:39:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D559061499;
	Fri, 27 Nov 2026 18:39:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 286CE1F00898;
	Fri, 27 Nov 2026 18:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795804773;
	bh=21n4jgLl2RFy6qQf89ym+eEtym8Unqbb4FHCfy3oL6I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KGaJLABs79HCa38B6JkmspkKQmrssIT289NbQxgnRfXEZ0wT7ipArV+OKJ8CAqoX6
	 2cA+QUngmULIdHvvIvsnIkhq2qheXyR2ehpU0ER1FVHdmb+WTVLzgJKSIEkSxavH7F
	 GhqDVEhqoTQZCIw9Ro2NmZ0diNWyOKNC/LKCeTzgAisKTWJd/1YER95KkUBj7I6m5E
	 /VVBYWb3Iw1ojpO3n8YKi3pUrVJ3sHfnW5MnBo+6TGTbbB5GHyYjEsQm64rKN7c+0F
	 K8geFaDtMU5gxPnvX71ZoNL143tIihxD9uoMc/GRKurX49P8WqjYEpa24TwmaOc7Z/
	 7XMU5YNZsGwTA==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Yureka Lilian <yureka@cyberchaos.dev>,
	Marc Zyngier <maz@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Thorsten Blum <blum@kernel.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: idreg-override: Detect trailing "--" in __parse_cmdline()
Date: Fri, 27 Nov 2026 18:39:10 +0000
Message-ID: <179580056732.1451621.10540784344972164138.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261015161054.357595-3-blum@kernel.org>
References: <20261015161054.357595-3-blum@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 15 Oct 2026 18:10:54 +0200, Thorsten Blum wrote:
> __parse_cmdline() detects "--" only if it is followed by whitespace.
> However, at the end of the command line, it converts the dashes to
> underscores and tries to match "__" as an option.
> 
> Detect trailing "--" directly instead of converting it to "__".
> 
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64: idreg-override: Detect trailing "--" in __parse_cmdline()
      https://git.kernel.org/arm64/c/067dd30eb3c9

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev


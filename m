Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAF1606A322
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 18:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uvMcrdg9;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eXcaqMpY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YZcU27ZzMJxPP66ysvGz/nGUX+rLfdI/MnJjlY2W8WA=; b=uvMcrdg9D1svaV
	PLMQwH76oTsx5QjQFCB4ifmLS286jPHSi1B5dJ9YcqcCSf06xqxXr0nxkbd+Rn45rqwA3a6fp9sY9
	akXkB+e/vwXshqXnlYC+/VgSlnK+UX4XDOuHHULlbBNaHzzUW7vmXQZB23tP7yx0Uf4NKYfYVOeCI
	I39BqNnYVzVk3Hi1QrSwYOPjOOxHwag07EzwH0XoCnW02bDtfnCurO/oKKnYevkHmTZDPPVXg4WUr
	FKuFwRDkd1Oq8UDfgqJmUeBECx3myIxHAsx+XHtINRaRkWYAMH2Lws6/XyZu+x2BLiLPcOPrDCxUN
	BfdQGGpLD6XmyQd9KVLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1WW-00000003asV-1wi3;
	Mon, 16 Nov 2026 18:33:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1WR-00000003arA-46lq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 18:33:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A878E42DEA
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 18:33:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3B591F000C4;
	Mon, 16 Nov 2026 18:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794854023;
	bh=YZcU27ZzMJxPP66ysvGz/nGUX+rLfdI/MnJjlY2W8WA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eXcaqMpYb50S4ciV3Ir2iFjWozj9SeWmarGSiPIBXaVU2PPy5vVd/wYfQ9hvJRdhV
	 l/sUhHPjsnxJGqCd0jYdJw3jvGU5C+kCLQIXbeWJnsrYrRJaD7mekBNEOkbM9vQEzY
	 hL+pNeNuyoJuqWFJPu282CG8F+X6/ursKuwFqhvKCt/7cY21SxN2y4TuhnzDIFNK5E
	 4iTm0c6jYybaqjr4yLIfA6jnR2NoRlvRsXlkC5ZsK0nOcjnR8+5F8s978w59shD8G2
	 cwJ4EYZp3qOr5T8EQsxQoJho07lDR+GcocJsy0m5JSXFhnJm0hES8HPcaVe7y0BTno
	 FK44JAP74NNnw==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH] ARM: vexpress: fix iounmap missing after of_iomap in SMP prepare
Date: Mon, 16 Nov 2026 18:33:39 +0000
Message-ID: <179485398940.1194493.10651516887031768403.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104145446.2767924-1-sudeep.holla@kernel.org>
References: <20261104145446.2767924-1-sudeep.holla@kernel.org>
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

On Wed, 04 Nov 2026 14:54:45 +0000, Sudeep Holla wrote:
> of_iomap() maps a region of device memory and returns a pointer that
> must later be released with iounmap(). Currently return value from
> of_iomap() is passed directly to scu_enable() without saving it, making
> it impossible to unmap afterwards, causing an I/O memory leak.
> 
> Store the mapped base address in a local variable, check it for NULL,
> call scu_enable(), then release the mapping with iounmap().
> 
> [...]

Applied to sudeep.holla/linux (for-next/vexpress/updates), thanks!

[1/1] ARM: vexpress: fix iounmap missing after of_iomap in SMP prepare
      https://git.kernel.org/sudeep.holla/c/3ce981979606
-- 
Regards,
Sudeep



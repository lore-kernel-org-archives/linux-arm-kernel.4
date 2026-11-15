Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BD3606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 09:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GQS5jwV0;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ho5zCD20
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LZYkjRr27NpPjrqvd+JcqlBpgfomsPg1KNU4BHdFI7w=; b=GQS5jwV08tNqfO
	Xi1YwhJYw8VPevZAcQ07rcAIWflaB0Ai6T8tLsxtkd4YRLKTur+az44b8XtULoxgUxSbVUsOhx1kh
	hkfNrJDFSrbEhUuybJ1ajgrda7sf2xTW5IlbifhbqQ7/KxLfEXOzXP5jmAvvTgEUQS+xGr5gprDBV
	AvDetfN6BqGq4PQaB+Z8huFiKhUeL3jnhKgPA0sDHepEbdglVRvn7aRBvMLFazQBY/k8t3A9Gk3qv
	4/nI/3Nye6/WjJJbTE6F5gVyIdBMAQC4NRltoHKJe+DFb2fomnDtJTQmnpwJkw1LQ1szu4YZX6j+0
	5Rp5feMhgFrjwQZXkNbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSWjy-0000000HLQG-3L5I;
	Sun, 15 Nov 2026 09:41:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSWjr-0000000HLOL-21h5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 09:41:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8633261E4E;
	Sun, 15 Nov 2026 09:41:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53C761F000C5;
	Sun, 15 Nov 2026 09:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794735690;
	bh=LZYkjRr27NpPjrqvd+JcqlBpgfomsPg1KNU4BHdFI7w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ho5zCD206rnLx852iEbpOOVmyKXF9i1DcDHzYqIy49aE1868GulR5Fc8133qXK/Ic
	 LeR+Tzh4NSpecXTspBUF9AHQtoBSEmpsLIEANVGtXmSv06kvXp/qApitlJW99rzwcM
	 wPt31ShaNPD8AuPxv/u5lvrCkj3vK6aunE1Hzy5zE8zlF6VaX+Zo4gsbgnt9ECBQB9
	 /ybTm1IOLrEH1NDTDw8oMbP4zCRK8KkodgWfZSO2bMOt+hJ92/8lyb3g+90dWRyj0G
	 j7z+Ktc9ET8NSwMG+yfA2XPG6rRmbrmSNJhg13B6fbHi9tDOjtamZS0S9IthLx7ZV3
	 ib+zo8PBh7+rQ==
From: Chen-Yu Tsai <wens@kernel.org>
To: sboyd@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, 
 andre.przywara@arm.com, Ilya Titov <ilya.titov@wirenboard.com>
Cc: bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20261109090914.46872-1-ilya.titov@wirenboard.com>
References: <20261109090914.46872-1-ilya.titov@wirenboard.com>
Subject: Re: [PATCH] clk: sunxi-ng: h616: register CPU PLL notifier before
 mux notifier
Message-Id: <179473568811.3056166.5724569905086596761.b4-ty@kernel.org>
Date: Sun, 15 Nov 2026 17:41:28 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

On Mon, 09 Nov 2026 12:09:14 +0300, Ilya Titov wrote:
> Currently the CPU mux notifier is registered first, so on
> POST_RATE_CHANGE the CPU is switched back to PLL_CPUX before the PLL
> notifier re-locks it. The CPU then runs from the PLL while it is still
> settling. The comment for ccu_pll_notifier_cb() says it must be
> registered first, and the other sunxi-ng drivers (A33, H3, R40, A64,
> A100) do it in that order.
> 
> [...]

Applied to sunxi/clk-for-7.5 in sunxi, thanks!

[1/1] clk: sunxi-ng: h616: register CPU PLL notifier before mux notifier
      https://git.kernel.org/sunxi/linux/c/0ec5e7572ddc

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>



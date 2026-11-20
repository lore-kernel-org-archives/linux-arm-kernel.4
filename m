Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DC0606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 01:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cO3sV9r/;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W0YUc57e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XHUsb0Xtaw6Jq3ZXOlI1gdrz1ttBLZ57v7PE2vNJerY=; b=cO3sV9r/L17OOI
	09Zt6iahNWsO8iWKfsrAufuVJfMFcMMvVMs0HNZb9J3nECV2ZreSWEIGhnHKkBlwfdLn3QhDF+w0T
	Jxh1Vdzp7A7Qvo24r1bKTmJGdvOL5Dy6Xv7/FsPzIBSuB6yxgIea5t4FvTEwrk3tYSjGZW6u2boWM
	pnvLhcY8bIqoEARZUpp10DR9bHv98numNatevJsicAK7OJ8Q+sU8XgVlQgzMu9oSXk4AObHhET9cw
	b63YeBQ8CJxOe8c76Mo3gmPrYEJ/z/j/GT25j3ay81g4yFSvv789+fSSFKLciVUchEafVQcgdzAGM
	ybRWzj5OEzrr0VRC0tbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUDcX-0000000DqqR-0vNX;
	Fri, 20 Nov 2026 01:40:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUDcN-0000000Dqkw-1XUl;
	Fri, 20 Nov 2026 01:40:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BFE0F43651;
	Fri, 20 Nov 2026 01:40:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 152CF1F000CF;
	Fri, 20 Nov 2026 01:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795138846;
	bh=XHUsb0Xtaw6Jq3ZXOlI1gdrz1ttBLZ57v7PE2vNJerY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=W0YUc57edZeG2Y6/hqlHJhhl41/gafd+T0NW3lQi3zCbK0OQ7sBEJhGlifHaujcie
	 EITdRwmzmgDZgklRGPDMDDcBM1rIrLt0Hd05C678Wc18jURvd8orYq+S0Dohsn/r9z
	 X9hnFDED24ktVwgAOH55wtKm6YhHipDka8rjRx1zeYjdHMcJUaFSnpEzgdmpbzPsvk
	 tpCCUBVoIqku91yz5lbyxeQSw3OuyMNqy1WTu64HvbGY2+jr4b0Othq9u5ekumaZoT
	 OQp0FtZMvmFBIvokuV2tMussXvosFMgj5TkQipTvmEJYSaco6vltRTb1bKEukpXNpn
	 eTAd+jeSii/OQ==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 2/6] clk: Add dev_clk_get_from_provider()
From: Brian Masney <masneyb@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, Paul Walmsley <paul@pwsan.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andyshrk@163.com>, Ulf Hansson <ulfh@kernel.org>, 
 linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 linux-pm@vger.kernel.org, Brian Masney <masneyb@kernel.org>
In-Reply-To: <7155949aea78042fd399da5ad23a72765b2b6cc7.1795094688.git.geert+renesas@glider.be>
References: <cover.1795094688.git.geert+renesas@glider.be>
 <7155949aea78042fd399da5ad23a72765b2b6cc7.1795094688.git.geert+renesas@glider.be>
Date: Thu, 19 Nov 2026 20:40:22 -0500
Message-Id: <179513882272.284394.5255700296836474521.b4-review@b4>
X-Mailer: b4 0.17-dev-8145e
X-Developer-Signature: v=1; a=openpgp-sha256; l=565; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=6zJGmBMLssq21U23/Bgo8QkI6kNUxjlR9Sy14J5yfUI=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLL+LxW8Ns1Y/1VJ9huOYqsvN/TmCc14dU74RbjaV/u6W
 9vNDYTKO0pZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZjI1iyG/6ELNDYWGjFMXyef
 +e6E+P7o5zVsKwNd1t+ZV1mokPdh13VGhqXZUoyvr3W1X+3d/vHpLF+R2wmFM6ZO+KskvufN/F1
 7krkA
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Clocks obtained through of_clk_get_from_provider() show up as
> "deviceless" in the consumer column of the clk_summary file in debugfs.
> Add a new variant dev_clk_get_from_provider() that also takes a consumer
> device, so callers can provide it, and consumer's name will be shown in
> the clk_summary output.
> 
> Reimplement of_clk_get_from_provider() on top of
> dev_clk_get_from_provider().
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Brian Masney <masneyb@kernel.org>

-- 
Brian Masney <masneyb@kernel.org>


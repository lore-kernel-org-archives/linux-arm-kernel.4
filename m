Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C44606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 18:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=APGIx1+O;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iFhc0+5A
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=oKPw0Sh6u08gGWLdVkVsz9ohHZFfCciFyRStu4d8iQg=; b=APGIx1+OWr+9Gm
	QFlBFVmniir2MLnEUEmv3jf/2yFj+qP80N0E/y5VAii9uiPZtAlq5HdUYYQEqUFPpaMqu3pZ1e3dM
	GbLMbaFZQBT5kOiOvjOMYPUK/YSKxiZRETjDM8krrrsyI059h7ueItbwRaAaxhOOoZtIhUymKFnxH
	hNXlLx+VMZMMw8krbUvwzg+yRV47fz8Df3R1lNr2riv+8POyOCcK+80obMTGLccHHQfWrPLXE4J46
	uvFrJd1Nda2Ot2p/YplvzrwD5es1i78OakOQbPryLvFBZ5KGChyj9BzxmFjbIyI3c+I/4qNvMMQ5N
	QNRYhjH96TTqEHD+jrug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0KM-0000000HMFo-2KZG;
	Fri, 27 Nov 2026 18:05:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0KC-0000000HMBf-0iFr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 18:05:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 992E76220B;
	Fri, 27 Nov 2026 18:05:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30F391F00893;
	Fri, 27 Nov 2026 18:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795802731;
	bh=oKPw0Sh6u08gGWLdVkVsz9ohHZFfCciFyRStu4d8iQg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iFhc0+5AaEWBuBLIFFgV6BhxXq8oB3Ok+LbhwMvqJEms1JUMRAHrGze18V/ANJ12S
	 xw0pFmeoAyK8M18cUjlftz6vntdqduKyh7ADX3PF1mcWcGsS5OkelqRFDy//vvZNEY
	 z222KKk9LWYfe8KtXE59xgj3B+6+oINcH2JuK4Krwj61ZsrcXPJoT1sJIZy6RJy79Y
	 S5xc0uaL2XDTo18msEcGFTIdoeKJbg/DUSJlxXN5i4j8xlPHtTcWw2iQNIGa2z+YPD
	 FIVdAAemyHLWrfrRo9UTfJAKFeEYNKl59aJRajBPOB1OjkWGX3KrQxJoyLekdQ5peb
	 btAnvVN8Q7hiw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Danilo Krummrich <dakr@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	=?UTF-8?q?D=C3=A1vid=20Vir=C3=A1g?= <virag.david003@gmail.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 08/12] clk: samsung: exynos7885: Terminate PLL rate table with sentinel
Date: Fri, 27 Nov 2026 18:03:16 +0000
Message-ID: <20261127180416.3277544-9-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <20261127180416.3277544-1-lee@kernel.org>
References: <20261127180416.3277544-1-lee@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

_samsung_clk_register_pll() sizes each PLL rate table by scanning until
it encounters an entry with .rate == 0, then copies the counted entries
into pll->rate_table.  However, pll_usb_rate_table omits a terminating
zero sentinel, causing out-of-bounds reads into adjacent read-only data
and populating pll->rate_table with bogus entries.

Append a sentinel entry to pll_usb_rate_table.

Fixes: 011a9de99793 ("clk: samsung: exynos7885: Add USB related clocks to CMU_FSYS")
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/clk/samsung/clk-exynos7885.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/samsung/clk-exynos7885.c b/drivers/clk/samsung/clk-exynos7885.c
index 17c2a4fc1a55..6bde2437b0ff 100644
--- a/drivers/clk/samsung/clk-exynos7885.c
+++ b/drivers/clk/samsung/clk-exynos7885.c
@@ -729,6 +729,7 @@ static const unsigned long fsys_clk_regs[] __initconst = {
 
 static const struct samsung_pll_rate_table pll_usb_rate_table[] __initconst = {
 	PLL_35XX_RATE(26 * MHZ, 50000000U, 400, 13, 4),
+	{ /* sentinel */ }
 };
 
 static const struct samsung_pll_clock fsys_pll_clks[] __initconst = {
-- 
2.56.1.839.g22a8290db9-goog



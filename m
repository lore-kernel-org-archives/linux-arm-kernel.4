Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CCA606A330
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 18:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o6ymNS39;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AQSYVL36
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ogOm0dTzKvWGc75iWT1FdWl5GoOSduyc+CkcidfPAIM=; b=o6ymNS39Yxf0I7
	FPpfwMVnSLD1CVaHMGi5twS+otQ/217aTYHwbEBa1NGqHij0RdwBIfoA6M+15REPxtHLLm3ulikyX
	hX0npHbVCMLaKmguUbGqes4RnT+023IoMnViMu0TBd13lvChDEqCgxnFxvgxQY4WN4mv5xja/yrx3
	gwTiO/UrAagFGhlYUDjpxcGZ3mVVfiCuu6m7UsWLsR8lZvO920UHZZRNggSMKJSx4xn+y+ji0yPkQ
	dAPCyBpG3CDnis/WhZT0gwvRRXxBrIm72qr/i6nWdNk7VpKYi3G4aQUEq4LPmFgVpL24KjIAeGqXk
	8I/lL8ZjZTl2nFEW0JGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0KM-0000000HMFe-1qIk;
	Fri, 27 Nov 2026 18:05:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0K4-0000000HM7U-1f9u
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 18:05:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C8B3A44F9E;
	Fri, 27 Nov 2026 18:05:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FB321F00897;
	Fri, 27 Nov 2026 18:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795802723;
	bh=ogOm0dTzKvWGc75iWT1FdWl5GoOSduyc+CkcidfPAIM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AQSYVL36g41pMfcwv5SlMiR46FzH41SWgrK9y16//xq3m05ArY78TsLqVHfcafmvj
	 kKoCRkzBYUWnVNq+RW0j4EB39W28Ibv6qJNm+5IDLs/kIrcIC7qNwgPtsNTwU17AyG
	 ExN/frQJmEuGR4jb1sjdiBkfCtxAxmi6/o1prglIgt3cBnK/295FU9o/12RozKokJN
	 ZapNM8C3rhbxvCepYGNEYOe74xIERDNG4GVnEH8JdMbmjzlr1oVrPcF3rpiqz9UQUj
	 BUfOGJOhZk8yKipTzEqzf6VvoQiit1IEwnBK/oCSFF+yt7FwsRTeAQ6EaRRDVbZViP
	 vz1k12jbGSTjw==
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
	Tarek Dakhran <t.dakhran@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 07/12] clk: samsung: exynos5410: Terminate PLL rate table with sentinel
Date: Fri, 27 Nov 2026 18:03:15 +0000
Message-ID: <20261127180416.3277544-8-lee@kernel.org>
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
into pll->rate_table.  However, exynos5410_pll2550x_24mhz_tbl omits a
terminating zero sentinel, causing out-of-bounds reads into adjacent
read-only data and populating pll->rate_table with bogus entries.

Append a sentinel entry to exynos5410_pll2550x_24mhz_tbl.

Fixes: be95d2c7d918 ("clk: samsung: Add support for EPLL on exynos5410")
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/clk/samsung/clk-exynos5410.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/samsung/clk-exynos5410.c b/drivers/clk/samsung/clk-exynos5410.c
index baa9988c7bb7..0036544bd77d 100644
--- a/drivers/clk/samsung/clk-exynos5410.c
+++ b/drivers/clk/samsung/clk-exynos5410.c
@@ -235,6 +235,7 @@ static const struct samsung_pll_rate_table exynos5410_pll2550x_24mhz_tbl[] __ini
 	PLL_36XX_RATE(24 * MHZ, 133000000U, 266, 3, 4, 0),
 	PLL_36XX_RATE(24 * MHZ, 100000000U, 200, 3, 4, 0),
 	PLL_36XX_RATE(24 * MHZ, 66000000U,  176, 2, 5, 0),
+	{ /* sentinel */ }
 };
 
 static struct samsung_pll_clock exynos5410_plls[nr_plls] __initdata = {
-- 
2.56.1.839.g22a8290db9-goog



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE28D606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 18:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kSJxIJwY;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kkv9KAfe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Dm5xm1kq6ZEGkC8uQj5hSaHXrHxlmmnQS706H19wwG4=; b=kSJxIJwY0jl/TU
	fWT5HcQhxXK1aM6UMIbLVrax4m91X4QoeRSqhw93Xhthot0IJPe1+uqilx/DlEIUDgph7uZyytsS5
	+w9ySxnWTLDaenx7e4v8QKPjYoKy+q7V2BLEGtO/+oXA2oAmNpMwn2pqx2CyhTnYOz3WzwNb7UsX8
	gNnL+7xEWu5Yi7vVpZKR08Lzr3Al6KymmQOd0EP2eYvjcjopAqdB7JMLjo1dkuf+Fu6Q5vrHN4IwK
	NckZX292xXHOpAvh/EPE6Og2QH8GG6ij06gy8ifS8G4NeRKdbKqQrRTxxRkkvS7oHh/UqrxNdGdTd
	eUsStHqVISMA1unEai3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0Jq-0000000HLxp-3kGr;
	Fri, 27 Nov 2026 18:05:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0Jp-0000000HLx2-2nGW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 18:05:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 20EA562064;
	Fri, 27 Nov 2026 18:05:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEA911F0089C;
	Fri, 27 Nov 2026 18:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795802708;
	bh=Dm5xm1kq6ZEGkC8uQj5hSaHXrHxlmmnQS706H19wwG4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kkv9KAfet5e/uF3x8/nVEgG3cAhcVqTECGZyoNOQOli39gn5UV9SP9Lt5B86xAH9p
	 2Zirzns0/fQP+7mwtSwqfPB2TyuK+0AYTUt1oK3p0KkipO4Q4si27iv6WQoOEOlQPQ
	 hG3FCZLiwP1xaVOHVLZArNZ1W0gasoPQOJdxbG0cHtxJ6XEdZzbHtYx++9Ij97cWWd
	 UT0wDaoRvdu/hHb5PuH64yLHOAwvziPRssXHCEMp+Ggv5GC8BVOAhGF1jAWUpEwNZf
	 1GsAflXQJRHNpQ25nlaTxmnyWjCnWzIRZY44Mt4vxfof9NEyJNjzqul0m7PiaA6bIE
	 ICL1/OHlj7P7Q==
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
	Thomas Abraham <thomas.ab@samsung.com>,
	Tomasz Figa <t.figa@samsung.com>,
	Sachin Kamat <sachin.kamat@linaro.org>,
	Andrew Bresticker <abrestic@chromium.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 05/12] clk: samsung: exynos5250: Terminate PLL rate table with sentinel
Date: Fri, 27 Nov 2026 18:03:13 +0000
Message-ID: <20261127180416.3277544-6-lee@kernel.org>
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
into pll->rate_table.  However, apll_24mhz_tbl omits a terminating zero
sentinel, causing out-of-bounds reads into adjacent read-only data and
populating pll->rate_table with bogus entries.

Append a sentinel entry to apll_24mhz_tbl.

Fixes: f521ac8b390c ("clk: exynos5250: register APLL rate table")
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/clk/samsung/clk-exynos5250.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
index 802300c945a9..bce5b03ecd2f 100644
--- a/drivers/clk/samsung/clk-exynos5250.c
+++ b/drivers/clk/samsung/clk-exynos5250.c
@@ -730,6 +730,7 @@ static const struct samsung_pll_rate_table apll_24mhz_tbl[] __initconst = {
 	PLL_35XX_RATE(24 * MHZ, 400000000, 100, 3, 1),
 	PLL_35XX_RATE(24 * MHZ, 300000000, 200, 4, 2),
 	PLL_35XX_RATE(24 * MHZ, 200000000, 100, 3, 2),
+	{ /* sentinel */ }
 };
 
 static struct samsung_pll_clock exynos5250_plls[nr_plls] __initdata = {
-- 
2.56.1.839.g22a8290db9-goog



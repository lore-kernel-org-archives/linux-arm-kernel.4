Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB57C606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 18:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4XQD/kf/;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SWv11QJo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vm87kNFv7uCYYZAQDZHdRyL8EkUzY9YQND6CK5MBnxk=; b=4XQD/kf/3Yjrmy
	EVJyCXQqwsae2q3Il4Mca5CGXpr5H//0xmh4f7mr8kLXf/B2GHUR+UlI9BA+fy0FgwicdPLXgFt/l
	4kLld9jTus1Rxw5bu/6HZrFBWl3FyLFn+Kf8TAXGj1G+CUu0af3R/mxuOq2wB6n4mdm60E6LXCV89
	Ml5TX3WIgodHjdF4t+/PAN4Alt7z8OlBpplUuVPRR1Mnz6WCYryZI4ugBv8GwcBurg0LDfm9pDHKd
	wdaJLAHOeaMyCLMCLLP4ktJfuDB1joJ79sTz83N3oHbexA1guS6NTqaOH+sLEMTjloZ6KLlEWYs79
	kXjcua3DvVbag+8KeycQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0LG-0000000HMZp-3V6Y;
	Fri, 27 Nov 2026 18:06:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0KJ-0000000HMCX-1LNm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 18:05:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C193F62448;
	Fri, 27 Nov 2026 18:05:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA2FD1F00898;
	Fri, 27 Nov 2026 18:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795802738;
	bh=vm87kNFv7uCYYZAQDZHdRyL8EkUzY9YQND6CK5MBnxk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SWv11QJoOy6vvIYlSzs4X4OyUZdqERjNLd+HFvFNxjslzwQhkUdhueL8FGDsruBSy
	 DVnrM9Ktcxz+zvnKsjIzUu7wHD1HqfLkzPvAarAVeOKgDt2kwUvNomOuM1v/CcIevj
	 T7ojJbqvi7QMhFco//ls0ji1oldo9N634BrnqJP4P1EBELgo7gk4O4xD2jIYovVqLh
	 qfRBrYE3VleFE+wWLmjd66nvwIzIjLLoLdbJ0lDTh3DFJPBIYkw1iPU5jCr7NCC6bp
	 uhjUmYvk4R1E3UNKTzROugBIKMhEgQB+YAuOuN8TeP/tWGmEThB8hkBN/Qp/+xZLSj
	 6e4/LcOqZ4gJA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 09/12] clk: samsung: exynos850: Terminate PLL rate table with sentinel
Date: Fri, 27 Nov 2026 18:03:17 +0000
Message-ID: <20261127180416.3277544-10-lee@kernel.org>
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
into pll->rate_table.  However, cpu_pll_rates omits a terminating zero
sentinel, causing out-of-bounds reads into adjacent read-only data and
populating pll->rate_table with bogus entries.

Append a sentinel entry to cpu_pll_rates.

Fixes: dedf87341ad6 ("clk: samsung: exynos850: Add CMU_CPUCL0 and CMU_CPUCL1")
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/clk/samsung/clk-exynos850.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/samsung/clk-exynos850.c b/drivers/clk/samsung/clk-exynos850.c
index ebcdde93bd46..9ac311161a3e 100644
--- a/drivers/clk/samsung/clk-exynos850.c
+++ b/drivers/clk/samsung/clk-exynos850.c
@@ -1180,6 +1180,7 @@ static const struct samsung_pll_rate_table cpu_pll_rates[] __initconst = {
 	PLL_35XX_RATE(26 * MHZ, 247000000U,  114, 3, 2),
 	PLL_35XX_RATE(26 * MHZ, 182000000U,  168, 3, 3),
 	PLL_35XX_RATE(26 * MHZ, 130000000U,  120, 3, 3),
+	{ /* sentinel */ }
 };
 
 static const struct samsung_pll_clock cpucl0_pll_clks[] __initconst = {
-- 
2.56.1.839.g22a8290db9-goog



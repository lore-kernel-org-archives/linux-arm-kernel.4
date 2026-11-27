Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725B3606A324
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 18:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tLeWvHg8;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ob4KMCsV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=iykf3X3+ChvaN5G6+M6V6y4Wk8M+xXCVPSQCEvNKrTU=; b=tLeWvHg8nt6exk
	IaNnB5swbfUiyTrsX6XcbnVa7wvuym0H+uWmeHhMj2sIRt3ZN2PpoybttclZp5fJ5o7AC8NMquZv0
	sF/h6li3GweiYw66Ha7cnTzKxQOvIWlNF6u4acn35UTu408FjzWrR5inEGClBd/slVunfdAPzWWqM
	EtFnO94fKcpQ9SXvMMz85NPnOrDx4ttWDYRgzv27rYFSCaL/gCXW2G+mc32mLCAeTUMa0uRoWmPiL
	WvyYAxlVXH0GrMNG0eMaCN4lRdBXccs5EhZ2miTaFSQ5K3YmRJ2/2ujF5nPT0H2Nhjd0IMKB56ZFx
	8JKA0nO4i+xRktqmH42A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0JW-0000000HLmT-1gee;
	Fri, 27 Nov 2026 18:04:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0JU-0000000HLlD-33YJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 18:04:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D9F276230F;
	Fri, 27 Nov 2026 18:04:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 862641F00898;
	Fri, 27 Nov 2026 18:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795802687;
	bh=iykf3X3+ChvaN5G6+M6V6y4Wk8M+xXCVPSQCEvNKrTU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ob4KMCsVkExvdgaqNV6wLZvGUCB+/eupYkApP5vlMV5j5lqflUu7lS+AFAAMwYa2s
	 9/fOdJ/te3QMjOgbQCxT22xPn9BR6HFrmhdeL4WU2bsG4vwkOQX7rGT+tHJxH0q3KS
	 kRZD3frB7FIAyzrIo6/x3M4IMxCEW7AkeWzkhR3L9PSQxyaGrEdYHsybn92mSTTEEZ
	 nMEkd7OqOjP1pjxSr6B7gqjULfNWdObrOAk4IPshj3CGeO7ztMduCXHL7FvLrzEpjC
	 HRBQAPCGyjtwyfWrlI88MMHYybvHlLeZaoBudd4YuNi8reRzOlnNu4rOxUjcrU40ah
	 3LGW9WyVo8vxQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Lars Persson <lars.persson@axis.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	SeonGu Kang <ksk4725@coasia.com>,
	Ravi Patel <ravi.patel@samsung.com>,
	Varada Pavani <v.pavani@samsung.com>,
	Hakyeong Kim <hgkim05@coasia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@axis.com,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 03/12] clk: samsung: artpec8: Terminate PLL rate table with sentinel
Date: Fri, 27 Nov 2026 18:03:11 +0000
Message-ID: <20261127180416.3277544-4-lee@kernel.org>
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
into pll->rate_table.  However, artpec8_pll_audio_rates omits a
terminating zero sentinel, causing out-of-bounds reads into adjacent
read-only data and populating pll->rate_table with bogus entries.

Append a sentinel entry to artpec8_pll_audio_rates.

Fixes: bd5336e3f704 ("clk: samsung: artpec-8: Add initial clock support for ARTPEC-8 SoC")
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/clk/samsung/clk-artpec8.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/samsung/clk-artpec8.c b/drivers/clk/samsung/clk-artpec8.c
index 0ea7c8b58674..fd35643be2e3 100644
--- a/drivers/clk/samsung/clk-artpec8.c
+++ b/drivers/clk/samsung/clk-artpec8.c
@@ -173,6 +173,7 @@ static const struct samsung_pll_rate_table artpec8_pll_audio_rates[] __initconst
 	PLL_36XX_RATE(25 * MHZ, 100000000U, 32, 2, 2, 0),
 	PLL_36XX_RATE(25 * MHZ,  98303985U, 47, 3, 2, 12184),
 	PLL_36XX_RATE(25 * MHZ,  49151992U, 47, 3, 3, 12184),
+	{ /* sentinel */ }
 };
 
 static const struct samsung_pll_clock cmu_cmu_pll_clks[] __initconst = {
-- 
2.56.1.839.g22a8290db9-goog



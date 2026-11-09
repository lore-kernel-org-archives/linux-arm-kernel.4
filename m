Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8162E606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 09:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OtcsaQRU;
	dkim=pass (2048-bit key) header.d=wirenboard.com header.i=@wirenboard.com header.a=rsa-sha256 header.s=google header.b=a29Hox9z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=+KBLzQyqsR334QCpiwaANoenKn13j8vn07qxRoKBlVI=; b=OtcsaQRUlJizxvJAy9DGk1z88z
	q1IsBX7bFkjg9GRJ0pEtfuQTy1gaohDcUCB2fTeFFwRsnwEOd+iqs5h6JShwrD4dGuRmG1ox2H9BU
	yP/jdPewery71FU82KcEeeR2wP8TCqFKONbqxexxR8lHuxr8JxtQHcUI3nq19OyOcCyKNH31TwOxb
	qmNNDWd0xc4qCTjxgmXm9M4fx+rRpDRMNf11dpbV8wZRNH6Z6JfctUPrLW71ULZVISGjcMc5Xlkhd
	1jlDfKXyM3D0YqPrTWVz7GugBJSsLtSA89pC4nNc2OO0UPg/FcnAIQqt0iMBziEf8JWGZs7pxIN02
	C4qexWTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLNU-00000000Aep-1KCG;
	Mon, 09 Nov 2026 09:09:24 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLNR-00000000AdX-0ud9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 09:09:23 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso6538065e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 01:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wirenboard.com; s=google; t=1794215358; x=1794820158; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+KBLzQyqsR334QCpiwaANoenKn13j8vn07qxRoKBlVI=;
        b=a29Hox9z+GZmOkE5BcmUsTbWbD6JThN5MgsAGih1Hi22z5XYcQG4fP0lYMY5ZGqGYf
         XMT0kbovdq8uytGZM17UEcOLeuv1+nk2L45BVbkg/puRNruBMjTTqwOvYDFQEbGnPyD0
         EAerlzyRN4NU71FH3+rvINgM8wexPHOyu4y586LAsnTBQLJaZvq/kkP/bR9vwjovewZK
         grlcVDpPsEVcO0FgqlG56rH8TG12TZhnpCrTxe9lQjoZVbuIw9t78FSxC7C6+XCsWwcR
         XW2CpdxPiGh68xy0eYKO7L/Rokyjv5MnQYJHHnGy9L9gxbHEHtwBw0Mu6aRxVdXpnAfZ
         RpxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794215358; x=1794820158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+KBLzQyqsR334QCpiwaANoenKn13j8vn07qxRoKBlVI=;
        b=wtgMPJyk0kjx+hOUR8Rhhy7ZAyeswpP/GQZFbr/g4kyT6B7xoKOM9QJtNvg+dNK6bA
         pX7Zj+UzRig8sgnfNw91VO23j8I9F8EAV0gY4xb0V5FstNktn9wR0LD7XwZPIwrvDD/g
         D0utIqwWXACSdon87S/DhmOMZSwt/LMrUPjHwA8TPr9PnE0BqGoVD9B2ICN9YfDaBtmX
         XsPOhmmol86KJOZYGmw/6UeTlkm4UV50hPgHI4KrMc3JA5MX6Vnb0mR0LkhY2a9RWvHY
         kol8mZmpYA/wHpDfmlwn+1bxdB0Eab6noc4GskcC/TOODSM7LpJop6RsgiUlj3pE+gsF
         ozLg==
X-Forwarded-Encrypted: i=1; AL+hErEwijkdpJ174VX87MDBg0r4Zjo2cqx9vMuuzgYUpJhaXGafte1hRfzZI4XvEtsw3ngttcaPyiGITNF5ehGxcn9v@lists.infradead.org
X-Gm-Message-State: APuU4Z9NkiDYZuNzsFLMuIgIwqoyiI/J9K0sT5yr5rb/hptM+3H8LFY3
	W56eXf9aqf0vPU3f1YW71vPfho0/dGa+ZEeKW5+tsAqUjmsUnNJwvpfnsfLbNXoCAjI=
X-Gm-Gg: AYBFou0AzPx5nDpg7nlm71UtH0/pqyTlVQo5dPw4q8WClkRrqj87CisSaGeobtzzP07
	OjyN9+NC8lqG1FHdETyp4aadAYpKq5SJ5kG2RF/XdZhrrYDvxUnZ65AamPRsKhHNLyRdxG/Tjy3
	oqtwcMnOtdHjBggAAsE/jj5TnoKxphYGNEK632Ub8UfYZASQTp65vvd4r+M1/PMeUBJrtZNNQEQ
	jk4Z7sBLU61EbtewC8h6grNP5IjraYxSIHmSGEyZms5fZak3YnW9znBFu8q7Jl+18tobmjY1XjR
	BgtfokKyRWRtQg5h4O3p1wWHB0n1t7kwKBnJhxGJen6fyhTeMiSj3XdTR0V3N1XCwTGxJViSH9+
	i1DERykN852xKG9/4gJ6u/lIQL7WiXBl5f1n7qJIUH/OLMUjPcHjpOBnee/BRxRnZdijqR8zdCU
	mCF1q9XaDIe60afjRd7E35wdmedDmIV1JM3rEh9yb3TYZlFgq1mTiD2pBcw5y7CJGnnzpjHFY89
	SqTxHBW905Bxg1kYUobB9aI0Rxvctxcd1cju3xic1WZSysz4iFwejNB7afL+kZMWqVN7FdbQZJx
	KqBaz+A3giTF1enoXd0GbX/zFpIcGnKrwKCO0g3h3c/5cgkLexPJk1EqVBTVP2w=
X-Received: by 2002:a05:600c:474a:b0:4b5:2c72:651c with SMTP id 5b1f17b1804b1-4b963c6cac0mr68998635e9.5.1794215358048;
        Mon, 09 Nov 2026 01:09:18 -0800 (PST)
Received: from localhost.localdomain ([85.137.25.106])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f398a4sm8250905f8f.6.2026.11.09.01.09.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 01:09:17 -0800 (PST)
From: Ilya Titov <ilya.titov@wirenboard.com>
To: sboyd@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	andre.przywara@arm.com
Cc: bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ilya Titov <ilya.titov@wirenboard.com>
Subject: [PATCH] clk: sunxi-ng: h616: register CPU PLL notifier before mux notifier
Date: Mon,  9 Nov 2026 12:09:14 +0300
Message-ID: <20261109090914.46872-1-ilya.titov@wirenboard.com>
X-Mailer: git-send-email 2.54.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_010921_283806_37A70B19 
X-CRM114-Status: GOOD (  15.12  )
X-Spam-Score: -2.1 (--)
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

Currently the CPU mux notifier is registered first, so on
POST_RATE_CHANGE the CPU is switched back to PLL_CPUX before the PLL
notifier re-locks it. The CPU then runs from the PLL while it is still
settling. The comment for ccu_pll_notifier_cb() says it must be
registered first, and the other sunxi-ng drivers (A33, H3, R40, A64,
A100) do it in that order.

We see random hangs and oopses on T507 based boards when cpufreq
switches frequency often. In the oopses and JTAG dumps we captured, CPU0
was always in ccu_mux_notifier_cb() or ccu_pll_notifier_cb(). Other
CPUs were usually stuck on dsb after tlbi, waiting for CPU0.

Running a random walk over all OPPs with some load on other cores, two
boards hung 20+ times in about 3 days. With the PLL notifier registered
first there were no hangs in the same time.

Fixes: 087b4083d3f9 ("clk: sunxi-ng: h616: Reparent CPU clock during frequency changes")
Cc: stable@vger.kernel.org
Signed-off-by: Ilya Titov <ilya.titov@wirenboard.com>
---
 drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
index 955c614830fa..00b7811f3a84 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
@@ -1235,13 +1235,16 @@ static int sun50i_h616_ccu_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	/*
+	 * Re-lock the CPU PLL after any rate changes. Must be registered
+	 * before the mux notifier, so CPU goes back to a locked PLL.
+	 */
+	ccu_pll_notifier_register(&sun50i_h616_pll_cpu_nb);
+
 	/* Reparent CPU during CPU PLL rate changes */
 	ccu_mux_notifier_register(pll_cpux_clk.common.hw.clk,
 				  &sun50i_h616_cpu_nb);
 
-	/* Re-lock the CPU PLL after any rate changes */
-	ccu_pll_notifier_register(&sun50i_h616_pll_cpu_nb);
-
 	/* Reparent GPU during GPU PLL rate changes */
 	ccu_mux_notifier_register(pll_gpu_clk.common.hw.clk,
 				  &sun50i_h616_gpu_nb);
-- 
2.54.0 (Apple Git-157)



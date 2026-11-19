Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDF7606A33C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 13:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=es5JLV77;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=YrBIz4wI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RpawNIw9yAx80KIG8/kBzHZTgdYAQ0IhqamwU5wRPCI=; b=es5JLV77eOt6P9
	5P2s2aaBwoMr5mtSaNJiy942N6N2GdacztMbjarnBLQnDojuyJAnjIkXsVDUwdEBO9+EM5Wd19etm
	cu9+ObK5UJRy9U+zzhs+mgO3ZElLJ1JRCMZjAktydjbvhkdIj+kAq5L66q5lYrfNcIUNv8cHNE8NF
	+k8du/EUfZ72A5CUUSK1OspTnDfZtrNXb6qj/HkAgo3ulUtNpA8pjdu63zeKpvxlvt/B15aWJK1FT
	LSxdSOZrzkRSdEQPAuVNortdyWvQ6asRwMNVQvZxQfjiaVTAWerHNworAVLPiCpHTfwZim/v/Xk0U
	lVQmZbTodW7j9zuw9wsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1nV-0000000BxJr-0Qim;
	Thu, 19 Nov 2026 13:03:29 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1nR-0000000BxHR-3g9a;
	Thu, 19 Nov 2026 13:03:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795093403;
	bh=9PQMVUYfYF7x/nSmY/FPXefEDmGs/HYntr+IZiJGrQc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YrBIz4wIA4pRMrXD4Hj5oay89kGrIg42GFOO4PILPIaJ3N2W9LlZT3d3KiNw4RR1G
	 tvdvpCzCaEHcAN58rXVwTnWpDO2RNAyGmOGKW4kekLLRt/+3rrNKs7tJ3RiLOHD27B
	 hygPoxd3ba22XTRb8Qm95j2La2Kr2zNJW9rvNRRYwicR7Yh7D3QBaLSQV9wEiAk7oy
	 CSYfOuS3x8i+DuY+0CuFjeQRnZTVpPTt6nFbvtfGWrJcfxhh8ARROx/GFsYpEdZ5b/
	 1SFEbA06eIUJ6SmPhvcqqBjr4GWC6tytUYviiBG8RyMK4IX+yXDMnCe+8CW004EEQg
	 HoRwI/LnWbNeA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D9FFE17E0DF7;
	Thu, 19 Nov 2026 14:03:22 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 949B0480035; Thu, 19 Nov 2026 14:03:22 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 19 Nov 2026 14:01:54 +0100
Subject: [PATCH v4 04/11] PM / devfreq: rockchip-dfi: initialize dmc_count
 structs
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v4-4-517a68c008fe@collabora.com>
References: <20261119-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v4-0-517a68c008fe@collabora.com>
In-Reply-To: <20261119-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v4-0-517a68c008fe@collabora.com>
To: Chanwoo Choi <cw00.choi@samsung.com>, 
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1876;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=9PQMVUYfYF7x/nSmY/FPXefEDmGs/HYntr+IZiJGrQc=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr+85rnCdSDgKRt9nBPjJaSrfjYvi3P/ZLXg
 HBOwc0ccpKM6IkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq/vOaAAoJENju1/PI
 O/qaxmQP/2O3MwYsmbEvJytAyN2xNDwYhb07PfNvi4DRo4CYTiQbvWE4VDt9cBZN/tCbsya16E6
 ZF1B7Oo0LqpoYQfgDsqqXkhzI+WAvZ/Kq6D2gs3aj8mlIegHLmKsrmsYj5kbQ13tzn9+838UkGD
 BRP4D9IXXt953ia+/7uuvsvjjEO0pGxWhlhAY+IObjxXHRPsuu2ET25nXsCHtnkYr1icRbpaB6c
 uFxAShCExcfn61sh/BOTyuTWORoby3y5S6ES1jJ3C5qxl2jvJL3qprC15NG3Il0SH3uw16UPAUr
 WUE5+NlFhqSKMORXJA0in2ZQdkM0qbodAYitZPzNN5a3s2ShgGnBHUEgSRd5GBB2yv80n0GNINf
 XeZ3qH3kqtysEWtRnYTcgu1taQ5/SwDJu05fS0ymmFeRIxCH8J+4BPqGzUNOZonPOhPO/kYNAXP
 OPi63c9ci3UoMm4TFUypQbXT3HiO7KljzEvlsRUxSxDs/C5EODI+a3zqkUT2oI6zz4Xxca2GS4u
 HLBRtN/Wt5m2ATbBXXBoRjkPJyCOysNO1tSJD9EHGcNXn1jkMcFb5Tu4aNFXLotXv3zCQi+u21v
 11jEo0fSFZpjw9ipUyN0z/sADoxreg8+Y1IcwoacuAAJRfzbZWcBRVx4uiCSFqM17Yds1vhw+wA
 6HZqfgUlBQ1RS4sJ8/LQxjw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_050326_112023_5C228D11 
X-CRM114-Status: GOOD (  13.92  )
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

Initialize 'struct dmc_count' before filling it with data by
rockchip_dfi_read_counters() or rockchip_ddr_perf_counters_add()
to avoid exposing uninitialized memory for unused channels.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-219117@kernel.org/
Cc: stable@vger.kernel.org
Fixes: 4d586b5724d3 ("PM / devfreq: rockchip-dfi: Add perf support")
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/devfreq/event/rockchip-dfi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/devfreq/event/rockchip-dfi.c b/drivers/devfreq/event/rockchip-dfi.c
index 22f82cb6e33f..d195755448e1 100644
--- a/drivers/devfreq/event/rockchip-dfi.c
+++ b/drivers/devfreq/event/rockchip-dfi.c
@@ -291,7 +291,7 @@ static int rockchip_dfi_get_event(struct devfreq_event_dev *edev,
 				  struct devfreq_event_data *edata)
 {
 	struct rockchip_dfi *dfi = devfreq_event_get_drvdata(edev);
-	struct dmc_count count;
+	struct dmc_count count = {};
 	struct dmc_count *last = &dfi->last_event_count;
 	u32 access = 0, clock_cycles = 0;
 	int i;
@@ -462,7 +462,7 @@ static u64 rockchip_ddr_perf_event_get_count(struct perf_event *event)
 {
 	struct rockchip_dfi *dfi = container_of(event->pmu, struct rockchip_dfi, pmu);
 	int blen = dfi->burst_len;
-	struct dmc_count total, now;
+	struct dmc_count total = {}, now = {};
 	unsigned int seq;
 	u64 count = 0;
 	int i;
@@ -577,7 +577,7 @@ static void rockchip_ddr_perf_event_del(struct perf_event *event, int flags)
 static enum hrtimer_restart rockchip_dfi_timer(struct hrtimer *timer)
 {
 	struct rockchip_dfi *dfi = container_of(timer, struct rockchip_dfi, timer);
-	struct dmc_count now, total;
+	struct dmc_count now = {}, total = {};
 
 	rockchip_dfi_read_counters(dfi, &now);
 

-- 
2.53.0



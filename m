Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A6C606B188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 13:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=thN7tD51;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=m7WXrInM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Z/OSGHvHVnn2Ph/Qe+hZsNnhnmtZwlUM7JMP60OxvfQ=; b=thN7tD51kk3AvP
	2OlV77dwusDD/srPJbacTtm3rdp4sUstYLitrB2gCqFaw3Dn4KmSTlWQ4qtid2ENdRJKSQk2FXSaf
	6+MDtC1bK4ED39NnmY0HYr2aYEoIWscLr6Lwl7aEGULwEIOOrybh+aa2z+ctidT392Qe1zjhOmNZL
	wvSZocvQQkK95jnNclwE08w33dst7AfCqR0KwF5zVk/5f0nqFNmeOveDJPbG78A3CeRiiCSwx2C0V
	b8IIRzDUtO+wxK2SBtEWO9wGDxMgzIEtGt0/dwurP3BBYSfevm9SaK71DovSRAU6QYlTAgs07URaj
	KUk6wl/NAyYwOUDOMNnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1nU-0000000BxJR-3VLn;
	Thu, 19 Nov 2026 13:03:28 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1nR-0000000BxHP-3gGq;
	Thu, 19 Nov 2026 13:03:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795093403;
	bh=r/7DOVU3zbP/DiBvAk5lk/ApUFqwoCwJJqDxg9WSfaM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=m7WXrInM9CokMzVQlOEoy7QlC4SI7aRVqm5756P9gienxG9OA2pGNCFAs1MKwkG+J
	 b3Peawd3yS5KjBnj5vQ5a9pSQDKNS2eQ9c1wBHFjhgoS489yJF5CG3XMC2hzyg75DU
	 Oc2Mu8gCFt/JsBea13K0FPDtSmmKLGw9yWOZyWjt35xo6StZECT7KCGdIIwnc7NAiM
	 58kEUVEOsGXUT0FxBs+Sb4RU/hjWC/LZIAtXK2IU/BJI7GCPw67O66VofGcIJpHoOw
	 rb0HkhRkAu534ppMTC44CcI3TjJk+PP4P6kuPEb+swJjdMnJvHHX1l2IcfkJpMzEI1
	 sTmL2tVOvmwhw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D797317E0DE8;
	Thu, 19 Nov 2026 14:03:22 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 92F6A480031; Thu, 19 Nov 2026 14:03:22 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 19 Nov 2026 14:01:53 +0100
Subject: [PATCH v4 03/11] PM / devfreq: rockchip-dfi: drop incorrect shift
 of LP5 bank mode
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v4-3-517a68c008fe@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1522;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=r/7DOVU3zbP/DiBvAk5lk/ApUFqwoCwJJqDxg9WSfaM=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr+85rzgztPrhe15mOzQThqgubzxnmjjDiXZ
 Re4lABkofhTmYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq/vOaAAoJENju1/PI
 O/qaxUcP/AnyYv/h/Ex+H+Nh4DTzdozserjwNba7o4OWerriSN68xuqqyLGrcRoM8jUZYlN63ey
 QiXp/QTPSsUyBCzsmjyEnyIVlGljGY+8BsezHg6rTBTh3SZ1XG+dJiTzmFELf6gvRDudr2acOEU
 zfWLRMidmbGZAE36uhiCIrkwow0VglA4GTnmHs4NcoPSNzsOtSfxmpgzGH4gQaksbzNHuXRuCHu
 EDqrXfOHZkWit0P8Y6IEtxP6IdfjyfRjjm4RvQDdYAfOrsFgXb43r0rX7D8DUF9qgvRmIDdxoap
 90Oy5iHbRZKQCiQBQGhiC5BhhRF001SUf0HlqpcVUPkH70JW3f4OnMUkpiDpD+aTok2Yx0fqZBk
 o3UtucIsnbBIUMsBZC7qoIyrKqNM/jps+6Aj6r1U/Ep4rgS+oL5CgZ2bFv0u5UHzPuo7SsacnkD
 4vW7gxgfDi+p94PxsciUBb10YZaWPs6kY8KL+nMB0COLzHCggm++6j/jS1XOge4zaDEJCSoapYS
 /PCAIiKv9A6b2Kz3OJmqSLXY6VpAP+ZXCMocr0ywm+PD1TMEfw/JqhiSKgRDGr788PEQjeRe+/N
 rYqPEUQHKE+0MwTYi92Uv/8laxoxM6NFlh5+4qiBy/Ncxg8CVOpbtc2MMLg493JhA5kIZWokc+D
 6mumnCqh66/SbB1gExoguLA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_050326_108926_008071E3 
X-CRM114-Status: GOOD (  15.07  )
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

When the driver got converted to the FIELD_PREP_WM16 macro, it was
missed that the lp5_bank_mode variable is already shifted in
rk3588_dfi_init() resulting in FIELD_PREP_WM16() effectively doing a
double shift and thus writing 0.

As most Rockchip boards use LPDDR4 (incl. all of mine) and DFI is more
or less exclusively used for debugging with upstream kernel so far, this
hasn't been noticed until now.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-219117@kernel.org/
Cc: stable@vger.kernel.org
Fixes: 7e85ac9da1ac ("PM / devfreq: rockchip-dfi: switch to FIELD_PREP_WM16 macro")
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/devfreq/event/rockchip-dfi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/devfreq/event/rockchip-dfi.c b/drivers/devfreq/event/rockchip-dfi.c
index e0b942028e50..22f82cb6e33f 100644
--- a/drivers/devfreq/event/rockchip-dfi.c
+++ b/drivers/devfreq/event/rockchip-dfi.c
@@ -800,7 +800,7 @@ static int rk3588_dfi_init(struct rockchip_dfi *dfi)
 
 	if (dfi->ddr_type == ROCKCHIP_DDRTYPE_LPDDR5) {
 		regmap_read(regmap_pmu, RK3588_PMUGRF_OS_REG6, &reg6);
-		dfi->lp5_bank_mode = FIELD_GET(RK3588_PMUGRF_OS_REG6_LP5_BANK_MODE, reg6) << 7;
+		dfi->lp5_bank_mode = FIELD_GET(RK3588_PMUGRF_OS_REG6_LP5_BANK_MODE, reg6);
 		dfi->lp5_ckr = FIELD_GET(RK3588_PMUGRF_OS_REG6_LP5_CKR, reg6);
 		if (dfi->lp5_ckr)
 			dfi->count_multiplier *= 2;

-- 
2.53.0



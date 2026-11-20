Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00CB60A6F7E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 13:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=w77YidiT;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=IsaDdRKR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AiiquoDpQ0fORfLwcpAgt6hsMks+0p+aM+8XYir1U8M=; b=w77YidiTwyUULA
	uzftHPXjaERJcgcfAsjY6ysIHqHOS38zxid2w2fShugstU4IaQQyx/HXuLlXAZSKsxemKJaP2C02W
	B4iBp4iTv2zTevB2nE5FH4aO0RR82vp2/heQXxr/uGek6LsIvryYrOrpXZuTBFgsl7z4qBxRLyOKY
	DgIiZJ9VpbftlsQZL4QAUIZ8/sKa6GfkZINjHcv1Rb5waZpU7c/3hqYLIG6K1EW8AqEZxaC4FTlum
	VQcqJ8Fx1pJgp8rCcF5xunnheYQzB22KXebKMKW0Q3H213YhZZ8iy3/QrY8kNglE3YApG7q0QVlC+
	rf+rRS4628jbSFq0DatA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOOx-0000000F3jD-03ym;
	Fri, 20 Nov 2026 13:11:39 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOOl-0000000F3ar-2SnL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 13:11:29 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so7392995e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 05:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795180285; x=1795785085; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AiiquoDpQ0fORfLwcpAgt6hsMks+0p+aM+8XYir1U8M=;
        b=IsaDdRKRzERdHBsD5iLqtFzPwlorMGtVJBis+fcoagXsFYYMoxtm+g62sdCzYYfDaV
         c6J2tVgYbnq17n4qmXaJEnrJ140to4Dbsh9NfgkQSyCibs9+JbDoAz/CXrOpeE7eNf6N
         gifHFVJuVCIWjAYuhT7tDl1N0WBIKFby0pjYz+iW28bTtAreGCjtKVkWkaTMTV9EanpU
         k2ZKouKN7DgmPobNS/X3gfSD5nrNcnZnNFAIicmQOV3UPsYuIfgTEf4yfKXsckGFczED
         x56Ba0tHWVvOs3KsJ/NkP1oBlslLe79HdzC8kUyeZeR71ThxVBak07Emo9oQDOa9v+Fh
         Pv9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795180286; x=1795785086;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AiiquoDpQ0fORfLwcpAgt6hsMks+0p+aM+8XYir1U8M=;
        b=m3I9kR1PeA01RaI0HreDhyFLvqPdpUhcvcleRd6GRrUgW7HZdV69X7kQ9f+Y4tSXzp
         z/mV9hGlyp8MGqGKnbrKuLe3Zz8YA0VG4OzErBSJn6rgCTpU/uNyTHDMrbuJRnjPNYFX
         Ev5X1hXLXD8DHyYaRl7l5TS6bYJhZC1Vt+Ngo5OV4vRRzyUa0CX1W4xccJ+ziyRoX15Z
         yeNTJfwEKvXrshsqSz00VNe/VeMU0vkCy5M3VCsKt8EZ6xMjiYFWEK768UUaIgPglWv5
         oRRodUNuPc7i+jfyjhkpTy/YPxQ2eqZrBSoI8K4tALIZdedqJJqogC2BQSDNnF56K/HA
         mLuA==
X-Forwarded-Encrypted: i=1; AL+hErHq6V5KNUyghmhqTYPrKPGUaRHOcD4MRa/08YQmxFZAy7EcVUzJohBzk10efF0yY13TpenUDQodHk4rYQpWJBPU@lists.infradead.org
X-Gm-Message-State: APuU4Z+MX4ah/j6OZy2qu40CGialjYLyXEb1hMGPtk0tOjiM3qG2hVxK
	GY1tK8+vL6LR+fOImW1KbjvJNFbcW/khUwgCJLwKRCGDwupWyxeKeylULVHK2+Mk9mQ=
X-Gm-Gg: AYBFou2Ati1hEgkfWlooRzmWAIEUtCYjjhazw25lRKdJTx5BZA9y90seb+qEwIASTC3
	VGo3ysHJHw6Ao1HXMWoiVw6XHL/3o37D/tBcDmtYk0K3M5BLuFEA1kv+K9w/TGbbllTaKzRyNSB
	Nx4a3hPd4Kt2+vTsFlnMvmEzTVYi2PIc6WREVu65OGiuYglZ6ml27oa0fJNBTmRuNZEUOAqbAOd
	TsQgC68ti2FCYpwF2j687AQ5p+1u/9VcFl+Zomwljyl8oSAM0SEpJJJZlBHy16QFKN721YXFbkD
	1cmzOUiwsJGCFSTKGHNEkDFuH8xndsAFGSx/bS2jA8ogESfCCvw26h77m6FzMuFsoX0YIS5Zx0V
	JluGHsWZlUr1qaEY5Cp06CCDG6CjU/lOZpkXaQYWyL5JWlqif1zPNNse8NYlZGC5ut0XJzOqLTu
	dI8ufyjnLpeM36nV72Z03T5T4ZKTfAr2D8QvInnaPAD4KyIce+6kxR7c5u1P9JM1CCXr0ttOp3c
	zBkG1/Tzl+TICLSVLLQtkCzgmZF1iDfrC+cOsCklOtGMCGZs+nznZR5dGHRhY19sY0EvDkf+aK+
	i878GhHkufdbaIcHDjweIJOgyiKrAZRs/zwBt6xwSarwnZE1+/Je2JljAjj/WT0hMWt03qMhsMy
	ZHaTrBThNqFRVr55ofXECRxOY8vYJfys0MNV5uypa8uWZQdMW0mpof3V2dEYerWqYzr8v
X-Received: by 2002:a05:600c:4e0d:b0:4a5:e6fd:65e5 with SMTP id 5b1f17b1804b1-4bb88922a67mr67265015e9.31.1795180285567;
        Fri, 20 Nov 2026 05:11:25 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8960110fsm43497995e9.0.2026.11.20.05.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:11:25 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Fri, 20 Nov 2026 14:11:04 +0100
Subject: [PATCH v2 1/6] clk: meson: pll: Support PLLs without a pre-divider
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-upstream-s7-clk-v2-1-856cece3b9f2@baylibre.com>
References: <20261120-upstream-s7-clk-v2-0-856cece3b9f2@baylibre.com>
In-Reply-To: <20261120-upstream-s7-clk-v2-0-856cece3b9f2@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Carlo Caione <ccaione@baylibre.com>
Cc: Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_051127_716935_9D863FDB 
X-CRM114-Status: GOOD (  14.12  )
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

The common PLL code assumes that every PLL has a pre-divider. This
does not hold for the S7 HDMI PLL, and the S7 GP0 and HIFI PLLs are
meant to run with theirs set to 1.

Make the pre-divider optional so these PLLs can use the common
implementation.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/meson/clk-pll.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 1ea6579a760f..44b33051405f 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -76,7 +76,9 @@ static unsigned long meson_clk_pll_recalc_rate(struct clk_hw *hw,
 	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
 	unsigned int m, n, frac;
 
-	n = meson_parm_read(clk->map, &pll->n);
+	n = MESON_PARM_APPLICABLE(&pll->n) ?
+		meson_parm_read(clk->map, &pll->n) :
+		1;
 
 	/*
 	 * On some HW, N is set to zero on init. This value is invalid as
@@ -174,7 +176,7 @@ static int meson_clk_get_pll_range_index(unsigned long rate,
 	*n = index + 1;
 
 	/* Check the predivider range */
-	if (*n >= (1 << pll->n.width))
+	if (*n >= (MESON_PARM_APPLICABLE(&pll->n) ? 1 << pll->n.width : 2))
 		return -EINVAL;
 
 	if (*n == 1) {
@@ -437,7 +439,8 @@ static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 	if (enabled)
 		meson_clk_pll_disable(hw);
 
-	meson_parm_write(clk->map, &pll->n, n);
+	if (MESON_PARM_APPLICABLE(&pll->n))
+		meson_parm_write(clk->map, &pll->n, n);
 	meson_parm_write(clk->map, &pll->m, m);
 
 	if (MESON_PARM_APPLICABLE(&pll->frac)) {

-- 
2.56.1



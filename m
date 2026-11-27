Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66668606A6A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 10:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PKMmwyyt;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OawSjmLi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=niHX9hU7Znm7+FTctKl1NjM17jcZWzUBM+CDMu05W6U=; b=PKMmwyytBNvMRP
	3MVIrh3gJv1Nm98c/mnPmovRQSEJ4rWvwfQzofpP2XhuddxQNXUPpzGKlRW4OTUxWZamwDIa7VNHz
	NORTIEmZJNVF219E0z0NVpnFKjbTkbPeNHmC/Vq/Sf8zj9EK8nA3aclCXLCq6SuwW+G08MWYn0zWy
	zldWHctuM0PKWJWvu/p1TLvyPV6OcKITQBeft2nQjQ7xpXcu5g94D9IH2KDS6vscZ2MCt3Y9X1hEI
	6wweE+4ozNbdrygal0ruvo7lXodOPRfcjJL2QhsJjn4eP7S7A8TN/LcNfWrxxD4N7S3grL/N1Jsjx
	0ZYRO1IRhnQh8h19bJKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtNp-0000000FdS1-2nFi;
	Fri, 27 Nov 2026 10:40:49 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtNU-0000000FdJt-2iS3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 10:40:29 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-6bb06dc1fffso5510310a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 02:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795776027; x=1796380827; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=niHX9hU7Znm7+FTctKl1NjM17jcZWzUBM+CDMu05W6U=;
        b=OawSjmLiOIk45d9RqU1aV0xkeMZ3Xsi+A2KbJszOV7er7rFVPQUzT8LSkFVMyBxV9h
         KBpMvqChprsO8GWX67Omuqv/+hkJf3xi42lJtopxuBiJKocZGReY92Phzyxx92TYhAzc
         qBEZqyz7tETFRekxKSLeDrnZae3I4XGl6Mc7hC/OPOdIdH6UDmnCBk/yvhnCict81Pb5
         p0zP0UeMAOcZ+ig2W4eA2j6hRtHve2tYWNqaU5JqW6Ur0r5psbIqo9uL6IDyvDotFZUq
         X3MwhlRT9+hMnhbzpFqzRJAj+XYwt0BpNJtuOuN2TmxeU1HhUDc6lvbkwXnUVwW1fTiO
         JbUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795776027; x=1796380827;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=niHX9hU7Znm7+FTctKl1NjM17jcZWzUBM+CDMu05W6U=;
        b=z9Xxd93ojaDg6J4BZjMuUd+c1k/k3H9omyzYH3lFFKOjuQa5l1ngwDoGANhTcZorco
         UrJX5ud5YeDiIBi+m9CoVo3UgSIWveFtLY8Ax1qLdxk/BRXHEe8GM1a1XKS6g0NsGJbs
         hJiuiO5X6LyW5gPpTm5mQ8yuDKxTs6xn0vd547gv/gntLCWVFFl2XbPhLvRF9h4p+tZj
         F6LQtjZil3N0Fj3YVykbU9oP8j8P4rk3tN0SFDxS557kDDK/qiLpS6T78CNcSnH3PnQz
         qQIImG16naEF7IFVpMMJLQp6MibJUvHjyW7g9IYn1lXwz3XzyPH456FEktDSZ3WZK6eA
         LFrA==
X-Forwarded-Encrypted: i=1; AL+hErEWWfUFeHcIVMoju6nCM04QCR9grnkRGOaUH8mp7bw17yXIVXXDzJSuCo/I/qOOVA1KRSByBrnyTManSyhekjAv@lists.infradead.org
X-Gm-Message-State: APuU4Z9fkv3Wn7J01aR665dkvMST89b/cBWP+P8zvIMCnnBvwEFEQzkT
	naRfwyK2intTt7434rOLbRRT9hRvPPIfOXyGQEYjCTv/4jUzNvR+13iCvgF/XMHHCJo=
X-Gm-Gg: AZFdTZfzXHVPw31FRkaCFmt/GyapNztMqJN3NTSH5UDoixFr78fbpPrDlo3yiX0WFG1
	kyK16NrPb0s4BvnWQOjQrNzBLSWxF1qyG/iJFHttBzgxJtRnJ54xk7zvrHfPX9x8cLXR77iV1tb
	jbsf4hWnV4rYd8kHZcRHEtzuv+AKcfzb4zbHGIjzfwKCD0XK1YWr3nxxM2iTuW1VzjiOEcFFXfo
	dMwGCLOEbscmHbVSxqRzDamojnEx+5JkiPn1G26Ty7HPRUG7yiZG+jpbrEJLAyzbm7fBFnp5Xvs
	kUm8a8VXvdaEbjj2i0Xz1YD5qXew3rUcX/qwogUNDuShP82fB9ARXCi3BoGJm0pyEBQm5uqhLdT
	VNurNq/pP0tp9e6a+wEnvCs/JfsKZW8R1Hc9ib+2Mcmw3sS6SoMdpg8wVuwnHUPMAn7zlMP5ZVb
	KzpEX1WevLqZqevE7u129Qsca3G1h1x8nVokYCY9C8kJgMktRSHVEdpf3jTAIVe9EB1mQq3Y35t
	SzphE8fHFVx6Q5PvlYvmNG06wH1y90+7LHkTfgBG7L38mzfjcUDaflZTnqUbED2vT7rGC5hnyPU
	1GuxV7M0wztsLSg+0k+e5qxG8mdsl3cyntj6nXB7cW2XER7NV78y/e6oL+blR/M6mW9w4MKNL0A
	NqP/52jk2OfrjiN44eQ==
X-Received: by 2002:aa7:c717:0:b0:6b5:8200:5008 with SMTP id 4fb4d7f45d1cf-6ba37ec67b3mr13091621a12.45.1795776026538;
        Fri, 27 Nov 2026 02:40:26 -0800 (PST)
Received: from puffmais2.c.googlers.com (226.124.90.34.bc.googleusercontent.com. [34.90.124.226])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb11ff543fsm3919199a12.2.2026.11.27.02.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:40:25 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 27 Nov 2026 10:40:22 +0000
Subject: [PATCH 2/3] phy: samsung-ufs: embed cfgs arrays in drvdata
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261127-gs101-ufs-phy-oob-v1-2-144b0e04c3a8@linaro.org>
References: <20261127-gs101-ufs-phy-oob-v1-0-144b0e04c3a8@linaro.org>
In-Reply-To: <20261127-gs101-ufs-phy-oob-v1-0-144b0e04c3a8@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Juan Yescas <jyescas@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-hardening@vger.kernel.org, 
 llvm@lists.linux.dev, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_024028_740394_A73A6971 
X-CRM114-Status: GOOD (  19.81  )
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

Each SoC keeps the pointers to its calibration tables in a separate
array, and gs101 keeps the pointers to its hibern8 tables in a second
one. struct samsung_ufs_phy_drvdata refers to these arrays using a
plain pointer, which samsung_ufs_phy_probe() copies into struct
samsung_ufs_phy.

A plain pointer doesn't carry the number of elements, so neither the
compiler nor CONFIG_UBSAN_BOUNDS can check the index used with it. In
particular, nothing ensures that the gs101 hibern8 array has an element
for both CFG_POST_HIBERN8_ENTER and CFG_PRE_HIBERN8_EXIT, as only its
initialisers determine its size. In addition, the arrays are never
modified, but are placed in .data, because the pointers they contain
aren't const.

Embed both arrays in struct samsung_ufs_phy_drvdata instead, with
CFG_TAG_MAX and the new CFG_HIBERN8_MAX elements respectively. This
makes the number of elements part of the type, moves the pointers into
.rodata together with the rest of the const driver data, and removes
one level of indirection. Drop the copies from struct samsung_ufs_phy,
as the driver data is reachable from there.

The hibern8 array now exists for all SoCs, so test the selected table
instead of the array in samsung_ufs_phy_notify_state(). SoCs without
hibern8 tables still return 0 without waiting for CDR lock. They now
return -EINVAL for a state other than PHY_UFS_HIBERN8_ENTER and
PHY_UFS_HIBERN8_EXIT, as gs101 does already, but enum phy_ufs_state
has no other value.

On arm64 (non-debug build), embedding the arrays shrinks
phy-exynos-ufs.o by 48 bytes overall (.text -32, .data -176,
.rodata +160).

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/phy/samsung/phy-exynos7-ufs.c        | 12 +++++-------
 drivers/phy/samsung/phy-exynosautov9-ufs.c   | 10 ++++------
 drivers/phy/samsung/phy-exynosautov920-ufs.c | 12 +++++-------
 drivers/phy/samsung/phy-fsd-ufs.c            | 12 +++++-------
 drivers/phy/samsung/phy-gs101-ufs.c          | 22 +++++++++-------------
 drivers/phy/samsung/phy-samsung-ufs.c        | 15 ++++++---------
 drivers/phy/samsung/phy-samsung-ufs.h        |  7 +++----
 7 files changed, 37 insertions(+), 53 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos7-ufs.c b/drivers/phy/samsung/phy-exynos7-ufs.c
index 15eec1d9e0e0..ea3951ca1331 100644
--- a/drivers/phy/samsung/phy-exynos7-ufs.c
+++ b/drivers/phy/samsung/phy-exynos7-ufs.c
@@ -62,18 +62,16 @@ static const struct samsung_ufs_phy_cfg exynos7_post_pwr_hs_cfg[] = {
 	END_UFS_PHY_CFG
 };
 
-static const struct samsung_ufs_phy_cfg *exynos7_ufs_phy_cfgs[CFG_TAG_MAX] = {
-	[CFG_PRE_INIT]		= exynos7_pre_init_cfg,
-	[CFG_PRE_PWR_HS]	= exynos7_pre_pwr_hs_cfg,
-	[CFG_POST_PWR_HS]	= exynos7_post_pwr_hs_cfg,
-};
-
 static const char * const exynos7_ufs_phy_clks[] = {
 	"tx0_symbol_clk", "rx0_symbol_clk", "rx1_symbol_clk", "ref_clk",
 };
 
 const struct samsung_ufs_phy_drvdata exynos7_ufs_phy = {
-	.cfgs = exynos7_ufs_phy_cfgs,
+	.cfgs = {
+		[CFG_PRE_INIT]		= exynos7_pre_init_cfg,
+		[CFG_PRE_PWR_HS]	= exynos7_pre_pwr_hs_cfg,
+		[CFG_POST_PWR_HS]	= exynos7_post_pwr_hs_cfg,
+	},
 	.isol = {
 		.offset = EXYNOS7_EMBEDDED_COMBO_PHY_CTRL,
 		.mask = EXYNOS7_EMBEDDED_COMBO_PHY_CTRL_MASK,
diff --git a/drivers/phy/samsung/phy-exynosautov9-ufs.c b/drivers/phy/samsung/phy-exynosautov9-ufs.c
index 9c3e030f07ba..00b8eabd3cf2 100644
--- a/drivers/phy/samsung/phy-exynosautov9-ufs.c
+++ b/drivers/phy/samsung/phy-exynosautov9-ufs.c
@@ -52,17 +52,15 @@ static const struct samsung_ufs_phy_cfg exynosautov9_pre_pwr_hs_cfg[] = {
 	END_UFS_PHY_CFG,
 };
 
-static const struct samsung_ufs_phy_cfg *exynosautov9_ufs_phy_cfgs[CFG_TAG_MAX] = {
-	[CFG_PRE_INIT]		= exynosautov9_pre_init_cfg,
-	[CFG_PRE_PWR_HS]	= exynosautov9_pre_pwr_hs_cfg,
-};
-
 static const char * const exynosautov9_ufs_phy_clks[] = {
 	"ref_clk",
 };
 
 const struct samsung_ufs_phy_drvdata exynosautov9_ufs_phy = {
-	.cfgs = exynosautov9_ufs_phy_cfgs,
+	.cfgs = {
+		[CFG_PRE_INIT]		= exynosautov9_pre_init_cfg,
+		[CFG_PRE_PWR_HS]	= exynosautov9_pre_pwr_hs_cfg,
+	},
 	.isol = {
 		.offset = EXYNOSAUTOV9_EMBEDDED_COMBO_PHY_CTRL,
 		.mask = EXYNOSAUTOV9_EMBEDDED_COMBO_PHY_CTRL_MASK,
diff --git a/drivers/phy/samsung/phy-exynosautov920-ufs.c b/drivers/phy/samsung/phy-exynosautov920-ufs.c
index 21ef79c42f95..7cf229b2b261 100644
--- a/drivers/phy/samsung/phy-exynosautov920-ufs.c
+++ b/drivers/phy/samsung/phy-exynosautov920-ufs.c
@@ -144,18 +144,16 @@ int exynosautov920_ufs_phy_wait_cdr_lock(struct phy *phy, u8 lane)
 	return -ETIMEDOUT;
 }
 
-static const struct samsung_ufs_phy_cfg *exynosautov920_ufs_phy_cfgs[CFG_TAG_MAX] = {
-	[CFG_PRE_INIT]          = exynosautov920_pre_init_cfg,
-	[CFG_PRE_PWR_HS]        = exynosautov920_pre_pwr_hs_cfg,
-	[CFG_POST_PWR_HS]       = exynosautov920_post_pwr_hs_cfg,
-};
-
 static const char * const exynosautov920_ufs_phy_clks[] = {
 	"ref_clk",
 };
 
 const struct samsung_ufs_phy_drvdata exynosautov920_ufs_phy = {
-	.cfgs = exynosautov920_ufs_phy_cfgs,
+	.cfgs = {
+		[CFG_PRE_INIT]		= exynosautov920_pre_init_cfg,
+		[CFG_PRE_PWR_HS]	= exynosautov920_pre_pwr_hs_cfg,
+		[CFG_POST_PWR_HS]	= exynosautov920_post_pwr_hs_cfg,
+	},
 	.isol = {
 		.offset = EXYNOSAUTOV920_EMBEDDED_COMBO_PHY_CTRL,
 		.mask = EXYNOSAUTOV920_EMBEDDED_COMBO_PHY_CTRL_MASK,
diff --git a/drivers/phy/samsung/phy-fsd-ufs.c b/drivers/phy/samsung/phy-fsd-ufs.c
index f2361746db0e..d02742289654 100644
--- a/drivers/phy/samsung/phy-fsd-ufs.c
+++ b/drivers/phy/samsung/phy-fsd-ufs.c
@@ -40,18 +40,16 @@ static const struct samsung_ufs_phy_cfg fsd_post_pwr_hs_cfg[] = {
 	END_UFS_PHY_CFG
 };
 
-static const struct samsung_ufs_phy_cfg *fsd_ufs_phy_cfgs[CFG_TAG_MAX] = {
-	[CFG_PRE_INIT]		= fsd_pre_init_cfg,
-	[CFG_PRE_PWR_HS]	= fsd_pre_pwr_hs_cfg,
-	[CFG_POST_PWR_HS]	= fsd_post_pwr_hs_cfg,
-};
-
 static const char * const fsd_ufs_phy_clks[] = {
 	"ref_clk",
 };
 
 const struct samsung_ufs_phy_drvdata fsd_ufs_phy = {
-	.cfgs = fsd_ufs_phy_cfgs,
+	.cfgs = {
+		[CFG_PRE_INIT]		= fsd_pre_init_cfg,
+		[CFG_PRE_PWR_HS]	= fsd_pre_pwr_hs_cfg,
+		[CFG_POST_PWR_HS]	= fsd_post_pwr_hs_cfg,
+	},
 	.isol = {
 		.offset = FSD_EMBEDDED_COMBO_PHY_CTRL,
 		.mask = FSD_EMBEDDED_COMBO_PHY_CTRL_MASK,
diff --git a/drivers/phy/samsung/phy-gs101-ufs.c b/drivers/phy/samsung/phy-gs101-ufs.c
index d4af94f3fed4..5b6dca37b5a3 100644
--- a/drivers/phy/samsung/phy-gs101-ufs.c
+++ b/drivers/phy/samsung/phy-gs101-ufs.c
@@ -131,17 +131,6 @@ static const struct samsung_ufs_phy_cfg tensor_gs101_pre_h8_exit[] = {
 	END_UFS_PHY_CFG,
 };
 
-static const struct samsung_ufs_phy_cfg *tensor_gs101_ufs_phy_cfgs[CFG_TAG_MAX] = {
-	[CFG_PRE_INIT]		= tensor_gs101_pre_init_cfg,
-	[CFG_PRE_PWR_HS]	= tensor_gs101_pre_pwr_hs_config,
-	[CFG_POST_PWR_HS]	= tensor_gs101_post_pwr_hs_config,
-};
-
-static const struct samsung_ufs_phy_cfg *tensor_gs101_hibern8_cfgs[] = {
-	[CFG_POST_HIBERN8_ENTER]	= tensor_gs101_post_h8_enter,
-	[CFG_PRE_HIBERN8_EXIT]		= tensor_gs101_pre_h8_exit,
-};
-
 static const char * const tensor_gs101_ufs_phy_clks[] = {
 	"ref_clk",
 };
@@ -197,8 +186,15 @@ static int gs101_phy_wait_for_cdr_lock(struct phy *phy, u8 lane)
 }
 
 const struct samsung_ufs_phy_drvdata tensor_gs101_ufs_phy = {
-	.cfgs = tensor_gs101_ufs_phy_cfgs,
-	.cfgs_hibern8 = tensor_gs101_hibern8_cfgs,
+	.cfgs = {
+		[CFG_PRE_INIT]		= tensor_gs101_pre_init_cfg,
+		[CFG_PRE_PWR_HS]	= tensor_gs101_pre_pwr_hs_config,
+		[CFG_POST_PWR_HS]	= tensor_gs101_post_pwr_hs_config,
+	},
+	.cfgs_hibern8 = {
+		[CFG_POST_HIBERN8_ENTER]	= tensor_gs101_post_h8_enter,
+		[CFG_PRE_HIBERN8_EXIT]		= tensor_gs101_pre_h8_exit,
+	},
 	.isol = {
 		.offset = TENSOR_GS101_PHY_CTRL,
 		.mask = TENSOR_GS101_PHY_CTRL_MASK,
diff --git a/drivers/phy/samsung/phy-samsung-ufs.c b/drivers/phy/samsung/phy-samsung-ufs.c
index 56c2fa53bf77..4f2db2ca83c0 100644
--- a/drivers/phy/samsung/phy-samsung-ufs.c
+++ b/drivers/phy/samsung/phy-samsung-ufs.c
@@ -76,7 +76,6 @@ int samsung_ufs_phy_wait_for_lock_acq(struct phy *phy, u8 lane)
 static int samsung_ufs_phy_calibrate(struct phy *phy)
 {
 	struct samsung_ufs_phy *ufs_phy = get_samsung_ufs_phy(phy);
-	const struct samsung_ufs_phy_cfg * const *cfgs = ufs_phy->cfgs;
 	const struct samsung_ufs_phy_cfg *cfg;
 	int err = 0;
 	int i;
@@ -87,7 +86,7 @@ static int samsung_ufs_phy_calibrate(struct phy *phy)
 		return -EINVAL;
 	}
 
-	cfg = cfgs[ufs_phy->ufs_phy_state];
+	cfg = ufs_phy->drvdata->cfgs[ufs_phy->ufs_phy_state];
 	if (!cfg)
 		goto out;
 
@@ -223,16 +222,16 @@ static int samsung_ufs_phy_notify_state(struct phy *phy,
 	const struct samsung_ufs_phy_cfg *cfg;
 	int i, err = -EINVAL;
 
-	if (!ufs_phy->cfgs_hibern8)
-		return 0;
-
 	if (state.ufs_state == PHY_UFS_HIBERN8_ENTER)
-		cfg = ufs_phy->cfgs_hibern8[CFG_POST_HIBERN8_ENTER];
+		cfg = ufs_phy->drvdata->cfgs_hibern8[CFG_POST_HIBERN8_ENTER];
 	else if (state.ufs_state == PHY_UFS_HIBERN8_EXIT)
-		cfg = ufs_phy->cfgs_hibern8[CFG_PRE_HIBERN8_EXIT];
+		cfg = ufs_phy->drvdata->cfgs_hibern8[CFG_PRE_HIBERN8_EXIT];
 	else
 		goto err_out;
 
+	if (!cfg)
+		return 0;
+
 	for_each_phy_cfg(cfg) {
 		for_each_phy_lane(ufs_phy, i) {
 			samsung_ufs_phy_config(ufs_phy, cfg, i);
@@ -324,8 +323,6 @@ static int samsung_ufs_phy_probe(struct platform_device *pdev)
 	drvdata = match->data;
 	phy->dev = dev;
 	phy->drvdata = drvdata;
-	phy->cfgs = drvdata->cfgs;
-	phy->cfgs_hibern8 = drvdata->cfgs_hibern8;
 	memcpy(&phy->isol, &drvdata->isol, sizeof(phy->isol));
 
 	if (!of_property_read_u32_index(dev->of_node, "samsung,pmu-syscon", 1,
diff --git a/drivers/phy/samsung/phy-samsung-ufs.h b/drivers/phy/samsung/phy-samsung-ufs.h
index f2c2e744e5ba..f9680915545a 100644
--- a/drivers/phy/samsung/phy-samsung-ufs.h
+++ b/drivers/phy/samsung/phy-samsung-ufs.h
@@ -95,6 +95,7 @@ enum {
 enum {
 	CFG_POST_HIBERN8_ENTER,
 	CFG_PRE_HIBERN8_EXIT,
+	CFG_HIBERN8_MAX,
 };
 
 struct samsung_ufs_phy_cfg {
@@ -112,8 +113,8 @@ struct samsung_ufs_phy_pmu_isol {
 };
 
 struct samsung_ufs_phy_drvdata {
-	const struct samsung_ufs_phy_cfg **cfgs;
-	const struct samsung_ufs_phy_cfg **cfgs_hibern8;
+	const struct samsung_ufs_phy_cfg *cfgs[CFG_TAG_MAX];
+	const struct samsung_ufs_phy_cfg *cfgs_hibern8[CFG_HIBERN8_MAX];
 	struct samsung_ufs_phy_pmu_isol isol;
 	const char * const *clk_list;
 	int num_clks;
@@ -129,8 +130,6 @@ struct samsung_ufs_phy {
 	struct regmap *reg_pmu;
 	struct clk_bulk_data *clks;
 	const struct samsung_ufs_phy_drvdata *drvdata;
-	const struct samsung_ufs_phy_cfg * const *cfgs;
-	const struct samsung_ufs_phy_cfg * const *cfgs_hibern8;
 	struct samsung_ufs_phy_pmu_isol isol;
 	u8 lane_cnt;
 	int ufs_phy_state;

-- 
2.56.1.839.g22a8290db9-goog



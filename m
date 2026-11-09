Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F20606D803
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 14:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Hjc4UNoS;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=TcSDr+w5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=P6VJcdeGPLmQQkKLnT/yRNbiCAJPKjitwFw5ODXVfxM=; b=Hjc4UNoSe/7d+J
	EAplTRgbpQu10c+eTlSXDX6x9OYyqFwGJaov+zC20/qbVSb5HJ0oCX6eme3VVszW2GTfsA6AjgGE0
	mRLvKn/uGUbhDy2aEa17Gg47DInQMh07h2ds558pljyp5Dinr/cO9niv+LCSFBWZUPDPbRVF2t7ww
	KAlhNSnnEIPhD6Qbr/SDL5qT1RMs0+935+uFMX9zQDighlHnHk0caDP57jKxlT7u3gUTCUhgdwgAz
	9VjINzpA4H3xDex4WT3dyJX9cZsFwdY0Qu7ePPzeT6H5JB2a+D6yG86ZAFjX8Hn2PnUOuynchl2lP
	Z7tAT12ccotA9Q/QDnQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQQ77-00000000usP-0q5E;
	Mon, 09 Nov 2026 14:12:49 +0000
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQQ74-00000000upt-1lnO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 14:12:48 +0000
Received: by mail-dl1-x122b.google.com with SMTP id a92af1059eb24-1438d9363fbso529815c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 06:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794233565; x=1794838365; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P6VJcdeGPLmQQkKLnT/yRNbiCAJPKjitwFw5ODXVfxM=;
        b=TcSDr+w5eL6ZE+0wk+1mMWdLbnljdv5ZOV1e6t8n/ykcq6644/k2q3Bmo476WKHZ5D
         pa6CU70xIupXRYcrgCl3R+rJ6+0Z9QwcoqZPQvxu8T9YjB3w2h3VP3yVuCi/NEQe912Y
         UgpCCLUp5tdEcMAiWc9YOfrCALd90/5DYah2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794233565; x=1794838365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P6VJcdeGPLmQQkKLnT/yRNbiCAJPKjitwFw5ODXVfxM=;
        b=ylnYH3wv1fBP1h1hAj+Yir8pM3Z0TzS0KMNcxmW1LNWZQMXL3avbcXip7yTmrQd8Es
         zrYkxFxe+bAZrDInUtbtoMiFSEVo92QYnjv/p6G9bVsq3+HZHKUzwWMlizgMUjlKPI76
         ATsM0K970OflOc5IXlwbK++YfVaV7spGvLiLiyVVDCulFOH+Z4K3E2nXtItpwisyp5Kf
         k9mxyiX/b/AU0F2cQOCXgai00mgwQBCEkgAQyu899wNGTH8zSfDzTPhm80ALgWlc1gOt
         b1qq/DLut1m3TWqQI2nOIdDWCpYkid2aRAm4m2DdLik+1N2o53B+TmEl2kXNLQMVXxq/
         uIAQ==
X-Forwarded-Encrypted: i=1; AL+hErGFaoxUWOgNvIBgTQKl8Vr474nszdvD7PszSUZuni9SbJsj94mKqL3gPQwpNiHHPYmBgGZIGeRFwGjcV+RTPjXe@lists.infradead.org
X-Gm-Message-State: APuU4Z+hTHkZzUBCLCBMTdFw4oD7UJIJ/+Vmn9S9z+OrdjLMhUCumj7D
	6u2TtdOUrHzMB67FTvrkc1p7yWz1YvYU82R3ePxJHGqliKHNO+uwnc1Qmn87lmy7vg==
X-Gm-Gg: AYBFou0CzxZcCTpRIAo4TcFuWOjClTTwhrwRde3dCV4DZ4Ts19PyrhclpWBH9YNMu2f
	zA9WIP7CKqt1YNI9Pr/wWxx3n6+s5gf89723LemWMp1A3UXUPoY0JXcA9t123nc9S84dE+ON6VO
	ENR09bmCNZWpf5PMYkOog0+404haKXn56Jh/h4oduUKkt0Fw3M0Wgim8PlokLSWVZ+tcLryxPVs
	4F+FnARKbSlh0Ikkw1i84P+9/4VcFnLWb/6XEdWzetNMJ+zvuyKSGWqwaUKWlMqyP6LabopEv2o
	nr5cD1luK+ExCeiIQj15+mAV52DV34/i5W0Grg5NK6EOVWormW+FLOB/NRhWPBHF4Q5JE3k4F9H
	B6cMNnzfXkyYsyl8zo+x1qdO4h+BuHHmKPgHbwqFeXFeLrAijHuDV7T/sZAW3Sc2CtIiY1fQhCO
	6o5Q8yc1AotRRiJ4LMvA8fevAK64RL88oo0ZH/Nlz0y6AZSBOzDq4noNBWzb0mxBvGcFfwLU/+N
	D0HiDtFdwoBf2Q7bCKWzvk5xC+8tif2+GaPyN2Womo/B0CG02GFGxMYpCZAnqJ2Q62Je3hfwLJM
	wLdfDHaFb+VA9ldNzYsPsQXqe77KXtw03pHKPMPz+IdOZcVPFTCpWNIyxCee
X-Received: by 2002:a05:701b:428a:20b0:194:e9e5:11b0 with SMTP id a92af1059eb24-1b269b0c10fmr10662445c88.14.1794233565388;
        Mon, 09 Nov 2026 06:12:45 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:24d0:a2cf:66c5:ef86])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-372660f444csm21084768eec.19.2026.11.09.06.12.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:12:44 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/5] arm64: dts: mediatek: mt8173-elm: Clean up unused MT6397 regulators
Date: Mon,  9 Nov 2026 22:12:28 +0800
Message-ID: <20261109141233.983830-2-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
In-Reply-To: <20261109141233.983830-1-wenst@chromium.org>
References: <20261109141233.983830-1-wenst@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_061246_467720_CC33E0F3 
X-CRM114-Status: GOOD (  14.77  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Several MT6397 (MT6391) PMIC regulator nodes in mt8173-elm.dtsi are
not actually used on either Elm or Hana according to the board
schematics. They may have been copied from the EVB dts.

- buck_vgpu: Output pins are unconnected; GPU power is supplied by an
  external DA9212 buck regulator instead.
- ldo_va28: Only connected to a decoupling capacitor for the PMIC's
  internal audio codec and fuel gauge ADC blocks, both of which are
  unused as both boards use an external ALC5650 codec and EC-managed
  smart battery.
- ldo_vgp4: Only routed to a test point on Elm and an unpopulated
  resistor on Hana.
- ldo_vibr: Output pins are unconnected.

Keep these regulator nodes in place so that the regulator core still
considers them constrained and can disable any unused rails left on at
power-up (such as ldo_va28), but drop all their properties and unused
labels. This is meant to preserve prior behavior.

Checking the regulator nodes against the schematics, drafting the change
and reviewing it were done by an agent. Manually tested on a Hana
(Telesu) device.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 26 ++++++--------------
 1 file changed, 8 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index 2c6ec714e117..dd0373b45b56 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -988,12 +988,8 @@ mt6397_vcore_reg: buck_vcore {
 				regulator-always-on;
 			};
 
-			mt6397_vgpu_reg: buck_vgpu {
-				regulator-name = "vgpu";
-				regulator-min-microvolt = < 700000>;
-				regulator-max-microvolt = <1350000>;
-				regulator-ramp-delay = <12500>;
-				regulator-enable-ramp-delay = <115>;
+			buck_vgpu {
+				/* unused */
 			};
 
 			mt6397_vdrm_reg: buck_vdrm {
@@ -1017,8 +1013,8 @@ mt6397_vtcxo_reg: ldo_vtcxo {
 				regulator-always-on;
 			};
 
-			mt6397_va28_reg: ldo_va28 {
-				regulator-name = "va28";
+			ldo_va28 {
+				/* unused */
 			};
 
 			mt6397_vcama_reg: ldo_vcama {
@@ -1079,11 +1075,8 @@ mt6397_vgp3_reg: ldo_vgp3 {
 				regulator-enable-ramp-delay = <218>;
 			};
 
-			mt6397_vgp4_reg: ldo_vgp4 {
-				regulator-name = "vgp4";
-				regulator-min-microvolt = <1200000>;
-				regulator-max-microvolt = <3300000>;
-				regulator-enable-ramp-delay = <218>;
+			ldo_vgp4 {
+				/* unused */
 			};
 
 			mt6397_vgp5_reg: ldo_vgp5 {
@@ -1100,11 +1093,8 @@ mt6397_vgp6_reg: ldo_vgp6 {
 				regulator-enable-ramp-delay = <218>;
 			};
 
-			mt6397_vibr_reg: ldo_vibr {
-				regulator-name = "vibr";
-				regulator-min-microvolt = <1300000>;
-				regulator-max-microvolt = <3300000>;
-				regulator-enable-ramp-delay = <218>;
+			ldo_vibr {
+				/* unused */
 			};
 		};
 
-- 
2.56.0.455.g6c5a503b38-goog



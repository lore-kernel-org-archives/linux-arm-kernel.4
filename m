Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA4B606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 03:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fUITEjXB;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mzAdEKK3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Y7DHeu4nEWkVzcf2sVY8OIlNAFB3fB9C0wQws70L76k=; b=fUITEjXB867OsuoBEhXm//84Tv
	7NQP64yTMJDbNSjqreoX2gq0wyN51CKGGwQwKOVhNZb5ZERmfjc8IRxezpzqtkrSidUj5DVz5IXIR
	Uu4EOQ2m2BFBx5iMc45Q0OSkL343eqh+sFFqqm0Reqz8R6DiWQij5ysxHYAgWEVq8dizhSZI+y0zQ
	TQ1l0UPM5Vj7BD8yGb0oIIHJ1YhDVHdQCgDUA+LuaUR/qoXIlsRN/E6ftHX5a5XAdJY7ESGEi0wob
	/Jq3fGy2GnUK0J5/RxZ3c9hdxP49K7cMtJMBYZPk6lrA+ZlJfZDDo+B6ANFIuaKWzSxCYzn9o2HFK
	+cG4RMHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTtBC-0000000AnHk-342b;
	Thu, 19 Nov 2026 03:51:22 +0000
Received: from mail-dl1-x1233.google.com ([2607:f8b0:4864:20::1233])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTtB9-0000000AnGz-3QuG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 03:51:21 +0000
Received: by mail-dl1-x1233.google.com with SMTP id a92af1059eb24-1b244fb7fffso1821982c88.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 19:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795060278; x=1795665078; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y7DHeu4nEWkVzcf2sVY8OIlNAFB3fB9C0wQws70L76k=;
        b=mzAdEKK3N5mIL3IixFnkBAUYV1XybS+kLQwDmrVZK6TqSoIslPC3kO6ApTGUVveqly
         p+Bx/4teWMr9akK1lJy3Qy3f1FcR30CU94o/N/cmhXwp7Ts8IwxjV/6QMGxhX50TWU1S
         qktdr8GvZ55RTx0Q0whX76+KF/tbfPjRe0C+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795060278; x=1795665078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y7DHeu4nEWkVzcf2sVY8OIlNAFB3fB9C0wQws70L76k=;
        b=iZGCUZvVxg/ALWg1upIV7Yq45GNDpN1/8Dm7R7/P4mlHYonW1q8DT8zqemqRpzy9EJ
         OeTUvNzEukMloSp12lNrR6UkVvCHfrKbZZp42/yXoXMVxbmD8GUAIFbgU+UW6V6S/hBO
         da8cCwowVX4or11B++4cTnSkOg65D2uNOd08ZxjmEnI6fGatQYtw558df1t10hBqxA8W
         iTfiowEEj3k9HMTz8URCVcU2XXxbZDk8/AzodBGaeq3GaV/Hzj05rKaAXidlG+W3WdQd
         b+JgKvYK5ErFI/ZRL0dOaYJ7aPqAa+8GgRKJ3iVzBcfnWvwPnJw3NwLiQGIO3n1iySTs
         M2tg==
X-Forwarded-Encrypted: i=1; AL+hErE4huWctz/ID/4NzMABhpXfudUZe4veTR7QBWsVQHlf87FRm9K5KJvSh2UuOTct99ny4K2Z+NhqBvbEBuHSuKD+@lists.infradead.org
X-Gm-Message-State: APuU4Z8CQy/iQZW/WsKpMndgKoNsrQluqaHf85CSSNYLqV2B7C1gaOMU
	TsnLvkKPB3npjwZV/SKQamlnFa/KXwqk3oc73sNXRpWCst23pz2Gj1JAgH0TFZMzRw==
X-Gm-Gg: AYBFou0urMQbU4HFmZZ+YHK6T9saaihkbGk88XoDQdXhsc3X+b4RXKOgDuF5FZjxSgE
	og0DRkzHV8s/p4P6nB4RixKHSgGBUfQsCS00GR3EbvoNc/dqP6w9UBEPKorjd/ZbMF9fqDl+OON
	kQKrqG+DYrs6gL8WLC8Nm9OLDNJO/h8MAuB+aA52QKenTy7YBAWH4AMud5Y0DGBQN/UGoLugoTD
	6Z9b+tCIQ77xKvulq6NcCeZ2d/YL4GDr+jQrE1Py2u4p5ouvMRU6yeRljg67owCS02OWV3QpxlF
	pxevupNXcbkqp7OeDjOIF+hO1dZmKJS0YXtWA3dgRKHcOzjcxL20vIwp471gWR4jlGi9bAyrwck
	OzMJ30LmF77BA/8jxqK35FfGPVsp0m+1bJ0i6ehGxurOtg7gK9w9lg6oyXg1kylNKk7U7Z/kcN5
	veusFsLgyb/G4V5+c/EzPqXAnfMiNy/s23vi9SpAkonr2wlA/0S3hHeevS0jVu50PNY0m0tFzSx
	Rk4w1f3AZntJyxUDPwYSKTMjATeIzQjU0bT85FJJemPzhiHSsEwpWMSyokI7VEhdkR0V6WqxIvz
	/Qy0I1P9weFH452DerzD5LFm3Oh0tl1Iztg8k97p8I2EiZ1AjefYouHY9fmkXg==
X-Received: by 2002:a05:7022:ea8d:b0:1ae:59d6:91cd with SMTP id a92af1059eb24-1b543d0cb92mr4257326c88.38.1795060278321;
        Wed, 18 Nov 2026 19:51:18 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:5ec1:f878:4926:ab53])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1b5447c5b02sm10392500c88.6.2026.11.18.19.51.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 19:51:17 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] arm64: dts: mediatek: mt8173-elm: Clean up unused MT6397 regulators
Date: Thu, 19 Nov 2026 11:51:12 +0800
Message-ID: <20261119035113.4046607-1-wenst@chromium.org>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_195119_875976_1F0B8BDC 
X-CRM114-Status: GOOD (  14.31  )
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Rebased (so "arm64: dts: mediatek: mt8173-elm-hana: Unmark trackpad
  supply as always-on" is not applied)

 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 26 ++++++--------------
 1 file changed, 8 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index 1b8f1b6fd788..ac5e9e387294 100644
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
@@ -1101,11 +1094,8 @@ mt6397_vgp6_reg: ldo_vgp6 {
 				regulator-always-on;
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
2.56.1.708.g77570a6a1d-goog



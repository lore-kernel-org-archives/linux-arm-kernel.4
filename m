Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2001606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 11:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TvEQg/7b;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=C21nt+/+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SsTSYB3rsKvMWE7p57CQCiR1JUfH7D/jcQTe8wg93kY=; b=TvEQg/7bKRqNX0VgrGoVyT9hAE
	gxy8/yZ8aKAVQ8UaxjqinYZanv7MQk90/aJZyAAcn8EPKtV3gnqE6NxtSecQ2PIL9MFlYvWC97LKD
	GGS6qjxOh2It5DHUAmwTzqToeNnxiQ7uQLy9Y0xvwcsd3qEAwHk6doCVdTOhzjnygX5a7Es81teJT
	b886uidYtiS0+nBqJ94z9MLMrK98t4U27sFKBNN3S/6qjFi0wfvU3leO68hbM2/iAzIAOQv04OTyi
	uizpqKrE9QP+3VxB56h7e2XJ5rK0c2Xm2O3KHmWZciO4VDCwsvGjOv+UdarOM6gGx5GMkE8LeP1q1
	FIkO79Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6tY-00000006YHG-1ATN;
	Wed, 11 Nov 2026 11:53:40 +0000
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6tP-00000006YBx-3Ss8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 11:53:35 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-4a359c7f47bso26444105e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 03:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794398010; x=1795002810; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SsTSYB3rsKvMWE7p57CQCiR1JUfH7D/jcQTe8wg93kY=;
        b=C21nt+/+qDOFkNELyl5D8dRnSCzte0NdjT5zpy2Gil7SGHANeytaHcAquD+SxciWBW
         xFVMD+wEsHDUZX/DPomg/cqL9hDrezrp+C2z9gyf3Oyr0/bH4lmFs3wpjFXr4R2exSnM
         EVtaoS3KRhZX+2bbgAma0yx4PkcC2fky04VfusKgmdxwK5AFHnuRgLdRVW9VkWOn9npn
         Y4qO1Kuh0smsBFq5OST+CKRHul+kA0Uwd9cMZaLHTBJFnI9R0zE5zMcHM9d9jYXxa0NR
         kdlqp1/JhT3Q33MRspE8vLSuHxFRLgxJDVKWHkGk0VLjamuh5+CD6hABOYwqjHOFtOK/
         +Bxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794398010; x=1795002810;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SsTSYB3rsKvMWE7p57CQCiR1JUfH7D/jcQTe8wg93kY=;
        b=FojJed+UxWWsWb9g2KsMcfcDOzgJcsCVm0cSUkKua8nFFOsTaHWrohpX33AYdoR9g+
         xDGrzgIyTCIQPVD4YUVqhj38pzomiyHWCKBl6gWlCEYDvdLexKxTWT3IZD8y/i1jr6a8
         YM/oipity0wZTAo1ly8PakwCIYe69puF0bokiloB3YRVidmKqBXsHNmnnYQ05TtC+FmN
         wMbuulVQP/Ht3dyhzG9iQZgZgNHoQXqkGHaXTPmi74ArxgK/rLO/Uuwy9qgT/W5AaRhV
         hjMYQuGMc9gqm8Xn3/rYnIueTFPPlKAaDzgSIFZkR/cv0J8rW5EWMor7zDI5MD4zyrD+
         gy0g==
X-Gm-Message-State: APuU4Z+o3aw76DHtxszsP01ReN8L0q5FccSbFRHaHPtP74MjaZWqYWQe
	hOPlEGJ85COpYjc4ajchdUIvYjK+34GKkla04GJSxZk5znmV8lgV03QJHRZnqE0kyS/P7b0AukB
	/KTfi8TzTcwP7eiFaolejXRoGzcgc8wxhNjIBV9FIYz6Tz/hIbcUNfF5YTGrwjkV4dISISwigjv
	aKxvKCkvC+HzYnYGmi19vayih2AQUDT9diH9ehHkysAv5+
X-Received: from wmbz24.prod.google.com ([2002:a05:600c:c098:b0:4a1:d0e3:1e1c])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4ecb:b0:4a2:150f:1601
 with SMTP id 5b1f17b1804b1-4ba093811b2mr37381255e9.12.1794398009585; Wed, 11
 Nov 2026 03:53:29 -0800 (PST)
Date: Wed, 11 Nov 2026 12:53:06 +0100
In-Reply-To: <20261111115303.3749380-9-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261111115303.3749380-9-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2269; i=ardb@kernel.org;
 h=from:subject; bh=JUc6v0P1teNo8OlbdRyY2etIOH20xoIr68pdPx7aM1A=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIetLuBK718xmx/ypLhO8b639fiw/YoMK26dtJRWz97G1P
 e3qm9vfUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACaSkcnI8PLL3UxDlVkHL3VV
 eYfd1ty9yDx39+JDbeVdgWsM/GT4LjMytE98yxv86sDjaf+WxKw843a1NVN31j8lu8f3s+fL8wj +5gAA
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261111115303.3749380-11-ardb+git@google.com>
Subject: [PATCH 2/7] arm64: dts: qcom: c630: Use LN_BB_CLK2 as the eDP bridge
 reference clock
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_035331_883799_923DC939 
X-CRM114-Status: GOOD (  14.71  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ard Biesheuvel <ardb@kernel.org>

The SN65DSI86 eDP bridge on the Yoga C630 is described as being clocked by
an always-on fixed 19.2 MHz reference clock. However, as on the SDM845
reference design (Cheza), its REFCLK appears to be fed by the LN_BB_CLK2
output of the PMIC, which also serves as the master clock of the WCD9340
audio codec.

As nothing tells Linux that the bridge depends on LN_BB_CLK2, the clock
only runs when the codec happens to have it enabled, and the WCD934x
driver only enables it on demand. If the bridge is brought up while
LN_BB_CLK2 is off or being toggled, e.g., when the display stack probes
before the codec, or while the codec is being initialized, all AUX
transfers fail and the DP PLL does not lock, leaving the panel dark:

  ti_sn65dsi86 10-002c: Can't read lane count (-110); assuming 4
  ti_sn65dsi86 10-002c: Can't read eDP rev (-110), assuming 1.1
  ti_sn65dsi86 10-002c: Can't read max rate (-110); assuming 5.4 GHz
  ti_sn65dsi86 10-002c: DP_PLL_LOCK polling failed (-110)

So describe the actual clock instead, so that the bridge driver keeps it
enabled for as long as the bridge is powered up.

Fixes: 956e9c85f47b ("arm64: dts: qcom: c630: Define eDP bridge and panel")
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index 9d38ae83c979..a4a573ea7e4a 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -97,13 +97,6 @@ sw_edp_1p2: edp-1p2-regulator {
 		vin-supply = <&vreg_l2a_1p2>;
 	};
 
-	sn65dsi86_refclk: sn65dsi86-refclk {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-
-		clock-frequency = <19200000>;
-	};
-
 	vph_pwr: regulator-vph-pwr {
 		compatible = "regulator-fixed";
 		regulator-name = "vph_pwr";
@@ -528,7 +521,7 @@ sn65dsi86: bridge@2c {
 		vpll-supply = <&vreg_l14a_1p88>;
 		vccio-supply = <&vreg_l14a_1p88>;
 
-		clocks = <&sn65dsi86_refclk>;
+		clocks = <&rpmhcc RPMH_LN_BB_CLK2>;
 		clock-names = "refclk";
 
 		no-hpd;
-- 
2.56.0.611.g1030f0b940-goog



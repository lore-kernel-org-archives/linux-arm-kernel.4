Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C24B606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 10:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KEcOyE5L;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XHYQ5kC9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=PWk3Tf1GjB784piIzDladAPUgmBwYfKuUyQjQkV3yIY=; b=KEcOyE5Lj8JMsK+NSkt4+BOCSj
	JrfIQl9MjWzlqM2Hidpn4oX58pP7+nS+mUfypHpR8bnNi+ZlWqWg/3Fp7krihih5mQph3cJE4YknA
	Q6BH6+JSZwJrBDOC57rB0rmWfwE/NLnsp/f0lMduGzJUwVDLaOeMv7gzjDXKFBraH0spCjIRVktyI
	mzPZH/zwPzsq9aC3ElsxBe5b9wOsQnJU1oRJhPBcmuxzz4ywkszhd1cRPN/ZSVX+uj3aQTR4tQBi7
	v/6JoQx5v36+scaRKCgkJ9CmUZdopdATiGBRZZF/K4j0Ay3EsRwUnVLVnCs5/JoK6cTSOyvQ74klT
	ouqFyWAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVnUk-00000006BuX-0jd9;
	Tue, 24 Nov 2026 10:11:26 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVnUh-00000006BtT-0NvM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 10:11:25 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so3622904a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 02:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795515081; x=1796119881; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PWk3Tf1GjB784piIzDladAPUgmBwYfKuUyQjQkV3yIY=;
        b=XHYQ5kC9u+mhEmKSy9GmJjNfKz0E6Qq/6UwdKeKmmJiL9ovFgvD4zhE7C7vonQe2Yg
         j5k5pdOt79d2TlOX3GM1+mdI1n/hxi5n9p9VXQNEovGpEBJi6ziPeKZNdlhz/t26B+3u
         eKxZgj5U8618kCs1f/UGnNyiOsY1T5qG3+7Kw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795515081; x=1796119881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PWk3Tf1GjB784piIzDladAPUgmBwYfKuUyQjQkV3yIY=;
        b=WWM0VBSyeeOsEUpQ0IBCa+PEH9fY/CLkM4uaPYAr6px7BovH7Z3qWb7admYFiGRH/1
         LhYskN5YbJIT0aAEtVJ3hypC63fuXIHOXPg3Dkb54lk/rdm0hhuKOqCOsZGQ2isq1omu
         orxvh+XsWo0mb8NboA4MkNWTRoRF54A6hwr6YLAEQIqJhKJ4m4+TB+RdAtUfky4tKH6Y
         v1z1ajayU4HI49PPAiGp+UVRYKfkgYVa+bRPgRPWUhOzR5/3Flo/66niSXBbRlx169pf
         Wba4BoZ/zlVcO24JtKo5cAXFIMewZei5ZvHLY5CErGDopK5SfhSemVboHMBuJqBmxTp8
         8dhQ==
X-Forwarded-Encrypted: i=1; AL+hErG3MPCy6sb2r04wTMdFEsr1aJxChnXJ09+yDfC5FEcDJ4SGCbDpXA9M2JS+15ibVYO6hl+O6SOXcfD2P7Eotzmf@lists.infradead.org
X-Gm-Message-State: APuU4Z/9+Cc2S7xIiT4VA4ufi+I/U1ztov2w6zzRYT75CbCC9qsim6Wk
	l4mvmjSfS1Nq5Cs5cXOM07vSv05+iMzyNnlznavIicHS1A1/y77c/no/4Pa4J2U20p60oQyc1nh
	FibtZOA==
X-Gm-Gg: AZFdTZdK0BQhvxEKXhWICU1QEoqUQL5wcZvMR8hoBPLGwQr2dUx0MQGBZ4C5VwG7kr6
	KqEoFUfEyT2dilHjqaK/DkmMX5knuq3Frj9Fpi1HRsvlTh8KBuox6dOhPLUcMZvBdPhvTzS5fsa
	5751TlrM7dYuawKQqptgrcEUYgvsi0zaENLCuUxh39uHAfTfQT/JEFZzvVdNBkVi8wTcm2CnczG
	QYmla3CErY9SAJIVdvom45FnTQXnDymVddNDVaLEDYGUhyzAunfdA2apUtieMctN3Cba3tRQy4M
	ilRnTwhUz5XuLEIvsPbcHrb5dOIPVY6bpPKRNuJn1v/tYxJCcYf3Q2OXiPV51IAAdFs4gJArKW/
	Fh4ZWmP5jeAaptBBe6t79Q+Ji7NMQG4ci9xJ46wEDZQtKoDbSKf45zgBbLZw4yheSgV2yT2IjlB
	jRF3NS4tOJ5Awv9Cx4CJSrDbvlh2uUPnn53D0youuYciERjiHSOUvmaXF8ezDMrWqujNXW2NNc2
	TbH3vbYEuV9z0wfib3pMhGEICfuiic5N9Zh2cUwUk/ZiiC/nQwIxHazm+LYheVyKqStDK1tGvcv
	w9WbFovqXqes4Wu/AbsWBzYwETAMvsh0aXmXGfvxmCE5Qd9x42Jbok4DUaBY
X-Received: by 2002:a17:90b:3f0f:b0:3b4:1b37:ac89 with SMTP id 98e67ed59e1d1-3b41c8ff71dmr19777589a91.34.1795515081507;
        Tue, 24 Nov 2026 02:11:21 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:8f32:8910:4727:ea03])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3b41abb1b66sm23171867a91.1.2026.11.24.02.11.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 02:11:21 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: mediatek: mt8192-asurada: Fix swapped regulator ramp delays
Date: Tue, 24 Nov 2026 18:04:19 +0800
Message-ID: <20261124100420.613422-1-wenst@chromium.org>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_021123_487347_8361D53C 
X-CRM114-Status: GOOD (  13.50  )
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

When the ramp delays were added for the MT6315 regulators, the patch
had mismatching context (due to unmerged patches in between), and thus
was applied incorrectly. The result was that the ramp delays ended up
swapped between vbuck1 and vbuck3.

Fix them and swap them to the correct regulators.

Fixes: 9c9f83e3368d ("arm64: dts: mediatek: mt8192-asurada: Add ramp-delay for MT6315 regulators")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index 91da89eda13a..6cd93d2d4da7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -1505,7 +1505,7 @@ mt6315_6_vbuck1: vbuck1 {
 				regulator-min-microvolt = <400000>;
 				regulator-max-microvolt = <1193750>;
 				regulator-enable-ramp-delay = <256>;
-				regulator-ramp-delay = <4500>;
+				regulator-ramp-delay = <8000>;
 				regulator-allowed-modes = <0 1 2>;
 				regulator-always-on;
 			};
@@ -1515,7 +1515,7 @@ mt6315_6_vbuck3: vbuck3 {
 				regulator-min-microvolt = <400000>;
 				regulator-max-microvolt = <1193750>;
 				regulator-enable-ramp-delay = <256>;
-				regulator-ramp-delay = <8000>;
+				regulator-ramp-delay = <4500>;
 				regulator-allowed-modes = <0 1 2>;
 				regulator-always-on;
 			};
-- 
2.56.1.809.ga0b61035b5-goog



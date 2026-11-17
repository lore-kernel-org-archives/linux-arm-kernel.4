Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB0A606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 19:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DtjLSWUJ;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=BmGGsHMf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4skSwwjgJ+QuhFrRzKzpNL0Sq3twAwTkr7WjFcD+3dw=; b=DtjLSWUJ0FUPnA
	DU7MC5OsM4jWOVlIoEcJojRwk+0nZesGi/a4YLloYgcwJKLan6yaJZeVL1cL9GnWhb/Zz8s6f3gBD
	+hjW9XfyTpRpt+fmz60GYzRFH6EI8KXwI0mpYGpYsbzdDw+LtuP4weNTSxD0LSfoLGAciKV60f0TR
	WBkxn9kksexu1+RbrGRgw/ce3AiWxIxHFSUeh4ws8YRP2OYG8S2PGb8/tX1kMMxSJ4nRLOG37fth8
	BckVD0ig69s5O7lQSFEusrAho6kIyB2wmcVCqEkgAB5gZAXJKwMKTsW5IaOO0c7tM8Fo7xQFa/KMn
	Cdw69ZYluCb8UF3eCT2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTOfC-00000006q2V-06E5;
	Tue, 17 Nov 2026 19:16:18 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTOf3-00000006pw6-3cr6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 19:16:11 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-497614c95f0so66568f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 11:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794942968; x=1795547768; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4skSwwjgJ+QuhFrRzKzpNL0Sq3twAwTkr7WjFcD+3dw=;
        b=BmGGsHMfOMgXixDsVDXAE9VO7IBDcI3itMU9aMOyc+5GvB4VpKJ1enyGORjCH6Ayny
         2cTj9fguScsBKYsG5Gz5Xsi8qX7i2mhebfgCIVevyI753VsS5/fvpeGjomc6tPJYYI5A
         xpBHIUHLsUxmqEWOLa1hxao5dHrVdWjpfE9rg0JhFPIoG0qjDKHyMsfiqlfugF1/EQJ7
         gxaKVKiaBsSCgn2S5FDJM1pUrOSnnkwOIHM1tUe6eRQ1cXwK2ATwtFjMplmZZ7Xsao3M
         x04pg2SMD8etueQR//uHUBKM6ql4xDbCeN0m4gWzcXzkzLqGkK0p00CXykdrtFyh+5md
         9PBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794942968; x=1795547768;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4skSwwjgJ+QuhFrRzKzpNL0Sq3twAwTkr7WjFcD+3dw=;
        b=P+lk51jYR187ZvuF61yrOvILjc8B/ht/GZKTsDLZNGlPPZp6SZP8t5C3muXcupn0Gv
         Pv48327ZGDJnSnHa5OLSp1dSCHPX8XQDab1Nr5G4Erl+SDKSg3+pZ9rDedwpNzVxQ9Fz
         eiMEUfoVgF2zRL9C90iPGOlOG3o2GQ+0MgkpkFlZObiwk7cfrjKzizQpTBD+9VMVsV2Y
         mAD6gLd93ZP4bpjgUZDxr9yT0ll9Any5COMkPXG8quCZ7KntJ+S82ohCBz4vsVtYv9DC
         BwSjnFmQtTRTJZeJoA7H86nsIhVAFlWJV7gvzrdNMFb45C4r1/dLwAh/f8cEYaWtcK5A
         vFgg==
X-Forwarded-Encrypted: i=1; AL+hErHu3JORPqAQ1SpkBUPHzVLmgfC1wzSf3alpGibnukc8JmaS6VV9V+vX8O6HNdq3Q2S1vUXLaezZczqOggtP1KFQ@lists.infradead.org
X-Gm-Message-State: APuU4Z9ibwOATqfZ0o8ygIRUCRlE7y1aSfxYdkhKQL8poPnZtFG1V8n/
	iD5juoVjQrCgJTTafdhG47bjw3zF7Hb2tAch5FxTAhfrIIa7Cd+5C1JzMWzx5IXDf+8=
X-Gm-Gg: AYBFou27xqWmY/KEz0sMOLR8WNoVRoOcvPfaBgGMm2VsjEivd0MF8nPfLle4+oNOoOW
	JiTFZeN99OZCIb7RjzibXyts4p5EGKy1KU0/Vky+UP3N0yglse8aOeyIbmNjxKipxQozLK2Eshi
	EJU7D6RSH6MkWC2Bd18LC9ElAnFjJ5hokXVAEo04sh8ZaZh2qHB0E46A5UjtruL3+KYAxMEyEO+
	TtardNUeusPchj6pU7fLJNSicrMjIEXPeSN/YN0xvOsG6TF9INM9EX8dic7gjc47kQMaGwwuZpk
	SNocaOOi/8EFDbj+rtWtYWnfHXc6v//S1qch0R45nTkIbT6kEL6q3mrojwWCMfnchBG3VqaToH2
	bSImK0dANIRvjJrDUFfx/JKnEVWol3/h4ltLNAuIRQSpe107u6oss4YEt9+Y6iFNuSynkUd2CRK
	gPOCuLhJwgZORvCM1b2yoQJ2eN8l/7smY/GXILfItLooossi1HrfXr1Ruqvij3lTY1Do9wlJm1I
	WR2t4MNN+fm/mHJU48P4WbqHDL6vv5ZPGY2JYCnrRp5rj2mcPE5GqFphGJO3Mc0HMYYi6uAobWQ
	4BRelTh1C7iP88Q8wUt9Q+lBRmvZvp4QDxrCSaI4txdt0Io4u0dcIq+MXDrMV2auSIXeLNzc5d0
	agg==
X-Received: by 2002:a05:600c:3509:b0:4a3:59ee:86b with SMTP id 5b1f17b1804b1-4bb7d5d66efmr3616445e9.4.1794942968020;
        Tue, 17 Nov 2026 11:16:08 -0800 (PST)
Received: from [127.0.1.1] (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2b8032sm5658625e9.10.2026.11.17.11.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:16:07 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 17 Nov 2026 19:16:02 +0000
Subject: [PATCH 1/3] dt-bindings: clock: mediatek: Add MT8196 PWM muxes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-mt8196-pwm-clk-v1-1-d8725bcea9f4@baylibre.com>
References: <20261117-mt8196-pwm-clk-v1-0-d8725bcea9f4@baylibre.com>
In-Reply-To: <20261117-mt8196-pwm-clk-v1-0-d8725bcea9f4@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
 Laura Nao <laura.nao@collabora.com>
Cc: Chris Chen <chris-qj.chen@mediatek.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_111609_912199_F5175155 
X-CRM114-Status: GOOD (  11.45  )
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

From: Chris Chen <chris-qj.chen@mediatek.com>

Add clock IDs for the MT8196 PWM source selectors, so that the peri_ao
clock driver can register them and devicetrees can select a PWM clock
source with assigned-clock-parents.

Signed-off-by: Chris Chen <chris-qj.chen@mediatek.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 include/dt-bindings/clock/mediatek,mt8196-clock.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/dt-bindings/clock/mediatek,mt8196-clock.h b/include/dt-bindings/clock/mediatek,mt8196-clock.h
index ae0946ab7621..a8008fbf1713 100644
--- a/include/dt-bindings/clock/mediatek,mt8196-clock.h
+++ b/include/dt-bindings/clock/mediatek,mt8196-clock.h
@@ -290,6 +290,11 @@
 #define CLK_PERI_AO_FLASHIF_DRAM			31
 #define CLK_PERI_AO_FLASHIF_AXI				32
 #define CLK_PERI_AO_FLASHIF_BCLK			33
+#define CLK_PERI_AO_PWM_X16W_BCLK_SEL			34
+#define CLK_PERI_AO_PWM_PWM_BCLK0_SEL			35
+#define CLK_PERI_AO_PWM_PWM_BCLK1_SEL			36
+#define CLK_PERI_AO_PWM_PWM_BCLK2_SEL			37
+#define CLK_PERI_AO_PWM_PWM_BCLK3_SEL			38
 
 /* UFSCFG_AO */
 #define CLK_UFSAO_UNIPRO_TX_SYM				0

-- 
2.43.0



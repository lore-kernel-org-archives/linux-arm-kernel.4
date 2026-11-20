Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D6D606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 14:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y6NNKwnj;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jdahMkH7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vUlQyjO+S1Bvb+8g1Ae/7d4LlLIZcUiABix0J0NIufc=; b=y6NNKwnjUSMfT/
	0xdO3r8hIOEAua1juGeQIHL67Ntyj7Gz1L/OiEusKafS0G9QvwriJrLEDXJu/ScvDoCwQyX7y8yHQ
	7rYxDzSKx0zm0HpZWGXLdmzkOkXWpb726NBxAUzGqpDwWaALPXWedk7CnE/oBHbKrllZgKSGcRr8N
	Xb949fA98tmuXSys4ntx33CRECrpRWfHwhLJ/durOjNBD4gisBBg+6u+aWMfZVokD5JSxmjH5qCK4
	LE8aZ8bGz4pig+o+dPYlr5+8zpkaUFycDKP3pkxE9kylxigKf9RBd/9yi0BKuOQqU9WHUpSEV15P1
	oah6Wju9E7NaVFiriLAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPoy-0000000FI2x-0NhO;
	Fri, 20 Nov 2026 14:42:36 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPoo-0000000FHvi-3qDp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 14:42:28 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-3b08cf16decso648158a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 06:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795185746; x=1795790546; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vUlQyjO+S1Bvb+8g1Ae/7d4LlLIZcUiABix0J0NIufc=;
        b=jdahMkH7OnMh784rqFRXYHI2jFnJasJvd06spv+LA7P2qrzu0zIDxJhqWOIChsEJBN
         f4Woyj/lCTqN3FO+L2ZWsquvIHIYFiEEWXkEOsKRuU1ghgS+03mrGxf/LmeOhFa1rQrI
         u+W+zquvnjG8EpNYxSibMLP0l/g3SEzbqw8+w5GReXK4EQM+3orxqhrNqsHvV6ECSr5o
         dwMY7CfyQ1BaEHwb6fpgdGnKj21Cz8BTRsgtLKRgUdTLjqqdOBf76IIzoJkRu5WbXWyz
         iM6v2r2W2NxbNMzF/+NA6v4Ax82ANnIGVn1EcUaNm/4R1YcgxetJFGnT79fvP0rJAn4l
         q4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795185746; x=1795790546;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vUlQyjO+S1Bvb+8g1Ae/7d4LlLIZcUiABix0J0NIufc=;
        b=yCmUiDrZZkD7ChiCiqG5G1BPWzJiRSXtaFCR+x1lKORzPwFkHExYCMKgtb9rTi0n+Z
         eUjHLyEDGAy6qJHsNZGphgxW5ftOH2kPKMZ0hSK8Eo8+6vEurGPX6MPGlbjosHYER+9R
         063G0KAdqQIfZFbb/pGQ0qOAfhB7xU6xyMzl2LnXrVZDX7KZRRagP6yFTpuisK3XVnsw
         iHeIMqjsfYRw2vilxzialxKcgLUuGYiZP3qUqoV2wbcWqIFnuJx7hSUBZ3kniOq6gqlR
         EexpfMsexOpOVcxBJ6MMBXIpYTjODkn27BZ71Q4lmn1Mb7dapb3AgWx1sflptKnTYv2C
         FvxA==
X-Forwarded-Encrypted: i=1; AL+hErEcvVttNaM0ZzRqv0NQWzFGLKmkiPqNWH66AdBWOzWuMO6+zy8643HtTEMoTfe7Ubj4jzmTF6n7KxLnlkhlOfJQ@lists.infradead.org
X-Gm-Message-State: APuU4Z+HwA3E67R8hLk2X5nhMhcCNRiJHbIiACkeNahto7I7x1hjRVKY
	DpeRQ8VX76lkkd99P7ceAjFcPnfjkJH3SiJaekOT7C0V0QRQqL2JwI25
X-Gm-Gg: AZFdTZe+liOGxCXenT/fUntSjN7R9586yViXzmLDxAdmLN12P5ER6nK4OnO9ycChPyr
	T1x3XUrjpUAK4E7872vTUQuUI3DNqmh0wFaeOdfCvfrgwEeRZnlva1+s/l46/oLN81nGI/mNIrF
	c7LF9s1706ylu7Zf/g0de2/5at35I14TVo8owea/QiEjpsOXUROYJCj/pNzPZOOD88ukNqx1jkc
	6OFiDyqweHMvz8tN171PWeA80jhVRvrOG2ft7u/xrZ+SgCFoBCT2mnQkNo3KCWNM5cmHE0rCf88
	Fcs1Tt4EGVEzhOfVj/zxg3r3EHRBpUe+pRCDMbm4Zqt+2M0ByXXlCW7ZpQLIjpzHoLpjKNrqmJE
	K1cg1p8PWZ9Bipc7OLUUu8wtP60hKlJ/7/OklrCxlgXNi9HNhOXG1cCod8XYoHOiXUUe1hJ5D+r
	E4VQlS7Tw7oZyXkAJdDDGSKetV6WEU7U25zhQKt8rX6dK71uM7B8Ejqq6WZpFwUPcY5RCQSmdRL
	leMkW+5PlIzPlYI5ivgaxxAC8zIXdHAxdMOXrEzbX8uKhFbgGn/igTvn/Zh0bEYqUbUan3TLSsV
	N1+lsQ4u6LC6C6ls76mMV+Uwfoyl0kb/pKNWGQ==
X-Received: by 2002:a17:90b:1802:b0:3b0:c11a:9026 with SMTP id 98e67ed59e1d1-3b41c95fa0cmr3172758a91.55.1795185745681;
        Fri, 20 Nov 2026 06:42:25 -0800 (PST)
Received: from [10.98.15.223] ([2a09:bac1:6500::19b:170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee848c1sm15346435ad.10.2026.11.20.06.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:42:25 -0800 (PST)
From: Chuanhong Guo <gch981213@gmail.com>
Date: Fri, 20 Nov 2026 22:41:46 +0800
Subject: [PATCH v2 3/3] clk: mediatek: mt7629: add RTC clock selection
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-b4-mt7629-rtc-v2-3-cd877cd496ae@gmail.com>
References: <20261120-b4-mt7629-rtc-v2-0-cd877cd496ae@gmail.com>
In-Reply-To: <20261120-b4-mt7629-rtc-v2-0-cd877cd496ae@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_064226_977735_7441CBF8 
X-CRM114-Status: GOOD (  13.30  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

CLK_MODE bits 3:2 select the RTC clock source. Selector 0 uses the
40 MHz crystal divided by 1024, while selector 3 divides it by 1221
to provide approximately 32.76 kHz. The integrated Wi-Fi needs this
/1221 source.

Add the /1221 fixed-factor clock and the RTC mux so device trees can
select this source through assigned-clock-parents. Keep CLK_TOP_RTC
for the existing /1024 source.

Selector 1 is reserved. Selector 2 is documented as an approximately
25 kHz PMU bandgap clock, but its source and control are not sufficiently
described to model it here. Leave these entries unmodelled while
preserving the hardware selector values.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 drivers/clk/mediatek/clk-mt7629.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt7629.c b/drivers/clk/mediatek/clk-mt7629.c
index 517c43b19f18..4843bc55dc7c 100644
--- a/drivers/clk/mediatek/clk-mt7629.c
+++ b/drivers/clk/mediatek/clk-mt7629.c
@@ -17,7 +17,7 @@
 
 #include <dt-bindings/clock/mt7629-clk.h>
 
-#define CLK_TOP_NR_CLK		108
+#define CLK_TOP_NR_CLK		110
 #define CLK_INFRA_NR_CLK		6
 #define CLK_PERI_NR_CLK		22
 #define CLK_APMIXED_NR_CLK		7
@@ -290,6 +290,10 @@ static const char * const infra_mux1_parents[] = {
 	"armpll"
 };
 
+static const char * const rtc_parents[] = {
+	"rtc", "clk_null", "clk_null", "rtc_32k"
+};
+
 static const struct mtk_gate_regs apmixed_cg_regs = {
 	.set_ofs = 0x8,
 	.clr_ofs = 0x8,
@@ -372,6 +376,7 @@ static const struct mtk_fixed_factor top_divs[] = {
 	FACTOR(CLK_TOP_ETH_500M, "eth_500m", "eth1pll", 1, 1),
 	FACTOR(CLK_TOP_TXCLK_SRC_PRE, "txclk_src_pre", "sgmiipll_d2", 1, 1),
 	FACTOR(CLK_TOP_RTC, "rtc", "clkxtal", 1, 1024),
+	FACTOR(CLK_TOP_RTC_32K, "rtc_32k", "clkxtal", 1, 1221),
 	FACTOR(CLK_TOP_PWM_QTR_26M, "pwm_qtr_26m", "clkxtal", 1, 1),
 	FACTOR(CLK_TOP_CPUM_TCK_IN, "cpum_tck_in", "cpum_tck", 1, 1),
 	FACTOR(CLK_TOP_TO_USB3_DA_TOP, "to_usb3_da_top", "clkxtal", 1, 1),
@@ -463,6 +468,8 @@ static struct mtk_composite infra_muxes[] = {
 };
 
 static struct mtk_composite top_muxes[] = {
+	/* CLK_MODE */
+	MUX(CLK_TOP_RTC_SEL, "rtc_sel", rtc_parents, 0x000, 2, 2),
 	/* CLK_CFG_0 */
 	MUX_GATE(CLK_TOP_AXI_SEL, "axi_sel", axi_parents,
 		 0x040, 0, 3, 7),

-- 
2.56.1



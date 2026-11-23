Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A03606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 09:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cRVNS7Ix;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Bu8fXEOZ;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=NAO/oTEq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SlPceQ/NGCnBw4wRJ/5LfNtk5NdmNItuCsSpVWw73H8=; b=cRVNS7IxItMnA/
	G42momda8CPBQpusoSOU5udhPUTi/lGU5IVEXWpfhWpB+LMia0NFXRVx/2Yh/V0xJUDpZhg5sh0Bq
	E6lGuwLzMgh/Vkp5HP4xcr2pzLfhO8W86dXIV5vp/m2cHC+11z24ua8iG8CeHA1acWySCb3iuPpB9
	+H453jXjnQG5i80Ccip9ycgvTh0+cutyyN8DvfzDlxDKEqYb/fV4/BhrP+t8ldPrPTNEOKpQfJNX3
	OzUpRiIOF5Z4FguB8fuO8hTC/QaUfdIE2p8ONHYSfvl9dBbXM06DQ0qyL9usLPfd8D2gYd2w+o7Hx
	WUWlRU6fxW8sOW59sqSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQEa-00000002gwo-3rjy;
	Mon, 23 Nov 2026 09:21:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQEN-00000002gnC-0AEv
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Nov 2026 09:21:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=SlPceQ/NGCnBw4wRJ/5LfNtk5NdmNItuCsSpVWw73H8=; b=Bu8fXEOZhV3R2wDsWextGDGeI9
	OkQPRNk7A1N64yGHBSVoGRli9WsLYYApAyoEEG+KzN/VilCw/h6lLRhcn3Hn8qMMJl3p5Ml8E04Kr
	CVJP2FWszP5c3ZlvHvPz+CYSX3vXSZeloS9fW04Xpi4Ezty5RsYy0MbujjF0QoeKq9pKvkWDRRgVY
	AtbYKnr/oZcLaPgF5Y9l7l3Fy4yKEXYCAWKMXk0sK721H6xfhMSTHlH990If5zQAcLs3fbyd4JVhC
	sbg7Lm4saFG8rtVCqO3O6Ky/GwoXhIIx2y2wG+mLpXubGk1nMA0BGUnX9OIxjXnbqBW6Ld3ouIUsx
	z19vXsRg==;
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQEI-00000002uee-47wO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 09:20:57 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so23119345e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 01:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795425653; x=1796030453; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SlPceQ/NGCnBw4wRJ/5LfNtk5NdmNItuCsSpVWw73H8=;
        b=NAO/oTEqONKbJk/jSnhihjkV2QAUnIFMMXusnGhuC63VdEcwe0e/A5dOM0pTEqmbSA
         U47vUY1U7Jqdsk/S0cKTi50NxG/JTBPNr7NfygiJoYfQiB+IxLtnd53G5PFwiCiibQO1
         C++qV/cjlsAn3WuiEbsJmZFSsNVPtSDCWwpyfMO5anltnXUw98Csku/gzKaQlHWUcd5D
         Y15XhQw4ckaxGc3QlumOx/yF+4DdWSldtIEz6I18g6K1HEEYVhtB2e5yQX/nhXspwuce
         q3S/LxWZINQsu7JH2IZBFNLTiWzogIvWo4NPH8iAFgd/KKWRWqCN/kakWHk1Xp74rUhf
         8+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425653; x=1796030453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SlPceQ/NGCnBw4wRJ/5LfNtk5NdmNItuCsSpVWw73H8=;
        b=jQe8vys6iVpAV+o6fwxpUjOTk+skhD0Whe47lV2Ner9szCdN90OPwwnUaOoeH6Kj8J
         H8NOMH8BF+QffcHwMNfGHMybQFlri9gYz1WVCq332P0d2tY5TlKEYCcpIslvKjdLAHCq
         OLRbeCRM5qsCGvN5EwNrHKO2xkTm3Hwn1mkkspiWo3pGHsvvtdPp8jVVXXw+SsIRe+BI
         hRfoSXgne++XvE+B4yUmAa7yoSfK8CauIRJ2K9KL1x6QH7trv5ObtIdkVSgI5ncqh9k9
         2nCqNPSmEVhYOFOuoJHItEgEkpeX47t8Xx58lGkWMG4HA4w2G1o71SeDkdbt3HNLgH7z
         LCRA==
X-Gm-Message-State: APuU4Z86jsih73JcSBiWKy6c3wEE2dWT81/yX3Sw3dQKANbsucCub3vA
	169lj3VUvLBijojeoio8NCu/bQBEnAClK44r8yltlY1Pl7PAZNzUEAzItAw9rka449U=
X-Gm-Gg: AZFdTZcBpDkjOG3K9TwjCHkA4Z+/pEY0ZyjSMAJ7XBrmV6LQkFII9B766ZvU/zwf18H
	/JirQWBSm+s9FzPg4AJg8ZTFlCpiSBUTHxXoSF6O+SvbiemfwMOzdScMxyG97MOJXtFqZ7OrLQ5
	JrgNX6++5YurLzQFsiyP5ZGwcNMwH4NaX0rDcwTAKaze6J3LRpD7gvxETwiA3wF2RE7dXLvrfsD
	0U5be5f2EknGLm5GWoJLGP5fvlG5svfYelywW4ofLTOBLlK0SOLz/28J8UssQD05Afz2N6MtRVW
	Iby2/BKsU04eJylip4xT1DkivjIEV91msgxnDakuWJWJEHH7wmkvtQ6o2KrpLWCJbdxOagp7MVe
	QXeyvpbDofwjWkLTSVcBVwlFDL9A92Go6bYgBQSVy19AkltcG3cOJMUgEZ3oenjuaeChOJufr4D
	AlFCx+aEukJpSpEF5Z7HS1iVum7WRetbf2uSMD834222gekZfR4YPHE7w/Immrc8h3FD8qB5kFw
	T3zuGEy+vhsdhAo6xVgu4B8TJ+5GWByr8qbJkBWBIMau6fIu5SKItzznT5ZuZeEYJHG2+Pz5hpM
	hYGVRJy2flL1EWFfJ9ctTuqmFpV/Qeh8+4pcTDXNk9MEBFfgXTTthlj2KJuARK9TTEI/gmCz4eZ
	Ry5qHzIYCHZop1AjlyQBY9l3hvdIPUCSWeReFGu19+C1dxg==
X-Received: by 2002:a05:600c:190d:b0:4ba:2bfc:c8b5 with SMTP id 5b1f17b1804b1-4bb888267aemr218707705e9.10.1795425652884;
        Mon, 23 Nov 2026 01:20:52 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b39b6sm296458505e9.12.2026.11.23.01.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:20:52 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Mon, 23 Nov 2026 10:20:47 +0100
Subject: [PATCH 3/3] arm64: dts: amlogic: s7: add the peripherals clock
 controller
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-upstream-s7-clk-dt-v1-3-95f46d67d8b4@baylibre.com>
References: <20261123-upstream-s7-clk-dt-v1-0-95f46d67d8b4@baylibre.com>
In-Reply-To: <20261123-upstream-s7-clk-dt-v1-0-95f46d67d8b4@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_092055_012804_72106EDA 
X-CRM114-Status: UNSURE (   9.57  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
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

Add the peripherals clock controller of the Amlogic S7 SoC family.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi | 34 +++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
index eb123d022bce..5e0cce9149ff 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
@@ -162,6 +162,40 @@ apb: bus@fe000000 {
 			#size-cells = <2>;
 			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
 
+			clkc_periphs: clock-controller@0 {
+				compatible = "amlogic,s7-peripherals-clkc";
+				reg = <0x0 0x0 0x0 0x49c>;
+				#clock-cells = <1>;
+				clocks = <&clkc_pll CLKID_FCLK_DIV2>,
+					 <&clkc_pll CLKID_FCLK_DIV2P5>,
+					 <&clkc_pll CLKID_FCLK_DIV3>,
+					 <&clkc_pll CLKID_FCLK_DIV4>,
+					 <&clkc_pll CLKID_FCLK_DIV5>,
+					 <&clkc_pll CLKID_FCLK_DIV7>,
+					 <&clkc_pll CLKID_HIFI0_PLL>,
+					 <&clkc_pll CLKID_GP0_PLL>,
+					 <&clkc_pll CLKID_HIFI1_PLL>,
+					 <&scmi_clk CLKID_GP1_PLL>,
+					 <&clkc_pll CLKID_HDMI_PLL>,
+					 <&clkc_pll CLKID_HDMI_PLL_PIX>,
+					 <&xtal>,
+					 <&scmi_clk CLKID_ACLKM>;
+				clock-names = "fclk_div2",
+					      "fclk_div2p5",
+					      "fclk_div3",
+					      "fclk_div4",
+					      "fclk_div5",
+					      "fclk_div7",
+					      "hifi0_pll",
+					      "gp0_pll",
+					      "hifi1_pll",
+					      "gp1_pll",
+					      "hdmi_pll",
+					      "vid_pix",
+					      "xtal",
+					      "axi_frcpu";
+			};
+
 			clkc_pll: clock-controller@8000 {
 				compatible = "amlogic,s7-pll-clkc";
 				reg = <0x0 0x8000 0x0 0x1e8>;

-- 
2.56.1



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C230606A323
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 16:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TyOi6Xsc;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=KPl8cy1U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=3RllXL5eEjI8zgnLPn1T6vdPy/s5DlXXha36u6N6604=; b=TyOi6XsciPfCETkqMW84N8M3yg
	dHQyjnQ5b24t4UQ8vUg5G2a4a5MVeuyGFBcBE9hrVhdJrSVEMCfbEMOWKKPJGiW70waYZBU60TaPr
	DAjFwYSsUTquKk6MLTqHrEHvT6Cqot2gz0zAqimryFqkvtOkw+i20uc1vtnnbJJowrkUTqswsOxiX
	XZc/pqrQWXy3R+IrnAPAkRjcNkzUesj38ZCMIiCTVm0P67Gk5ylVI1SQUxP+i5usEYACWYIW++850
	aYtuk8tPorfRaH7vC3+MAh9PN2U08EcZvSv92nraId/y9v12qd0KJR+Phkq/woj81jlof2N9F/Q/S
	khRxSTCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSdBp-00000000CJU-2qaL;
	Sun, 15 Nov 2026 16:34:49 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSdBn-00000000CIh-1TCU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 16:34:48 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so1314476f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 08:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1794760485; x=1795365285; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3RllXL5eEjI8zgnLPn1T6vdPy/s5DlXXha36u6N6604=;
        b=KPl8cy1UvE0Vh70iBhVNcZatUfYsj6tWMXXXweNUbbAeYDb09aIRJzJfNfJNlz+slh
         uPmv/9s1vXirNLrj/GbsZ/s7dmH/IDtXF3UlYNPg+UL/r4A95QXsuX72LXD9J0riU7iF
         VDYdPm1qMp4jZAFRgvQVBnJ3VJZbswA5kr9lo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794760485; x=1795365285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3RllXL5eEjI8zgnLPn1T6vdPy/s5DlXXha36u6N6604=;
        b=h9g2mWTKaO0UAeqVu2G3WiA6Z830jp8DWObPObRUMAhF90aGxC/vVeMhudhNlfc39k
         xI96WVdsUl2sFrV37VYQ7SIGFN1dRtSTgeW6gmnFAjCOO8IIvaTyQMzpNbnB0plsMScj
         XWkzDAltU1ZtD5dIET99patRJG+IocBQpcPWHygxvlusJq1cw2ghhAKr+WBdDaStf27J
         HtEfh/j4ORh99ImKs4m5VcdluaaA1shfjvIitC755eQkxQk+w20S3Kj4UUjeHU4w/rqk
         10j1L1A7l8bilKOWGdd5l0x2Q77XsBlO1b4bXnuy3X8DvLJs+h5TGvHF9E6kMHmuPogF
         CD3g==
X-Forwarded-Encrypted: i=1; AL+hErF9YzX9iqgsmBQTF4kLVXdtUSsROrLUvuI7WjGq0fXMvmZ1hY2M5LFKY1hGNCsI+Qf0OJCaIQ5eh4Fi2bM6VI1Y@lists.infradead.org
X-Gm-Message-State: APuU4Z8kxXCAK+BpPHslzBbL3FtvjWxTg4qni7xW4RKlOp3PN85Y7JV8
	Te+1/QL55atGPgCnnMSe+9hzFyFMiC7wv5haYOmvo33B0wdlns/HNGg4ijSxrDcLLgSQanfsfKx
	RF14l
X-Gm-Gg: AYBFou1zIRfPGsZCOi+OgmgxvsuycrwI5sIm7nxHLPzZmPJOE9/v5fHSqFnkSLcqcPo
	2xJ4jUxanJj0QRWDzkxQMhIsP/c1xW8o8c4hD9I/Y0VB0oHQS1y7u/a2dp6+DQIpmie5QAYC992
	rq7hkqs/v+iIVoy18F+75mv4lxlpgNrwgblzMphQns+fKTRUHdpYGuktJU+/DESO8AGgxOQynA3
	g74lCoODN2CB3USMKEahUgLdn/SJxpuLr3AJ/ShBgmjMS/uSO0jNUmdsoUqenyHdCfF45kllC5B
	2E9y49sdbAbxnjxQ/c657BQjQwwPHyXI1UlF20kGuliJa4yNeP+ihKljpQVW0ZMqAKMFH01w6PY
	teJtEpxblDaUQJq375G1nJ9cC174i8KQwt/9Dj6v2BZ8VeTr5VOUXFKAdN73EdFBAlAeQTbTbh5
	vspqnQBeIVNkeBhjYoQ7lBt0GVEdkMm9hwcBUNQU+/5Jp+vMsuvV5Bib96Fd0Rss5N+TDZEcMOE
	b4aB1sJOx6qV5Isn8Cxayg5aLKeU63WZgcLi3/gTrhj6K0yWI/o4K3xS4GxiGBrs6PBuU0LNnkJ
	Jwkm8j1v9hq4yvlL7meVxoL1wwNh/aSse2a2cXXDc3Y3VQ38eOixL71HPaWCno2m6QRHL7RtGxU
	WH3h+DkUZqSM8sg0pBOtXVn7dxnnwigTutd84bHJJcYxPB/urPARlDjYRF4c458dUHsa8h3MHHa
	0pk4RxwwvASdXjZ8RUf07fPCKloVA=
X-Received: by 2002:a05:6000:4a07:b0:48e:10a7:438 with SMTP id ffacd0b85a97d-49c725e5f59mr17435801f8f.36.1794760484976;
        Sun, 15 Nov 2026 08:34:44 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f782396sm17500021f8f.24.2026.11.15.08.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 08:34:44 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 1/2] arm64: dts: st: enable eMMC on stm32mp257f-ev1
Date: Sun, 15 Nov 2026 17:34:29 +0100
Message-ID: <20261115163432.2601947-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_083447_421731_86766397 
X-CRM114-Status: GOOD (  10.18  )
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

Enable the eMMC connected to SDMMC2 with an 8-bit bus on the
STM32MP257F-EV1. VDDIO2 is tied to the 1.8 V rail on this board, so
the DDR52 and HS200 modes are enabled. Tested in HS200 mode at 100 MHz.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
index 782b4bb843ee..9c38c4fe0c1f 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
@@ -431,6 +431,23 @@ &sdmmc1 {
 	status = "okay";
 };
 
+&sdmmc2 {
+	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-0 = <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_a>;
+	pinctrl-1 = <&sdmmc2_b4_od_pins_a &sdmmc2_d47_pins_a>;
+	pinctrl-2 = <&sdmmc2_b4_sleep_pins_a &sdmmc2_d47_sleep_pins_a>;
+	non-removable;
+	no-sd;
+	no-sdio;
+	st,neg-edge;
+	bus-width = <8>;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	vmmc-supply = <&scmi_vdd_emmc>;
+	vqmmc-supply = <&scmi_vddio2>;
+	status = "okay";
+};
+
 &spi3 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&spi3_pins_a>;
---
base-commit: 23c62304dde29abe92013d85910d03a77dada35d
branch: stm32mp257f-ev1-emmc-aliases

-- 
2.43.0



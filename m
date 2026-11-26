Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B87D606A6A3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 20:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tBZ1bBQM;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HwkjbXZk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=l0FqxSdSkWVcKj6JvNw9SG+fnKtmoC4+i5Y2izvcenk=; b=tBZ1bBQMdAfUA/
	6EzRCKYW5VDSosUZVA0fpI6APbeVKV8Ht/lplV6Gb2NiU90mn0AWxuXbGpqFQKinML2HMYTuX3xLZ
	VHDqloXCVm/AKk7mLeeHe982Bz45lFIrCRRw8HaKO/YgNPGaQhCIur+Q1x/kCwbkoqNAqWvtGwmrz
	c4HSGr1A0OoxlCwpY086b3lKRg+fIWOQCUI7LUbiE9rSn86SOLPtl3VSg2LXMAqjf0VSVltntZGTW
	ev9xf3OIpZ02ve7pR+wN0FQuN7xWyq6EWfPcP1oMPOTFW+0lo0tncir3MVCUZe18ELEbMo8lRTVfy
	YpUStAEfhRF1aDZyFR0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfEv-0000000ELuC-2Cw5;
	Thu, 26 Nov 2026 19:34:41 +0000
Received: from mail-wm1-f42.google.com ([209.85.128.42])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDz-0000000EKCT-2uh3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 19:33:46 +0000
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so95245455e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 11:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721621; x=1796326421; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l0FqxSdSkWVcKj6JvNw9SG+fnKtmoC4+i5Y2izvcenk=;
        b=HwkjbXZk78BhydLMGe1QHWjaZuPgW2C5EcCUwiQpz0b6BOreosB4fu2t2LKA6RyeZY
         RSGGQKeWpc3p0y6XZ9QRmhlsypBkCbsSvd98myjRz2GNb+m/MIxmQV4Iczfl92g8/us5
         kNWluWY8TRcMCM9bUIAW8QQwCHP5ILOugQMD0UMk2aIdQ7+4L60xWNtXcQAf/KVwa71e
         nvO5s7uyCYY1Col2E7LlpLejtO1xkYbQ8+cr1qo5qqcvxLowla8bIkDnYNrb3dCYWA4V
         6Snz3jf8d936KkWwp3Zix5LQ/KTgqZZKIog8jdM13EtDcHgadOL9RbtEQ6op6FlNJZ82
         MpZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721621; x=1796326421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l0FqxSdSkWVcKj6JvNw9SG+fnKtmoC4+i5Y2izvcenk=;
        b=MCv4T8+wXq1yFpW3Yi7VTFLn1H877iVLbkEQAm3Ns8brgXxyI/jbdmsG2S4MqkHnEp
         G1dZFR6tBusQmf6+gx4uIBdh56+/7ZNFIdaEyiE2j17hcK2WcqUzipYR3juJKnTpQf/e
         qbkkcIRD2J8WgZNTXpic3qz3CMAhE8Mv+ial/SAdIn46UxRceTJvdqoYBSrmaDKMmDUQ
         aRyhlcWxZsYbLUBA/tmb40dzuJA/6XZ5398RZmoRieZV+Ebn1lb9wQGWiTnao0f+hbCj
         rXyRGT1Au+vcW0JAPgRmYY5z/WKxUUXVt7lI4T87QQurIzDsq8kt3iIQVvroaJXVt6vj
         /G3A==
X-Forwarded-Encrypted: i=1; AL+hErEAOZbtxY5a4KNAhLkGneYzFff5tNB55QA4N/IYNFIP/nKJ7c6HMoZDiKeVoT3uScRi33gXgMA5qFwhWv6orFQw@lists.infradead.org
X-Gm-Message-State: APuU4Z+W+RflFJYVkPmFJ1M3Mbiso+tARL+u4IayeOAzpw87DMhgDU0K
	d5KDgyuQ9AmfU+MS3rlq3NTCSgYgJAl0rwXeRPCCUd2Lkf234pyj1t1A
X-Gm-Gg: AZFdTZfdnnVxmmtxLay++IONn6peHBb3vY+s08ehzJ+88KBDjv+8jb9eYHYhX6bns3x
	AKVSkDCBVvwefVXK7JZuFEZ7AKHlcB8T7EHjJUfuWwZ9zNdLNvE2O3+0xrWm9k/SxpBr7OvHZB9
	WxnW1OQJgwE6uuPagSPb7zm81xTeogGsK5xkhSz+vGepJDRf90ETRsE8hWQptHKAVFk7mdR5akx
	2l8xRs4cfH89VKvvQu37JXz9psf1VN00c/jwo+l/aI6emC8hSi+VNg0i9YoGbEtmDxfUhuyEDiY
	D3O6ybV3ciHCtpqFXZCqRv2bOCT0K8bdesrXZWmumurbyJwmwZInzkEkuXKTa0UAErRIKgpL7Iq
	FYC3Anm7GgFvT8XkaEzOX8RN+H1CZzo809pWkZeNx599A5311ah1DpSusmF/7Id98CkEQOpVkOB
	dfRkrMYIhwpp8jOZqRbcnL21ep23WZsZwoOa6G4Kt49iW9mOEXcqe5bEa9SZsnHINcaBVKWXp9G
	CvmI5R8CZkbc8MJd1F0nXrDUCS9owatI2ah2mtQEQoMH81JCdWdALCWz4cXYnQ1jsM0JxRCFTkM
	Pepct+3jEekDApdgmVUqkDbkMDhpJM4AEOjoL0zsGRBUuw==
X-Received: by 2002:a05:600c:4f81:b0:4bb:5e8c:13bc with SMTP id 5b1f17b1804b1-4bb88805902mr425835985e9.7.1795721621193;
        Thu, 26 Nov 2026 11:33:41 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm368287675e9.2.2026.11.26.11.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:33:40 -0800 (PST)
From: Jose Nieto <jnieto.alaber@gmail.com>
To: Corentin Labbe <clabbe@baylibre.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexey Romanov <romanov.alexey2000@gmail.com>
Subject: [PATCH v13 25/25] arm64: dts: amlogic: axg: add crypto node
Date: Thu, 26 Nov 2026 20:32:41 +0100
Message-ID: <20261126193241.1471372-26-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_113343_822856_9EC6E126 
X-CRM114-Status: GOOD (  10.30  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Alexey Romanov <romanov.alexey2000@gmail.com>

This patch adds a crypto node declaration. With the
Amlogic crypto driver we can use HW implementation
of SHA1/224/256 and AES algo.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 5b8ef98f6d03..e755a019b384 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -321,6 +321,13 @@ ethmac: ethernet@ff3f0000 {
 			status = "disabled";
 		};
 
+		crypto: crypto@ff63e000 {
+			compatible = "amlogic,axg-crypto";
+			reg = <0x0 0xff63e000 0x0 0x48>;
+			interrupts = <GIC_SPI 180 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&clkc CLKID_CLK81>;
+		};
+
 		pcie_phy: phy@ff644000 {
 			compatible = "amlogic,axg-pcie-phy";
 			reg = <0x0 0xff644000 0x0 0x1c>;
-- 
2.47.3



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE28606A327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 14:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cY1XRiRn;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=PAnpi7dS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FEdGm/AcXh2womt9GiV7Pf7HrO6Vbc46kckpe+SSelU=; b=cY1XRiRnscl4Hv
	1M7GjgG2jE2K2uDxukI0tpQLZLZJr7y1OY6KUVOpKGsjA6asFzTfvfP5T9PPNEZZe8sXQVxcmsgaw
	KCTcaz6OqA8CQqlCf6SOgh5OVNe7LdtGGY00oV1Bor1B8w/VgwR2IxTguxEA75IVCSav0F4brvLCx
	1KWGidjVQfk3QD+yWwd25Nj34ooPfuXEibMjW9qOcRz8V0ZMHH5xf9s2WZYJwns/CfGo+cwIVgb8T
	S2a6D15RgESW1byk64lFlQ30grmvL2+xtm3hAADwJ/XR35urHBvbFL6VIcz+/zE0r+bd7EGrH9KkJ
	r2EPAOL1Bb+nxk/8WCxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVTf-00000003qMo-1XoD;
	Mon, 23 Nov 2026 14:57:07 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVQo-00000003okk-3diV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 14:54:12 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-4a42b34e930so2985245f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 06:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445649; x=1796050449; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FEdGm/AcXh2womt9GiV7Pf7HrO6Vbc46kckpe+SSelU=;
        b=PAnpi7dSaSq8hAeVBYlxjqWnpEEGi+tL/olxqsSToxoxuDb5ejOORgTWm0ZbTRc9VA
         sRohSeA+UoN+2AuwLv//geynKhN+Us+0n7mXyEVXLaA3Ks15pej8gOyGOgTMVFxbef1C
         0k9mlW2/LWMA8NDLbxLzNssnpnG/dJvaEoZXKBXANujgZrRisaYpMlEesWxxm2WwYraH
         87AqqygTRtauPqH3MsPD2y8JgpZ7In8PD98NKrC2ETWrJa9s52NN8z7WH0Cx/mdNMDqb
         UVEQy7T5oQVYuuA06OYcatB/ewOJpH8I0xo+adwZn1XO6WyaBlmHEcW6vh2T6+lZweoZ
         5sgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445649; x=1796050449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FEdGm/AcXh2womt9GiV7Pf7HrO6Vbc46kckpe+SSelU=;
        b=dwPpKGKk9s6TW8MAK+mTRJjd6JuW1j0xP1RRIv8wGtQXu6BOxz4EeuZi95lkpCYfPd
         KAVM9vPGnlGLDv6LZG9CILhMwxrYjieOqqOcqi6rmKDzEvXa+98cs2EaCprfqTdamIZB
         ajJvhu8pBGZgXHF8t45IHWuh/sn4DU4WnspFxSMBCSmu95P7X+kE5qwOeH3XuT4J7alp
         7hBsN+Yegl9OKEJ18U20KQ1qoiwsFQCjB4jFWxkrygsIbQU5clU566IeCB+ofKJvy3Yy
         FwKnBBi1fQI5MH417DvaaGGZ5WLRbpYfSrr9XWBs+Bdy1rWIIbKi506lR5TuON8VDZ9v
         9jbA==
X-Forwarded-Encrypted: i=1; AL+hErFvbzwdJBu6jBtGh54003ot/CeRYGqBIyKtuL2LtEo82dCbSOXmRno3g/5bFFPwZBxpNXFIc8vTz4F7CcJsAGZY@lists.infradead.org
X-Gm-Message-State: APuU4Z/qt9ji5+KBTwuT2Oy1hWbiAJgvvEhUuH499wD9qAkUyNFv7ma4
	RfmxR9VeeTAJM3/WvygYHCBWGLCUtpeLu851bxUv0NRgvS19WiLbpc2+WgYeBGh7obg=
X-Gm-Gg: AZFdTZeoZor5ap8bnvrf9DVqc69asrudq8xSN1WCCpLN5/0ia5ryVKwtyBaa/qHnsj7
	hWiiKC+08GXTpaWfCkleH3+49u8PwCLuyEeAaKWCFsxjyfgNbaklrCgKE20GyKEj00UR0xA5YFd
	K6zwEsiqiBMC4eEusQ+mnRG1booKqe2atBhOHAjxv09DwsExZ2+HOxVVoGx5Cz6Kn68Ut5kS9wj
	5DzTpjttyf/NuaO4DEhewu++P+JVhwCy8B0L5Xey4s2TT7OAyFkUkq2isFwCFaGmLN4K00HIYKY
	2Wx43/pNHEoP+DSXNYmx6DFYGc4vp/xqasz/QcSH2dBpB/FE+22VhPuYCYiX8mn+KBfsBTamWVB
	ol9nDsMsXEKM2RgONcNCeGPWSvSoec6CwipjJGjc75Wnh4CjAvX9zTY9tb9fn47NaXkPM5Ifvqu
	BEWw2kfLExhpbGeQrCkeBX/GixM0SwD4RYCMft+qP5hQp/5NeELNnbSQHgw2OL3NdTm9ReOjG5p
	yh3OZHdlGYX1wRuBxspa6WlR67HQcqV4OWHWkcU0vIJvSRZqHulWLpcL6ydd+7Ay43bPpo8QpGW
	iuUebmXll5216DU0/Um5Foy6HUk=
X-Received: by 2002:a05:6000:4617:b0:487:27f9:840 with SMTP id ffacd0b85a97d-4abb59e2898mr22790459f8f.53.1795445649226;
        Mon, 23 Nov 2026 06:54:09 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2052c8sm22701444f8f.41.2026.11.23.06.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:54:08 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dom Cobley <popcornmix@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v3 27/28] ARM: dts: broadcom: Set the DMA flags of the HDMI audio channel on BCM283x
Date: Mon, 23 Nov 2026 15:57:05 +0100
Message-ID: <20261123145728.29082-28-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261123145728.29082-1-andrea.porta@suse.com>
References: <20261123145728.29082-1-andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_065410_917923_B2484B89 
X-CRM114-Status: GOOD (  13.04  )
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

The upper bits of the DMA specifier of the BCM2835 DMA controller carry
per-channel flags, which nothing uses in the upstream device trees so
far.

Request wide (128-bit) source reads and skip waiting for the AXI write
responses on the HDMI audio channel of BCM283x, as done for years by the
downstream Raspberry Pi device trees. This reduces the bus traffic
needed to feed the MAI FIFO.

BCM2711 is left alone: the downstream device trees route its HDMI audio
through the 40-bit channels, so there is no established set of flags for
its legacy channels.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm/boot/dts/broadcom/bcm2835-common.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi b/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
index 39eea8ce1058..6267f0a67565 100644
--- a/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
@@ -130,7 +130,8 @@ hdmi: hdmi@7e902000 {
 			clocks = <&clocks BCM2835_PLLH_PIX>,
 				 <&clocks BCM2835_CLOCK_HSM>;
 			clock-names = "pixel", "hdmi";
-			dmas = <&dma 17>;
+			/* DREQ 17, no AXI write response wait, wide source reads */
+			dmas = <&dma (17 | (1 << 27) | (1 << 24))>;
 			dma-names = "audio-rx";
 			status = "disabled";
 		};
-- 
2.51.0



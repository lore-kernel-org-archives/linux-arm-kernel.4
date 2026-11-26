Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A675606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 19:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LQWs/Ijt;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=LqL23LYE;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oDSqrivY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TyMpVGhTjV/u04TckFiyynsoMuEnZrBpJU3DYNeD5YM=; b=LQWs/IjtYZ0WgX
	gIb/aBsSFoNxcxgD12dfpFG7g2w5tD1L/sQI/HTTl405dYnzSq+s33dO3E2YwfcQ/RpEudNltIcgO
	T7V6BJgbzAPVxWkO9zag+k7uiGaHhQoiKNIlgVjX0F05I1LKf7Bmo7Vy8QXY3lIO5eE/wo62Wrkej
	L0m2cYi04fT5OdHhPjU9XdlSuX6r13Cs6uG+a7i7Rg+9ymfIR7RIbHFPTHf3BOJvHfRQDd3uNroVH
	bF/WUoG4v084alnR+eR9Eek41uOvwnKXyWvqC41xmvYITK5HVHwza7pq05UVVStbtO6QLcPzzJkhO
	CUpUpP2+3ZZigzBableg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfEV-0000000ELDj-17Ui;
	Thu, 26 Nov 2026 19:34:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDv-0000000EK6Q-28pj
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Nov 2026 19:33:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=TyMpVGhTjV/u04TckFiyynsoMuEnZrBpJU3DYNeD5YM=; b=LqL23LYE//XY7c0CrkCeqnc6Fk
	d0hi6uWPqEgl9Q5J6a/pjB8t+0UPdtp4u/lL0Cc9EswXwUN1Mv0mLLHpmfrjAGdNhyjN1W8+dcRnW
	ZHOjR9MLmLxxSHklduuWtZaV0OFsg4dH8OW7HceGiJxfMSVe2E9lLbYWsYjhIaJ283dSZzg9MSanM
	tdN5Faq+g9FHGKGgZwqzm7RjcJpzlv9Ksv9UGgOQfL1G3NA71UNzBe0KdJ6u4890u171f1W+U764H
	x/egxM2k0LT4mPslrNRLnmwWIb/wcm4dsJEb9UEJU/qG+JO4xOfk+3icMAowNvHhj1BnNlRZFBiGn
	0XiEUGCA==;
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDs-00000007018-1pZs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 19:33:37 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-492690dd5daso5633428f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 11:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721614; x=1796326414; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TyMpVGhTjV/u04TckFiyynsoMuEnZrBpJU3DYNeD5YM=;
        b=oDSqrivYozuPHDB/aQNjJgQeO7dAfJv79fd9Rph8aCFy6ydq5SWgeNG2UZk4fRXyDY
         kRCI3uriE+gCSMufwglkxbiuBo7b+7gVFD9pgooUBzi+JOsc/hvri3rcuf5K7n/MJgrJ
         hGayRWqPCElU8rV1v4rGG0+YQ7Cgpt/VhXNM23z2jVsjiyEkCrLYlvHO0a/CjiNF4o4n
         eH019PLwdeIU6TWNDLFhOloJe3g4T+6YoY2XXqUTH4eGuM07i5Y3uJ0EOTi30Ct5vlQp
         fAqYeG/unEgEGL/9I6kOuT+GMHTKGNplUX0cBSK/XegFIKrYTCcgtQsKzGT13cPk1lCB
         twPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721614; x=1796326414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TyMpVGhTjV/u04TckFiyynsoMuEnZrBpJU3DYNeD5YM=;
        b=OtCEAlSEqRHOpzrZP/8UhGHmKwJUllgb15KNzCAclhKnBVHMSejRq2iJriefaqj2WB
         3WtM1ymMd9M91VXipIGeSXJ8N8bOrQvbnnEdiFWu4FfVj+lv690eGD5H+/gRCq3q+XOL
         QnEjpYfRM0gboiVcNJ3/7uQYF8hbDUkVrVjw0SGHuu+N5qKcnkDZEonAXdl0UL2tLD8U
         XqnlaHIUtHZR9RzCtJAoVy/sHqrzK7gUnNsXmDN3EjVQDv/R31gj2NyK08Xv6BQN765U
         IPwbk1d641zjMxmDgxtyxpZ0d2/0ub4T6x0Whq3LiD0EVmTFKuZNsL9RFhRCfFetwPfp
         7h1w==
X-Forwarded-Encrypted: i=1; AL+hErF8B7L2YmMonSn0UR6tTRf9Zg9I9tjzCiTpa2kpzko+sihNdi9jY1Ual6v4yXsqoAzdQBaYEMm00P2ni+j2TW3T@lists.infradead.org
X-Gm-Message-State: APuU4Z8NPAUAIjRUOmIK1q9q2Odwvt7n9EK9unZjypWFpRCcWTNrNRH/
	iGJQEU7BOT501yM/czxaS9M9pe5LdgednNi/JC6dqHZgxWmRmv8oj8O+
X-Gm-Gg: AZFdTZdMyfgM73urNRKYZOgXCy3VNtZpVx8F2BgMHmkK3N5RJPnK1CNiUKZUxg+WCOx
	9jq2edNesf1Y9FXr4C5chkwM4O1EocJGEDLi1wXkiDm3uxpkRPJI/AujMa766T7KHrCNiMqB+iM
	3Ry/ElQk8ZE5fRHYJ9+3ic0Tmxlwf2bAYP9yUZpSMCI4wJE36E1Qgo0TAMm+fpHLb2REKqm4sWo
	saKBeklZ1IMxWIjLElaNRfS05Wq4j6kRkKTRfpb9/+mEDs6zxs43XFX+NyfEJnjcAn2tCFWvnGv
	RRQt4sgzjOK2+F8BoNiG/XGJXbCUZzcgz0aJIwD5IjpHuWYADfwvJhlqusegjh7Q89QdohGnWqO
	OvD3tk+dT95kI8uBhUC/WlNcNsC8Y2lDH5b+1lKA4FYpqLLyKDj+f4sWGRLQPxbv756qoLv4irq
	+QawOjVAFoFieO2aWAUN5Ei79GuvLX9tUblFGqXBppN7K/MEvxpsvXvUF8TDwEeB/6wegAkqqTx
	tJVHXTXMF+efJttCS1UkmoHhshoRtchL4lGeRF81FVwT27Xvrx3NOAcY5s1rCCJfi+/WPmuAemT
	yvCIGp28GBnzQf9ucRiHd+vO+aESDNOhzt3uvhk1WJEkMQ==
X-Received: by 2002:a05:600c:c086:b0:4bb:a5e1:8288 with SMTP id 5b1f17b1804b1-4bba5e1b76amr99845895e9.6.1795721614313;
        Thu, 26 Nov 2026 11:33:34 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm368287675e9.2.2026.11.26.11.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:33:33 -0800 (PST)
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
Subject: [PATCH v13 21/25] arm64: dts: amlogic: gxl: correct crypto node definition
Date: Thu, 26 Nov 2026 20:32:37 +0100
Message-ID: <20261126193241.1471372-22-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_193336_313613_75EC19E7 
X-CRM114-Status: GOOD (  12.44  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Alexey Romanov <romanov.alexey2000@gmail.com>

GXL and newer SoC's uses the DMA engine (not blkmv) for crypto HW.
Crypto HW doesn't actually use the blkmv clk. At RTL level, crypto
engine is hard weired to clk81 (CLKID_CLK81). And remove clock-names
field: according to the new dt-binding, it is no longer required.

Also, GXL crypto IP isn't to seconnd interrput line. So we must
remove it from dt-bindings.

Fixes: c4a0457eb858 ("ARM64: dts: amlogic: adds crypto hardware node")
Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index f257fe3860f7..5d0bffda8f19 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -68,10 +68,8 @@ acodec: audio-controller@c8832000 {
 		crypto: crypto@c883e000 {
 			compatible = "amlogic,gxl-crypto";
 			reg = <0x0 0xc883e000 0x0 0x36>;
-			interrupts = <GIC_SPI 188 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 189 IRQ_TYPE_EDGE_RISING>;
-			clocks = <&clkc CLKID_BLKMV>;
-			clock-names = "blkmv";
+			interrupts = <GIC_SPI 188 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&clkc CLKID_CLK81>;
 			status = "okay";
 		};
 	};
-- 
2.47.3



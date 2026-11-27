Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5AA606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Tj1leOaz;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zqiYfyNR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=L7TYh02oTJOZVmPV/26Kf9AK9AugmvaVvF3eHOWqM4o=; b=Tj1leOazjo4JqS
	X+yG0joSjc7Vo5JWeQuPrnmIcF3npCM8LtXGCz+/sz5P3dRO9NAijAyGKfwf8QAzNBl6KVU3YvqPg
	SA1wRhZgUUVIVibUA5HAVqa7VDH+3bJ/B1H/uH58gLw9KTvIGm9y7+WxPCp4g6XrRIlL9KqHQqRB+
	Ck2oFZJnYcYopwuA+z9YM5W1+xScdSyWA5TFbFpmyYTcwk4OVTCY5RLFX5FInUnWY42Wz9pxRyrNP
	VdmoLYjzAeUoFlFUx8Qsl4eVNUf+raV8z+bYMHED1VAMzHua88K9a2i/6zDI2umJO1aP7VzH0kgQY
	4g1jSA8fU081pQkcPlbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuhG-0000000Fz6S-0dgN;
	Fri, 27 Nov 2026 12:04:58 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWueS-0000000Fwow-1DWD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:02:22 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so77228225e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780922; x=1796385722; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L7TYh02oTJOZVmPV/26Kf9AK9AugmvaVvF3eHOWqM4o=;
        b=zqiYfyNReOeggtu78CipZ4oLB57AGMCEZ1aDVTe9QygPNg/47kaopTtF+Kt9C6h2a7
         tOJr9BxD21vVbjdzVkrnoAb1RZ0k36SUj7Nrw4ncB8aMP5XkZ9ZyObWdJigcN7/uImj8
         plUE07ixwApNTO/1WwF+O7BhNiWBMTYuKPzMhzu10HWpGSKzUkAB7GvtfA3+mtMC4K0L
         TxeDP0xZVafhlEYKMwjFW2J8W7LIP9rpvyxnrUp2SYrMBKEMKL2/d1hyvzLjNMuDPPSf
         SpdjtbYF6HB6Qptx8bViyH0AyQhVh2aH+l6r/WDeeTYX7CPiKKI38ED4HoGYKYMN7Vfq
         fs5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780922; x=1796385722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L7TYh02oTJOZVmPV/26Kf9AK9AugmvaVvF3eHOWqM4o=;
        b=duEJXfUeTf/CuU5I6kHS+pXF75bcCraDTW/msPCjp5urKD3f2LrchlhudQ6AbDoO+c
         mPpkH3e5X10ja/IJHdr2hrDwKKGPzK7YFoSLXGP/v6gyy5S/EJimMmlQdCLZE+MuIElS
         B0o8Rp22Pi8bFPZzaaes/1cgZfyrsimRj0BzDoktQUtgLBD2Kj5B7ehR+UmSgNxY+Hva
         AVUvCnFaSP+Mog75u9/OJci+gljg5ULawp5hGd+ut+EaGLwEqFcQ0LX9hsL4KzMYugOK
         TSNnw6RZBs+qUrI2kajIhelHEEoH8YofOcQRntLsMtJrWaAgLPonGruhsYEaGqT7hDt/
         ylxg==
X-Forwarded-Encrypted: i=1; AL+hErGeQtzArBZQv7lfenvUvc6ZUdtJh2EPwv85oZth365LnAEpu8zGucYxDCXSCnNbmss1+Z3vSDnQ3unfHYn2cRoZ@lists.infradead.org
X-Gm-Message-State: APuU4Z/5v6Y/+ocmZEE+XGqEhx9vQ/e1kWBBNe4rLSa6SQV5jhjOoqiN
	623wTRL95c7EkgAhjAOhR5yH9VY7czLN/78tysQo/Zgn7hHv2ZTMGw/u
X-Gm-Gg: AZFdTZcCiTHkxyapc6A5QpT1gxsI3+qT8AT8CW17xB9WUKRr+5LJbz++FA53Ix5d+su
	2GwyDEJXVooIQO1CxGdHUxC5ztnpUuIe7lsD/eGtrmk/s3lOC/92QwPWl2L9FlpgszSJKxKvQ4g
	WVh2KpJecaK/c4sQwwpoBt+uEZKE8/ZXNc+uJ4Z+ejrtQN/24WoKR1v0qroJQqpWq9ZMXZHuDD8
	yQAxFz0xqS9AcsnuPCd0H2WBtUJansjKRGx9igd1UJxOEMjw1x11UbwoirAh6m2uhLFBZFUOvWJ
	a3DPOH+st4wSJRYSuhsWjicc5ZLi4lV76aw0Ewzzfe6v+4EUxrG+qhOFFbcR5K8r/dAJsc6stQO
	TKH/gxqxHeJLXezdSc+Sb4VGcy+MNG/8eJYgvK59DeMUudodMIcPGqmcpF64k3gHrMkeEuogbho
	F+wcKW1t/h9dHZ1v9aIQp9E1mQHGUOlrsImV8vXtPFEooyvs8AiIhs57l7As2nYVs8jIDJYKVu2
	IMmVGZmv+FEjmxzJU2EzaGr/ZeG39EolEjnvDIboHF4qFbKIER+qGaNwa1DkJ3CuA44EEfvW0Lm
	poNjK4nDF2QW0mHptdN2ngR+U9WGZgHeNv4E8ZIURRXmdRNW
X-Received: by 2002:a05:600c:3b8c:b0:4b7:6c16:7b43 with SMTP id 5b1f17b1804b1-4bb8881d019mr479327835e9.10.1795780921851;
        Fri, 27 Nov 2026 04:02:01 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:02:01 -0800 (PST)
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
Subject: [PATCH v14 23/30] arm64: dts: amlogic: s4: add crypto node
Date: Fri, 27 Nov 2026 13:00:56 +0100
Message-ID: <20261127120103.1532882-24-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_040204_393812_000C93AE 
X-CRM114-Status: GOOD (  11.27  )
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

This patch adds a crypto node declaration for Amlogic S4-series.
With the Amlogic crypto driver we can use HW implementation
of SHA1/224/256 and AES algo.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 2a6fbd530836..de173f40e15e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -71,6 +71,12 @@ xtal: xtal-clk {
 		#clock-cells = <0>;
 	};
 
+	clk81: clk81 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <166000000>;
+	};
+
 	firmware {
 		sm: secure-monitor {
 			compatible = "amlogic,meson-gxbb-sm";
@@ -621,6 +627,13 @@ mux {
 
 			};
 
+			crypto: crypto@440400 {
+				compatible = "amlogic,s4-crypto", "amlogic,a1-crypto";
+				reg = <0x0 0x440400 0x0 0x48>;
+				interrupts = <GIC_SPI 24 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&clk81>;
+			};
+
 			gpio_intc: interrupt-controller@4080 {
 				compatible = "amlogic,meson-s4-gpio-intc",
 					     "amlogic,meson-gpio-intc";
-- 
2.47.3



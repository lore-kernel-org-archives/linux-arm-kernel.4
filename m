Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24A2606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4lI0C58r;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=jE7Vjb0C;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ICJQCl+z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TAUyWjx3s0iBrLHwbOuKPkGMyzRErvYGRD/IpYm7O+8=; b=4lI0C58rwQJnug
	fb9+asElFXc7U0YS485fCo52qUVaETN2T501tP1AxKQsRb/RUUASWZq59LZsqxH7TzDumanwsbJwA
	xIZKmIAfqs5e003UYv9LIiU8/VdAVwrOsIYBqg3CbKxYb7mtxK+8QVJUtLfGKAQqHL+j++y0JtpRy
	vxitG17pIjBfotXmn6X8hz4EJ8gNx6sFVS5ZqZOIcJBY7bqzHYX8R+cIMbl+wXxKxnKoWiIgp8WVk
	Xj7xSEeYJunOtyF1BpZXtOtvSnl4AMN7mrfz720UNV6/Q8fR7bROV6x1P77vNHu0SQTOAXlFuNDYi
	gylEPQS7OeP+/yN8YlNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuxs-0000000G57G-0Ga4;
	Fri, 27 Nov 2026 12:22:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuvF-0000000G3Vf-2TLY
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Nov 2026 12:19:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=TAUyWjx3s0iBrLHwbOuKPkGMyzRErvYGRD/IpYm7O+8=; b=jE7Vjb0C3e6lvezc9kEkso9rrL
	hobnwjHYRtXvuNm1u/iwvLRbSuPlIPynDkC7YdfUPU7iAkvmgSEkIx6Au3gYuCPCoN1gb3oud4oN/
	XTfb4fmz2g63cuKNkaX1XABEFE17u2C5HSz9rkQlASuPsvhzr9v9W5jy01J1wiGF10/wWKL0MXLeD
	4hIdmXDZr9XN3QH/Wd/g1F7Nl6nx5Rour40Fhl3pAHsTgrEZfi+izmhXjQbWdAk2cR3COMVkM7mPt
	HzTjZSrhEriXsHwioEcsUDDS6xJBapc7372wX9k/70hsqYWlWewwreVJMjrV6YIFdOe7GDW98oh7j
	J/eTwCrA==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuvC-00000007h0s-45iE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:19:24 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so82160495e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781961; x=1796386761; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TAUyWjx3s0iBrLHwbOuKPkGMyzRErvYGRD/IpYm7O+8=;
        b=ICJQCl+zkklMR/P4aAd1pB6S8jzVCwrWPM2BOEM8nEdZAbwa2yCXIniRabVcgbJY0n
         fmGBAjmzX8R7QZLbwElBdZLpaItg4w5FbhrET+VHYVq8a3YtUdlXfQdFKOKXeaQ+mG+K
         /9rQoECsx+24zEPrDUS8cUOIjxHIUuNcMTx0+FrMZy9nq5zyCuLirr/qhfK89kcL+Cd7
         HKLW+tjMTbuGOVGtNJPoPQ87bp4/xZO5gODRsjfmxm199/HQlaO1bpUPWHpKOLGbFtIE
         L8jjA9caldR3JRfTe1/+Dah0NgRqzYPPnMPNstZoG6aNSjENxG5sOKG7yn9ugk2beg90
         sYyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781961; x=1796386761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TAUyWjx3s0iBrLHwbOuKPkGMyzRErvYGRD/IpYm7O+8=;
        b=tnDX7YwN4oQHbLx2qnBH5vrsmic+QwiAa19I2aYaMNqOdU1QZZ/5y7RpkpSVXDIKdu
         YAtKeuiYpFJQtd/FKGj/L6GPO8Lso85NgDaPQl7TL7EfmRVybVMcZD6cxRidUm621qTI
         IJtHol1dtySElNtue/wUp2xBvQuntfELbT5VWim/zaEVvoQJ79lRVKyaBYlQi2+/giyS
         YM92+PnEi9FS3PdsxptbsCn1EsLo3N5FH9WdTsuX2Z+zeCIqTBwKL9RqDMgsOPLezBc1
         2HvwVsmWQSAwMzw1gQb87ikPWU8sDzR3OT5aDwWEp0yT9Ki6GaWRay8ZUjipHC4cnmdE
         XogQ==
X-Forwarded-Encrypted: i=1; AL+hErFPKfi7hI0c2BHR1jlfziR0CMl6966zMHgoOBG/KUx2RdqzX6LsiuyxVDJsulXPyyYMiF7x8Wa8ZwHF7hSNk6/5@lists.infradead.org
X-Gm-Message-State: APuU4Z9TScSt8UiVVs8dFYXs+lK87I5fJX1hR9erpP3bAaSzWLIta6iQ
	pSNxE2+hg+CHs6qGCWicsCYOsVXDbAie0dQ4RFqo4Dz/tAs51hgDRgzbilx6sWtDEFo=
X-Gm-Gg: AZFdTZc4Mr76KoEFQwAw5/r9sOOMaJN9wDdR9oO0gzFBn3SO41FFRp4CUIf6uoicr0B
	abJPoDJPkXyImtuSaxb06m7Q2pXnlZCuAdtiM4l8rjnwh7mYFwvEfJC7jvfx5RcLq3tnsByE83k
	d3l7Vma0xiXSJaeWeuft+bMLgYWYdeVXCyPvS9vjsfzDNo59Obocf/BpHUd/StvGeefyakdmKpn
	87uu82VzrZWaBUSeE5wgJDgXZLrmUZx2cDcmQUgIaWfzr6HbJrgr66xrv8cdzHigSHCXR/3vDII
	TlJI0LhLY2mwfHID5X3dtnlOIPxiMi3t9D1c3wssnAWUTgi69OUGCabMVqS1wsJRe1367e7msvZ
	JvpPmb5ffG7CDI220ED6RCqPMA52A4YpqjsIes/ZwfFYUmyqEkbvYCD3YQPqlrwgCC2E0upjQLN
	nDf84xvB7WwUyPtUqhPxTcyvj7lH7+1gGH9hsc3tgtX4Tv35FpRt4PJXpVVjueVZYQkCaR/ay2T
	dSqOH47aO9pYlwoCCp5kp9OiB2Fm55KI9tJajinzcI55nFmiZti4uyO48b1xss3Il8fwEeuCsoK
	o7ygc2UGV4ny8KSV8I6njEcKA17naghNa5dljLNG2CFLhj9KKg==
X-Received: by 2002:a05:600c:4e0d:b0:4bb:69b2:d3b3 with SMTP id 5b1f17b1804b1-4bb8881eea5mr489175485e9.27.1795781961245;
        Fri, 27 Nov 2026 04:19:21 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90655f5asm451150685e9.1.2026.11.27.04.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:19:20 -0800 (PST)
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
Subject: [PATCH v4 27/28] ARM: dts: broadcom: Set the DMA flags of the HDMI audio channel on BCM283x
Date: Fri, 27 Nov 2026 13:22:17 +0100
Message-ID: <20261127122236.4976-28-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261127122236.4976-1-andrea.porta@suse.com>
References: <20261127122236.4976-1-andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_121922_860271_8CA0DCBB 
X-CRM114-Status: GOOD (  15.67  )
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
 arch/arm/boot/dts/broadcom/bcm2835-common.dtsi | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi b/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
index 39eea8ce1058..77c7c13014d2 100644
--- a/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
@@ -4,6 +4,8 @@
  * bcm2835, bcm2836 and bcm2837 implementations.
  */
 
+#include <dt-bindings/dma/brcm,bcm2835-dma.h>
+
 / {
 	interrupt-parent = <&intc>;
 
@@ -130,7 +132,8 @@ hdmi: hdmi@7e902000 {
 			clocks = <&clocks BCM2835_PLLH_PIX>,
 				 <&clocks BCM2835_CLOCK_HSM>;
 			clock-names = "pixel", "hdmi";
-			dmas = <&dma 17>;
+			dmas = <&dma (17 | BCM2835_DMA_FLAG_NO_WAIT_RESP |
+				      BCM2835_DMA_FLAG_WIDE_SOURCE)>;
 			dma-names = "audio-rx";
 			status = "disabled";
 		};
-- 
2.51.0



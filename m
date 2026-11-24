Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB12C606A331
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 21:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NgP00UaB;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QC6nI79y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rzUxS4DZKD6Oufxn59fxSi6iyKfyUkYi9vxneZjQx4E=; b=NgP00UaB737rdp
	vPKB+tPvE9rxb/ObSy/y6nokLR6+l/neaWzzl4FvWxHCardMPu2o/C1vCDcey+g9+pg4fMJhOZ6Gq
	zGcJoQnqvJ3i3aS64n2GyNTleJvbUwAsXy5OxyTI23B77/5vhBa4/Qwfd7lgfsVqDqYx42Xs0IDXx
	2Bizemk/L9PhjVenSxgbPA8SQZbwX3DsUGGHp7fIFmgbPu0jW6TpOyhSaP9nsZGth0iRj+YEI4xfL
	S/s2eBKcgRsX/z2B1xWTSH1k3XOw146kdvQB+p16yqF5B9f+9BrBpwYnol5xr24uRqhv/Qh1ZCq2x
	qo0seXCXbK7uEA8q6A2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVyQf-00000007vOI-058j;
	Tue, 24 Nov 2026 21:51:57 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVyQY-00000007vLy-0QYu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 21:51:51 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so43415465e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 13:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795557108; x=1796161908; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rzUxS4DZKD6Oufxn59fxSi6iyKfyUkYi9vxneZjQx4E=;
        b=QC6nI79yg3Aji9d1DK5Qvf4nZ7dqvCbI9p9+/lU5NLb9BcLSI+hoJKDrYUyTNX+8Oa
         H/QnBWnDXeMQu5uM1uk4KsqFGRMSPwqUfCS5g6qKLpzW5GpUGz+E792tQvIyWZ/Zt+Qb
         1zRj78o3ubxVfo7/RgNih1sSvBenTaSvXNjpUBjXIzPC3HYmOHdIXiXacpMtN1LoAHiR
         4eMpRFyTT8jMkWefAEFUSOwbdRJtY/VIc+TR6jwdoHrzq6jJf1I5k2diVxpE1UZFS7hd
         9lwodkwabxpTabk1T+UyYDq2EaKqUTtUD/ZCwX6UdS5dA02+dQcYooMad9rLe/BMBuPv
         196A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557108; x=1796161908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rzUxS4DZKD6Oufxn59fxSi6iyKfyUkYi9vxneZjQx4E=;
        b=fFMExW9rHt1RkaWb9NBO5WoNynzQ60Aou44khV+H0sH48xj8onJB/qbjYOnVAt2jzI
         kJr4aUV9FJXHEOpiMLWe5lR9uTmpHCoQocd80QlKdA/SdOqu6P32JyXIyUGox+BKp5IH
         WsVkmHaqQ+p2GsBi8xVX1ub4ZpuLeuD49wZQFUQlSBIK/yFpjqIZyPSWtxhrxe7JcFOk
         J5xhjlAXliSBM1HJXhS9mEzdfV11iv7m3Zb5gePD65ZOLjrU2xLEyFU4oLnvQYWqp8pb
         Hxj033Ale+i4keyIjP+7RvIVIyaJaUUa7BlPRsN2ib4rBn1rFb/1meQCUVnvcl5ICoNs
         cplQ==
X-Forwarded-Encrypted: i=1; AL+hErEHix8ZZQJ+4re5NEZ0xnFQXilf9ML7SDmSLtGR6g30kwTYl+V8MUBV74Hs9Owv8B2V733aOsLcIVyD+APTIuIm@lists.infradead.org
X-Gm-Message-State: APuU4Z/C8o12sCpyvsADzsHTGeVakfKO9MuB9qOwT0sdd939xqSyTSP5
	nfXDDdtMcjo7jNCaYmO5FcuybufWFnnYlAS8WulIj5C1RRVRFy3yKJyN
X-Gm-Gg: AZFdTZdpA7cPZ4Z/MlP1O/e2MeJ/BFHGyD2Hgr0KMrDTGbOJcYjiABFqMnfK4gkrqHk
	dSUs1d8f9lylp9zZSgH85S/v0QvbuAqHWyGdETUCfgfMfzAdDDnQhrQqVVwWR0irq7WLzyCubsU
	J81Jh/zuDT/Xv/bcy7bQxfw5MBGVnm53mbODONJRArTQDT9RwH9PdQLlUClWKJK7kzIiUOXz7Be
	m5rVQeyfWVZd+kGKXvgMaxAEQFu7/MSlt1oidU+sNxvibSitKEruEjz0g3eLhQk6fVAB9KDKOOT
	SeyCmfyun2RNKO71EntPTj9OwKyrjCWNLBPQQc4doozIaf91CTyrYUOdezrghcH8ec//z6fvuc/
	wQ6gP6cTj+QBi8JsriRrs5+WP/wvAfgg+MsRnkTHV8DYvd5t5aTa44hjDKszSZFvm5+eQNiLQ4T
	UsI2o+oKWoWe535VVjmZ7zfNS4SjJ/24ieEtmx4v64TUZVzbepbddoxvjpUh0l+TiClKKMlrAE1
	BrQRMsMxrHH4ADEQRt2oqw6haVqO15QAK5JtpXWBsWnShNzqzvpJlJoE/P1t453+sFWsACZsQlh
	r5O+UckUakcleaRiutw8
X-Received: by 2002:a05:600c:1384:b0:4a2:1612:6367 with SMTP id 5b1f17b1804b1-4bb88816c44mr333032905e9.15.1795557108451;
        Tue, 24 Nov 2026 13:51:48 -0800 (PST)
Received: from debian ([185.57.100.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab5ffcad11sm29194685f8f.0.2026.11.24.13.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:51:47 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH RESEND v3 3/3] arm64: dts: allwinner: a523: drop the PA GPIO interrupt
Date: Tue, 24 Nov 2026 21:50:48 +0000
Message-ID: <20261124215048.42074-4-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124215048.42074-1-pmazzini@gmail.com>
References: <20261124215048.42074-1-pmazzini@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_135150_161510_8D66018E 
X-CRM114-Status: GOOD (  10.77  )
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

The PA IRQ bank is not implemented, and the driver now numbers the IRQ
banks from PB. Drop its interrupt.

This reverts commit 6b81aa0c8a4f ("arm64: dts: allwinner: a523: Add
missing GPIO interrupt").

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 85ef492ffeae..fc4d714a96ea 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -129,8 +129,7 @@ gpu: gpu@1800000 {
 		pio: pinctrl@2000000 {
 			compatible = "allwinner,sun55i-a523-pinctrl";
 			reg = <0x2000000 0x800>;
-			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.52.1



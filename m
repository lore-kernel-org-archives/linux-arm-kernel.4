Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F65606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TE4wiLdu;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=XfGrzt+Y;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FZql0Ea5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Jf5GtpRuXRchR2ff5N5v4AswDiRdBOtYpnk/23HLdl0=; b=TE4wiLdueUb4IN
	5z2gBVLgm5fGb1CpI9nQrKUqqjwHPfGZuPNDWD8Y3j/+e0UkoRkeLjRnvBvOptkvV8+89efo8iM2z
	B597LC6l7aOvowrXOYzBDPcpLuyaHRfaJvDjAyX8jClxrPi/DMvjWFSB1x+0qpnAN8kr9o7/B/mCu
	UihyPp0T0EX/Z3P0LSsfwKIjgd5acIVwwJlnpoKs2JrZlGwT1RJYvojopw9ignwRAf5Ev5MZBshiV
	C/9EUpAL0RhzefmPB7XzSI3Ts+Btf8EHwVvWlJbsyk+qgy1uuWQSY0HoFVyA0kcSdxObhlhh6CLmx
	n3aRYDE353N05S/5EJ3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWufb-0000000FyC3-0C7n;
	Fri, 27 Nov 2026 12:03:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWueb-0000000Fwzt-0Sva
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Nov 2026 12:02:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Jf5GtpRuXRchR2ff5N5v4AswDiRdBOtYpnk/23HLdl0=; b=XfGrzt+YkyruhcGM5dsF/jtEHG
	mlwXQLuQYdLYN7QgGVAfZJdmyCNIVNmPwl2KKuLlYO9dKq4VNvBASi6h10CrR/JwGUXIfszt2WFvk
	0vyAwbQ7YwnP9mh8uL3GsNUgtNb9H5gYpVb49sHvZtykhsN8NoIg0kOrXG/LtL6eiCI4Z/UcHIu+1
	aHUd5v4wmD28EBgDpg3xtG7YfHFHyT7+5vOz3sk8OiVyDsxilTRTLP3u9VCyxRmUGHTRp7RrbHxfW
	WxDZERTORqc117V1kSmlB9hFINx9Wv9H/Mluj2l0gXQwNq0xB8hTeyZtLWBCAmG/er8hlRidju/Ky
	LvINEHaA==;
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWueT-00000007fif-3pFV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:02:07 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so7320592f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780924; x=1796385724; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jf5GtpRuXRchR2ff5N5v4AswDiRdBOtYpnk/23HLdl0=;
        b=FZql0Ea5Pe7YvOVs+5pQbgVeHbYT9hzkYUaT0KOXXfPrxNXiJROyiPrT5km3f6CcOd
         7grooyGmkTjESeuXyZZHa4n39k+JOuYFvgDgUZWVsGNyZ/OITYRmhc53/YUTJYagkZ5s
         jqRg+BUIdI153yBM/JterF2aH+AFnv1WOWqAuatDQMtwHcCetJXVqXUBQWnLvbLY2GAv
         AFKEdtxPXvhA3gzKp52FdT2h1Xegyly6v7bK37mQnT3YM8XgfMUKag2spmBtEhGlNMi+
         JBMueKPPOnWFkY7uYHgLgTWcS6YdKD+3XtbbazpM/c6VmlPPHFgQhFSeDoem2Ek4DKJp
         LVHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780924; x=1796385724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jf5GtpRuXRchR2ff5N5v4AswDiRdBOtYpnk/23HLdl0=;
        b=k/hfEFS2M4obNf+JqD4v9wqzAovAgVNt2Rl2OAiR3yVVgPJfMEsq9pJ05KlKD2Vx+D
         OmGhlGHAuYXGPSGASYsk4TonX0shPI7tv495vxAk/ilzkLjSu23U8Pd8POaQss0dzOGQ
         4izalLNM21VBCVvfhEHV31GR1qOQ0g00SBEnfLDD1mAzuWumPMkjhYBSIlCpxiA8UD+N
         agP/Of8dd+BTWm5B6w18UDZ0ZnQzb7bBQuhX8OecVErqSr3dadvP38qPRr8XPhybJOAY
         Y49Byz23eR8ck679GJNfPLm67iB4JkupUkBmKY8AQ4kk8Ijz4cIHTVcVy04Cy/CorhyE
         WKLA==
X-Forwarded-Encrypted: i=1; AL+hErF4b1eXgOHKS5Qe3Y5wOz5b9iO6W2e+s2eyiyZxHqvp9GT+kwA+OdkSmE7REV6DAMQuLI1DyejoI84d9mgRAXgO@lists.infradead.org
X-Gm-Message-State: APuU4Z8slVx3zC/HDoHngzZO4XNdkhyl6VPPVeeMqrtI6vtIEPEnxJX0
	2P3KjhDFFwdOEKEshHOx/mK9ICQQVNifFM9DMCsFGRbH9sC2iIiKD2tB
X-Gm-Gg: AZFdTZfccO0GY3jd/nvcKFyONMrJGu5z21mcu3RiNmcQ9tQBcG2uLzrtLo5B6OIFnRW
	y+Z/muuW8TlZ/m5Yfx7A473YelZ6H4cgo6++/mfRhg9p3ReOgNtaLW3ApY2rUin0rEAv5ufnkh0
	xrbpg97bBNceHZOTY2wFgYbtswndddJ/r/G3Vaih3VV+gAfr8W7R/mBxJYZnSwumciP0F94UKy5
	RLZVnb678eAWOORKORlE5AVI/VRYBZw47KF2DmLjrCcwFpx90r9D2wksxR9taIOBp1y/9vmam4v
	ZmbDNL6H41sMHRZlNItkJSw/b4HV8epaWCRzg6LYDLMvd8TrW/oVHVOh+Dv58aO+ztWH4u6pboX
	n6cBVg7c0iKj+pncXUTir+Wq7zGDubA4UFuOirLc6rNdHaMg7z+KlII+TBPvyC0418QQJVeMlmO
	enGd2g0A5YwCk5bekRKe7Q8zRBxq2pmKwCTGDdAhkdel+djnEzXKyDWhLjXtQQ1tKtWNlUZXOtk
	pclqBDCl5rFXhXtdylD04Pvx9bvaK4uFQhDLds2ZWxwng6Lbu6NeBcZkfQUwxH0b8AWLKdHlnQF
	Bk9h1LdRW3MviYs1Yy4WNhRjIGU9XOXd5qgr3F0b8Yc7YTQ=
X-Received: by 2002:a05:600c:34d0:b0:4bb:6a5a:7839 with SMTP id 5b1f17b1804b1-4bb889428eamr488791765e9.34.1795780923213;
        Fri, 27 Nov 2026 04:02:03 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:02:02 -0800 (PST)
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
Subject: [PATCH v14 24/30] arm64: dts: amlogic: g12: add crypto node
Date: Fri, 27 Nov 2026 13:00:57 +0100
Message-ID: <20261127120103.1532882-25-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_120205_777533_65C6E40F 
X-CRM114-Status: GOOD (  11.22  )
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

This patch adds a crypto node declaration for Amlogic G12-series.
With the Amlogic crypto driver we can use HW implementation
of SHA1/224/256 and AES algo.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 3135566df880..df1383f86366 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -1742,6 +1742,13 @@ internal_ephy: ethernet-phy@8 {
 					};
 				};
 			};
+
+			crypto: crypto@3e000 {
+				compatible = "amlogic,g12a-crypto";
+				reg = <0x0 0x3e000 0x0 0x48>;
+				interrupts = <GIC_SPI 180 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&clkc CLKID_CLK81>;
+			};
 		};
 
 		aobus: bus@ff800000 {
-- 
2.47.3



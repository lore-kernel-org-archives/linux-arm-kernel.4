Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2247606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 08:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qwi9qduT;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PuIQOTPb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0+AyTakRG8bmsy9NAJdRhJjihQCthEshrK8gdAhvNUM=; b=qwi9qduTgok8zV
	vLrCQ8GpRgo7z9JlrpevcWr7qyY0Um7ojrBIhsAW6npyQ5kBzi9nqFps9tdUvOOrb5SZ8KcRc868O
	TKsWuanYpRHatCXSoXvRvr+xQ/M05txcpRApaHjlur60ObZEEhOyqERcSUiXYnOIhXSJdgcBt0qPN
	O2tOmsdRN7FD2/UyPRIdr2Q/PFJnXTvdj0zl+8nlAsyuvxVLpKDeATjp2Cf36z0iwmQ9fI2bLyZGR
	PLNxYHq1jgiaAxuAOjcwBSE39mbZDa+W6uURFuVSdr0PYI4zFHTOb+fVK3Q8LKK7Si/PJO3sA1rks
	zCxBZDGGKGhKRHkve5XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxwI-0000000BGI2-2DiT;
	Thu, 19 Nov 2026 08:56:18 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxvY-0000000BFfH-2asN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 08:55:34 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-55ade1de0b4so21074711cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 00:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795078531; x=1795683331; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0+AyTakRG8bmsy9NAJdRhJjihQCthEshrK8gdAhvNUM=;
        b=PuIQOTPb0Dk65QngYgi2QEPtTxqxG+5+eXR42sq2H8ItuEZS4icY01CNkQrffPkso5
         sOPnuoManI1sRVXcOOp+2H/npPZb4YMebSEnOo3CBhzawtBj8u1iO4BlYfd172XjpzFe
         tCJN+oKvMweSBIx7o/KjN8OK6xaN0I+0rNuZyMAffHX/JnHa8TE0c4FoUZV0udqTmNqM
         bdU9n/SKNle5BBIbOPqTEz0C8bpizKjjek1BXCgly4YgGKSLwbghLzusiXQljEHh/T0R
         Ehkmfqt2VbnfS8vDkh2rpGrZ+DIbFliqd4sBiY6zmoCyzQcPDKvXPZX334f3aA0uEdQH
         Jzxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078531; x=1795683331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0+AyTakRG8bmsy9NAJdRhJjihQCthEshrK8gdAhvNUM=;
        b=aRdJXY1wx4/75fjfOPNqxnkzAky0EM9HKcCXP5KGHO1BlgRe65vEz/NcVB4JdGCvTm
         ACDRGCdTwQjJxDWMkrQ+D/+T4sIuhY0fEQoN2rrIlwxl3N/XQuiKWaXAEkOvOT9H7LZ2
         jbdpwAH5g+voXeBTn4YqNkcOXrXzkH4Rjsoed6QJsoJm+dWpMpyg14LCGlQ1ivNI02AI
         HjUdY6qRxqRBzb4KXezmEHSvwcT2EVo5jFIuvRTitt9ZafRv99E160Dhc14788pvdl1E
         7zNdpcZz1S8IcNt+1h8jokl8lSgm6uB1uHdr2BxjpxQ8vU0TMonO1DYzWN+o6U9R3+JZ
         CaDw==
X-Forwarded-Encrypted: i=1; AL+hErHPxKZegg/SOjr2r9pCkM31wvkMLsbVzDunUIK3IcKWOVOYUPeyo21hKYwjbtMQ4KjOhGt6vl6cSENkgQ10aSB5@lists.infradead.org
X-Gm-Message-State: APuU4Z+7CITS7lZ30rTUMJqoCLucAXmS0OtIxVlqpGFGYoEaxOCHw4Wp
	wF74RY5Zhjj/gmnRdEKJzSrHyeWkuNsSsnUmYCH150OLfzA5Q2E9fbTN
X-Gm-Gg: AYBFou15nx2hNxUipBJq/Av32O8i/GpzZcxI75gQLtx+dKn+sGPt20zw3bDx5/xT1EH
	ryDuFh0Bx2CwyTiZVSE3vSRkwRPtmFYb+7UGXa8CII4v1Y9BltJwB8UHJ31jvH9z7uRjHUgTway
	1ERAW51Enx8QtBLQPxxaKL6iZVLCkT8x0P3JiXU96ljERok5tygU1zDTI8t4YlZHyCnde+ufo78
	P4OnibQPYdya1pjOnSTJDozvl+6ovR7LBih3DYL3moYsU4sH4XVZr8k5qeMpGzGPCxuz75z0j+A
	UJnUhhBDFhnJBdkQbYeB9b65oPGuxe2RGbd3atAfkzyJzP+1zHk3GrxtZYq52Y3HQl4Cnb+ekD4
	NhgUSa8mVwj1511ivRONYVPBWqXZaQX09Hnm1A0J1t2amx2IZhoT8QtboHjcsXnWJcFvOzXWyAU
	C/bg0Skex8A3NrGo6wgiEEfP4J9ZvndeDrQ0Bl53UuORlWuIu5d5E4PIPxwzgOPjbAlWXrLfSeu
	7hG2FO+k7tJjW0oHuyWzAKAZqXocxeobqHoPvVzB7WXK+ap/Q+y/C88zjLzUSfaovLB+sXoZjEy
	gSljsD245d+yCkIcGwt/fOyGiE5r4s2S1en6Jd41X03V27itqy2XJnXNY7V4R4dQLUNgS8VlYpj
	BZ5i7dg88PWavNiuphl0/WhFDxppRxN5ATfDHFRprmcqQedATsk1UxJD41L9i/GUQk1pHl4sYr2
	3gfQ==
X-Received: by 2002:a05:622a:60c:b0:535:a5fc:3b58 with SMTP id d75a77b69052e-55d5a6df535mr86532551cf.68.1795078531303;
        Thu, 19 Nov 2026 00:55:31 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66bcbeabsm19578151cf.18.2026.11.19.00.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:55:30 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 10/22] ARM: dts: BCM5301X: R6300 v2: specify switch
Date: Thu, 19 Nov 2026 00:54:40 -0800
Message-ID: <20261119085452.75708-11-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119085452.75708-1-rosenp@gmail.com>
References: <20261119085452.75708-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_005532_713570_9A2D46BF 
X-CRM114-Status: UNSURE (   9.54  )
X-CRM114-Notice: Please train this message.
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

Add labels to clarify which port is what.

Also set the WAN MAC address from nvram, which is offset by 1.

The port mapping is taken from OpenWrt.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../dts/broadcom/bcm4708-netgear-r6300-v2.dts | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts b/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts
index 1b99fe442dda..2d7bbc4ded60 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts
@@ -104,3 +104,40 @@ &gmac2 {
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
+
+&srab {
+	status = "okay";
+
+	ports {
+		port@0 {
+			label = "lan1";
+		};
+
+		port@1 {
+			label = "lan2";
+		};
+
+		port@2 {
+			label = "lan3";
+		};
+
+		port@3 {
+			label = "lan4";
+		};
+
+		port@4 {
+			label = "wan";
+
+			nvmem-cells = <&et0macaddr 1>;
+			nvmem-cell-names = "mac-address";
+		};
+
+		port@5 {
+			status = "disabled";
+		};
+
+		port@7 {
+			status = "disabled";
+		};
+	};
+};
-- 
2.56.1



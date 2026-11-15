Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB34606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 17:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bZgnHQbM;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RECBTGaT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=d/WXFyP+++CG4z1tVSrqfN8fTdb2bD0x6lw2FR6noEM=; b=bZgnHQbMpFZBMkT40ISC77iVzV
	xUumElsTamE7XPqQhp6TNZ+I16xPZGIP18HFt+jpRWGO+3KysU1ZFpDpIhAwlghg2exw3/snHgB2Z
	8IFmZZF1tM4ami2F77LacTqyTSMxdhQtwbIEKILPiMxDc0CpAeOnbACPlvftcfQYf6YHodQAeWC0m
	GjXdZFWgCsXSIafZwUgjycZgmLuXB/+5bFcpBJkyC+TL5CBo9KI/AdBnRm2UjTfapP1lTV8iRDRh6
	jcjWyrGlA0shluK42XZpzxCh3lJB2wN/JvQ7wDnkefEm7D2xC7bHoOQbQ6zPMA1wwUMbyZaIoupL/
	RSVGjRlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSddf-00000000Eif-3QPn;
	Sun, 15 Nov 2026 17:03:35 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSddd-00000000EiJ-2gCY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 17:03:34 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so29654475e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 09:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794762212; x=1795367012; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d/WXFyP+++CG4z1tVSrqfN8fTdb2bD0x6lw2FR6noEM=;
        b=RECBTGaTQTC6/rkG15+46Dfb967A8k4SzVMf2tBuYabBrIHtavKqOpF/SHFcr58GPG
         YUTnv1acil4fkgFpQFm1dRVQTsvCIe/YMDALbnSQUj/8+Et6XovJ+4ZOhkja0CTLV+XZ
         /9eRxVnV8iioAG03MNHhgmISiJ5z3jAjx9jkWv7m83LBVrdR87rypKwMv5nWONa6BIXZ
         g7bDjDtgqTyjE49aPu/MQOekmFuAVIjuZRxT1lY5MBBkXjF2bph/68/BaCYcjefgIVKU
         v9TNWMavfxGrgaDaTXRYA7+rdcG2QdcOb913HkGms/SfnuZecFmc8Sq0bWzexQad0Gpn
         nn+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794762212; x=1795367012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d/WXFyP+++CG4z1tVSrqfN8fTdb2bD0x6lw2FR6noEM=;
        b=qHOUkSpG/iAcB1LlqeOXsXipGI4KowBu1lzadAlg8z3iZUUGHGS2a3LKfgZGUUVyXa
         KrmnaBwZscHCPnSC4/z0JCNtuEdOuRPCMXRcSdDPqjPqRFUo4MJb/L2x5Wbki69Qimif
         ZYjl0+ZXylZia46j8ffAqS3vvbDWx3VdGFwNlOMNWF4TytZsK9MV20WXU6XwwN6be6UY
         nckEl7mTx6YlomzR8ZsBcTlQvYUPvYmBtO6bpxB9BvJsXCgwiiN+73obAXWbHVck4rlL
         pjytLrgWJkUmKuGtcNxs3XehnkX/1OSilBONxyGDOxGg+4vsQ1A0zDQty5pVLSpePibR
         vdww==
X-Forwarded-Encrypted: i=1; AL+hErG5N4m6R2t0Q+MEec4wK+1zc//Y7ak1PzSoZtE4Siz/7xUnbwZLVPhDezdl7zEQKdMnOE6Hx/1gwWpulzAddzC/@lists.infradead.org
X-Gm-Message-State: APuU4Z9qN9iVPYIQJQ4i+JRXnnSPfsF9ET04hwhuezRo2l5uAn5E9Fs7
	DoSvszO+TMgAtdrNyHoVAatdhXlDRPEFbzjidmWuOZ9mAhyIRN/YOubP
X-Gm-Gg: AYBFou16El4JNFQlUgZAeb0dLOwXRANMJb1Yu4EduO2aV5H0x6M0c/BniaEvZMoShOI
	bxaRltkvTt8nexLthQHcnVDlrQChCUR7BVgtOpfH77HZ+FCbSp2tByWDYga+IsRpUTz+gbD9/Zq
	GydwximtyQh+b6maioGkLDdvdo3h7jfO1WKquNA1VL0irsytCxcy7V1chcPas9bJOa5DSLmPCPb
	HkXQGVz5/86negy1aNhZxJEt0qcbf1tXpi22s6W6Q9CE39erlcl89y98Js6jAMhwnT++5fL1XP5
	eJmXvH90afLEiiDQt+Tbu7K9U9ccrUE0VZ3XTGzCaY5ptwjYPtMb6pNFkXPwDoWqk4/wKros1bG
	wVnkGv2x83M/oyrKNXfE+Mfj8wA6sFHaMIpne5s2anVVNI3PBvZL2yS8wsit8JiuwDIcxKT/RvE
	CsAYCTtyajhw2hr3j5ZyqFichGyLqC1s66VMoEIcE7tI8kA6WiK4CkhRbvsPz8URDd9ioAUb8KT
	WCDj+ez3X4DKI0nRFNM6ydPBjifAQnzbMGPTUDxxxZv7v+dxZebdJdNEgr3IPTAP8Ga/WqF+BxR
	J4xHUpSEH/xSbtofTTsZ6x/tifvNu0upaiW3sIdLv2+MLsLa8LDK+aeoPeqKrIi3t+SLCpEloVI
	FDlFka8mvASbIRHq5gZiFx+HSits3F4sCvZuu333zOqhaKjv1OETC3T2k5XIFxNgBJfnWuAvxuW
	s2XTGqtU64nUWNstvZGwrPvBvutfOSgWIWU8HSns5s2//+NITUOaeqobP6m+BAPF/5QqmaqTHWp
	3Bl9BGTcDLGM+xdFgpqIxTLeaNeNJwX/20=
X-Received: by 2002:a05:6000:2084:b0:498:be72:6371 with SMTP id ffacd0b85a97d-49c713aa624mr18863165f8f.21.1794762211674;
        Sun, 15 Nov 2026 09:03:31 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c77393700sm16719512f8f.18.2026.11.15.09.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 09:03:30 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] arm64: dts: allwinner: h6: orangepi: Raise CPU regulator max voltage
Date: Sun, 15 Nov 2026 18:03:28 +0100
Message-ID: <20261115170328.34338-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_090333_741839_838F970E 
X-CRM114-Status: GOOD (  14.13  )
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

The vdd-cpu regulator on the Orange Pi One Plus and Lite2 is limited to
1.08 V, so the OPP core drops all CPU OPPs that need more. Depending on
the speed bin, that caps the CPU at 1488 or 1704 MHz instead of
1800 MHz.

The limit dates back to the initial board support and isn't a hardware
constraint. Raise it to 1.16 V, the highest voltage in the H6 CPU OPP
table, as was done on the Orange Pi 3 and Pine H64 when they gained
CPU DVFS. The actual voltage still comes from the OPP for the chip's
speed bin.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
index a2a2e4cb0256..57b137755227 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
@@ -207,7 +207,7 @@ reg_cldo3: cldo3 {
 			reg_dcdca: dcdca {
 				regulator-always-on;
 				regulator-min-microvolt = <810000>;
-				regulator-max-microvolt = <1080000>;
+				regulator-max-microvolt = <1160000>;
 				regulator-ramp-delay = <2500>;
 				regulator-name = "vdd-cpu";
 			};

base-commit: c3b0d2bd3ba62c39c131e80d940cabbb8441bbf2
-- 
2.43.0



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CFD606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 02:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LeNXFe70;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dPHuWZip
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9HTtW+Vn/gGQSbX8Dg4iqwQSooM4TxCKWvPg+ZuATgM=; b=LeNXFe70tt2wCO
	LuL19sRIxm1XFtPFk7FUzZpS+GJQhXQ02rHOa2M2AKXaWvINnSN3KBvMPlaQNlIAE28PMuQoXSj2L
	P+lJLochXypbl4EFXqxLvGQudQ/HtyAQqBCUBiXINOC+xyW/ks86IC18FaI/4vRPid9tsyHnvTO7e
	EwS6Dy0zASiYZJj7g9Rne49b2mLRRluGm5WwD0ZZB8eOTRwSdPlX5hQUjuPNMiz/OGn6msCEV+ele
	4zz546D7uvR74Hy14Xn4hKkUldmHhYP85zRcnde1xLPPxfUrdMJVxikhYNpp96tmza+YCIoaG5cAp
	rch/U3wWG/eGdVpecVZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPOH-0000000BvF1-3qSs;
	Thu, 26 Nov 2026 02:39:18 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPO9-0000000BvBO-1t07
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 02:39:11 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-8c6c06b3321so5195258b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 18:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795660748; x=1796265548; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9HTtW+Vn/gGQSbX8Dg4iqwQSooM4TxCKWvPg+ZuATgM=;
        b=dPHuWZipDRIooFxSoXELM4Vk4Z/XghNHNgCCmUH4pDL5Q0izDc96c0fEN+kaiepn2R
         q8YakkaTFY6tUR8wkDnB0yTA2RYpcykqYaresTM7vwYpiaJzlmnbB/EwJxz26AvKyb9I
         BlxSwwLUJhd8Vo8pyjY5kcrd3iH2dqHJ7I49jTvHMGbHV4nrt50QpRdWLv63zkWliNry
         /KDRDQLH+amqIM+ekEjURory8OLtiqmrBP2Jf+a9gue6IAIvN+vqcoOfwPoec6DoP+ag
         HqbAXL78eFPnj0S/lkOskQRSO0yR116vxGArxzAHt3rsmy0rOJw5ap4gFV8wcdVNaUtW
         jmIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795660748; x=1796265548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9HTtW+Vn/gGQSbX8Dg4iqwQSooM4TxCKWvPg+ZuATgM=;
        b=iaLndeiZpnsLYlWBIghJN6kJKhQL+qUcUk7W8+jkWIxE3Cai7RdPttWW9NHOQaPRs/
         VLvHCVpxFzpAk3KXAbVNMM8SzAQH3s7oq4Ag5aKU6+tC6j+WF5rPrFIGx2Mw7RdBanPM
         yph7wyM0GMZyS2gdyHd6u9GVFNimZW23NVocwH/CC8stD5EkRsz/c6qwcnA84plWsjUC
         7k+CeNTIVXiqscRD1E76zgzjM3c87RL1IBvLGBjR6CFIqqMI9h2yhySe1m4eK2qq6fAs
         SfALDf4w0IlWs3qwt9va7QveshMa7bYlU6RIfLeLOJbaUsM3SUkilK8jMizOWhoXg0dA
         HgnA==
X-Forwarded-Encrypted: i=1; AL+hErFv4tqfp4AZQGHcQza/TUhG5LR6gsfZnoOY1uUJC+LagCnvtHd+wVVCBCFvolbA1CUhGDP/6XB2DkYr+mSRzO7n@lists.infradead.org
X-Gm-Message-State: APuU4Z92qKVoxj1btEs7f/EXaystzLwtvjV+0C6mzKVa9UW8cah7Gwkv
	Nyq8MIkCdFBlr7pGVzu/E6AnKUbDHO2ctpmdmeJ4mkKU+QL6YXHP44iO
X-Gm-Gg: AZFdTZd5UfXSQAXIYnn0OvLiEuQZ1YCVMqNgESNDGmv13b7sBats7y91t8786U1d1O9
	g8up5GsnKm2zPyhmQLusI5DeMHWtOFb45dIYmcMt71NeUabV7aveAUhR0Sx9X8ZdSszDtMu+1hp
	e/xEa5Giy8xegdmVczxWsN5I/Ii7doPiAtxZ63ItHxHPAsi/FTibGYnBv0u4DwVrAPWDLIjifYG
	3L7agHr8nnBsRvdkpyuzjxQjw10oMfZzsqAztVS1XAr3vPecFDIMSKyBZAZrR0z+6eY+isk3wr/
	BhSq7m6bVWWJrMmymvToMGI5GpV3Lh9JSHVf1TLEDr4X/yuqjxkMI1iOKMrEPEJ3czNa0DKRRab
	uaz0Fdi04dypjPiU5j5tWv3C9Yh9Gk2ELZ/E1bey0sVvcDWISzYY5G+r2PdOiWkChMZ7LURmxKU
	Dz4XvPVYPGAkPzLTdyHHwjXIcHVzf2VvB9N0tzi++m/jvsy+MsTshLxYwCTMxT/goMW89uFbeBt
	bBDGdNHv12AXZMy/qlVpzfFXxFIqNj/UjuwiHwNk05eGKtDzlqq3hsxGHQhFRYMNhLkOt3uUenA
	pIFP3laOCE9xkBOPJoDls2vlc3D5sWmQqYACSpLvgUFdbhbQA5/WBrqnQpKH6r2UvfSN88Hyy+o
	wMtY8KkOFrWMnxzPFGuvXgm0HVYOk2nudZL/2/v/xPogFOeVFeKcHF8/Cul2WwujMt8vBVLZn8n
	OipQ==
X-Received: by 2002:a05:6a20:e347:b0:3e2:5d7f:f630 with SMTP id adf61e73a8af0-4014d75b547mr21301396637.54.1795660748573;
        Wed, 25 Nov 2026 18:39:08 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d026d6fsm9909018a12.19.2026.11.25.18.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 18:39:07 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dennis Gilmore <dennis@ausil.us>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...)
Subject: [PATCH 6/7] ARM: dts: helios4: use hyphens in fan pinctrl node names
Date: Wed, 25 Nov 2026 18:38:55 -0800
Message-ID: <20261126023856.767961-7-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126023856.767961-1-rosenp@gmail.com>
References: <20261126023856.767961-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_183909_499354_709677DD 
X-CRM114-Status: GOOD (  11.06  )
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

dtc W=1 warns about the underscores in the fan pinctrl group node
names:

  Warning (node_name_chars_strict): .../helios_fan1_pins: Character '_' not recommended in node name

Use hyphens like every other pin group in this file. The labels are
unchanged, so no references need updating.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-388-helios4.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
index d4ed47ae73c5..b62730b949a4 100644
--- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
@@ -300,11 +300,11 @@ helios_io_led_pins: helios-io-led-pins {
 						       "mpp54";
 					marvell,function = "gpio";
 				};
-				helios_fan1_pins: helios_fan1_pins {
+				helios_fan1_pins: helios-fan1-pins {
 					marvell,pins = "mpp41", "mpp43";
 					marvell,function = "gpio";
 				};
-				helios_fan2_pins: helios_fan2_pins {
+				helios_fan2_pins: helios-fan2-pins {
 					marvell,pins = "mpp48", "mpp55";
 					marvell,function = "gpio";
 				};
-- 
2.56.1



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCAD606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 15:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=p2GSrTtq;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=Hsi3Lw2D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Ab9Yfbpo3hn/cTagJWdL75RTonupVvPPfl6ZCeCMP0M=; b=p2GSrTtqIlA3mq8zHLpRraS4ai
	0XkJQAV2a8fxVSDn5HLk/8SWwp0qOjoaso/OcPgXiTZZQnmvPc8nxEjAuf9602yCi1zLQMwc/inGq
	E31WzsZqZAyQI0fZ04MqjkeNnH4SG/5yj2j0VZKX3ygjC+ie0pwiMzeqp5Wvn/5Pj/brPsosukfnm
	PAb+JI0yexaSEIuuN+Eal34lrAGwUzxQCtu78IHU4I8isvCYncVY6yBTP9Jv8t59eDuLAZQNhlsFG
	7crPRtfI3f+X7lyFo5Y5RT3D6LGjk6GPmPp/1UpWW2/jCvTAU1uvZj0U4nHFIwoV7csL1MeIyDfGv
	dGIij1Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQR2-0000000FOaF-0qC7;
	Fri, 20 Nov 2026 15:21:56 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQQz-0000000FOZT-3r47
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 15:21:55 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so9331505e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 07:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795188112; x=1795792912; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ab9Yfbpo3hn/cTagJWdL75RTonupVvPPfl6ZCeCMP0M=;
        b=Hsi3Lw2DuNDx9SYdmyOu8ulZ2WUvLSjLLJ8uH0ruxxYu/3WTN3lM8pbWuZLbS2rYCo
         Hil3qp2kWy7X2M/S1/hC941VMgrSgiLV1G3XhDxF2Ko3Wv5awwXQOF+iZ9r3fvRlAwjQ
         zsfyyY/Wlok0g6+9lZ80GRYJ++2Joa+WLJC6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795188112; x=1795792912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ab9Yfbpo3hn/cTagJWdL75RTonupVvPPfl6ZCeCMP0M=;
        b=WmTc3Mv7V+yq0iZcHQjka3jqv+3I0uWIRDznGHMPpZ9mE22HABEQv9M+vf1GwEuEBs
         baBQOqFnV+coi2uM6BO0f3vdcMgDTVk/eMhLI9KAT6M2+MPbkRVGT6kW7cYfm15f67Pl
         1OelQK2XomCR2QX/pqu/Hj4Y9t4yauivpH4sYNbIhJL4dKC0fmL8jKfOPZISxDRnOEAV
         SSlsGMmC9WjV5TrLzBg0E/XWrdsJnSSQAQ1b/obuBTL2EyeUrXDCbqmStCpAPrpEbX8f
         S8p/UIsnlywzikty+90UcZdMojAW+kTcKGboBFOzZvh9fTv1WRlBSyqbLsbmL0uuYkIN
         Mqsg==
X-Forwarded-Encrypted: i=1; AL+hErGSMJz258mAcGB6Mp1t45nddf/RP/evtuL+iLFQ0B91CM/8wodleBpesEuuq/xayb/FdyDY9dd3GYf5BvfI5XUr@lists.infradead.org
X-Gm-Message-State: APuU4Z9+jMrC/g5MzQ0cHPVqCcTBjL0j6fTIXT+LiQlNBtTrKfRyYjta
	EPNiLibYA8f7I8dLAOQmktrMTRvNCwZEc3AqdfSOa1ezSzHNANOKH+VWO9w+bE6R0c8=
X-Gm-Gg: AYBFou1bKaJdNTlRFRbxh15HvtoETHoIrohbADai2teNj6TrfTPdNDomDwrIUZnFX5z
	2bT0XQQ4rCN9zOmHcibggYCWPFOZYVDJNxiCltrr5S73gnHT7KZfuU0z7OYd2lhox5BL2qrpXdS
	jnVwzusQ+A4ogY+UArGkq17TTdCz80llXBxRynZCBun+PZ8IOTWxJ3CSM/9+zcbiIKj+nS4KeX0
	s9ZFLhvbK/kQX6O6s81CBxn6/TDyOdyxgXC4GTpyW8YSkpeNZuhHev5AQCtXyUqV00G9o9HcI9U
	swDo7qTWXT6UMDLzOJUicNI9YYDJ/wymDrnXrfugB6ZoTUKG2PQRevCs4vewY/5BSKBORPOpVe2
	iYrSWQyt2UGp+8I5tpddM6bGE+4uwNKgA6eD1Iomwb7c61ypG1OdH9vBwovBTfX23eqy8c1JXKV
	O18zeJr23Jtzf55Qd3f+0/7jyFs+vsraeQp8fw33eVYfx7pCpZ3i6QTWcgE0LHyF0MUjbBT2lIm
	K2CUGVzDjkK7WPNLB6Wydci8vXC4EClktg0kibOHSq9lOc4E9WBpX8067KCAJA4oOtHRZ/KlTOE
	z45zqX3PVsFPvv9+twP2CDXz+leaoMa15RH/vbjMZXA9Odv2fAYU9PCZE2SUj/kVzifj+e+Ssg2
	acCjCC9haCDbxL8mpiNwws5cVSMbbyYARYIhsKJweTJm0CMU22g==
X-Received: by 2002:a05:600c:5307:b0:4a3:d327:6ed with SMTP id 5b1f17b1804b1-4bb888283d8mr74634395e9.17.1795188111672;
        Fri, 20 Nov 2026 07:21:51 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.41.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b3a7sm140812535e9.3.2026.11.20.07.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:21:50 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Max Krummenacher <max.krummenacher@toradex.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ARM: dts: imx6ulz-bsh-smm-m2: add boot phase properties
Date: Fri, 20 Nov 2026 16:21:36 +0100
Message-ID: <20261120152146.1774885-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_072154_026839_BB5E9301 
X-CRM114-Status: UNSURE (   9.70  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add boot phase properties to the resources needed during the boot
process.

The BSH SMM M2 needs UART and NAND access.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
index 2d9f495660c9..c74003ee9efc 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
@@ -26,6 +26,7 @@ &gpmi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpmi_nand>;
 	nand-on-flash-bbt;
+	bootph-all;
 	status = "okay";
 };
 
@@ -55,6 +56,7 @@ bluetooth {
 &uart4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart4>;
+	bootph-all;
 	status = "okay";
 };
 
@@ -135,6 +137,7 @@ pinctrl_uart4: uart4grp {
 			MX6UL_PAD_UART4_TX_DATA__UART4_DCE_TX	0x1b0b1
 			MX6UL_PAD_UART4_RX_DATA__UART4_DCE_RX	0x1b0b1
 		>;
+		bootph-all;
 	};
 
 	pinctrl_wlan: wlangrp {
---
base-commit: 65e4fd942f72a9dba0e4e257290c4fa1aa756854
branch: imx6ulz-bsh-smm-m2-bootph

-- 
2.43.0



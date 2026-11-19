Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C9C606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 08:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sreqgR4E;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qvnNCkCP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=oVnSTbltEKzZ7TazraahyXbMXLICXbVMVZEEQRtY7Tg=; b=sreqgR4EIL12gn
	aqHCwdlwHxauYqc6i6jqhYzDGiCPmrnKkzUn2PDfYtB8N1UaOtiV2a+m45noTKZCrXYKSIlklPO5a
	qBZ4wooRl+W17QVPcmtc2GxPBxmtFz7wGbixzekWXELCUz2N76Q+igsTxY6NKw4wBxrwSbNfaOwTQ
	qSwbCMdE+Jzpvabq+mwgmNupu7s34bPjOEV2sNp6gIQDrW2PPSJyle2W0zqMajqXF1v0KADxxE7VY
	RR5SW0IdGLvjfqqIomjoOkP6ojaeb3LPVPGPiPpX47MIVMUWhWxhTy8kd7f6ytZRfrylFt8zxeQcZ
	DQO0K6cTK6gpDZljFE4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxvY-0000000BFfj-05OF;
	Thu, 19 Nov 2026 08:55:32 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxvP-0000000BFaE-3Jk1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 08:55:24 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-5365f9a04c5so26193301cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 00:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795078523; x=1795683323; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oVnSTbltEKzZ7TazraahyXbMXLICXbVMVZEEQRtY7Tg=;
        b=qvnNCkCPxttxir42FgPGKstXhRw6gutUHYL6gHEAH565CfVI7BtH/ZJcD3BEQldXc0
         e7JaFeKzh/ReUcl9KyDGyEQuy2v8XnWQFOIEcUaGOf0yAhfKGolHZjQyxxvbP2OonPe3
         wwtrHaNCgZhtOt6Bobw8Z6sq11wnpX8vPysonwctMZmZFBG0zw0HHJ973VDCGOzd681S
         VcWUPuw6ulma3lnN28Scf26I3BJjYugHFc95IXh5rvk7lrZzOqEms18Q2o0u356WLu4O
         M54WV6WQPN99yVGNvnm4qscv4zTgDOP2JVkQ3DB/Fn6Q/pmrYccPtroyKIVyP6yEFRXd
         jWMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078523; x=1795683323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oVnSTbltEKzZ7TazraahyXbMXLICXbVMVZEEQRtY7Tg=;
        b=ZN4pfb31s7ermJSQF6hzhT3RGN8Nmlh0WRQbjWWHPmZaY3Zmxyf8hmVHcCRdAdQaVi
         gtEcVnTjcyirvzKZZ4Ll7en/vsKlc74rMyRnHo+WO7Tye+Mi4syyl/ouTtGC1Qs2XCdt
         4rlwHO8197gpNbvy8rGLUgj8MwYK76j0KPnM10TI1Ay2Rx1yq2bf+1RurhKILp4Yhd33
         fufeCLHzVCL6YJX3A6CsAGo/YqV2AD5BmraHRzi0ZgKtcyVvcaHLiJo0947+oszgsKAN
         IsTh9LYWum7lxisUMULOmb4b4CX6dUefDPYmXKcI3aowGTKVZPa68lz01jGXCmPrdFhX
         WybQ==
X-Forwarded-Encrypted: i=1; AL+hErEOXB34W/oJIg6st9Ft6vf/vfFVhkWBThhEPnaS5SEydIqBXiMBdzngA9XcAOzjH5GicZXbydy7/ioQftCioFbV@lists.infradead.org
X-Gm-Message-State: APuU4Z8WG1ve5QHYUrV4/cfgiR6E81vlKTMbGG7mWamU/vKr/ry/GHig
	vexNAnc5udZxoyGmhfWQE1WOhd3r3qcuAy32lL5fEgsVQIotvKVvDWUpb9hyfw==
X-Gm-Gg: AYBFou3Am8smWAq0R1HxEmB9OuospndpWx7uf9A4JhEza4WHN/vJ6FBA6zB2HPvWP97
	G1eAPPjWTJPXnuFRoNqIC+9JIZvvp3QMh6bcFi3+Q7Diq1akwIXWGziGnI5BsPU3TfGnyDxzZoR
	kDhMSAV8brVHtoeITm6D+pnfyGF5ejBpwKmuhoFY7EHlqAQdVUB9RmSosiaFprFr4K+hpLpPPcG
	ApP5SmKb3LMl8hrYIvdL+MeZeT7CzP/KC4eNjyqYloMsILvV86V7tae5ywCzQp6Pa96c3pybSEI
	rqzW0CeSB0qbzU99Unad8aJqokCeveJb2wg6WkovqO84odHWC8Jj2ttcT9H6Ni+TsprmYxDVXqb
	7BOGpyZ5FGklpXbnL3eH4O15QYV75+WYd7ITObHMcYBoI+BLT0wMzipDgJIsMf4HtRXPtTuhwTV
	Vos2aYZb0Pug6IuOmnylLl6ePHf030nsyWebZNAl3bffuhgv29ZSmdv5HRZdekr020t3Pt/UpU/
	MPVunSxAU6D/dSQ41E5/DjrM8RB4uAJ592WeVwgqXYB0GStgAaEJ7Ezytp2SMPVIY5Ga/6wxoB/
	l96XFLEfsK9VPXxrkoa85a2hkSVk0EZXhWLc8vEcYpy1Lr6pHyBBofBOujWP1YBvas0wqgUPRT1
	IdQiRZmMWxWBj1/rlEXKTmq4Iba63tFXYhCQZkAxoJZotzZIgXr/tkfqNB+FdvbRFnjiu7YP9Oj
	5BqA==
X-Received: by 2002:ac8:5d8a:0:b0:55d:591b:ed78 with SMTP id d75a77b69052e-55d5a699b03mr85930401cf.55.1795078522885;
        Thu, 19 Nov 2026 00:55:22 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66bcbeabsm19578151cf.18.2026.11.19.00.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:55:22 -0800 (PST)
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
Subject: [PATCH v2 06/22] ARM: dts: BCM5301X: EA6300: specify switch
Date: Thu, 19 Nov 2026 00:54:36 -0800
Message-ID: <20261119085452.75708-7-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119085452.75708-1-rosenp@gmail.com>
References: <20261119085452.75708-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_005523_836312_C9F7E575 
X-CRM114-Status: GOOD (  10.43  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

bcm-ns.dtsi specifies a default layout that is not correct for the
EA6300. Also allows setting the WAN MAC address properly.

The port mapping is taken from OpenWrt.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../broadcom/bcm4708-linksys-ea6300-v1.dts    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts
index f8dd08cc7cca..bca4c440a499 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts
@@ -59,3 +59,40 @@ &gmac2 {
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



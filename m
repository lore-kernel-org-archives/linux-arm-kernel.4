Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F8A606A325
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 08:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RYg4jSoD;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZRnhqa5s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2HdtJ+XqX5lO5ERYLerHM0E2jrL7YBGV9T/0hIoeKbQ=; b=RYg4jSoD/PxfVS
	jUG+ssg+2Cni/I4XiIkzJF+WFYPBw4dZs2N5D2LfYV7IOHg4DYWYrko4CyrCwVMqah+wA27dJmtzT
	2ax5aR2IqUmN8jZQHXgwuVzF3fmrm2Wo7axtnbeag/Z0mdp+HocQld2wJNKSLDZFkZ1zIXILSvPrZ
	uxjSu8O2vhgw7pmDYq4mR3meocvq6FHtED41RrcBgL5FG/qLCTlcwSqI8i4Yf2I7lF6ZIvjz1yqSY
	SUy4rzj41tWJw5ZQiLXCWqdyeQmTr61thaD87QWQfChfsyuBXJx2zONssbYCdEX5Xyy9FZRWAyZVh
	mlrJq66pIEHXV8q1zOsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxwI-0000000BGHF-0IcF;
	Thu, 19 Nov 2026 08:56:18 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxvW-0000000BFd6-18NK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 08:55:32 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-55d2b4a99d4so17697271cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 00:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795078529; x=1795683329; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2HdtJ+XqX5lO5ERYLerHM0E2jrL7YBGV9T/0hIoeKbQ=;
        b=ZRnhqa5sVbxnurPisqHR0JvZfjnRi/vGCZXSeS631y/HWVD+/IVN6Yi2z09Y/9v5jm
         u6+Qv9ywKanhnzMhV0osEBvWp70vgXU7u2GdamYaNUGl/Bt5Wgfg1GJs0z0b/X8FqxFN
         Qu0deWTp/JZKBqb1s87wHrill1KYuI+9Cufgmh0AKqPwuM3JHJeLgLa9TQoQICosItgm
         ZYr89KluBOdCOAvqzcsahips3vSWZ71tK0fB5nXoNi/8sJo1jPmtHIRxYR4fOakRQ6ri
         N7CDXg12UWYhthmr/c7g4WUE13nMvbe/q47MCkk7jPvawyXyhbVV/o7hrcAM47aiWXGm
         Lxhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078529; x=1795683329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2HdtJ+XqX5lO5ERYLerHM0E2jrL7YBGV9T/0hIoeKbQ=;
        b=HKHCwyZZuM0XDP9xqktwfiCsHvQQTsqtHTQ0HkrIagAVcFUJbM+hIiZMfmKHH5nXtg
         pWogekgxYw5Fqrm/jyU+RCKb8ZCirCzhNuCRD2D0lC+vNRwJmbrmFUD+NpXnTPE07gBL
         wKt7UnjZAbXINoNJZNWFq8pu7c+ByXetC9MhWJtKDeToa8G6zaIeCgrvu7APpSSD7wtJ
         zPKIPADXt0rblXFcm/fekpXJF0zABxZx1c6eiEBVpNSXx9BtOqEITzkEvfAllcrC+ZJt
         ACzjVhPjyTurmErwLTCwsx9BUBlXFdjZmOB9YvWZ0efmLOfXW+wvzs3pKZk2vZioeCbU
         h5lg==
X-Forwarded-Encrypted: i=1; AL+hErF2L8XxofUVAUrq0FwEfwfr8a5bRCKQtXHIPVGF5E1CtT+1J0ZxKM31AGKnGPdI0C8dgocon9eKSCdlHqZJS1D8@lists.infradead.org
X-Gm-Message-State: APuU4Z82HErjI/LpMnqL9wdXOTLZlWPmobqRb8L4NKlEdA7kfTWO4Wec
	2lY8ppO9kVcgSULbNiwT7QnY5n9H/wr2p+CeU2GszoN8ss8TbKr0Di+W
X-Gm-Gg: AYBFou0HPEEQa9iW2xPmgyaBBy580eOZf9p161Prf5sV4yWsPiP8JJpsRDW4HsEubAY
	bdmOr4R5zglijdgzZbJz98wM2TNcy2nvCn+BHBXFg4hcXtXmXLLfReFeFJO7JLwTxFoW+MsI3lY
	KMmLLfmMV7CTOSXmfeIZ/CK2a4u3Drlch0dvt0ob4I/53DnTN/jPyF05EcpXz3wbE9YM3+TT50V
	CsOaCnS6isqTqn86+7GmYWehYcHey1XQwjUY+gyhw8CGSXb8TfAaTsZE27skbolFaASC1+1pc0a
	7ntUlszOf9ya75XcLxGHV3yZb9pyQoAE95MDZpZ7+XBw8FGwL1SB3iv2afZb+L3Iq/PuZW5VdPe
	C5Xwa8rXBT4TcvpPeJMkqcy7FUYjkYEZThu4D3sSiuJgv/gfnQzgVW9S3R2kXo4YUdIp+jkDAjk
	E15FhqOd+/rxGRBBaz3Kj0i2nrVPjNvdHLSdl0bfWxIggW5TQa2NspiLvF4aLtn6hxfrY4KbrLU
	NJ2tgMxZ2kT961fACxvrDQigLUIuNHH5u4/dVOtMDq+Sn0eBMQJP7WDdclOJxVbHNQqkNFVvqMy
	/e0RoQZwrftDo/iIY2N5BiaXkI09GDYpFBauS2Zpzy0t+wRfgRgXpw9Wo4cotEWotNao7vMDsgA
	AeLk0j+O8p7o+LBCjSVQk124LeJ/5HYRpiSm/7WtsY5hYxKk5cEKClJ24u0Dg6cukTfD9ycGpTS
	SfkA==
X-Received: by 2002:a05:622a:a0b:b0:55c:cff6:5683 with SMTP id d75a77b69052e-55d5a3087d5mr82703901cf.1.1795078529327;
        Thu, 19 Nov 2026 00:55:29 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66bcbeabsm19578151cf.18.2026.11.19.00.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:55:28 -0800 (PST)
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
Subject: [PATCH v2 09/22] ARM: dts: BCM5301X: R6300 v2: add nvram node
Date: Thu, 19 Nov 2026 00:54:39 -0800
Message-ID: <20261119085452.75708-10-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119085452.75708-1-rosenp@gmail.com>
References: <20261119085452.75708-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_005530_321495_29C7CD0B 
X-CRM114-Status: GOOD (  12.61  )
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

Add it and assign its et0macaddr cell to gmac2, so the MAC address
doesn't have to be set from userspace.

The nvram partition follows the 512 KiB boot partition and is 1.5 MiB,
as on the R6250.

gmac2 connects to switch port 8, the switch's IMP port, which the next
patch makes the only CPU port.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts b/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts
index 55f0d9e90d5f..1b99fe442dda 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts
@@ -25,6 +25,15 @@ memory@0 {
 		      <0x88000000 0x08000000>;
 	};
 
+	nvram@1c080000 {
+		compatible = "brcm,nvram";
+		reg = <0x1c080000 0x180000>;
+
+		et0macaddr: et0macaddr {
+			#nvmem-cell-cells = <1>;
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -90,3 +99,8 @@ &usb3_phy {
 &usb3 {
 	vcc-gpio = <&chipcommon 0 GPIO_ACTIVE_HIGH>;
 };
+
+&gmac2 {
+	nvmem-cells = <&et0macaddr 0>;
+	nvmem-cell-names = "mac-address";
+};
-- 
2.56.1



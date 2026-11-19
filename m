Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FDC606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 08:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BR4xalpF;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wKwuPMOs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/b1q6dU2ghEuyKkVha/xXxlJqHV7VS5GmIlgXY+GTpc=; b=BR4xalpFcGV7tB
	uXgG0zDt0AE9HK/iSUOi8a31Wra4u5k9+fTpe7ZPuxKhHUIeuvBz9/gTzCRrLB38QPrg68XpGTo0q
	JIXEcffa5pHdB++2in43LnVyC/P21i5lw8Y2zyG1n4pbFZgidq4coh4NUsxlnq2VQs/C7FDFN2Z5A
	UiYvRwW9zHSau6mUq0T68YugLStV0aNbsOspSzdw+ICzp7wpagFMqJ7NkvYLsxlTQHHK/5Ne4uV7d
	KBjn5EEke8rg14xrtwEC7ypb2sUwSKS7s/kaWdOk2WrD6yyuHR1uxGstHXhAgnGUDRnnUuvYu0ssh
	Qr8g+eNQtiNcnm8GpMpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxwK-0000000BGKY-2HK3;
	Thu, 19 Nov 2026 08:56:20 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxve-0000000BFoZ-45nM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 08:55:40 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-53639b8903bso9613471cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 00:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795078538; x=1795683338; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/b1q6dU2ghEuyKkVha/xXxlJqHV7VS5GmIlgXY+GTpc=;
        b=wKwuPMOsr87pC+I3lac+qxo2I/3kJBZy4kHxJZwDdzVXQdxdFAN6q1v9p6dSxRNSM0
         3qPOAMlL+fKNhwEhBdC8qBpUOCBx/hiGEiz2YH0K1/Mf/07hwizsD1NRwPh3d6yMEv/L
         du8DluvyEaN9yaxh6HXRtJTB3jKcjv0E3r94FtgQigUPOuuEccxfDzN4yiw0rF681HwP
         fHxxZ+UDcDSNVaGrWPA1tj+KurgffBC32112EErEAWTZtFrmhthdcWlFTNFeIc+3gW00
         yjAzJfX8OcEtZ45ziRu1Kr/rxqy6r+RUZo2pMRLdUkLebHe+CXdGblun9l3N+vHhqohm
         b0cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078538; x=1795683338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/b1q6dU2ghEuyKkVha/xXxlJqHV7VS5GmIlgXY+GTpc=;
        b=Y4aA3TDzSJUlw/bY9ToBH5XodgZFZDXfNPcnkDRJ/7EbighArJGa+2Jjs0ndejqPgK
         PTJlp9m2Yg5k/lmawOqa7UoGSK0skq8JiPHPPW8sjqZX7iy7tWnNY6Tx/WQzS+YOkLPZ
         bds45BEdLfhZf41XtNXNulQof7MKgvtrzra+vb23tpnfZHcTcrxPGT+Hq5eGW1JoBDTs
         e/meP8hqJBfZblSyOwLOLlf6wUtre222vFDuGeB4MaMiKlsJIs/OrWAwSx2DTpjz8HvK
         qJeYWIA41KPkkoWAsHKs0m83DXMAGnbu0vk/eIgCAQK20rXYNuosJZMUUIw4blNP9N2c
         /ssQ==
X-Forwarded-Encrypted: i=1; AL+hErHjbnCCA4W8Of+KGSZEcKq+KClLyn8e6fXb9gBVtn4t85WKFpDU49sAaDZXSQPZsGMDmhteNi6EEaSWGFJYu4ph@lists.infradead.org
X-Gm-Message-State: APuU4Z8/gQY8wQmi+r23MJrWnszKlkaP040fmeQ3PS7UnrlQwf1SWAho
	XrI97Ym8dfANmTvgnM7CLfc2IfPma7H0cBOloBUDQZISfCMYBHZj9lx4
X-Gm-Gg: AYBFou1iaYPGenrLuiqBfHVMtCL6g9ZO/I/MX7rANkyu8MmSFQUiv0TJSpCcceyLREx
	DEBihwJHq79nnR5/jy2+YiMtLNaCSV0yL/IxGw9AKOoHQ4r4/0YVJ/XHPx9oif1nFDDslzoj7Eg
	0TJf6y0oUBYvX/SvjbmE1+/7siJOeuiruT4gU2Aiig2YikiwtIuTlrdqZyUR+Yseo6UW/uafSg8
	ISPq8RH22z3QQduFPi/b0nYRtz+qeytsd8Yeon7KkVntNrq3ZFN3SspUvwdvKFszyEJGOv/VI+g
	INx1lBOe7lESjegm6AJycMCBUdDxwoStJqPaIu+XUhzMk9Vu+4RBhHIoiwSornOk3UbaoCqwC01
	ynmyAI8eml5holYriFcfiI51rO2XRjOG1dzvivF5/rCzbRegNSVdtx0wufks+GxpfGDw2jtDeSu
	5nxs9NPnuorN8/sjP5JOdvvj1udyVyj40/RLM7LSbc3rg0zKN3qW5u+ahvdPbrdNVUFeXMMRFEa
	6szkzEWfc/kmFL4KlhI7ttIbIPNVtJb/31RSUbcqoz3KeWIHakWyMiT1cAXXDwgN/JkxWczG2cM
	LFIlHZD4MlwA2HB0Hgwl+RtVozGfvMxECt0rcBY4G+xJjoTyy9OUHFJEKtLqgrOo3C8/YUWKV+5
	NPzxde+7QDAoxFsboQL1Qj9s80MTvdk9Eou6RQOS38Iz1KGhh4PBONQxS7yHg/WDqyt5jyEGoox
	YWRQ==
X-Received: by 2002:a05:622a:353:b0:55b:8787:dc2e with SMTP id d75a77b69052e-55d6fc98a3bmr5106731cf.33.1795078537921;
        Thu, 19 Nov 2026 00:55:37 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66bcbeabsm19578151cf.18.2026.11.19.00.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:55:36 -0800 (PST)
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
Subject: [PATCH v2 13/22] ARM: dts: BCM5301X: R8500: add nvram node
Date: Thu, 19 Nov 2026 00:54:43 -0800
Message-ID: <20261119085452.75708-14-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119085452.75708-1-rosenp@gmail.com>
References: <20261119085452.75708-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_005539_037976_E6907903 
X-CRM114-Status: GOOD (  12.74  )
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

Add it and assign its et2macaddr cell to gmac2, so the MAC address
doesn't have to be set from userspace.

The nvram partition follows the 512 KiB boot partition and is 1.5 MiB,
as on the other Netgear Northstar boards.

gmac2 connects to switch port 8, the switch's IMP port, which the next
patch makes the only CPU port.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../boot/dts/broadcom/bcm47094-netgear-r8500.dts   | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm47094-netgear-r8500.dts b/arch/arm/boot/dts/broadcom/bcm47094-netgear-r8500.dts
index 76d562610654..d312afdb750f 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-netgear-r8500.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-netgear-r8500.dts
@@ -22,6 +22,15 @@ memory@0 {
 		      <0x88000000 0x18000000>;
 	};
 
+	nvram@1c080000 {
+		compatible = "brcm,nvram";
+		reg = <0x1c080000 0x180000>;
+
+		et2macaddr: et2macaddr {
+			#nvmem-cell-cells = <1>;
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -94,3 +103,8 @@ button-rfkill {
 &usb3_phy {
 	status = "okay";
 };
+
+&gmac2 {
+	nvmem-cells = <&et2macaddr 0>;
+	nvmem-cell-names = "mac-address";
+};
-- 
2.56.1



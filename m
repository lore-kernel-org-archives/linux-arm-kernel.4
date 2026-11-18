Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A55A606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 05:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xPMZ9hH3;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jZ/qSxUQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=a+6eCIHLWHFY3nDB/Vr0c1/yRrGzwmD3XbYPRK1ugF0=; b=xPMZ9hH33jdSED
	vYO+Znffk3/QBgjDXHYH/M6wRJGwM/hYEPbEefbwcYgBxkzja3xDduGe8dkNDEOtIRyzcVoBV9V1h
	0c/EO4PgBL5yilPVCMCKc6OIVFnAYSUVM/uwfDGp0DsqW2W08+D8Tgpgpq0NXHkPpyUMgSSaNrlug
	vWlQnA2VwbYRJUP1t8UQTjUMOIuO/22WGW98uKHWVlSkO3ecq6VI0csFH9nTjZG1trqgo52/X/oMp
	1AEhJP41mGE3iWrQOukHpHPHUeNbcaOBVPZKN9SyU1FkVmfse/NT2Gw9booRneTQBkUpahEELEb4/
	6G3Z5tAmWMuNo9UzY8rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTYXW-00000007m2I-1iMC;
	Wed, 18 Nov 2026 05:49:02 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTYWz-00000007ldU-1Liy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 05:48:30 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-380b40312e2so1831396eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 21:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794980909; x=1795585709; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a+6eCIHLWHFY3nDB/Vr0c1/yRrGzwmD3XbYPRK1ugF0=;
        b=jZ/qSxUQq3gNz2LPRuFewd/fse+7LpM5mCPtpwexmo3NyydnBkc9cnNj//5VuqK5wn
         7igfHCQce760DbMt4PBxgFnURkutbK2SR0EDqAuyqwteiKjtWkd8VMj+hZdPyXU7oP3m
         uCswjG0y3l/0K7zi6o2J5/Nkp2wRudhZxn9ku+OdTzGU9Wg7GX9kGjSc4hQEXYTFBPrV
         9Fz5HOWM/e+cjEEPUWrutNboy2rI8dNOUMC+1AlTP1x/P/OJYWTcnNT3t8qejYMTkrln
         WJ5g96OqDe4dyyNdmtik+LLOc1eXaozMgTfUKxCyWaSQ/YdZY69vi+0CrTclLKx0U6Ib
         4KRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794980909; x=1795585709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a+6eCIHLWHFY3nDB/Vr0c1/yRrGzwmD3XbYPRK1ugF0=;
        b=zesO6xnP7tVGmVQz7Otu1wJ8cU4/7cwyOdyRedpPIxl/i1dbWh1mC6ZtJ69bq7kfDM
         ARQReDfDTkn7JPM/pGV5WgC1yuf6ymlbsB0pgB5b3x/vINTTZavuVnpz2R4gsnQl63Xe
         tjgCNdnU0oWYN7H3gUoIKGX90AGc1+7Sy0CL7WRnnKmlUvHYHQ/dMne2QQZ70rGVO+bZ
         am1kH/gnO+oBU2fAG8VLzTOJMNSa+2R8ZLPXsLR6aYHRqI1Nsu6trhqt3sE6jW5RHjoh
         LGWtHOgPlSrhZFerw8xXCH6RGOMqBv/6Mee/++T8Cf/17u00l35kfZz6qDQq2JpbRQs/
         vMVQ==
X-Forwarded-Encrypted: i=1; AL+hErFxuZGeku2agtXXyZH/k2iqeKqoQv/CJa5HBHE4m3JrrtdIeYCIa/ODlkYTWPPB7Xm0yWGkuEeK3BrmAAXmlaag@lists.infradead.org
X-Gm-Message-State: APuU4Z94k1xtqDV6CsGFPXmTd3jdWMB+W+NO11ra43905CapOgqLDn+S
	m5My59vlvLKlJ3MtR81RDJH6hzk8H3ozWAO9zNOhTWkSJPL9ND23Ns2h
X-Gm-Gg: AZFdTZdyF0FdEDimMk5Z7souMUmMc1drP6DN+GE4i6k9Bzaq2zg+MhpuJqLECpoQ1xG
	i4oCjQg8621j1gA9nDKpZsMpYGVesciyWSVPup3DRonna04fQ298YngjSayCz7bF6Z/PHssgOIz
	cG0VV6NpiUsdUNA2fhqvdigHMpWSNQsPztBIkDzcaCop5USlPsycmzIEgA3DV1NgStQ9ZG8bF3Q
	K8e48hqGE7KKMhwCdSMV9yRSN3tzXGmtWDD4dI6i+beSaHpYB2y+Dz6zkHJz5yxjkf6wdVqABwz
	zedU1yPSmbrH/vem3jCcu6nEXStX+DkGVSPkLzRhu9lSqscC83MlVlt3zsSYBMaR0ktO0gmzJFL
	N04dA7hSuLYqCaD8zSDGVufZz496DQghzOmc91M5sJFJwaVERLETnCCrXFRaHzrHWo5qGE7kbgS
	nCSDXu6ytQgVnJn7EqgLvApWK0ZmS+7j9VQ4EBUdXao+KCDT/qD3MUNZ5PoTqChLqHjY6/UN1eN
	ePpb0W13BaFuUGlQZrY6FZkkuzQDfUm8XeMXu/UQwJkEjWtrqCTkhIhkSRYKYFhjCYjdBEVyRf8
	J+71ITgKBf8MglDqErgNrftixODU8EowL6lS0/1a/pZdQFmDM8P0UpFGggGDg4H7zYxLOFzCKFM
	hil2P1W4cQztLcS7tWzp7gAlbQWhkX2leU2BNPFMiScPXsgE29e+7kkpQIoXZ1N1qzRwJD9Icar
	gEZQ==
X-Received: by 2002:a05:7300:148f:b0:36a:1f8:a5a4 with SMTP id 5a478bee46e88-3828171b242mr2168030eec.38.1794980908654;
        Tue, 17 Nov 2026 21:48:28 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a680032dsm3408116eec.10.2026.11.17.21.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:48:28 -0800 (PST)
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
Subject: [PATCH 08/17] ARM: dts: BCM5301X: phicomm-k3: specify switch
Date: Tue, 17 Nov 2026 21:47:49 -0800
Message-ID: <20261118054758.132233-9-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118054758.132233-1-rosenp@gmail.com>
References: <20261118054758.132233-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_214829_716581_47AFF693 
X-CRM114-Status: GOOD (  11.07  )
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

bcm-ns.dtsi specifies a default layout that is not correct for the
K3, which has three LAN ports and a WAN port on switch ports 0-3. Port 4
is unused, so disable it. Also allows setting the WAN MAC address
properly.

The port mapping is taken from OpenWrt.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../boot/dts/broadcom/bcm47094-phicomm-k3.dts | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts b/arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts
index 5b9250976f13..018faf90fd4d 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts
@@ -52,6 +52,43 @@ &gmac2 {
 	nvmem-cell-names = "mac-address";
 };
 
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
+			label = "wan";
+
+			nvmem-cells = <&et0macaddr 1>;
+			nvmem-cell-names = "mac-address";
+		};
+
+		port@4 {
+			status = "disabled";
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
+
 &nandcs {
 	partitions {
 		compatible = "fixed-partitions";
-- 
2.56.1



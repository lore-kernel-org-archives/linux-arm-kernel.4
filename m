Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79C5606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 09:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WrpcuUN7;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=JIkVxV2B
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=cpTBG70GLztkppBlWDxA4zs5YJB3Ae5lFCFEvrLL98I=; b=WrpcuUN7xF1e5D32SQl9jfFb3L
	V3A+llM+1G5UC0sSOEi0YmEiRcEUddib851nb6Nq/qWKrITLt3Nk05xk2LibpnluKeGZBlCfZ3px0
	c5vn2XDk5B/f85bGSA5LhbsItvzAZKumxo4Lv9NM8d/mjO+d4U3767ZVOc4umxvjONHNVoexOpnIc
	w9+8tY6DK0kHTBcW36wZ4tTcfNEbMxlghLGRyjdvRM9uJ5iCxUDhP2+tbqbjj19nnvMra4gyQD1oG
	lbwMBXl+ti2k0+jOcwBSO2o7i0BIeETD3cEeMhXIxEUjz8vhtdZQ0fEGb7DZV6S/GB04O/Od3lz/P
	hP49Hd4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbfT-00000008I2m-0rd9;
	Wed, 18 Nov 2026 09:09:27 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbfQ-00000008I1r-237p
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 09:09:25 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4b467581b98so8367995e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 01:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794992962; x=1795597762; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cpTBG70GLztkppBlWDxA4zs5YJB3Ae5lFCFEvrLL98I=;
        b=JIkVxV2BN8e4xcEiZY2U6SbYbBwPbW7gGhoOqG4r4pbF2wIHbxCgG5XQyeN6xFpqoG
         W6qPh0DVUOonIpqlkskC4T2PSp36jmMCNyfLZFr2N0ffTkRMCCVoW95THK1h56E9xbfU
         BsEZnOkgOMbBQUgoFHp2jXKBReElVq54hBzOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794992962; x=1795597762;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cpTBG70GLztkppBlWDxA4zs5YJB3Ae5lFCFEvrLL98I=;
        b=X3AswkpqN4O6XZoMLZrNoosWjOwAwnX0x/dbRYpXmxQyY7JPHi5Cwuc5NcT4fk+IW5
         xQsO8GRFcMJHE2iIJVmXH46GtTwJJwtHQWrVHyTs7hoURuASasWUfDcAWt0Y9MHgNwN1
         2066KG6QZ2Qr0GucmGggb/OG8NGD0/RkQXDAsBCqGu8Cj24OGqV6Q+sHny8cbMQZNPW0
         HgINWe82H2TlW9rBSmSk2qhJWHDmFDWGxw5lA/ygkBhhQzGGzWS1xLlJ/AWqrQG/FOuq
         XkGxScT9mEVYxEz7EF+mxj+Qnljv0N0STUBW/m88TATHannxpjMUoEB5CzNHAqoTIWt+
         o+cQ==
X-Forwarded-Encrypted: i=1; AL+hErF/VsSgK5sNAq97Rs6LE51S2H8aZ2SySnXrK7wBm/KzgDMGUlbL0Db3kJ5n9++eu5tKBJC8iiH4rzpNFZFE/rur@lists.infradead.org
X-Gm-Message-State: APuU4Z/9kGOGwKIUVDEh5SrzPKZFUYOCnNJltvApyuu2DkDdBJu6qplv
	2puiS8lS5WJNHZzLiRx22T65L7Z1RGbVfFBfjXvrAiP9B2daTYrUA7ml7b2jxPWjBkg=
X-Gm-Gg: AYBFou0WpoQXt3HH23abqbamqIhh10zaxkc6U1hRjCzJorxg+jK3kDsjxrpTmd2Ols/
	kf2pmCx33HqDa21PTArPS+lRsljnEu7DZMgxJCnR9AzdHQKXugv5cS58aYiCDX72JaM8pXrMFmQ
	FY6XWCZ3IeujdsNIk+6TA0TkiSKo9lDKlPhQ0LsDlU/Zx0XgLMPRQBbsnd8LmDZI3jVX0Q9Zh8i
	+cL1+0uQbxQQaSbfG++GNNo/L5jS65RpEoItUp9jO+VbqGfCY69O/3QjenKc40qN7e3C9eC7rwB
	wDROPcq/Z49A+WsVL0kAhfkmgTMnKdpTv7UrCIyMMiNczDNVz1qkTdzllKaiiihce7zVZChfHj3
	/wLKMSY7cbzrd7JVkeQeHvQLGcAl1+SkL0XDU9y5le29BkuAYYxPOrLmDLQflAbPVDFe4RNZSZW
	ehCTkrjN2wkA42AwTcvHa5oAEtZ08xLL0Yt1RNjOufr5xH8zW6tcqXB9WnvfczlRbAaX7kUbKhA
	5FuJh1e9HV6n84xvWmGvUw9gEQxNuIaJUbsxTMi5IsTeNc4K8317vTOl25IHu9+BUggOMBjLgsh
	YphUNgmHQQ31SOhxlEW6rXDFEqcsJFbSVoNAl7HaTiJjQg==
X-Received: by 2002:a05:600c:8b34:b0:4bb:781f:6067 with SMTP id 5b1f17b1804b1-4bb7d6cd404mr33290135e9.1.1794992961833;
        Wed, 18 Nov 2026 01:09:21 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78418853sm185770195e9.8.2026.11.18.01.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:09:21 -0800 (PST)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v4 0/2] arm: dts: nxp: imx: add Draeger M48 CPU board
Date: Wed, 18 Nov 2026 11:09:10 +0200
Message-ID: <20261118090914.38082-1-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_010924_554539_EE8C1E22 
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Adds the device trees for “Dräger M48 on NXP i.MX6 (Q|DL) and Intel/Altera
SoCFPGA Cyclone V” board variant.  It has both (the SoC and FPGA) on the
same carrier and they are cross-monitoring each other.  The SoCFPGA boots
independently off qspi flash.

This is the imx6 devicetree part.  There are two bindings as well as device
trees, since M48 is using two parts: imx6q and imx6dl.

new in v4:
  - added the missing GPIO_OPEN_DRAIN definitions on I2C recovery GPIOs;
  - fixed the halved LVDS pixel clock in split mode;

new in v3:
  - used LLM to cleanup most of the errors and warnings;
  - proper use of dt-schema this time around;

new in v2:
  - add the tag from Conor Dooley <conor.dooley@microchip.com>;
  - it should be clarified that "draeger" vendor prefix is added in
    my previous Draeger M48 patch series;

Petko Manolov (2):
  dt-bindings: arm: fsl: add Draeger M48 dual-cpu board
  arm: dts: nxp: imx: Add devicetree files for M48

 .../devicetree/bindings/arm/fsl.yaml          |   2 +
 arch/arm/boot/dts/nxp/imx/Makefile            |   2 +
 .../boot/dts/nxp/imx/imx6dl-draeger-m48.dts   |  16 ++
 .../boot/dts/nxp/imx/imx6q-draeger-m48.dts    |  16 ++
 .../boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi | 213 ++++++++++++++++++
 5 files changed, 249 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-draeger-m48.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-draeger-m48.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi

-- 
2.47.3



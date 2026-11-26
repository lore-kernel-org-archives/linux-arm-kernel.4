Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8EF1606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 16:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T9skFz3I;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eRbvQzta
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=1zNw8Pd/JqrMGg4lyFXAavmYqzgxCJ5fQLfj1g0DY+s=; b=T9skFz3IbwVDfxZumFbauokAdl
	g19q57LuR3tZdCi1ouYaKtBleMtZQg88wDs2A03AxfL3ISns4LcmqLHloShixA5Hgu+Y52s85Tyfh
	lyZv1TDr/ArEQrqHo2PjLb4uX1OUxPTrhLwzfumRihqUftG+9igbIX9IuAXhjVdDqGhMXjXdOzcGb
	BwZUyMmycGYnJus6Hcv67utjPZgPKF1w1I1XS4BuHeOcC/DG18f0SqOh5sveKMIl4/XyBd85GpXkh
	+17mqGrp3APhpBBRhqd+C7+OGDhOhvA58QcT8d/9CjItESO/3q0k4lHjnoLX228kI3IJAptlPzq3K
	8vXfL9Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbvO-0000000Dq3v-16ha;
	Thu, 26 Nov 2026 16:02:18 +0000
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbvK-0000000Dq2h-0jEe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 16:02:16 +0000
Received: by mail-dl1-x122b.google.com with SMTP id a92af1059eb24-1b546061d58so16468810c88.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 08:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795708933; x=1796313733; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1zNw8Pd/JqrMGg4lyFXAavmYqzgxCJ5fQLfj1g0DY+s=;
        b=eRbvQztanY5LJwN2VqUrkbhK82tmFEAy6JDYk/NVSeTk/gV6cK+F5RRDAcmxT9PxeM
         ucvQXbq+7laLfAPuyKwcPKxIs9rH7LQ1AjNy5ieEINwEa5R5orIZHEb9Tk/ErE10c4Rz
         JRGt2NfWb5KubfLHMTVL/e7sY1/zxg1V7xsaPLVT1C7sUwjWSFe7aQnM2oFBm7x4tR9C
         kHunWGmMczVbYPwslAsB5Wky0AITOAI71EAi+c6On/QO7N8WotVhGXuzYBh0x0pudAiv
         E5hpV4wiriiXglpIhtwknw3+A2zf5mJFKNdf2+Sjp2kedbUG9GXSZqZMCzgo8XQfJFX9
         nCzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795708933; x=1796313733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1zNw8Pd/JqrMGg4lyFXAavmYqzgxCJ5fQLfj1g0DY+s=;
        b=D3ZkFbXgKzzWLE6GEFPwnVruHlV8Afh+Ym8wiE+OAmuYH3q00LLE44K2cSvJ3gs10A
         jVAxDw9Yq+GM/1McEmW7voRMO+aDvkt4zVUumIHP6KI+VJ6r1+dWmn2Vcxi10ZTk9cdW
         fif6Z0zlInJw/wuAzmTC++WyWZRRAQF2VQtqqjbG++39PLUdsWj9lqXYuDhUScT00PNr
         4C2dSVTz1jvKRXSF58k75bhKbzswuW5b7mq4LmFKbdbZLG6BSSOxndtgaC13PwPDoTpd
         W2lTTwGiqs3skiFj+fwOsawZATCB336NZJ5y8GUib/w7FU/MqNR44L/DCnxuWEeHxKpo
         Xt4Q==
X-Forwarded-Encrypted: i=1; AL+hErGRcQw+DH8XV6Ta9lMlYBzCg41FLbTOox179V8bb6BCCJMYnFHUJECjPKsfGcMLqRccugBatsYkoa+D8u5IqYL8@lists.infradead.org
X-Gm-Message-State: APuU4Z8yZZXpwI2KQrBwiNETi/E8jrkG9PJjx5ihFt7DBLmUQ/vKrr9P
	C0XxO2Lvhpdc/wGqonf6soCMbkpZjClPD935lMMkokpNsHh18O7bAy7l
X-Gm-Gg: AZFdTZecT+MTqakJcbkQ9c6rcSsOgd2LtZqMPmZBila2nlmiCFcDOcUs2vJL7bHx20V
	zz3ua/9m3hmGsFb9BGG6RLFwLsUTsJWxLIL71PeHB6s6d3ZURUKjeDHSGDkf/wBxT9OUv1hv0e1
	BkQiuSYsFFMXAW1v7MUlYosP08tpC1M5YeTsaDIroaZf+Xk4SwfEVHwzB+kQdprhEGhUQwhJF22
	o4adoJrEOTuWTdArho9uws/AQPWaKlqI4/hEU/cDZJCnd5UQhiR35l334B/4n+jE2a2vB4JIKpX
	4uaH7mrUu5RieZesu1dl/tLa9eW4VckpSQl76WTI+OqgTON3DMcgEtmmHqJ3iGWJiQHa4lm+nib
	c9tgu4kRPaKFKF/nWre+ZZW9D3kRoUoGzm3Bqp0cah/12QsmSuRFz0TqdYD/RqLmmMV5STpSrNb
	JSiyK2aoeTwSYpfrOQAKig/N4F/w8+8Ajyv7XZTlZ4V0JgpflN7WLdOz8mI8ag9m3AOki2SGzci
	gWzSYePkytMRCYlyK1DwxmNPrs63YiLiytW8kMtFRPZ9wmGNcJjY24U/Z6m5rBjF2dggNSgAUHl
	URfEjKXbKFC3rzNUSpDkctf65b7zDdeNhagbtZ6E9TwUNQ==
X-Received: by 2002:a05:7301:3f0a:b0:384:8f9:bbf6 with SMTP id 5a478bee46e88-3857180d3b2mr34804423eec.38.1795708932635;
        Thu, 26 Nov 2026 08:02:12 -0800 (PST)
Received: from localhost.localdomain ([183.82.206.18])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd46c5sm80062260eec.11.2026.11.26.08.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:02:12 -0800 (PST)
From: dineshkumarv85@gmail.com
X-Google-Original-From: dinesh.v@adlinktech.com
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk@kernel.org,
	conor.dooley@microchip.com,
	s.hauer@pengutronix.de
Cc: daniel.baluta@nxp.com,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	Dinesh kumar v <dineshkumarv85@gmail.com>
Subject: [PATCH v5 0/3] arm64: dts: imx95: Add ADLINK LEC-iMX95 board support
Date: Thu, 26 Nov 2026 21:30:59 +0530
Message-Id: <20261126160102.52163-1-dinesh.v@adlinktech.com>
X-Mailer: git-send-email 2.25.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_080214_218761_620C974D 
X-CRM114-Status: GOOD (  11.33  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Dinesh kumar v <dineshkumarv85@gmail.com>

This series adds Device Tree support for the ADLINK LEC-iMX95
SMARC module and IPI SMARC carrier board based on the NXP i.MX95
application processor.

The series includes:
 - Add ADLINK Technology vendor prefix.
 - Add the ADLINK LEC-iMX95 board compatible string.
 - Add Device Tree support for the LEC-iMX95 module and IPI SMARC
   carrier board.

Changes in v5:
 - Remove duplicate GPIO expander mapping comments.
 - Consolidate GPIO mapping information into gpio-line-names.
 - Update SX1509 GPIO line descriptions based on the latest schematics.
 - Add Reviewed-by tag from Daniel Baluta to the vendor-prefix patch.

Link: https://lore.kernel.org/r/20261125113845.297658-1-dineshkumarv85@gmail.com

Dinesh kumar v (3):
  dt-bindings: vendor-prefixes: Add ADLINK
  dt-bindings: arm: fsl: Add ADLINK LEC-iMX95
  arm64: dts: imx95: Add ADLINK LEC-iMX95 board support

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx95-lec-ipi-smarc.dts     | 118 ++++
 arch/arm64/boot/dts/freescale/imx95-lec.dtsi  | 609 ++++++++++++++++++
 5 files changed, 736 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-lec-ipi-smarc.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-lec.dtsi

-- 
2.25.1



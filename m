Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FDD60A260E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 04:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x1Mqf/4r;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dTYMAB11
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=4tUkPqh7M9OUjiwIhkhOdeSBfACxoiXile/BDFh7nFQ=; b=x1Mqf/4r0RtE84I/q+9v5S/01k
	VjUkrQT9Y2vjFMMi9lbPZ1FoHgWX77lBXnPpNuJRyIqvvHEopJZV95K5BP7z2nPEUnAEF23zVlIn6
	5GMK/9gMt972MqA0OZbqbwSAIpUuERjw86XPQ/K27uXE7pUsYrW0dL2p8+vGiItgDVa507YfsP1Gg
	A8wM9IU2Q95SZVZAcoxc/gfWbYGlGf7mpK1WQyrhFNj5Ae8wgjTLpDJjKtmWfsp58oPE1PdJo2dBF
	mdqDsZmw6bRcrjpHcOblZIccCktReU4hqfdE77JNbYbVxgIteejme5e3C8G5ssFv0CWP7mfPd9iXS
	3j8M9LCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQdjX-00000002Q4y-1kXC;
	Tue, 10 Nov 2026 04:45:23 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQdjT-00000002Q4G-3LzX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 04:45:21 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-703be215729so620409eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 20:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794285918; x=1794890718; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4tUkPqh7M9OUjiwIhkhOdeSBfACxoiXile/BDFh7nFQ=;
        b=dTYMAB113ghRv8gHrmWnTTss4xcQknAqj3j9rKXyW1tjx2gxs/jRcQp2WFGvVpw+Qv
         W9JOzpaGAQOCBC6nig8SR8KWnmBvjnDKJYbJ0/CdShJwpD2pxD1tLluwkWNnqJmax1TC
         RUGP5sGQ9ZcWeLS7PC0u0LYZq07ElSOgZrnxt9+LHg4GlTAacEWQq6jxFR771XRQgPiH
         90Mddf2r3lmaPuaQPyCJPSma8RFgHvkMIeC5wEysjOd6Gjw7wfvTn0IwDoJ2BBQ0V8oD
         61EML2f/Ipb8BpI1da1TZVXEnnt9tecfNe8j6wFdsJCqetq1LAkuACL/ygIyM3zfWgG2
         qm7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794285918; x=1794890718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4tUkPqh7M9OUjiwIhkhOdeSBfACxoiXile/BDFh7nFQ=;
        b=pUXmZ5D5f6uiLqM9Spg4Li65DqWp25kDKe4lxCCSbvxeZhKQVVRXKjwcvmvkcHv7Xp
         4MqIKr0bf5xG6We2W+FYUpr0a0qGLtpJMekNqG/cis2sUgebJZvZvja9IaOS+4F0Rpkw
         8xIfDW/1PC+0eZbG356O4Drrf3CrPzylIb6ynCNPuGAN+xScii5oP7gB9IrWQ/Ek1Ptr
         96Cl9Z+kyPTuscQHdrK1Rg+NGZg1Cg/quF2k5zM2d6KTnKiNSp0UMbtiAjfyzukhELlr
         w0sJgJ3mZzriF2cw4gvxjYhI8h6DLWXYUBGnBvANl6Y6gZtuGoWGpyTEXUuYJqloLKex
         etrA==
X-Forwarded-Encrypted: i=1; AL+hErGVEQNzQAXVaFIuXrwoidn8UqJBs+HmDWFRuuNJDyCbbZiOlusEBiDbcjHNrumTDF4yv3USMcls+zVwcWQMrGmi@lists.infradead.org
X-Gm-Message-State: APuU4Z9w9RGpPVi7L71hcIVGERju6a/+WHlA5UUO2yYySTt0suqILcxC
	/hN/fZsGzko8d7ELR20Sn41euJpwPnAtvOvZboUWFt1ycRIEOR+lmKQE
X-Gm-Gg: AYBFou07SoQUAivmLKqGXd1VjsgufUSS10SxG4NCKMiEqQqn8pV5HVmKcbQOQ2iMJ+b
	Z7xSJncbPLBuOPWsckEmuvkuio2UZYQc7CymiGvyBU1lEWW+KTWyce2DkGd62zNcqDJBz9QLJXl
	xesBXmQlXPXdXTc8hkNqANae4lcuUumWoXSCNmGvgM+vM5PFgSlaMmU3QhxdtBj6X6b23MiyHTz
	aYrVxkIDt/UsUZygXaKjsQevGtBVUWB78l1dS3LdO5LGyQlzrK0uAT6qMUlMpbtWJqBHmTWBCzF
	OJFBV9A0GSSWwza2aRHAeHazh1ktGazNVBhB3LK6AWceVGN4x/aBtQZOAg58ysIMy2zFeBQLMz5
	yDixK1oK3dylx//EH3VHK8FdMSzO/XoivNf700a2BkpHqKjl4hSCXE9PMVUv80NlOEzodRsWHcv
	4OGL/oemLGtYVkEZzxIgrSDe7YOZ7c/Hugp4ZQZtefSohgx+Egm3l78jPpfMHJ6PPzqOX8dw7NI
	apr8XIN7JxALBjypZ7E5fJpYaOxRmkXAgnDgh49KeBsnhC4O0gKhUZpTRCwIPF0sIhm1h82/RWY
	iPzisbZD3aZNSJ29eAD18RL8oYW94Fh2YQZHEgoNxCOSYTeKMXMrdofqtFb+mtZXx9opxaMk9a8
	1bqHKXg==
X-Received: by 2002:a05:6820:c453:10b0:6ca:8e07:15 with SMTP id 006d021491bc7-718a197a67cmr482559eaf.7.1794285918159;
        Mon, 09 Nov 2026 20:45:18 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ae23095c5csm876306fac.16.2026.11.09.20.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:45:17 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>
Subject: [PATCH v3 0/3] arm64: dts: allwinner: add A733/Cubie A7S support
Date: Mon,  9 Nov 2026 23:45:15 -0500
Message-ID: <cover.1794227241.git.enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_204519_847125_1E31C387 
X-CRM114-Status: GOOD (  10.46  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds the initial Allwinner A733 and Radxa Cubie A7S device
trees, enabling UART0, the AXP318W PMIC and the 3.3 V microSD path.

Base: v7.4-rc1 (6628e7d4c6b25c8d18f1345e3a20d21829aae7e4).
Previous posting (v2):
https://lore.kernel.org/r/20261031020640-263f7b05-a7s-dt-v2-0@gmail.com

Changes in v3:
- Defer SMHC3/mmc3 until it has a tested user; omit binding, node and pins.
- Rebase on v7.4-rc1 and list public schema prerequisites.

Dependencies, in application order:
[1] A733 CCU v6:
https://lore.kernel.org/r/20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech
[2] AXP318W PMIC v8:
https://lore.kernel.org/r/20260910-axp318-regulator-v8-0-e906a61a7f3d@baylibre.com
[3] Pinctrl IRQ-bank v3:
https://lore.kernel.org/r/20261025142412.112216-1-pmazzini@gmail.com
[4] A733 8250_dw v2, patches 2-4:
https://lore.kernel.org/r/cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com
[5] Firmware clocks (separate from CCU v6):
https://lore.kernel.org/r/20261031020640-263f7b05-a7s-clock@gmail.com
[6] Pinctrl voltage-mode fix v3:
https://lore.kernel.org/r/20261109-a733-pinctrl-v3@gmail.com

DTB/schema checks need only [1] 1/8, [2] 3/5, [3] 2/3 and [4] 3/4,
applied in that order before this series. Runtime needs the full CCU,
PMIC and IRQ-bank series, [4] patches 2-4, and [5]-[6]. The clock helpers
listed in v2 are already in v7.4-rc1.

Validation: arm/sunxi.yaml schema check, W=2 CHECK_DTBS=y DTB build
and clean git-am reader test passed. The November 4 DT v2 RAM boot
exercised UART0, PMIC and MMC0 reads on Cubie A7S with vendor firmware
and pinctrl v2; v3 removes a disabled controller and unused pin group.

Untested: boot with pinctrl v3, card writes, hotplug, 1.8 V switching,
other UART/I2C and storage instances, RTC alarms, EL2/ITS/MSI, and
physical BLDO2 voltage.

Enzo Adriano (3):
  dt-bindings: arm: sunxi: document Radxa Cubie A7S
  arm64: dts: allwinner: add A733 SoC description
  arm64: dts: allwinner: add Radxa Cubie A7S board

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun60i-a733-cubie-a7s.dts   | 284 +++++++++
 .../arm64/boot/dts/allwinner/sun60i-a733.dtsi | 601 ++++++++++++++++++
 4 files changed, 891 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4


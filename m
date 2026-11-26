Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7901606A327
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 03:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kodNVOrj;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zBMzR+jG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=coO4Ngf257EjY6b4GluqTxT2j3/irNaUNExRpoNnHT0=; b=kodNVOrjGJRr0ZOaqOR1GB4/9B
	MtiHH/PV60cNL20q5RxfSdX42yBYMY/7uA9S4JTsvVUI5snYPVOCLWnS1CWiAM2seNdsm0HJzRbex
	OebxOPxhtDXjh4vrZWBZd7KJ+/AUZKkitFyAD8ZvAOoBwuiNAnTCxG3YrSeoUpqYSM+R1WhayDmz5
	PbLb7LwJR/9s6udweiFgADy0LxApBAXjv8trlHOPtdof0Dv/FyCZjRLbN+rmtqFEg0ReR1of7ufoU
	o5tZ9Z4BjXHMpGTB7OQCNAjiY/Kx0rfEGxfULstrXKtMh/tCHA7NrYHTLLX99gkMUkpJ8QAjOXOG3
	/4a7IcOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPO4-0000000Bv8c-0GpT;
	Thu, 26 Nov 2026 02:39:04 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPO0-0000000Bv7V-3abU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 02:39:02 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-8b29b83fdf1so3447096b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 18:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795660739; x=1796265539; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=coO4Ngf257EjY6b4GluqTxT2j3/irNaUNExRpoNnHT0=;
        b=zBMzR+jG3OxV8Asb8nLWIhsF96fJ9MIETHAUuxxLUtJ/wUdI2cJqjREPzzChSY7/P/
         VwVs8ZRuhFDSszRRpfQS58E9Dty9X5V6yLg7O+0+S6ewtgkYPpOnlPDSaQzSwHExstp1
         GJZAL/ucgkFm6CrJVfXfdvMNOItkeGtrDPNyE3zw55MoXx1xoJEQofepa639BSpLH0LC
         ho1qPsxV6vnxMjYsB/5Xv2K1R+uBX/1EyBYoIIWsdAqMaqiW10cf/5xLlnn6n7Ga2uBf
         w5ajCBl2Hf83gJ53eR8lvPVmfaT13l77yhfeokzcINktbSaAxZOjvrQDY8UGM3PKbZ4T
         FRsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795660739; x=1796265539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=coO4Ngf257EjY6b4GluqTxT2j3/irNaUNExRpoNnHT0=;
        b=nO/7+inpHL3vMWxVcoDAXNaOmOsMBnR1J8SrFa0rtHtQnsS0yfq2n8tpvn+7LPEo7l
         tX10WyQROrCIx7f877IXuliaqcqpCh46QBq12qB2PQMUO+o5+6ZgAY4lx9rbmo0kDT4T
         XY6aq7WP37HduyDDx1X53voZ3SqE4229bg9UOcfCsafLjCZ2ydTjz4BXLvZC6xW/uFhl
         nyIJ5OikTBCANlJ+acZ18lpbhOnFiqGn1pM1Kg1gP8N/PI7zNmq7XUFk7Spv0tKvXu01
         COmHnxEaNyOdhOI2fqROeYMLvfMLkfpqaFa+udMKpT6uQ1HSkWulX+jcY0xvfhGSAGHt
         WdOw==
X-Forwarded-Encrypted: i=1; AL+hErFpEIn4wYiXbS0NPbd83eecJ1D/t96zXk4IeUbsvx3JS2z/Uc9vfS5kFBFEktCcH2Q7/xYuuCW3VvitAic1rh5d@lists.infradead.org
X-Gm-Message-State: APuU4Z9hhMVzeA5HFkeI9p8NOK4M3xJXCMNMeslCuS1yGYXkpoER/cnc
	8w1fo4Xa6XjRwUQes+dsASRuBjZpjhqSEijG9URoExyld/XmHxbu3RZB
X-Gm-Gg: AZFdTZd072hKFJHjaFdMQgv/6wux2goaikYSzosNUF8Lz5SZYj1AOd+04UsPENv75at
	lEml5bsybghfJkNVRbQzk2+A4LoREXlrXktK72EPRgyhNaFe1fZuKNi9GafPBVV4VOW9bxBxavK
	dtX6sUhaMHkucDNnrf9gsoUwo603daLc2T84YSJGz4JjJoW5TwuSNZkJUSwRUhVQhWGan1bagQA
	aNJ670cQt6yWgb2cf/tCQ86fAu64rG9k6+ZX2tvQIA4kGu8462RJ4yOBK4TnFKouhqe1K22CE+I
	0zX1AvLkC9nIESWtAsw1QM1RW61YCZhISECbASB1lyFVBhxu76XKqRrAroAP3VcFpfRCD1AuFhp
	oblGwTJ4ZePV4aFEjpr2Qsvm0s7rFzHbQXQcpEej8tb6DqE7d9m2/VSRSRVc8f2SE4VmbAO5dNc
	iFXg8rslRRZwnWxJwaiCXl8x+1dFgBQEJwTyL0bR9zXxOoJIZKJfE1kjEnultkuApXNLwr//Gz6
	vxvrVxQWZCW/7eKAz1Bly6xruocUfTfilBFAYHkGQlBQwEFOlm5sVqxgr8DNRPLYGZk2xkhSwWl
	2Z6jf/22VagcsbFDd6m1W3Adfx3x0Jfx7nDWxhUyCuWnDi+4WGUlfr4DgmYYZ83D3zBtaqv+3ny
	IzQPyOUcibPox3HSjr7Bxrg4vjDy/HSyqjs7p1nRhq+0QfKVPTxEjCIqz0Fx81GnO4sApQyL9mI
	lVIDQRhluycJFD/+r3dhSW99ou
X-Received: by 2002:a05:6a21:7a44:b0:3e2:200b:dc24 with SMTP id adf61e73a8af0-4014e655aeemr20431782637.90.1795660739442;
        Wed, 25 Nov 2026 18:38:59 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d026d6fsm9909018a12.19.2026.11.25.18.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 18:38:58 -0800 (PST)
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
Subject: [PATCH 0/7] ARM: dts: helios4: fixes and cleanups
Date: Wed, 25 Nov 2026 18:38:49 -0800
Message-ID: <20261126023856.767961-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_183900_912400_2B178C29 
X-CRM114-Status: UNSURE (   9.23  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fixes and cleanups for the Helios4 (Armada 388) device tree, checked
against the board schematics.

Patches 1-3 fix bugs from the original DTS: the board revision hogs
have the wrong polarity, the PCA9655 expander uses an edge trigger that
can lose interrupts, and the EHCI controller that gets enabled has no
port on the carrier board.

Patches 4-7 describe hardware more accurately: the fan tachometer
inputs, the microSD slot's missing write-protect line, and LED color
and function. Patch 6 fixes a dtc W=1 node name warning.

An AI coding assistant (Claude Code, Claude Opus 5.5) was used to write
these patches and draft the commit messages and this cover letter.

Rosen Penev (7):
  ARM: dts: helios4: fix board revision GPIO polarity
  ARM: dts: helios4: use a level interrupt for the GPIO expander
  ARM: dts: helios4: drop the unconnected EHCI controller
  ARM: dts: helios4: describe the fan tachometer inputs
  ARM: dts: helios4: use disable-wp for the microSD slot
  ARM: dts: helios4: use hyphens in fan pinctrl node names
  ARM: dts: helios4: describe LED color and function

 .../boot/dts/marvell/armada-388-helios4.dts   | 53 ++++++++++---------
 1 file changed, 29 insertions(+), 24 deletions(-)

-- 
2.56.1



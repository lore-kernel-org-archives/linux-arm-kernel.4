Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3FB606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 21:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KoH2B86n;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gx/YuX+3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IWGxRSF6TsGu8YkPR66UCDbiThQFkRdGV1nPrINMwrA=; b=KoH2B86nwnLOUD7PML1gfP2N/z
	Ne1X30eKzoO2v2VnI3repAAolo7zAQHT1wTMsd0arteegnYQrL149idEsiAcs27jUi9zrN0CJ/EgQ
	YEp71PdNxtSN/1SDTaq+MQ521rY1lKeGmjd7GYWGmjvBCUNO2hleKBbIwaaG2fu9J/uwbIenvYl96
	Znkmw/HsYhqIBVU92cbFE39ddPjrN3wwJWU8rKDw/CmN1/MTbtEkPBhTOsYd6AopOLGe9n7jDCOk0
	BVNCzP+Nbp3rA5ZuJjpGSerNohjUufKv/lel7sIH4deV6mNQy80c6j/OLYlDiGgvxWbn4rA56cnJ6
	xAFTTOPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUskm-00000000MhK-1Rou;
	Sat, 21 Nov 2026 21:36:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUskj-00000000Mdz-2Rg0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 21:36:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9CF0B45590;
	Sat, 21 Nov 2026 21:36:03 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795296963;
	b=ZzQAjrahsUmh8xWrweHq6uI2FFXHmRsOMRVitxGG9Xj5QPqubasn6sCWjWcfPEf3aRO0
	 LyU/122y+A2VDwAddAp7AE7x5jln1Tlh9DwNskp/Q85q4P8cEoJF6ajiak/r1TWOWQwBj
	 xHFlVwIe3pAVb3B+ZENpLQ+4gYEvsVcBY/C2amsHS33oWZjDdxn302686+b0xnWjv+WYK
	 DgHwR5StpgQP9O5dGSbimPGQ+CsNEiZWuPtaipSTDaFwKgpSue3Hov+bl0szJwrJkh8Mi
	 8dRgVVm8+b8QoAUNSO4iUcIDoFAMplAmzOWv3YQ+Ou12eizZPU71raZKK4cAO6043rA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795296963;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=IWGxRSF6TsGu8YkPR66UCDbiThQFkRdGV1nPrINMwrA=;
	b=biVcCekQ/jMubTl8+ok0+9A0NexCVr7cXVrMIlC/M8Mz15V1PAYnWYl1SxL/41UHks4Y
	 FqXm1knST6vW/+Vp5bXFYtQLX9/CAMTlP3eQMINTvgglPw1DIXdz3Ggj1v2C2oIFxgsyb
	 wOdV7to6QvPTZ3S0C/3DV15cGL5+q+tRPsgQh/GK7htxIJiOZ3RU11p9vq0j8KnOvJQZc
	 QxD6/dB6lQamFiRt08MBVaMZnahYx1pP84za9Z1BNXfc6ELCj19h4FW134G4iduyqcgHt
	 s+coKdmdEsuD2BdIDfYXccMvb3dCQAguIXEf7Xv65YaNLdiOdcwr2GYhTKTFoQE1eSA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 199AE1F000ED;
	Sat, 21 Nov 2026 21:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795296963;
	bh=IWGxRSF6TsGu8YkPR66UCDbiThQFkRdGV1nPrINMwrA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Gx/YuX+3BdrWJ+9LWb/i/CegdA72WtSfElBTC3f0RXUHRzD/+mLinxxG5bGVL/Xs2
	 i1IqZMHXnu/3YENEiOSicp5Mz7o8RXt7rAwz5zTeJtg6WfvPComj81wvkd5mI2+W6f
	 xdIjYvTfeFxJMcvuBBcdoVcSeGl+etVx0nINLkIEygWPDVF5BJpL8O9TXgkpQqliA5
	 UMgSZ8WrqjVCsnPIXeMQSxEd2OKmCeSzOiwIsjtNh+O/F4mzI5zuoH/QU71Vw1proI
	 ljwooU9C2DDLLwRRrgpUrSdJDBcbMDZql/g8vQw9A/p2h9Xp7zGJvyZvrx9JuYsFXO
	 jHPrEtx1C4wTA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5FE1F4BE0D;
	Sat, 21 Nov 2026 21:36:00 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Sun, 22 Nov 2026 00:35:54 +0300
Subject: [PATCH v9 09/10] ARM: multi_v7_defconfig: Enable Cortina Systems
 CS75xx support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261122-b4-cs75xx-v9-9-1fc1b90bd097@gmail.com>
References: <20261122-b4-cs75xx-v9-0-1fc1b90bd097@gmail.com>
In-Reply-To: <20261122-b4-cs75xx-v9-0-1fc1b90bd097@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Drew Fustini <fustini@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 Jason Li <jason.li@cortina-access.com>, 
 Fil Dunsky <filipp.dunsky@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795296958; l=1073;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=6lUn6eCTFyPOKvxFHES2Y+JrDHysCcc0CgLi4Om4C1M=;
 b=/AdLPokHgNTKSs8qJDHsydIJEi1vTVxTcUO3jWZQVyFk4cp2u1lZIqXm3owJkC839C/yJ7uoE
 EGUtEDrr9GlB8UuOQ9UESILEfvc6ZIFn3tOGZmPrh15Zuwy4OtLqiC0
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: filipp.dunsky@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Fil Dunsky <filipp.dunsky@gmail.com>

Enable the Cortina Systems CS75xx platform and its UART driver with
console support, as used on the Securifi Almond+ router.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 arch/arm/configs/multi_v7_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 069d5a49f..23f144359 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -45,6 +45,7 @@ CONFIG_MACH_BERLIN_BG2CD=y
 CONFIG_MACH_BERLIN_BG2Q=y
 CONFIG_ARCH_DIGICOLOR=y
 CONFIG_ARCH_EXYNOS=y
+CONFIG_ARCH_CORTINA_ACCESS=y
 CONFIG_ARCH_HIGHBANK=y
 CONFIG_ARCH_HISI=y
 CONFIG_ARCH_HI3xxx=y
@@ -396,6 +397,8 @@ CONFIG_SERIAL_FSL_LPUART=y
 CONFIG_SERIAL_FSL_LPUART_CONSOLE=y
 CONFIG_SERIAL_CONEXANT_DIGICOLOR=y
 CONFIG_SERIAL_CONEXANT_DIGICOLOR_CONSOLE=y
+CONFIG_SERIAL_CORTINA=y
+CONFIG_SERIAL_CORTINA_CONSOLE=y
 CONFIG_SERIAL_ST_ASC=y
 CONFIG_SERIAL_ST_ASC_CONSOLE=y
 CONFIG_SERIAL_STM32=y

-- 
2.53.0




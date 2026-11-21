Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE30A606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 21:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eBBbAXZT;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PsEu17ZN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IWGxRSF6TsGu8YkPR66UCDbiThQFkRdGV1nPrINMwrA=; b=eBBbAXZTwpvsxVMDJvhjSgmiq0
	FR3kfNQ8sz6Foe5H3aUDOiMt8/k0Hq5DfFTcXqkr7lViB9ZwJPlqCLdLYtTf/Ak6klwxJMlhXcuAK
	+tS7OP7RZHvYhqSXHXbpluuAQWVmyPro1JyXNE/fyLj0AvSn/vStUbxVDh/deFbPBpbrheQoAZPyA
	VfF61G2n9RC4vVc0I9bs7ISFKbsOijsFYgJIpxj+pofn49IooaEghTuqE/8mfr34VUR0Balhbh27s
	Dso6mihmg8MotYDZE4wQ5f9B8b0K+gI26j5ojSvbqpZcr5ehEiAqacDsWrR/JqW5RFtOTtc8HLLUT
	x2/tYP1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUsEL-00000000Ii7-2a5S;
	Sat, 21 Nov 2026 21:02:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUsDy-00000000IUK-1q55
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 21:02:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 349C441F9D;
	Sat, 21 Nov 2026 21:02:18 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795294938;
	b=VprGw6QhB5JqSrLUfbSe/h1SvD/PM7HlBBy81fv4vJ0N2ltkCVXwhAqJQaDJqPCRm4ZA
	 ynAZadxUVSk5prJXw47nWKAnDLvh/BQUeKc1ApdKeQnP37w3WoNAKm8ko8RUV2ADV44VM
	 eb4wqhEZ+KWsgt2oOVyyo9Q+KMvuL4a1/Dk9L5J7nfJdhzIjWeLUKCYZ9MHPh+ZiSocJP
	 Ln+/I271mdj1lJO+fb1OIBc2vqqz4dnzoI12XWKyw5u0ybuiwhlPRXsDI3EBLMm74tNRq
	 Hy5M1ChU0ZTo15PWS7imlTisMCJS/5N5tA4BPT/tzmR/9cpyu/HTL1oPTw8wKzoIHVQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795294938;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=IWGxRSF6TsGu8YkPR66UCDbiThQFkRdGV1nPrINMwrA=;
	b=WI/XOvYXpzRQpehe3IAnTeCD1nM1jc80MQn1aHRe7aye8I2drT3uU9VnHh9SzQUCzscT
	 ZiyJfekV5vlvoI7WtO5ReAJXEvwWHoslyOsCiIk1D3Je5tHEJ8gjfdy1OkwKNzXJIxE8r
	 dQiL2bBZWDamSi9E5CEN+MCTvbTUs5oVwDk+zuyjP2Z3Tyk4lP4otnsMPvjl283EBy/bo
	 heWUv/XCbT5FHNIxMAVYTfps37guY/yUgjG/H5FcZVusT+BZxxFznWPz8kMVOnij5Dc/h
	 tGkmPxrXvFM5fvR+yA8DJcluVXoW/20P639QdMQYYWOX0k/ToMhjT3hTrxYhKmabzOw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D8A971F000CF;
	Sat, 21 Nov 2026 21:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795294938;
	bh=IWGxRSF6TsGu8YkPR66UCDbiThQFkRdGV1nPrINMwrA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=PsEu17ZNNWl1rYVYbXi8/ST1wi3lQKRD/1HHiQPXK0nvfPvqnXg6B/cBMIrvi81c+
	 XiHAjMPE3CBw32hUj+wHZQvTXztCBj23srIif6hx32iCqLj9boy86mOXOK1cC1NrY8
	 Zuyd0NGQD1c2IGB2R9LK5SmCntmrJTtKFDpCtgVkvYb9hD2hd7dyCeA6wTsiNQpY7r
	 My7wpqeiwenSNco7Acc5TQoR33ieWJ1m2VDSuu6odKo3is4BMRy0Ualhlq1Np/p7wJ
	 dPlRWloD3la3reEvGsdEJkE9KPhcB0fGO1hXHjDcM0IoutzYab5RieM7Ab1Geb3U8J
	 fm6w/s4Zn+9Vw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 219864BDC6;
	Sat, 21 Nov 2026 21:02:12 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Sun, 22 Nov 2026 00:01:54 +0300
Subject: [PATCH v8 09/10] ARM: multi_v7_defconfig: Enable Cortina Systems
 CS75xx support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261122-b4-cs75xx-v8-9-5f971b0dc69c@gmail.com>
References: <20261122-b4-cs75xx-v8-0-5f971b0dc69c@gmail.com>
In-Reply-To: <20261122-b4-cs75xx-v8-0-5f971b0dc69c@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795294929; l=1073;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=6lUn6eCTFyPOKvxFHES2Y+JrDHysCcc0CgLi4Om4C1M=;
 b=dHGcZw65wtGXywhP33vD+PBaz8Ux8WqqudPybVnZzIFCbAkl8uJchB7YsYy36N6iF9vicZIUD
 Hpk66EOryWlAh8f9B4fu9Ujat4tam3P6miYl8OrDfdFLYO9bTrAbjcU
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




Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214B6606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 21:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Wvl3sWw3;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YoDvZ9jK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=La2K15nDGTc5QdvSUYADH/M3UC5c5ws+911+TdMxDuM=; b=Wvl3sWw3Gx2WhCERfOBGNu4DK+
	x55V+ZeLGKg5gGIRa6ecgo+e6dIkfGchw3tgax4uF39wUQ+y1Em8tAYTrcQAT85koCuL+xqZ2izi8
	5LiRRAiothtkLvx2K+7t4DnDExtsrRS9lVwMyqh+AfykGGdtd+ZSJayHl7byYZNAeJZDy7RmIgRfe
	h98Q0xaTztU1AaaFUviLp5D7nbXNOBfTht2BTptAjhahwRoT9FMjCowRO2uaA8YieN1Q+klp8S782
	t6+l9aDhh61nYk115LhQ/Ns0yVP92Jtm9n4DiLyqvIgceNFHt3HX2/mqP1Phr2pv4lCK/MPES8buv
	BMnRGkUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUsEL-00000000IgU-0TJS;
	Sat, 21 Nov 2026 21:02:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUsDx-00000000IU4-3cx2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 21:02:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9801B459B5;
	Sat, 21 Nov 2026 21:02:17 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795294937;
	b=dmUfLDP0Fmnu1hI/Z6XGxF4Y9BTUDoZPwjeZ7ZZ3UR9+VEZzejz/T1twhsApS87vwv04
	 cAgmKLAI7evCWftAWkP73dfDuYotQXp2Tbv7mErpDGoL5fM+xkbkzUILmn11TvO0/TvBT
	 ZqzHKlKwh9avh/y0ZVAYmV+5VKqUfakUy2i16rtcVID1LA2kHO+PGbyA30ff2i4VPYyHp
	 XL4yKR9dCddV5hPvCsGrFgw8Xy6EhJPNqiY8CxDzTF9VTlA+2H1DqUD8Om/7k2Z+5yVz5
	 7W8iQzRFdAP074liTvaIort+aFXKyIyMkRkLbF4phE2fhV0JWfsgXs5gTLqjKLpttoA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795294937;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=La2K15nDGTc5QdvSUYADH/M3UC5c5ws+911+TdMxDuM=;
	b=LULoYJO71vY4OO2Z3CXIDoZ7nwzqw/J0ejPUbB3OWGrbG0JXo8Ra2Wh5gVdfc3iu00AN
	 6wb1hP5VTZRuFBDEHNGYuXffCvI8iOWI9ktw724EpaKiHrzwt2PJKByvf2rYZefPS6cr5
	 ufrkQvZBora05CQQ9OnoxuE3wqbK/xkQ/ShHWSMqN+Gh6YzfhEk1CZRUJsEJdHs/74Yaf
	 vARXL/Z1ihgXXzpmSZKplBqeuJycW6xmaflt0Y3cwqGvc9AQ+NTO9v1LUEjiIpg7Nw6mH
	 rfF+nct5VMHbFbQL7k3APSWf/RjK/BqL48VJZ7MygCUN1GUNg+pHrqGLo0o0qomzLLA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DEF351F000D2;
	Sat, 21 Nov 2026 21:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795294937;
	bh=La2K15nDGTc5QdvSUYADH/M3UC5c5ws+911+TdMxDuM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=YoDvZ9jKT3rilfKg9+ZzUqcJiC2ClE3ZfNOeuGmDkZcIsjfhBh2vWL6g78MOgw7ga
	 uNjjzgTGGbUZ5xvDcguM2SJQhc0PD16GgnU4FrwLgx0jcBAHhf3ESRpRI+3cWYR1zP
	 JQweXUPy9TitwdxNf6dH8anmO+voeUAvYE7iAajjIp34XL+PV9HCLgjpH2/W5T8PBS
	 eG8RNy/YE5CbuAyyLs5P3QubQ+Uizo20hTB7qyX70IsoErBRoEm2em4SD/Jd4HIlg3
	 Kkqvnrc7AeltrEcoSDq6hRzA9ilq/qzGz6xVjb0lmdCN/pMxPkVgk2ReziKRlMa3/b
	 ZCtpE/YArbF6A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3E1C04BDCA;
	Sat, 21 Nov 2026 21:02:12 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Sun, 22 Nov 2026 00:01:55 +0300
Subject: [PATCH v8 10/10] MAINTAINERS: Add entry for Cortina Systems CS75xx
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261122-b4-cs75xx-v8-10-5f971b0dc69c@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795294929; l=1124;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=Kv86vwete327NDTNam7eZzSsG2pJVcHBfV+Z7+P5PJ4=;
 b=T6gapxMc4xFsr7/3sTZXvWhELPnQ1tchYsr4K9QMYEetJB4wCQjf5XKc404fLs7AsmUDnmgoI
 lViaO9eBq4dCI5Cma4jw6qGwsysMF7tbAniD8wBnPkfoWnlZdbv1FoK
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

Add an entry covering the Cortina Systems CS75xx platform code, device
trees, bindings and UART driver.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315..deb2ca570 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2950,6 +2950,17 @@ F:	tools/perf/tests/shell/coresight/*
 F:	tools/perf/util/cs-etm-decoder/*
 F:	tools/perf/util/cs-etm.*
 
+ARM/CORTINA SYSTEMS CS75XX ARM ARCHITECTURE
+M:	Fil Dunsky <filipp.dunsky@gmail.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/arm/cortina.yaml
+F:	Documentation/devicetree/bindings/serial/cortina,cs7542-uart.yaml
+F:	arch/arm/boot/dts/cortina/
+F:	arch/arm/include/debug/cs75xx.S
+F:	arch/arm/mach-goldengate/
+F:	drivers/tty/serial/cortina-uart.c
+
 ARM/CORTINA SYSTEMS GEMINI ARM ARCHITECTURE
 M:	Hans Ulli Kroll <ulli.kroll@googlemail.com>
 M:	Linus Walleij <linusw@kernel.org>

-- 
2.53.0




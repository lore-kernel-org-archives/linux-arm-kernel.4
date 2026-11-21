Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE5A606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 21:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BzQOD7yI;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WQ1FapKF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vxTe7UYstr5zmWrUwGezYJ045qR2VI9dQROuNPPuSTw=; b=BzQOD7yIdKm4dEWx7ObF3C+H2r
	wFe/5Xif6hmnhz0YSWaJjsPj/rHM/vFURKNbaBbpQ/VWxPGMiuqtVjPPDi/joHuKmaG82PPV/ED9S
	Jdg01wo86mA/orD7hTibgXpinRURjXtQdIrhDb4awDgHhnLD8AZN6k4B7BVdMOuL5H9VYhfDuFBkV
	X1/f5q0WBMoMWQvlKkr2dC+YGQlFKJYRHgBXqSt2ppRvdJekaVTFIaLpgGi0+fcag9I6zNVYFyr0V
	ESG3j3UeAQfOhILtlSmpfcVLOMNXa7DBhUDm3PEulQFyc8h1Rbx0P6Kqm30xN0KKmzT8TkdGFFtIJ
	UCaWSbSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUskl-00000000MfJ-1FPF;
	Sat, 21 Nov 2026 21:36:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUskb-00000000MdM-22tu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 21:36:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DDA3B41221;
	Sat, 21 Nov 2026 21:36:00 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795296960;
	b=nA4hgaMVXPIbWJ34MNvgKLHmBpaGnHdu8eFGHUFvEf3mCLyfEtW8VEmGG96QfOd4Frnx
	 1UikhL0oWaArt5RiYKoMcP66yyuvSfoclwD7ykoSQAPyMs2XqE9orgjbCgc53vZbCKjcv
	 xF8WEkMnxEs0njnUP4L4sc0sXEy/Twv9z2Amr7t/ma5j5X3uO2MdotUhLuzk92xJM58mG
	 F5PwEsAxglYk1RA7Fxri4VAQ6DjJ29dDqLmLDLZDpkqBzVDtn7+uOxd7yiHK0CS4bBEwD
	 eFUKoi8swU6OTpcJE5edX5405cS8XCc7nn3ImfxfVeA7fkQLdqBiPCLrW00lO/eFJhg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795296960;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=vxTe7UYstr5zmWrUwGezYJ045qR2VI9dQROuNPPuSTw=;
	b=rg9SBj+zpNnSXoCYE619SqZYDcNRCP77uPEWCukU/vgvSvS+GKa2kolkLmop1lM1sJ17
	 n+AHohMBWfhmkM1iNuk44TqB6rPfOd1vXrYbaEqy80cT78xhyotIXGXOFhaB1tjz6PuvT
	 DExUIuS+mB4RNSilVbwaUgOUbEV5pYRkuDuZAekqCxo1xHqz7CdU2HFFcMjyssRn2SoqU
	 dP4X3m74PLM7nR5Sl3h58tQYXBT8ASax4kytpEQoeqCGNCnM85jSlwNycHFjbs8msSZzS
	 7p/Qn9T28J7Ab74YmzhoSjxrjoAkB2+tX8fBvI/lHYMjeEnj40zXQJXq1pFQ2TYxz5A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EC48A1F000C6;
	Sat, 21 Nov 2026 21:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795296960;
	bh=vxTe7UYstr5zmWrUwGezYJ045qR2VI9dQROuNPPuSTw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=WQ1FapKFFXkrKoT9Qp7+QbBvdJ3g5dgUP3HmqzDATvEVOajIA6pnch5/OzDzdqRDv
	 ntaf+yTXp6yI0ALbt+Udu/FVklgIQd+LJu+P6FDKm79FiBvwsD3j9jPJhwuR4OcqMB
	 MGG/MzeMa5AcW1zkiQU/42kes4q08Tr1RYmHusHJMCcujLb4i3JcJcXOO8zWNexWGa
	 A6MhsyyaMfWSidAkKB7Gr/FOqIi1atJVEEnIcm9kjomKYftREDCyoeu2qEOS3xWLQI
	 n/7bWrnZVPU+y/u8CFxx2rqig4RK1z/jZpKMX28+8ZETdgU/W6AdGgeryDKOmHxdyg
	 UKQlcfHSs48Wg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 799DE4BDEC;
	Sat, 21 Nov 2026 21:35:59 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Sun, 22 Nov 2026 00:35:46 +0300
Subject: [PATCH v9 01/10] dt-bindings: vendor-prefixes: Add Securifi
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261122-b4-cs75xx-v9-1-1fc1b90bd097@gmail.com>
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
 Conor Dooley <conor.dooley@microchip.com>, 
 Fil Dunsky <filipp.dunsky@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795296958; l=944;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=573roVKzdDYFuCfGNESYptLR9xpcGKVT07rDsXKZwOU=;
 b=qZV+7PsIoAs6rx65ELMjzNgCkSpGirEaRjILMSTf9jTg3fmA8MHitrZyiUJRwNoSlcJts6u57
 6bv24uB4uA5DJUuB9bb28Acp8yK9DTYLEUG4vxLHHIlv95HWdLryKBQ
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

Securifi Ltd. makes the Almond series of touchscreen Wi-Fi routers.
Add a vendor prefix for it.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5471a06f9..f1f764ddb 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1499,6 +1499,8 @@ patternProperties:
     description: SDMC Technology Co., Ltd
   "^seagate,.*":
     description: Seagate Technology PLC
+  "^securifi,.*":
+    description: Securifi Ltd.
   "^seeed,.*":
     description: Seeed Technology Co., Ltd
   "^seirobotics,.*":

-- 
2.53.0




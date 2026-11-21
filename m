Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8616606A33C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 21:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=22p9Ns+c;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Izspf0o9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2CbMbhj1YJKeMqmSmi9IRjYMrfEw9kWn4Z0tl8AznQs=; b=22p9Ns+cai9leV5IiV/x7vvocv
	SvVthPm3JlAFZibh7leCcDq/ehmauAeTelniFnUEK/Ej0uTulRF4dlElugmYMYF72RgVSpcaIMzji
	QM6X+YQnNEA51DdE8cHOXJ6DzxRbXewM/1jX668FEUID/xr0Dj32Z6o+flzBXYDtTG3S7kSLrR5FA
	TKKApcOsRya/SS7qo6FURtM3TGI+PvsLQMCSxxav8V9+EVcFNTshfsVaNpLPXKCtpuhOIcxhw5jt5
	h7MMyvyPOuiL2AfYb3957vgrUFutP/NdVMtwSYwsjpLAlfT4xtNrO9wZmkZPz54xR6RlYY6Erpffb
	taUKj75Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUsDu-00000000IQ1-1ipK;
	Sat, 21 Nov 2026 21:02:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUsDt-00000000IPX-1vff
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 21:02:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D5AA244E28;
	Sat, 21 Nov 2026 21:02:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795294932;
	b=01Fd03i+7cbGYx5Dk2MpwL83XwBLofBZC1+8uLgZs4WI9TrL3AP3YDKn2kUZDSP6b1aW
	 OcOI2Hn/LsgLbG84W/B4+SwOZmnaK4PSc4SFsDzPi0BJ7+LNhmS+dABdUk+o7azK4ZHGS
	 3kOAcq5hCDnoeguPVmizfxainuusfseUZZjvSusx/HU8v9plkqy3LVJj9dX5RsqESKs4/
	 aW3tOxGBxD4JBXXdAVGSpgj39mLIZc+nWT7yysE/qumfqmAoahTzUtXbWgqObn10nOlwe
	 XejiHKeBHpod9YAzEm5oEBbkQpLyI+gUikwy5/nh0Pqpa4ppOYrKrB3KPW5MyXkcUnw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795294932;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=2CbMbhj1YJKeMqmSmi9IRjYMrfEw9kWn4Z0tl8AznQs=;
	b=S8qJ7TJvZUXjPbFKEVhg1GXN1Nlg/UpzVfRX2kLNSVmjKB3ds/3U7fod3nA+scKppCW2
	 WJBjuf7S24yQ6n4dpdRvuX9KfL0k/gDBPMYKKTK/dj4TpLtEhBit4iuYYGyONl3rBj4e3
	 thchrqeTU1/918RnCGFdMlyH8B/tyo8noix+EDt6zEUqbdKyLz/s7cGhQZygJG4c65edN
	 fqNeMXYf9nfgQW1Fr60LlTGrRKZ0h27GfeI5CwgR/xb1OH7e6nZEJvtKoZdUIIYbxgDK3
	 l/wPv06eIF333KInbENsyYRVRdQYefR9umW3/py4cIQ4DCbi5Z1ahlTZa7fkm02UWAw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F264D1F000D0;
	Sat, 21 Nov 2026 21:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795294932;
	bh=2CbMbhj1YJKeMqmSmi9IRjYMrfEw9kWn4Z0tl8AznQs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Izspf0o9cXqN3/cjqmKZhouSyAvhjmeWymOitEVg5YZhSCxeeMS5z2s8g0BT4t4v6
	 RTyl2nooDkvttwtlsiiu8bryMNbANnRog+eKIfqsAihrA/09+eQKQ9Jo8RNZn+AnBy
	 szNmoYrbEbIDQDiuNmC5539MJwI+wFFmiKxPTnnjNlvUH2tQpfQFRMl+sPjCoYcZrv
	 bPTCtjiuQ538L4PzfMkE4Kpd1l6QutEbNYD2ZaSH1EUl3qzWIX0glgh1p2r0WV+5Ac
	 IEorPXu1ukACA2Vf0DsdzitZkReE+UATdjbY7gGJTjZgUAx/4559NvKUitwvXqPZ64
	 Iv1OJVdJqpljw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7EABF4BDAE;
	Sat, 21 Nov 2026 21:02:11 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Sun, 22 Nov 2026 00:01:48 +0300
Subject: [PATCH v8 03/10] dt-bindings: arm: cpus: Add Cortina Systems
 CS7542 enable method
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261122-b4-cs75xx-v8-3-5f971b0dc69c@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795294929; l=1316;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=2pJil7R2I4RJ4Qw+FGFzoukNOQ10CC3HjRA0bSlNdco=;
 b=WlY8b9E8AdITWV+qUKiaHmWpxXDiahKt/vuDbXxTP+x0kRNjzezMHzuI9wBdYuSScDBaa9Lvy
 hay6fojvmCQCSPcllPKNpS1oKa5yqQoMA7oQl8wTuKrbmtPetVpv2Wg
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

On the CS7542 the bootloader parks the secondary Cortex-A9 core in a WFI
loop that polls a global software register and jumps to the address
found there. Add the "cortina,cs7542-smp" enable method for it and,
as with the other release-address based methods, require cpu-release-addr
to point at that register.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 96136b70d..7a394c500 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -269,6 +269,7 @@ properties:
           - brcm,bcm63138
           - brcm,bcm-nsp-smp
           - brcm,brahma-b15
+          - cortina,cs7542-smp
           - marvell,armada-375-smp
           - marvell,armada-380-smp
           - marvell,armada-390-smp
@@ -484,6 +485,7 @@ allOf:
         enable-method:
           enum:
             - spin-table
+            - cortina,cs7542-smp
             - renesas,r9a06g032-smp
       required:
         - enable-method

-- 
2.53.0




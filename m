Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A0560A5BD4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 13:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Yptryr8m;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hpRRPaIM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2CbMbhj1YJKeMqmSmi9IRjYMrfEw9kWn4Z0tl8AznQs=; b=Yptryr8mAEERQmlATLLdbeVs87
	tT0yLbLBCdsNylYucPKEK5pSXRjr/6T6KT9AvcCGr8vezTs7LxszbgaC3MWlAUdTn0/6Ye03pfvcU
	OxkZruxgvQPOuhxONK9VcSpWKiad01KVSpe4qimCk0HHJ/LHWMqdNdcgwCopcUZ4KBtrdpt/EOAjL
	EAMdLhbUlXam0jUVnHaSqGRVtkI09hpJs+D8VWTpF6OHhPI1n+W3Q4/EfpOorextwMx3gxYhZWZC0
	leoPwUEasQZ/ucaLNP33ospYyn7+So1kZ307CS+pzW7JqUFSWsMRGQaRImcOs5tf7uQ4sgsj+R9gL
	+SHNwnjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSE0M-0000000G8nB-1IL8;
	Sat, 14 Nov 2026 13:41:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSE0F-0000000G8k1-1WUn
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 13:41:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 052F34348A;
	Sat, 14 Nov 2026 13:41:11 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794663670;
	b=uNf/TFz34GW/bhhRa6xbSS7o04zJzLYrbCQQnYpu4HI128jOEnCNI9c3YkuPpLMiax0a
	 qA6Bx7h24+MH+MVtqds1gC4TXEF6wsmaA4HXnGtp59IeqOOfGgdd/96jpPYo6WfpQ7Z0B
	 ma7v+zFf4y7jWv/clL0R4E7zyv3kd6Q91Eq+pSsxvlHD/06XzDuew18LmeN63NS/Nv/85
	 VEnejAIXdq9QS7Ccl1OAJ0eIk8ewQVjucjvVNw3rIO7PSH+1jNnxr6iHcgv1Pi2MidxuV
	 WfHKN/QVVGaPIpesb1Fj4gvWmLspNvekakvTaJu0cBqx2R6osnkAKdFFSI07IRYkhsg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794663670;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=2CbMbhj1YJKeMqmSmi9IRjYMrfEw9kWn4Z0tl8AznQs=;
	b=oOc1OJ5DXFUvU5gsO4Q83OXq0WFKh9LtW0qs30dSGDf50ovsd1VabeEJJCJ0sCukY0tf
	 lYRQWug4H3otgWAzSp7Lsi+HMhrFiwn4LMJM6z2DOI9PLSxwAGwFheB1jI/Razu2hJvcB
	 GnNwtBNy+qJCNR3vCE9Jn77pfXmKNg5beFY0cl1jSOhMnTOr4I+sHQck6amEthdSZJnTo
	 t/GvVujXhs6GT3rhdwS/hSNTb/WHTtypH/ACTDz6u4HLD5VV6Qpuonj4PDigOx5u3iO5h
	 90rS4w/Bh4yTiyy5rXKh4jrHHfyPa6a2KIaFoMAEtePu4SNkHYKuLmtb2vRhjYrn0FQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BED371F000CA;
	Sat, 14 Nov 2026 13:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794663670;
	bh=2CbMbhj1YJKeMqmSmi9IRjYMrfEw9kWn4Z0tl8AznQs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=hpRRPaIMlk9r/CBia6M6RhtWZ4G7XKLzgVqfuoH6pp+6+ADzNypw9366X2ag36prj
	 AhO/Drxy/X3VGW+/EhWC+PLb1ePS3f0ywX8E2bnVfBncqjBGAs5WOJdTvSoymYytoN
	 HSCc7+4Mi/swuhdaRtnc/sgNKb/QPQ9bM7ajgl9laa9COoj3XYAxNlO2r/VDoTitEl
	 oTap0IpbJuiYIFFWN45oM7RXdIhfxEcMe9c9xXhg8WOxqwFJgpwHacWwZ9rxIr0qmg
	 UZDLPDsqpfUiXEUTv6Z48uaNnzU6FLm6y7tl7hDf5dYMoMwFI5S1jHInarbZH78B2+
	 GCgX2H0iCOpaA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4904649DC6;
	Sat, 14 Nov 2026 13:41:09 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Sat, 14 Nov 2026 16:41:08 +0300
Subject: [PATCH v7 03/10] dt-bindings: arm: cpus: Add Cortina Systems
 CS7542 enable method
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261114-b4-cs75xx-v7-3-8f17f38821b4@gmail.com>
References: <20261114-b4-cs75xx-v7-0-8f17f38821b4@gmail.com>
In-Reply-To: <20261114-b4-cs75xx-v7-0-8f17f38821b4@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794663665; l=1316;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=2pJil7R2I4RJ4Qw+FGFzoukNOQ10CC3HjRA0bSlNdco=;
 b=LhjVsUSJfpA5SEdDtr/jVR3jXATHei5XGM/Yj2Z1OL8QzVf74eIl80tefXQ/3N7Zptld9HlSn
 KgYaJbpHi91DYEq7d0uf/dEMNYJYRusYFEdusX6vcMaRRWsZ0DW91pV
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




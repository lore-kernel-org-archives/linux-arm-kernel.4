Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80D0606AED5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 22:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zRFgyCzU;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bZGMYYR6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=jSZ/tjih5hHmj7xJU8RhvBRDAwsZICp5Fjl1qfyATP8=; b=zRFgyCzUskRMmtEKRNOgVBq5DM
	U2sQDRLxSWMbkvphyeRO6NcgjlujVENzLERa0MUjqSgdIiSOJJ00i+ycxnoGzEgrm7Lb2lvQn5IMq
	CoIzpedsNUMJHWlNnN3PGDlv3D1Q6GVL8dRhlVU0fErMh+1/Mqlh8gJ5OujPpLrchMvWTpSkaz8og
	DKnQwyg+q34w7AB8SV/BRrJen0VgkQg5kXezxTZq6zz9+0/Vnqc2iyvsMh4XZEWubpN7v4W+uzE3o
	RpwJ+wEFElxF5VruLR1VRyJwDRljR/GGWOLEinE/rWH6CyCXDeDAwRa3UpzkuhvQkFEmlbDknojq8
	8hpgWOPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRH2B-000000080Dj-13E4;
	Wed, 11 Nov 2026 22:43:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRH2A-000000080DZ-1Ujo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 22:43:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 15E4C45B1E;
	Wed, 11 Nov 2026 22:43:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC2171F00A0B;
	Wed, 11 Nov 2026 22:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794436994;
	bh=jSZ/tjih5hHmj7xJU8RhvBRDAwsZICp5Fjl1qfyATP8=;
	h=From:Subject:Date:To:Cc;
	b=bZGMYYR6ICYIXG4sVGzvCmAJ5cf5CEYiNJmVWUbh4xI8+btF/uN9c9JhFnthl2C4V
	 3UqQ3Wu+mqH75H9MYds+ChKVCtS3cjq7sZZJFQXU5rRSGXXyNVi8MBMvuKmlX35A+k
	 CZ+F6CSdrYI8oD4nt2qpq0cF85XF+MhhMVC6bUecncyDqnxlpaSMszUCrIBWi9V8k1
	 RbAlGYR5sNs93EFpeQ7KQ8e9pRGlsk8oawIAEWxDanjEHKmxyuS6Ex/bzBzakRPuSM
	 8R/XOCXy8d4iidubanz56TNblhz+JkH1okxRHjPwPdElBsaFlEVlWg7o8LsppRomk2
	 iTckEI2ouBJeg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Subject: [PATCH 0/9] arm64: dts: marvell: DT warning fixes
Date: Wed, 11 Nov 2026 16:42:57 -0600
Message-Id: <20261111-dtbs-marvell-v1-0-938788aff3ae@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMyw5AMBCF4VeRWWuiJYhXEYtqByNu6ZRIxLsrz
 u5bnP8CRkfIUEUXODyIaV0CZByBGfTSoyAbDCpRuQwT1rcsZu0OnCaRalTSlNpkhYVw2Rx2dH6
 5uvnNezui8W8D7vsBwqAgHHAAAAA=
X-Change-ID: 20261111-dtbs-marvell-3ae21c8ac47d
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Another batch of DT schema warning fixes for Marvell platforms. This
fixes most of the remaining warnings on Marvell platforms.

It's best if the whole series is taken together.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Rob Herring (Arm) (9):
      dt-bindings: mfd: Add Marvell AP806/CP110 system controller schema
      arm64: dts: marvell: Add AP806/CP110 syscon compatibles
      arm64: dts: marvell: Drop unused USB connector PHY supplies
      arm64: dts: marvell: Drop SPI max frequency
      arm64: dts: marvell: Fix node names
      arm64: dts: marvell: Fix w25q32 compatible strings
      arm64: dts: marvell: Drop unused USB 'phy-names'
      arm64: dts: marvell: cn9131-cf-solidwan: Drop st,m41t80 reset-gpios
      arm64: dts: marvell: armada-3720-gl-mv1000: Add switch fixed-link

 .../mfd/marvell,ap806-cp110-system-controller.yaml | 59 ++++++++++++++++++++++
 arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi      |  2 +-
 .../boot/dts/marvell/armada-3720-gl-mv1000.dts     |  6 +++
 .../boot/dts/marvell/armada-3720-turris-mox.dts    |  1 -
 arch/arm64/boot/dts/marvell/armada-7040-db.dts     |  2 -
 .../dts/marvell/armada-8040-clearfog-gt-8k.dts     |  5 +-
 arch/arm64/boot/dts/marvell/armada-8040-db.dts     |  1 -
 arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi |  3 +-
 .../boot/dts/marvell/armada-8040-puzzle-m801.dts   | 11 ++--
 arch/arm64/boot/dts/marvell/armada-ap80x.dtsi      |  6 ++-
 arch/arm64/boot/dts/marvell/armada-cp11x.dtsi      |  6 ++-
 arch/arm64/boot/dts/marvell/cn9130-crb-A.dts       |  2 -
 arch/arm64/boot/dts/marvell/cn9130-sr-som.dtsi     |  2 -
 arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dts |  1 -
 .../boot/dts/marvell/cn9131-db-comexpress.dtsi     |  4 +-
 15 files changed, 84 insertions(+), 27 deletions(-)
---
base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
change-id: 20261111-dtbs-marvell-3ae21c8ac47d

Best regards,
--  
Rob Herring (Arm) <robh@kernel.org>



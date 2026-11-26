Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FCF606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 00:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Caaqgf62;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X/i17b9g
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=xn0gH4NRspWRvkgQ/bHfnxIngpsuU+qZwOuCuvt5IeU=; b=Caaqgf62OxErNQrvfLS8Fk0uKl
	Xwg5jgZsXgi6xDjnwNZrV8C5H/cuzONemJVj/Q66O9ShZCB5OOJvRnNnUbZWbhzRYZTxuiC+DG8m9
	3lsfhwzJiE8qy02R57FOu69li+7ErYf/emm0NGpqjCCvHUo+2bZjoIzJsN/NHP+xNzAC+Z4uU1BIV
	p/x31Higgo7NKj9PLOVBgmnOKVJ52s1o9/EhNz7vFGAI++1fvkKfGLJwYjSIRzHB61LVZbaXPJbOe
	dwngPM5QPGoyvUeai25Tedht4Ob4AYOl7n9WzgNX9pZ6S+Zdi2z6WbVb5SycmrF5lWoi0jPi3KNvp
	+oMccKVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNU9-0000000BfQq-1ePk;
	Thu, 26 Nov 2026 00:37:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNU7-0000000BfQj-1Tyq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 00:37:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AC1F045ABC
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 00:37:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ABE41F000C0;
	Thu, 26 Nov 2026 00:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795653430;
	bh=xn0gH4NRspWRvkgQ/bHfnxIngpsuU+qZwOuCuvt5IeU=;
	h=From:Subject:Date:To:Cc;
	b=X/i17b9gquXUw3JeOO/3nMYp9ylW4qd4ndaHcTrWT6JDGhWz0ZD8VmH0Y1gPdYVye
	 DmmrkRKjMAuQ0m9Z7sagHDSOd2ulfzZFG7v7bM6H7Zf5QcjX7vVPg2CVKLIPXcAHT4
	 FukXLnVeXrfYXBVzTZEH9Eg/kZ8FGRKY4qbbRAd4wKllkd2MzkbRTjMEEphUJ7Zq7t
	 nwtgzLHLxmchQP+q5H0a0T+IpH2fuR+ieKiq3NrH07+j5+20C/tYugl1sj13Vbrxt6
	 8HxUfzVaevMETSG7142MG/FBK4OIm9T7P5rp6p3WHbMeS70NyS0jBbjYoWIHn7CSyl
	 eCGfepcSgoN/A==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH 00/20] Clean up Ux500 and Nomadik device trees
Date: Thu, 26 Nov 2026 01:37:04 +0100
Message-Id: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3MUQqDMAwA0KuEfBtoO+qkVxn7KG10+VgridsE8
 e4D3wHegcYqbJjgQOWvmPSGCfwAWF65LUxSMQEGF0bvw0ifPTpHdTPK88ZKa/+x1v7O0ozu5RZ
 9LmWKE+MAuCrPsl/943mef7LrpSxuAAAA
X-Change-ID: 20261126-ux500-dts-after-powerdomains-7c351acc858e
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Apply a series DTS cleanups.

Helped with an LLM.
In the age of LLMs there is really no excuse to not fix up this stuff.

There are mot patches but they require updated bindings to go in first.

---
Linus Walleij (20):
      ARM: dts: ux500: Give memory nodes their unit address
      ARM: dts: ux500: Put CPU cooling properties in a map node
      ARM: dts: ux500: Correct HREF thermistor and pin group names
      ARM: dts: ux500: Remove bus clock rates from I2C peripheral nodes
      ARM: dts: ux500: Use the standard battery chemistry property
      ARM: dts: ux500: Correct STUIB magnetometer supply names
      ARM: dts: ux500: Encode Sharp proximity hysteresis as bytes
      ARM: dts: ux500: Give DSI panels their unit addresses
      ARM: dts: ux500: Remove unused IIO channel inheritance on Janice
      ARM: dts: ux500: Fix SD regulator node validation
      ARM: dts: ux500: Correct GPIO key descriptions
      ARM: dts: ux500: Correct the PL011 functional clock names
      ARM: dts: ux500: Correct the STMPE interrupt pin property
      ARM: dts: ux500: Use valid I2C bus node names
      ARM: dts: ux500: Correct memory-mapped controller unit addresses
      ARM: dts: nomadik: Correct the camera I2C unit address
      ARM: dts: nomadik: Correct controller and clock unit addresses
      ARM: dts: ux500: Move the pin controller out of the simple bus
      ARM: dts: ux500: Move addressless devices out of the simple bus
      ARM: dts: ux500: Connect the AB8500 ULP PLL supply

 arch/arm/boot/dts/st/ste-ab8500.dtsi               |   1 +
 arch/arm/boot/dts/st/ste-dbx5x0.dtsi               | 146 ++++----
 arch/arm/boot/dts/st/ste-href-family-pinctrl.dtsi  | 369 ++++++++++-----------
 arch/arm/boot/dts/st/ste-href-stuib.dtsi           | 151 +++++----
 arch/arm/boot/dts/st/ste-href-tvk1281618-r2.dtsi   | 136 ++++----
 arch/arm/boot/dts/st/ste-href-tvk1281618-r3.dtsi   | 110 +++---
 arch/arm/boot/dts/st/ste-href.dtsi                 |  19 +-
 arch/arm/boot/dts/st/ste-href520-tvk.dts           |   2 +-
 arch/arm/boot/dts/st/ste-hrefprev60-stuib.dts      |   2 +-
 arch/arm/boot/dts/st/ste-hrefprev60-tvk.dts        |   2 +-
 arch/arm/boot/dts/st/ste-hrefprev60.dtsi           | 109 +++---
 arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dts     |   2 +-
 arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dts       |   2 +-
 arch/arm/boot/dts/st/ste-hrefv60plus.dtsi          | 363 ++++++++++----------
 arch/arm/boot/dts/st/ste-nomadik-nhk15.dts         |   4 +-
 arch/arm/boot/dts/st/ste-nomadik-s8815.dts         |   6 +-
 arch/arm/boot/dts/st/ste-nomadik-stn8815.dtsi      | 152 ++++-----
 arch/arm/boot/dts/st/ste-snowball.dts              | 363 ++++++++++----------
 .../boot/dts/st/ste-ux500-samsung-codina-tmo.dts   |  13 +-
 arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts  |  14 +-
 arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts  |  16 +-
 arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts  |  18 +-
 arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts  |  19 +-
 arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts    |  15 +-
 arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts  |  15 +-
 25 files changed, 1015 insertions(+), 1034 deletions(-)
---
base-commit: ce2efbd2e360243deaf4b2a7502714da1a50d06d
change-id: 20261126-ux500-dts-after-powerdomains-7c351acc858e

Best regards,
--  
Linus Walleij <linusw@kernel.org>



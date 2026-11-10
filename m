Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D176E60A260B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 10:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t3VhA4zd;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=PL6ZBxnG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ASLqw2WGbahgy28JlRBtOez+HQ1G/chLD0+bBWmi0SE=; b=t3VhA4zdBh1tU+AU4QvtYY1ppw
	iO0X3V0SWm4ow7ocAXSW7FVi8pj6E8mHwj6I/IUj7TpWcnPv1wmFuNB1oyITb0Mh+zykDZoTFItz3
	saKP2l338T4JJR+oVhVxwduWfrcer7BzL3eaS8hkWs5BZppg9yoiHiEDd8CwiY4eaNFvhKPs4CfQL
	gDCzUM9AGAMfDt/2V22FFNGJUzxRMBHytpDlzs2+XNd1omFxKSHHWcq/DCeZwNHbzRYTbqBsWPjjT
	VPpVGULHscTP0iVKT9s3KQtAYvJ7ly22fE3HP2+gfDH30jIl47/VBWiCfawVsWb/NvHsU07N68PFC
	1yPX+ohA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjO8-00000003Vzq-2aBo;
	Tue, 10 Nov 2026 10:47:40 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjO0-00000003Vvo-2HLU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 10:47:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:To:Subject:From:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=ASLqw2WGbahgy28JlRBtOez+HQ1G/chLD0+bBWmi0SE=; t=1794307652; x=1795517252; 
	b=PL6ZBxnGMsbDjxHqxEi/dPk36avZskGCmMXtTogsqDLDYWjMqNcl5Ky5iPByjrbGFJOcUQlqpL5
	xJOdaJ9bRbIrKiIXtA3hGDnrtZjAJQknMAAonHfd0Xy0hiCkdq0gOPrTIdT4Co+GxChJlqwphVaim
	mhjMo1DAtBw7kJ3G4yIJu4G0u11iIdsiRyCxbrPMAIm1gttwkVcbLGidMC59++URqNRbUQgMNGhng
	wbMrG97meyka1ftwrofCZstrlzuYCGN14iWKtBOttHnwpL4ximYelBVE+z+C6IEN3lfqTHRjYEQUL
	/bfQZ787/6dxqGKaHEUnlrWj5jRbJm3CoGiA==;
From: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH 0/3] ARM: OMAP2+: Convert OMAP3 I2C to ti-sysc
Date: Tue, 10 Nov 2026 11:46:11 +0100
Message-Id: <20261110-i2c-sysc-v1-0-8945eb1d38f0@kemnade.info>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPP18moC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQwNL3UyjZN3iyuJk3UQDEwsTA8vElBTzZCWg8oKi1LTMCrBR0bEQfnF
 pUlZqcglIv1JtLQAhbNcQbAAAAA==
X-Change-ID: 20261109-i2c-sysc-a048409add7c
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Paul Walmsley <paul@pwsan.com>, Russell King <linux@armlinux.org.uk>
Cc: Sicelo <absicsz@gmail.com>, linux-omap@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Andreas Kemnade <andreas@kemnade.info>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=openpgp-sha256; l=1855; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=UpJFh3PoDVLDvH5ZyfVZJskuEuyBbcLwqnc8Mv+3bBU=;
 b=owEBbQKS/ZANAwAKAYRhRfpAKNzxAcsmYgBq8vX1gYnY6WBKpOV/s0cKqWQ+BblbUs9VGyvUi
 UXRkWqdBDeJAjMEAAEKAB0WIQTY6xCZL0TEE1XHfFiEYUX6QCjc8QUCavL19QAKCRCEYUX6QCjc
 8asFD/9N28I5MAn+G62R1raiCjybOhvk/9jzVVtTBSX40orXPAP3slpGKAtFJFNMOAqOymBMozO
 bVNdQxzXev87w4+vrKANxmX4Yz/w0Gy+QxqxK615EHpGBAVZFhqvfPdkDBrlXIdqimkkXYj3tIM
 80FRftdpcETvd0ixPhHXSIYKllbVVdqpRoN+eMcKBxfiZ+uTCX+unjAqwagz+1xUIyBKsmpNcmr
 D4Na4hmyh+m4waUJIaYIDV0vk8GqnDqDV0KFTCUWZliGbAxVBhX6wCZs+xnATyjT/RBgFDH5AL5
 0BbDowYCWnVRkDuo2FMWJFuIQ1I67VYQAyxIIWra9a3d57Edw0luOfcPXUxhIozUxDftSYpZ+Z8
 OVs5Cx5xPpyxIiC+WVxIGvsazunnP+y5d3OH+qzTkLpYAcV3TqPbFL+XqQz3YZrAhF3g9O4mKfA
 hvlch33UPXzavQoRWSRp7GAPaRTyG7dsgBoZYCEwFabaD5m+y5Y9Ys3B9lxQC0wZEBKjXIMA/7e
 Th+trVdQy5aSyvDiCUs1UZ4YfNRMgDw8CS3WNu9v4ZnscdRVSe23LkM5aJtRtj+hI0NylH6LCHR
 Nwn3Zz5gRfsAV1UgUkvOE+b2tqk2jdGu4HN12opa1plFphoJt3C0f0T3q3fJioUG7cZEiQ/Ysq3
 u8TDixS37Lcx/Rg==
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_024732_587776_45BD7585 
X-CRM114-Status: GOOD (  11.71  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

During suspend on OMAP3, I2C suspend oopses. This is a longer standing issue,
in the past I mostly tested runtime suspendidle behaviour on that platform
(including uart autosuspend). A change in the I2C driver fixes some corner
cases in pm for ti-sysc based systems, but breaks systems using the deprecated
ti,hwmods property. 
To avoid that maintainance overhead, convert the i2c definition
First fix the I2C quirk needed for these older chips. OMAP2 stuff
is not touched due to its planned removal.
After OMAP2 is removed, arch/arm/mach-omap2/i2c.c can be removed, too.
I may try to check again if there is some safe fix in omap_device.c
but changing things there has a very high chance of unexpected side
effects.

Handling the commits:
In the past (e.g. around commit
42a79edd4a3dc1bb8e89fd2849f9e8e1e1c13977 for converting musb to ti-sys)
these changes were handled through a separate branch to keep them in
order.
Here is a hard requirement of the order. Patch 3 can most easily wait
but having patch 2 after patch 1 is a hard requirement. As the
affected devices get their devicetree updated with the kernel,
that should not hurt too much.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
Andreas Kemnade (3):
      bus: ti-sysc: fix I2C quirk for OMAP3 variants
      ARM: dts: ti/omap: describe omap3 i2c via ti-sysc
      ARM: OMAP2+: remove i2c from OMAP3 hwmods list

 arch/arm/boot/dts/ti/omap/omap3.dtsi       |  96 ++++++++++++++++++++-----
 arch/arm/mach-omap2/omap_hwmod_3xxx_data.c | 112 -----------------------------
 drivers/bus/ti-sysc.c                      |  19 +++--
 3 files changed, 91 insertions(+), 136 deletions(-)
---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
change-id: 20261109-i2c-sysc-a048409add7c

Best regards,
--  
Andreas Kemnade <andreas@kemnade.info>



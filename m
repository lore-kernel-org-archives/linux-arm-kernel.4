Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424D9606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 13:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=K8zeP0xc;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=mLpvQ6rZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=0qNRbsSam6uMz1bB2zIu/O5SW5C6QVHg6ITH+0RRZ6w=; b=K8zeP0xcfZn3H1HZk2Y2HBxjQB
	W3raKiiryXK5PJDgusAt6mna7ckVEuflaxu6/iANMcxDDZS3nnZMNS3DzEI8qlVJtlhP4+sRyArd5
	pAVkC0WFPJ7mp52SKCfD25zfC9dHyw3J0PoYRFQhD2/oVru725SLpwU7OjzSKANRmrlOzcDvdlSvW
	KjEpoFt/6NHArCk0siL4mq5jZJLoFnTnIo4RU1no9PgGr1ZmxkIWBU1ikKj2gMZb1bCOEH/tTV7wv
	HLsLI+hCap3Tn0V7jtKTGlwjjebbijmyM+/czsZyZBrxzv3SiA8AbhgJfsxkkFeL3d8fEeWQlrAxa
	lW4H2xUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCnB-00000009wYh-3wIj;
	Wed, 25 Nov 2026 13:12:09 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCn9-00000009wX1-1QWK;
	Wed, 25 Nov 2026 13:12:09 +0000
Received: by chaosmail.tech (Postfix) id 6D4DA1C84A7;
	Wed, 25 Nov 2026 13:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1795612316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0qNRbsSam6uMz1bB2zIu/O5SW5C6QVHg6ITH+0RRZ6w=;
	b=mLpvQ6rZuIG1kXE2m8uVZDPO5SDV7Qwzkir60q2RouAiSs/bHT54Az3iRjzn4+gI1nL7l/
	dAqE6xYyLbq46hZJRXATbPmdoS17Y50xNs9ACOfQRacVZtI27QyhxkUTH/eGMzJBWq7f0D
	KgTFXaHxD3u4NAZr6PaVoFaP1brn8bA=
From: Sasha Finkelstein <k@chaosmail.tech>
Subject: [PATCH v3 0/5] phy: apple: atc: Add M3 support
Date: Wed, 25 Nov 2026 14:11:44 +0100
Message-Id: <20261125-t8122-phy-v3-0-196e20b3537e@chaosmail.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/22OQQ7CIBBFr9KwFgODVXTlPYwLmIJgtG0KEpumd
 xfqpokuf/Lem5lIMIM3gZyqiQwm+eC7Ng+xqQg61d4M9U3eBBjsOWeSRskBaO9GqlHwI0ONFnc
 k8/1grH8vrcv1u8NL3w3GEiiE8yF2w7gcS7xw/7qJU0YRDlJoULVQ8pw/6cJT+cc2GnSkxBOs9
 CyudMi6bGqUtrGCa/Wjz/P8AR+YnPD4AAAA
X-Change-ID: 20261108-t8122-phy-bc3190cbcfc4
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <k@chaosmail.tech>, 
 Ramzi Abdiche <abdicheramzi@gmail.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795612315; l=1826;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=waPGOD2xSosSdMrFUP3y7HhHynHugsWaholoSPFixrY=;
 b=sjkcCppqltoziHPpY4ybetWs9dkRwRu2hG/yslTXTJtiZEoPtSk2ql6IGNZw05qoAoQwgfiKs
 fFa11zLRTplAevaek/wayozmqyKnCKtDfO+WvEtxDhDyi6zP4Gf83B7
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_051207_681467_A6E5F4F3 
X-CRM114-Status: GOOD (  10.15  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The M3 series introduced a new Type-C phy. Add support for initializing
and configuring it. This is one of the puzzle pieces needed for
USB3/TB/DP support on those devices.

To simplify the merge strategy, the device tree entries will be sent
in a future patch series.

Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
Changes in v3:
- Fix a git surgery fail
- Fix reliance on transitive includes
- Sink defines into .c files where possible
- Merge atcphy_dp_ops into atcphy_hw
- Link to v2: https://patch.msgid.link/20261122-t8122-phy-v2-0-8d5c8fdf31ba@chaosmail.tech

Changes in v2:
- Split atc.c into generation-specific files
- Improve error handling
- dt-binding fixes
- Link to v1: https://patch.msgid.link/20261108-t8122-phy-v1-0-c2783b2a53a8@chaosmail.tech

---
Ramzi Abdiche (1):
      phy: apple: atc: Add T8122 DisplayPort support

Sasha Finkelstein (4):
      dt-bindings: phy: atcphy: Add M3 series
      soc: apple: tunable: Allow passing NULL to tunable_apply
      phy: apple: atc: Add initial M3 series support
      phy: apple: atc: Split generation-specific code

 .../devicetree/bindings/phy/apple,atcphy.yaml      |   9 +-
 drivers/phy/apple/Makefile                         |   2 +-
 drivers/phy/apple/atc-t8103.c                      | 273 ++++++++
 drivers/phy/apple/atc-t8122.c                      | 713 +++++++++++++++++++++
 drivers/phy/apple/atc.c                            | 654 +++----------------
 drivers/phy/apple/atc.h                            | 340 ++++++++++
 drivers/soc/apple/tunable.c                        |   2 +
 7 files changed, 1443 insertions(+), 550 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-t8122-phy-bc3190cbcfc4

Best regards,
--  
Sasha Finkelstein <k@chaosmail.tech>



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742CA606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 12:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1Dl4uhrg;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=Id7q+mJq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=GhoiZszjuN3w5Fm2hunWOX+0BVs+t5B3J+oM03hF67o=; b=1Dl4uhrgfVVWP8z5nF/xRFPLY2
	AQfuWf+CmMEXvv463VT2+9XwQ/dvJwFVLlLKNl40fN8zFrvfv7l9ARJr1mh7M1d6RglhsejtD4cTB
	ZLJNoEtlQtJBSOqKBlFqd8pSJZpbyN7N2QCSzyoM2PeiKAH4UWA9k0cjRzLTHTYGjqTZOE0QBD10u
	GmeWqD5Y5cIpj1asPZBOP9BjTBXPEno1rmXk1w/MCgKlaE8G3uuAbzdmkMixlMNxLUXoBFaVQgpI7
	NCZlGOMp4wfEfI6mwRzkUNEV1ehJ7fNMQAXJW8EXV2eMOm3WfkoN06PYt3MNRAy+RBQuZe60O0kB4
	8L8mcTQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV6h6-000000015N6-2Ayy;
	Sun, 22 Nov 2026 12:29:20 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV6gn-000000015Fy-0wzZ;
	Sun, 22 Nov 2026 12:29:04 +0000
Received: by chaosmail.tech (Postfix) id 801BA1C89FC;
	Sun, 22 Nov 2026 12:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1795350537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GhoiZszjuN3w5Fm2hunWOX+0BVs+t5B3J+oM03hF67o=;
	b=Id7q+mJqZxDW2IhhC6HjWCrhNpLobSTWqg2N+isLR4+23AAIfcxqeH9Fsecwyq1v9gz6Mn
	OVZF+yjOjaJ0Hs7IdtfAyJBQTyLjQsSG8ozzVunHMS2k6HphgW0InzExdj9FXFQl/tfv95
	zIwvmbOzW+iZg+Q2rApP2yrIFQ7KT/4=
From: Sasha Finkelstein <k@chaosmail.tech>
Subject: [PATCH v2 0/5] phy: apple: atc: Add M3 support
Date: Sun, 22 Nov 2026 13:27:56 +0100
Message-Id: <20261122-t8122-phy-v2-0-8d5c8fdf31ba@chaosmail.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/22Oyw7CIBBFf6WZtRiY+kBX/ofpAsapYLRtAIlN0
 3+X1q3Lk5yceyeIHDxHOFcTBM4++r4rgJsKyJnuzsLfCgNKPCgltUhaIYrBjcJSrU6SLLW0g+I
 PgVv/WVvX5sfxbR9MaQkshvMx9WFcx7JavH/drIQUhEddWzT72uhLedLHl/HPbWJy0Mzz/AX9b
 uEJuQAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795350536; l=1567;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=Kp01ycWuzoptDIrN7MNAH0bHYDa+M7xuLnzw7lbLukQ=;
 b=mwixH2Ozb3tFta2KKHNovxiS6mmnM39VueS4b6Rb4yJe8pkvZpnXq3bUc+MmuS25VTdYXXFFU
 xvLpJxqeEkNDVppqf/mMJ5IhIjJxyt71j0dekZBwJTGH57JFgQ8u3dm
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_042901_805093_10453B42 
X-CRM114-Status: UNSURE (   8.79  )
X-CRM114-Notice: Please train this message.
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
 drivers/phy/apple/atc-t8103.c                      | 215 +++++
 drivers/phy/apple/atc-t8122.c                      | 588 +++++++++++++
 drivers/phy/apple/atc.c                            | 938 +++------------------
 drivers/phy/apple/atc.h                            | 806 ++++++++++++++++++
 drivers/soc/apple/tunable.c                        |   2 +
 7 files changed, 1726 insertions(+), 834 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-t8122-phy-bc3190cbcfc4

Best regards,
--  
Sasha Finkelstein <k@chaosmail.tech>



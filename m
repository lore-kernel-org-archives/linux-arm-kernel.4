Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD738606A7C1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 13:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N5zM8av4;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=TybdMyS+;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=eiIRDV+n
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=zgFy5CRU+XIEddtxlRjTVtKMgKJt4RlY9Vj0+4wHiFw=; b=N5zM8av4wu3Z49x2CsILKBtW0B
	mJBjdpyNopQOwjjid+NyMiiWpqIW5bDF3h4z/vEfqiG2taw7OHsmsRvLl/C3H/ey+OaN1mTI1e+aw
	hXOGFthuREGHDrV7yyR9mUuQ0S349LB55e27kpJH9KS1hTIQYxr+qfrcvWBLSsxJ+sX0GbxB5gOvF
	lu0uJtSQQYQaHarYM2FHdgBPldknUBaHMG41HFZDCKxh9yEKCcrbXJidUejsCptiF+haz6PeIKgYo
	k/9tUGUz5j7z0TrmfTwu9a6XQFXKWaQpp2VO+tHBzMLfUQVDn4TBtIGtve7mz1G1ZsjtyUVt+FUyL
	PNIGs4Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlT0-00000003wo8-1lAD;
	Tue, 10 Nov 2026 13:00:50 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlSi-00000003wev-2q7N;
	Tue, 10 Nov 2026 13:00:35 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794315627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zgFy5CRU+XIEddtxlRjTVtKMgKJt4RlY9Vj0+4wHiFw=;
	b=TybdMyS+dGCtkhFrs2Zd47nnOifCjECWnjdfDq0JHrwrC1a81Y4OMzcQcz+wbFpKKK0Rts
	delxSHrLjYCowMCO0QJ9uFoMxB4Nj44TtEyhmIZwLEKejSkgUxfNXqC61W3295Cx5pslVk
	71MKlH6Wv1k6znQVEPeYqpNK9IIMTK39ZgQITGZiY2+4Db5BEBBUFxP5+w2Q+h5uYCsEBJ
	IAh7/5cC6C0RPQiSTn1asc2lIWI4YnKopX7A//I+HkWIAAyvyzRGKQRQb99NX0D3bzMeig
	2GAWkMlX+ZH3FfUfxC4e0ehk6o9E85rEtaNPs0MXEpt37trrVx1RbzzFe/bA1g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794315627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zgFy5CRU+XIEddtxlRjTVtKMgKJt4RlY9Vj0+4wHiFw=;
	b=eiIRDV+noTXYxAKPCBb5NG0tGgSUMz5FcdAPiLRfQ/J2+jUE+mnuJ7cEgqrzlJ2JOpNieO
	gWvqQPcgFp03YuDQ==
Subject: [PATCH v6 0/5] firmware: raspberrypi: Add support for the tryboot
 mode
Date: Tue, 10 Nov 2026 14:00:10 +0100
Message-Id: <20261110-rpi-tryboot-v6-0-56f680ef4734@linutronix.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFsV82oC/23NQW7DIBCF4atErEs1DBhMVr1H1YUNQ0NV2REmV
 qLIdy+4alNXXj5pvn/ubKIUaWLHw50lmuMUx6EM/XRg7tQN78SjL5shoAaNkqdz5Dnd+nHMXKF
 FZ7EHg4YVcU4U4nWtvb597+nSf5DLNVEvTnHKY7qt72ZR737KelOeBQeuLPTCKaesgZfPOFxyG
 od4ffbEan3GP17C1mPxQbcevdNdh2bPy4c3YLZeVu+7FgMZ8kbvefXwFtTWq9UTtb1rZAi7/5t
 fLwBw65viNVrlhBTUtPK/X5blC78SsVC8AQAA
X-Change-ID: 20260623-rpi-tryboot-4292c92b0727
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Eric Anholt <eric@anholt.net>, 
 Stefan Wahren <wahrenst@gmx.net>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794315627; l=2394;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=+wl3d1TUuvEjVn7H52ib0UWFJ+5y1XGeyNy6URPLGGU=;
 b=mvz2dPsl54Dm9gIsFUMbKM/p47nd//BlAN/wQbmKYxuHpzsj3g0qWh8GY30eeLdoxL6mzZJ0z
 TSoV0vkTQffAl54NeMBezslJRBdakAfR2oqdq6C2+uAFQHEztNqFu1Z
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_050032_871772_36B900C4 
X-CRM114-Status: UNSURE (   7.65  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.4 (----)
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This adds support for the tryboot mode on Raspberry Pis. As there is no
documentation other than the downstream implementation [0] the
implementation is based on this.

Tested on Raspberry Pi 4 and Raspberry Pi 5.

[0] https://github.com/raspberrypi/linux/commit/eb56da0c1925c07e8929ce4c9fe8aeafa7cb8c7b

---
Changes in v6:
- Rebase onto v7.4-rc2
- Link to v5: https://patch.msgid.link/20261002-rpi-tryboot-v5-0-6294c131e583@linutronix.de

Changes in v5:
- Added patch to add reboot mode to Raspberry Pi 1-4 devicetrees.
- Rebase onto v7.3-rc5
- Link to v4: https://patch.msgid.link/20260904-rpi-tryboot-v4-0-fdee8bc53ff7@linutronix.de

Changes in v4:
- fix use-after-free error by moving devm_add_action_or_reset before devm_add_action_or_reset 
- Rebase onto v7.3-rc1
- Link to v3: https://patch.msgid.link/20260707-rpi-tryboot-v3-0-fda82fe7ed76@linutronix.de

Changes in v3:
- fix use-after-free error by using devm_add_action_or_reset
- ensure endianness of magic byte
- refactor reboot mode registration into separate function
- Link to v2: https://patch.msgid.link/20260630-rpi-tryboot-v2-0-f68d2dc6aa27@linutronix.de

Changes in v2:
- Remove unnecessary reboot_mode_unregister().
- dt-binding: restrict to mode-{normal,tryboot} and only allow 32bit value.
- Link to v1: https://patch.msgid.link/20260626-rpi-tryboot-v1-0-490b1c4c4970@linutronix.de

---
Gregor Herburger (5):
      firmware: raspberrypi: reorder rpi_firmware_property_tag enum
      dt-bindings: raspberrypi,bcm2835-firmware: Include 'reboot-mode.yaml'
      firmware: raspberrypi: Add reboot mode support
      arm64: dts: broadcom: bcm2712: Add reboot modes to firmware node
      arm: dts: broadcom: bcm2835: Add reboot modes to firmware node

 .../arm/bcm/raspberrypi,bcm2835-firmware.yaml      |  9 +++++
 arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi        |  2 ++
 .../boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi    |  2 ++
 drivers/firmware/Kconfig                           |  2 ++
 drivers/firmware/raspberrypi.c                     | 40 +++++++++++++++++++---
 include/soc/bcm2835/raspberrypi-firmware.h         | 22 ++++++------
 6 files changed, 62 insertions(+), 15 deletions(-)
---
base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9
change-id: 20260623-rpi-tryboot-4292c92b0727

Best regards,
--  
Gregor Herburger <gregor.herburger@linutronix.de>



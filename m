Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CC1606A325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 06:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kjyfDFMk;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QKLEtSDs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=fphJrXwqi5waN4URtgt47m703CKnWB5bi67O2O8Dy5Y=; b=kjyfDFMkdSVoKkQXO/fud30FfG
	eQgwSmWtVEEgkYDYSGkSJYyL8Vx9A2zZJzkWqxBxClWB9rdJ05GCANhvy0Fywa78WVA1UEu5MMX26
	VdN0y59QJLqDZUhwhZROMstpbMu9AAlHpg8r2x2XsyvB6rDZ6P2RBa53mJsp1RZgOMhJyaC6YQJ6k
	M080Kg3kiq79GcQhRt7VfeX5vXHntO52NBWAVZtKaf5jy5w0zctk79iTdis3v+M4GrkJCXlp0s9S0
	iGf0F90qImt5tjBrRXd6bO/1OLWeetzl97LxwiupQoI2hBYWqKnY2hvEfrPc5S+QgYKmIZ9mkFYyM
	7GtTOUUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUIS1-0000000EBSe-0qI7;
	Fri, 20 Nov 2026 06:50:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUIRq-0000000EBPb-0UH5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 06:50:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 14AE662128;
	Fri, 20 Nov 2026 06:50:13 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795157412;
	b=coaoxvRvP6/zLSrp0TiShijTth3Apf0bDDoR87VccLR+VcrEJ4YWIMj9Bn1ZK17t5FaF
	 uBF3h82KbxJWHA5e5QY/IW6XjG+UhGSLVPt/nKhBFpxvbD8j4PKcW9UaN7ZA7hrcLuRh0
	 u8HpWyx7ui9E5FjEEY3U4DzHOtU/zTdSgGf3uymt53qgd6mtyRFVOWj8Mxt2h+IXDn9kA
	 KoLrBAW9n8qEApdaQrti2fjbHa+HRh0m0rGkoytlzU+DFGnzbgpL20I7VQFbqRNzGnZ8c
	 9QS2QMOsyWsiOfUL9xEO6OKkWajzj+gm6jRl0JBf6/XXKNpu7eWASNoaLHTCWe/VURA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795157412;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=fphJrXwqi5waN4URtgt47m703CKnWB5bi67O2O8Dy5Y=;
	b=cBhgP58wwTuN2KbXT4PY+1fmvMDsZTLsW7VR2EoSU22qkOkbgdztRCWVLIU+tVqlmQr9
	 1gTtTUPlQlBsr5ZI5dxj9DRENIquvTakotnXbsgj576Lwm9qwc8elZx47ldL54FxryVRr
	 ekC9NcqRgH8w9eixXX9s2yIaKmk27FcWz0Ygk/xNbF92chPiamHOifsWe2EYobuNbJQLb
	 MBgFpknpoTRk21Dkh7YKQc5e+JwyOggnCYMYKYWkbYwYTKxp6q7HMaLrpK8/vCVQrwH6X
	 28gacXUOXNNR2qzNHsIDFXjYRBwPOkLnuOa7+Tovufu5+FvP/UGTu5QTF/XAuPrx89Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 94E601F000C4;
	Fri, 20 Nov 2026 06:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795157412;
	bh=fphJrXwqi5waN4URtgt47m703CKnWB5bi67O2O8Dy5Y=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=QKLEtSDse56JwztLXruD5t9DcWAdS1VM7Av+EOzXMCT+lYPkmBUzM6wuDoFIC+YpN
	 h2n0d9uXgctg7j/lGx5iYvfPTERWm15MCV+sDrgZ21PSyherj1Xd7Am9i53t7iyx0w
	 SdvEV3sPWcAc6PlOw5tyFYLEUN9n/wmw3d5zdIsgYQ034ShNz3lYxmPvYd644Ilz+X
	 4/k0lZOd6aNtTuFX8KaoPoJA/n1c/NTQxJ69XG8ldcy+P/XCaoN2wJKNTYC0rbiDIp
	 cB6XYBaE8fqoH6CtfQ4MnltHGBJMmV7Hnri9g6M8KDFMMOfyXjHFmuJKjY6DPHlq+r
	 o7xKmcFyxN8MA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 269424971D;
	Fri, 20 Nov 2026 06:50:11 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Subject: [PATCH v5 0/2] i2c: Add Cortina Systems CS75xx I2C controller
 driver
Date: Fri, 20 Nov 2026 09:49:43 +0300
Message-Id: <20261120-cs75xx-i2c-v5-0-03bec242a549@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1WNyw6CMBBFf4XM2pq2tjxc+R+GRSkjjBFqWiQYw
 r/bwsrlSc49d4WAnjDANVvB40yB3BhBnzKwvRk7ZNRGBsllLrjQzIZCLwsjaVmlVCsLeRGNshA
 Hb48PWvbYvT44fJon2ikVktFTmJz/7m+zSt4RFv/hWTHOVCNyRFOVpihv3WDodbZugHrbth8+p
 SCytgAAAA==
X-Change-ID: 20261015-cs75xx-i2c-944d27231b4c
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Fil Dunsky <filipp.dunsky@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795157409; l=4213;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=ZF8nx2IQ8HACgl8vWRQJt54cQk/RO3BGOD/Pq4aDOZA=;
 b=6oa3JGk5fIR6mAcJu0RKPtFyuHbAaLULpX5OSj8xkLuwa4CBuCnPRVzcVgcf+iS+4yxMXlPb8
 R1Uiwjopm5lB3Wm13FyXEM32t/PIakcJNY3ZsKv06EJJVHNWy0keOTR
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The I2C ("Bi-Wire") controller of the Cortina Systems CS75xx
("Goldengate G2") SoCs transfers one byte per command, with a command
register much like the OpenCores one, and raises an interrupt when a
command has completed. This series adds the binding and a driver for
plain I2C and emulated SMBus, without quick commands (every message
carries at least one data byte) and without 10-bit addresses.

The driver used to be part of a series with the interrupt controller,
GPIO and watchdog drivers and the device tree changes. That series is
now split per subsystem. The driver depends on OF and HAS_IOMEM and has
no dependency on the platform series [1], which is under review
separately. The device tree nodes will follow with the other CS75xx dts
changes once the platform is merged.

There is no public documentation; the register layout comes from the GPL
vendor kernels. Tested on a Securifi Almond+ (CS7542) with the SX8650
touchscreen controller at 0x48: reads are ACKed, an empty address returns
-ENXIO without timeouts. The v5 late-interrupt change was checked with a
host regression test of the transfer state machine; it has not been
exercised on the board. Repeated START between messages has not been
exercised on the board.

[1] https://lore.kernel.org/all/20261114-b4-cs75xx-v7-0-8f17f38821b4@gmail.com/

---
Changes in v5:
- replace the dependency on ARCH_CORTINA_ACCESS || COMPILE_TEST with OF,
  retaining HAS_IOMEM, so the driver can be merged without the platform
- build built-in and modular on ARM and x86-64 with COMPILE_TEST=n,
  without the platform series
- ignore a late interrupt of a timed out transfer before looking at the
  arbitration lost bit (sashiko-bot)
- Link to v4: https://patch.msgid.link/20261115-cs75xx-i2c-v4-0-4b16eea98a78@gmail.com

Changes in v4:
- rebase on v7.4-rc1
- split out of "Cortina Systems CS75xx: interrupt controller, GPIO, I2C
  and TWD watchdog" so that each driver can go through its own tree; no
  longer based on the platform series
- binding: limit clock-frequency to 400 kHz instead of listing 100 and
  400 kHz, which is what the driver accepts; I kept Rob's Reviewed-by
  from v3 for this one-line change
- collect Reviewed-by tags
- use fsleep() and device_set_node(); sort the Kconfig and Makefile
  entries
- Link to v3: https://patch.msgid.link/20261013-b4-cs75xx-s2-v3-0-181bb0d23f4c@gmail.com

Changes in v3:
- rebase on v6 of the platform series
- reset the controller with its interrupt disabled, check the prescaler
  against the field width exactly, wait for a bus held by another master
  up to the adapter timeout (sashiko-bot)
- Link to v2: https://patch.msgid.link/20261013-b4-cs75xx-s2-v2-0-94f8c0a90cda@gmail.com

Changes in v2:
- rebase on v5 of the platform series
- do not include <linux/mod_devicetable.h> (Uwe)
- complete a failed transfer only once its stop condition is done, so
  that the stop interrupt cannot race with the next transfer; take the
  lock over the whole interrupt handler; report a NACK of the last byte
  of a write; enable the interrupt again after a reset on timeout; fail
  with -EBUSY when the bus stays busy (sashiko-bot)
- Link to v1: https://patch.msgid.link/20261012-b4-cs75xx-s2-v1-0-8a7641b7b79c@gmail.com

To: Andi Shyti <andi.shyti@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-i2c@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org

---
Fil Dunsky (2):
      dt-bindings: i2c: Add Cortina Systems CS7542 I2C controller
      i2c: Add Cortina Systems CS75xx I2C controller driver

 .../bindings/i2c/cortina,cs7542-i2c.yaml           |  56 +++
 drivers/i2c/busses/Kconfig                         |  11 +
 drivers/i2c/busses/Makefile                        |   1 +
 drivers/i2c/busses/i2c-cs75xx.c                    | 394 +++++++++++++++++++++
 4 files changed, 462 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261015-cs75xx-i2c-944d27231b4c

Best regards,
--  
Fil Dunsky <filipp.dunsky@gmail.com>




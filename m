Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC032606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 11:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f3Q/6G4J;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RHi4rO8Q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=sLCD0hdTnv6Da453ywGRbhFkVAe80xOO0sEFoswojxk=; b=f3Q/6G4JRx9/rT2rTY5zT4/uR9
	aTZkrG8ZwsZ+lcYQYZDrIngQOe0lzbNOnmiDLn//isIKuSCREDq8pekxr4ppTKbbovB3gLZzV1dQO
	O3CBNoMSv47HCsoCQFfAXxDl/OhUmQVzeU5IX/MN/aR/Ei55Ho4msLqFOY3nBD37YK6TDUgvpQHvv
	TmOmiiVSDuMgqNOvv2hA2AzmG/1U+sU8WoS47KgRqOZxKb7WJSp360wpk/i1LdZQLQkYcdUh9/ayl
	tNpT0jWpHsslzWstEf40i9xKI3VJ8vqknLwAuDmLC902bYUuLUb2KfWaL1SFTIk7xbNmIhbQc4VmC
	zK02zXzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzv4-0000000BeOE-3Tuz;
	Thu, 19 Nov 2026 11:03:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzv4-0000000BeNq-092Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 11:03:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C86DF472C1;
	Thu, 19 Nov 2026 11:03:09 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795086189;
	b=ViUR7r4AW67OyLXMSNpQqwq/36ZDjeKMmgwZQtsqwr9o7Yf3XlgAeJxGnSeLNbID9fYN
	 GrROmvGWGbZLsn6grrcc4eMhQTTcbTN9HQWhdJUDoqfwSKyOy3CfoRwn9KBRb4kweF0Bd
	 AEprxQ8SszChuKUG1r6CpGcOzLR2VL897tQsfCpmGRrLNDRVhzQWdN7Y2eiideyxc6I9z
	 xmWsGDRRWOuWKHnp42cHSO5/ukJjCENlVRqMBmbXLCPK0eVXsXiGZ3d6kbC48ogCM+kAX
	 nnqJEDgJrFUm7q+ysmyTI/hfP+jQLhNi44VSempZLI8sQ1T0apqZBzDpKzZvzgtRNhg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795086189;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=sLCD0hdTnv6Da453ywGRbhFkVAe80xOO0sEFoswojxk=;
	b=nqbmnwXS5BB9kt3/+eelmLVOH1LdZf6qRHu5NsqsCr+kUy7O2nZ+uJblpXtmMc0nsyrY
	 DhgAX5aMmzm4/JJ7kxnIATHXXh1en6xr+/t9u7UqzUCHkPmxE37lWk2ywgry2DzjBUMau
	 mEJXNDzp0QCHV5OmSh+BZObnzvCihVVLZ0q3LpktcMVPmj/m6s0BSfWrjaxOIcD0J0mIc
	 wfgmK5cIX4S70ottLKiX7IhvHh4Ivryj6R6ptEGnOKeJdIS8+8PXwMhHk+FvDIl83IGmK
	 9I8rC0hdM7bjx0xw3DCp0h1uFqSmNBy7urQJ78sFlNyySOnGEewDpg/twSHeyEwXXqw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CA0D11F000C8;
	Thu, 19 Nov 2026 11:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795086189;
	bh=sLCD0hdTnv6Da453ywGRbhFkVAe80xOO0sEFoswojxk=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=RHi4rO8Q3TethLmELW9eofpbccexQauNRAX1pGsu+vat8emS0Pbc94HbZfXHPSmbx
	 0R4EF8gcPED7IUuEk30A/sfWEE4a27lDMe2Skb2/dYeZkHu/+ebGhD5Xff4q0SASUz
	 avI6sw5Vd2x+6xKBZUGG6kR9GL7mX25m+CiOX5vGQ47dFm5LGk5J83uaDKgb/j6gKq
	 KxMYyrOez+RGrSJzl8+G0oaIX9ubX/OpF/KzUk672b0jEJNBxmC4p14hAbUcEWKEa9
	 mFqWeuPp5cUH/4u8GijFSzo6AxkRlo/2FpaS/PN/1AVsw7ML+26CJ0QYDWHM/wsUx1
	 VQCf81PWRrSaw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 289EA4B268;
	Thu, 19 Nov 2026 11:03:08 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Subject: [PATCH v5 0/2] gpio: Add Cortina Systems CS75xx GPIO driver
Date: Thu, 19 Nov 2026 14:02:48 +0300
Message-Id: <20261119-cs75xx-gpio-v5-0-8d14f2bb614b@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1WNwQ6CMBAFf4Xs2ZoWSwFP/ofhUMsKa4SSFkkN6
 b9b4ORxknnzVvDoCD1csxUcLuTJjgmKUwam12OHjNrEkPNcCS4KZnxZhMC6iSzDlutLiSi1qiA
 tJodPCnvt3hzsP48XmnlLbEZPfrbuu98tcvOOshDqr7xIxpluK65rKbFW6tYNmt5nYwdoYow/W
 rGDqbgAAAA=
X-Change-ID: 20261015-cs75xx-gpio-ed0a37ee4a68
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Fil Dunsky <filipp.dunsky@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795086186; l=4741;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=7ReSjLy5tQcxGd7K4Ei7RJhi7iM5iBMo99bERKuG4cQ=;
 b=GMU11+a3H1pgmVIv3jre/3NQqK6uKkdG80san6lNXNOMDCPdY2Fo6PxsLffpjtgpJjZ/iKDMu
 Tv1teZuuy9jBVzAOxkkdNTfAKsG24/VnFfS6mTK4TOgzsmMS/rjDF/D
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

The Cortina Systems CS75xx ("Goldengate G2") SoCs have five banks of 32
GPIO lines, each bank with its own interrupt. This series adds the
binding and a driver based on gpio-mmio; level and edge triggers are
supported, both edges are emulated by flipping the polarity.

Each pin is either a GPIO line or belongs to a peripheral (NAND,
Ethernet, UART, I2C, ...). That choice is made in the global control
block, which is not part of the GPIO controller: as discussed on v1 [1],
the driver does not touch the pin mux and leaves it as the boot loader
set it up, until there is a pin controller driver for that block.
Testing the reset button on the Securifi Almond+ requires selecting
GPIO37 in the global pin mux before gpio-keys is probed; the current
boot path does not provide that setup. The tests used a separate,
board-specific setup step. The GPIO driver does not program the mux.

The driver used to be part of a series with the interrupt controller,
I2C and watchdog drivers and the device tree changes. That series is now
split per subsystem. The driver can be built with COMPILE_TEST without
the platform series [2], which is under review separately. The other
Kconfig option, ARCH_CORTINA_ACCESS, is defined by that series in
arch/arm/mach-goldengate/Kconfig; it is not in mainline yet. There is no
code dependency on the platform series. The device tree nodes will
follow with the other CS75xx dts changes once the platform is merged.

There is no public documentation; the register layout comes from the GPL
vendor kernels. Tested on a Securifi Almond+ (CS7542): the reset button
(GPIO 37) works as an active-low gpio-keys input, and the SX8650
touchscreen uses a level-triggered GPIO interrupt.

[1] https://lore.kernel.org/all/20261012-dreamlike-hazily-19bb60326f0a@spud/
[2] https://lore.kernel.org/all/20261114-b4-cs75xx-v7-0-8f17f38821b4@gmail.com/

---
Changes in v5:
- explain that ARCH_CORTINA_ACCESS is introduced by the platform series;
  COMPILE_TEST allows building this driver without that series
- correct the pin mux setup required for testing the Almond+ reset button
- clear the interrupt status after changing the trigger type, so that
  unmasking an edge interrupt does not fire a stale event (sashiko-bot)
- collect Reviewed-by tags; Linus, I kept yours over the one-line change
  above
- Link to v4: https://patch.msgid.link/20261116-cs75xx-gpio-v4-0-ad80a944e966@gmail.com

Changes in v4:
- rebase on v7.4-rc1
- split out of "Cortina Systems CS75xx: interrupt controller, GPIO, I2C
  and TWD watchdog" so that each driver can go through its own tree; no
  longer based on the platform series
- the pin mux registers are not part of the GPIO controller (Conor): the
  binding has a single reg entry and the driver no longer switches the
  pin mux when a line is requested
  (Rob, your Reviewed-by on v3 is not carried because of this change)
- switch a line to input for an interrupt only when it is not requested;
  flip the polarity of a both-edges line after the ack, so that an edge
  in between is not lost (sashiko-bot)
- drop the gpio_chip owner, gpiolib sets it; sort the Makefile entry
- Link to v3: https://patch.msgid.link/20261013-b4-cs75xx-s2-v3-0-181bb0d23f4c@gmail.com

Changes in v3:
- rebase on v6 of the platform series
- Link to v2: https://patch.msgid.link/20261013-b4-cs75xx-s2-v2-0-94f8c0a90cda@gmail.com

Changes in v2:
- rebase on v5 of the platform series
- do not include <linux/mod_devicetable.h> (Uwe)
- update the both-edges mask only for a valid trigger type and test it
  under the lock in the interrupt handler; refuse more than 32 lines
  (sashiko-bot)
- Link to v1: https://patch.msgid.link/20261012-b4-cs75xx-s2-v1-0-8a7641b7b79c@gmail.com

To: Linus Walleij <linusw@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org

---
Fil Dunsky (2):
      dt-bindings: gpio: Add Cortina Systems CS7542 GPIO controller
      gpio: Add Cortina Systems CS75xx GPIO driver

 .../bindings/gpio/cortina,cs7542-gpio.yaml         |  65 +++++
 drivers/gpio/Kconfig                               |  12 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-cs75xx.c                         | 283 +++++++++++++++++++++
 4 files changed, 361 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261015-cs75xx-gpio-ed0a37ee4a68

Best regards,
--  
Fil Dunsky <filipp.dunsky@gmail.com>




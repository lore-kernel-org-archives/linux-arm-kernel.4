Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B80606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 07:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jJ9GlPhZ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CPtk9OJu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=u5ar0IdD2xhCoOiqg/+TLUUAN76uGgDBJI3EEPDiaE8=; b=jJ9GlPhZJJqfPyvk7+4JRvGQ4h
	0mU+e2hywuTglZEm/lAw/vgAccqPtC1tomX1N20uyWj/MJLwuDBVD/qPX/18S7VSKTehuQVaE+cKR
	a3xEpxvuL7bAbt45urZc3zd0dcfQT+iGc/BSkjolpsN+oopYLJ3shGkuonLWtN2XktI3oKOqqu+aS
	c5IdF9QrFWb9lCTwaIWZiJDsG+OzIrUCNNogNf5peb8L1KxJCSW0LGigS1GkMETVbu0jjaGjchdE6
	xmXxcc0dUHk3y4q+0fazu7pfUppWwhoCGd0javYnqdenvpes+9LcwpIGz/lnWf1I+0reWDPGoY4Fp
	b5uaYUow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg9c-00000002su4-3MDQ;
	Tue, 10 Nov 2026 07:20:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg9I-00000002sWy-23V9;
	Tue, 10 Nov 2026 07:20:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F397D4343B;
	Tue, 10 Nov 2026 07:20:07 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794295207;
	b=AML0NIOpF22WQsjMrcLVHU5qZMiL1vcej/27dBa9ttCxB4G5Cf1Dgsoyfk2WsLgkRHtv
	 lGv8LiBEOwpkPVPz1bxrWkoHjZe9oo40yVj6Mjh7BR1FhXR4le089VLo/ItG0OBMWu/hm
	 dIyDm0KPa+Kk0DfyPQMZDQ2YkTSW72D5pqphufp1hwl8FgRwJQFea5rldffugTvUUH2ET
	 XImCDaAYrDHsJluwC/UdHkExzmxMM9Q22LD369mNShrNAfeDJZZlqsJ1PUX3jKBW4r14X
	 Np7TmjQ8vugAwwycTMVOYwL8jXB37PLY/chz0VFuYJiKUCcjnG0RhugDtoBg9P8+LTg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794295207;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=u5ar0IdD2xhCoOiqg/+TLUUAN76uGgDBJI3EEPDiaE8=;
	b=0n9AzTLLDPz0rNSrRwsZg36SrYxORBcnvNDZOdeUg4xan8GsFlliVfOAngC8I23t476K
	 JwQMlVJK1ZnyxJhnFKNLuce537hmopPbYekh7gooTIMPoBpK+sGfvdyEFxrgf4pnMpOmw
	 W7nClDAC38dvHqZSAN/JmKABiAjVl0f7Q/a1LfvJWH+DTa1GulQ24i+++rKZrluAuxJNU
	 S61KbSdzgUdFzo8c1iuJla9kck10oXmbC5As1yKxVE1RQTj4WZTft3bza1mUgIa8/6Ey7
	 /hyYCdvArvPRL0jau8cic7kNiufRPZA26aukEgjJeht7Tw2DHCKNgzyItP4iv6q+pTQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 066CB1F0089F;
	Tue, 10 Nov 2026 07:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794295207;
	bh=u5ar0IdD2xhCoOiqg/+TLUUAN76uGgDBJI3EEPDiaE8=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=CPtk9OJuusWe6oMKIyOjOnbFMrzrmYk83V/+fCmvPbBYVBkFcL+1E6AH3kRC/cm+R
	 X132EY6caXaJpMIzUS0UKbCPkI9oXZELe/RztJoCquF9nKzboat00E1WTai2idVzOn
	 Agm23Gy0B9NG5zxkb9ouToJNnsh+ELQBiYCo1NiY6JdaGLKdXMbG6iRVUOTBZdKUAS
	 IkuMc7rSG/kPcRWzAhYMAEEokQ8BDNxW1nwWPq2Gwm9/Qhr0j4wHxbvjTQv5tlSmhO
	 y3aqHQ/wJdiZPT/h+4nsRDvAAy6PzqL2xaZoMRXfpmePIk9fiUaydJTnTPYb7iWRKy
	 a5gcpBCwjQlFA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8EC25489C1;
	Tue, 10 Nov 2026 07:20:06 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Subject: [PATCH 0/4] usb: core: Pair ports of different host controllers
 through their connector
Date: Tue, 10 Nov 2026 07:20:05 +0000
Message-Id: <20261110-usb-port-pairing-v1-0-9307e29d2ed2@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMMQ7DIAxA0atEnmsJGBhylaoDUJO4A0F2qCJF3
 D00Hd/w/wlKwqQwTycIfVl5KwP2MUFaQ1kI+T0MzjhvrTXYNGLdZMcaWLgsGLLJ3mcToiMYWRX
 KfNzL5+tvbfFDaf99oPcLeeyAeXQAAAA=
X-Change-ID: 20261110-usb-port-pairing-af0f66f0ab2e
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794295206; l=5057;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=5QKUfHPW3+xcVKyI0NDq5EzfqKIVMb0aDobvRO6Oo8U=;
 b=IcJ8AgVLByKYBVSrtphHEuo9ppLlzRjx+W1Sw0tObyGKPtuNlJmRNOcgsI0Fx9X2sFhjqNvK9
 Vu0pCcLz9j+AsupJpIXfO87sLsSnubzmbGgAAEin0iTqs8ZW6wfG09t
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: aiyengar1990@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The USB core pairs the USB 2.0 and SuperSpeed halves of a USB 3 port
only within one xHCI (shared_hcd, same port number) or through ACPI
location data. Some SoCs route the two halves of a connector to
different host controllers: on the Rockchip RK3588, USB 3.0 host 2 is
SuperSpeed-only (its own USB 2.0 root hub port is not wired to a PHY)
and the connector's USB 2.0 lines go to a separate EHCI/OHCI pair.
Today the SuperSpeed port is paired with the dead USB 2.0 port of its
own xHCI, and the EHCI port that really shares the connector has no
peer.

That is more than a cosmetic problem on boards where VBUS of such a
port is always on. On the Orange Pi 5 the Type-A USB 3 port has no
VBUS switch at all (no enable GPIO in the vendor or mainline device
tree; confirmed on the board), so a device that is plugged in across
power-up or a reboot is powered long before the kernel runs. It looks
for a SuperSpeed link while the xHCI is still down, gives up, and
connects at high speed to the EHCI, which starts ~10 ms before the
xHCI. It then stays at 480 Mb/s until it is unplugged: USB 3 devices
only look for a SuperSpeed link again after a VBUS cycle or a USB 2.0
bus reset.

The series describes the connector in the device tree and lets the
USB core use it:

  1. dt-bindings: allow a "ports" graph on generic-ehci (one port per
     root hub port, as usb-hub.yaml already has for hubs).
  2. usb: core: when a port's graph endpoint leads to a usb-{a,b,c}
     connector whose other half ends on a different hub or host
     controller, pair the two ports through the connector and keep them
     out of the default pairing. Connectors whose halves end on the same
     node (Type-C on a dwc3) are unchanged.
  3. usb: hub: when a SuperSpeed hub with connector-paired ports starts
     (or comes back from a reset / reset-resume), reset a
     SuperSpeed-capable device that sits at high speed on the USB 2.0
     peer, once, so that it can train its SuperSpeed link now that the
     host is up. A device that still does not train stays at high
     speed; there is no loop.
  4. arm64: dts: describe the Orange Pi 5/5B Type-A USB 3 connector.
     Other RK3588 boards with the same split would need the same node.

Honest limits: patch 3 only helps devices that retry SuperSpeed after
a USB 2.0 bus reset. A SanDisk Extreme does; a SanDisk Ultra Fit does
not and stays at high speed after the single reset. The hardware fix
(a switchable VBUS, cycled once the SuperSpeed host is up) is not
available on this board. The pairing itself (patch 2) also makes the
existing peer runtime-PM rules apply to such connectors.

Tested on an Orange Pi 5 (RK3588S): with the series the EHCI root hub
port 1 and the xHCI SuperSpeed port 1 show each other as "peer" in
sysfs. A SanDisk Extreme present at boot enumerates at high speed on
the EHCI at ~3.2 s, "SuperSpeed peer port available, resetting" is
logged once, and it re-enumerates at 5 Gb/s on the xHCI at ~3.8 s, on
every boot; without the series (two different kernels) it came up at
480 Mb/s on the EHCI on every boot and stayed there until replugged. A
SanDisk Ultra Fit that ignores the USB 2.0 reset stays at high speed
after the one reset. Hot-plug after boot (5 Gb/s), the Type-C port
(both halves on the same dwc3 node) and USB 2.0-only devices in the
port behave as before. dt_binding_check for generic-ehci and
CHECK_DTBS for the Orange Pi 5 and 5B are clean on this base.

Open point for the dwc3 binding: snps,dwc3-common.yaml describes
"ports" as used together with usb-role-switch; patch 4 uses port@1 of
a host-only dwc3 for the SuperSpeed lanes, as rk3588s-indiedroid-nova
and rk3588-lubancat-5io already do. I can send a wording update if
wanted.

This series was developed with Claude (Anthropic) as a coding assistant:
it wrote the code and the commit messages, and I reviewed and tested
every change as described above.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
Arun Iyengar (4):
      dt-bindings: usb: generic-ehci: Allow describing the root hub ports
      usb: core: Pair ports of different hubs through their connector
      usb: hub: Retry SuperSpeed for a device stuck on its USB 2.0 peer
      arm64: dts: rockchip: Describe the USB3 Type-A connector on Orange Pi 5/5B

 .../devicetree/bindings/usb/generic-ehci.yaml      |  13 +++
 .../boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi   |  60 ++++++++++++
 drivers/usb/core/hub.c                             |  88 ++++++++++++++++++
 drivers/usb/core/hub.h                             |   3 +
 drivers/usb/core/of.c                              | 101 +++++++++++++++++++++
 drivers/usb/core/port.c                            |  54 ++++++++++-
 include/linux/usb/of.h                             |   9 ++
 7 files changed, 324 insertions(+), 4 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261110-usb-port-pairing-af0f66f0ab2e

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>




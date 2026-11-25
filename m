Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E5F606A330
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 10:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S6nVEgdz;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OyicAg7O
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=4Omsk3aCF2GLKrO6+1yETWUmtvbvNI+t02oC5/uK2gs=; b=S6nVEgdztzkaqTIYHoioWtR/dV
	pY8SNQ+C2f+3oLvHxg0HOQwbbfXmpq+zYKzThWh6b825BRUd6vcFhJpuMUc/oFXPs3Q0QOJG8TaQn
	W/V6T12yOT/2IPvP4d2WKaIoUbjlT+XYD1J66f6GvQuPzzs5WYkc644F0lnSXQ2CXIbpmuBKKez1B
	DbGEAPwKXF4egUnzu5MoH2ziF377dpyRO40ZbRLWXfxdHeuoRJQ7QvuVnw36xEpTjv0Gdrld5CIQE
	IQJKeQc4rg7Kd6ODJZRLAntAkmymVCLixW1WGBDqx5YhWPXHK/cKSMal5Vju5KTjhUPICyrBgEHMm
	0NAOzc+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWAMz-00000009U8A-3F6a;
	Wed, 25 Nov 2026 10:36:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWAMm-00000009U0w-1Y6g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 10:36:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9AA34627BA;
	Wed, 25 Nov 2026 10:36:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795603003;
	b=V0lPG1WaMQXR9LznYbJTIv0uCl/Vl+6vysZ61Emg25Fgyzs7Ft1grufXt1Tl3CWguRJa
	 YB/Dnc7Ae0TRdwRW+EQ3ajjDWX6MC531AJ5je5mhqEbXnDhWVIw5hpL2qEqs9NliaddGi
	 R7hdrvlSnv1AcLCsOZuPCZVJT/TdlbiWBtPmxoAc8EH6JFex/N0SzbUXRTUYCSfpkAC8e
	 j53pQqbvVkVmQv7KPstyDo2IFaYL3xHejRcqRiQIurPOKkrCQeWtkd9LpFbhJTwZYi6BI
	 4NydwZr8scN0G64JRs+lGtPRVdjhXIt44gR3QT7+Ehy3KGuyKikkbUcmvvoth8kNYsg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795603003;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=4Omsk3aCF2GLKrO6+1yETWUmtvbvNI+t02oC5/uK2gs=;
	b=UdWw6SPtjpyafHohDQ4P+kEWSz0svn8uEdSjFqJ6oGE/XldZdiw8jzS1YorFlbAYt8+A
	 NyzbbOEGLzzXh/k8/KeGd4Z/E2mJIeAbkPtxRzIWWAJxsatq84aoEshwVpkOpEem/mNUT
	 btFte86vS6iAkdHoVgJA8pF5MtZzNtlfJyhz2ziFXIDewUHVDYqQb4Zx5fVYAY3P9Gjw3
	 UPWyA4QLuM6GuLyrLhBZD8SYV8cJPTCRP24FWSw4f8ob7NSXWhMMtLnMU3osBnYnzIv9L
	 46PMOSYLv4+EYud6VJ3fe/wZiZ8/XVOWnacpfdFM2Bz6mATCTlzpZzWL5gE1UrSCsnA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A5FCA1F000C6;
	Wed, 25 Nov 2026 10:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795603003;
	bh=4Omsk3aCF2GLKrO6+1yETWUmtvbvNI+t02oC5/uK2gs=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=OyicAg7OvxFCey622RAph9RI5fpVKTraJAQ23MYwNUaTiQdW6QYHs1/SUJfsitTsQ
	 FlixvhJkZJKT6hFJSo5J6AcBYF0pIljP8bQ9PLWx4o4YzeSbEZnhY7BpcT5UMOFI6+
	 TP3PGt+oDdRdGw5ztjw0ZMdEUZXsqh7x6nI6bzYOCiKixPKM1+5YyHJVcSEe5WzHXX
	 rhHMK8TweAiLlkXHOgbKX95r0GpUQcrNeAUkM6XcRIOm9/oL5jk0L52u5dXRj/0ITN
	 /h0UKwvQsfdD+k/jADmfzT6uELq8Y2TzGMBNPSMXDqOV/I0XLvLReHgXdBGZ1pGm7d
	 KYNAYM0eKi4Sg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 18FA64CE4C;
	Wed, 25 Nov 2026 10:36:32 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Subject: [PATCH net-next v2 0/3] net: cortina: Add CS7542 network engine
 support
Date: Wed, 25 Nov 2026 13:36:30 +0300
Message-Id: <20261125-b4-cs7542-ethernet-v2-0-d0ea3c6eb375@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32QTW6EMAxGr4KybiryBwFVVe9RzSJxnCHVAG2SQ
 TMacfcGSqWuurRsv+/ZD5IwBkykrx4k4hJSmKdS8KeKwGCmM9LgSk14zRvGuKBWUkitkpxiHjB
 OmKnqgClnocUWSVn8jOjDbYe+k21gwlsmp59OutoPhLwxj9mIX9eSm48FaxJSmMcx5L6yjem8E
 RJQMt2CbTonQGltpLXeg2CAJVn7DTViSmYX7quXw1f9yqZ7gnmii6Q1FUK01tZOWKnfzqMJl+e
 S97obDiHlOd73fyxsF/rv9IUVnndWoQbuVP2HR07run4DvRG3aGABAAA=
X-Change-ID: 20261123-b4-cs7542-ethernet-59c15dbc7e7e
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
 Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795602990; l=5902;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=hzfTSEncl8+6lQFtXl+HvtjdqGsPTGMtg6pa3a7jny0=;
 b=0ioYPAfU7bBMgacGabqirz3qfnCgZP6w9zOFbJdu1Kz6Kej95t+FkeymnfMXfAz/EdfRpFL3+
 yYK4yjei4ysDY0MQsawJPbe6Bvbr62Lfl1aUGdsdkth6w2DdQOOVlh/
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the CS7542 CPU network datapath with phylink for three GMACs.
Almond+ connects two GMACs to QCA8337 CPU ports handled by DSA. Use the
global reset controller's seven exclusive lines, including the shared
LSO/SSP DMA block. The reset provider binds to the existing syscon.

Apply the combined CS7542 global controls series to Linux v7.4-rc4
first. Its clock and reset patches describe the NI, FE, TM, SCH, QM,
DMA and NI-XRAM reset IDs. The board DTS is posted separately.

Use normal NAPI weight64 and the supported external-DDR QM/TM setup,
with no module parameters. Preserve scatter-gather TX, multi-buffer RX,
tracked DMA ownership and bounded initialization. Require the verified
64 MiB no-map queue-manager reservation; NAND uses PIO and a separate
SSP DMA consumer cannot run concurrently.

Attempt and check every protective assertion without rolling back
already asserted controls. Preserve the first reset error, and retain
all active DMA allocations if any line cannot be confirmed asserted.
Serialize shared NI register updates and stop scheduler initialization
on its first command failure before publishing DMA buffers.

Validation includes actual-source reset/cleanup/error models, shared NI
RMW interleavings and scheduler command failures, ARM builds and binding
examples.

A separate combined Almond+ Linux v7.4-rc4 RAM kernel with private
log-only instrumentation passed two network-engine probe/removal epochs.
The trace checked all seven reset lines and their readbacks. Twenty-nine
exclusive-acquisition negative tests returned -EBUSY in a private test
module; they are intentional test warnings, not ordinary driver activity.
The external host matched 600 UDP echoes (six payload sizes, 0..1400
bytes) and 20 ICMPv6 replies. A distinct CPU-port scatter-gather/jumbo
fixture completed 448 frames. These are separate trace, host functional
and fixture observations, not a throughput or hardware-offload result.
The composed kernel also contained PCIe/PHY and other board drivers;
this is not a standalone provider-only hardware test. Watchdog expiry
returned to normal firmware. Protected-region hashes and flash layout
matched. Concurrent unrelated settings activity is excluded from any
unchanged-settings claim.
No checksum/NAT offload or performance capability is added.

The additional MAC-deferral/unwind correction is tested separately on
the host with actual-source fault models, not on the board. The hardware
evidence above describes the preceding source revision; its successful
factory-address path and packet datapath are unchanged by this error-path
correction. Missing NVMEM now defers before registering reset cleanup;
a late defer is returned instead of assigning a random address.

Additional local review corrections are tested with focused actual-source
fault/ownership models and ARM compilation. They have not yet been run
on the board: count bounded RX fragments independently of delivery
eligibility, schedule an initial masked NAPI poll on open, and retain
completion reaping for outstanding TX while all ports are closed.
No hardware offload capability or packet-MAC rewrite is added.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
Changes in v2:
- Use the common parent provider and all seven exclusive reset lines;
  remove the virtual reset child, duplicate provider and consumer hook.
- Assert and verify every line without protective-assert rollback;
  retain active DMA allocations on any error and deassert in reverse order.
- Use rgmii-id in the binding example for switch-inserted RX/TX delays.
- Remove module parameters and unused internal-buffer mode; retain the
  previous default external-DDR initialization policy.
- Use NAPI weight64, plain static MMIO helpers and goto-based open cleanup;
  retain the lock-protected publication and stopping gates.
- Serialize shared NI RMW and stop on the first scheduler command error.
- Keep MAC preflight before hardware cleanup registration and preserve
  a late NVMEM probe defer instead of replacing it with a random MAC.
- Recycle bounded RX fragments also when the frame is dropped.
- Poll already queued RX after open and retain safe closed-port TX reaping.
- Review Sashiko 231860: existing NI/SCH/NAPI fixes address the older v1;
  temporary BM initialization bypass clearing follows the vendor sequence.
- Link to v1: https://lore.kernel.org/all/20261123-b4-cs7542-ethernet-v1-0-fdb5e8c2d508@gmail.com/

---
Fil Dunsky (3):
      dt-bindings: net: Add Cortina CS7542 network engine
      net: cortina: Add CS7542 CPU network datapath
      MAINTAINERS: Add CS7542 network engine support

 .../bindings/net/cortina,cs7542-ethernet.yaml      |  160 ++
 MAINTAINERS                                        |    7 +
 drivers/net/ethernet/cortina/Kconfig               |   14 +
 drivers/net/ethernet/cortina/Makefile              |    3 +
 drivers/net/ethernet/cortina/cs752x_fe.c           |  477 +++++
 drivers/net/ethernet/cortina/cs752x_ne.c           | 1869 ++++++++++++++++++++
 drivers/net/ethernet/cortina/cs752x_ne.h           |   13 +
 drivers/net/ethernet/cortina/cs752x_sch_tm.c       |  687 +++++++
 8 files changed, 3230 insertions(+)
---
base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
change-id: 20261123-b4-cs7542-ethernet-59c15dbc7e7e
prerequisite-message-id: <20261125-cs7542-syscon-v4-0-3337bb0d3b48@gmail.com>
prerequisite-patch-id: a9208276c628f8741a807d0e5c5945d4bf211c8a
prerequisite-patch-id: 65d46bb3caaa8518ee561f65d3f603ade396fff9
prerequisite-patch-id: a0ed5fbcfa308b16eaf265371a6697ad0aea6802
prerequisite-patch-id: bb8ffd99cb30e5a0b47881f6ba19a36329d5f4f2
prerequisite-patch-id: 7fbe9405265ef3d1ec62811415a46c0061afd7c8
prerequisite-patch-id: 01ece2c91e080d5cae6af81944159373776484ca

Best regards,
--  
Fil Dunsky <filipp.dunsky@gmail.com>




Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85D2606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 12:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3acnWd9D;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=BEwZ0SsO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=eHMqgDAEPCosoidPk3c6KfvIHKmZESHd+BbV4dQ2VRg=; b=3acnWd9DNr3oF0/8N092hxLC49
	q2BOKxdXry18EpIblKIBQPATSBkTJDHbd7rs+4Q0tQAH7VMoLmwk7C3bp/pOgJ57+oPT0gcuGAYK7
	l+1o3rl16AyPTkfJHJMIMQ0lA/x9GkzkoXTAgnr3ZWdGJ85KuoWOGFAA+H1loXxoCAfbDM2bE4OaQ
	UNzf1FJFeXhTjdeJNdbBq7dSJNFPIhaYuEkmTe6/Ba0wu8jOdt3N3s+UzMixk4uUeLCbCJwnSI3id
	kyizX/TMa3DXfmhYvOvrQhO3sLLdE6aIwpqpjXlJOO3/olsFFcgigJpZOjcLCfjBetq7J14xb43BJ
	QfW2ivgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOA5-0000000F1I2-1Vvx;
	Fri, 20 Nov 2026 12:56:17 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOA1-0000000F1H6-3fdS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 12:56:16 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 87EF51A095E;
	Fri, 20 Nov 2026 12:56:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4D2CA601B9;
	Fri, 20 Nov 2026 12:56:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E190811BC003E;
	Fri, 20 Nov 2026 13:55:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795179366; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=eHMqgDAEPCosoidPk3c6KfvIHKmZESHd+BbV4dQ2VRg=;
	b=BEwZ0SsO/M9c0BxNk8KuFpHOcOpd57kpxzVOILhXBUMq3Qe0j7OYdRCN/sevm5BjlSfA1d
	2b/NUy18cQ64lQhBx+t6Tue6Wt1m6Fpm7ZVhbHrtYlcwcmqmYjakFK40C18ETegqo6Cols
	bZgAEEwx+tDLaXQlyMu5s3ZmaqRpBUWdW6VtZYjSIMjd9pfuSDG0ahNTPiTGbrlWUljv/I
	m1CXPrNE0sc1WLk9BmwA6yDrOhsCTjm2SzxzjVt2wG9zIPPEDYxdHt9Yw+ePs12AIX6vTO
	pVE1MltmXtlUK6hDl7kZQjMEl4TNoh4huNhXzA34l+V0GZLMaNtcHXzcy2PqgQ==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Subject: [PATCH 0/4] phy: cadence-torrent: rewrite Torrent PHY driver
Date: Fri, 20 Nov 2026 13:55:48 +0100
Message-Id: <20261120-phy-cadence-torrent-ng-v1-0-da2db7125cd7@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBG4auQWTtJi6joVYwLaH9gXAxkWo2Gc
 HerLr/FeyslmCDRpVrJ8JQksxb4XUVh6nQESyym2tVH792el+nNoYvQAM6zGTSzjtzG5nzqozs
 MTUslXgyDvH7j6+3v9OjvCPl7o237AHFabKx6AAAA
X-Change-ID: 20261103-phy-cadence-torrent-ng-8d497bd05f48
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yuti Amonkar <yamonkar@cadence.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Andrew Davis <afd@ti.com>
Cc: Vinod Koul <vkoul@kernel.org>, Chintan Vankar <c-vankar@ti.com>, 
 Abhash Kumar Jha <a-kumar2@ti.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Swapnil Jakhade <sjakhade@cadence.com>, 
 Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 Benjamin Robin <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_045614_204113_1C7A9989 
X-CRM114-Status: GOOD (  22.83  )
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
X-Spam-Status: No, score=-23.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series rewrites the driver for the Cadence Torrent multi-protocol
PHY (sd0801).

Motivation
----------
The existing phy-cadence-torrent driver hard-codes, for each supported
configuration, the register values to program. The configuration space
is large: protocol and associated PLL frequency, DisplayPort bit rate,
reference clock frequency, spread-spectrum clocking (SSC), number of
lanes, PHY revision and technology. As a result, every new board or
standard combination requires a full extra table of opaque register
values, which is inflexible and hard to maintain.

The rewrite aims to:

  - simplify the addition of support for a new board;
  - support every reference clock frequencies supported by the Cadence
    Torrent PHY;
  - support multiple links per standard without restriction (the previous
    driver, for instance, was limited to two PCIe links);
  - allow, in the future, the dynamic reconfiguration of the SerDes link
    rate (for example, to switch between SGMII and 2500BASE-X).

Because this is a complete rewrite, the diff is large and not well suited
to a line-by-line review. The rewritten driver can be fetched from the
`phy-cadence-torrent` branch at https://github.com/benjarobin/linux

Design
------
The new driver computes the register values instead of hard-coding them:

  - registers that depend on the reference clock frequency or on a PLL
    frequency are computed at run time, from the reference clock
    obtained through the clock framework and from the PLL frequency
    derived from the selected standard;
  - the remaining registers, which only depend on the standard type, the
    PHY revision and the technology, are written through one function per
    register, with an internal table selected by a
    standard/revision/technology key.

The PHY revision and technology are detected from the PHY identification
registers, and the DisplayPort link initialization and rate-change
sequence were rewritten.

Validation
----------
Because the rewritten driver computes register values instead of
hard-coding them, its output was validated against two independent
references:

  - The Cadence "Torrent Programmers Guide" spreadsheet, for the
    registers that depend on the reference clock and on the PLL
    frequencies. The spreadsheet generates (as a CSV) the expected value
    of every register to write; the values computed by the driver were
    compared with these expected values over a large number of
    combinations of reference clock, PLL frequency.
    To make this comparison feasible, the reference-clock and PLL
    computation code was extracted into small userspace harnesses,
    so that many combinations can be swept without booting the hardware,
    and the results are fed to a comparison tool that checks them against
    the spreadsheet CSV.

  - The existing driver, for the complete set of programmed registers.
    Every supported configuration of the old driver was extracted as a
    test case. Two userspace harnesses were generated:
     - tp-full-old, mirroring the old cdns_torrent_phy_init() /
       cdns_torrent_phy_configure_multilink() path;
     - tp-full-new, mirroring the new tp_configure_links() path.
    These 2 userspace harnesses run the same test cases (single
    standards, standard pairs, PCIe-Multilink and internal-SSC variants)
    and then compare, register by register, the writes performed by each
    driver for the same configuration. The registers written by both
    drivers match, with a small number of remaining differences that are
    all explained (for example, values that were fixed in a later
    revision of the spreadsheet, or obsolete/unused registers);

The last patch of the series adds a debug trace on every register read
or write, so the same comparison can also be performed on real hardware
by capturing the driver logs.

The tooling used for the validation described above is available at:
https://github.com/benjarobin/cadence-torrent-phy-tooling

Status / testing
----------------
The driver has so far been validated on two TI boards:

  - J784S4XEVM: two PCIe links (x2, x4), one DisplayPort link (display
    output working) and one USB-C port (configured as host);
  - J721EXCPXEVM: two PCIe links (x2, x1) and a J721EXENETXPANEVM
    daughter card exposing four Ethernet ports over a single QSGMII
    link (~1 Gbps per port).

Comments on the overall approach are welcome, as is testing on additional
hardware, for which Tested-by tags would be appreciated.

Dependency
----------
This series should be applied on top of v7.4-rc3. This was done this way
since the commit "treewide: Convert devm_kmalloc() family to the
devm_kmalloc_obj() family" introduced conflicts.

The driver depends on the following series:

  - [1]: needed since the driver requires the consumers to call
    phy_power_on() and phy_power_off();
  - [2]: needed otherwise the QSGMII SerDes link is never powered ON.

The series [2] is included in this one.

[1] https://lore.kernel.org/all/20260601095041.3042950-1-a-kumar2@ti.com/
[2] https://lore.kernel.org/all/20260326134929.1696750-1-c-vankar@ti.com/

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
---
Benjamin Robin (3):
      dt-bindings: phy: cadence-torrent: drop cdns,num-lanes default value
      dt-bindings: phy: cadence-torrent: add phy-mode constants
      phy: cadence-torrent: rewrite Torrent PHY driver

Chintan Vankar (1):
      arm64: dts: ti: k3-j7200: Fix QSGMII overlay by adding SERDES PHY

 .../bindings/phy/phy-cadence-torrent.yaml          |   10 +-
 .../dts/ti/k3-j7200-evm-quad-port-eth-exp.dtso     |    3 +-
 drivers/phy/cadence/phy-cadence-torrent.c          | 9417 +++++++++-----------
 include/dt-bindings/phy/phy-cadence.h              |    8 +
 4 files changed, 4376 insertions(+), 5062 deletions(-)
---
base-commit: 6515d69692fb374d01e3dc95eef53047ca8f947c
change-id: 20261103-phy-cadence-torrent-ng-8d497bd05f48

Best regards,
--  
Benjamin Robin <benjamin.robin@bootlin.com>



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA03E60A2635
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 10:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HlNKBI+Q;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=Q37d8Hsv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=EvM6xyY+uxZxS8Sqk7d7mHcuxUUAebFLqQRWU1uifsw=; b=HlNKBI+QctTuSVmr2w0lvdEuv+
	9eClJgEsyVO2yEvEUaFZhbD3ybGl+Eel7XdWDu33nbgYWbFmO97NWtknBk7eGe4tfHF9IaJCTq/k2
	wMA3hl8sG+0Xa5IjrH4fTvVWmKVBrJJZWeSSZWR+Xg0hcthnc+Q3xHkNzsYI0w5biGkiNXRDX2LsU
	+j1Ck6aFI4BsvTcq9UD+AxXVLSmTww4aRfu24/TCe54Ku7LEN9jSFjkiq+49ijD4/Ay44PaNO2yfa
	BVk2iuOgJ6Uy1Q/giEAiDPwUYIyrRW1N4LwVBqaWlL/qm9F7aPq+u/pK685r2Ygy/URkm0BVQO6xE
	vzxBP2jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRoO7-0000000CKzk-2msC;
	Fri, 13 Nov 2026 10:20:14 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRoO5-0000000CKxk-0cKr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 10:20:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1794565205; x=1826101205;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=FfCRFY7Bvm5aNhQnrCe5i/u9H45+lz5nsRsQwHL0hts=;
  b=Q37d8HsvvU2sdZHH05w6bwvVwzwmYcqwlIzNxbnkf2d7rDgAIjTSr5ct
   hXcAfVY4jULz5OLoDsdMyeJQXN584GYqNXyLxRWBS1UpnA+eSJf/UfQS5
   gF/dIMzRZVCSsr+5weW4j8qo3L1p0jDZvr68b1/krVooGYlXO3E/f59VO
   NWgWAu53tMHvu1XcZQq9umgJg63IpoFSfHSRw5uT6HdU3Hgd3qXH6MHuA
   9NGnSR8BLc36zlTUr+Gd6cjtEQKRNxIInypgSX6iBQ6Qba3ZivROAUKFn
   N+LyKSbYeXrb1jk0OH2qrC/CMJzbj7b7ybdynlIEy4b7oyaZZi0fxW7BL
   Q==;
X-CSE-ConnectionGUID: W7OuCreGQl6KJhtER0qbmA==
X-CSE-MsgGUID: Q3VH/kL3Qmm4lpxNFNWz3g==
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="66461920"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Nov 2026 03:20:03 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 13 Nov 2026 03:20:02 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 13 Nov 2026 03:19:59 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Subject: [PATCH net-next 0/4] net: lan969x: skew the core clock by 200 ppm
Date: Fri, 13 Nov 2026 11:19:39 +0100
Message-ID: <20261113-lan969x-core-skew-v1-0-b9b02b863d38@microchip.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADzk9moC/x3MQQqDMBBG4avIrDtgQiPoVaSLVP/YoTJKIjYQv
 HuDy2/xXqGEKEg0NIUiTkmyaYV5NDR9vC5gmavJtrYzrbW8eu27PvO0RXD64schOOMc/Px8g2q
 3RwTJ93MkxcGKfNDruv5AwtqGbQAAAA==
X-Change-ID: 20261022-lan969x-core-skew-ff5155ead4be
To: <UNGLinuxDriver@microchip.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "Steen
 Hegelund" <Steen.Hegelund@microchip.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Richard Cochran <richardcochran@gmail.com>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_022005_212164_9BCE9030 
X-CRM114-Status: GOOD (  10.67  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

At its 328.125 MHz default, the lan969x core clock is too close to the
line clock frequencies for the high accuracy phase detectors to work as
intended, which degrades PTP accuracy. The core clock should therefore
be skewed about 200 ppm up. The PTP time of day (TOD) increment is
already set up for the skewed rate, but the driver leaves the core PLL
at its default, so the TOD and the clock that drives the scheduler run
200 ppm apart.

This series programs the core PLL to the skewed rate, and reworks the
PTP frequency adjustment to scale the nominal increment directly. It is
not a fix as such, but an improvement: nothing breaks at the default
rate, and this moves lan969x to the core clock configuration
recommended for PTP.

The difference can be seen with taprio: timestamping the frames released
by a schedule with a 1 ms cycle time shows the gates opening about every
1000.2 us instead of every 1000 us.

Patch 1 adds the CHIP_TOP registers and maps the target.

Patch 2 enables the switch core only after the core clock is
configured, so the PLL is not reprogrammed underneath a running queue
system.

Patch 3 programs the core PLL.

Patch 4 makes the PTP frequency adjustment scale the nominal increment
instead of using a separate one ppm table.

Tested on lan969x and sparx5.

---
Daniel Machon (4):
      net: lan969x: add the core PLL registers
      net: sparx5/lan969x: enable the switch core after clock setup
      net: lan969x: configure the core PLL
      net: sparx5/lan969x: scale the nominal TOD increment in adjfine

 .../ethernet/microchip/sparx5/lan969x/lan969x.c    |   1 +
 .../net/ethernet/microchip/sparx5/sparx5_main.c    | 123 ++++++++++++++++++++-
 .../net/ethernet/microchip/sparx5/sparx5_main.h    |   7 ++
 .../ethernet/microchip/sparx5/sparx5_main_regs.h   |  82 ++++++++++++++
 drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c |  54 +--------
 5 files changed, 217 insertions(+), 50 deletions(-)
---
base-commit: 676f3aace662fbbc180b3898b190a372fa2a516b
change-id: 20261022-lan969x-core-skew-ff5155ead4be

Best regards,
-- 
Daniel Machon <daniel.machon@microchip.com>



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55EB606A86E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 07:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VVRnThCB;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kF0G66oQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=JZNTZBIPPT6kWIhdlMy92xIlPbpJK1QIX3XpzzynkHk=; b=VVRnThCBXt27e2khuNPlKZSVEf
	7bS6+CNjvKP0rqTqfolnAP2kxjn09oy1p2mBrFEEjalrGppYZcTTVuVdXdh0Mz1BT9L4M81YlCn3K
	vE3fKED1enm4SFJ02soHupMRyqAycFHH4TmYhNJ4Y51WFabkkpp9VZwtCqjEG2nOpUMsCTRTDSipb
	a/5kIdXqeWMLCEhkcpX95Nd3oSLvkHK/bpn5hB/1tuBRNU9HFbEQxSeaKp6mDVEQOwvyoeg/9Y5s6
	2URnh18GAf6/UZGOWvCM0rvVWBZL3K6mkduYyvQdaSBrM2Qtp44mCS8bsWGKFSZgZdraFROIb8O0K
	bt7qhNVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg9C-00000002sK8-3YuG;
	Tue, 10 Nov 2026 07:20:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg8l-00000002rLa-0UQC;
	Tue, 10 Nov 2026 07:19:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 59665637CF;
	Tue, 10 Nov 2026 07:19:34 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794295174;
	b=rWCXspyB8kuxANajwMewEoJFIlhwl2V+QQEuvIIvhirJU/uwF06qflpjkaVAH3wtviWI
	 T9IWjR0Lb7UIu4eC6YMoF0zeE1AV+TAKi7RKdh3I4F/5EfdemirWYX5JhpmtEqgg/1Oyx
	 WeMt3wBJxMaBX4O3MmFfyQWN7gv0L4T3Rd6vhH414pYvIfXWCuyKHaE0CpMDtm0ScxjC4
	 o6K0BE6ff9o5ryXfGZI7MVf3fqAlgG8zvERvHDcxVYBSfMgbQSvWXQ72DmstEl6CDBYd+
	 ODbdYU2sniz3Hcb03P9q4G5RXQaj6XJoCrkJd7vNg33nyLzIltmtzS/6aDU8RfO59VA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794295174;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=JZNTZBIPPT6kWIhdlMy92xIlPbpJK1QIX3XpzzynkHk=;
	b=BPgMC5BxU1oTemDFVtI9t92Q5nBYK4cvCjcGhVmBDKOh3dFF12PrfWDL116rOxsyiDeG
	 MLDCUCJ0kkOvb6w0CTtswMCr5sEaAwvtVORBPejAZ1HZGP7uaXLRPoxUPg08eOKkk1U1d
	 Y4aSwVoS3LTLnSerbs96TLqiIrZoaDItGzxHtzW+G1/vrO/W4TZlZ+mXg5bvTKzERrkl9
	 ebx7QoA39Sq7szENDjmh9ommPt5vbYnlhlIEkV5nsjA+V0lyjWpZGbF0fIK0SNUwBqk4n
	 nOym/sPwzhRQqowuHr0+OUYclXgZcLsjjgvxssvlCxT8PGhbYrcx+g9nQdRed2n7Kpg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7CA931F0089F;
	Tue, 10 Nov 2026 07:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794295174;
	bh=JZNTZBIPPT6kWIhdlMy92xIlPbpJK1QIX3XpzzynkHk=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=kF0G66oQt1ZMoKA23Vj0H/GyHVXnz4lSJG3d3ZQcLO90DfI2CLZNAioKeP9erR19r
	 5XbOO1m8dR1VWc24IX3kCEndDuQInVMUTdRePK2fj/HmPJsiV79RdJoIJMt4OkhLLf
	 Zv/s2YXe2onOR15UyBtpt6lng1VIgfDuOFP/dm/Ww0uIHjadX3xK5FBrTIFdqn9MLC
	 KbTBgoFtS6T5fwpnlgHrTDs092rXDSCOvUg6/CHY6BJKNYPGBhQvmQaBkrN2RF+CVN
	 xaRi4+AfETIAoMBE5ACYsSuw/kYv5b37EyBEJx2vwCNkzektz/2cZCFa8TncVZan45
	 bQTeDRROzMsAQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0E98E489C1;
	Tue, 10 Nov 2026 07:19:33 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Subject: [PATCH 0/3] arm64: dts: rockchip: Orange Pi 5/5B ethernet, SPI NOR
 supply and USB-C DP
Date: Tue, 10 Nov 2026 07:19:32 +0000
Message-Id: <20261110-opi5-dts-v1-0-582b63d074be@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMyw5AMBCF4VeRWWvScanLq4gFNRgLpINIxLsrl
 l/yn3OBkGMSKIMLHB0svMweGAZgx2YeSHHnDZGODCJqtaycqm4TlbR5nBRoTaYN+Hx11PP5XVX
 1b9nbiez27uG+H2Knik1sAAAA
X-Change-ID: 20261110-opi5-dts-4b83491c6706
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794295172; l=2440;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=HJ/BXx7+tB60XtSCFZJWcugv6n2lOzZb7iZUXRqozfI=;
 b=5GcNHNcKvKaV4jXPqK/dC/4X9EZf9mooqT4NdHmNcxGE6rWJL8JNsJ1LYJ2mwbqcXZutICLzk
 uaFQaoDtRN0C4xMko4yb7z1nyJwqbpwA7vQAbg65oQhLOin5qMsBzgA
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

Three device tree changes for the Orange Pi 5 and 5B:

1. The YT8531C PHY on gmac1 is described as "rgmii-rxid" with a MAC TX
   delay copied from the vendor kernel; the PCB adds no delay, so the
   correct description is "rgmii-id" (as the Orange Pi CM5 already
   uses), with both delays in the PHY.
2. The SPI NOR flash gets its real 1.8 V supply instead of a dummy
   regulator.
3. The USB-C port gets DP Alt Mode: the FUSB302 connector advertises
   the DisplayPort alternate mode and the graph links the connector,
   the USBDP PHY and the DP0 controller. It uses only bindings already
   in mainline.

Tested on an Orange Pi 5 (RK3588S, PCB v1.2): with "rgmii-id" the link
comes up at 1000/Full and receives at 940 Mbit/s with no errors (with
"net: stmmac: dwmac-rk: only read the delays the MAC applies", sent
separately, the "Can not read property" warnings are gone too); the
regulator summary lists the flash supply under vcc_1v8_s3 and the dummy
regulator message is gone. With patch 3, a USB-C dock (DP-to-HDMI
converter, USB3 hub) enters DP Alt Mode in pin assignment D (2 lanes
HBR2) and its monitor runs at 3840x2160@30 next to HDMI at 4K60, pin
assignment D -> C -> D switches work, 100 of 100 attach cycles
configured DP Alt Mode, and the dock's USB3 devices keep working. The
driver stack used for that test carried the pending "USBDP PHY cleanup
part 3" and dw-dp HPD/Alt Mode patches; the description itself does
not depend on them. CHECK_DTBS is clean for both boards. The Orange
Pi 5B was not tested (no board at hand); it shares the changed .dtsi.

This series was developed with Claude (Anthropic) as a coding assistant:
it wrote the code and the commit messages, and I reviewed and tested
every change as described above.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
Arun Iyengar (3):
      arm64: dts: rockchip: use rgmii-id for the Orange Pi 5/5B ethernet PHY
      arm64: dts: rockchip: add the SPI NOR flash supply on Orange Pi 5
      arm64: dts: rockchip: Add USB-C DP AltMode for Orange Pi 5/5B

 .../boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi   | 92 +++++++++++++++++++---
 .../arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts |  4 +
 2 files changed, 83 insertions(+), 13 deletions(-)
---
base-commit: c3baae5f1a15645cddadcb2b9abddef5df291f59
change-id: 20261110-opi5-dts-4b83491c6706

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>




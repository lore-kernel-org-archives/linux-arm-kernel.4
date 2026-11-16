Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A079F606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 09:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nVlLuLGt;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=tvKd4Z7J
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=sz/ytHr9Wpa7WqWlf+C0CzGHrGjRm0Wk6TtL0RaWyWU=; b=nVlLuLGtYNcuTi2L19O2gu02Ua
	LCddKfJg+jOjDc3hp4SHa2ai5dsyP8tSikfp0/sRZMtU8KCW+JT/F/IonPZ/Mc4ToIs5Ta47LROGN
	1TwblqjUGkg+ldm+Z5B/dlXz8bfhyliwJXcsp/areHTbzQkkGPycJLvRDOkk9eyFWpw3XUydUvfyE
	S9CG7WRg4vj0/u9J1k/wU+pEFpePYfWe0WABN1wX5QRhLJHQVyR+pdYG/dYR125PRGqc1+pSaxbH9
	jnAzcLemUIVyQATC3b2hqAluWySKljUlYia9kntZ3U4RF35cr652aQq1OrninuYkuci92v+1LMQtW
	oKLWVMbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStRh-00000001rDz-2g11;
	Mon, 16 Nov 2026 09:56:17 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStRe-00000001rDD-2XEW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 09:56:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1794822972; x=1826358972;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=nvsMJYaVVCe8GxHgCBUgUEMBnbsD36LbAm5VEdFo2io=;
  b=tvKd4Z7JMVNdBqUZAF5CwRvsAbLrZpPlW9Ehijq7qkWSRoV7e3khz3WR
   izZgLpLBiIWRYAtqfsOnb0cI7MAeToVtHsiHToB67EQ3GuVRQHJ9qohXV
   mkrLwAcloW68fk5N4Jz81YNvJ2Fa+K5R9fzUNR+qeFvaaNyCb/7pTQHRS
   L/W35IF2sjUEha910ydjuqLY2iHg1ZeEovRmn+ciRELe58jqdsS9nMzZd
   HgWpnHiYISRm6nYB5yOaiuklLp/IpbyDfyjdWeNJ0OoOXVF8pPibSDUqM
   gBAcFgkKgBG5PGEvJ5bSDE/hWrJxqkphvJLEWe7s1qSPu4kd8qnnF5KeW
   g==;
X-CSE-ConnectionGUID: 6W+TpeuWTm6cWV37+MGgNQ==
X-CSE-MsgGUID: 2mX59DyTSo2Y1iw3w/9lgg==
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="77268192"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 02:56:10 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Mon, 16 Nov 2026 02:56:12 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 16 Nov 2026 02:56:09 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Subject: [PATCH net 0/2] net: sparx5/lan969x: fix RX ring stall on frames
 from inactive ports
Date: Mon, 16 Nov 2026 10:56:03 +0100
Message-ID: <20261116-sparx5-rx-inactive-port-v1-0-343d8bab58bb@microchip.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADPT+moC/x3MMQqAMAxA0atIZgNGsaBXEYdqU81SS1qkIN7d4
 viG/x9IrMIJ5uYB5VuSXKGC2gb204aDUVw19F1viMhgilbLiFpQgt2z3Izx0ozOm864wU8bWah
 1VPZS/vMCgTOs7/sBXPOqum4AAAA=
X-Change-ID: 20261116-sparx5-rx-inactive-port-df606d3f9b1a
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>
CC: Zhang Hewei <memoriaru@foxmail.com>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_015614_652721_3D16A091 
X-CRM114-Status: UNSURE (   6.86  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sparx5 and lan969x, a received frame whose source port does not map
to an active port is never consumed from the FDMA RX ring: the NAPI poll
stops on it, and finds the same DB again on every following poll.

Patch 1 fixes Sparx5, where the same skb grows on every poll until
skb_over_panic().

Patch 2 fixes lan969x, where RX stops on all ports.

The issue was reported by Zhang Hewei, and these patches replace his
series [1]. Tested on Sparx5 and lan969x.

[1] https://lore.kernel.org/netdev/tencent_D2451CD0D7B4B812CEBADB56DC722BC33406@qq.com/

Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
Daniel Machon (2):
      net: sparx5: fix RX ring stall on frames from inactive ports
      net: lan969x: fix RX ring stall on frames from inactive ports

 drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c | 11 ++++++-----
 drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c          | 12 +++++++++---
 2 files changed, 15 insertions(+), 8 deletions(-)
---
base-commit: aa40afa831ebfe45e40a23721711059f2ac584d4
change-id: 20261116-sparx5-rx-inactive-port-df606d3f9b1a

Best regards,
-- 
Daniel Machon <daniel.machon@microchip.com>



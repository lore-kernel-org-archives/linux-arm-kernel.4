Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731B6606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 09:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FQbVCGUG;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=mGugRIq0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fL4xMvgzojg+WiVMPbFBWFV3mWxVR2K7sLvrVVvLVtU=; b=FQbVCGUGK8VcrI
	BeadvTVgs7kTJtVDTy7QayQxz89EGE5q4QjDOLZ5xGeJLCCkQr+nHE8c5DdtYPJZCgo9eeXL2t94D
	TXYMb5WXu9I9GlPKENbnR+FVtbMLxPKThixwUHhJnPWyziq0dIQHMjnE0kYDKl8s3gVRqE2kVgWMZ
	rhN+otfxFARZ1VTIAGKSA9aj09EfYj/UbywYVZ4wNuJ25Y0dMeSy/SZRfKbMlFZXNvDG0x9c4UuVE
	5JnDbHpXNLrVXn7BnuzpnJtAsaYTL2Kt906ONfn2srFCV/bPsBrNzpS+Ie8+HgXUsEkCMbbV9E6uq
	cjUhGpe0rrQfr1twky0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStRn-00000001rGK-3RsK;
	Mon, 16 Nov 2026 09:56:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStRg-00000001rDW-1RJJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 09:56:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1794822976; x=1826358976;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=AqU0VY4PfPgM56FvvNZrTMho/7crl4ybIv+YY735130=;
  b=mGugRIq0zoJNqUkrZLoz4gr++tYwpOM2BfdM684JYwB44mVmJXVPkGRp
   kssZZ6CnfIf0e9c6rjL5mu5tN5XgBxk+CSKiUUadHS7CID4NLWRd6JzDZ
   V856r96D50JoWGQvo1vqGGol6GKVB5FsSUkuFDDal3VUZkmvFFM2dM4+8
   DZC8tfO3OWXNaqJa6NJTFRBg3E8OfaFrfxlgzTwJaV/WOfb581+vkvHIU
   htZnPEC13Z4jM32okL0ZRhAeuivjbh0n47vpeOBbTov0WmDiGEdUMiiER
   p9RRIENq/3Z2EoAemjYN1LUoiMLeZy/+fK4pCd2OB6kP/x/s4b7GZ7Pls
   g==;
X-CSE-ConnectionGUID: WU7imL2hTwKVUDu7IpqGdw==
X-CSE-MsgGUID: 9jexKbTTQkKcnIomS6Nxew==
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="233613656"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Nov 2026 02:56:15 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 16 Nov 2026 02:56:14 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 16 Nov 2026 02:56:12 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Mon, 16 Nov 2026 10:56:04 +0100
Subject: [PATCH net 1/2] net: sparx5: fix RX ring stall on frames from
 inactive ports
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261116-sparx5-rx-inactive-port-v1-1-343d8bab58bb@microchip.com>
References: <20261116-sparx5-rx-inactive-port-v1-0-343d8bab58bb@microchip.com>
In-Reply-To: <20261116-sparx5-rx-inactive-port-v1-0-343d8bab58bb@microchip.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>
CC: Zhang Hewei <memoriaru@foxmail.com>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_015616_517493_DA90F6EE 
X-CRM114-Status: GOOD (  12.77  )
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

If the source port of a received frame does not map to a port with a
netdev, sparx5_fdma_rx_get_frame() returns false without consuming the
DB. The DB keeps its DONE bit, so every following poll picks the same
DB and grows its skb with skb_put() again. This ends in
skb_over_panic(), or in an RX stall if no more frames arrive.

Drop the frame and return true, so that the DB is consumed like any
other. Remove the extraction queue flush, as the FDMA has already
extracted the frame, and ratelimit the error, as the source port comes
from the hardware.

Confirmed on Sparx5 (PCB135) with a kernel modified to give received
frames an out-of-range source port, which made the board reset. The fix
was tested the same way: only the bad frames are dropped.

Fixes: 10615907e9b5 ("net: sparx5: switchdev: adding frame DMA functionality")
Reported-by: Zhang Hewei <memoriaru@foxmail.com>
Closes: https://lore.kernel.org/netdev/tencent_ACC296C1F221C304053BD0F1F4B0D2C2BA06@qq.com/
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c b/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
index 15ec9b053824f..8675702bf1504 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
@@ -157,9 +157,15 @@ static bool sparx5_fdma_rx_get_frame(struct sparx5 *sparx5, struct sparx5_rx *rx
 		       sparx5->ports[fi.src_port] :
 		       NULL;
 	if (!port || !port->ndev) {
-		dev_err(sparx5->dev, "Data on inactive port %d\n", fi.src_port);
-		sparx5_xtr_flush(sparx5, XTR_QUEUE);
-		return false;
+		dev_err_ratelimited(sparx5->dev, "Data on inactive port %d\n",
+				    fi.src_port);
+
+		/* Drop the frame, but report the DB as consumed so the
+		 * caller advances past it and recycles the DCB.
+		 */
+		kfree_skb(skb);
+
+		return true;
 	}
 	skb->dev = port->ndev;
 	skb_pull(skb, IFH_LEN * sizeof(u32));

-- 
2.34.1



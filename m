Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3236F606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 12:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Sa9VcFwJ;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=korg header.b=zaZpaR+1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=HDShkw84AvJbYZFMLRCPBAjhUqKACatbZB/iOWiANgI=; b=Sa9VcFwJt3liQ5yTl+yWDfqLdm
	duhQ01ZLeAaMrAT62s+oD4iNZULH10IOKHtRnxVeW+Xwijf/6hv838WwKwK2UYSUbpiYYsgeYyswB
	urH1rzuwgweTftzkuDAVs+BoqBfy206WYJie66CzdDxY8FljbZ9QeGbNYOj4tIGpoQ/oGQucH/66u
	Ob+b72uDIjNuZjMNdF9BteSgXg2fyhhvevfjMG296y7IfT/5wdYh636NFUbJQLmiIxgB2sNWuzU7f
	UZ3MYY9hTjRm68qnLxzt7olkLzRKsqb9q+atv763m95l/V991tijaDnA127S9hqmy5xMVrCAysh3/
	WERB/Zxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkyh-00000003qvq-3V2A;
	Tue, 10 Nov 2026 12:29:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkyg-00000003qvd-1pXc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 12:29:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B7A0663454;
	Tue, 10 Nov 2026 12:29:29 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794313769;
	b=qgSXO6P5Dz3SxfFWElMSo+uBna+CvxPqBUXTiFFyPJ6fLU/7LyP9uLr6t09BeE3zTc9i
	 RiuXRM/IFolEcIe3lOID2CjbRQv0AcfXBsyekzwEE5KFlVHt3NTmZ/DI+uBrclEZkPzi2
	 W/ZqTQTjt2Y0DAvHn8jt02OpjrOu0Ev+AGfp5SWbDk/FUsm1tGXkoBKw25Jbtx+qfvd78
	 dBBpWbbzMBPj3NnUOZDAC4YHZxzPJgHrBnaTPxgsP6chLTHuTfBhIOmhDXNhHU8MOChYK
	 HX/DW2Ss8ZwNNBzAeqxji0LeQKjGtw07npaBhx19ypaJd23wf88tQuzkq7jj5Abuqjw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794313769;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received;
	bh=HDShkw84AvJbYZFMLRCPBAjhUqKACatbZB/iOWiANgI=;
	b=ejeFySfW/0OgO0giXWGMOmr+JrbOD44dyQFloYesefGP2jtp0zTOQ9zuK9uScMOuGkpT
	 znM72i/vOs2+Wem7qVqqG74ehfUNXSdPLGJRJs6Il+lP3E6WJg3fydcF6tNvBU92Z0qxn
	 w1POK1fqFTsUcU7xlk8RGIdtk5tBF3QOym++QZG4L1wwTnobpx/AlcEMzjdlvzuCwqfUq
	 w9EkWTU/njpG+9/dVVWQ89f6SQpyO/91iZ5Vv6bnhNTy5Uw7tfnxxSY+LwEwMLh7BES7C
	 WKqfIc0wLfgrmLMRdzHWNhcbgj2N0fSPv06BLht/5L9L0Rn2nlcwt2OqT1fca/nOL2w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D94B71F008A1;
	Tue, 10 Nov 2026 12:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=korg;
	t=1794313769; bh=HDShkw84AvJbYZFMLRCPBAjhUqKACatbZB/iOWiANgI=;
	h=From:Date:Subject:To:Cc;
	b=zaZpaR+1fmXeNU9U6EX2aS4hksFHmaSspHIeoRQdw+6C8JvCA84Ww4xacLCipa+av
	 h6WkEUwNb5GKPU2PFhvjMloo+BrFcpclc1JKqzoENI04i0WbgB21Gy+adtdXJ5DHoR
	 soEzJdsKdlGGn65/PJiby9ZAea3gkxtemLGyUNtM=
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 51AC748B02;
	Tue, 10 Nov 2026 12:29:28 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Tue, 10 Nov 2026 13:29:08 +0100
Subject: [PATCH] remoteproc: imx_rproc: revert channel freeing order in
 imx_rproc_free_mbox
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-imx-rproc-free-mbox-v1-1-3e33ff98570d@linux.dev>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrDuQBBHSq4iLGCc6BROZtBIQ7
 260y7f4/4BMwpTh3RwgtHPmFCv0qwG/uDgT8lQNRplOa2WR14KySfIYhAjXMRV0Thk7ta23RkM
 tN6HA5bn2w9/5N37If+8VnOcFBhEig3cAAAA=
X-Change-ID: 20261109-imx-rproc-free-mbox-aa029d44c921
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 weinshec@holodeck2.de, stable@vger.kernel.org, 
 Richard Leitner <richard.leitner@linux.dev>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794313767; l=4029;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=rNNJZEDgaW7DJ4fiz5yErnGrwanLKG16YmYo4n8oobc=;
 b=lM3N39GVUUMurY+eD75Pypflu4aRSAT1B8iVo7IH+Qj9zTH0nazkdyFmU6YAeo5NHOgpAQdH9
 4MuKUHhmeiRDWufv8cIUK2p2C+fuOS6+WsPXZ3VHLbozgvV5jEGyIFR
X-Developer-Key: i=richard.leitner@linux.dev; a=ed25519;
 pk=8hZNyyyQFqZ5ruVJsSGBSPIrmJpfDm5HwHU4QVOP1Pk=
X-Endpoint-Received: by B4 Relay for richard.leitner@linux.dev/20250225
 with auth_id=350
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

The imx_rproc driver is affected by a race condition in the shutdown
ordering in imx_rproc_free_mbox(). A received message might cause a
virtqueue_kick resulting in tx_ch access. When imx_rproc_free_mbox() is
triggered between the if (!priv->tx_ch) check and the mbox_send_message()
call in the imx_rproc_kick() function the mbox_send_message() then tries
to dereference a NULL pointer on the tx_ch (as seen in the call trace
below).

Therefore fix this behaviour by first freeing the rx channel, so no new
messages are received and therefore no kicking on tx_ch can happen.
Afterwards release the tx channel.

This problem was encountered on a fleet of i.MX8MP devices on about 1 in
500 system shutdowns, resulting in Oops below. This Oops was recorded
from a v7.3.0 kernel before the work-queue removal.

    remoteproc remoteproc0: stopped remote processor imx8mp-cm7
    Unable to handle kernel NULL pointer dereference at virtual address 0000000000000008
    Internal error: Oops: 0000000096000004 [#1]  SMP
    CPU: 0 UID: 0 PID: 32710 Comm: kworker/0:1 Not tainted 7.3.0-XXX #1 PREEMPT
    Hardware name: XXX (DT)
    Workqueue: imx8mp-cm7 imx_rproc_vq_work [imx_rproc]
    pstate: 40000005 (nZcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
    pc : mbox_send_message+0x8c/0x178
    lr : mbox_send_message+0x88/0x178
    sp : ffff8000897f3b70
    x29: ffff8000897f3b70 x28: ffff80007a07b248 x27: ffff0000d90e1a20
    x26: ffff80007a07b328 x25: ffff0000c1d31300 x24: ffff0000d90e1a40
    x23: 0000000000000001 x22: 0000000000000005 x21: ffff8000897f3ba4
    x20: 000000000000000b x19: ffff0000c1b24240 x18: 0000000000000000
    x17: ffff80006a453000 x16: ffff800081ac8000 x15: 0000000000000000
    x14: 0000000000000040 x13: 0000000000000228 x12: ffff0000c115a3e8
    x11: 0000000000000000 x10: 0000000000000001 x9 : ffff800080cd6570
    x8 : ffff8000897f3ba0 x7 : 0000000000000002 x6 : 0000000000000000
    x5 : 000000000000000c x4 : 0000000004400000 x3 : 0000000000000000
    x2 : 0000000000000000 x1 : ffff0000cb268000 x0 : 0000000000000000
    Call trace:
     mbox_send_message+0x8c/0x178 (P)
     imx_rproc_kick+0x50/0xc0 [imx_rproc]
     rproc_virtio_notify+0x3c/0xa0
     virtqueue_kick+0x4c/0x68
     rpmsg_recv_done+0x224/0x658 [virtio_rpmsg_bus]
     vring_interrupt+0xbc/0x158
     rproc_vq_interrupt+0x40/0xb0
     imx_rproc_notified_idr_cb+0x20/0x40 [imx_rproc]
     idr_for_each+0x74/0x100
     imx_rproc_vq_work+0x2c/0x40 [imx_rproc]
     process_one_work+0x194/0x520
     worker_thread+0x19c/0x320
     kthread+0x134/0x148
     ret_from_fork+0x10/0x20
    Code: 37f80574 aa1303e0 97ffff39 f9400a60 (39402001)

Fixes: 99b142cf7191 ("remoteproc: imx_rproc: Request mbox channel later")
Cc: stable@vger.kernel.org
Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
---
Backport notice: For kernel versions before the work queue removal
(<=7.3.y) a cancel_work_sync() should be called on the queue after
freeing the rx_ch.
---
 drivers/remoteproc/imx_rproc.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 581bb07f5893f..232da31a56ebe 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -920,15 +920,16 @@ static void imx_rproc_free_mbox(void *data)
 	struct rproc *rproc = data;
 	struct imx_rproc *priv = rproc->priv;
 
-	if (priv->tx_ch) {
-		mbox_free_channel(priv->tx_ch);
-		priv->tx_ch = NULL;
-	}
-
+	/* First release rx channel as its callback may kick vqs via tx_ch. */
 	if (priv->rx_ch) {
 		mbox_free_channel(priv->rx_ch);
 		priv->rx_ch = NULL;
 	}
+
+	if (priv->tx_ch) {
+		mbox_free_channel(priv->tx_ch);
+		priv->tx_ch = NULL;
+	}
 }
 
 static void imx_rproc_put_scu(void *data)

---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
change-id: 20261109-imx-rproc-free-mbox-aa029d44c921

Best regards,
--  
Richard Leitner <richard.leitner@linux.dev>




Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABF5606A327
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 11:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gLy5vvxz;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=QsnYFTsI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sZTafjTyeOWXRzBQ8qZ5x9oZ2fxlvwimYZth8/s8Z50=; b=gLy5vvxzDES5FJ
	i/2uyAH9NVasFAi11T/JmDKdsFBM9MWfyARWUznzggcI/d3DCmgznRMYaQ9T2aftoQVb4qeUasOld
	XOiUbYLeDqJFx903Dt7kbJbxBxm34yDcDnK2hxiZ8RxpuVK/lnzSVQmbmyCg1FGSx4fMtdMIDBO79
	vC1nHEJ26C1mDngi8miXusCc6ISq2rVIQHyifW4vmERjI0sNNHNcxqKgrY+E+Mxiu4pdCPCPmh7dT
	z8667zmcuyutPgKNffsQzlrPAlE0QzJ1+MqgUibCSuqC5NX2qdWMGo+sV2ve2o5raqPkf0Bn7yDED
	6SMS1MhlAW5taxgWIphQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSpD-00000009e3d-3Jcs;
	Thu, 12 Nov 2026 11:18:39 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSp9-00000009e27-2IXO;
	Thu, 12 Nov 2026 11:18:36 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c67:cdf:7464:6c04:36e4:ee87])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9B058802;
	Thu, 12 Nov 2026 12:16:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794482170;
	bh=qr9Hb6er4o+ZFd61MYiFbrlFhpxANIoccVfFwpqGICY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QsnYFTsIHrX6/KkAbWijLEXEfALSHqPakv7S/+rRWATnfIY9PT7rMEShdoVARWpYV
	 HlrKWMlIX48GLl+gW+QDgxQoEuwp0jAL33rfSpoDSlxu7b07OFqUzF4VYTPnStY0cf
	 y8Rl2HF8QyMx1q3AJKhK0G/9FyGQQ7sPFbd5RvWs=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Thu, 12 Nov 2026 16:47:59 +0530
Subject: [PATCH v5 01/11] platform/raspberrypi: vchiq-mmal: Reset
 buffers_with_vpu on port_enable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-b4-vc-sm-cma-v5-1-d25e3b687e71@ideasonboard.com>
References: <20261112-b4-vc-sm-cma-v5-0-d25e3b687e71@ideasonboard.com>
In-Reply-To: <20261112-b4-vc-sm-cma-v5-0-d25e3b687e71@ideasonboard.com>
To: Stefan Wahren <wahrenst@gmx.net>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Phil Elwell <phil@raspberrypi.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 bcm-kernel-feedback-list@broadcom.com
Cc: Martin Wetterwald <martin@wetterwald.eu>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1246;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=gStDCJS7/a2iM8pYGnW+XInrWVb9ED96mlf7V+9VfTE=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBq9aB0ZWd+V/36zeF0x5dyIlfZAqMxDy0U5AP8/
 aZFhzXMTfmJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCavWgdAAKCRBD3pH5JJpx
 RSpaD/9OHniUuocrfClzq6WsIMt5BaIb27T8FG1PLPMyBIM2xUBxWgnM1fyZez7KnHU1FL6/lKO
 liQCFB6kEy8v+Onsx/xYk6NujBjZYtso66Gn6bBrOa9oYvy7Ikx4q0bqhCpxsUYSMFIqZNzrBsn
 bV3HHD+kBtnieGXK73sR0RS0wHSBwhuDweTq1Td6vD0GpdbxjQmmXzcUyNTsWEX1U+wIc+FfXPM
 6POsb26xQuyBoOhCWpa3xZYxDeI5+OfkTYU0Dg/P2+YK05d1tA6pYEKIqQjycanhX+Pm28SeoSm
 PkB3hPKmHfsjvqU5THCtNM3WETR40FAx0w0xWxzxUWeqYeSHC1h5gPift5kwyWlcAHGvr1/BKQb
 xkGal57DMS13kZQIgGH7a7lZLMLcHoNd0Rn2gxX5BLOOfP+zseWsfjbViK+wutz613Rqg0zjXD8
 9Jj4yY83pjicrmh6dPBIz43a+bcaPiwqxRN8rL3H0A8ItxYIUv+a8q/zamvup2d4g/Co1d4wD7b
 j9fiOWSDC/7DHYV1noNdxt6c8lRNySU0CfiVJZWS0xq/hgPr9eHBrctX5LoVnIoVakkqQOmWvqR
 /fq74O5nA56mKKHmeFo9cPFmMW1bBkM2ywnMdfzYH2rOP6oF+tD/YbrXdr1A/KOyaOxLFURXe5h
 gPb8qb7G4muoHiw==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_031835_746654_AEE703F0 
X-CRM114-Status: GOOD (  10.23  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

Should we go through the timeout failure case with port_disable
not returning all buffers for whatever reason, the
buffers_with_vpu counter gets left at a non-zero value, which
will cause reference counting issues should the instance be
reused.

Reset the count when the port is enabled again, but before
any buffers have been sent to the VPU.

Fixes: 70ec64ccdaac ("staging: bcm2835-camera: Ensure all buffers are returned on disable")
Cc: stable@vger.kernel.org
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c b/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
index c89c16fb8b33..918c30d84ba0 100644
--- a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
@@ -1364,6 +1364,8 @@ static int port_enable(struct vchiq_mmal_instance *instance,
 
 	port->enabled = true;
 
+	atomic_set(&port->buffers_with_vpu, 0);
+
 	if (port->buffer_cb) {
 		/* send buffer headers to videocore */
 		hdr_count = 1;

-- 
2.56.0



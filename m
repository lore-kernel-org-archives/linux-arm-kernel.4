Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305A660A261B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 11:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0t1L/vvd;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=lK2AqCxG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8PaTPRfY18/VrkHR3rlFWu2zaXTlaADkuWpNQpBjuZ0=; b=0t1L/vvdQayo6o
	ElDSwcgr/N3xxMnZOWvfe56MUG2IjS0qnpvHi/b6euTUNHqbPJetNqvrR1bQphKSCL+lLEuZM4r2o
	paA/gxu0bL9vaG8k+3af9nnz/A+SbbWX4sauc0wdjSLAn91nvjiv+KZPWKccw0LoLa6RX8ghVgqRl
	SQro0g63Ynl1jEjIUGyF6JFwEa5+uOsmML7rD++5iFnFjE1YDY5dRIyiqtRHk+vxQE9mr1ViPbdSx
	tGLpAhatyNyeACPdwuUFBlJGI7MNsc2DOaw7tdhsXFY5UJmJBIiCIl/IQyCvd/RtE3ZLE8gH2kCxt
	/XO14O5QM+Kx9J4uFF1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSpb-00000009eGS-2Orn;
	Thu, 12 Nov 2026 11:19:03 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSpU-00000009eD0-49R0;
	Thu, 12 Nov 2026 11:18:58 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c67:cdf:7464:6c04:36e4:ee87])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6515633D;
	Thu, 12 Nov 2026 12:16:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794482191;
	bh=CNvO+8+4X3vZ3+dwSeXTIkMpEyJGlbKDDed/6QEVRzM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lK2AqCxGcEH+5Jdz2JbN0TXkWgBngR4tYVohgWpSfOgBLYxPZK9lvziwAkiPS3MRj
	 Fv1mPBQYsAGLRQWzz0+492lrtF55yC3XguZGgJ9ENNG0wO/2FpM0N0zPu6C1XWrIwj
	 E77V4EoG0FQ18OQipIMEXvS09N8qqfui4KDnxdVM=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Thu, 12 Nov 2026 16:48:03 +0530
Subject: [PATCH v5 05/11] platform/raspberrypi: vchiq-mmal: Support sending
 data to MMAL ports
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-b4-vc-sm-cma-v5-5-d25e3b687e71@ideasonboard.com>
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
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1944;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=obSwlVdM608icuVl5+YqF7zv8oNbUjjskp6328gSnko=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBq9aB4KjXm53vEFC2Ox3e3/JGfP9x38YpKfj6Dq
 ASo4JfalJWJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCavWgeAAKCRBD3pH5JJpx
 RfcaD/9D9sW9bBcqrq4VykqwwaVwsfV+vxb5Qgfl8sE7TBPcjSInosaBsOCwwOenJCbknfAeEkB
 lOP+8sjtBXJf0LDaIc0ZVs2+g2mN7V59I2BiwHmZREUqQsorM8tBIfg3soiz/+S6toh9B3s68Q6
 rCvD0lC04RZdBsbiFVz2/Ezr/fioD7YwqhpB1e5zmqD7goOJvYwU1Mi2GYTbNAsfR9Y7tqMefNa
 oiQxi9rL6ao9btaA9yCDMoNh4Bk2WLSVmXwm7YrJNS6GeepS+xSYyClXD3LWE7HLJzwLJf3g3Ak
 5hRyR78sF7CrNH37BS36BlX014xPod6wEPmLG3CGMH2jEUy0/d4uqhP8UUzkvC/3zZFT7SxfUhH
 VknI/8dYCnlPzlyTdiVJU+ce6M3BNWdRZMtHUhS7xs1n1yvzXweG7D4lI5BPzV9/NR+5HJyBqUy
 GrGGSbZnt0iu8PRgfCv7cwcN3KJqJINlNr4bpDCWgODct33Gn5bCMFlC3ee15Z2hFDhZMkSYloO
 Se1dlXPVjkbTWqMUJofyEhsuQRqIkhyUSF4YjxSULBiNhFAksDmsSeToQuC5nP0OgZo4W89YQ0Z
 6X+Mh6/3TRH7ymEI63YYyjWZE+cwNE1bQjWBHJIKgLD2n+oLBZwBMp+eAiTKT7rzkB1T2GU8BpY
 iMFuEzlrq8DzjLg==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_031857_502698_1B80BE3E 
X-CRM114-Status: UNSURE (   9.35  )
X-CRM114-Notice: Please train this message.
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

Add the ability to send data to ports. This only supports
zero copy mode as the required bulk transfer setup calls
are not done.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c b/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
index 2909def73f3d..5091bcaddd11 100644
--- a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
@@ -430,11 +430,19 @@ buffer_from_host(struct vchiq_mmal_instance *instance,
 			(u32)(unsigned long)buf->buffer;
 
 	m.u.buffer_from_host.buffer_header.alloc_size = buf->buffer_size;
-	m.u.buffer_from_host.buffer_header.length = 0;	/* nothing used yet */
-	m.u.buffer_from_host.buffer_header.offset = 0;	/* no offset */
-	m.u.buffer_from_host.buffer_header.flags = 0;	/* no flags */
-	m.u.buffer_from_host.buffer_header.pts = MMAL_TIME_UNKNOWN;
-	m.u.buffer_from_host.buffer_header.dts = MMAL_TIME_UNKNOWN;
+	if (port->type == MMAL_PORT_TYPE_OUTPUT) {
+		m.u.buffer_from_host.buffer_header.length = 0;
+		m.u.buffer_from_host.buffer_header.offset = 0;
+		m.u.buffer_from_host.buffer_header.flags = 0;
+		m.u.buffer_from_host.buffer_header.pts = MMAL_TIME_UNKNOWN;
+		m.u.buffer_from_host.buffer_header.dts = MMAL_TIME_UNKNOWN;
+	} else {
+		m.u.buffer_from_host.buffer_header.length = buf->length;
+		m.u.buffer_from_host.buffer_header.offset = 0;
+		m.u.buffer_from_host.buffer_header.flags = buf->mmal_flags;
+		m.u.buffer_from_host.buffer_header.pts = buf->pts;
+		m.u.buffer_from_host.buffer_header.dts = buf->dts;
+	}
 
 	/* clear buffer type specific data */
 	memset(&m.u.buffer_from_host.buffer_header_type_specific, 0,

-- 
2.56.0



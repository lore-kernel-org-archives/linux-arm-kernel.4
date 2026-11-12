Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3DA606A8A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 11:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3OyN4k/V;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=h4G+V6IK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pZt9hvWBdMeEBrkpt//n9ESeZbnkVdCvqzoNQxDnniw=; b=3OyN4k/VVxakuF
	GC3jd28p8nyUXXDaHd8ZMPoSL9Fx3oYUZelqkVJcCTCuQgjqEux8e0/8+x00tlW6u4/LS0ct6baJm
	nhaBpFMbp2zrrYeAiuWp4hjEiuihPwzMSZCputZJqS2MK55wSsNI17wvqwQfiGf39Bj3HkcnuCvu1
	kFnR07MaHhu1pRFUN3WFobK65kQogrekcZtEVO9xZ2510BqgFTBrhUmjI/wG77EGRybMExJXPwm1e
	4lkagWZ+MqbGwSLMBagTtx2C3Bs1IVoHtKAXeB58bmQ6vwYehXgYaKMlKdiVe68uDnQzb9KrT5dG8
	EPbz7b65RB2QKd+vWHTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSpu-00000009eTB-4BzP;
	Thu, 12 Nov 2026 11:19:23 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSpf-00000009eIF-05aY;
	Thu, 12 Nov 2026 11:19:10 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c67:cdf:7464:6c04:36e4:ee87])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 61814802;
	Thu, 12 Nov 2026 12:16:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794482201;
	bh=VNxGEP2sK9V1GZwt5ANA2WUrpwBvB9qwok8jWl9aNFY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=h4G+V6IK38S2NjnHkY28BssLT+JnZxtGfX6MdDm4zzUUA87WEhnFIdexUd0s+Pt7F
	 AXUCiGqOZX9JjnkYs9kNqTU+GToIHddPfpWKJCJVU4tXRHhLQ6II4VlhX/YC74sBrc
	 wxwUXdexf+R7ReZwPfKEBY5dX5PcPGlqICw+DZc0=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Thu, 12 Nov 2026 16:48:05 +0530
Subject: [PATCH v5 07/11] platform/raspberrypi: vchiq-mmal: Include missing
 headers
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-b4-vc-sm-cma-v5-7-d25e3b687e71@ideasonboard.com>
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
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Paul Elder <paul.elder@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1027;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=VNxGEP2sK9V1GZwt5ANA2WUrpwBvB9qwok8jWl9aNFY=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBq9aB6Jfv3cNo08PUAnoKItFaP20sQasELEVc1Y
 w6xhee9maOJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCavWgegAKCRBD3pH5JJpx
 RTE0D/9kyjOxl/OKFzY8AkVCWbW6N3gSbKrIxZpfRwT8jiK6jby+yVjt3rCMIia94QS3Op3NUUe
 f+ioMTbUek8a2sc2Vk/S24qLVtb2TxVq7Wd1G+ecHlO5UpTpInofCjT4+4ATCn0RHmaxUl0W/m3
 ARmIjnbdphFTmR37E2DVDXR3Hhc/bgLVBOKwpPG5CYHXbgiPSPjNKhvIG4eKzlWQX8AYcBBXqn5
 3Iar3Bbj4/oQj4Sey5R7icH52LrTKjN9QD+Yx1h5/HgKqie8YBrAO4HGS/ZhKhk33xoAeumRrkW
 8EI47Gxa3QotI1F4Dgru60UMwFsobbXWZYkxocQ7kdiDRqN//jUCtelD+fBZssLZmIa9ufnEJkg
 8lqUD8aJ8khFStcZtmFrtQC958uWrEQkTiUfqhrXiSM2VMDG203RxuzpY3HjIHeTr5rrgE5o0Ac
 yVntnKDB0ZMTmxIzuZdtBScsywrR8gG4ZCVsgbK8+3fXxKO0GNrZinkFs+9hBLGAHCWGyeDi02+
 RIqmojZ+VS5GO+yJKtsDTSzkbzyD1c6yUsVdNkDa/D5uKcFQEgrt/LxO4Fa4jExU1603bUdeq5N
 cvf5C3al+2o//TyB+j+S9hAfB7OaidDovQKVZ5Ie1YsmzMLiB+BQuHNr155ociw8y+c6yXEUVN2
 itgp8GXxBx0Z0dg==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_031909_610127_B1013220 
X-CRM114-Status: UNSURE (   7.68  )
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

The structures defined in mmal-common.h use types related to lists and
videobuf2 framework, but are missing the explicit includes for them.
Include those.

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
Tested-by: Paul Elder <paul.elder@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h b/drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h
index 6c5092a68b99..c9976bdd7490 100644
--- a/drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h
+++ b/drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h
@@ -16,6 +16,10 @@
 #ifndef MMAL_COMMON_H
 #define MMAL_COMMON_H
 
+#include <linux/list.h>
+#include <linux/types.h>
+#include <media/videobuf2-v4l2.h>
+
 #define MMAL_FOURCC(a, b, c, d) ((a) | (b << 8) | (c << 16) | (d << 24))
 #define MMAL_MAGIC MMAL_FOURCC('m', 'm', 'a', 'l')
 

-- 
2.56.0



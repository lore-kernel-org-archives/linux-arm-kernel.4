Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3D6606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 13:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hUA1SrQ5;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=DSaOV/wk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=+lgHrIUN8omQkjb2vy/fSimmUa6BrDWEpsc2sku8LeA=; b=hUA1SrQ56ApqyVJSyfXYBoSKQP
	pFYAJJuxt3j1pSa91h8iXWmVa7tYsccLOmZScVKje3Zf8eOzGjLzRT9T49+7c628aSqNQ+8bzS+y9
	hFoFA3Begmf3mCIzhlqAIjU/s8P9Qk8N9/7CzbCQ5Nwm02lM4Hp9WZqkLWue/7uBLtfoFybUMig7g
	kcAm9f3euZ5lqhF1zuIi2BB2D1G9Mc+/DxB0Ao3Bsue4sXi2LgbqGNbrzYed5yyy+nkPfR2wYunn/
	3mix8HUwIUZJMibhnYfkpIqbssD85ED5+zwAxJc9fCDrImsXInwYUy3jd+sgvo6fkPjgIVMb2LMh9
	/CAq2QDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwpo-00000002e0t-3hOz;
	Mon, 16 Nov 2026 13:33:24 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwpl-00000002dzS-3TBb;
	Mon, 16 Nov 2026 13:33:23 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c67:cdf:7464:6c04:36e4:ee87])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 013044BB;
	Mon, 16 Nov 2026 14:30:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794835849;
	bh=uVbIVduMXaQ//1Z+a/RTdpbY71FZgSk/ZCXtcsVSHUA=;
	h=From:Subject:Date:To:Cc:From;
	b=DSaOV/wk/o36Hzn3tj27NXKwLED87GdF6A7L/E1iDexY1myBnI82lf/XY9G2mwATn
	 i549NDQlI8McMzJSIyR7vcyDttiu/eNH9iSCxWvDGJHqtwXnYT6V4Ur1sqn7UrtJ+I
	 I75RVkd1raCmOCUSz9OqXDZjVKmg0HkW0gm3xEG4=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH 0/2] platform/raspberrypi: vc-sm-cma: Fix sparse and smatch
 warnings
Date: Mon, 16 Nov 2026 19:02:52 +0530
Message-Id: <20261116-vc-sm-cma-fix-v1-0-2b0f11aa96b9@ideasonboard.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQrCMBAAvxL27EKz0Sj9ivSQbDe6h7Sa1CKU/
 t1gjzMws0GVolKhNxsUWbXqPDWwJwP8DNNDUMfGQB15a63HlbFm5Bww6RfP5C7JkUujt9CaV5G
 m/7/7cHCR96dtl0NCDFWQ55x16U3HId6IIodrgGHff/4LN6CPAAAA
X-Change-ID: 20261116-vc-sm-cma-fix-4235f323fd61
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Stefan Wahren <wahrenst@gmx.net>, Dom Cobley <popcornmix@gmail.com>, 
 Phil Elwell <phil@raspberrypi.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Juerg Haefliger <juerg.haefliger@canonical.com>, 
 linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, kernel test robot <lkp@intel.com>, 
 Dan Carpenter <error27@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1053;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=uVbIVduMXaQ//1Z+a/RTdpbY71FZgSk/ZCXtcsVSHUA=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBq+wYT8asi64UqGlqgDqKUsoJkmpWIFXnlZ9auT
 Yukmv4Z77CJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCavsGEwAKCRBD3pH5JJpx
 RYHnD/9nZVI8FbcOg3MW7VhttNwFrsM6ke7Txh18LvQgWU7GAM5m2dSmTVlRmcpG5E3cGwV5nh6
 95KFdn3zbAVP8i2LjwxyHOwR5ZN2HusDq0rtKOsq+zW1D2Ip3ToAEjAGbxCzqYBlK4UYMtdgZmo
 1v6c45ape1infIE0QJvIRSTVzXfLNwYmKmtCE6sshn3R9hNVM12YWDAB829ztz5i0ZRflh8P2y7
 tlivflfgB62WO7wCXHSdrsa9eC0GSoJSPUHPz540k6iVPxpdoImfn0cmPz8+fGGkRAKXRF1jl7p
 TvOkofWU2ZrkmW2I4+PDeQ3gF547b9HH71rFnE4dsSOFHZ65MK0Ok8nIWpb+rZvilvfFB2EqrIe
 WKCxN9XB3vKqH04PFEeJJbRErS6HIXT065OPdynLaR7Xh8XzCdDi5OD5lrK6pgmvrqePCadlO1C
 OuZQkljkvkAUmN7xZN58j6xGNUEJCw/ptPcGOIABOPR0RY1dSkWSkTYVbhoG/cxRCRcHXri8m7e
 QyKRvmU3k6QdFC9JguQFrl9mlSKC57KYD2aX5jlQpLQsuzkPrHTwxMo1MAVWBbFVRHL3LlFSfnV
 51A7xQjCxRannLeG+JPj6n5CF2P4wCNHPtcWoiy5LS0yvA0lLfdht9UaaLMKX2T+VBvBBeknhCc
 QzHFvRaIyEdVmWg==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_053322_022033_FFDF727D 
X-CRM114-Status: UNSURE (   7.72  )
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

Hi Florian,

I've fixed the issues reported by sparse and smatch on my series that
added shared memory support for VC4 based peripherals in Raspberry Pi 4.

My apologies for not running those checks on my machine before sending.

As those patches are now applied in your tree, I have added Fixes tags
using the SHAs for the applied commits.

Thanks,
    Jai

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Jai Luthra (2):
      platform/raspberrypi: vc-sm-cma: Fix get_kernel_id check, pass NULL for pointer
      platform/raspberrypi: vchiq-mmal: Fix warnings in the zero-copy path

 drivers/platform/raspberrypi/vc-sm-cma/vc_sm.c          | 11 +++++++----
 drivers/platform/raspberrypi/vc-sm-cma/vc_sm_cma_vchi.c |  2 +-
 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c    |  8 ++++----
 3 files changed, 12 insertions(+), 9 deletions(-)
---
base-commit: 0cab822bca7a59667774725b83e948b71462290f
change-id: 20261116-vc-sm-cma-fix-4235f323fd61

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>



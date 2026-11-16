Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69BD606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 13:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2ukigNDD;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=OUFkIe1a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fUTAXqM2Le3OJtHSjmOIVEz97bRaEftRxX82qH/aSh0=; b=2ukigNDDpY0emX
	2Tj3nb814Ua1Rnxs3+qEsoqiEVmfI7WbabjK/MfTG+P++Wrwe3eh9XeT1Rn7tlVN0qq0h+1y5i6RL
	vOrKLprjybkd6Hv3/+3rfchw+/iyROUmFR9OuXoNLoaw93j9qo4M4WDuVBINMAoSXMgI1JBR7sGKE
	ANHDobRIzKizOOojMLMphEDk4LGRRiO6yLMQH0cayOsGMGazVfVsc/ZOCl3UsCqYwfqduGQZLDqX3
	quGk88AQkrcPXHqPxt9mVtHWYfNAzz3owJ0D35f24sa3WxRx4CkrcC2iGqNYx2SlIEVUpg8I3OLel
	iKlQPEaI4+eGlK4YA2zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwq9-00000002e7n-2RZp;
	Mon, 16 Nov 2026 13:33:45 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwpt-00000002e1O-0J41;
	Mon, 16 Nov 2026 13:33:31 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c67:cdf:7464:6c04:36e4:ee87])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 57D6C4BB;
	Mon, 16 Nov 2026 14:31:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794835860;
	bh=vdBlHSHVn8+ripcN6GXH7kSJda9nOEeCiSjJ2/h0zX4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OUFkIe1adB1pjbTCXIOdaWF+1bF4vji6spHAPgoNrRZ7XKuULCEysxWkXOiah1KRl
	 iOvnCkcpik6DoWjRU8u+zxD6GK6o0jKK7h1zzvpUe4JwjC4g3+Eb5Vtv3tIWNbkHJO
	 HrzdZHCILTrHm4b+I8K8aQuggKoPgvTY2sglsTbc=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 16 Nov 2026 19:02:54 +0530
Subject: [PATCH 2/2] platform/raspberrypi: vchiq-mmal: Fix warnings in the
 zero-copy path
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-vc-sm-cma-fix-v1-2-2b0f11aa96b9@ideasonboard.com>
References: <20261116-vc-sm-cma-fix-v1-0-2b0f11aa96b9@ideasonboard.com>
In-Reply-To: <20261116-vc-sm-cma-fix-v1-0-2b0f11aa96b9@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2223;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=vdBlHSHVn8+ripcN6GXH7kSJda9nOEeCiSjJ2/h0zX4=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBq+wYV0ZM9t2kXHOt9vcgzPfACvQkshDNp9Fwdz
 jc5/Op7ADCJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCavsGFQAKCRBD3pH5JJpx
 RfpfEACLXn/iegV1rpewad+wkoruJchyQ7ZHN8GP19q6m5ktEqRPdjTqUHTaBkT1flfQ832FYQY
 EOlCcR6xNCd6mRUXt4TTZ5GB3RVNmzoq0DyMhDmF1U8mFvDQlUzg4D5TtN5KSM5cqZKoVrqMJQJ
 EIfCWzmWh7A5pJT8kf4IV85mO90eBE46+v21ed1uaUyRVudtE844vuF3iK+J3E97dsgQRXAyBuO
 Zj0FzdPK8QcVAvJ+shylrxGi8bEi607YP2vfLFkoZ1rAoXEMFj3cLiAYMJL64SEB1C0crFVZYgX
 1Weyx+vjJL2AZNYWqDTMHf8QtYbk7fvyoY6Kwt6g3R/WbV8LQgWIvCSDmXjro6NVBGb1HfabkEN
 VBxGmufePp15j6KhMkQN60Ms9va8HquTH/6I+MpTKHZbyNDfYgzoPK56pLeyP2iGrAG60QmYSar
 Tvf05PnYm+MooykIfg6dAhcMtgCLT8idIQAQP04gGi596PgFm4zzLMs5MyGIUATYSGjOaSTdYjU
 izzpLfGZc4xtriI+40+xPLaWWts4q9uzm/r61lY5yQR4w2TIDXOiWgIYKKPLwGIetW5+DE4qkrt
 /B6y4CKGxU6J5sxM7/9iT6T+LuO7z28VC/OyWgpSxByDK+moMGaRRxQ/f4uBgAHcI/QzYXEoC2E
 FQD8AUmsfKYSw+w==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_053329_270417_265D9B91 
X-CRM114-Status: GOOD (  11.15  )
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

Fix minor issues reported by sparse and smatch around the zero-copy
support added in mmal-vchiq.

If there is no handle present vc_sm_cma_get_vc_handle() might fail,
which we check but end up printing and returing the value of the
undefined `ret` variable. Fix it by returning -EINVAL and dropping `ret`
from the print.

While at it, also fix the stale reference to the function name
"vc_sm_int_handle" in the error print, which was renamed to
"vc_sm_cma_get_vc_handle".

Secondly, during cleanup assign NULL instead of 0 to buf->vcsm_handle,
which is a pointer.

Fixes: 67d0fbe47f8a ("platform/raspberrypi: vchiq-mmal: Use vc-sm-cma to support zero copy")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202611141210.9hmxzD2V-lkp@intel.com/
Closes: https://lore.kernel.org/r/202611141218.5FZTnFtc-lkp@intel.com/
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c b/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
index 8d765aa7ea12..46803ef1e071 100644
--- a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
@@ -1644,10 +1644,10 @@ int vchiq_mmal_submit_buffer(struct vchiq_mmal_instance *instance,
 
 		buffer->vc_handle = vc_sm_cma_get_vc_handle(buffer->vcsm_handle);
 		if (!buffer->vc_handle) {
-			pr_err("%s: vc_sm_int_handle failed %d\n",
-			       __func__, ret);
+			pr_err("%s: vc_sm_cma_get_vc_handle failed\n",
+			       __func__);
 			vc_sm_cma_free(buffer->vcsm_handle);
-			return ret;
+			return -EINVAL;
 		}
 		pr_debug("%s: import dmabuf %p - got vc handle %08X\n",
 			 __func__, buffer->dma_buf, buffer->vc_handle);
@@ -1694,7 +1694,7 @@ int mmal_vchi_buffer_cleanup(struct mmal_buffer *buf)
 		ret = vc_sm_cma_free(buf->vcsm_handle);
 		if (ret)
 			pr_err("%s: vcsm_free failed, ret %d\n", __func__, ret);
-		buf->vcsm_handle = 0;
+		buf->vcsm_handle = NULL;
 	}
 	return 0;
 }

-- 
2.56.0



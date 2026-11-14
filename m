Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A305C606A323
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 01:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dZimeyi5;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=GXlLRdUt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+B9aebVwfiAumfBffTjefgnIhBZHkMO9u3GJcorpwBs=; b=dZimeyi54hjXCG
	XfevCCF5MdaL+s2aH8PWFK6bDwC0dSO2LoqWua5EqdQi03cbeQcbVDz1+VKA+DH7Wv4sCUXKRhSdQ
	SqwAT3nX8UYO7HcSGfmAULTb814mqYDJB9LyvBqoYEGO3E7E5KxUAzBwLoOkDUxu/VRyCDpqAE9Dv
	PRD3TCviqhwUoBpv4vOQVOijoSIggqHj5jGdwKz/uWbLpfSUGznagnZRRjd0V9hYbeed2DRKkZ80I
	P3cPy5935e18qfm12le28d8BgoU6/FBjn11T1DTBB1rarPMSdHJ0+p2sj3H+YDLFoS2akHkhhvANL
	K+a2TltONV4oRaQCTMAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS2AO-0000000EyVo-0Wfs;
	Sat, 14 Nov 2026 01:02:52 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS2AL-0000000EyTl-0V0G;
	Sat, 14 Nov 2026 01:02:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794618166;
	bh=SYxcdDtyKbqLMgK+NpoqNuUD79S7Z8A1s3uyXcWzLZ4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GXlLRdUtTG1TJUvu9wZ6f1hZfQdHAMNUkjVaMfWTOcAfzZHUn9y5xGR8qJ2iHep/d
	 gVJL+8INdgMbwfvK2XZmPvnMpJjSEG5DRDmGxoRJsZ06r3n0NfaQYVo6DZpml422cQ
	 vLh8b9d0qdXTans+eJMniHL4JietSYeRXknFidmNLhvi2NDqZbM/oSZ9P8CEqFbCkJ
	 ANLReUYKLMNlJqLT65KxuCruNzCmKNe6AxoNtYyItJI7Qj8UffslLX9iljAkMYG2ez
	 oE22NXttDlBdnOaMAFEzgugEqiqe/ofc/uwGujDuU3jvgoTDEXkSLEB00+chUhsjBS
	 fvvV8zHmfN9Rg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0E43517E0F7F;
	Sat, 14 Nov 2026 02:02:46 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id C62AB480035; Sat, 14 Nov 2026 02:02:45 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Sat, 14 Nov 2026 02:02:03 +0100
Subject: [PATCH v19 4/6] usb: dwc3: core: add post PHY registration hook
 for platform glue
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261114-b4-rockchip-dwc3-rockchip-glue-v19-4-b79fb5f4b42a@collabora.com>
References: <20261114-b4-rockchip-dwc3-rockchip-glue-v19-0-b79fb5f4b42a@collabora.com>
In-Reply-To: <20261114-b4-rockchip-dwc3-rockchip-glue-v19-0-b79fb5f4b42a@collabora.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
 Igor Paunovic <royalnet026@gmail.com>, Alexey Charkov <alchark@flipper.net>, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-phy@lists.infradead.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2197;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=SYxcdDtyKbqLMgK+NpoqNuUD79S7Z8A1s3uyXcWzLZ4=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr3szXLxyZak1kTZPsvLz4maLq8PemiO7Yql
 76kHj3SupmkCokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq97M1AAoJENju1/PI
 O/qabE0P/iD4GdiX/tOlYqOvtQS88CZ843fg0SfwiPpg9AokapVRQ2qMdAZXaKMUVjT9ZB8LJ3T
 14RQc/slbiq/1M5Zd1LrGvmMnikn8E42j3DNWkY58S6GrpTLyu9qV/CzLSVYqvFKyxHtV6XtRdN
 f2ATTSRGrEZkuOkqiqPjeTTWCXoRiphUSupewknRJ46txys0/Rnr44D1cqyjapHdWPmYFysyFiw
 2InDwiveoa6gDVmwFSv0ziba0yWci313/nGgGdYMJhIeuFgsjddDIJiaCoeeGDfgo18byM8Dq1E
 jVSmJj9cCAAR3PBxGiUNUTv1BudhdNJ9omr8RoL9ppKpm+6INztjZvetAsO0agR7AP+/2lQCy+n
 RvMqRmYuD99oROPUfqpXTv2mWG7Ok9jNGW4plkyLMRqk5k/345k+8FNBfMBENEix1PAI9EWcmZZ
 l9fUjutRaFVax2y7ajobW9yZqXBb+3wS5qBEYxYTMwsUhLB+CVHhG6wXDElq8Du6QWrbyWmQPp/
 7iX8Z+neJFn2FGzpZ8N1V+KMsJMzJ12vt0qhZcOHs47zi3DuzXs7MGuATStUFbNBQcsydo1/4lD
 98qKboGY37qNK8wj6z3Vv0SRw0TgVP/kf6s6lljYATq/ClIu2R4qYgcILkirYCHtdofoPN/75Z/
 Gaho/E3QoBBqrOYRgPugsrg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_170249_349975_7DDBDD40 
X-CRM114-Status: GOOD (  12.28  )
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

Add support for custom PHY handling steps in platform glue code
by adding a post registration hook. This will be used for handling
PHY reset notifications on the Rockchip platform.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Reviewed-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Tested-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/usb/dwc3/core.c | 2 +-
 drivers/usb/dwc3/core.h | 9 +++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 4b7132887a03..daf5aec07fbf 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1613,7 +1613,7 @@ static int dwc3_core_get_phy(struct dwc3 *dwc)
 		}
 	}
 
-	return 0;
+	return dwc3_post_phy_registration(dwc);
 }
 
 static int dwc3_core_init_mode(struct dwc3 *dwc)
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index f3dabb37f806..5f745838b30c 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1002,10 +1002,12 @@ struct dwc3_scratchpad_array {
  *				need to be passed on to glue layer
  * @pre_set_role: Notify glue of role switch notifications
  * @pre_run_stop: Notify run stop enable/disable information to glue
+ * @post_phy_registration: Called directly after PHY got registered
  */
 struct dwc3_glue_ops {
 	void	(*pre_set_role)(struct dwc3 *dwc, enum usb_role role);
 	void	(*pre_run_stop)(struct dwc3 *dwc, bool is_on);
+	int	(*post_phy_registration)(struct dwc3 *dwc);
 };
 
 /**
@@ -1674,6 +1676,13 @@ static inline void dwc3_pre_run_stop(struct dwc3 *dwc, bool is_on)
 		dwc->glue_ops->pre_run_stop(dwc, is_on);
 }
 
+static inline int dwc3_post_phy_registration(struct dwc3 *dwc)
+{
+	if (dwc->glue_ops && dwc->glue_ops->post_phy_registration)
+		return dwc->glue_ops->post_phy_registration(dwc);
+	return 0;
+}
+
 #if IS_ENABLED(CONFIG_USB_DWC3_HOST) || IS_ENABLED(CONFIG_USB_DWC3_DUAL_ROLE)
 int dwc3_host_init(struct dwc3 *dwc);
 void dwc3_host_exit(struct dwc3 *dwc);

-- 
2.53.0



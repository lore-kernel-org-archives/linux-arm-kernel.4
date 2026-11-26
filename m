Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B14606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 17:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T/Mu/NWe;
	dkim=pass (2048-bit key, unprotected) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=ehToWkuS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=az1KsUCOEvIIxorkitpK+gHntZMH7zgdrhguIEfxT5s=; b=T/Mu/NWe4qKkQp
	3yS6hz8g+HE7CnMFlX3SuRshjcIim74/5M/u9UNoYdykQrF40pqkbzHmtSsCTTpDhwZiZR1hZyGZQ
	f9rkGqY0DceQlkocjvFE/VoccVNMIwog5o0mPmoQGNF7kAdK0DaTUf/gjouk9Y/5ocj4VUUADsSpd
	bIKA2ER8Agqnh1OLSEglNkDq/Ni6mJ6Eui5ZiEHaWvnWNi0byX2suS1tFk6YDZhGEs9Xw+V8godwr
	k+TI+mjruTU5UR6GVo/BvadfUs3JFsUtUXscpfm3C3Z9eVuKOgM71tgVei1/26Vm3aXvjE5zZGo58
	khJ0/1lVDbttbUFU+/sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbfd-0000000Dmsp-0YWg;
	Thu, 26 Nov 2026 15:46:01 +0000
Received: from mta-65-227.siemens.flowmailer.net ([185.136.65.227])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbfI-0000000Dmkn-15zM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 15:45:49 +0000
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20261126154536797c120cee0002074c
        for <linux-arm-kernel@lists.infradead.org>;
        Thu, 26 Nov 2026 16:45:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=az1KsUCOEvIIxorkitpK+gHntZMH7zgdrhguIEfxT5s=;
 b=ehToWkuSkfRSEgmoQnk+U0lHjRGQ14iAp8QUhMva97CGG/LkJQrj6Ng4OYZ68Fw3Vd42Vo
 toBBBOqw06G0VRPy/d0q6rFdfsWxWzGiQSJeJMyq3zab+akS3fTYYQIP/RzRFp1ftBXWk+2L
 ubgpv9wY0MtwsdWCW7gwiPcFzoWNa91SEesv9qTEqqg9C09cyd6XgoWa6hPihZ0J0aHQlpKc
 OHzHa+VPybZ3hf0htwTMjdsy52+35WmtpO5sHqbK5Ye6zdoeS9FWHuexyVZXgSCl8B4U4w1x
 P4U6Re1f0T1kuyeMGwWYGrOaeRpwb0Ne/f2Ty8Nj2WDku5t7FbBYco8Q==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: linux-gpio@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Tony Lindgren <tony@atomide.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v2 4/4] pinctrl: single: Drop unused fshift and fmax
Date: Thu, 26 Nov 2026 16:45:25 +0100
Message-ID: <20261126154529.1599568-5-alexander.sverdlin@siemens.com>
In-Reply-To: <20261126154529.1599568-1-alexander.sverdlin@siemens.com>
References: <20261126154529.1599568-1-alexander.sverdlin@siemens.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_074540_836617_E79A3AD8 
X-CRM114-Status: GOOD (  11.93  )
X-Spam-Score: -2.0 (--)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

pcs_probe() derives fshift and fmax from "pinctrl-single,function-mask",
but nothing reads them: fmax was never used and the last user of fshift
went away with commit 2243a87d90b4 ("pinctrl: avoid duplicated calling
enable_pinmux_setting for a pin").

The computation isn't harmless either: a function-mask of 0 passes
__ffs(0) and then shifts the mask by the undefined result.

Remove both fields.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-224208@kernel.org/
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
Changelog:
v2:
- patch introduced

 drivers/pinctrl/pinctrl-single.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index ba5782b6b63d0..9fbc132517c79 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -154,9 +154,7 @@ struct pcs_soc_data {
  * @mutex:	mutex protecting the lists
  * @width:	bits per mux register
  * @fmask:	function register mask
- * @fshift:	function register shift
  * @foff:	value to turn mux off
- * @fmax:	max number of functions in fmask
  * @bits_per_mux: number of bits per mux
  * @bits_per_pin: number of bits per pin
  * @pins:	physical pins on the SoC
@@ -187,9 +185,7 @@ struct pcs_device {
 	struct mutex mutex;
 	unsigned width;
 	unsigned fmask;
-	unsigned fshift;
 	unsigned foff;
-	unsigned fmax;
 	bool bits_per_mux;
 	unsigned bits_per_pin;
 	struct pcs_data pins;
@@ -1843,15 +1839,9 @@ static int pcs_probe(struct platform_device *pdev)
 
 	ret = of_property_read_u32(np, "pinctrl-single,function-mask",
 				   &pcs->fmask);
-	if (!ret) {
-		pcs->fshift = __ffs(pcs->fmask);
-		pcs->fmax = pcs->fmask >> pcs->fshift;
-	} else {
-		/* If mask property doesn't exist, function mux is invalid. */
+	/* If mask property doesn't exist, function mux is invalid. */
+	if (ret)
 		pcs->fmask = 0;
-		pcs->fshift = 0;
-		pcs->fmax = 0;
-	}
 
 	ret = of_property_read_u32(np, "pinctrl-single,function-off",
 					&pcs->foff);
-- 
2.56.1



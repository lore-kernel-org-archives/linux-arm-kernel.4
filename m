Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F89606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 10:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cxeAVaDC;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZQKqgCta
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=8Has6+xC9RPzwVP2kqZn9jyid5dpYq0lsSdFVF0q6BI=; b=cxeAVaDCixRVtyxXiAXy/OUcsz
	5AvrLNalg6Z2jsfjxz+rnqSr9f2WlX+Edx0gdea/SoO9Ok5i+Xm8nNMy0x4WLcB3iJDl/ZV/I9oKe
	yISYsd27qObk1+nUrxaglNfKWFzts35pDd7CtSqhOmPiVOUwsYNkCYRR7FSDbFPUPzYzhpWEhz6Fr
	FzJS33nbsVRni+7UzWBbTxS2LWs79PD9JiT/NWXQ27fGS+RJUsxOn0bYfoXcmkfWJnPRAS5WMp5H8
	IICGY3/GzFVkiLz8rBqucPdjBubpA8rywacDH1stZ68uER/26sGL23Vlfqmq9BcdftNJaS/Izms13
	7muRt5Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzfr-0000000Bb7a-2HUm;
	Thu, 19 Nov 2026 10:47:27 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzfp-0000000Bb67-0EVd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 10:47:26 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so293761566b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 02:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795085242; x=1795690042; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8Has6+xC9RPzwVP2kqZn9jyid5dpYq0lsSdFVF0q6BI=;
        b=ZQKqgCtaMsPpbZCEXMpO4CebWX5Kw9WGD3T5mGqNmxw8dGfrHHmWuJto4HkJwsGK17
         LENbXbmZkGfwV/zN0MycEDc1jMQAlFrFSyBf1Tibdd9c6xp/Z7sBqfSXpgH2wq+eTAR/
         YQFhsIxwGFx3WJG38cvvbUhs1tKwQ3yolfKj5SFoY4GXU8+XTaheUZuHijbGcg5FaAEo
         gevaWUGnnekYCYU+RK5lWMZcnSoh7V5e4Giq/ex9sbm1kzP4N70dob5PreFR2t2FZVF8
         aAJS3ZVKN0Ix5CGBTXUTKdYMwZMHyYGTg53eYcy/rqwpeciLPxt50Q0BNMpM/C1xm5XK
         sSDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795085242; x=1795690042;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8Has6+xC9RPzwVP2kqZn9jyid5dpYq0lsSdFVF0q6BI=;
        b=FBttSSHO6ZoWr7U+3fRsIop+2c6BnRwBcIaYYs9KaOecj4Q8Y81SioaggZ8w1KaBeF
         sMVxgDVazIVmslPsCsSq1E5IbJvVy38ypo6P4hMBcOXHr+UeZV8Tacnd3ib84lDLMZUk
         qyf6nFArbe5eJfRIXzubcsx2Q9WSflWci/Ca7ssLTXlpRN4kSCdQR/DdibPnEYZpiP+V
         WXCyYa22V6GURgXzMuMYTixYWeHUd7AbhDTfD3G46OJM1LQgOUOeGqoCfgAOLVCNQp4T
         vgvpSE+lniAowUQp2V8VCOOEIp7rIVpA1KE8fNM4LjS5qfltSUKXmyrQNKgnN/TI3g0Z
         z8UQ==
X-Forwarded-Encrypted: i=1; AL+hErEjK2LU8bB02XDoBB9YfGhdg8mx3nKWt64P7S4j3ZSlNahVbDOCo8hGx/cI6uY3IGbj1R+ZBG9MVuMgoGintfv9@lists.infradead.org
X-Gm-Message-State: APuU4Z97hgpWYaE1xn5kScK84vZySe7sTmIEAoH70z9uBlxzdyk+YKsT
	6K+oAB4pKWt2b4Rc2a5kat9J0h0I9+W7x8Tv2ftA+HzHpixHG/4NMnpADkruym8AYBk=
X-Gm-Gg: AYBFou3WmNwRGbXlVAPctCwWrwSRbKPs25L4WkfBbz7XU1IUgOxny6kNr/Yv2T9vNFD
	eEyFOucUkCTHPjHvFw/KVjpkeCAwdYlLgbbNRP0YjfyrfhwyAQ0IvBjriOuiGEg1HaXbEcyP95p
	FUfd+uHErBGfGEKe4v9JFfu9kQjE1MK0bC+vhjDqLeyktlM8umE3SVrWnPOCTGOr3GaAJ3lnRfZ
	YDSjVc4nvjhx4o4PoeR1o0Np+H6WpAHjuoTehBBnivFrfK4oI5iy0PxOctOiVePIWCbeQkgnfiS
	2TOTxFJ2qqQWTUt5WdcmPhqnjMhKOoMpXCEyDN6wFvw4jQM3UiyrcHSRkM8HHA/LFRqkZnfrUI+
	FYkH63g9y6GBEtjnF+vnTRcSPD3icQmz+YK5a8wT/DTr0MIiNPqItrOS7rRBJOxWHVc4SCRCHSd
	lvpQaPKu6VhgRw6irlfGDLRqBnnMbHoLD0DC5BofO1k2NwLdhxKvzR8HkbkME6/BlMlpKCsfsuZ
	qeqUvb6cSrFUjkrgWMlQjkfM+VItDt2vYGLdENibnpES47BXESEh7LS7KJ8amZ3oOvdpRtSq7yt
	Ht1hrYxRjp4FbyhH21Z5YGupZ/v/s9ZQm3ULwOdnfAL8Zuvr4zmR18GrqRAqXFoEHKEe5K2YwOu
	polaipr3v/uAZEa6nyw==
X-Received: by 2002:a17:906:f5a5:b0:c48:1977:e1c3 with SMTP id a640c23a62f3a-c510e2ecf42mr554018366b.21.1795085242017;
        Thu, 19 Nov 2026 02:47:22 -0800 (PST)
Received: from puffmais2.c.googlers.com (226.124.90.34.bc.googleusercontent.com. [34.90.124.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51234c9089sm93095666b.72.2026.11.19.02.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:47:21 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 19 Nov 2026 10:47:07 +0000
Subject: [PATCH] phy: phy-google-usb: reset USB3 PHY before init
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261119-lga-usbphy-init-v1-1-1de4e0e6b191@linaro.org>
X-B4-Tracking: v=1; b=H4sIAKvT/moC/x3MQQqAIBBA0avErBtIC6muEi2sRh0IC60opLsnL
 d/i/wSRAlOEvkgQ6OLIm88QZQGz094S8pINspJKCNHhajWecdrdg+z5QK1k09aKjJEKcrUHMnz
 /x2F83w+WqoWUYQAAAA==
X-Change-ID: 20261119-lga-usbphy-init-a624836eff26
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, RD Babiera <rdbabiera@google.com>, 
 Neill Kapron <nkapron@google.com>
Cc: Juan Yescas <jyescas@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-phy@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_024725_145528_7E723947 
X-CRM114-Status: GOOD (  19.32  )
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

google_usb3_phy_init() assumes that the PHY is in reset and that the
Type-C Assist (TCA) block is in its power-on state. Neither is the
case when the driver probes for the first time on Pixel 10, where the
boot loader has used USB before: the PHY is out of reset and
operational (lane0 phystatus is low right away, whereas it takes about
12ms for a PHY that really was in reset), and the TCA has been
switched to USB already (TCA_TCPC reads 0x1).

When the PHY is initialised in that state, the soft reset of the DWC3
controller hangs in about one out of four boots on blazer (Pixel 10
Pro, 12 of 50 boots), with DCTL.CSFTRST still set seconds later:

    dwc3-google c400000.usb: DWC3 controller soft reset failed.
    dwc3-google c400000.usb: error -ETIMEDOUT: failed to initialize core

In addition, google_usb3_phy_power_on() waits for the TCA to report
that the transition to 'no connection' has completed. The TCA starts
that transition by itself after a power-on reset (TCA_TCPC resets to a
request for it). Without a power-on reset there is no such transition,
and the wait only succeeds as long as the event is still pending from
earlier. Just asserting the PHY resets before initialising the PHY is
therefore not enough: the event was gone in 8 of 32 boots then, and
powering on the PHY failed with "PoR->NC transition timeout".

So, before initialising the PHY:
* assert its resets and drop the reference clock request, which is the
  state google_usb3_phy_exit() leaves the PHY in
* clear the TCA's events and request the transition to 'no
  connection', so that google_usb3_phy_power_on() waits for a
  transition that this initialisation has caused

The resets are kept asserted for 1ms. That is the duration that has
been tested, not a documented requirement.

With this, USB came up in 20 of 20 boots on blazer, and in 25 of 25
re-probes of the controller (unbind and bind of dwc3-google).

Fixes: 8c2b331e6327 ("phy: Add USB3 PHY support to Google Tensor SoC USB PHY driver")
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
For now, I've not added stable@ as the phy driver only exists since
7.4-rc1. If this patch isn't applied before 7.4 comes out, it'll need
the tag.
---
 drivers/phy/phy-google-usb.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/phy/phy-google-usb.c b/drivers/phy/phy-google-usb.c
index 2acdb2b0e534..4d70b2f1cfe3 100644
--- a/drivers/phy/phy-google-usb.c
+++ b/drivers/phy/phy-google-usb.c
@@ -8,6 +8,7 @@
 #include <linux/bitfield.h>
 #include <linux/cleanup.h>
 #include <linux/clk.h>
+#include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
@@ -366,6 +367,25 @@ static int google_usb3_phy_init(struct phy *_phy)
 		return 0;
 	}
 
+	/*
+	 * The PHY might be running already, e.g. because the boot loader has
+	 * used USB. Start from the state google_usb3_phy_exit() leaves it in.
+	 */
+	ret = reset_control_bulk_assert(inst->num_rsts, inst->rsts);
+	if (ret)
+		return ret;
+	set_pmgt_ref_clk_req_n(gphy, false);
+	usleep_range(1000, 2000);
+
+	/*
+	 * Request the transition to 'no connection' the TCA does by itself
+	 * after a power-on reset, and clear the events of what happened
+	 * before: google_usb3_phy_power_on() waits for it to complete.
+	 */
+	reg = readl(gphy->usb3_tca_base + TCA_INTR_STS_OFFSET);
+	writel(reg, gphy->usb3_tca_base + TCA_INTR_STS_OFFSET);
+	writel(TCA_TCPC_VALID, gphy->usb3_tca_base + TCA_TCPC_OFFSET);
+
 	reg = readl(gphy->usb3_tca_base + TCA_CTRLSYNCMODE_CFG1_OFFSET);
 	reg &= ~TCA_CTRLSYNCMODE_CFG1_XA_TIMEOUT_VAL;
 	reg |= FIELD_PREP(TCA_CTRLSYNCMODE_CFG1_XA_TIMEOUT_VAL,

---
base-commit: 749a4de370409464cf8501ec5b2451df45c84eb4
change-id: 20261119-lga-usbphy-init-a624836eff26

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>



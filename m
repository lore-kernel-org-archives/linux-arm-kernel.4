Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC29606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 12:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N3sk7vp7;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AN6afmdx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ygaGJYoEs4KFSYAAlwAVylXljw/N65/5dysb1mPUS9Q=; b=N3sk7vp7TDBPCimf/fjQAcwhLq
	FNdcb2/TSRoU7RukPh3qditHIdlpPzc7H+oZSMXVqlHEqbY4tQXvA2fqgiFNjMXJmSxTubpbOK6Rb
	VXy30u/8K4/pY1xK2s82TEtnumaMIEiGro545i0NgXd+WrL0cBqX+TD9WIKKI6Ijrt0av/lT/xFCU
	/e6MYPYaAqW9yz5nB+SwNiGYPQaVjvm4sUl+ywuyvTQNFm44vEarB3ZYN+5FsF3AQRb5scgDH5HYJ
	7TfBS5ExbdkM2GphVsZwQeCA7EDcXyweIsRdytyg/WF6lGmHUGM4dS/iupcfItEAp+ekIb9yYsocM
	0satW9cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ1lo-0000000G79O-1gZ6;
	Sun, 08 Nov 2026 12:13:12 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ1lm-0000000G790-0xu2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 12:13:11 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-49318428d98so21859f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 04:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794139988; x=1794744788; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ygaGJYoEs4KFSYAAlwAVylXljw/N65/5dysb1mPUS9Q=;
        b=AN6afmdxvNNSGoFL7Cq0tpc34Y4OOXYVXrbPP+1z3hnNxl/zdOmtgzb+y+38M/jGks
         l2fn6HfiMimjRvE4lxRP/DdlOYolahVoQ5X0LxA8DrAAAz/7qDHoDqtx3C+xqSh5g+N4
         Vvac8Xi4ANbK9ymzGh/fDVX+qg55PfMtdbxJ1rZQqdTBDP6gz47ejxA5lMAwedPXRe46
         Z7GLifRynZGaeAn/sRGDqYWzbq8wvchpqFITco3gr2l+Y8HYLbiA28tbOgFm+9ajxrMl
         MaqlfxdnJUIk+a8b6rIPqm0ekemya5shn+ssSW+M0CWrcxSAR9ceYEndFrsoSyZd4f4c
         1ybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794139988; x=1794744788;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ygaGJYoEs4KFSYAAlwAVylXljw/N65/5dysb1mPUS9Q=;
        b=EHMqqSrpmLsgeiHFiIL5+Gjwa2iPZfp55XJe/E4QSGW7xOIU6kf8SYhKkO0vwqr2KK
         DBQ6JDpyS+m22RBsEvfBx0196uBDbN/PyjiHSaek4NdxC9ijN+rwV5QCIsP9HuJtIysY
         XgSZ8eLusjKCJ8HFEemgbcqG9s/EQw7VYR52OpBcTJKB9OFDDA8eT9WhKLIt59WhQVfY
         UHVsHQfoocRZ6nlNqKupsjvwyDRBfYoCeZtaF4S9Wb+2+pWG4s6YdKYxKYroDgRIxzQ4
         NfpblKmgSm4BSAxgUD00a0H+wH3MxpxdKO1OfHiDeslg8R7wgdoJkySmhW4vNAUf0N3W
         KE3Q==
X-Forwarded-Encrypted: i=1; AL+hErGJJIyqFSsoMzTdX/e95Li/7ecd+XOGI9gAHJlEPqCvAjyGQpOb7ck0511f/O2Q1X9do/pH3KpxBxbhNGY9VysR@lists.infradead.org
X-Gm-Message-State: APuU4Z9p+fTZoHug/dbYNuLgCpV0tZizRJg8N0ET4gh7PmMJA+PQfogu
	61yearHDO5poV9cYKVuAnzX2Czpnbnq67+42wSlz7fCEpb4V1bBjEW27
X-Gm-Gg: AYBFou3VCWP4yCswpchnP/M8k6soN0Pys5jeW3Cj9MT7ov07tFD6WdfR6+wjsEjN04g
	wSJAwjppzmBtBYPW9nMfH39D8/22bVqNuyQV4MQdDNH1zJ0lQb7xXXuz5RLq2mIByw7yP7E1rUu
	tsyFjkraMbckJQl3PxKbgbwq3fJzJF+6Gd3SubBexmRAqilAL7sBpc7hHFp8+yi0wQbEzuaAlZV
	vISEYtZLQxpCRacqf6f2RX7egWwJ6Y/ToYVHoW5sFmb8bOer1TOm9Veaq1lNBv0I4VC/f4BNUiG
	7OvW7Se00JCo0pokZzG1jxMYSntd9UOUetacTPiRS+IPogjErOAhNAZX5cwbKWxWyDwDD3pYydH
	djuKc4IikAfYE55EnHZGYBWagbHyNTKibYuh/7tFAzJuuwUa/qM70hkE7uwBWPCJcN+Rhwkq9Sg
	vyuaOmkjWnn/F50tdFtxnUosiBJFI0GPggmxmQTSck8R5NuCDv9Omku1jxwvv/8zPEIv7UibU57
	PQ0IBs81trm518er7GQL11tmcNCk36Jol1kkYCN/iOXVBRuK+hilOZvVyqnMhmB+7ZtR19jxX4s
	w+C0pQ/l8J6dK7hYWNgFS5tDeQZarOyK1ZG7HxuxeHCAsmwVSfCG3Tjn7t6DRDweTOdLDS2+h0d
	IoXQyMerJk4vb1ilSMa/pI6vBhUGJMazdH5FXiKZVFk8PKdoZtRs=
X-Received: by 2002:a5d:584e:0:b0:488:823d:5086 with SMTP id ffacd0b85a97d-49583ee2ab6mr3013316f8f.0.1794139987564;
        Sun, 08 Nov 2026 04:13:07 -0800 (PST)
Received: from localhost.localdomain (80-108-121-211.cable.dynamic.surfer.at. [80.108.121.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597090444sm3945815f8f.31.2026.11.08.04.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 04:13:05 -0800 (PST)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Sun, 08 Nov 2026 13:12:59 +0100
Subject: [PATCH] drm/mxsfb: Complete page flips only once the new buffer is
 latched
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-mxsfb-flip-latch-v1-1-ad816b23b646@igalia.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQqAIBBA4avErBtQK4muEi3MxhqwHzQiEO+et
 PwW7yWIFJgiDFWCQA9HPo8CWVdgN3OshLwUgxJKSyl63N/oZnSeL/TmthuS6xrbdkrPRkPJrkC
 O3385Tjl/QGTg9WIAAAA=
X-Change-ID: 20261108-mxsfb-flip-latch-ef53c4526ba6
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Emil Velikov <emil.l.velikov@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Christian Gmeiner <cgmeiner@igalia.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_041310_334736_A7642394 
X-CRM114-Status: GOOD (  22.90  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Christian Gmeiner <cgmeiner@igalia.com>

The controller copies NEXT_BUF to CUR_BUF at the end of each frame. When
a commit writes NEXT_BUF just after that point, the new buffer is only
scanned out one frame later, but the event armed in atomic_flush is
still sent at the next frame done interrupt. Userspace then renders into
a buffer that is still on screen, which shows up as half drawn frames
when a compositor renders directly into its scanout buffers.

Keep the event in the driver and send it from the interrupt handler once
CUR_BUF matches NEXT_BUF, and AS_BUF matches AS_NEXT_BUF for an enabled
overlay. On i.MX8MQ about 2% of the flips completed one frame early
before this change, for both planes.

Fixes: b9f5937680a8 ("drm: mxsfb: Enable vblank handling")
Cc: stable@vger.kernel.org
Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
---
 drivers/gpu/drm/mxsfb/mxsfb_drv.c |  2 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.h |  3 +++
 drivers/gpu/drm/mxsfb/mxsfb_kms.c | 47 ++++++++++++++++++++++++++++++++++++++-
 3 files changed, 50 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 641691fc92c8..d21f12074a81 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -166,7 +166,7 @@ static irqreturn_t mxsfb_irq_handler(int irq, void *data)
 	reg = readl(mxsfb->base + LCDC_CTRL1);
 
 	if (reg & CTRL1_CUR_FRAME_DONE_IRQ) {
-		drm_crtc_handle_vblank(&mxsfb->crtc);
+		mxsfb_crtc_handle_vblank(mxsfb);
 		if (mxsfb->crc_active) {
 			crc = readl(mxsfb->base + LCDC_V4_CRC_STAT);
 			vbc = drm_crtc_accurate_vblank_count(&mxsfb->crtc);
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.h b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
index bdc47ce5be79..9264ca53999d 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.h
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
@@ -49,6 +49,8 @@ struct mxsfb_drm_private {
 	u32				bus_format;
 
 	bool				crc_active;
+
+	struct drm_pending_vblank_event	*event;
 };
 
 static inline struct mxsfb_drm_private *
@@ -61,5 +63,6 @@ void mxsfb_enable_axi_clk(struct mxsfb_drm_private *mxsfb);
 void mxsfb_disable_axi_clk(struct mxsfb_drm_private *mxsfb);
 
 int mxsfb_kms_init(struct mxsfb_drm_private *mxsfb);
+void mxsfb_crtc_handle_vblank(struct mxsfb_drm_private *mxsfb);
 
 #endif /* __MXSFB_DRV_H__ */
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index bbc2a2df9f16..c7e516758a1a 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -328,6 +328,7 @@ static int mxsfb_crtc_atomic_check(struct drm_crtc *crtc,
 static void mxsfb_crtc_atomic_flush(struct drm_crtc *crtc,
 				    struct drm_atomic_commit *state)
 {
+	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(crtc->dev);
 	struct drm_pending_vblank_event *event;
 
 	event = crtc->state->event;
@@ -338,12 +339,54 @@ static void mxsfb_crtc_atomic_flush(struct drm_crtc *crtc,
 
 	spin_lock_irq(&crtc->dev->event_lock);
 	if (drm_crtc_vblank_get(crtc) == 0)
-		drm_crtc_arm_vblank_event(crtc, event);
+		mxsfb->event = event;
 	else
 		drm_crtc_send_vblank_event(crtc, event);
 	spin_unlock_irq(&crtc->dev->event_lock);
 }
 
+static bool mxsfb_crtc_buffers_latched(struct mxsfb_drm_private *mxsfb)
+{
+	if (readl(mxsfb->base + mxsfb->devdata->cur_buf) !=
+	    readl(mxsfb->base + mxsfb->devdata->next_buf))
+		return false;
+
+	if (mxsfb->devdata->has_overlay &&
+	    (readl(mxsfb->base + LCDC_AS_CTRL) & AS_CTRL_AS_ENABLE) &&
+	    readl(mxsfb->base + LCDC_AS_BUF) != readl(mxsfb->base + LCDC_AS_NEXT_BUF))
+		return false;
+
+	return true;
+}
+
+static void mxsfb_crtc_finish_page_flip(struct mxsfb_drm_private *mxsfb)
+{
+	struct drm_crtc *crtc = &mxsfb->crtc;
+
+	drm_crtc_send_vblank_event(crtc, mxsfb->event);
+	drm_crtc_vblank_put(crtc);
+	mxsfb->event = NULL;
+}
+
+void mxsfb_crtc_handle_vblank(struct mxsfb_drm_private *mxsfb)
+{
+	struct drm_crtc *crtc = &mxsfb->crtc;
+
+	drm_crtc_handle_vblank(crtc);
+
+	/*
+	 * The controller copies NEXT_BUF to CUR_BUF at the end of a frame. If
+	 * the commit wrote NEXT_BUF after that point, the new buffer is only
+	 * scanned out from the next frame on. Complete the flip only once the
+	 * hardware has latched it, otherwise userspace gets back a buffer that
+	 * is still being scanned out.
+	 */
+	spin_lock(&crtc->dev->event_lock);
+	if (mxsfb->event && mxsfb_crtc_buffers_latched(mxsfb))
+		mxsfb_crtc_finish_page_flip(mxsfb);
+	spin_unlock(&crtc->dev->event_lock);
+}
+
 static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
 				     struct drm_atomic_commit *state)
 {
@@ -425,6 +468,8 @@ static void mxsfb_crtc_atomic_disable(struct drm_crtc *crtc,
 		crtc->state->event = NULL;
 		drm_crtc_send_vblank_event(crtc, event);
 	}
+	if (mxsfb->event)
+		mxsfb_crtc_finish_page_flip(mxsfb);
 	spin_unlock_irq(&drm->event_lock);
 
 	drm_crtc_vblank_off(crtc);

---
base-commit: 19e67d977d3d4d0c54f03906ef578578190db9e1
change-id: 20261108-mxsfb-flip-latch-ef53c4526ba6

Best regards,
-- 
Christian Gmeiner <cgmeiner@igalia.com>



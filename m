Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB76860A261F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 08:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=G3HIkOCN;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IKN98pP2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=X92Y8+q760KTTL4n4XSfmzYYpr3dLaACGp8eBo1xrHI=; b=G3HIkOCN2Pbm+H
	B7asR4mo9SfCMSNjFm27Dx2RdJoeMRME8qCGMaVOwoX2h3ab6m9H7Up3tR9gclqS1tTc7kPVrgn1w
	+vvH+FQd49ec26E6ya+03lfxs1mJfxU5KRNDUzjw11sZvLV7NYddnzNIWpWMTDi0G4NBtX19yQz3T
	4C/ljUpyp9Qq7dHQO2BbxKeKFTpJSlqOAEWtNqwPfcUE3jptslaPhm0nxSyKzUzAcjb1NVhKkALOE
	k/crRcFT76m1b6EFgjNz4XwleeBf1gxrL5086VOxpsz8Zs1B/ML+yo/m3nNkqngCW2rZl3tZufQLr
	L4Nr1jwH0wHQXoD81a8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxYZ-0000000BBEo-49Dh;
	Thu, 19 Nov 2026 08:31:47 +0000
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxYW-0000000BBDq-1t1B
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 08:31:46 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-382f4710a17so2637585eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 00:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795077103; x=1795681903; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X92Y8+q760KTTL4n4XSfmzYYpr3dLaACGp8eBo1xrHI=;
        b=IKN98pP28kwd1PYRpWSpa5BpomVlqRKbhXPx5bQYSP5a+5M4Vu98lC93TnvlxhWd4o
         9d/ZlxCV4/AyOAeUlXEN1yMEQkn2iiC3Rn14/ViKbZj3+UNVX8V/IXd6UIGxNLS5Mu7y
         shiSMg8qX118SJip2CNlSVG74cu+yz0TeT42LUyON9hk5Tvur5NyJfVEkiJFspTOEo+s
         SJAKYN+yFUSzm1jWShK250QH1FTNP2t4yCfo4vzzsGB3ljer16SQCqnysbGuWhh3c3wQ
         9PmfxvDqjevep59JFhKSqyNZYzuCYFX/crLfvbGJ9Ck56dEh2eRcdw6/jk7Hak/bi5+Q
         5DPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795077103; x=1795681903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X92Y8+q760KTTL4n4XSfmzYYpr3dLaACGp8eBo1xrHI=;
        b=H5MO5OApR2AwAdM5KJvw6h0ETtXEFeGghCiFc5R9NdPlLGINlrtzTnM+yodM1fAIY8
         10nY+oqBVKz1sqqeMOHpE0emJgsqyDh4pFdpjdi21XY0o+EzaS+DBEKbgEOyuMt5WNBo
         XWptac2QcZehwPQjawOHsgkNllcLjEL55PY47yFmoTh7nbX7fLMA3Bq5AgivHEHrwKP+
         SwW11I/JJEwfftjkjuet1qquIgRNToHx0WunrQOA9I6e7OLMkgB8kkGFkhPrlYhZIY10
         pOEB/h5u4Ksx/k76/vpU3NTbt0mXWn3xerlDFR5yK9E4YMtXa74/KCt/XJFs6PvN+6Vr
         blBQ==
X-Forwarded-Encrypted: i=1; AL+hErEDLyVqjRh53SsY9o7fbiP8rE6ycj4iO2pC8vbE04n2goihf9+9xG9eQ/CdPu0yNjEDGP0xNQdtbgwk62fisuxu@lists.infradead.org
X-Gm-Message-State: APuU4Z/U9G8PzKMX3EKrK1AKHKMIehRv1RWCgpzF+AaLLSfnUd/BWlWF
	31wSnS3GGX9ZlrhBegpQRNyQEm9PZPjJ5pWJVQwzYfwCiY3XmByHfL3A
X-Gm-Gg: AZFdTZcZ4l+wwp2yWWLYMgqzEPlxlnnUkTq5ycapYK/TJj5CtMc0Gb8KiD/fc/43fdQ
	5LBv9h5S4BFtHqRSm4r93oje1wOSl7T6HoPxNQFz5GV5XhOazz2BznBuFySOq6PEJ/Kn6kr/Cv1
	kq6ktrDKLVC9UIciqQfUx/EaRQlYBF/5N2/y6zdD9Hy9kCoVWIsp3gGm9Tn28zCMzo9EtCL+Dq0
	2sqYt3CI2X/ip0xLl7hoNkxprHw9jGIidGTZlViZrG+GukMHXJwqSAtNxEt00MKh81XxNTkfUOW
	oUozoB0QpUshkSOvO+sydhFOAoynEdL2xZrwVKLyHuM9H5ZrBz5Wzy0Uc9nAKr/bpNHYS3ylmrp
	GZURmlMjbO07GsRuDjiFFJ26zX0ya7L7lTcd5fnLpL547p5TOLDS+a0046Rb0WWVuYXr7sJvGOS
	W52yk1AiOpvmO14/49qnlxhCstyRBZ8l411S1kW8J5tQH7P94VtlNPAYn0MY4uH1ec9ivysydeh
	R16ZtJIIgLDgJhmx+95yvE3obt+Zs/K1dIXDQzj5Ckq0ubGNmmKVpVOelLxWnH0MCVsITk7q0/q
	rH2ENy2kWWhS50mQFzY9a2st6hXJ1oxrOEMWpkdZ34j1Ds0rvkccGsv1iQzVV0H5TsYvSygBdsF
	0IzRZoxZqr6qnJXUxtOPHXuZt0OVDcueQRx/4rWv/B0+yzG0=
X-Received: by 2002:a05:693c:62ce:b0:384:7b5b:e1d4 with SMTP id 5a478bee46e88-3847b5be8fcmr703529eec.17.1795077103060;
        Thu, 19 Nov 2026 00:31:43 -0800 (PST)
Received: from lwq-server.tail118c18.ts.net ([74.176.208.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a63054ddsm16553792eec.4.2026.11.19.00.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:31:42 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 1/2] drm/msm: release the cursor flip work before the KMS is torn down
Date: Thu, 19 Nov 2026 16:31:32 +0800
Message-Id: <20261119083133.3437277-1-shunsheng1218@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261119023604.1495603-1-shunsheng1218@gmail.com>
References: <20261119023604.1495603-1-shunsheng1218@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_003144_500592_BE252466 
X-CRM114-Status: GOOD (  27.88  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mdp4 and mdp5 queue the BO of every cursor update on a drm_flip_work and
release it from unref_cursor_worker() once a vblank interrupt has
committed it.  The work is cleaned up by a DRM-managed action, so it
runs at the final drm_dev_put(), while msm_drm_uninit() destroys the KMS
and its VM in msm_drm_kms_uninit() and only then drops the reference.

A cursor update that was queued but never committed - no vblank
interrupt after the last atomic commit - is still in the flip work at
teardown.  Releasing it needs the VM that unref_cursor_worker() reads
through the KMS, so the cleanup has to run before the KMS goes away and
not after.

Run the cleanup from the KMS destroy path, which is after the interrupts
and the KMS workqueue have been stopped and before drm_gpuvm_put(), and
remove the managed action so that it cannot run a second time.  The
action is only released for a CRTC that registered it: a partially
failed init can leave CRTCs behind that never added one.

Guard the new CRTC traversal when the KMS has not got its drm_device yet:
the teardown can run on a partly initialised KMS.  This does not make
mdp4_destroy() safe for every such state - it dereferences mdp4_kms->dev
before the loop - and the separate KMS-init error handling series is what
reworks that lifecycle.

This prepares for draining the queued tasks in drm_flip_work_cleanup():
running them from the managed action, after the KMS and its VM are gone,
would dereference the freed KMS.

Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>

---
Changes in v2:
  - New patch.  drm_flip_work_cleanup() is about to run the tasks that are
    still queued, and for mdp4/mdp5 those tasks unpin a cursor BO through
    the KMS and its VM, which msm_drm_kms_uninit() destroys long before the
    DRM-managed action would run.  Release the action from the KMS destroy
    path, before drm_gpuvm_put(), instead.  Reported by Sashiko.
  - Only walk the CRTCs when the KMS already has its drm_device; this
    covers the new traversal only.  The existing partial-initialisation
    path in mdp4_destroy() still dereferences mdp4_kms->dev before the loop
    and is left to the in-flight "drm/msm: fix the error handling of the
    KMS init" series, which is not merged in msm-next yet.
  - Checked as a series: both patches apply in order on msm-next
    (d024361c631b) and on drm-misc-next (fac7a5f16230).
Prepared against v7.4-rc1-1969-g666539eecdf4.

Compile tested only: arm64 with aarch64-linux-gnu-gcc 11.4
and CONFIG_DRM_MSM=m.  The affected hardware was not available, so the
teardown path was not exercised and no fault or race injection was run.

Checked against msm-next (d024361c631b): the patch applies there, as part of
the series it also applies on drm-misc-next (fac7a5f16230), and Dmitry
Baryshkov's "drm/msm: fix the error handling of the KMS init" series is not
merged yet, so mdp4_destroy() still dereferences mdp4_kms->dev before the
new loop.  The guard added here covers the new CRTC traversal only; the
existing partial-initialisation path keeps its current behaviour and is left
to that series.

AI assistance: the analysis, the change and its review notes were
prepared with Claude (Anthropic) as a coding assistant.  The author
reviewed the reasoning and takes responsibility for the content.
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c | 26 ++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c  | 13 +++++++++++
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h  |  1 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c | 27 +++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c  | 13 +++++++++++
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h  |  1 +
 6 files changed, 81 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
index 93050b3c3548c..9767d9aef43d6 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
@@ -54,6 +54,9 @@ struct mdp4_crtc {
 	/* for unref'ing cursor bo's after scanout completes: */
 	struct drm_flip_work unref_cursor_work;
 
+	/* the flip cleanup action is registered on the DRM device */
+	bool flip_cleanup_registered;
+
 	struct mdp_irq vblank;
 	struct mdp_irq err;
 };
@@ -622,6 +625,27 @@ static void mdp4_crtc_flip_cleanup(struct drm_device *dev, void *ptr)
 	drm_flip_work_cleanup(&mdp4_crtc->unref_cursor_work);
 }
 
+/*
+ * Run the cursor flip cleanup now instead of at the final drm_dev_put().
+ * msm_drm_kms_uninit() destroys the KMS and its VM long before that, and
+ * unref_cursor_worker() needs both to release the BOs of the cursor updates
+ * that were queued but never committed by a vblank interrupt.
+ */
+void mdp4_crtc_release_flip_work(struct drm_crtc *crtc)
+{
+	struct mdp4_crtc *mdp4_crtc;
+
+	if (crtc->funcs != &mdp4_crtc_funcs)
+		return;
+
+	mdp4_crtc = to_mdp4_crtc(crtc);
+	if (!mdp4_crtc->flip_cleanup_registered)
+		return;
+
+	mdp4_crtc->flip_cleanup_registered = false;
+	drmm_release_action(crtc->dev, mdp4_crtc_flip_cleanup, mdp4_crtc);
+}
+
 /* initialize crtc */
 struct drm_crtc *mdp4_crtc_init(struct drm_device *dev,
 		struct drm_plane *plane, int ovlp_id,
@@ -659,6 +683,8 @@ struct drm_crtc *mdp4_crtc_init(struct drm_device *dev,
 	if (ret)
 		return ERR_PTR(ret);
 
+	mdp4_crtc->flip_cleanup_registered = true;
+
 	drm_crtc_helper_add(crtc, &mdp4_crtc_helper_funcs);
 
 	return crtc;
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index ab7b62381685f..3fd528eeff0e3 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -136,6 +136,19 @@ static void mdp4_destroy(struct msm_kms *kms)
 {
 	struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(kms));
 	struct device *dev = mdp4_kms->dev->dev;
+	struct drm_crtc *crtc;
+
+	/*
+	 * Release the cursor flip work while the VM is still alive.  The
+	 * cleanup is registered as a DRM-managed action, so it would only run
+	 * at the final drm_dev_put(), long after drm_gpuvm_put() below has
+	 * destroyed the VM that unref_cursor_worker() needs.  The interrupts
+	 * and the KMS workqueue have been stopped at this point, so no new
+	 * cursor update can be queued any more.
+	 */
+	if (mdp4_kms->dev)
+		drm_for_each_crtc(crtc, mdp4_kms->dev)
+			mdp4_crtc_release_flip_work(crtc);
 
 	if (mdp4_kms->blank_cursor_iova)
 		msm_gem_unpin_iova(mdp4_kms->blank_cursor_bo, kms->vm);
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
index 06458d4ee48c9..48cb2b9d896b8 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
@@ -184,6 +184,7 @@ uint32_t mdp4_crtc_vblank(struct drm_crtc *crtc);
 void mdp4_crtc_set_config(struct drm_crtc *crtc, uint32_t config);
 void mdp4_crtc_set_intf(struct drm_crtc *crtc, enum mdp4_intf intf, int mixer);
 void mdp4_crtc_wait_for_commit_done(struct drm_crtc *crtc);
+void mdp4_crtc_release_flip_work(struct drm_crtc *crtc);
 struct drm_crtc *mdp4_crtc_init(struct drm_device *dev,
 		struct drm_plane *plane, int ovlp_id,
 		enum mdp4_dma dma_id);
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
index 1e1fff37380c7..2d457311a3ef5 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
@@ -53,6 +53,9 @@ struct mdp5_crtc {
 
 	bool lm_cursor_enabled;
 
+	/* the flip cleanup action is registered on the DRM device */
+	bool flip_cleanup_registered;
+
 	struct {
 		/* protect REG_MDP5_LM_CURSOR* registers and cursor scanout_bo*/
 		spinlock_t lock;
@@ -1316,6 +1319,28 @@ void mdp5_crtc_wait_for_commit_done(struct drm_crtc *crtc)
 }
 
 /* initialize crtc */
+/*
+ * Run the cursor flip cleanup now instead of at the final drm_dev_put().
+ * msm_drm_kms_uninit() destroys the KMS and its VM long before that, and
+ * unref_cursor_worker() needs both to release the BOs of the cursor updates
+ * that were queued but never committed by a vblank interrupt.
+ */
+void mdp5_crtc_release_flip_work(struct drm_crtc *crtc)
+{
+	struct mdp5_crtc *mdp5_crtc;
+
+	if (crtc->funcs != &mdp5_crtc_funcs &&
+	    crtc->funcs != &mdp5_crtc_no_lm_cursor_funcs)
+		return;
+
+	mdp5_crtc = to_mdp5_crtc(crtc);
+	if (!mdp5_crtc->flip_cleanup_registered)
+		return;
+
+	mdp5_crtc->flip_cleanup_registered = false;
+	drmm_release_action(crtc->dev, mdp5_crtc_flip_cleanup, mdp5_crtc);
+}
+
 struct drm_crtc *mdp5_crtc_init(struct drm_device *dev,
 				struct drm_plane *plane,
 				struct drm_plane *cursor_plane, int id)
@@ -1353,6 +1378,8 @@ struct drm_crtc *mdp5_crtc_init(struct drm_device *dev,
 	if (ret)
 		return ERR_PTR(ret);
 
+	mdp5_crtc->flip_cleanup_registered = true;
+
 	drm_crtc_helper_add(crtc, &mdp5_crtc_helper_funcs);
 
 	return crtc;
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index ff6751b2ae626..834faf9c886ad 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -201,6 +201,19 @@ static void mdp5_destroy(struct mdp5_kms *mdp5_kms);
 static void mdp5_kms_destroy(struct msm_kms *kms)
 {
 	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
+	struct drm_crtc *crtc;
+
+	/*
+	 * Release the cursor flip work while the VM is still alive.  The
+	 * cleanup is registered as a DRM-managed action, so it would only run
+	 * at the final drm_dev_put(), long after drm_gpuvm_put() below has
+	 * destroyed the VM that unref_cursor_worker() needs.  The interrupts
+	 * and the KMS workqueue have been stopped at this point, so no new
+	 * cursor update can be queued any more.
+	 */
+	if (mdp5_kms->dev)
+		drm_for_each_crtc(crtc, mdp5_kms->dev)
+			mdp5_crtc_release_flip_work(crtc);
 
 	if (kms->vm) {
 		struct msm_mmu *mmu = to_msm_vm(kms->vm)->mmu;
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
index 7bf2172fce0bd..b8b8c23b58500 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
@@ -284,6 +284,7 @@ struct mdp5_hw_mixer *mdp5_crtc_get_mixer(struct drm_crtc *crtc);
 struct mdp5_pipeline *mdp5_crtc_get_pipeline(struct drm_crtc *crtc);
 void mdp5_crtc_set_pipeline(struct drm_crtc *crtc);
 void mdp5_crtc_wait_for_commit_done(struct drm_crtc *crtc);
+void mdp5_crtc_release_flip_work(struct drm_crtc *crtc);
 struct drm_crtc *mdp5_crtc_init(struct drm_device *dev,
 				struct drm_plane *plane,
 				struct drm_plane *cursor_plane, int id);
-- 
2.34.1



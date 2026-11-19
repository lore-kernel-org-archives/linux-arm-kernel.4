Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D512360A2609
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 08:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KvRB9WvV;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YMP0sIz+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QE7ZF+eIOkDqPsqdXYso0HkQT1OPcmclWJ4l96GctkY=; b=KvRB9WvVfT0Y4K
	ciuibNj4xNY0quJKJVdHtmKZ8i7IRsGHi6dFHmkC748GCGtyljip5+fV8PYi5NfFPOXzfplsJSS1q
	zV4DoG8r/viMbI2NAYs6hqK/AP5xnZ+dY4B2hcBiAz7iT5CuHqB0eDGJm3dlEqXClK8m4kKu2fr56
	l1MKDxgMKmWRXcDpAG/RJwFYK057Uh7/3LyDSI2pg4CskSqj09LvPYU0N7ZZ9mtunv+J6oOuuy3x6
	7UcxRAv7vkeC/DQ7qs4S/X/ZKBo5C0AWnmVRPgID26+T+Rt3oRS+xY3v8Hv1OEourUL2WiL+0M4af
	lsTkoo6eIjHkXMBeI3Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxYg-0000000BBHj-0eE9;
	Thu, 19 Nov 2026 08:31:54 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxYd-0000000BBG3-0Drx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 08:31:52 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-37198ed3727so808432eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 00:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795077110; x=1795681910; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QE7ZF+eIOkDqPsqdXYso0HkQT1OPcmclWJ4l96GctkY=;
        b=YMP0sIz+41lbagCAUg0Q5VVHCMR1ysMlxYoMsXm8FS1HvRmsc9+6FqKhtiVkTSwFQY
         kLrVWWKTIROWpB3S/GGug2I09cP9s9wfP2g85v5z4o+ZJx70cPw1MMBvVuLPgaIKdhCp
         XwqKTdRaP4MR9X7OQwUOETztexXpPmCzRVxxKFTklGbgUx9/yCN80FM9bqr0DVz7y3H1
         XpliQ6OCKEFIS8WJaBYFgPD4hXA7lShzs/lD0QKpOFnJZpHbbULFiEIq3kMAACJgBCA+
         zdw29AqdlvngLu0Dv7XU/NGf59qAl44h/8nxCKzi2APrE3tW0coQHwC7unzmZPQ1hBSf
         ARoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795077110; x=1795681910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QE7ZF+eIOkDqPsqdXYso0HkQT1OPcmclWJ4l96GctkY=;
        b=ueVYBFJJKhpmqBFcRjXbGkTbBZVR4+NvA9ugCyT9iuGu1xAgFfauaDoW1lDCMezlRt
         UDqqZ/u/PZ1JGQCckP94KesC/ltrTODNir6DqcfO3SrdOFs0YLn0kKOnP2Vxojy0bNwR
         tHW0shGxApd4Pcl975RuQUJNpumk8pZo2F8BrWM67bg1ZR+7gdYlfQi+jN27D19rf9kj
         igF8+HEDnrYfV05J2gRwLdWwiJPkv/oT9FAvIXP5rO9abim3D2/AcuNFjfMoHH1M8XMs
         x1LOCvPbZTNxDo7u1Gra+hwr/f+jwQ2+TgoUAVtkSZBZGhOwlrNzUdrkdhU6n6B6Wu4V
         /Sew==
X-Forwarded-Encrypted: i=1; AL+hErHdti1Q3F0h864v8AzJp+vSFnvYgyDHnTuvNYnnKT3hKLdUw54is9sP9TrpmG8x0ENe5zQU6Ay/2m6t5riw0vZL@lists.infradead.org
X-Gm-Message-State: APuU4Z8XioCtoteAnMmZuP8QdTZN3wxJ1ZifYR2+XMEKZ24A1k2P+hbn
	l66Px6dHwoEUi7uf/b0svM444Gw+iUlN1uQnReSErU9BZyjoXNsfIqN3
X-Gm-Gg: AZFdTZcwOi4ZU/RKSdPDfkzMbW7S/xmRVGzKVr0UvDuY9mDTftEAJBQRuPvrFpxbUo4
	og3uWNfJlXog5JYjDaacmgN8ss/J7y9jx3egmQU8o6W99r/WM2RdnenSe1vAOJDoiAb2VUhtOsu
	H/1Nj/2MeoltPID7epqH4rl6goeGi4VURbOMBxKgnzJ/eW6K00SKtyTOlkXQ9lCBfNOEIyDhsS1
	o2aGJgVyNzf7vZmBVotJ4OehGffMLOBHcZ9nuqARGaAebvTXYdETVMlHRngi2HJVnKsQvbgTYN1
	nb2Lsfbm3KSILSDzjhLyNGAkOQHD0x4htIUj7WZiNLaGxFkUJKhyIjhA3F8tpdkjBUBtC9zf4WC
	fytEnK6TtWTBGlI/dGQgoIQ1LwmZhRJwLk9B3E2FTUR2RZ+xp+Q9L8PkXmPhrpl+8PYMYipeIDG
	fps821dVgCmRzuUDivrhvXHwj7ASWobiOAKDNU0OuSAuB7jHmL0MLoTczxaFwghnEHzoHh3+7Ws
	DBQYKzDr/ccLZw9oWvBj+ohmZ0zsqeXF/FAeoYjdHgIXWTtqP/wOYZdlFJeXEAnl+MZJZLFBDD9
	iqo3VNb91bWWDDQBZm2hcgYSfpRv5psubQFqjTkC+lnC3rDriHAN9HMuIeKpZsxJTxHomQITW7h
	zPQ+Q2+AeJ6fVkEzwXl+KmnQYTYqZ/71PvVuaUxXDjOdgsB/Z
X-Received: by 2002:a05:7301:188e:b0:381:685a:e1ee with SMTP id 5a478bee46e88-384b3e78a26mr413843eec.12.1795077110279;
        Thu, 19 Nov 2026 00:31:50 -0800 (PST)
Received: from lwq-server.tail118c18.ts.net ([74.176.208.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a63054ddsm16553792eec.4.2026.11.19.00.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:31:49 -0800 (PST)
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
Subject: [RFC PATCH v2 2/2] drm/flip: drain the flip work on cleanup
Date: Thu, 19 Nov 2026 16:31:33 +0800
Message-Id: <20261119083133.3437277-2-shunsheng1218@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261119083133.3437277-1-shunsheng1218@gmail.com>
References: <20261119023604.1495603-1-shunsheng1218@gmail.com>
 <20261119083133.3437277-1-shunsheng1218@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_003151_122925_C06E79AC 
X-CRM114-Status: GOOD (  25.34  )
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

drm_flip_work_cleanup() only warns when the queued or the committed list
is not empty.  Nothing cancels the worker and nothing runs the tasks
that are still queued, so the caller silently leaks whatever the tasks
hold (framebuffer references, vblank references, ...) and, if the
worker is still pending, it can run after the structure embedding the
flip work has been freed.

Cancel the worker and run the remaining tasks from
drm_flip_work_cleanup().  The work item is the only producer of the
committed list, so after cancel_work_sync() the two lists can be
spliced out and iterated without holding the lock.

The helper only drains the work items that exist when it is called, so
the callers have to make sure that no new item can be queued and that
the objects the tasks still use are alive:

 - Rockchip VOP: vop_unbind() unregisters the shared interrupt with
   devm_free_irq() before the runtime PM is disabled and before the CRTC
   and its flip work are cleaned up.  Disabling runtime PM is not a
   barrier: vop_isr() bails out when pm_runtime_get_if_in_use() fails, but
   that helper returns -EINVAL once runtime PM is disabled rather than a
   "not in use" value, and the line is shared, so another user can still
   get the handler invoked.  Removing it from the descriptor waits for the
   invocation that is running and keeps new ones from starting, which is
   what makes the drain that follows safe.  The bind error path that fails
   after the interrupt was requested frees it the same way, so every
   request is released exactly once.

 - MSM mdp4/mdp5: mdp4_destroy() and mdp5_kms_destroy() release the flip
   work from the KMS destroy path, after the interrupt and the KMS
   workqueue have been stopped and before drm_gpuvm_put() releases the
   VM the worker needs.  The DRM-managed action is removed there, so it
   cannot run later against a KMS that no longer exists.

Rockchip VOP called drm_flip_work_cleanup() after drm_crtc_cleanup(),
which memsets the CRTC.  Its worker calls drm_crtc_vblank_put() on that
CRTC, so the drain has to happen before the CRTC is cleaned up.

Fixes: cabaafc78935 ("drm: add flip-work helper")
Fixes: 47a7eb459777 ("drm/rockchip: Unreference framebuffers from flip work")
Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>

---
Changes in v2:
  - Split the MSM preparation out into patch 1; the generic helper keeps
    draining the queued tasks here.
  - Add the Fixes: tags for the flip-work helper and for the Rockchip
    ordering.
  - Describe the MSM callers by the new KMS-destroy call site instead of
    the managed action, which now runs earlier.
  - Rockchip: drop the pm_runtime_get_if_in_use() change.  Unregister the
    shared interrupt before the runtime PM is disabled and before the CRTC
    is destroyed, and release it on the probe path that fails after the
    handler was registered.
  - Checked as a series: both patches apply in order on msm-next
    (d024361c631b) and on drm-misc-next (fac7a5f16230).
Prepared against v7.4-rc1-1969-g666539eecdf4.

Compile tested only: arm64 with aarch64-linux-gnu-gcc 11.4
and CONFIG_DRM_ROCKCHIP=m, CONFIG_DRM_MSM=m.  The affected hardware was not
available, so the teardown path was not exercised and no fault or
race injection was run.

Checked as a series against the target trees: both patches apply in order on
msm-next (d024361c631b) and on drm-misc-next (fac7a5f16230).

AI assistance: the analysis, the change and its review notes were
prepared with Claude (Anthropic) as a coding assistant.  The author
reviewed the reasoning and takes responsibility for the content.
---
 drivers/gpu/drm/drm_flip_work.c             | 23 +++++++++++++++++++--
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 21 +++++++++++++++++--
 2 files changed, 40 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_flip_work.c b/drivers/gpu/drm/drm_flip_work.c
index 52c437746d483..b8ce3966fa9ab 100644
--- a/drivers/gpu/drm/drm_flip_work.c
+++ b/drivers/gpu/drm/drm_flip_work.c
@@ -149,10 +149,29 @@ EXPORT_SYMBOL(drm_flip_work_init);
  * drm_flip_work_cleanup - cleans up flip-work
  * @work: the flip-work to cleanup
  *
- * Destroy resources allocated for the flip-work
+ * Cancel the worker and run the tasks that are still queued, so that the
+ * resources they hold are released even if the work never made it to the
+ * workqueue.  Must be called before the object embedding @work is freed and
+ * after the driver has stopped the code that calls drm_flip_work_queue()
+ * and drm_flip_work_commit(): only the work items that exist when this
+ * function is called are drained.
  */
 void drm_flip_work_cleanup(struct drm_flip_work *work)
 {
-	WARN_ON(!list_empty(&work->queued) || !list_empty(&work->commited));
+	struct drm_flip_task *task, *tmp;
+	LIST_HEAD(tasks);
+	unsigned long flags;
+
+	cancel_work_sync(&work->worker);
+
+	spin_lock_irqsave(&work->lock, flags);
+	list_splice_tail_init(&work->queued, &tasks);
+	list_splice_tail_init(&work->commited, &tasks);
+	spin_unlock_irqrestore(&work->lock, flags);
+
+	list_for_each_entry_safe(task, tmp, &tasks, node) {
+		work->func(work, task->data);
+		kfree(task);
+	}
 }
 EXPORT_SYMBOL(drm_flip_work_cleanup);
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index 69e72727da24f..c10ad16147a54 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -1990,12 +1990,19 @@ static void vop_destroy_crtc(struct vop *vop)
 				 head)
 		drm_plane_cleanup(plane);
 
+	/*
+	 * The flip work drops the vblank reference taken when the framebuffer
+	 * was queued, so it has to be drained while the CRTC is still valid.
+	 * The CRTC has been shut down and runtime PM disabled by the time this
+	 * runs, so no new work item can be queued anymore.
+	 */
+	drm_flip_work_cleanup(&vop->fb_unref_work);
+
 	/*
 	 * Destroy CRTC after vop_plane_destroy() since vop_disable_plane()
 	 * references the CRTC.
 	 */
 	drm_crtc_cleanup(crtc);
-	drm_flip_work_cleanup(&vop->fb_unref_work);
 }
 
 static int vop_initial(struct vop *vop)
@@ -2259,7 +2266,7 @@ static int vop_bind(struct device *dev, struct device *master, void *data)
 		vop->rgb = rockchip_rgb_init(dev, &vop->crtc, vop->drm_dev, 0);
 		if (IS_ERR(vop->rgb)) {
 			ret = PTR_ERR(vop->rgb);
-			goto err_disable_pm_runtime;
+			goto err_free_irq;
 		}
 	}
 
@@ -2267,6 +2274,8 @@ static int vop_bind(struct device *dev, struct device *master, void *data)
 
 	return 0;
 
+err_free_irq:
+	devm_free_irq(dev, vop->irq, vop);
 err_disable_pm_runtime:
 	pm_runtime_disable(&pdev->dev);
 	vop_destroy_crtc(vop);
@@ -2280,6 +2289,14 @@ static void vop_unbind(struct device *dev, struct device *master, void *data)
 	if (vop->rgb)
 		rockchip_rgb_fini(vop->rgb);
 
+	/*
+	 * Unregister the shared handler before the runtime PM is disabled and
+	 * before the CRTC and its flip work are cleaned up: disabling runtime
+	 * PM does not keep vop_isr() from running, and the flip work the
+	 * handler commits has to be drained afterwards.
+	 */
+	devm_free_irq(dev, vop->irq, vop);
+
 	pm_runtime_disable(dev);
 	vop_destroy_crtc(vop);
 
-- 
2.34.1



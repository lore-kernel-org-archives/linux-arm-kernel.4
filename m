Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368BB606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 00:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oFbWJVfG;
	dkim=pass (2048-bit key, unprotected) header.d=yahoo.pl header.i=@yahoo.pl header.a=rsa-sha256 header.s=s2048 header.b=it+g67lV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Unsubscribe-Post:
	List-Owner; bh=WJXNh2PJd2ens353IImHbaTef4I9xTZPscOhkc/uKjM=; b=oFbWJVfG6QaD0W
	jziE8dMfd7eGGbznJk1G7zVyQSFd6bZS/9ei603pdKEBR9rY+VXXEuTrBQ2trdggGtZtPTIOtGUNE
	g9N2vv1AlhpWbHvWIxuDPRw7qZxFMaEB7APBRg+3i1Pf8p6tnRMg2qdJabyza5XFo6fS8PF/jV93g
	ruVJsfgJ1nzos0nvDGvceN+H07bE98bAm2P+FLDy9CvGBHutGC18phA6ilmMDzMan6kbI7sefk3Jl
	pbM0dZNH3ZHzpD7sM1IAmMB+Q7GBtw7JJcpktp147BjTKNUgYw8bRBoUJKdbM5HXZ7s7b0t+xr56l
	dLhHV1uz8ubLHX124T1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS1DA-0000000Eqjo-2Ifj;
	Sat, 14 Nov 2026 00:01:40 +0000
Received: from sonic-euwe1-0017.asd.mail.yahoo.com ([34.2.82.16] helo=sonic.asd.mail.yahoo.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS1D8-0000000Eqic-02l7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 00:01:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1794614494; bh=WJXNh2PJd2ens353IImHbaTef4I9xTZPscOhkc/uKjM=; h=From:Date:Subject:Content-Type:To:Cc:References:From:Subject:Reply-To:Content-Type; b=it+g67lVaykmedmtO870W+WnXqjq/dsJk/nxLkbKuCYtUALAS9MU2WoBAT8t3Coq5TXZR7N82GZg6niUWY7AtIkznj3XhSZRSdMpRc/ns4eWknLga8Fo+jA5plnpCzV1GDNn2lLU3d3i/4IP7GBCKml6ZVkd39ryyoU2DtQX8x7A/mv+jzDHWO+ei1D/CEf/tnjZ8TjaJGVhwer1XA0MEbXM90x10mZGXTD74+eeL2mgznwdY+Vk+G5DKV0B4tgOf/kWRu15/DRghhoL3FM6kiJlAJYj51TXKa0aZFrK3Mf5Px9yr/mmOkMLoU2EJAGtUgT/JxQmHlNx1aHI+ZGHxA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1794614494; bh=1G2kZDgkHu8ROPNNnzWVy6q+AD2+/O5N8Azs+CAhqpA=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=dqVbKoQSzJqkCL8u6u11dDqGkZOjl9EWheDcXAjUbm9e4kd47app/NdL5IRWT7+AQuAjlklhUiGhsVaRXUr3Y9qAEdlX7MV1BgoKRdziulj/T9fjLKdJcJdngieUQpo70Kl0+maMcN7NKaUFEs6NFzhFOZ6tH5HjrUBQ2J3bBzP1SDcFkbCiOhGAVVGaBlm355tb7KtImzsllzF35Hm4SxR9G6ZZ+ZS98+NJ4t7OlEbVTQLjjaJZKJJTsYTGX3OtDjhi3LtWVag51EkkkJXDRg4Evw8BaT72FarsoNLL4Lxliu0ohTG9NTkKBDFbxDPkuXclz/GvRG4JHP37n6Xl7Q==
X-YMail-OSG: Iih8yRYVM1llFZh18KVoKH1ja1vvOJirvlMTKsnawlpWK5a9F1R.K4LEwmZEEI8
 8qTUGG6Oao9vQhFqg3kJuPvGRYqnje_ISHhZIUWWOoaDt2MBFshP6Q7Ol3o9c1BAuVByEMQ3bP6p
 IHHlwGAj7rOfZmWt6xbrbN6.PqfZVl5ag.U4ILt1nokhMwJlChfmbU0RBldBE_Nj.uIRH6bozUcb
 StA7Pr1US_.WRvIkSs4FDMuhrr.t1Fbun25ePN6y3Y9.2OqLZpE.yeCIQ46Sw89NrxC1jqzw9y_P
 j6KDqKCemTnAbdzrgkd30W9GvCZ4yv0Gd0lO_YzcKM7Be4kYrMbEGiF1XbnkaL0hNpEYBqYjlO01
 wc52iaK39aoqepioKvc0NU_arhiToUYCLDehmDKdjJSt4sW.GwuL0HmGhxi5Wgemj9rEO0.JyoZD
 Jxr289PXU7i8PC8ThiT2EixDEl_9vMTMFn92pk78zed_VcnLl8CTbtH9v4x45ydh4Iz6PxXhP_Uj
 Or4ezbJ6O2UkNAeZhMaIswLV6KuIM3Sdq9y7vx4DfIBCLf_r14OLPAYr8Grpz62IV19BY0TWC4Kk
 CG1pKJlf92lzP6LEhfvzhdI5EN3QoNdALvnn4z0.5XLAi5PfUZInywFG68uKDT.77LH7dCFprkD6
 xPkTRddg77h4K2xriEGJ9F7JffO6j1EdQYCwl77oItAy4jzhvmDcPua1AVmIyipKZTiu1e2f7Nrj
 qOCZ0Wth3WHw4qls4V7aD9TUomcfyAZmyoG8c9yZ3u_S96F90hyE3JGpyfq1edN9mj7VgI_Gj2n1
 BJ2B1F2eAYATL58ZT1zHlGpncRN7m2NecacHHnHebH0EmMeIoRSjLM0gWYyad12yUrIaOgy76Ulv
 s6Bqk_F_mTaqX5aL_jDGv5kqvRHOQkd5I9oxf5w5Fi6jUmR3bsbuLGqm5xA5GKVstXJxtcZaRzM2
 hpYQoTHCsUA7k5oiiCShbMz76FVz6sVvfVqNgwMVz7intHFOdSpHyn.wwIfym7jk8WldjNdqadWW
 G71nuIkxexOmdgomRDVkjV.6weRMZGcNqFZgpnPRuvy7b0Cd.Qy.cUcOjYohormIUpsKO7W8LJDj
 5xZEw5wMC1AoSYZ33KNWLUOL6AcWUrjxnc49ZAqc_EiRTLaYa8G9Ag5ZiUc97o6lHbDEnFUiXQbx
 pCQ_.C.Mjb3cfxmlqsOTBMy4AXXdJWJu36xMxpoSJnsY7OCE2FxIOdUVnVKWTgeCmCSNsd0KR1_n
 q0v3PuIJC__7jWM7kOgM1PYHnStiLpTNrOzkFi4ivYS8piaTDLfvisbmlqj9n2nj.QIuThpqD5kE
 YnNnwtuIchFWPLD3yqgpXNts5joGMkGrrTr2JfWa624qUazx8J09pfEbPbRIeQC3G9oPQs3GO41Z
 ZlZiwmPfhTKNbawMuvGW.zL1hL0DhCQsVcbYG6NUAFBgBqTybwXTplaWSdCokbqV_ltfs18uXzd6
 D_W_AMV9M5lHCWd2ZQiZm6SChkvfwb1jMoPeiSP.xSp4X4BdxRSpHmlE..7sRrKDMBY6V8BQXrDR
 vVMgOXIq7YdQ1XDn.NizUkjJVQRPwdVrvxyLIKJcB9bXNdHFuIIM1B8U5O0BhbLOugUPyu.EDwYH
 ZAG29Z1MnI0.u290IYhez4m7aWc0Q8YClQCq7LKgvwADLCDyI5kZpU15HXb8NeG72JB_bJ5uRewv
 eZT1MDSn6tneJCznTqcfV_iGgtcH.nx3h0Qo99zEIO363YIkXt848qB1vtN3mmkiNMSXVgO5BDXI
 IDmVob24vSS7caqYEm_KEsxf2i1HjXVGJfjJsa.dAKwjTyphm2fakwGMyHTrdzfKH6aeYUXuySbg
 7sDVLrxHY_Fn7uAfLfvlyanjFO6EOfI_yEElTeejklGuOUDGcHk1xmkTFow.kHSYLfS8VBzahQwi
 t0BKPzWDm3Xam0xNd0PJo6ACGYOpXrhzjS5auDZvWqg.9oyK7vMsTo1i_JuH7t7NitHLAeqBFcUr
 h8q3MN3cc0ypI2X6GepeeVut7Xnk-
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: a7d97a4b-0d43-49c8-84a4-29696db2d27f
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-euwe1-prod-sonicconsumer-svc-101 with HTTP; Sat, 14 Nov 2026 00:01:34 +0000
Received: from dip230.lsn.ir2.yahoo.com ([87.248.99.239])
          by hello (SMTP) with SMTP ID 1eb47652fe02c578610eea290036e4b9;
          Sat, 14 Nov 2026 00:01:32 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Sat, 14 Nov 2026 01:01:29 +0100
Subject: [PATCH] platform/raspberrypi: vchiq: Stop kthreads on
 vchiq_platform_init() failure
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261114-vchiq-probe-kthread-leak-v1-1-b6b2f1e32050@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ6CQAxA4auQrm1CQUf0KsbFMBSmYvjpACEh3
 N0Rlt/ivQ0Cq3CAZ7KB8iJB+i6CLgk4b7uGUapoyNLMENEVF+dlxEH7krGdvLKt8Mu2xaI2dC/
 M42bzHGI+KNeyHuvX+3SYyw+76f+Dff8BVsATy3wAAAA=
X-Change-ID: 20261114-vchiq-probe-kthread-leak-8f6178695a33
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Umang Jain <uajain@igalia.com>, Stefan Wahren <wahrenst@gmx.net>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794614491; l=6275;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=bh5hCZwWosDeXuxywQIhzbGn5P7JzWSwFe3LL3XnAe0=;
 b=yXoD/l81uIFCvHD7iOkUei4y2O34Ka8Ol8x8Qva5sn1vQHcaoJkhAziajGR94MiV6vfcUykyE
 W2QZQSgtwnwBu8C65+GSm+C5PV8fLYRMBSlEvpocT1B7CSPQANKvtoz
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20261114-vchiq-probe-kthread-leak-v1-1-b6b2f1e32050.ref@yahoo.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_160138_214186_0A107886 
X-CRM114-Status: GOOD (  18.16  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

vchiq_init_state() creates and wakes the slot handler, recycle and sync
kthreads. If a later step in vchiq_platform_init() fails, the function
returns without stopping them and vchiq_probe() only propagates the
error. devres then frees what probe allocated, including the driver
data and the slot memory the kthreads operate on.

Forcing devm_request_irq() to fail on a Raspberry Pi 4 Model B makes
all three kthreads fault right after the failed probe:

  bcm2835_vchiq fe00b840.mailbox: failed to register irq=34
  bcm2835_vchiq fe00b840.mailbox: arm: Could not initialize vchiq platform
  Unable to handle kernel paging request at virtual address ffff800080ba402c
  Internal error: Oops: 0000000096000007 [#1]  SMP
  CPU: 1 UID: 0 PID: 370 Comm: vchiq-sync/0 Not tainted 7.4.0-rc1-trace #1
  pc : sync_func+0x44/0x3a8 [vchiq]
  Call trace:
   sync_func+0x44/0x3a8 [vchiq] (P)
   kthread+0x128/0x150
   ret_from_fork+0x10/0x20

If the kthreads are asleep at that point they are left behind instead,
three per failed probe, still pointing at the freed memory.

Map the registers and look up the interrupt before vchiq_init_state().
Neither depends on the VCHIQ state, so these two failures need no
unwinding. On the remaining failures stop the kthreads with
vchiq_platform_uninit(), as is already done when registering the
character device fails. Move vchiq_platform_uninit() and
vchiq_platform_get_arm_state() above vchiq_platform_init() for that,
without changing them.

The missing unwind is older than the commit named below, but the
kthreads could not be stopped before it, so it is the earliest point
this fix applies to.

The bug was found and the fix drafted with the help of an AI coding
assistant (Claude).

Fixes: 863a756aaf49 ("staging: vc04_services: vchiq_core: Stop kthreads on vchiq module unload")
Assisted-by: Claude:claude-fable-5-2
Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
Verified on a Raspberry Pi 4 Model B with a test-only one-line change
that forces devm_request_irq() to fail. Without this patch the three
kthreads oops as shown above. With it probe fails cleanly, no vchiq
kthreads remain after four failed attempts and the module unloads.
Without the forced error the driver probes normally and audio playback
over VCHIQ works.
---
 .../raspberrypi/vchiq-interface/vchiq_arm.c        | 57 ++++++++++++----------
 1 file changed, 31 insertions(+), 26 deletions(-)

diff --git a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
index e78641703252..11764a2590e4 100644
--- a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
+++ b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
@@ -187,6 +187,25 @@ void vchiq_add_connected_callback(struct vchiq_device *device, void (*callback)(
 }
 EXPORT_SYMBOL(vchiq_add_connected_callback);
 
+static struct vchiq_arm_state *vchiq_platform_get_arm_state(struct vchiq_state *state)
+{
+	return (struct vchiq_arm_state *)state->platform_state;
+}
+
+static void
+vchiq_platform_uninit(struct vchiq_drv_mgmt *mgmt)
+{
+	struct vchiq_arm_state *arm_state;
+
+	kthread_stop(mgmt->state.sync_thread);
+	kthread_stop(mgmt->state.recycle_thread);
+	kthread_stop(mgmt->state.slot_handler_thread);
+
+	arm_state = vchiq_platform_get_arm_state(&mgmt->state);
+	if (!IS_ERR_OR_NULL(arm_state->ka_thread))
+		kthread_stop(arm_state->ka_thread);
+}
+
 static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state *state)
 {
 	struct device *dev = &pdev->dev;
@@ -243,10 +262,6 @@ static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state
 	sema_init(&drv_mgmt->free_fragments_sema, MAX_FRAGMENTS);
 	sema_init(&drv_mgmt->free_fragments_mutex, 1);
 
-	err = vchiq_init_state(state, vchiq_slot_zero, dev);
-	if (err)
-		return err;
-
 	drv_mgmt->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(drv_mgmt->regs))
 		return PTR_ERR(drv_mgmt->regs);
@@ -255,11 +270,15 @@ static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state
 	if (irq <= 0)
 		return irq;
 
+	err = vchiq_init_state(state, vchiq_slot_zero, dev);
+	if (err)
+		return err;
+
 	err = devm_request_irq(dev, irq, vchiq_doorbell_irq, IRQF_IRQPOLL,
 			       "VCHIQ doorbell", state);
 	if (err) {
 		dev_err(dev, "failed to register irq=%d\n", irq);
-		return err;
+		goto err_stop_threads;
 	}
 
 	/* Send the base address of the slots to VideoCore */
@@ -268,13 +287,14 @@ static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state
 				    &channelbase, sizeof(channelbase));
 	if (err) {
 		dev_err(dev, "failed to send firmware property: %d\n", err);
-		return err;
+		goto err_stop_threads;
 	}
 
 	if (channelbase) {
 		dev_err(dev, "failed to set channelbase (response: %x)\n",
 			channelbase);
-		return -ENXIO;
+		err = -ENXIO;
+		goto err_stop_threads;
 	}
 
 	dev_dbg(&pdev->dev, "arm: vchiq_init - done (slots %p, phys %pad)\n",
@@ -284,6 +304,10 @@ static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state
 	vchiq_call_connected_callbacks(drv_mgmt);
 
 	return 0;
+
+err_stop_threads:
+	vchiq_platform_uninit(drv_mgmt);
+	return err;
 }
 
 int
@@ -309,25 +333,6 @@ vchiq_platform_init_state(struct vchiq_state *state)
 	return 0;
 }
 
-static struct vchiq_arm_state *vchiq_platform_get_arm_state(struct vchiq_state *state)
-{
-	return (struct vchiq_arm_state *)state->platform_state;
-}
-
-static void
-vchiq_platform_uninit(struct vchiq_drv_mgmt *mgmt)
-{
-	struct vchiq_arm_state *arm_state;
-
-	kthread_stop(mgmt->state.sync_thread);
-	kthread_stop(mgmt->state.recycle_thread);
-	kthread_stop(mgmt->state.slot_handler_thread);
-
-	arm_state = vchiq_platform_get_arm_state(&mgmt->state);
-	if (!IS_ERR_OR_NULL(arm_state->ka_thread))
-		kthread_stop(arm_state->ka_thread);
-}
-
 void vchiq_dump_platform_state(struct seq_file *f)
 {
 	seq_puts(f, "  Platform: 2835 (VC master)\n");

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261114-vchiq-probe-kthread-leak-8f6178695a33

Best regards,
--  
Tomasz Unger <tomasz.unger@yahoo.pl>



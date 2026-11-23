Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC53606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 02:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SdIpA8D8;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=De1Qm5wq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=FuesKcfc1Js7WUTyCvTWz4Cz4pgickMp1cfQzWbE2CY=; b=SdIpA8D8nfGm4f+BZwzOf8k3TD
	GTz7OP6pYwbVnRJRjFyIGyvNsYyDta4Hd+Trx2f5kfIKpJsPZzpwu+IK6ducSEkybrqhbkB+Axzj3
	DF8deAucNaUnEInBtJ7bAN1FNyeKBngJ4TM/Cm7zgGy7jq6GoUJffZ1yl7RFHimCjKLfq0qUGgUPH
	Sps4Aild3U9CukRMhaJtRsOrTcqwlVzAQg1bIfNt8x804Ytj1mWK/jitIIlyfuZvMrP9hgU/EcEt3
	OM6nlgN6AnXreEIgEWpqJFztI4f0gp7b5wAchtTtucTywViEm/f9jbXdJma/jlTM/ecv1HLw8rSrg
	AYnDy05Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVJmy-000000028Bv-2aZz;
	Mon, 23 Nov 2026 02:28:16 +0000
Received: from mail-oa2-x08.google.com ([2607:f8b0:4864:30::8])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVJmu-000000028Aj-1jLx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 02:28:14 +0000
Received: by mail-oa2-x08.google.com with SMTP id 586e51a60fabf-4adade2ee63so417412fac.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 18:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795400891; x=1796005691; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FuesKcfc1Js7WUTyCvTWz4Cz4pgickMp1cfQzWbE2CY=;
        b=De1Qm5wqguPZ15fZXyyUMJZCMKbuPm90M4g/UOx1u7/Uu7lBlO84VsYVS2ZofiUC8N
         EbfynRm+2c3SnzKC3hR01IwryxPbyTAPkKa6gi/N+cwbucqE3qZ1L5M4RPOz/D/dQWOL
         DOKKGn6ryAeCGASlJK2kQpR+oh3RfmE0NF0DxMPq27/+cuBzqh1jecW2JZ0RLs7oGOPM
         lY/ccnk+ICo8+bTxihBHcXtbSzG8mAo6gsbx0kIScKz0e6zplcDgIcNA4KlfttWZ59+o
         l7RKAYahoiDebWtn66E5V1AMqM62DLTyA63Ax1Vinw+U9vQiuBpVO1QZFsNUBOxEoaAJ
         hkjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795400891; x=1796005691;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FuesKcfc1Js7WUTyCvTWz4Cz4pgickMp1cfQzWbE2CY=;
        b=MSnRO6dtJP5hzZDj4SqaAU16/0+Ps0Q/wkV6lpYqSkyFDgh0ry+neB9IrRHGptmoGB
         /rqc0up3D5OaQ8aZZ1C9GTv6JwIJRAciWKY9gvijLdh2VpiD8hNf3twP6q7OyAcKwSlg
         DNZEfh47JmLlYL61GIvj5v3IQhdBfViLrLruKt5WjhzMYmfzfBWkIz3Gr4U+zbWrhTsJ
         sNovp7QbX7LTtC8655L1yqbsfPLlS2d4Qi0KxARs7Kl+mzTEGxd3h3dGQtTWbgZjC56o
         8oHLOlhn4mDjWyanyudFpAfQZ3Pfodjv7kgUJFR2vShGZjQWoWnHUAbx+RROo00Fd1H9
         d6Yg==
X-Forwarded-Encrypted: i=1; AL+hErHvYJhqtSAaf18KK5q994cZWBT55BekPRc6U6qGBeOxXiVrhBknGEduvIP51QtQzHtTokI7UlCoqv5dFyTtcBe6@lists.infradead.org
X-Gm-Message-State: APuU4Z9eRUWDpUgYcs1I5Nb8RsrJSVmN6ozVLrrQuktk0lODv4iRZMEu
	4o3cP5uL8xkUxTSqOUF2jNTHycR/ifWSjX8vIGeUNeJq+S0nXJg5RBHB
X-Gm-Gg: AZFdTZdJN+PBK2GoFf84vabx5qjL+7o3FmnTKzbY/I6vVb8bCYH9lDHUpJa72qoofBK
	etjJMArMyu9GnUeAURULefMhtqvKB1f9xbQgc0BiWhByar8Iu1aA3UzKmFy8VRGz0txS6Sh/Q5X
	+EFYyVIv9K8fEOOVfOQrdtkgp2K48fT5uVH0hokG22vmrXHoWnq+n5cNRxc/EG4n96+qfdQHksk
	4e43kQ5rrcJ3EF6pvlGjgTc1fBcbs1wNoISbf+uLufdTFx+J4T4hYrByPwTqvgC9vL4e8DIjjHa
	Nt6cCz94577ZPMToGTx8YkL9nVJ6sNbf5Grz1yQT3qk/5H7jpMxaVSdSVV4Cgu1MxTATnBOnmrr
	UcVlbPNcHnxYozT5iN8Tvt88SAW0wfh68mSgZ0ybB5gfcDYptMgo+xMRl9gCVxTmX/OXWGDnzwB
	D/pPd8creOnpNwQj8ps7FiHRg/QDtXYfP6oIzM3rQve2gRBSCL5sEqZx62xWuDl/SmDO0miyg9B
	/JmT/OLCWqPn2W4jm/Lswsvf+45TPyp+v47qAACGTfeYDLW/bg+8mU2m4KGEZLjeyy000TX7fpt
	agcUudnpp4x8ziOvctFnECSp
X-Received: by 2002:a05:6808:10d0:b0:579:7ac6:3a80 with SMTP id 5614622812f47-57a06b2355amr11438197b6e.1.1795400890686;
        Sun, 22 Nov 2026 18:28:10 -0800 (PST)
Received: from [192.168.18.164] ([2600:8804:5716:d800::d500])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3575f5bfsm7953975b6e.14.2026.11.22.18.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 18:28:09 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Sun, 22 Nov 2026 20:28:06 -0600
Subject: [PATCH] usb: mtu3: keep interrupts disabled in gadget completion
 callbacks
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261122-usb-mtu3-callbacks-irqs-off-v1-1-27733bb678c4@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3MUQrCMAwA0KuEfC9g41DoVcSPpks0ODdtnAhjd
 x/4DvBWDG2ugRlWbPr18HnCDKkDrPcy3ZR8wAzIBz6lxExLCD0/y5FqGUcp9RHk7R00m9E5iYm
 wDr1V7ABfTc1///1y3bYdQaxVlG0AAAA=
X-Change-ID: 20261122-usb-mtu3-callbacks-irqs-off-71bfbb2ed4fc
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Ryan Brue <ryanbrue.dev@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795400888; l=3240;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=Aex+y+91dtK8aIQ4sNmRyr8JQGY1Dd909+lkCK2MTzs=;
 b=M4YvQXt6noE/enwV80nd/23sRWZ6NXQcoF6/XGBBX6Drd8EoP1lXTTqbtd4nE9h11U0CS9Zz7
 YYjFJu75V3fBozGGwwgkXnSJ6bvpw58SqaekR/st0+fYeKjcOwSuAW5
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_182812_458577_3BBF2431 
X-CRM114-Status: GOOD (  15.80  )
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Commit 625dd9076e35 ("usb: mtu3: don't run gadget completion callbacks
with interrupts disabled") made the threaded mtu3_irq() take mtu->lock
with spin_lock_bh(). mtu3_req_complete() drops the lock with a plain
spin_unlock() around usb_gadget_giveback_request(), so the gadget
function's completion callback now runs with interrupts enabled.

That breaks the gadget API, struct usb_request's @complete "will always
be called with interrupts disabled". u_serial's console relies on it:
gs_console_complete_out() takes cons->lock with spin_lock(), and
gs_console_write() takes the same lock with spin_lock_irqsave() from
printk, which can then interrupt the callback on the same CPU while it
holds the lock.

Keep spin_lock_irqsave() in mtu3_irq() and disable bottom halves around
it instead, as dwc3 does in commit 84918a89d6ef ("usb: dwc3: gadget: Let
the interrupt handler disable bottom halves."). netif_rx() then finds
softirqs disabled and leaves them alone, the completion callbacks run
with interrupts disabled again, and the softirq netif_rx() raises runs
at local_bh_enable(), once the lock is dropped and interrupts are on.

Tested on an MT8173 tablet with PROVE_LOCKING, copying a 21 MB file over
USB ethernet three times per arm: with spin_lock_bh(), all 8,333 completion
callbacks ran with interrupts enabled; with this change, none of about
16,000 did, with no lockdep report and every copy intact.

Fixes: 625dd9076e35 ("usb: mtu3: don't run gadget completion callbacks with interrupts disabled")
Cc: stable@kernel.org
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Greg, commit 625dd9076e35 in usb-linus is v1 of my mtu3 callbacks fix,
the one I asked you on 2026-11-03 not to apply. With spin_lock_bh() the
gadget completion callbacks run with interrupts enabled, which the
gadget API rules out. v2 [1] got no reply, so here is v2's change as a
fix on top of 625dd9076e35; the resulting mtu3_irq() is the same as v2's.

My bad for the original error in v1.

[1] https://lore.kernel.org/all/20261104-usb-mtu3-gadget-completion-callback-fix-v2-1-2769533a39cb@gmail.com/
---
 drivers/usb/mtu3/mtu3_core.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_core.c b/drivers/usb/mtu3/mtu3_core.c
index fc274646fcde..f6677f58dd1f 100644
--- a/drivers/usb/mtu3/mtu3_core.c
+++ b/drivers/usb/mtu3/mtu3_core.c
@@ -790,9 +790,11 @@ static irqreturn_t mtu3_u2_common_isr(struct mtu3 *mtu)
 static irqreturn_t mtu3_irq(int irq, void *data)
 {
 	struct mtu3 *mtu = (struct mtu3 *)data;
+	unsigned long flags;
 	u32 level1;
 
-	spin_lock_bh(&mtu->lock);
+	local_bh_disable();
+	spin_lock_irqsave(&mtu->lock, flags);
 
 	/* U3D_LV1ISR is RU */
 	level1 = mtu3_readl(mtu->mac_base, U3D_LV1ISR);
@@ -813,7 +815,8 @@ static irqreturn_t mtu3_irq(int irq, void *data)
 	if (level1 & QMU_INTR)
 		mtu3_qmu_isr(mtu);
 
-	spin_unlock_bh(&mtu->lock);
+	spin_unlock_irqrestore(&mtu->lock, flags);
+	local_bh_enable();
 
 	return IRQ_HANDLED;
 }

---
base-commit: b0baaf6cbb16bc773d0c76916aac17c44a6cd557
change-id: 20261122-usb-mtu3-callbacks-irqs-off-71bfbb2ed4fc

Best regards,
-- 
Ryan Brue <ryanbrue.dev@gmail.com>



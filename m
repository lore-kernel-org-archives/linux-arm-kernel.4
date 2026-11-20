Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D74606A332
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 14:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Xh9NdnVj;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b0YMUC/+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=4Vx4X2Fvkx/Dd8Nyf178SX35TtePddMWESDoKM0WmL0=; b=Xh9NdnVjtv/5YpZ8ydpLnzGQNz
	wBx7hQwB9vr23F5UktTPV5X4ESDdAZ1lAUxTvqadLGC3dmacphgIyi1nYvuuXEHVbvxxV74da1GxP
	dGa44ulBegIWmlBbLY2UkAdC/LenkWyLnUjsJsETf0/05vqh12hb+fn4MyHS5R2rV9klzfXmBkkEv
	VM5KuWF2Z+uyxs6zKdD+Lm1jllE/HvZjj/RyacP/XYUHjYmgmgr00jtJ1+cPBNl2gqW87Rb7KHeb9
	yAzFCncSQtlq92/fjsyyjAqDgQ0bu25IjhAUqV3ofxD2pmmg3R3RLqwQw0iEbh0ECKysyvVpHRxEJ
	Cjbxhrjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPOx-0000000FE9R-1cJy;
	Fri, 20 Nov 2026 14:15:43 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPOu-0000000FE8w-2ulH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 14:15:41 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2f03f3631b2so5232415ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 06:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795184139; x=1795788939; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4Vx4X2Fvkx/Dd8Nyf178SX35TtePddMWESDoKM0WmL0=;
        b=b0YMUC/+dIy0DiRrydGgJ/ehV0lZJXfKIoqdij6/bZJAW929qXYTyc8Vj4Cpmv4wOS
         XQFO4wSWPht3YmBVkYIc/wgn1w2KMmNB91oVd34dh6ev0EvLHQiXf+EUeZ3OhI2kwGJV
         l31UZMnKqLplcPteYO8GRgJu/6TLj4CJVsNl64iQ74H85AJ4fLVNRPnZLjouPfeVodBE
         P4CjG0Swb0MdbQSjiO7cuoT+coqJGoUlGa+1dtqaX46ZTXTAFa8MxI4ZnOBMeWsmp6O5
         YsE5KXLTdCfTmWOxUiAQAG58C/ECbW/iHW7d6AHdFjvxYiqf3JANxnLUjYOZftbb+bOq
         L7mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795184139; x=1795788939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Vx4X2Fvkx/Dd8Nyf178SX35TtePddMWESDoKM0WmL0=;
        b=d2SYtq+Ar4lC4CV6ElDY2dDUNU0dVdy/YB0eb0MNxWdS+Xm15P8tF36+Mp+Ye3egDu
         /d8amF8o2MIft8QcxMHWQE9eJZFaEELLa76vsyHfV8sUCl1BUSs87+V3KDaneRSDu78n
         CayGyot3eLlISORu+OrT9XDNWwg5gpJZedIPcAxagcm5YYtZCINNgYxSFCCfE899EQUb
         xaidxumQ5VG07UFir79jGeAMrs2WrmMYRYSOVw96ifvSEt8YbhG/xAx2eCfU+BX6Qx41
         Gz69tKeeUnUV6k1jp8vLNVbZ7mdVls8H0wKn/nLgnn4G5Qxw0fx2uTOr1hvbLaKciuME
         kRKw==
X-Gm-Message-State: APuU4Z9wkLkfQ2WlSvvCUONQgLszQr8NUtashS0ihB8QBBtueTzuX3vI
	ibmrBjefGA1eVyEMBIZi6rFwynSaBkBw67JFC7h2u+7qsBAlEHyGdJ63
X-Gm-Gg: AZFdTZe81KBMGJ+XjU9sAgHZKwTK6++3pkrEIC4PD+X6pqZrd5AY6yXx5y85vW0g3x9
	yAX5rn/99ONAnNglRL013LuUdbPJtOLCWR0uhNvd3sotzaXfc0c41bVRcX6Y4i2i/gJHha8o4cN
	V0jKQuOZrgKF+I7QeIk/c+Sigz67v6oieXA1WZ7xtJXuSy6hTGT//ECNp3NylFfeKpwla0F1JVY
	5NN2QTGlel/Y2tRHq4BFo3q4trwGnkI0asy6PS5xzLnDLCsDycsVAkYXZZAw/vFw7fC6DfjvsCl
	6RmNYXw9u82xmTh1KcTm1HDukw4X/ZZwoz2loJmeSPk8YmAgbhbccg6iz0kSaTMJ0Ltf4CHnVqh
	1K/iK54nYUe9fjgtAoOifbC3qpksKLv8IOA4yZLLLqmLop1kUzLptS9mYLLl0VLXc7W0vkpm4OT
	E0yBsjon0ZOeQth4k33ByBjdbL3m+vBUXthHyzLiW5iuV22ZMkUObDQSu+oSoavYcWhBcDhIqph
	U3nz2luqILYzg7kDTRN9JASyA4BnQdvzYHTPMs+gsJc9iwFsRuKER37PVSCRMKOQ3c1pwagdmIb
	V0Fg88Tr2uaG57eOI87ihwW/C34ermER+sUYQ8NyLUHOSIo=
X-Received: by 2002:a17:902:d60e:b0:2e9:7dda:bfc7 with SMTP id d9443c01a7336-2f03f27062fmr30969925ad.66.1795184139137;
        Fri, 20 Nov 2026 06:15:39 -0800 (PST)
Received: from localhost.localdomain ([115.73.20.187])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1f2csm14852005ad.22.2026.11.20.06.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:15:38 -0800 (PST)
From: Nhat Tran <nhat.tranminhk2@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nhat Tran <nhat.tranminhk2@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] soc: ti: wkup_m3_ipc: Use the device's own state in remove()
Date: Fri, 20 Nov 2026 21:11:39 +0700
Message-Id: <20261120141139.55783-1-nhat.tranminhk2@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_061540_737120_4A3FAE2F 
X-CRM114-Status: GOOD (  15.49  )
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

wkup_m3_ipc_remove() tears down the driver through the global
m3_ipc_state pointer. That pointer is only set by the rproc boot thread
once rproc_boot() succeeds, while probe returns success regardless of
the boot result. If the wkup_m3 firmware cannot be loaded, for example
because the driver is built in and probes before the root filesystem
holding am335x-pm-firmware.elf is mounted, m3_ipc_state stays NULL and
unbinding the driver dereferences it.

On a BeagleBone Black (AM335x):

  wkup_m3_ipc 44e11324.wkup_m3_ipc: rproc_boot failed
  # cd /sys/bus/platform/drivers/wkup_m3_ipc
  # echo 44e11324.wkup_m3_ipc > unbind
  Unable to handle kernel NULL pointer dereference at virtual address 00000064 when read
  Internal error: Oops: 5 [#1] SMP ARM
  PC is at wkup_m3_ipc_remove+0xc/0x48
  LR is at device_release_driver_internal+0xbc/0x144
  Call trace:
   wkup_m3_ipc_remove from device_release_driver_internal+0xbc/0x144
   device_release_driver_internal from unbind_store+0x50/0x74
   unbind_store from kernfs_fop_write_iter+0x11c/0x1d4
   kernfs_fop_write_iter from vfs_write+0x2a8/0x3f8
   vfs_write from ksys_write+0x60/0xe0
   ksys_write from ret_fast_syscall+0x0/0x54

The same happens when the mailbox the driver depends on is unbound.

Store the per-device state as driver data in probe and use it in
remove(), so the debugfs entries, the mailbox channel and the rproc
reference taken in probe are released whether or not the M3 was
booted. rproc_shutdown() already returns -EINVAL for a remote processor
that is not running.

Tested on a BeagleBone Black with the firmware not loaded at probe
time: unbinding the driver directly or through the mailbox no longer
oopses, and repeated unbind/bind cycles rebind and boot the M3 again.

Fixes: cdd5de500b2c ("soc: ti: Add wkup_m3_ipc driver")
Cc: stable@vger.kernel.org
Signed-off-by: Nhat Tran <nhat.tranminhk2@gmail.com>
---
 drivers/soc/ti/wkup_m3_ipc.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/ti/wkup_m3_ipc.c b/drivers/soc/ti/wkup_m3_ipc.c
index eb6074a67ba3..224651955cda 100644
--- a/drivers/soc/ti/wkup_m3_ipc.c
+++ b/drivers/soc/ti/wkup_m3_ipc.c
@@ -695,6 +695,7 @@ static int wkup_m3_ipc_probe(struct platform_device *pdev)
 		goto err_put_rproc;
 	}
 
+	platform_set_drvdata(pdev, m3_ipc);
 	wkup_m3_ipc_dbg_init(m3_ipc);
 
 	return 0;
@@ -708,12 +709,14 @@ static int wkup_m3_ipc_probe(struct platform_device *pdev)
 
 static void wkup_m3_ipc_remove(struct platform_device *pdev)
 {
-	wkup_m3_ipc_dbg_destroy(m3_ipc_state);
+	struct wkup_m3_ipc *m3_ipc = platform_get_drvdata(pdev);
 
-	mbox_free_channel(m3_ipc_state->mbox);
+	wkup_m3_ipc_dbg_destroy(m3_ipc);
 
-	rproc_shutdown(m3_ipc_state->rproc);
-	rproc_put(m3_ipc_state->rproc);
+	mbox_free_channel(m3_ipc->mbox);
+
+	rproc_shutdown(m3_ipc->rproc);
+	rproc_put(m3_ipc->rproc);
 
 	m3_ipc_state = NULL;
 }
-- 
2.25.1



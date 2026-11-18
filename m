Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735DB606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 18:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h9LQeXwe;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bXq6SJwd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/uw6eSasL1b/vj1BX3jiErELTDd2rhnZAcbAAr5FXR4=; b=h9LQeXwekJ15peHH7TF2SfJBSr
	V7WBg5U+Hu+ZGt5EWY7wyqzeRctwvYfBxPDwq2kBK3tmhNw7AD+XibBntOIfZjaFrYAKekADbCH2e
	mgVXEigP5jObagy60YayKzUqblWL0L+4ybJwRIOSt3y+ZzjBHmyn8wgL5Rq9X8A22v2btk2kgjJLI
	OSQgZ7KyYiTuvevTLHhaA6xpzKXaD8BtVZ4rQNrHnjmnoaYUloyetaZqKqIGFi8pEf1/STZ3xld0+
	JPTYe0Bb9saPcCoU5KofWW6e2+KLZyHdQAXMKbqnZNuA4S2H9DXIC/XEPs1VZXPtS6S7ldIGdleBm
	qPIlFwRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkKb-00000009wWM-1QbG;
	Wed, 18 Nov 2026 18:24:29 +0000
Received: from mail-wm1-x347.google.com ([2a00:1450:4864:20::347])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkIY-00000009th1-3yGh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 18:22:26 +0000
Received: by mail-wm1-x347.google.com with SMTP id 5b1f17b1804b1-4a009f82bedso4476755e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 10:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795026139; x=1795630939; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/uw6eSasL1b/vj1BX3jiErELTDd2rhnZAcbAAr5FXR4=;
        b=bXq6SJwd6XkdqPaW/vGnADaLqY6bt7bVg7bsApYz+uyqnXIpkDkR0KNN4r8hgjVYc2
         1vof7hUEjuRAxGZTMUSGoPeq/WVrZgn/VRYECgXMQzUvWPvM+Kl33BX4vkI5TBbr09GE
         wBhLFIhjPfC0fpI1wDxLH3tPIw04MyEQWuAUBEnsOOPPWUX242juZfzxdYQaRUdqTHvH
         wx809nYeh8elf0e/Rbc0/6p4k4nYcemlbJUZ6V+u9gjINcfk4fdwXndw4/nB0G+GPYHK
         SgeKg5B9hCkWOm3ay1IJ1CmzpcbEnY6y5w+AISGwJbiKSTq7HYiWvIuz7NQr8mUwnla9
         yjWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026139; x=1795630939;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/uw6eSasL1b/vj1BX3jiErELTDd2rhnZAcbAAr5FXR4=;
        b=AY8XAmY/0TIJGf0HN3iBL6ftpulsgm7I4yB/AWBDbv8a0jZYWAC9HX/Rd53AeCkFjp
         uZHt8X98f21aNLiOVVrc6zF7Twz/Y+sQiq//ANsDUDyqarbNU0ljO20Qd71Yuv2P/3pt
         0olKAOoUfaNvItGQkTpJywG5l1H72hJr4cVx14nBz8/n3Se0oUSi6j3RovZ722uATNIc
         4EWIweRdjbszp4oXe/WFtKUZFJC0bLkk/EheyY16ULC/bvFRHk+KXMMLyFBC3UkSHkgV
         beh+V3JXpZrACfiOsT+SGPQr3AfWLOkpBwdbcpqUoyAakhS2+ge7gSXZqFtnMjqcwk4o
         s9hQ==
X-Gm-Message-State: APuU4Z+agrP56G9gMj/a9IlE3R/ZuEt32CGb34h9cRIgsgrcGP0pz74S
	OoRiskQNkAFd1g0vYO7/VPKSqeweekCSJNcpjW4jTAgc/1U1d6bMqu+lnzwH7K+73JGkV0uwEA=
	=
X-Received: from wmdn7.prod.google.com ([2002:a05:600c:2947:b0:4a2:8ef:a5af])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:a4b:b0:4a2:59:f568
 with SMTP id 5b1f17b1804b1-4bb7da12963mr69266665e9.14.1795026139303; Wed, 18
 Nov 2026 10:22:19 -0800 (PST)
Date: Wed, 18 Nov 2026 19:21:25 +0100
In-Reply-To: <20261118182105.1633603-21-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261118182105.1633603-21-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2331; i=ardb@kernel.org;
 h=from:subject; bh=iMPCb+Keab2MgLv3M4zpVvDMgTGioYSkOer/TnS5abo=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIevvm7XCHZeeHX8f+DPD6s/EiYutrt4v2FF5+G3G5ovFp
 gkTt/vzd5SyMIhxMciKKbIIzP77bufpiVK1zrNkYeawMoEMYeDiFICJrGViZNj06n4gj8DV5D38
 0+a2fkhoXPTgWswsFkENBVf2sAsbVv5j+CunwqFvkPC1JSbr9sY1t0SfFbxp3j7/ep6t8usHajm MT3gA
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118182105.1633603-40-ardb+git@google.com>
Subject: [PATCH v4 19/19] Revert "efi: earlycon: Reprobe after parsing config tables"
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_102223_076062_8D91C5D8 
X-CRM114-Status: GOOD (  14.29  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ard Biesheuvel <ardb@kernel.org>

This reverts commit 8b3a149db461d3286d1e211112de3b44ccaeaf71.

That commit added logic to probe the EFI framebuffer earlycon again after
the EFI configuration tables have been parsed, as the primary display
information may not have been available yet when the earlycon= early
parameter was processed.

Now that only ARM uses a configuration table to pass the primary display
information to the core kernel, and the EFI framebuffer earlycon is not
supported on ARM, the reprobe logic no longer has any callers. So revert
it.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/firmware/efi/earlycon.c | 16 +++-------------
 include/linux/efi.h             |  1 -
 2 files changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/firmware/efi/earlycon.c b/drivers/firmware/efi/earlycon.c
index 3d060d59968c..997f69ce46cb 100644
--- a/drivers/firmware/efi/earlycon.c
+++ b/drivers/firmware/efi/earlycon.c
@@ -216,14 +216,6 @@ efi_earlycon_write(struct console *con, const char *str, unsigned int num)
 	}
 }
 
-static bool __initdata fb_probed;
-
-void __init efi_earlycon_reprobe(void)
-{
-	if (fb_probed)
-		setup_earlycon("efifb");
-}
-
 static int __init efi_earlycon_setup(struct earlycon_device *device,
 				     const char *opt)
 {
@@ -231,17 +223,15 @@ static int __init efi_earlycon_setup(struct earlycon_device *device,
 	u16 xres, yres;
 	u32 i;
 
-	fb_wb = opt && !strcmp(opt, "ram");
-
-	if (si->orig_video_isVGA != VIDEO_TYPE_EFI) {
-		fb_probed = true;
+	if (si->orig_video_isVGA != VIDEO_TYPE_EFI)
 		return -ENODEV;
-	}
 
 	fb_base = si->lfb_base;
 	if (si->capabilities & VIDEO_CAPABILITY_64BIT_BASE)
 		fb_base |= (u64)si->ext_lfb_base << 32;
 
+	fb_wb = opt && !strcmp(opt, "ram");
+
 	xres = si->lfb_width;
 	yres = si->lfb_height;
 
diff --git a/include/linux/efi.h b/include/linux/efi.h
index cc1df1577d5f..4a809c6ae724 100644
--- a/include/linux/efi.h
+++ b/include/linux/efi.h
@@ -719,7 +719,6 @@ efi_guid_to_str(const efi_guid_t *guid, char *out)
 }
 
 extern void efi_init (void);
-extern void efi_earlycon_reprobe(void);
 #ifdef CONFIG_EFI
 extern void efi_enter_virtual_mode (void);	/* switch EFI to virtual mode, if possible */
 #else
-- 
2.56.1.708.g77570a6a1d-goog



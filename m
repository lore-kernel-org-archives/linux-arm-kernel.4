Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0043D606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 03:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YjNmt1bn;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aZjEe+gS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gg7ZA0AgmY4MI2TnL0if+FhDda8V2LVarU+EtpFSpPQ=; b=YjNmt1bnY/Hpya
	+VP6z3N6ATr9bd4YoiV8ncHUUhucvDpZFoW/kT4D0C2Wy4kckoY6sbk5570q/BRydp1sbOu3v0y8b
	SL6El++6tDkbcFntKRxFUVxCVV2xxaDmn/NRH6CJEzE2vAP43g4z2w0wFXa/puIxD6RKIuqQN0ubK
	QnAnh1CwT9D9R5+xMORaAp64MakCegDzVbpJ7rh47FqgwTzqeyaCHWHav4kWG70CQEYVRMiOQJXpH
	rK9KTTdxdYqJqTNs17XCBT9N+PdS4WYywbn9zZAyly+VBIwOjNOsoEAYzvG0wkVELc4s8+2VFoge8
	ZrGuc6/s8+ue23aT+v1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPlV-0000000BxEB-1zKs;
	Thu, 26 Nov 2026 03:03:17 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPlH-0000000Bx6v-42lu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 03:03:05 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-8a06e79e152so3249107b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 19:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795662183; x=1796266983; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gg7ZA0AgmY4MI2TnL0if+FhDda8V2LVarU+EtpFSpPQ=;
        b=aZjEe+gSM28016aLYflAlQRCTuIOHjJfnRDhSTqqjKIjfmZxv4ytnsuS4o2vmFS8OL
         fMdh2u1Srp2nOHJhFo+eIsFMAx2dbsw5734K81183MR3Uciy67Xh5LGTfdAn6xgBQAbg
         xInuGp3aB9cxlQy4lVohlrIcK4T/WhvyoNUi4P5XlH0i9vNVOLXnGoDu3MgyATgU04fD
         yaYFIg6qa0D2vNBU7sO5U9Wlc9k/HbZ8t1OC241jH3tjwaDtVC+v3bPENHz8QrJAByVa
         HEcuF6ow+7ra1GeNbPsV8VDIgrkudnBcXNMWJ9Xm+/jIycG8KBdFRi7jpfUJAIQIo4Rw
         lCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795662183; x=1796266983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gg7ZA0AgmY4MI2TnL0if+FhDda8V2LVarU+EtpFSpPQ=;
        b=tVvwSU1xLKdc8kDLAuw56DiT5imSkQupvMbR25O9cnvpEUZERzImwe05Ips2znz9h7
         QJQah39lzcoqfWAlajtocJkZqzMy+Ro+b2MpPB58OhJ3Kz8e9Te2JLhDoQIZOBBgLbMz
         SHud68uyiYp+J7QMB0cAFeb1H+p++DAVkpkhgYmkx5tI0nJ3sft51cbhqOOeFZibd5yG
         h24Rw11r97g59lk812V2uhEWi4xAtvCe+K0ojRgUAcKo0MKxdroQ7m67CUwyhKXNZQDk
         5rfumL60OzgA2G4fNsrAknYlHl7AVBlwdmszLYnsjozvcwURRwp71IUM2iOS6G0XW87h
         cgKg==
X-Forwarded-Encrypted: i=1; AL+hErFqKHG56gf3lna4FMp/A5tEi71x20+lOBtHBVKC8fFRBbmOATt4c0LD1zKecvgVNszSSsOs3UVcYxmsYExuJ2vf@lists.infradead.org
X-Gm-Message-State: APuU4Z/tlrpSMjiPQ8zkLx9dNfM+joYHkeRtp3Tn6XMlAiAdU5B8HpK7
	hkNAE0elVu6CHIwMSiNCtulzkPe2hRVLCdE3KOVj2CJnS8V/i1/wbF8N
X-Gm-Gg: AZFdTZeCvwYrOsYIpr5ND6Bat0t9KmvH9tSQ1plQDwnhxaOr86YUopC7bc1B/M8GHau
	PaUnzkIYSvOsyrkl+IvpB32Z3wSZ6zSTBX88TCkdh8b6HcXoNhNWQaHUgDDkAiexpWMqByHVZd4
	wkjXue7loGfPa8Hz0hwAUHRr/ilJnOMepIKxQcHcBsxTMS/M782M8ug8u5yHDO5QnDEExR52gZE
	ZSuvBBq2F08splcqUMPR9LmEx9qm0QI+R+GnwW0wCnKhpIphl/g5sXy9Y67HasJVUVK7HgM7X5X
	/wKPTvT4F+YXkqGEyL2DgA0GkU3lI3a6X5klP31N4pap8HxPaVrNIO975VEKr9qRw+BJlkT63vr
	xiUtwmp5GrjrXTBSguqHodIXJ01sqjifDVhlvusbvH+r4hSi/29MYTd4KfdAPeNeN43a9Zrc3nM
	XofqEJSUh+Nua4ahHGfJKWFMTLW5e6+vULfs9duZRFghAFRKItibOBzRaafGDquxvXjdnNDkWLt
	j2tjkOTvg6VMzvf4aG9XVgHJB62FbsPIdZR/Kcf0+1JPlbmP9ZEr5T4I1bHIL4xyJCFcP14WiDE
	EYp03fZHEWddC28EodtCtHSfcbDryb6WR1oibYqawPlc6girBzQUhG8=
X-Received: by 2002:a05:6a00:348f:b0:88d:3f61:20e9 with SMTP id d2e1a72fcca58-8c87d124ee2mr14999598b3a.48.1795662183040;
        Wed, 25 Nov 2026 19:03:03 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c908a56acfsm9231474b3a.23.2026.11.25.19.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 19:03:02 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	palmer@dabbelt.com,
	pjw@kernel.org
Cc: cyan@meta.com,
	mark.rutland@arm.com,
	alex@ghiti.fr,
	emil.renner.berthing@canonical.com,
	masahiroy@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	u-boot@lists.denx.de,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [PATCH v2 1/2] arm64: boot: emit standard LZ4 frame for Image.lz4
Date: Thu, 26 Nov 2026 11:02:32 +0800
Message-Id: <20261126030233.2546274-2-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126030233.2546274-1-leeonion.muyu@gmail.com>
References: <20261124065650.1968930-1-leeonion.muyu@gmail.com>
 <20261126030233.2546274-1-leeonion.muyu@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_190304_004522_8EAAD315 
X-CRM114-Status: GOOD (  12.15  )
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

The shared cmd_lz4 rule passes -l to the lz4 tool, producing the
legacy LZ4 format (magic 0x184C2102).  That is the format understood
by the kernel's own decompressor, lib/decompress_unlz4, whose users
are the self-extracting images of other architectures (all of which
compress their payloads with the *_with_size variants) and the
lz4-compressed initramfs.  An arm64 boot image is not consumed by
the kernel itself though: it is decompressed by the bootloader.

U-Boot, which supports booting compressed arm64 kernels with 'booti'
(boot/image.c image_decomp -> lib/lz4_wrapper.c ulz4fn), only accepts
the standard LZ4 frame (magic 0x184D2204) and returns
-EPROTONOSUPPORT for anything else.  Its host tooling (binman)
likewise emits standard frames.  As a result, an arm64 Image.lz4
built today cannot be decompressed by U-Boot at all.

Emit the standard frame through a local rule, leaving the shared
cmd_lz4 untouched for the in-kernel users.

Also pass -BI so the blocks stay independent regardless of what the
lz4 CLI defaults to in the future; deployed U-Boot decoders reject
linked blocks, and lz4 is considering linked blocks as a future
CLI default.  -BI was introduced in lz4 v1.9.0 - older lz4 versions
reject the flag but already default to independent blocks, so the
rule probes for -BI support first.  With current lz4 versions the
output is unchanged.

Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
 arch/arm64/boot/Makefile | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/Makefile b/arch/arm64/boot/Makefile
index d42d07667822..eb28967469b4 100644
--- a/arch/arm64/boot/Makefile
+++ b/arch/arm64/boot/Makefile
@@ -28,8 +28,20 @@ $(obj)/Image.bz2: $(obj)/Image FORCE
 $(obj)/Image.gz: $(obj)/Image FORCE
 	+$(call if_changed,gzip)
 
+# U-Boot only accepts standard LZ4 frames with independent blocks;
+# probe -BI first because lz4 < 1.9.0 rejects the flag but already
+# defaults to independent blocks.
+ifeq ($(shell $(LZ4) -BI -V >/dev/null 2>&1 && echo y),y)
+  lz4-bi-flag := -BI
+else
+  lz4-bi-flag :=
+endif
+
+quiet_cmd_lz4_std = LZ4     $@
+      cmd_lz4_std = cat $(real-prereqs) | $(LZ4) $(lz4-bi-flag) -9 - - > $@
+
 $(obj)/Image.lz4: $(obj)/Image FORCE
-	$(call if_changed,lz4)
+	$(call if_changed,lz4_std)
 
 $(obj)/Image.lzma: $(obj)/Image FORCE
 	$(call if_changed,lzma)
-- 
2.34.1



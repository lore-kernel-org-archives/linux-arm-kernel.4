Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529D4606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 03:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LsyJ+qVA;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YOhdWH2F
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BkTmeYNebhkrqLGwJXoMAq7CpBRUkvwi7hUAFtPicvg=; b=LsyJ+qVAOWJCyn
	tGMwwByEDcTfEO5UG3fnZsF9cM5vijDEsaGTODlr5D36ulRFU9n/5AKj1r81k6EFVwL3AcAAztmSh
	xTXVulDt6oujgGw5ufEW9hdCsUiN98/Nz1YqeDKSoG3Kk3gMmgBH/ELGEk2oxfYWZc0n9CgL0TZ0V
	B1cYiKVBB2ZbGsRBnZbt/O82hjA/dWQB8+fawhH/aXY5xdANifU6oE9S3VKrDJ0T6d+B5behIOxNj
	qSnzdDxB5CVbhrlLXYjlEHy43Oeez8B/UVI2fjclqyTV0v/y+hmbqx5TcyZPv7N5UIaiiXW7ynI77
	FXVuTFdfrq6w3Mwqrpxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPlh-0000000BxMA-39vp;
	Thu, 26 Nov 2026 03:03:29 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPlL-0000000BxA0-3LqW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 03:03:09 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-8b68e59ab33so4795938b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 19:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795662187; x=1796266987; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BkTmeYNebhkrqLGwJXoMAq7CpBRUkvwi7hUAFtPicvg=;
        b=YOhdWH2FJCHbkHoHP1USWskWMmajmBIQERQfxKK6IIdfAEs6A6/xrWI1oyQ9pKXmaC
         mMdjP/lugS5QKpSDt34k7LYSmhKlvZb2SqPVn7TrjvYF4yaJzh9yILLQjzA0DHDMAGys
         Yz22wHP90NlruIB447EZDg3wjigWkS99ALoShbNFzTc6ek88b0oVbLzmQUjQf642oRpo
         ZSCgqY7pVrnWFpkwiAE1+Potsl4l4BOIAmPzQnLiWATbMXb63f2/eTs2xe5NQYP5MrTZ
         cXZqMjJAuQUbWchSSFepB+Wb/S9oD4RSQjrdB1RFT4yQ1iaZWcRrzi4Ry/zr4MKVIoxf
         ExGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795662187; x=1796266987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BkTmeYNebhkrqLGwJXoMAq7CpBRUkvwi7hUAFtPicvg=;
        b=izsFGrXqz0vfhLVHlreORuuUQCW408jbO7QrgqPV5e94BR2V9IinjgRYChkaYLka+I
         m2Tf/9NOgpTGr5yI9qLLTfGptPqxTydxm7Yzpo7NGTeWF3RGQetIzFhgnZYTvGl/RT96
         XSix4FcE612Lm579Pk43RQys2GS78+yihXYMCqwQSwckSgNBunnJhfPB0EoVtWETt/do
         atLwLlQtpAPnn9UczpJBkUrHAz073K5LZoc5ztcjPLDzBcAT87FmQkYMxCWI0GLPc8nK
         5BeKEuFNM/fhek/3jcaIYhr/5BwUbaP6izxXNW3SY+lciMDuomcfTKfzKtF14ltThli6
         X7Iw==
X-Forwarded-Encrypted: i=1; AL+hErEqne3F3wnHybaSi/k3A9i0LJVipndBSY1wrDYNZE4DACrx20dlixlvMHdNGoZ5eFLESRiX+4ubrCeO4zPdH5JI@lists.infradead.org
X-Gm-Message-State: APuU4Z+JNR1tjvKCOJcgB+FIR5iNO/WhxsIZ5jXcUI+OXhUCOaf8KnvY
	nXkqPZDN/nFoB/1yYqXDKhObID3CnoczQ2xsqytKq+3fH2ZxXlZPM3um
X-Gm-Gg: AZFdTZdfNvXcGAbNurEzEAhSR6QoXzTsks4QyUw9p6rR/8WzqfRuUmN0QCnW/cQUPrG
	a9uXOWIHya7Lo30zgSE8vBk1JTlcdGyG0NHHh4oxJ9OzG1tawgZsQho98UaMomgCVr49jicyc/W
	uNtXPe8yOE3hmfpTDtRved6s+2wbagmzrPBruHaa9LxJZV6vhwYWtA4fQ1xKFjHPR+FKimCxf7Q
	TcAnKwy/HW7V8A9z6hSMH+e/hll7G02Z6sgV5pSUZrzbsJ/LBgzfT4qen8MeMqP/hnm40hVcG1s
	QXYJQhHWaOAokn0bYwxIL21+njaGvJ53xcHR3KhOXWl/o5p5MVsykLLp8hk1Q0FotH/lywfuFtN
	3jfBHALzf5J3Wvi/m8w2f+jDieO/6fdYNo5+b/tqRa1zR6kHlYnwjk+/pTnM+onFCMSzfshaCqc
	e8DDlQoUSDjaiy7mudatAwZ1tDjga48qz/mBS1fyh9jyrxhQq7DN1ofEUMJtyUNQDeust5ulBgI
	YsrVR8CL+ixlIZ+3RavXM+QjPqD7g0EGTtJqOJ14vyWtz1YYyaDaGfg/ec/5tbvofGcUkfE0PGx
	e/lSWVKhhmxyoPUwm+dhU/jZ1naFR54s2Q==
X-Received: by 2002:a05:6a00:18a0:b0:899:268e:c848 with SMTP id d2e1a72fcca58-8c87cc450e4mr17627128b3a.48.1795662186926;
        Wed, 25 Nov 2026 19:03:06 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c908a56acfsm9231474b3a.23.2026.11.25.19.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 19:03:06 -0800 (PST)
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
Subject: [PATCH v2 2/2] riscv: boot: emit standard LZ4 frame for Image.lz4
Date: Thu, 26 Nov 2026 11:02:33 +0800
Message-Id: <20261126030233.2546274-3-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126030233.2546274-1-leeonion.muyu@gmail.com>
References: <20261124065650.1968930-1-leeonion.muyu@gmail.com>
 <20261126030233.2546274-1-leeonion.muyu@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_190307_839506_B3EB8F83 
X-CRM114-Status: GOOD (  11.28  )
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

Like arm64, a compressed riscv boot image is decompressed by the
bootloader, not by the kernel itself.  The shared cmd_lz4 rule
passes -l, producing the legacy LZ4 format that only the kernel's
own decompressor understands, so U-Boot (boot/image.c image_decomp
-> lib/lz4_wrapper.c ulz4fn), which only accepts the standard LZ4
frame and returns -EPROTONOSUPPORT for anything else, cannot
decompress the Image.lz4 built today.

This matters in particular when CONFIG_KERNEL_LZ4 selects Image.lz4
as the default boot image via boot-image-$(CONFIG_KERNEL_LZ4) in
arch/riscv/Makefile.

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
 arch/riscv/boot/Makefile | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/Makefile b/arch/riscv/boot/Makefile
index b80a077a8e8f..ab2b1b77e21d 100644
--- a/arch/riscv/boot/Makefile
+++ b/arch/riscv/boot/Makefile
@@ -33,8 +33,20 @@ $(obj)/loader: $(obj)/loader.o $(obj)/Image $(obj)/loader.lds FORCE
 $(obj)/Image.bz2: $(obj)/Image FORCE
 	$(call if_changed,bzip2)
 
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



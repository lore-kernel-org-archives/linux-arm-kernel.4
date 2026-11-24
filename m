Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7B0606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 06:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OBZV47rS;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JTXc4afv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FDuEMxYgYBVobl/Z5dl6njT/IiUQ6/EkCRGt1PlxcR8=; b=OBZV47rSkn28le
	mx1vjnm39tydP2OmxauPgBaZfuy/d2FTybciAsctoi6IVaysnYKFcmYvNCbdMxrZ7z9rHeuhbRO6R
	4Zx3bRTV4OY9B7iGy9lCxg3lJ2xeZnVUXyPuNa9Q6C7keUAXQ6RUyVX1wtW7PKeTRoGXAz9USy58b
	ahKP6dVRWSBvFII0wT1XmZj8mGGQN5D4n5kgS4HR6CK9ZpCnPuCZBJL50HSlZwGEecgaxf6vUkZLP
	9yBavVqTQ+d9gl69vpVHsYEKjNB1Dp+nOd4/4Y/uzL2H4Qi/nfgMhlrnzy36A9DZlDBYcVxrLkFDE
	MCEjIG5WQyAjsFwPubUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVkSw-00000005gdv-1vuX;
	Tue, 24 Nov 2026 06:57:23 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVkSg-00000005gWP-1ZdJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 06:57:08 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2f048476ab9so28952005ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 22:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795503426; x=1796108226; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FDuEMxYgYBVobl/Z5dl6njT/IiUQ6/EkCRGt1PlxcR8=;
        b=JTXc4afvsYhxgIa6DWAT2MoNutUAPdIPsENij/RN/a/GA69FYGNixBMi6hR/Geopjc
         RWW3LVE9EacIRAmYMHLFyuKlGKTSKBDKkG3dlvIb2WLcbVB5jXZBpARVDnYTcDO5iHI5
         53KXs7Mp3zX+lqCRjRHxLhx7X8m7ls5Js6ZpJZ2FUq0xDy/Y74sxWVScNq1Vc/2WduSB
         TQ0gtNe/1O9uF5Wj12S6Rc1QaYQb8mjLmXx+xi9IxNKb7vzrPN+AJLUxizFuFsVfgRQb
         Aq1TJBbsY23PTO0fXuYRiZADn8xjlfaP35M61WYWWlAW5teVuyXfg+K1o2SqHMseCBhy
         mGsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795503426; x=1796108226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FDuEMxYgYBVobl/Z5dl6njT/IiUQ6/EkCRGt1PlxcR8=;
        b=QwF/iCDKdMg9fbXtnXHz8tj4QyXwXyZy+L4NV1F0CPdbn6Bs9fFzdWHBnYZZvM3DGP
         bmZjXXJ9PAR9RDns/RHVkhouUsK8JFtfmv7s5mcvveQqqqD9KpR7OwkLyhmn6RrZZllS
         4Uqz/JfPyFbg0uPYitQCH9RnVzmTYdy9XgBcNkfflSVBrTlw8ShM6Gth5QMefotS/VlT
         bZFVZxxTkEOoHu433I/FfdUTlntIUrsE5oVCWMR9/wyMLHbP5HP9IgMWiSYYDqUrkE5n
         RfOndZtZAfKZVClvwZ9n4tmXEI6LyJ3MEtF5B8KWafQNucrD8CvMYNqsdYv23NKcuPVy
         3/cg==
X-Forwarded-Encrypted: i=1; AL+hErEGsU6nknpRipNw06qWFahApfB+zZRdLQBAn2ptRU7W3JGFZe5ITwUu4ZMoQJXi5LoO7pm+Cf5TXI05TA31hFOB@lists.infradead.org
X-Gm-Message-State: APuU4Z/KlQMnecRb2KZYvhx96FACt9HOWwXfbq9usW2H9XcAOyDsKYep
	YQ8z+gTndGdxP7aejTLQRZa+of1NyK8it7JNIx4QBerPdDXJVz8BEtuU
X-Gm-Gg: AZFdTZcC3uVWqbUoeMUd7wY+ms8sI+ais3GQMbVmKsEddOM9k67dX5ed8qftAroZJxI
	DA8zBp1P4SfA2BpOD45U0iz7xg4N6hMgqdEPfyBJTqLCVXhXyhRzO5hm7w9j1WhjR/jTSSNi1bg
	0iN538R217y7beCRZlW2THqKJRTgVWIqA9Foos7KNjtR07SuCA7w0lfenoE6jtCaUIx4lMl+RAm
	RlO8r+b+SSUmMtjVDRjiJ4azPJSFip/IGInRMnIZknfDjYpTkToo5V2A32LG4D6b+37NiSdynR8
	sxJ7FYf733MRFd88RE3ydHy+hB2CBHgEN0iLD35uyQ3wRE/mhLILXaCvw9M6SHI8SzNaRHkY6FV
	WMEa7JgMrm1vAOoZwPJdUdJ/kpbeebRQA5h8LKSecaigLGSMwVWpEIs79c0clqzkHR+RAZRwjxT
	EEQcOlpDCoeO9Y605EoEuPg/tgsNwl1N/REzXSRGdtmq7L6ZrpEBJ+nnHeBBCyLvLExZrOsRMIu
	8P/969eLhEIRI4NV+Opxgbo7kC9gzblGX6DJFYMBGir352+6ndzgb9AaBKczRrFUN4LGgCtvZxE
	AclaTbjMSeEkcA9GdkBGLbtKCSdYiZPYZA==
X-Received: by 2002:a17:902:cf0d:b0:2ed:3d88:4c24 with SMTP id d9443c01a7336-2f03f11da29mr128145425ad.27.1795503425640;
        Mon, 23 Nov 2026 22:57:05 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f105b66sm64966685ad.51.2026.11.23.22.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 22:57:05 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	palmer@dabbelt.com,
	pjw@kernel.org
Cc: mark.rutland@arm.com,
	alex@ghiti.fr,
	emil.renner.berthing@canonical.com,
	masahiroy@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	u-boot@lists.denx.de,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [PATCH 2/2] riscv: boot: emit standard LZ4 frame for Image.lz4
Date: Tue, 24 Nov 2026 14:56:50 +0800
Message-Id: <20261124065650.1968930-3-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124065650.1968930-1-leeonion.muyu@gmail.com>
References: <20261124065650.1968930-1-leeonion.muyu@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_225706_457863_7192112D 
X-CRM114-Status: GOOD (  10.40  )
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
passes -l, producing the legacy LZ4 format (magic 0x184C2102) that
only the kernel's own decompressor understands, so U-Boot's 'booti'
compressed-kernel path (boot/image.c image_decomp ->
lib/lz4_wrapper.c ulz4fn), which only accepts the standard LZ4 frame
(magic 0x184D2204), rejects the Image.lz4 built today.

This matters in particular when CONFIG_KERNEL_LZ4 selects Image.lz4
as the default boot image via boot-image-$(CONFIG_KERNEL_LZ4) in
arch/riscv/Makefile.

Emit the standard LZ4 frame through a local rule, leaving the shared
cmd_lz4 untouched for the in-kernel users (the lz4-compressed
initramfs and the self-extracting images of other architectures).

Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
 arch/riscv/boot/Makefile | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/Makefile b/arch/riscv/boot/Makefile
index b80a077a8e8f..0e7607d7e39f 100644
--- a/arch/riscv/boot/Makefile
+++ b/arch/riscv/boot/Makefile
@@ -33,8 +33,15 @@ $(obj)/loader: $(obj)/loader.o $(obj)/Image $(obj)/loader.lds FORCE
 $(obj)/Image.bz2: $(obj)/Image FORCE
 	$(call if_changed,bzip2)
 
+# The shared cmd_lz4 passes -l, producing the legacy LZ4 format that
+# matches the kernel's own decompressor.  Image.lz4 is decompressed by
+# the bootloader though, and U-Boot only supports the standard LZ4 frame
+# format, so use a local rule that omits -l.
+quiet_cmd_lz4_std = LZ4     $@
+      cmd_lz4_std = cat $(real-prereqs) | $(LZ4) -9 - - > $@
+
 $(obj)/Image.lz4: $(obj)/Image FORCE
-	$(call if_changed,lz4)
+	$(call if_changed,lz4_std)
 
 $(obj)/Image.lzma: $(obj)/Image FORCE
 	$(call if_changed,lzma)
-- 
2.34.1



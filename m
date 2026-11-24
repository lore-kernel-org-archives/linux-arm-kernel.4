Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D434606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 06:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tvH3qFy9;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r5h+CbQY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WUgckmCiFEyGBP0TcCUPMUukDceeXTTvOHMOsE4uhQ4=; b=tvH3qFy9PrP4Wc
	WAzF+1gGSI0XT290pOOos4uNO39MiP9NUFMlKIcSd80Zi3h9AVlwGMc//s16EKXYQKrTSdsEh5eHE
	2hQybcHIZoed1QeLiuOyS4gc4PcjYN5dcaT8aSwQwQjqh8rlgM8P+K0lh0GzHNg52O3VohOQLo5Xh
	WZTq4QB4qE2f99XGShtjFunMy0cigaKwi2JPdghK19GNQrSgOn6uxYN1yJRIhlcYDGm+62QrSew9a
	Uqqy4K33eraAIN4BWAtsjCFu3bxeVJ7GBb74T2+oD9cdNcmS+/teLnFB9SepdMEUtah5uT9i3FBnc
	QbspThTLffs3lLht1ZzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVkSk-00000005gYC-0vOC;
	Tue, 24 Nov 2026 06:57:10 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVkSc-00000005gUO-2UcX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 06:57:04 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2f04bea9a93so35298495ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 22:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795503422; x=1796108222; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WUgckmCiFEyGBP0TcCUPMUukDceeXTTvOHMOsE4uhQ4=;
        b=r5h+CbQY/Dhgh62FoNXzJSgIgHnXA6yEf9J6rybJgHP5tHtXAppbXmrdDNh6bcgD5d
         8gmL3hBHsWv+KISn+BMdMFMCHFxARCVUo1d93OTYfbTplLxIa1czCrQfyRHLfPZ7h4w8
         1Tel60cr2AHK/d/qtCjs5hC7ACSsrTxS57zoPpaD7ChlHVv1UwW43+MmYdoLmLcJhaX0
         icXPMCc2bImqbsVH4A/1D2MgTR2C4eeFJTXxeZ2SUfIrRgUWxBS0jvB2fsy9KSs4hb7y
         8fsGRiv5a0/HECt6K1jpxol1U8AJLRpODMTpB5wyeetjbTum5TvCCj5vBhIkeFveEdZZ
         Ybcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795503422; x=1796108222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WUgckmCiFEyGBP0TcCUPMUukDceeXTTvOHMOsE4uhQ4=;
        b=pheDGXF09ZTq0DypxOsCC+fem8yravJFWZvjA05Wp0ZR1/9dq4dXHOeFIEl6uzK77m
         w/e2m96lxSvMG8gZiFdf//LmqFgCN0Dxw36sb8+TokFRTNwm6SIADHj+6+oIQWQtrm59
         eCbEc0vswUefb0WQD3KN7K/bsNYNlGRPa/8/jScCZBw3l19k7iqj04K4UN2OrAnkwW18
         7/nnNKKgkjSREio30WsJjyFcneVIMqq7LlD5bR610emQEVkM6MOcbT2GNIZ8IBPMW9AT
         tJy5mjoHBRJ0zbw+rYAwXBgp2dJG5ugQ6ax4afFxiC4TNE9FB8jzwcZAZ4w5lME1cyd/
         35Xw==
X-Forwarded-Encrypted: i=1; AL+hErEwVq3t+vfkVe9MKxkFd5xUnyaRgiJws8BuTN95AZLSxV9aELJOWnSqm+H8oBgCrc4Ntrb98btpdz8WTC+0ggcw@lists.infradead.org
X-Gm-Message-State: APuU4Z8dOlFUahKyAqTtSj+YyUJB4cLu+bzqAke5Lv5/E/893+GQVdMw
	gyYt8gtpGjRSPo/KA5W9xglEOQ+Aclkzmvglehqt4c3wGFN7htkUoz5t
X-Gm-Gg: AZFdTZfhpSJGX3V2iuEC199ZuIqeTtS4giLgPVCMZCFv7TgywB6hybkKUMUA0EaWGE7
	RzLnT5Mq+4rNm7yC70xA8Pv4VDIbFNn5vcoZ68/ZGBzOC+nednfsj2IXkAJNXAhLKilq435q25/
	aA7f9s1KRqYtJqn5xRSj2ypS3Fdg9HmdPFrkUCsI+IIUozw4RemOOriza+uUi81kOIo824rIkEO
	IQMw9iPzUVEOII4uXIb6c4R1ZETPdFe/niD7soYfDh2Rrzw/AvbnhJiNCnlba/E9zhNIwuAQxyW
	47w9yPYiThBAk1T18NFvcbvPqD5TVIS1FnMyhkuW8vvRynxTFT2dnf+gDjmQBj/pwpL+aheRpdy
	XbztXu2IJIMs3Nlr6LsgxhKEsdWeFfteirVwkG9EtAxLFqzQk0DH35ZXpXbrfrvjvLOK7zYsP7W
	6EFqH8tYOEPDzN4/wN9eXyyJmy1tFAKz8/XCjyuSQ1aoU32NdF0s/5YcFmRPUd2TieOaXzRUrT0
	SsV1oBDMkVlQpDugl1oxy9nPf7GNE39ol10sJqoz3Fy+Q5XIlRLqh0tHnmBdZb41IG0Yt6kb/Lf
	cF2z1gJcvABrFwMa9TeK0n/sshIyFxru2omkvmP/WxVKIWLO8xWP59Q=
X-Received: by 2002:a17:903:41cd:b0:2ef:efae:e8e7 with SMTP id d9443c01a7336-2f03eded341mr142785705ad.0.1795503421589;
        Mon, 23 Nov 2026 22:57:01 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f105b66sm64966685ad.51.2026.11.23.22.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 22:57:01 -0800 (PST)
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
Subject: [PATCH 1/2] arm64: boot: emit standard LZ4 frame for Image.lz4
Date: Tue, 24 Nov 2026 14:56:49 +0800
Message-Id: <20261124065650.1968930-2-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124065650.1968930-1-leeonion.muyu@gmail.com>
References: <20261124065650.1968930-1-leeonion.muyu@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_225703_583897_F3953ACC 
X-CRM114-Status: GOOD (  11.05  )
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
lz4-compressed initramfs.  An arm64 boot image is not consumed by the
kernel itself though: it is decompressed by the bootloader.

U-Boot, which supports booting compressed arm64 kernels with 'booti'
(boot/image.c image_decomp -> lib/lz4_wrapper.c ulz4fn), only accepts
the standard LZ4 frame (magic 0x184D2204) and returns
-EPROTONOSUPPORT for anything else.  Its host tooling (binman)
likewise emits standard frames.  As a result, an arm64 Image.lz4
built today cannot be decompressed by U-Boot at all.

Emit the standard LZ4 frame through a local rule, leaving the shared
cmd_lz4 untouched for the in-kernel users.

Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
 arch/arm64/boot/Makefile | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/Makefile b/arch/arm64/boot/Makefile
index d42d07667822..19b26aa83203 100644
--- a/arch/arm64/boot/Makefile
+++ b/arch/arm64/boot/Makefile
@@ -28,8 +28,15 @@ $(obj)/Image.bz2: $(obj)/Image FORCE
 $(obj)/Image.gz: $(obj)/Image FORCE
 	+$(call if_changed,gzip)
 
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



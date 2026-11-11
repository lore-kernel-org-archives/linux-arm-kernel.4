Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33178606A334
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 16:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mi/WIA2v;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KUKvwTYz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=M7jtARyRrlvTBzKX/llBKMEK2/+TQCQjH76pC25b6sc=; b=mi/WIA2v0pCujRa0kdLlgJ3LUa
	LUCGsh7SRj2CNx5e3YvdxRnKfANWIR72TyHG0ri8icerY+Vs/lukAS6KqtRImET9YmmpN7faUV3nD
	SbOWk1b+iFy9hd+jtg2iRKt7v78MN/g35X17TLDhhmYMFX3dTZl4Os3avrKDIlEt3dubFJGScnYLq
	O+VZG81vScE4e0LNSx8mdpY2ieUI6dpdkeX2mQmNNCEzddto+nXZ/Ko6EZJuXtpJGCuXXgLAtaZeK
	oeBVT7RdetQOawYOOqDIMBD6ui0BNjrbDMVyoZw1uRlKgdvvTVm0uQOsij06Dxll5938fCUj/odYr
	fI6Bcnrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRBQr-00000007E4I-0S1A;
	Wed, 11 Nov 2026 16:44:21 +0000
Received: from mail-wr1-x446.google.com ([2a00:1450:4864:20::446])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRBQl-00000007E0L-1WMN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 16:44:16 +0000
Received: by mail-wr1-x446.google.com with SMTP id ffacd0b85a97d-48e0461e040so2602281f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 08:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794415453; x=1795020253; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M7jtARyRrlvTBzKX/llBKMEK2/+TQCQjH76pC25b6sc=;
        b=KUKvwTYz28D/SJ9P+Fz2NzTgBOEIddD8SDZ1nDhoT8B+LSllWHO4LSVX2xljtX/yUb
         BxMzIS+Kz5IZ0o26nOlUwI2JLACBOV+HvJlTtqBR66ZJ59/PCpjAdyEgYbYVUxiNKQ7v
         /Xu3Y+Ke2uyiWeK6fKcZjjfJHP0yyQZ9vcCMmt/QIOVyQ7kQ9c5AXoD5zYSCU+rOw2yF
         IVkSoH2U1Y4g2RZlNdRh8L5F1n2V1Up9WL7Yg6QvrhvfUuIannaGX676ci1wN3m5J7oI
         ZV+RUQCduZX3pMVeb0vQzHDDDHKVghglbE+pCst0bnCEQgESHSzza5VJ5J2xOJzixblo
         VWLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794415453; x=1795020253;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M7jtARyRrlvTBzKX/llBKMEK2/+TQCQjH76pC25b6sc=;
        b=xHCMAQie+B55lf6YkuunFBNVCqAyt0wnYqC6BonpwfzbRFMc4qVbwCKVx/Z85la20S
         5kPcOwmybKjrrIKLhU59NZHC8DwXYkGJKk5aUTVvCs+CbIGpbtWJ+DU4RPK+UEgXcgLe
         f4cFHivNyYRa6YNyQ00voeYKOHD/R12y0FoK2HuDE+XODQcp5/9k24fmMnc3IMlmkGcZ
         GfLx+9HqTor9RnQCIH8p/zzQU5VMQXNMcP9AV//DjmvO56YmX9hIwoPkRwCNqHTRsWQx
         yLUfPj/Y0gTCZO/sVUQja5NKELbcB4sKOLROKdInlCBSubM9sAbwiZkQtU32VMz3T1uP
         omiw==
X-Gm-Message-State: APuU4Z+AMlRk2W0HR5MkTxq/VELVuD/hu/OY7rC6PbsNsg46eRtVV40a
	V68vSd1WXIzAtlOImVja0atvhG5KYf9fUZiHcob286wbkBVJ9swn5m8N07ndpKA2Slm/BNXzcV3
	SufTnFpbPnIH7uvbuf+SABi5SqO23PCTfAhqtdGoRFmEKRvhiXBxxmS+X3gUyuU7IRL6QXFpM3z
	RwmrcpSunWD8aI3XhqvbqD46hQw2nZHRGBmrZqjcwiHNKq
X-Received: from wrvq9.prod.google.com ([2002:a5d:61c9:0:b0:493:1d71:a33b])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:6f16:0:b0:491:6b1b:7f25
 with SMTP id ffacd0b85a97d-499c792ec97mr4620755f8f.45.1794415452403; Wed, 11
 Nov 2026 08:44:12 -0800 (PST)
Date: Wed, 11 Nov 2026 17:43:48 +0100
In-Reply-To: <20261111164345.4059964-5-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261111164345.4059964-5-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1766; i=ardb@kernel.org;
 h=from:subject; bh=eT0StU5ofM1ZIeiPxXpHgj6oh7hxI9c/ggA+8N4HDMw=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIevLbBffTtWWursvTF4WB/ztn8go9jvqlO/VVKbY+6wvp
 kV/SxLoKGVhEONikBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABN5F8rI8EhzzYs5ZyeXSl4T
 uijzXX7Zq6JdjJpN6gsKnD/3ZGifMGFkmHLoRsSjyKRbXJrf/+zd4Opoub4g5Pb3CVvMV5jU5f1 w5AAA
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261111164345.4059964-7-ardb+git@google.com>
Subject: [PATCH 2/3] riscv: Make _text point to the start of the kernel image
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_084415_414992_380A1774 
X-CRM114-Status: GOOD (  17.55  )
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

On RISC-V, _text currently refers to the start of the .text output
section, which is placed after the image header (.head.text), and is
therefore equal to _stext. On most other architectures such, _text
refers to the start of the image, and is used as such by generic code,
e.g., to describe the kernel mapping in /proc/kcore and in the ELF
headers of the vmcore, and by the EFI stub.

Now that arch/riscv no longer uses _text to refer to the start of the
kernel code, move it to the start of the image so that it is equal to
_start, and the distinction between _text and _stext is the same as on
other architectures.

This also means that the image header is no longer omitted from the
/proc/kcore and vmcore kernel text mappings. Other users of _text, such
as kallsyms and ftrace, only use it as a reference point to calculate
relative offsets, and are not affected by this change.

Note that, as on arm64, _text will no longer appear in /proc/kallsyms
unless CONFIG_KALLSYMS_ALL=y, given that it now lives outside of the
[_stext, _etext) range. User space tools such as perf already fall back
to _stext in this case.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/riscv/kernel/vmlinux.lds.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index 1f4f8496941a..9849a3e4d102 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -28,11 +28,11 @@ SECTIONS
 	/* Beginning of code and text segment */
 	. = LOAD_OFFSET;
 	_start = .;
+	_text = .;
 	HEAD_TEXT_SECTION
 	. = ALIGN(PAGE_SIZE);
 
 	.text : {
-		_text = .;
 		_stext = .;
 		TEXT_TEXT
 		SCHED_TEXT
-- 
2.56.0.611.g1030f0b940-goog



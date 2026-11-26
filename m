Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639F7606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 03:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RstYJE+D;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mf3PZI4N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2sIlkZq+ib9YiZ2csv17ueAxplgaiHMSc6dh2/Ka/Lg=; b=RstYJE+DRymz/I
	RpTZHjPmuM8ORDmhYnXGL+nDk0GQrTwKX2pLWlL+jelgZZoTyukTW/evERsf1VO0RatfoH3kS5CLm
	3uZUP9e8aWQSaBHnoP1m/GFQC/8V6vhwAexsIS/4+mfMXIZKLtC9mtraxkVvOibde8/vjUiEn1MDx
	5Au2Pn17o22ZeIvZXKJf9dNVgKhdTMP4veyKz1+gMw2vrtlMJA5/W6116FWn6vdCOpH61ljK8jjVC
	cym1pE8FAIJX8u0L8zVQ/xgnUOvPgH+TlZoB1b6O5UHNelwaWr1qCU2c4m1bZFh+PieemnDZlRxRd
	O1QfjEhteB8mH2jms3GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPlH-0000000Bx6U-0UZ1;
	Thu, 26 Nov 2026 03:03:03 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPlE-0000000Bx5J-0QmI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 03:03:01 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-8c6c06b3321so5207396b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 19:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795662179; x=1796266979; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2sIlkZq+ib9YiZ2csv17ueAxplgaiHMSc6dh2/Ka/Lg=;
        b=Mf3PZI4NYE1CJZv2lfFqDhQsU0KrwJo521r90YVcwatHiPNYH/mKQ4YqQbTU3WOC5S
         CRY0IXIz+AwH2JLOnFD8elh+nbXzLJCO3V9/hd3gdrB4/LP3nSMCrG7eeC8PVeKRDxfM
         lKLpc3vuu0njvLjD/AYmSXtB0r8+ptitXyUaUZju6oBznS436U2rR+C3Bm2ecwDS0xPP
         IztItnAlELeD7owkCrJgKSLvZ71M4uPW5YPAKpmGkyRYjlNdUENTwBaSfrBSTNQxvSJz
         46uUsW5WC4Tj51/Uxsfw8Wn8ABbXQDQxoGqSiSt4VGXffciVtj8ou+n4Fy5rwgSeYmt9
         eJyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795662179; x=1796266979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2sIlkZq+ib9YiZ2csv17ueAxplgaiHMSc6dh2/Ka/Lg=;
        b=oaBOHH6DPnqReqRyjNS1kNtIcW+KrXehyDneEiAufzZ3hwD8BfGHC4qF1jE4x1I3F7
         ghEqwvYS3TpHJLys6R1/qXhl2goW1+0SrtcbPcqaR0csnB4xDkoppOx76+Xp3jjNml+x
         /ICCpt4OVH4geOrzlwERjSdJKpLuhLUHW3D/3kAF6W8QjTpkgZGcFfDCbm+G5VFe6lRA
         i3FqETwGBa2+vuYYBJ1HMG7AlcQo8VpGbL0jiHksCvHxLbjpzqPboQIcvBwkjFZf3wdY
         MZQK03w0OdxwfRKdJI0zdjdNOWQnlJp5UENTSPN8CnUdxaOV/7sV1GSdCOmk2xJS1eLM
         cIOA==
X-Forwarded-Encrypted: i=1; AL+hErESETbC8U4abpzgl31QbaDBx+czYTi5iMp3SQDnZ1Nc+M2KtZQgXxfTJxAYeGUQGdCL29182sjdi/gNQCqeK9qg@lists.infradead.org
X-Gm-Message-State: APuU4Z/B2m8nbhZneoRa41mN4WXoe3YFpACNFOnQ6nukQ0lKXlj2o9W1
	1tV7gMcIIulfB63TUZGfHFG/6+L4qioTidhoHon9u8lMaPMqSXAOy4UV
X-Gm-Gg: AZFdTZdG5MHWJvNfiUI1/a/nnAsc5cbqIlVDlriMLujmdWLCM+N+anrtzH6kWGVEUr+
	am3W8BcmpxV8atIb8ht53KcT/p9IbvgdfdJkCB9dS/wwcmLhF8fVNLdfTVjwjgGsHFl9OIrBvqs
	o2VqolOb6CSu2psKMSeSgicK+JZ1P3UtY70VwGiOrATw6gpXRQBULbl+hyPQBRFHZ/eAaesJU1w
	UChcW3IB4mQuJxuhrnNudQTl+3hvB/rrNVeXvIHDCEfF/cFU/VZJVZwt74us+KcDE0VXim0XIwl
	N6KKHaGkEdyA04iIJ/UjKBWhpJdl1UupvW2WtHWvTbaDYaOV85F5caqjr9/uw5gER/VHTbUUh49
	4WnLBj0AEfJxL9mZASfvvdCuPvqDybMlBxlMec3xs0GCzkkDYJAS/6NxEjJiM+OSUnPO3/9jfST
	JxNLZB0en/jpwj+udayLOUc0RhYP+S15mlZGODWYTMju76XsImK3e3yH/tMoFxcbQfb8p0zbmGX
	f6UuMtjXbkH/EF0HYbfsXDlvFsQgJiPAOuqslY+5f4FN0QbnBiJx/skStd0wHvi6i1NpQkVzWkS
	87d+wqy+I/T35sEhcllp3Iz+K0wFoK6H/A==
X-Received: by 2002:a05:6a00:2d9f:b0:8a5:97ca:1389 with SMTP id d2e1a72fcca58-8c87bdb42d4mr21120203b3a.15.1795662179123;
        Wed, 25 Nov 2026 19:02:59 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c908a56acfsm9231474b3a.23.2026.11.25.19.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 19:02:58 -0800 (PST)
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
Subject: [PATCH v2 0/2] arm64,riscv: boot: emit standard LZ4 frame for Image.lz4
Date: Thu, 26 Nov 2026 11:02:31 +0800
Message-Id: <20261126030233.2546274-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124065650.1968930-1-leeonion.muyu@gmail.com>
References: <20261124065650.1968930-1-leeonion.muyu@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_190300_142350_6A4E4240 
X-CRM114-Status: GOOD (  10.01  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The shared cmd_lz4 rule in scripts/Makefile.lib passes -l to the lz4
tool, producing the legacy LZ4 format (magic 0x184C2102).  The only
in-kernel lz4 decompressor, lib/decompress_unlz4, understands exactly
this legacy format, and all of its users - the self-extracting images
of other architectures (which compress their payloads with the
*_with_size variants) and the lz4-compressed initramfs - keep working
through the unchanged shared rule.

arm64 and riscv build Image.lz4 with the plain cmd_lz4, but a
compressed boot image on these architectures is handed to the
bootloader, not decompressed by the kernel itself.  U-Boot, whose
compressed-kernel path (boot/image.c image_decomp ->
lib/lz4_wrapper.c ulz4fn) only accepts the standard LZ4 frame (magic
0x184D2204) and returns -EPROTONOSUPPORT for anything else, cannot
decompress the Image.lz4 built today.  Bootloaders that decompress
legacy lz4 frames do exist in the wild (mkbootimg on Android offers a
separate lz4_legacy option), but U-Boot and its tooling only ever
supported the standard frame.

So both architectures currently produce images that no mainstream
bootloader can decompress.  Fix both by emitting the standard frame
through local rules, leaving the shared cmd_lz4 untouched for the
in-kernel users.

Changes in v2:
- Pass -BI so the blocks stay independent regardless of what the lz4
  CLI defaults to in the future; deployed U-Boot decoders reject
  linked blocks (suggested by Yann Collet).
- -BI was introduced in lz4 v1.9.0 - older lz4 versions reject the
  flag but already default to independent blocks, so the rule probes
  for -BI support first.

Ping Li (2):
  arm64: boot: emit standard LZ4 frame for Image.lz4
  riscv: boot: emit standard LZ4 frame for Image.lz4

 arch/arm64/boot/Makefile | 20 +++++++++++++++++++-
 arch/riscv/boot/Makefile | 20 +++++++++++++++++++-
 2 files changed, 38 insertions(+), 2 deletions(-)


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.34.1



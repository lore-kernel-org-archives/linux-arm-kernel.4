Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D35F606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 06:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PIcZam90;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TZIN3QVy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=0p+z8V7ioNXKJBlEmlxyaewpcaFtJJtS6Wmykgz/hUU=; b=PIcZam902x2YYR7bCdbYoQ/ZQU
	W3LMbX+SqjaWYyC7lb2UAmqboaBJ4PO/v/cEoaZC+Ek9VBCf5VUsVQker1uYyLTXYlgQ/4p84Dtnh
	LFbVxs/u5jSaTEqa/Cx+JebHwng/RsNSCMz0snpcvt+mg8M2NQ5GmIWKwFHrkLAEXJ7e2CMITMHAD
	xIzRElGA5BXjsIL0Y3rP/4h7+GeNmswkFrRqjvuAYFVA2goRzeuECyrQoxsBW7z9OQdjvQjPwNcBi
	lQn1zsRbLNo6nmwRpI01xacmxHxcnIElYKg4ibJmRc5kfnxcZ0lWcIUkmAlir8Na0j6ob7IvQ955m
	RdCVlYlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVkSb-00000005gUN-0Zha;
	Tue, 24 Nov 2026 06:57:03 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVkSY-00000005gTH-3rlY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 06:57:00 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2efddf749e5so20643835ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 22:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795503417; x=1796108217; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0p+z8V7ioNXKJBlEmlxyaewpcaFtJJtS6Wmykgz/hUU=;
        b=TZIN3QVy8iHjbii9ekUAVMTN+/iER/RGsI1gSzYu6WBT0snppSF96jnGZfh50fTt9d
         /MxFtxUHzXskHjK9NVbnWn3af4GC3S0+UB2k8HP+XZIy41NZ5iGLUiudUZmpdtgw92i3
         boBwk3Pu6LAIC9/79E41hIX4Tb0m4irROLS/px0vGuBATXpA9PMhayAXcTiqme/dPhQQ
         XnOAB76mR8Hr6i5mWbFtLMDP8qN+CFUMj0r+WGMFqhRhY+IHpdyn6xiXRlmLqnme3DES
         sbyRDASJMzgCMOxaxPSywoCvcUthqOUEOVOc2kdznJB0E1fshq77lsob2BlGGSRCGeqh
         Rnwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795503417; x=1796108217;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0p+z8V7ioNXKJBlEmlxyaewpcaFtJJtS6Wmykgz/hUU=;
        b=FBAUg2/m+3lZwwDHVuLQEQWyklMaPlX+NOmELiG9fIowHN3EB9Ejbfe5xF0xAe0NfR
         aSsP6HcRBE28CtgvM5iorcapQwUZRdoCSUKqEE8uZo3mizK8+B1EGUY99vVcsAKLD7UN
         BY+SWqENykMkm2xZYXEg8UcLjTwqCZmBo6MSFUcuuApAJbsxoF9t2b0m7dJQLsWPLlhM
         zfUv3XaArIjyW9sQtxcc7hxaBVNpR5HvvvpIlWhq164fqNoPncYNv5ujW64Ns0GbJHue
         kXNTHyrwfwJEnTFvcpKS42ji7Z6AK0E+NRDBehJbzkXDxH5l9UD5Sw0SX5bPy3p1zC3W
         Ia8Q==
X-Forwarded-Encrypted: i=1; AL+hErGawAyMZagSIgHSeaRFWHuX1evd8quM8thnMo3GVLcnRwoBheoRGHAr/AweJMWupkBe/yeaH+xfCg/Q60FAWylF@lists.infradead.org
X-Gm-Message-State: APuU4Z+jAep71WP7pEtwc0u4h/yZ/xashS43NJxJFpiYmb3c30pVCgzR
	PHLroSkPRts54m4VgHMgb+FivOfUkUGZtziD4R0J69Kx3GNFfqkZDgca
X-Gm-Gg: AZFdTZf3gZvPUDcjIMcZetjlH0kWJIh27558kahutGEroVjppcMbYBiwFwzy2Gz5NsW
	5066H2ObzFSjbBijKS8bh59j90/6tImf2rXAgXgDwMnunaAyZIZsiGb+joV3xxtG0epwx7BS9O+
	bvPosBU/dFD+iJEQeGSnr6ytWCyEUv5eIiWu5BVTZJQdAT3Urj3OH1AxTE3aXhfoaIe8GWn8I0s
	JL5zplJsLmtbC+5UdMZvQNoC66fNgpYIUacRZeXxve8FKwVSkZko0nzscHOQrJfCvptGXG3h4Rz
	sRNpgmsi4jAhbQwe4cUDdyj8ZNQ1k0fCAm8ttRDNB7/Ck01Q0I/TrbhtnBNAU0uyzwKFTU+OO1V
	l4X1PFVMGBe8rT3RSTIl/i/Rt/ze5ELKaudXw94hUSDF19EZ5VpDfIjh4hnwpeDDmNgu/NAdxzH
	C2gcT+x7JBjF3Ztb6/46Ovmp2HAMjhvswqkOKtIW3wrywWF0i8G1iSXqbw9EXKMdgVGnBaynCSX
	bHWtZMqTqRzGcuPk+sk+nFaja+XPP5QGHLGplc9PqYVp2bVxWv88TPdi3aNA017V5k4wPuSNYaR
	Ge1p+n8RHNcCH9RXogq4mgd+w1VmGz7msA==
X-Received: by 2002:a17:90b:5546:b0:3b4:1e3d:ef99 with SMTP id 98e67ed59e1d1-3b41e3df0aamr9878515a91.56.1795503417481;
        Mon, 23 Nov 2026 22:56:57 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f105b66sm64966685ad.51.2026.11.23.22.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 22:56:57 -0800 (PST)
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
Subject: [PATCH 0/2] arm64,riscv: boot: emit standard LZ4 frame for Image.lz4
Date: Tue, 24 Nov 2026 14:56:48 +0800
Message-Id: <20261124065650.1968930-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_225658_955206_5C722478 
X-CRM114-Status: GOOD (  10.18  )
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
this format, and all of its users - the self-extracting images of
arm, mips, parisc, s390 and x86, and the lz4-compressed initramfs -
keep working through the *_with_size variants and plain cmd_lz4.

arm64 and riscv also build Image.lz4 with the plain cmd_lz4, but a
compressed boot image on these two architectures is not decompressed
by the kernel itself - it is handed to the bootloader.  U-Boot, which
implements this via the 'booti' compressed-kernel path (boot/image.c
image_decomp -> lib/lz4_wrapper.c ulz4fn), only accepts the standard
LZ4 frame (magic 0x184D2204) and returns -EPROTONOSUPPORT for
anything else.  U-Boot's own host tooling (binman) likewise emits
standard frames.

So the Image.lz4 targets of both architectures currently produce
images that no mainstream bootloader can decompress.  Fix both by
emitting the standard frame through local rules, leaving the shared
cmd_lz4 untouched for the in-kernel users.

Bootloaders that decompress the legacy format do exist in the wild
(mkbootimg on Android offers a separate lz4_legacy option), but
U-Boot and its tooling only ever supported the standard frame.

Testing:
 - Verified that the lz4 invocation used by the new rules emits the
   standard frame magic (04 22 4d 18) and round-trips with the lz4
   CLI, while the old rule emits the legacy magic (02 21 4c 18).
 - No full kernel build environment was available for either arch
   here; the rule changes are mechanical.  Boot testing on real
   hardware, especially on riscv, would be appreciated.

Related: an arm64 'make install' fix that recognises all compressed
image formats is under review at
https://lore.kernel.org/all/20261119041945.3624785-1-leeonion.muyu@gmail.com/

Ping Li (2):
  arm64: boot: emit standard LZ4 frame for Image.lz4
  riscv: boot: emit standard LZ4 frame for Image.lz4

 arch/arm64/boot/Makefile | 9 ++++++++-
 arch/riscv/boot/Makefile | 9 ++++++++-
 2 files changed, 16 insertions(+), 2 deletions(-)


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.34.1



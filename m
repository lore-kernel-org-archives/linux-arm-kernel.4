Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B229F606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 04:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EY/meV+O;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h2HXBe5Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=AeLEfR0KnNKlaC8G66ovz/ybK9uNCCBKCRK1qZnlN/c=; b=EY/meV+OBdQUU27Ch0Pku+IdXq
	lScWSVBVdxqvaAI8JO9A06qFt4usJ7tmQYPm/wUDOfR1ONfnlaPnK3jClBpaqwnxNKbOfXPUzzl8t
	Kzi/CYDJMynofJuqNQEB+F2XhUwc9Af9pYwokCSj/+sIUf8dQidaf8m7Zgqnfh8gLKX+0Vq2m+hsS
	nnQRAiIfUxbVrGAhIK7RHPWp7X9f7h1XJfNdk/JxCPTyIsHxSUqwLFW4rkNcxIPxoML0prMQsjOWP
	c+AENs2pVufZwH/IySoy5fi/8h6L16glolc/NO4GgE+Dx9LXE412ee6fCGcenP70XX/iaAXQJUWeM
	fNxkteDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTtct-0000000AoSg-41oc;
	Thu, 19 Nov 2026 04:19:59 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTtcq-0000000AoSE-0Ios
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 04:19:57 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-cd6acc50b8dso1075841a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 20:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795061994; x=1795666794; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AeLEfR0KnNKlaC8G66ovz/ybK9uNCCBKCRK1qZnlN/c=;
        b=h2HXBe5ZmKDA7yrQaCORCA5Aa6NyU33UQvDUu8mtZ046aCPCgeuLJMkGJ9hxEVayX0
         ozmLGQ99IluNGSwNjNGykquJmYodloRQXEdeuFjhJ1KnnRbSKU2KICviP18l/R5nJolg
         gqXyA91Jy9PHfwYcfILr9Rb395RJ0cue4AUSrFOgBYQ1hH4xUAxBkKHUe5sUuRb/ZOjA
         8HOREm7NaFfKg+AVZkoxCmSDLOeEmiCMOiKir8Ub4t9gES5clXF77KTe2dL1VMqny42u
         DgSd43v1Ix5Vdn8/qsF/s/xCKfV7apg0yPklTxcavOD2kcXjhvMGQ2C4+DDHA2w/GNoY
         5mcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795061994; x=1795666794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AeLEfR0KnNKlaC8G66ovz/ybK9uNCCBKCRK1qZnlN/c=;
        b=EmYulBSKhzAwQHLNtqfXCtqrRBtwiExkKyAZT6LzZ5thCaN+SBiA9mQwSyCANBql6o
         L2knQnbkML7SPa8/pf7UYK6K+CvRXrbsBQDlyGpuMlZ4HAzjAXGAmjLSd1O7iU5cL7D/
         wK0clQ663wfVmJrRxvNwLmuAwQglHAw+Ic4nqiEodfKRdFOk/5f+e25pZtEffz24BF/E
         XFWuFKiS9xjO9YrY1qlsVMT/2bHn7gDr5rgIydZE+k9tWhnrT495N9CSbUmEV2fkGk06
         NC6HpAsRIYJ9qMtFRh5aD25bMJQoUzTT0IzEUZ7YWSnpMiWdEQEi8fsncxCVoZnkv7Tw
         BP9w==
X-Forwarded-Encrypted: i=1; AL+hErGly8FyCdzHHn3qK0t1RUuM/OunthKI/33gbrlVx1qBbIZLl8L53YY9m2TkwTE5H+zdOa0ohYqyLm1RSdAfkA/T@lists.infradead.org
X-Gm-Message-State: APuU4Z8bnc0eJgHFjhnTif9vQ/8s3PQDrHljwXwPB3cFs30l4Q1iKBYn
	k1U0iDjl1RcG8vhiOH3oVgk1y3RQo3bQGkUpbf99pEHD0DxdKyfh0gCM
X-Gm-Gg: AZFdTZdvyFykpHq6yZqOsCRCgh5NdX4yr+Wa1mOk+MBMFmZmw/YH+DqAlwtR6hp9kj6
	rnr8YxpGHP0B0Wxk+auC7ZE6k/ONHXBkeGKUDDpZoOySyTipPnYZc3k0+J0g8vgafGZqD2DUWuO
	iVjHRGMxA5zks5RVOguf8eOx466iIXwuN2vFsxGoaaL+p9DveAb/x3FePtqWHJzl8ZLgyMoWG4w
	o/H844O5Qn7YMrhQX8pJHs+JiFo68HrIP1TrToDzgRwlnkruZsvnWbJNzXXu9OYhi4GEY3/V7Ls
	0woz/24w/nVC6MryhHNws4ExquTjw1k7JUmR5WJvlxziNQgYhHp5xr/BXHD7bCC57PGHIewYp96
	paxu+nlyP9ogYNQ8ClNOaMRziZMqMlPShhJJhVxVmEERrdTZTMvKTg8BduiN8nyPta7KSSSTIaR
	YVE+uKRLzav7cPBtsqo5YUAzIKQCwcmNvniUp7zOXaIte9bFDQnm1JfUCMQMJ/fWACtJlXguiR6
	kuGX/OaJByUqGs0fpqnPcRFg8ZcVcvv5mIX4BsoplcG23gJLkeQlvn8JweJb75z6AoRYwZm5aQH
	0xOL919Q66U12S+lppzpyifiNamvkxUp2Q==
X-Received: by 2002:a17:90b:180c:b0:3aa:f2c4:12e9 with SMTP id 98e67ed59e1d1-3b3d06a3a73mr5056391a91.3.1795061994209;
        Wed, 18 Nov 2026 20:19:54 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d96bd3sm447764a91.12.2026.11.18.20.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 20:19:53 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org
Cc: mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [PATCH] arm64: boot: handle all compressed image formats on install
Date: Thu, 19 Nov 2026 12:19:45 +0800
Message-Id: <20261119041945.3624785-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_201956_115575_9FB3134A 
X-CRM114-Status: GOOD (  11.57  )
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
	T_PDS_OTHER_BAD_TLD,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

"make install" installs the kernel as vmlinuz-<version> or
vmlinux-<version> depending on whether the image is compressed,
but install.sh only recognizes Image.gz and vmlinuz.efi as
compressed.  Any other compressed image that can be built and
selected via KBUILD_IMAGE, e.g.:

  make KBUILD_IMAGE=arch/arm64/boot/Image.lz4 install

falls through to the normal path and is installed as
vmlinux-<version> even though the file is compressed.

Detect compressed images the same way as RISC-V does
(arch/riscv/boot/install.sh): an Image.* file is a compressed
image.  The uncompressed Image and image.fit keep being
installed as vmlinux-<version>.

Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
 arch/arm64/boot/install.sh | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/install.sh b/arch/arm64/boot/install.sh
index cc2f4ccca6c0..e45d80220702 100755
--- a/arch/arm64/boot/install.sh
+++ b/arch/arm64/boot/install.sh
@@ -19,16 +19,18 @@
 
 set -e
 
-if [ "$(basename $2)" = "Image.gz" ] || [ "$(basename $2)" = "vmlinuz.efi" ]
-then
+case "$(basename $2)" in
 # Compressed install
+Image.*|vmlinuz.efi)
   echo "Installing compressed kernel"
   base=vmlinuz
-else
+  ;;
 # Normal install
+*)
   echo "Installing normal kernel"
   base=vmlinux
-fi
+  ;;
+esac
 
 if [ -f $4/$base-$1 ]; then
   mv $4/$base-$1 $4/$base-$1.old

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.34.1



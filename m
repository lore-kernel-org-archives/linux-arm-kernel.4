Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29CD606A324
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 22:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uPDjCsXJ;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FeVRmTir
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+dsS8/OU0wby4BZ79znZbA9Ny2A1+vlGylVbT5sKa+g=; b=uPDjCsXJPBajBI
	7G8TW5WSDApR6ErdZK2pK7IaBbm+9N60uBUX4tmka1eZvM+ecmVM/sxwhdP/liiZujY/q8HpvbY25
	cYmaoi0Og6ogdVA+oiD0lJmt1rBvJl/zcbPhHZjqya0CElWeQRf/ejRR6EwpptnhszlymfAFpaNHd
	uW1m/J8b9Jil2BUZyY/VTl+KqxikK5lnqsqDFCUZV9rjHEXXve1Hqk0rgwE3TjiE70ZJUO/WdrMQz
	JnwhWN/VXREGwvSHs0/GXOgfkOW1x5h/mnB57cWdfI+L17in1KcVBVpxRlkSsNngsA0mnAxp0+Udj
	zyLBfWOrS5lIMwpshNfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGTV-00000007txw-0jCp;
	Wed, 11 Nov 2026 22:07:25 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGTS-00000007txV-1nRV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 22:07:24 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-170135e43c7so1715294c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 14:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794434841; x=1795039641; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+dsS8/OU0wby4BZ79znZbA9Ny2A1+vlGylVbT5sKa+g=;
        b=FeVRmTirFZKF//H5cX4gMeMoRfLtIcQfkzwcwge49mw5Yk810GDlC1jN8bHvY99lvE
         N+REIVS7/JfNTABB/KGdQxWyHeyAee9qPgofQsdiy3gSdgSkKbAc3RfHlF5xNa6B06uv
         ujOT1me4gJeJvqlUcml88TJB+0Pq96C2rAOjsjouy3Gp+KqPJLLmZmEOY50J8Tv9iPfT
         sHNGyP9AAsiwpZGkm5SCT6j10SBw8pXMC4vRsqxXzJ6q/Y+IJQdvwUhMJMdFxNMqe+VX
         lY7/rxTh7kytsJh7uHvl9dohJNGJ/W1TILUEMnf/yeXrxccuI/Bj/ymtvjxC532S+m81
         LrEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794434841; x=1795039641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+dsS8/OU0wby4BZ79znZbA9Ny2A1+vlGylVbT5sKa+g=;
        b=ftrTM7lhamQecnh3moTX7ApbRE6MGjdIu8TXpvXy9DSccpusK7wC9NWEDjZ88W6pIQ
         mFqXxmiTX21Oj2DpKBNeItRWBDhl8OR9EN4VuASgfcKoroiuK6uSHdrHMfd+gR4VAtS7
         kncT+qubbgKXeJhGTN1pI69pzzrjVFQWZTjOGkpiKF/wk6elsWaynO2sGp1JEByt1jhw
         qanQ/5M7NcAGNMe+KU7r7xMZFoLOezmYV8n62KdWPF6aPpPzfZ6fB/8KHMxY1rBgm3dJ
         FwV0BnniljJKsL2Xq3mGZdurnjz8bhjdYBNSrCiHS1RISX+jwTTpgT6skGqiJ40EbiS3
         fHcA==
X-Forwarded-Encrypted: i=1; AL+hErH2E6yLcVDMvf5/QkK+wP6NKAOvVElra/1JXo1tnRXIuJr5+3u5gyPY1zkg7by1pbb1jc1XU7xi/R2rGkN8jUV5@lists.infradead.org
X-Gm-Message-State: APuU4Z9T5PFDzVusxZwjUvFT7wcDIDB5ZEWqZh1+EOB2iKHaxpz8ZjGF
	LzABYUGpgwRDfPBTHgNuoCZRezZF4nenKJRoxat5l6GW+4GuSy+dz9KJ
X-Gm-Gg: AYBFou2api2zpiQN0Dt02EkbVJqA9hsT+ukl3S8UfBOoQ8e/p9xQgjif+62yG/QFQns
	Gmzaau8NWF5wVG/4uFY3vzL4YbTaEvHdrEElDMfojt2+ttAHp9raD09LtwOGLFpRnU3+1h9EOOQ
	rS457cEwSrdYWiUQdmNLFT115q1EmLwHCmN0/655I/se9s6yXqEyd3ktDdE4gIfrDRjZHI04OJY
	bYCiGXoCqfFXO0Dg7JE0T4MUVAil8tgSLn83KK/QfzCMuWtJcmWqKc6v+Bhm7LqOpkMDyMSOsrf
	Lj8iAV5cLiwcvb91HJ6bySV/9zvH3Kh6ZXHN9R75Wbe9qa9xVJhabPDXy6kNo+xBEiGe6Oy1NiA
	amXyyANEDYSHpV6u1oQgodUtzBAE039V20S+aP2+MRST4tSU6EnGxZHMM8MEnvGMbcs8DkCXaSK
	eeq9Os+tRMS2bVj16xW5ht1UzRio2pNjXjgVMXQv9sA0rSTmRSwpedSq5omcIHc8M/dNLRptfyk
	xOQKPWa8dG1DAWQBDVhH7TBJW42oA4WeBZ8z4CcXYMXAFPm8PyS1LaF8xnyH9SNTc8MYs00+8yY
	w6vnAIMKIRmlymdAQUTy
X-Received: by 2002:a05:7022:296:10b0:190:d0d9:3110 with SMTP id a92af1059eb24-1b3c0365599mr3096674c88.45.1794434841284;
        Wed, 11 Nov 2026 14:07:21 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890584sm20571438c88.3.2026.11.11.14.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 14:07:20 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: soc@lists.linux.dev
Cc: Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mikko Rapeli <mikko.rapeli@linaro.org>,
	Vincent Mailhol <mailhol@kernel.org>,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH v2] arm64: defconfig: drop four symbols that no longer exist
Date: Wed, 11 Nov 2026 22:07:18 +0000
Message-ID: <20261111220718.2586239-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111202914.2558187-1-takano32@gmail.com>
References: <20261111202914.2558187-1-takano32@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_140722_470840_B6B80A9F 
X-CRM114-Status: GOOD (  15.09  )
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

None of these symbols exists any more; the lines are left over from the
removal of the options they name:

  NFS_V4_1                  folded into NFS_V4 (7537db24806f)
  SLIM_QCOM_CTRL            driver removed     (7cbba32a2d62)
  NET_VENDOR_PACKET_ENGINES vendor removed     (aec3202247b4)
  SCHED_DEBUG               option removed     (b52173065e0a)

The Ethernet line was added by commit 32379ad4060b ("arm64: defconfig:
Drop unused Ethernet vendors") a week after the packetengines vendor
directory had been removed, so it was stale from the start.

The built configuration does not change.

Link: https://lore.kernel.org/all/20251223134807.3543642-1-mikko.rapeli@linaro.org/
Link: https://lore.kernel.org/all/20260317-arm_defconf_cleanup-v1-3-8eecb7fdd24d@kernel.org/
Link: https://lore.kernel.org/all/20260317-arm_defconf_cleanup-v1-9-8eecb7fdd24d@kernel.org/
Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
v2: the commit message now carries only the change itself.  The test
    record, the earlier submissions and the AI disclosure moved below
    this line, as Krzysztof asked.

Tested as configuration text only: "make ARCH=arm64 defconfig" on
v7.4-rc2 with and without this change gives a byte-identical .config,
and "make savedefconfig" emits none of the four lines.  No kernel was
built or booted from this change.

Scanning every Kconfig definition in the tree leaves no other stale
line in this file; similar leftovers remain in other architectures'
defconfigs and are left for separate patches.

Mikko Rapeli sent a patch for the SLIM_QCOM_CTRL line in December
2025, and Vincent Mailhol's "configs: cleanup obsolete or incorrect
assignments" series carried the NFS_V4_1 and SLIM_QCOM_CTRL lines in
March 2026; both are still unmerged.  I am happy to drop the
corresponding hunk if either author would rather keep their own.

The change and the changelog text were produced with an AI coding
assistant (Hermes Agent, model deepseek-v4.1-flash) working from the
tree and the git history.  I reviewed the diff and the reasoning, and
I am responsible for the submission.

 arch/arm64/configs/defconfig | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7b4985b29b21..513f8d6be073 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -424,7 +424,6 @@ CONFIG_MLX5_CORE_EN=y
 # CONFIG_NET_VENDOR_NETRONOME is not set
 # CONFIG_NET_VENDOR_NVIDIA is not set
 # CONFIG_NET_VENDOR_OKI is not set
-# CONFIG_NET_VENDOR_PACKET_ENGINES is not set
 # CONFIG_NET_VENDOR_QLOGIC is not set
 # CONFIG_NET_VENDOR_BROCADE is not set
 CONFIG_QCOM_EMAC=m
@@ -1756,7 +1755,6 @@ CONFIG_QCOMTEE=m
 CONFIG_MUX_GPIO=m
 CONFIG_MUX_MMIO=y
 CONFIG_SLIMBUS=m
-CONFIG_SLIM_QCOM_CTRL=m
 CONFIG_SLIM_QCOM_NGD_CTRL=m
 CONFIG_INTERCONNECT=y
 CONFIG_INTERCONNECT_IMX=y
@@ -1824,7 +1822,6 @@ CONFIG_SQUASHFS=y
 CONFIG_PSTORE_RAM=m
 CONFIG_NFS_FS=y
 CONFIG_NFS_V4=y
-CONFIG_NFS_V4_1=y
 CONFIG_NFS_V4_2=y
 CONFIG_ROOT_NFS=y
 CONFIG_9P_FS=m
@@ -1861,7 +1858,6 @@ CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_DEBUG_INFO_REDUCED=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_FS=y
-# CONFIG_SCHED_DEBUG is not set
 # CONFIG_DEBUG_PREEMPT is not set
 # CONFIG_FTRACE is not set
 CONFIG_CORESIGHT=m

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.53.0



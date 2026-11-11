Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACD6606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 20:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v5yNIz9V;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i0KeFaXZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=9It4hMqtt49l3ULmVv9787KtA2OXBi4xbJqqG9UksKs=; b=v5yNIz9V/w3cBLC6N/jz8eU3KH
	GyHrlZCveSQbXO8uYeERGDsLWSZ9NVGi3LokvQ3e3uHa/wxubKRNGoVE/DcYSB6wLAQq8+h6oR6Ix
	vlSUIGJTPVf3v4pOFWA3qC/R0vGw95M/6pjCqKwgZisA9Fu1wxQbIDcz6K+R15lh6oEg6sttshy3Q
	J0G3KIMdNwhwII4EyTG8qLEVg9HAsdEJ9hp/EvD+1v0NybdJ/A5ZFBg2Y2hkMVH71N3B6koHGJ2Ru
	MogvLeA+Hnx+2dbCfa8SUfYGqB9jnUWnAowKXkRQnjlOiiyDwS4GBwAve0ivKzU6YY7ArhxX2kcv9
	FsGQkE4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xREwb-00000007dDe-2oXq;
	Wed, 11 Nov 2026 20:29:21 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xREwZ-00000007dD1-1bmf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 20:29:20 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-37071c0f42aso6071359eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 12:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794428958; x=1795033758; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9It4hMqtt49l3ULmVv9787KtA2OXBi4xbJqqG9UksKs=;
        b=i0KeFaXZo/LfBOwV8Uq9Tnlui5p+TeUUXQ+fIhHvBsGRbPiwMbb1BKzchgHxAIXVJ6
         2NnyUDdiOiz71ONimEwCHfVBYZcOozpE7JWjWfO/nk+wNp/FB5XRruem+CTKT2hC550N
         Y43BoU60+YVkkFih6KnOWFyBLHMPXHXQ2bks/oXV7wW4Y5x0q5g+hmKmLEoGqRjw7t04
         SaNFKMa3nKOwQHHXsK/iPwX7cvnFjpXDRWYlD5DeJs6lR7FK0jySaFyynPkWNP9ctipB
         yAWG83j6vlrlLVPC8+yqkne927KHRDUVQLdGUe8rFWwFSdzFbLA6mtvMThi3sN8YPFC7
         CpdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794428958; x=1795033758;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9It4hMqtt49l3ULmVv9787KtA2OXBi4xbJqqG9UksKs=;
        b=TvvZy3r29V24HDyhKUSz678l3SmXEc38OCwJq1Mr3pBANwApBqnBlF9QpRz3SWhUQ2
         pwG9ZVxruaCGBQo2tTGgiwhTfBZhi+p6kpMfK5bmK8sqGKzvzDAxYOMCQ2+e9vgbyaen
         dy9xvo0/vp4P4/9ZFmuye88U/4nDgfSmXzmhZZba7GNW+LR+ZAZKZ9s8KuQ2fIcPjyeP
         2EuGlFuI9FVQmsp6U4NAMLlY2hHd2MUMmVYnAwo4xXDeyf5kt4WMiYYqwI673oWTF836
         Q8wWs6k8/aSprLOvlBFJM62+5R9PjgDD2JEDZRYGXdZiNP5SaNKuU6voB0kbbtXKh4Qr
         fa+A==
X-Forwarded-Encrypted: i=1; AL+hErGOscaWuYWYsFQkkfEw22LkjpM7fVW2fhOEVug30PUGQOsyTa36mMjqm+aQDgJYAt4zZW9uk+5rhHs6qq91Di5Q@lists.infradead.org
X-Gm-Message-State: APuU4Z9jMUOwHDtmHc3lO16qNWHRkZnwStGX+mnmSVtyE55coN6SEnxf
	5wTTZFJh2RSnyeU2FF3sMrBiIIWXGzgp0+bjwTMJbWkX2MBtROKLeXU9rqsTToLJ
X-Gm-Gg: AYBFou14sa+5czLR8c2BrJ/H7i21jkQbn2WvXoJryzxMrFoSvRylq7URPr4yC4QHDWS
	niCvnR8V2tWZ+4T21rRyEKLL1NKJpA5Tl3BQP8j9KeKtovfmVD95lgsatsKM9cj+E6LKZ2BC1BR
	1jUJFOXAqYISB5H9vuvy3HhMzZBLR7l0SpgabU6nWyqwqb9UuE/euKh+NMllW0uP9RtaEWDVhLz
	lkIRJYzINsq6aw5TCsa/LGdkr11lXsPO/VvY3MR3iJ43+hy3dkm9IIw/dU0h6mjChAMzipItcXj
	iWm6AT0cr+Kp+4LjOJqcFtf/xTPzijMAPvRilr4KCm0TDDQz125nZ+E3sxVTQs7CNOCkMsbe29q
	l0n04MU7OUYNA7frZTlg1BdnOSCC0yB5Y2kXOqkp3hZ4uupiKrEb6WXmDIMf+qamo5xzgHwqtD0
	PxaoD0Jpt/Xf+8vDZo8A4Dfo6QWVayayWE03Us1FbzngnOw4ZUy9pGS4QIKn1zm1B8dtPcOxcoP
	xZkclokdukecqWHg/XcmQOaCFWQ/Q06Tbvp2ZsQMPc7Oz8GbWAaPqfih/5IdN9kfJFBB5DL1Unf
	dAtkHLQldroimPZt/Vnu0V+CDAL4G2ljlnI57NxDLA==
X-Received: by 2002:a05:693c:42d3:b0:366:9f06:3c4c with SMTP id 5a478bee46e88-3768694ff22mr3227743eec.32.1794428957949;
        Wed, 11 Nov 2026 12:29:17 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm20740200eec.17.2026.11.11.12.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 12:29:17 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: soc@lists.linux.dev
Cc: Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mikko Rapeli <mikko.rapeli@linaro.org>,
	Vincent Mailhol <mailhol@kernel.org>,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH] arm64: defconfig: drop four symbols that no longer exist
Date: Wed, 11 Nov 2026 20:29:14 +0000
Message-ID: <20261111202914.2558187-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_122919_428289_4729E36E 
X-CRM114-Status: GOOD (  15.05  )
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

None of these symbols exists any more, so the lines look like options that
can still be chosen:

  NFS_V4_1                  folded into NFS_V4 (7537db24806f, 2025-12-04)
  SLIM_QCOM_CTRL            driver removed     (7cbba32a2d62, 2025-09-12)
  NET_VENDOR_PACKET_ENGINES vendor removed     (aec3202247b4, 2026-04-22)
  SCHED_DEBUG               option removed     (b52173065e0a, 2025-03-17)

Three of the lines went stale when their symbol disappeared.  The Ethernet
line was added by commit 32379ad4060b ("arm64: defconfig: Drop unused
Ethernet vendors") on 2026-04-29, a week after the packetengines vendor
directory had been removed, so it was stale from the start.

Scanning every Kconfig definition in the tree leaves no other stale line
in this file.  Similar leftovers remain in other architectures'
defconfigs; those are not touched here.

Mikko Rapeli sent a patch for the SLIM_QCOM_CTRL line in December 2025,
and Vincent Mailhol's "configs: cleanup obsolete or incorrect assignments"
series carried the NFS_V4_1 and SLIM_QCOM_CTRL lines in March 2026; both
submissions are still unmerged.  This patch covers all four lines and
would supersede those hunks; I am happy to drop the corresponding hunk if
either author would rather keep their own.

Tested as configuration text only: "make ARCH=arm64 defconfig" on v7.4-rc2
with and without this change gives a byte-identical .config, and "make
savedefconfig" emits none of the four lines.  No kernel was built or
booted from this change.

The change and the changelog text were produced with an AI coding
assistant (Hermes Agent, model deepseek-v4.1-flash) working from the tree
and the git history.  I reviewed the diff and the reasoning, and I am
responsible for the submission.

Link: https://lore.kernel.org/all/20251223134807.3543642-1-mikko.rapeli@linaro.org/
Link: https://lore.kernel.org/all/20260317-arm_defconf_cleanup-v1-3-8eecb7fdd24d@kernel.org/
Link: https://lore.kernel.org/all/20260317-arm_defconf_cleanup-v1-9-8eecb7fdd24d@kernel.org/
Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
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



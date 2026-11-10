Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B10D60A2603
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 10:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uF1Tapwf;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=0HwuzVzr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=uRXUy8URMFJL42UsUUDEQakhlpG+sH9T+5dJoqYfuRs=; b=uF1Tapwf5bMLLBxndeJdffZ8KG
	lpNWc5yshPZri3ktOKop55AIb945BhLo7ZdwjR+PWnrBrS3oKd9dydFOIvmY06N6c9jfIbGBuRCm/
	ZvbhNo8aG7IcPLTKoBdDxjRYUajDZDDpqNv2aZSY0RpgUJYB1wqc0sKkDT1/NWJTpZdyLA2EFOCi/
	TmuGoEkcjoSRTppNtCcZ522wlg7sQ3tJHzgrURTRK6/DxLNzoFAN2poWQ5Qi39QHFh0c9RTMaOOHC
	Z0PqwE39r3dAXTR7N2ZTV7wfe42PxcwszFQM/zj8/ajBGbDygaWJQeifWEhX8xw1b4TN4sAiz999n
	1kCmqJmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQitq-00000003Qla-2xUX;
	Tue, 10 Nov 2026 10:16:22 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQite-00000003Qkj-0g8f;
	Tue, 10 Nov 2026 10:16:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=uRXUy8URMFJL42UsUUDEQakhlpG+sH9T+5dJoqYfuRs=; b=0HwuzVzrFlw4rhUtVs2kpNQEsL
	Qz2R91yxGkmikYXIzlq3/uDopppNQzO+ovydO0aqepYs4IW+TGhaydKscis69hg8WLyV+qVBtXZpv
	KOYsA+PqeciKzq1fseWzrPVaKgcvp27hTGOxsJ/8cddN/zzBSRvTc+dWvYv+Jz8qK2kZe6DjTq5u4
	PwyeJ0lntyDwDtC+V+bHoh+CCfS5h3cV/nJ88rr4sZUIDnL2Gs2AjMpde+0WoKzcReDCEmiZ083SA
	FtjMV5Edg9WVcxxXFh3EcBK7dGHzOyHkEUySfdv7bnoJjbxZrXkH2n8mjbwq+fy7t4719lX7rGEYA
	+LrG2LeQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	hjc@rock-chips.com,
	andyshrk@163.com,
	chaoyi.chen@rock-chips.com,
	damon.ding@rock-chips.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de
Subject: [PATCH] MAINTAINERS: Add two reviewers to the Rockchip DRM entry
Date: Tue, 10 Nov 2026 11:15:53 +0100
Message-ID: <20261110101554.1809467-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_021610_219902_F0E0B61C 
X-CRM114-Status: UNSURE (   9.74  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Chaoyi Chen and Damon Ding volunteered to become reviewers for the
Rockchip DRM drivers, so add them to the MAINTAINERS entry.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..99142a911350 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9139,6 +9139,8 @@ DRM DRIVERS FOR ROCKCHIP
 M:	Sandy Huang <hjc@rock-chips.com>
 M:	Heiko Stübner <heiko@sntech.de>
 M:	Andy Yan <andyshrk@163.com>
+R:	Chaoyi Chen <chaoyi.chen@rock-chips.com>
+R:	Damon Ding <damon.ding@rock-chips.com>
 L:	dri-devel@lists.freedesktop.org
 L:	linux-rockchip@lists.infradead.org
 S:	Maintained
-- 
2.47.3



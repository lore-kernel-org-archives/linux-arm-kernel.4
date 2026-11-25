Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D1E606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 15:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dtO2sNJW;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=SDpNnEOa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CPGHdi5hn3UUOKK1RE9pKHspisRxsJXHsd478u7KaXE=; b=dtO2sNJWk3s9iL
	jgdA7pgHB2OGGWUpIWFFGOj6kY4hRuYzUolgfpA2DKquRG/PP9JtJOVdSNRHoqk6KRG4OSw91Qbux
	G7fe+t2e/Mqr3gEGDlKZyz6J8bW1E70sVzfGuSbHftp1VPM3iAL29W1lBykqNMFxRltbbGTvxepnT
	3IwC0iePdSOA788mCmvXLQMx7DE00ns/LwqwdzWjPkGGqPisXJMqDk1exG0tCKSgZaD7K5lz2iWh1
	/kSZrsuR60oBLla2EC4agAgmHZLFmTVK9s1VygEcUq48Wm5PhWhlYgowRWr/Pgexh8+OHRWcgV4EI
	c4C2k68UB1rkOJudxMnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEha-0000000AJ6J-2L01;
	Wed, 25 Nov 2026 15:14:30 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEhP-0000000AJ1U-0wyo;
	Wed, 25 Nov 2026 15:14:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795619657;
	bh=5SVJit0opG7N0D4+Pi1jC59zsOBfQVNHBUgYfuYT6WM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SDpNnEOa9na5DUl++Ar85gb61ANlPHVYx0XxQJlY58/NX7wLvPymkux4kHvn+KUtF
	 yR/TXWJjlZAzJXZekBPON+buancX5p0XxP+nLKSBWPwhPbvcyq4TIpcIv3mhgp2K0B
	 YMIGjmF+o7/+lQQ2FShBrMUCwKpq4okoY3zIg94F1oJnkp8cGBUmNicBON2T99vZ1V
	 YxDIs5rg+UAwnuiACe3Wluiw/b7X+CeGdLp3FHFOwRRAn/ZNBZkkA1NldjPvxfyZZX
	 +pAjxdnZiJa/kkoY8WO/tvoA60rJefqOfylMW51ABskMJY0QEbUMmzj/W4XSmJ/3Fp
	 Dg57LivNcARmA==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A4A2317E00C4;
	Wed, 25 Nov 2026 16:14:15 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Wed, 25 Nov 2026 10:11:58 -0500
Subject: [PATCH v4 1/5] media: v4l2: Add callback for show_fdinfo
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-v4l2-add-fdinfo-v4-1-2dc73fad9932@collabora.com>
References: <20261125-v4l2-add-fdinfo-v4-0-2dc73fad9932@collabora.com>
In-Reply-To: <20261125-v4l2-add-fdinfo-v4-0-2dc73fad9932@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, kernel@collabora.com, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_071419_679309_549C16C5 
X-CRM114-Status: GOOD (  12.77  )
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

Allow v4l2 drivers to add information in the fdinfo file matching the
opened /dev/videoX file. The core prints the standard "v4l2-driver:"
key with the driver name and then calls the driver's optional
show_fdinfo callback, added to struct v4l2_file_operations, to let
drivers append their own key:value pairs.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/media/v4l2-core/v4l2-dev.c | 10 ++++++++++
 include/media/v4l2-dev.h           |  2 ++
 2 files changed, 12 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index fd267fb74905..8a350ef3a9ed 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -481,6 +481,15 @@ static int v4l2_release(struct inode *inode, struct file *filp)
 	return ret;
 }
 
+/* Override for the show_fdinfo function */
+static void v4l2_show_fdinfo(struct seq_file *m, struct file *filp)
+{
+	struct video_device *vdev = video_devdata(filp);
+
+	if (vdev->fops->show_fdinfo)
+		vdev->fops->show_fdinfo(m, filp);
+}
+
 static const struct file_operations v4l2_fops = {
 	.owner = THIS_MODULE,
 	.read = v4l2_read,
@@ -494,6 +503,7 @@ static const struct file_operations v4l2_fops = {
 #endif
 	.release = v4l2_release,
 	.poll = v4l2_poll,
+	.show_fdinfo = v4l2_show_fdinfo,
 };
 
 /**
diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
index 2e0f6d2e6a78..258b3e7a76e7 100644
--- a/include/media/v4l2-dev.h
+++ b/include/media/v4l2-dev.h
@@ -191,6 +191,7 @@ int v4l2_prio_check(struct v4l2_prio_state *global, enum v4l2_priority local);
  * @mmap: operations needed to implement the mmap() syscall
  * @open: operations needed to implement the open() syscall
  * @release: operations needed to implement the release() syscall
+ * @show_fdinfo: operations needed to implement the show_fdinfo() syscall
  *
  * .. note::
  *
@@ -212,6 +213,7 @@ struct v4l2_file_operations {
 	int (*mmap) (struct file *, struct vm_area_struct *);
 	int (*open) (struct file *);
 	int (*release) (struct file *);
+	void (*show_fdinfo)(struct seq_file *, struct file *);
 };
 
 /*

-- 
2.56.1



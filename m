Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2BE606A33D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 21:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eN/fZheY;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NU7oXRwB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=FifjGHjtBoRtzkOOJ+i+OfzI8gb85lACJmrrh0Mq/7g=; b=eN/fZheYUM3Np6wNEXc8P6vBWU
	TsHYnyhHff0vMbWmiwkYpcCGFvN4XlM+QwQP938cTD4sX1pl7gctFE0ky2JOWUnb10CzkLn5EdMKV
	Tb9CtEjhVAoWOc7YWTCB5dERDmUjeA00hLw24pIIwq9riVTF+BTcSH7xF/XSks/uIyN17A+B0nE3s
	TUahORl9hcY2khNpZ47qlWRT7Xa6YhpoYwS70TF/JDbaQCWClRnBCHBhOztfBtLhzIWCaxlMMSXcd
	SF7vrQ1uczubKBwWHM6ZhCUPjxTGtXYjkd9PrZNEl/hOnnGNDoGtJK/mMaCM+VUwnnpUSTaBtDBrF
	SmJTqXEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUWV0-0000000GJzG-1F43;
	Fri, 20 Nov 2026 21:50:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUWUy-0000000GJz4-1dCD;
	Fri, 20 Nov 2026 21:50:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 989144044A;
	Fri, 20 Nov 2026 21:50:23 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795211422;
	b=Vomt4wKq3pwx7mfiiijT03kZngLrWTPDfEi3uFeQG8LTzVj3qqC4XRb9ZaBwjLYMb3Qr
	 L6NpYzkCFFRzGhKnbBdHNDlm/ybUeqGfSYrqBkSEx6TAMWAwyLpptUQjuy9UToIBpVmtx
	 2zalH/3pm6gH+VUpN9K1JuK63NlHX/lFQBuY7Mbyjqa/+6di4w5v0ho59Teq2Qd7LwlQr
	 agqgbHBf3TuVHe4Duo+rC8XqF4+vLDE81CCeKZ6thUsX9f4z7KGhDJljTkNrfKkE6vxoW
	 ZHz0DZCG6URtVlRm3zksR0am4GiNyNWI2ZDw/PJcfkCsja9RvI5rG8keWwkMeDaomEg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795211422;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=FifjGHjtBoRtzkOOJ+i+OfzI8gb85lACJmrrh0Mq/7g=;
	b=F7RuItdZu1nb6qGLIiHTrMDIy7HMKCdyrlV2wbv5T1HtYb242d3IBldwQe6pXMesqnUJ
	 s7vVfyntQuxwtcdbI2SPns7G/xFw6RbypLotG91kEDJoQQsr83O2f40aTuKuc1vXcEYCR
	 iGWy4bYfPqdOdGeL3KnIrkVR8SndPd5DG2hD6hXbxxBSv6CIk+3zRTKj//wVgU0R2EAN7
	 IqTPuzHXbeaOz2ymX0ob4omkPURivh+KhnN9kEQR0SvGzTVsyz3M0uamBMXFHkYdmhQIf
	 jS9SYFswlnXsHCID5tCyV16EFwvryZtw4LmGUyouog+p9BGLYhnYasNuAy1G5Yz8MBw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3BBA91F000C6;
	Fri, 20 Nov 2026 21:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795211422;
	bh=FifjGHjtBoRtzkOOJ+i+OfzI8gb85lACJmrrh0Mq/7g=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=NU7oXRwB0rf7uT20WX7gY+yESLJQpNqR4bfzCJ6ppyifZRxkW8wuv0DvtVtkEtq8i
	 17axIhz6cURhNbLFFInZFNYd2ByxP7RnVkd5kDxBLDGTJcMCH9Rq9saI7BBGs5gq7m
	 8zXJUeYmnxEL7QgG/Ue3f9D4eysoveE5r+r0RjgfplXL67Bnsv6A3u0Yt8O3I6OiWG
	 OkZIGU4hdJgxjR3eBSYqyybwBiFMvNzPuTg7NZBt6+pbR43SOgTIWCe85V8iTBwJYx
	 bOyaSndPw4ek7tgo7B2zcZ/FzHdJ9Mb7ociAXZ3nmXbG961qbfUmbD9HPIR2Iepe5E
	 oQCs4SLAAeiaw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id BFCDF4BA44;
	Fri, 20 Nov 2026 21:50:12 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Fri, 20 Nov 2026 21:50:12 +0000
Subject: [PATCH] mfd: syscon: Give each syscon its own lockdep class
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261120-syscon-lockdep-v1-1-aed779a004b8@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/zWO3W7CMAxGX6XK9YzmpA0tmqa9x8RF7Dosoz+sb
 tEQ4t0Jf5dH+nyOz0ZlSqJmU5zNJMekaRwy4Fth+CcMO4HUZjb23XpErEBPyuMA3cj7Vg7QonO
 RqpoticlHh0li+r8Lv7cP1oV+heeb5bmY5G/JpfkxM72ohntpU3w8Q80rxN0elhDhiIDQchlKR
 hJXua9dH1K34rH/vGkpqECGPs35faa19TV572ouESM7G93aSeMroZpCIw1ZKs32crkCfN8YTwM
 BAAA=
X-Change-ID: 20261115-syscon-lockdep-d133fb58c2be
To: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795211412; l=3821;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=WqiBN6Xp2Rqa6ZfdIfM4Z9bo5BDV1QpOV4b8/NaDhLA=;
 b=bV7qC6N8PcVutSRsBfSL/nmmHW3NwY1Keqwl447bgS/qvzvVny8vuxfTo+l50SKkegBdNZ7VK
 mp5l1YLaOh8Cm9JkXuRnrzzNyNU8T4HtjAak3io8yApvq2tBKt2sVnL
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: aiyengar1990@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Arun Iyengar <aiyengar1990@gmail.com>

All syscon regmaps share one lockdep class, as regmap_init_mmio() uses a
static key per call site. Lockdep then mixes up unrelated syscons: on
RK3588 the clock-gated VO1 GRF calls clk_enable() under its regmap lock,
while the CRU's GRF gates take the SYS GRF regmap lock under enable_lock.
This is reported as a circular dependency and disables lockdep.

Lock each syscon regmap with its own spinlock and lockdep class.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
Tested on an Orange Pi 5 (RK3588S) with a 7.3 based kernel that has
out-of-tree DisplayPort patches, lockdep and KASAN on. Without the patch
lockdep reports the cycle during boot. With it /proc/lockdep shows one
syscon lock -> enable_lock and enable_lock -> another syscon lock, there
is no report and lockdep stays on. Build-tested on for-mfd-next.

Applies on top of "mfd: syscon: Put the clock after regmap_exit()":
https://lore.kernel.org/r/20261119-syscon-clk-uaf-v1-1-dc4a4c1be353@gmail.com

Developed with Claude (Anthropic), which wrote the code and the commit
message. I reviewed every change.
---
 drivers/mfd/syscon.c | 36 +++++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
index 3ff4e024542b..34f278dfd2a8 100644
--- a/drivers/mfd/syscon.c
+++ b/drivers/mfd/syscon.c
@@ -13,6 +13,7 @@
 #include <linux/err.h>
 #include <linux/hwspinlock.h>
 #include <linux/list.h>
+#include <linux/lockdep.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -20,6 +21,7 @@
 #include <linux/reset.h>
 #include <linux/mfd/syscon.h>
 #include <linux/slab.h>
+#include <linux/spinlock.h>
 
 static DEFINE_MUTEX(syscon_list_lock);
 static LIST_HEAD(syscon_list);
@@ -29,8 +31,29 @@ struct syscon {
 	struct regmap *regmap;
 	struct reset_control *reset;
 	struct list_head list;
+	spinlock_t lock;
+	unsigned long lock_flags;
+	struct lock_class_key lock_key;
 };
 
+static void syscon_lock(void *arg)
+__acquires(&syscon->lock)
+{
+	struct syscon *syscon = arg;
+	unsigned long flags;
+
+	spin_lock_irqsave(&syscon->lock, flags);
+	syscon->lock_flags = flags;
+}
+
+static void syscon_unlock(void *arg)
+__releases(&syscon->lock)
+{
+	struct syscon *syscon = arg;
+
+	spin_unlock_irqrestore(&syscon->lock, syscon->lock_flags);
+}
+
 static const struct regmap_config syscon_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 32,
@@ -114,12 +137,21 @@ static struct syscon *of_syscon_register(struct device_node *np, bool check_res)
 	if (!syscon_config.max_register)
 		syscon_config.max_register_is_0 = true;
 
+	lockdep_register_key(&syscon->lock_key);
+	spin_lock_init(&syscon->lock);
+	lockdep_set_class(&syscon->lock, &syscon->lock_key);
+	if (!syscon_config.use_hwlock) {
+		syscon_config.lock = syscon_lock;
+		syscon_config.unlock = syscon_unlock;
+		syscon_config.lock_arg = syscon;
+	}
+
 	regmap = regmap_init_mmio(NULL, base, &syscon_config);
 	kfree(syscon_config.name);
 	if (IS_ERR(regmap)) {
 		pr_err("regmap init failed\n");
 		ret = PTR_ERR(regmap);
-		goto err_regmap;
+		goto err_key;
 	}
 
 	if (check_res) {
@@ -159,6 +191,8 @@ static struct syscon *of_syscon_register(struct device_node *np, bool check_res)
 	regmap_exit(regmap);
 	if (!IS_ERR(clk))
 		clk_put(clk);
+err_key:
+	lockdep_unregister_key(&syscon->lock_key);
 err_regmap:
 	iounmap(base);
 	return ERR_PTR(ret);

---
base-commit: 1cb7268b6638c411fc32f373e965eb8ba9e9b2b4
change-id: 20261115-syscon-lockdep-d133fb58c2be
prerequisite-message-id: <20261119-syscon-clk-uaf-v1-1-dc4a4c1be353@gmail.com>
prerequisite-patch-id: 7cf33abeabb3eeaf1ba8ac6c461726fca87702cd

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>




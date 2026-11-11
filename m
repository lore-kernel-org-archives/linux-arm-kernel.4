Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2601C606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 10:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=plKoi80T;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=pKGDmjRQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=n3v1AgR+CHCMi0QrlArcix8UUVt6MgDpIHZcAPaGD/I=; b=plKoi80TkvRwba
	pDc7B6vRIOVy8a3PgnLTerEGmSeFGlWRL3ZtH3dYSYKmdnkpjCVcYOVUF2PUCLQltDWIoMtP81H9F
	jSA1X3sy7uTxiulbkBRCn6+xQeh27UkFUggU5aGdimb2OY6JklmmWMfFMUYTmgsxqccebx2ZqRIQ0
	dfXat8UQM43IUTKQzks4BKsUAdP6+7/MkZ9KRJSLrP4o4OR5qJuK3Sx1Qeevk6IZhtSCO9auaIOyF
	zEV+uuBt7ga+lr+3bidBfxn2IpdS5yY4hCdCZHiJXs/qMh20dJWYfdIgsPNdD1xHDND1P0q4o9kqK
	VCJPYA5Gg8ItngL0EosA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5KJ-00000006JTI-4BPI;
	Wed, 11 Nov 2026 10:13:12 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5K4-00000006JJU-3pkR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 10:13:00 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso18750495e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 02:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794391975; x=1794996775; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n3v1AgR+CHCMi0QrlArcix8UUVt6MgDpIHZcAPaGD/I=;
        b=pKGDmjRQPq8HXdma7N7vLww9Jrsn1Ozpnnfda9ki+Dc8+isi0es1Gh/7iHJH5Qzp8N
         q5XLy2PHG15fQ8u02Has5zEF4gAfWdbVJyiAZDWEI5/3A2rat0V2SJyEBwrGl2xyZNKF
         2AQ25k33oxvL3TFvSICIudQyqijtEZF8idFpha/hm1evPpx1trEiP4zATKFjHgl+gb6k
         +t2srgZQzEQoJYDJUbWMaJzCu/gnSnUITyIrcWco9+12/73XIuDnnC85h8BIySjgQa64
         DBz+/cHL5jR53aNTJRx5PesluPvA2ysBOV7ycNzIrm813QEUHpZU4pUCidsTrQmnUMC8
         c/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794391975; x=1794996775;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n3v1AgR+CHCMi0QrlArcix8UUVt6MgDpIHZcAPaGD/I=;
        b=boRNKg+3d7nu8XwP26gdsJySNxkrUNLv6rQT3egsCRkuUQO4IuYw4HbMwh84/m/Ga3
         i3hMP/qHiBiWmbkzE2LYzpDFoKaoAp2ptaqCvZu0cGH1VwbpMso29xyEAnGmRmkO97jM
         d3KWVsjz6l5vVcIr9C3t29FUEMtvC8txKWOa96yhPRqVrCx2ZXXhNtzd/d+6xx2Cud6K
         ZGH0Tm0jUD5SCC9juKDy8a7undDLTnsCjL/GxKn1xwgB7ngd/x7dsuQTtfUVCHQeC30t
         880SHv/o799v37ARHCA/LqZc/F5gIaOTUYl/cxxUo6YwtkThfLopzrfuRd7WlwCv5vHL
         M5RA==
X-Forwarded-Encrypted: i=1; AL+hErHv3A9AfefT4DpF5GsiDFC290FD/rYRO2ARY5F7sWRX1oWP++z7H6VUZy7/cL/lcVu22/9mEuCNUJuwb7cC2kkc@lists.infradead.org
X-Gm-Message-State: APuU4Z8h2iKGMm+iWp3aI2/hjlwCk9OX9TW/peGnMm0M6gHgYbGxmxmk
	qGjSBsBlCMmexXQggzeNIBUp6qqJ6+r5VVIcOyZr3RelHaenyWpKBas8G8qZcdM8bCs=
X-Gm-Gg: AYBFou1xf6Y7Z9F/+WtMurqkVz4OWti6THPvJCr6diMVTLz05JXbYMNNrDc8/Pwi+Dq
	kh2GlRso3wcFnplnZedczsmRzwRCvmfzYuiOYvpUN+fBXedxS9Bl8lKClFuiI4wT0cRh83iN4zT
	BvIIeN8clshJ7dcY+r35MD5YGAE5L2oJkGSFzaOoPN6gkkJBbiBVNdLvNHrCOtNLLGLR/y5xHhi
	6epUWBsVnKwhCeSkyOltRLB2AkVYOCaluXrU8wWa1TjlMyy66++WQYxsJwD7gk6EFdcFfOznoKE
	SMblYes6yhBqkA9LcLhqRDMHxxpFP+eWAEnWdxjZsuy4SIamTjoZcNiGE+PPawY51dHKyBBtaVZ
	FTRVaDBsl4nb1WJRL9KM9XWBXgxp9yE0O5el9PbK8XGU8/ytKzy0B2+vzLv8zKTdc/tbHIPUqm1
	tJ2rAuQdAgJbWatFoIhBc1bO4y3P8UzdOKi3qQfUAoSoinJ9NjAZENCfDrKlFi6S/iCfxEF3T6B
	AR7dah+UUSbfyMrNAaqJTBQfm3l2N8cQYgV38Lj8wq/tXKiQLnqgvDyGieBj5WhXf3K9lc60/TG
	CEFJnL1phMP9AW6U81AdDa7V1tQY
X-Received: by 2002:a05:600c:1c0c:b0:4a2:1655:87db with SMTP id 5b1f17b1804b1-4ba091a5bcbmr39187675e9.0.1794391974882;
        Wed, 11 Nov 2026 02:12:54 -0800 (PST)
Received: from [127.0.1.1] ([151.61.248.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fea745sm124194375e9.10.2026.11.11.02.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:12:54 -0800 (PST)
From: Valerio Setti <vsetti@baylibre.com>
Date: Wed, 11 Nov 2026 11:12:48 +0100
Subject: [PATCH v2 1/2] ASoC: meson: gx-formatter: change stream lock from
 mutex to spinlock
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-gx-formatter-use-spinlock-v2-1-763241aeca52@baylibre.com>
References: <20261111-gx-formatter-use-spinlock-v2-0-763241aeca52@baylibre.com>
In-Reply-To: <20261111-gx-formatter-use-spinlock-v2-0-763241aeca52@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6296; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=AM5clnX3PNR8b5jWnSWhqcd+0TC3ywf0Ls6D1xVD6fs=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlf7JeIHVcOnz7ZzPIyH2f50x0x+8PPf/DoePR8k9ufw
 zLV7aJ8HaUsDGJcDLJiiiws0+/9LihVe2iccLIAZg4rE8gQBi5OAZiIUTDD/1reef7JW5+1Bdr9
 i7g0jZvR+o6h2ivt1hsPzj076tSo+pThr2jr82DTQ63bXtSc8syJ1tBtc+AzO5/8lIvLXs8pYI4
 iIwA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_021257_003993_A72919DB 
X-CRM114-Status: GOOD (  21.41  )
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

Currently a mutex is being used in 'struct gx_stream' to serialize
access to structure data. This was inherited from the AXG design. An
important difference though is that in axg-card dai_links are nonatomic
so callback functions like 'trigger' are allowed to sleep. In GX instead
dai_links are atomic.

For example, starting playback from userspace with
'CONFIG_DEBUG_ATOMIC_SLEEP=y' results in a warning message like:

[ ] BUG: sleeping function called from invalid context at kernel/locking/mutex.c:316
[ ] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 272, name: speaker-test
[ ] preempt_count: 1, expected: 0

due to the following call stack:

snd_pcm_do_start (called with spinlock taken)
  dpcm_fe_dai_trigger
    dpcm_fe_dai_do_trigger
      dpcm_dai_trigger_fe_be
        dpcm_be_dai_trigger
          soc_pcm_trigger
            snd_soc_pcm_dai_trigger
              soc_dai_trigger
                aiu_encoder_i2s_trigger
                  gx_stream_start (takes 'ts->lock')

Fix this by changing the lock type from mutex to spinlock. This is safe
on GX platform because all formatters' functions only perform MMIO regmap
calls that do not sleep.

'spin_lock_irqsave' is used in 'gx_stream_start'/'gx_stream_stop' because
trigger runs with IRQs already disabled and stop can also run in IRQ
context (e.g. in case of XRUN while executing 'aiu_fifo_isr').
'spin_lock_irq' is instead used in 'gx_formatter_attach'/
'gx_formatter_detach' in order to prevent IRQs on the same CPU that might
end up calling 'gx_stream_stop' and therefore deadlock.

While at this also improve 'gx_formatter_detach()' by moving
'gx_formatter_disable()' under the spinlock guard. This makes it symmetric
to 'gx_formatter_attach()' and ensures that the prepare/enable/disable
formatter callbacks are called with spinlock held.

Fixes: a295be8d6210 ("ASoC: meson: gx: add gx-formatter and gx-interface")
Signed-off-by: Valerio Setti <vsetti@baylibre.com>

---

Changes in v2:
- Moved 'gx_formatter_disable()' under the spinlock guard in
  'gx_formatter_detach'. [Martin]
---
 sound/soc/meson/gx-formatter.c | 22 +++++++++++-----------
 sound/soc/meson/gx-formatter.h |  4 ++++
 sound/soc/meson/gx-interface.h |  3 ++-
 3 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/sound/soc/meson/gx-formatter.c b/sound/soc/meson/gx-formatter.c
index 2d3218cce426..d3bc0c6c81cd 100644
--- a/sound/soc/meson/gx-formatter.c
+++ b/sound/soc/meson/gx-formatter.c
@@ -61,7 +61,7 @@ static int gx_formatter_attach(struct gx_formatter *formatter)
 	struct gx_stream *ts = formatter->stream;
 	int ret = 0;
 
-	mutex_lock(&ts->lock);
+	spin_lock_irq(&ts->lock);
 
 	/* Catch up if the stream is already running when we attach */
 	if (ts->ready) {
@@ -74,7 +74,7 @@ static int gx_formatter_attach(struct gx_formatter *formatter)
 
 	list_add_tail(&formatter->list, &ts->formatter_list);
 out:
-	mutex_unlock(&ts->lock);
+	spin_unlock_irq(&ts->lock);
 	return ret;
 }
 
@@ -85,11 +85,10 @@ static void gx_formatter_detach(struct gx_formatter *formatter)
 	if (!ts)
 		return;
 
-	mutex_lock(&ts->lock);
+	spin_lock_irq(&ts->lock);
 	list_del(&formatter->list);
-	mutex_unlock(&ts->lock);
-
 	gx_formatter_disable(formatter);
+	spin_unlock_irq(&ts->lock);
 }
 
 static int gx_formatter_power_up(struct gx_formatter *formatter,
@@ -212,9 +211,10 @@ EXPORT_SYMBOL_GPL(gx_formatter_create);
 int gx_stream_start(struct gx_stream *ts)
 {
 	struct gx_formatter *formatter;
+	unsigned long irq_flags;
 	int ret = 0;
 
-	mutex_lock(&ts->lock);
+	spin_lock_irqsave(&ts->lock, irq_flags);
 
 	/* Start all the formatters attached to the stream */
 	list_for_each_entry(formatter, &ts->formatter_list, list) {
@@ -228,7 +228,7 @@ int gx_stream_start(struct gx_stream *ts)
 	ts->ready = true;
 
 out:
-	mutex_unlock(&ts->lock);
+	spin_unlock_irqrestore(&ts->lock, irq_flags);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(gx_stream_start);
@@ -236,8 +236,9 @@ EXPORT_SYMBOL_GPL(gx_stream_start);
 void gx_stream_stop(struct gx_stream *ts)
 {
 	struct gx_formatter *formatter;
+	unsigned long irq_flags;
 
-	mutex_lock(&ts->lock);
+	spin_lock_irqsave(&ts->lock, irq_flags);
 	ts->ready = false;
 
 	/* Stop all the formatters attached to the stream */
@@ -245,7 +246,7 @@ void gx_stream_stop(struct gx_stream *ts)
 		gx_formatter_disable(formatter);
 	}
 
-	mutex_unlock(&ts->lock);
+	spin_unlock_irqrestore(&ts->lock, irq_flags);
 }
 EXPORT_SYMBOL_GPL(gx_stream_stop);
 
@@ -256,7 +257,7 @@ struct gx_stream *gx_stream_alloc(struct gx_iface *iface)
 	ts = kzalloc_obj(*ts);
 	if (ts) {
 		INIT_LIST_HEAD(&ts->formatter_list);
-		mutex_init(&ts->lock);
+		spin_lock_init(&ts->lock);
 		ts->iface = iface;
 	}
 
@@ -272,7 +273,6 @@ void gx_stream_free(struct gx_stream *ts)
 	 * are removing the TDM DAI. It should not be possible
 	 */
 	WARN_ON(!list_empty(&ts->formatter_list));
-	mutex_destroy(&ts->lock);
 	kfree(ts);
 }
 EXPORT_SYMBOL_GPL(gx_stream_free);
diff --git a/sound/soc/meson/gx-formatter.h b/sound/soc/meson/gx-formatter.h
index b90b1814d79b..9f5a1720481e 100644
--- a/sound/soc/meson/gx-formatter.h
+++ b/sound/soc/meson/gx-formatter.h
@@ -20,6 +20,10 @@ struct gx_formatter_hw {
 
 struct gx_formatter_ops {
 	struct gx_stream *(*get_stream)(struct snd_soc_dapm_widget *w);
+	/*
+	 * Following functions are called with gx_stream->lock held and local
+	 * IRQs disabled so they must not sleep.
+	 */
 	void (*enable)(struct regmap *map);
 	void (*disable)(struct regmap *map);
 	int (*prepare)(struct regmap *map,
diff --git a/sound/soc/meson/gx-interface.h b/sound/soc/meson/gx-interface.h
index 2a6207e393e8..a6a5cc9e7af0 100644
--- a/sound/soc/meson/gx-interface.h
+++ b/sound/soc/meson/gx-interface.h
@@ -9,6 +9,7 @@
 
 #include <linux/clk.h>
 #include <linux/regmap.h>
+#include <linux/spinlock.h>
 #include <sound/pcm.h>
 #include <sound/soc.h>
 #include <sound/soc-dai.h>
@@ -24,7 +25,7 @@ struct gx_iface {
 struct gx_stream {
 	struct gx_iface *iface;
 	struct list_head formatter_list;
-	struct mutex lock;
+	spinlock_t lock;
 	unsigned int channels;
 	unsigned int width;
 	unsigned int physical_width;

-- 
2.47.3



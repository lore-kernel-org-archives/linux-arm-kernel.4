Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0263606A8A1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 13:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sCT90KMw;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=LJFyvvAe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=OBZlMLfPsVQIpOJpXajuH7DlrD4e9+7gm2lISPcBfUk=; b=sCT90KMwut71rT8xZRpUfXe0Nx
	g0UTP4bffw+kb9bTfJDSNmA8C2yc7zLThpI7cMAFohqe/7vG76PTyWkbkreUZ/aZPe6Sms0gUiA5O
	O7QdyoZxt1/6mZuj7r4iKZm1B8o0+euFVszXdkOzvK3WwReuAR7w5SBNF1o/Fz27JFvXngyHsUhEC
	4OuaW26WAQWO455Dwy/mEYuToswo8Mh2wU4zMJHz84DdinHhUlppC3k+9jgncbF2Zfqe59FyA/1+w
	zatynlEVCbfs1ilxmcUviRPh4NQ6vIRhi18XAkMe9rsZfIGRxgoY4jwKVhX7WuIo6rDxpW8i/lfx3
	YGpbcQHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrlq-0000000D3RG-3PD1;
	Fri, 13 Nov 2026 13:56:50 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrll-0000000D3O3-20lZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 13:56:47 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so1156126f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 05:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794578203; x=1795183003; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OBZlMLfPsVQIpOJpXajuH7DlrD4e9+7gm2lISPcBfUk=;
        b=LJFyvvAeiUM+JhD0l2CtpMPiW20WmTqe6GXdw7ur8Nl8QE3TbK2ebLXA9TcJUU0qAn
         Hmg7EHyTgJoIAoguyEeFQV7cyog8qKQHGqVF2N2yz9YUv1RO82mZKyfsVzK5ViQtSMrw
         SKGk8vz5Rgm7mDZgae5aWDrYYY7N3g128PxWtHJjHZhkQ4ro/FEFlUkhvWVwLCWmT5gM
         1grPpVBzdf4BVW8Kmp930svgta7xpN8+VpkqBBQjjjRu+hkIuDao+Na0+k2XBG6HKRjI
         4rzn4sDCGviHAE4Dw3EemkmATgef+2snVglGV4HJrMkeZ736JN4v1yOqu9ZwMHLeDv4+
         ydKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794578203; x=1795183003;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OBZlMLfPsVQIpOJpXajuH7DlrD4e9+7gm2lISPcBfUk=;
        b=SzMx+bRWeEESWxrLwW3JTHxfRbUMZ6BXkovh/v2iYxuD99a4p6j+FDejeWZDX8vTXI
         vahUlqCdarRM8o/CqWMw1iUaFeCgrrt4qUopODCWlreWu0we8jYLxy/q2IbpOEyjP9s7
         TyDD2ohSNYHS2GTKoXRYUaGJS2uvHe4eTVEyTAcGeUcKgRta3ZGt07qSMW0oekyumi0L
         nwIYNw/RgV0IVkg6iIQXQze0xtWvVl+8ybl0OxTPTqe9HP3j8vjkLP9t5l9gKdPWYjGd
         nJk3TbUcrUjttk9pOHwcJcKSmiFcQ9xz8UQuzaTgfW47qjGsP8HEdvLY/c7ATofo60BD
         AVXA==
X-Forwarded-Encrypted: i=1; AL+hErHQcJTiSFLSnvuBbfMV8Q2zGvrwwBg9XhLPZr6x3HEKAT3Cj5dx76I2i2kbIwzRvE7o6KgaefS82suIlJm+iK/J@lists.infradead.org
X-Gm-Message-State: APuU4Z8eftPfq92E3UvUmPEmzRVziGI7LgFFDT/Zg08uG+z5q3pNnJqL
	ErDFDCn1x+eamKuL5QtD/qoF71Qa4O2H7OaL0IhjT9SVR9izMxs9q5TxqoPEUFNeRzA=
X-Gm-Gg: AYBFou3TAJHqAWuebky/N2jppW1INCLSAyHc2MQtWh2htIuY/PAdwr6uZqPpP7pJ+vB
	ROG6CbapkpG+R3t8r7dNbQqQcBWQr2Tl4IR9BbzyidfgIlYroRRAAguqZiR/BZ0WGq42xH4uV+o
	sIPAla7557oK+NB0z0OOfRcKGMICkeDQ9uXie+47N5fYJJ5mRkE6jdvegDRg4LDoPM6VK4YpMCq
	+VVqLehwe8XHOKVHOrh0x629hT6S/5llKlesvXrkf9ORbDOqnWtlYKI6nm5C4SFoMRtAK9HNMsb
	F0HXPsHsiDoLJN2i5o1NrL8z1x4JRJtEc/b3QvSV2lKjJGYU0hQAgaPzCYw11Mb1RF9A0I3CZ9H
	IrI4E61yaElypOiIZolurEujKbCpfM8CdHYrdVLIKtNx7pl2RPY8/vioXA2tc0G870N5l/uvJQn
	z2s83iZADfQg3QF9fITN/exlTOg4IBBiAjlPWnb46eoQVpkxWcVEC9JobgHWGMdYtS1AUj0MrX6
	B/xU2SlcCPx3xmgXpOKVr4ct6sgYUnxIE/E8F8MdVkLdg4VGQT9Ii+3fzy1dtldQFL5Wr7fgMpl
	P2QrGLsUB+lm
X-Received: by 2002:a05:6000:2c04:b0:48e:3b53:e100 with SMTP id ffacd0b85a97d-49c73164e37mr5793896f8f.56.1794578203223;
        Fri, 13 Nov 2026 05:56:43 -0800 (PST)
Received: from [127.0.1.1] ([151.61.248.197])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c608d10b2sm8233202f8f.44.2026.11.13.05.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 05:56:42 -0800 (PST)
From: Valerio Setti <vsetti@baylibre.com>
Date: Fri, 13 Nov 2026 14:56:34 +0100
Subject: [PATCH v2] ASoC: meson: aiu-fifo: prevent sleeping when spinlock
 is held
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-aiu-fifo-fix-sleep-on-spinlock-v2-1-f72015c933bf@baylibre.com>
X-B4-Tracking: v=1; b=H4sIABEX92oC/42OQQqDMBBFryJZd4oRsbWr3kNcJONYp7WJZFQq4
 t0b7QU6iw8PHv/PqoQCk6hbsqpAMwt7FyE7JQo74x4E3ERWWZoVOh4YnqDl1sf4gPREA3gHMrD
 rPb4gJSS8NkVuSqtiyRAoisdAVf9YJvskHPfW3ehYRh+W44NZ797fY7MGDQ2WRHmqzQXbuzVLz
 zbQGf1b1du2fQEYrvXP4QAAAA==
X-Change-ID: 20261111-aiu-fifo-fix-sleep-on-spinlock-0ecec8d64a9b
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Christian Hewitt <christianshewitt@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8520; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=1fTo+4uyzOmAFYCXX+UpHdSokP50b/OzdEc4+14QE3g=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFnfxcWni/3fFB9qK6qqP5GFWSD57ZtNzeVSj3Jctm7Z+
 HXF41jJjlIWBjEuBlkxRRaW6fd+F5SqPTROOFkAM4eVCWQIAxenAExkrx8jw9XD8btX35RcsIjj
 wlFj+btzlsZ8aH3vJRZ89LjY5zD9jXKMDO+urbGo4BPd/mbbo49PJRUetDQ7/eWwWG2udfKiwIr
 UE+wA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_055645_600284_33F32428 
X-CRM114-Status: GOOD (  20.52  )
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

dai_links in the gx-card are atomic which means that the DAI trigger
callback is called with the spinlock held. This means that usage of
potentially sleeping functions (e.g. mutexes) is not allowed here.

'snd_soc_component_write'/'snd_soc_component_read' take the component's
io_mutex on entry.

Replace usage of these functions in:
- 'aiu_fifo_i2s_trigger'
- 'fifo_spdif_trigger'
- 'aiu_fifo_pointer'

This is meant to resolve the following runtime bug found while starting I2S
playback on an OdroidC2 device where the kernel was built enabling
CONFIG_DEBUG_ATOMIC_SLEEP and CONFIG_PROVE_LOCKING:

  Playback device is hw:0,0
  Stream parameters are 44100Hz, S16_LE, 2 channels
  Sine wave rate is 1000.0000Hz
  Rate set to 44100Hz (requested 44100Hz)
  Buffer size range from 128 to 262144
  Period size range from 64 [   21.012074] BUG: sleeping function called from invalid context at kernel/locking/mutex.c:623
  [   21.018009] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 267, name: speaker-test
  [   21.026184] preempt_count: 1, expected: 0
  [   21.030151] RCU nest depth: 0, expected: 0
  [   21.034205] locks held by speaker-test/267: 1, last CPU#3:
  [   21.039638]  #0: ffff000003dbd910 (&group->lock#2){....}-{3:3}, at: snd_pcm_stream_lock_irq+0x40/0x60
  [   21.048782] irq event stamp: 5274
  [   21.052059] hardirqs last  enabled at (5273): [<ffff800081494240>] _raw_spin_unlock_irq+0x38/0x80
  [   21.060856] hardirqs last disabled at (5274): [<ffff8000814935c8>] _raw_spin_lock_irq+0x80/0x90
  [   21.069481] softirqs last  enabled at (5238): [<ffff8000800f9aec>] handle_softirqs+0x584/0x5e0
  [   21.078020] softirqs last disabled at (5231): [<ffff800080010324>] __do_softirq+0x1c/0x28
  [   21.086133] CPU: 3 UID: 0 PID: 267 Comm: speaker-test Not tainted 7.3.0 #2 PREEMPT
  [   21.086141] Hardware name: Hardkernel ODROID-C2 (DT)
  [   21.086145] Call trace:
  [   21.086149]  show_stack+0x20/0x40 (C)
  [   21.086160]  dump_stack_lvl+0x6c/0x98
  [   21.086171]  dump_stack+0x18/0x24
  [   21.086179]  __might_resched+0x160/0x230
  [   21.086189]  __might_sleep+0x50/0x90
  [   21.086197]  __mutex_lock+0x64/0x8a0
  [   21.086206]  mutex_lock_nested+0x2c/0x40
  [   21.086215]  snd_soc_component_write+0x38/0x80
  [   21.086227]  aiu_fifo_i2s_trigger+0x74/0x90
  [   21.086237]  soc_dai_trigger.part.0+0x44/0x90
  [   21.086246]  snd_soc_pcm_dai_trigger+0x174/0x280
  [   21.086255]  soc_pcm_trigger+0xe4/0x1f0
  [   21.086265]  dpcm_dai_trigger_fe_be+0x30/0xb0
  [   21.086276]  dpcm_fe_dai_do_trigger+0x11c/0x1a0
  [   21.086287]  dpcm_fe_dai_trigger+0x40/0x60
  [   21.086296]  snd_pcm_do_start+0x4c/0x80
  [   21.086307]  snd_pcm_action_single+0x50/0xc0
  [   21.086316]  snd_pcm_action+0x88/0xb0
  [   21.086325]  snd_pcm_start+0x2c/0x40
  [   21.086335]  __snd_pcm_lib_xfer+0x660/0x810
  [   21.086345]  snd_pcm_common_ioctl+0xa20/0x17e0
  [   21.086356]  snd_pcm_ioctl+0x3c/0x60
  [   21.086366]  __arm64_sys_ioctl+0xac/0x110
  [   21.086376]  invoke_syscall+0x5c/0x120
  [   21.086386]  el0_svc_common.constprop.0+0x48/0xf0
  [   21.086395]  do_el0_svc+0x24/0x40
  [   21.086404]  el0_svc+0x54/0x3b0
  [   21.086414]  el0t_64_sync_handler+0xa0/0xf0
  [   21.086424]  el0t_64_sync+0x198/0x1a0

Note: the return value of 'regmap_read' in 'aiu_fifo_pointer' is
intentionally ignored. Regmap is MMIO here and read failures shouldn't
happen. Also 'axg-fifo.c' is doing the same in its 'axg_fifo_pcm_pointer'.

Fixes: e8712315c44d ("ASoC: soc-component: use io_mutex correctly")
Fixes: 6b59c53c8adc ("ASoC: meson: aiu: fifo-spdif: soft reset the S/PDIF datapath on start/stop")
Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
I found this issue while working on [1].
This patch is independent of [1] and they can go in in any order. They
are fixing the same problem in different modules.

[1]: https://lore.kernel.org/all/20261021-gx-formatter-use-spinlock-v1-1-71ebc9224c03@baylibre.com/
---
Changes in v2:
- Removed handling of 'regmap_read' failures in 'aiu_fifo_pointer'. Since
  ragmap is MMIO here, read failures cannot happen. [Martin]
- Link to v1: https://patch.msgid.link/20261111-aiu-fifo-fix-sleep-on-spinlock-v1-1-dc9ee401a7cf@baylibre.com

To: Jerome Brunet <jbrunet@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: linux-sound@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 sound/soc/meson/aiu-fifo-i2s.c   | 15 ++++++++++++---
 sound/soc/meson/aiu-fifo-spdif.c | 14 ++++++++++----
 sound/soc/meson/aiu-fifo.c       |  3 ++-
 3 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/sound/soc/meson/aiu-fifo-i2s.c b/sound/soc/meson/aiu-fifo-i2s.c
index eccbc16b293ad..8f785241585df 100644
--- a/sound/soc/meson/aiu-fifo-i2s.c
+++ b/sound/soc/meson/aiu-fifo-i2s.c
@@ -5,6 +5,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/clk.h>
+#include <linux/regmap.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <sound/soc-dai.h>
@@ -48,14 +49,22 @@ static int aiu_fifo_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 				struct snd_soc_dai *dai)
 {
 	struct snd_soc_component *component = dai->component;
+	unsigned int val;
+	int ret;
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		snd_soc_component_write(component, AIU_RST_SOFT,
-					AIU_RST_SOFT_I2S_FAST);
-		snd_soc_component_read(component, AIU_I2S_SYNC);
+		ret = regmap_write(component->regmap, AIU_RST_SOFT, AIU_RST_SOFT_I2S_FAST);
+		if (ret < 0)
+			return snd_soc_ret(component->dev, ret,
+					   "Failed to write register on trigger");
+
+		ret = regmap_read(component->regmap, AIU_I2S_SYNC, &val);
+		if (ret < 0)
+			return snd_soc_ret(component->dev, ret,
+					   "Failed to read register on trigger");
 		break;
 	}
 
diff --git a/sound/soc/meson/aiu-fifo-spdif.c b/sound/soc/meson/aiu-fifo-spdif.c
index a9861c5d66374..297834bce1c7a 100644
--- a/sound/soc/meson/aiu-fifo-spdif.c
+++ b/sound/soc/meson/aiu-fifo-spdif.c
@@ -69,15 +69,21 @@ static int fifo_spdif_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		snd_soc_component_write(component, AIU_RST_SOFT,
-					AIU_RST_SOFT_958_FAST);
+		ret = regmap_write(component->regmap, AIU_RST_SOFT, AIU_RST_SOFT_958_FAST);
+		if (ret < 0)
+			return snd_soc_ret(component->dev, ret,
+					   "Failed to write register on trigger");
+
 		fifo_spdif_dcu_enable(component, true);
 		break;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 	case SNDRV_PCM_TRIGGER_STOP:
-		snd_soc_component_write(component, AIU_RST_SOFT,
-					AIU_RST_SOFT_958_FAST);
+		ret = regmap_write(component->regmap, AIU_RST_SOFT, AIU_RST_SOFT_958_FAST);
+		if (ret < 0)
+			return snd_soc_ret(component->dev, ret,
+					   "Failed to write register on trigger");
+
 		fifo_spdif_dcu_enable(component, false);
 		break;
 	default:
diff --git a/sound/soc/meson/aiu-fifo.c b/sound/soc/meson/aiu-fifo.c
index 8b54f9681d00c..edb47095c059d 100644
--- a/sound/soc/meson/aiu-fifo.c
+++ b/sound/soc/meson/aiu-fifo.c
@@ -5,6 +5,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/clk.h>
+#include <linux/regmap.h>
 #include <linux/dma-mapping.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
@@ -38,7 +39,7 @@ snd_pcm_uframes_t aiu_fifo_pointer(struct snd_soc_component *component,
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	unsigned int addr;
 
-	addr = snd_soc_component_read(component, fifo->mem_offset + AIU_MEM_RD);
+	regmap_read(component->regmap, fifo->mem_offset + AIU_MEM_RD, &addr);
 
 	return bytes_to_frames(runtime, addr - (unsigned int)runtime->dma_addr);
 }

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261111-aiu-fifo-fix-sleep-on-spinlock-0ecec8d64a9b

Best regards,
--  
Valerio Setti <vsetti@baylibre.com>



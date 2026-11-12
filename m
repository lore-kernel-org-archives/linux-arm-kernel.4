Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B448C606AE55
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 06:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zppoK6e+;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XMuxIRs2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=b9b3tYu+beF9g/ZwB2Rnwljh+myz1+aTj2HUWSMtgl8=; b=zppoK6e+Zch087
	O3XypLS/X892jJhjqs4+2xIxJNuWjirjs7phS/XD/e173i2YV7nrLxhR0wBeXewXEjpxzxGI3grdC
	Z01MMXI9O0Sn4YheRz6N2Ipkil3pntOwaERErVYB+5nWod5/IYB5XeQYsKugWQQuYoJA/YvrLzmTQ
	tlfDcNdjLGYE42Fe030z1XfIk8OgjotvKyYzSKDmFAMANrXU2zNp8HoZAS1hX8F2/9Ln5e7LXQeDn
	3qxb7EbouQMb6UBOQJNLfq8xx5P2bIuaxZ4z/w1xF+UCMURQ9xB2bPwOa/oaevEgJ1yWcBP0SvnzT
	hZfyEuxx0hW9+Xnf/2hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xROde-00000008qv9-35Lg;
	Thu, 12 Nov 2026 06:50:27 +0000
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xROdM-00000008qmr-2X56
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 06:50:10 +0000
Received: by mail-dy1-x132f.google.com with SMTP id 5a478bee46e88-33fb4680717so4750305eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 22:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794466208; x=1795071008; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b9b3tYu+beF9g/ZwB2Rnwljh+myz1+aTj2HUWSMtgl8=;
        b=XMuxIRs2cJXzZdumeQO0CY6ypMLhIVLoBwVLjG53pKWrrJzgkbWtDkT3d1jWAoqWuP
         zChRhUmkfBaMuw6D5f7uWjLbN3hkjP1z09bEUfdGsFSaf1w0nUK7Pmtx2Yezs9zoRFTX
         l6N6RZPNSVQX/kyCtrnqz6hkraze2CDHcV0XvjX2eNs6uqg0Y/QpUW+2p3D76VqWIgsG
         KS9rI1VLqbMoK6FtU6tRUqdpkdQ33sb7m9bVQmzIm/6QDn7S9MyAT38JeSe2I06bFElc
         Ol7VvyMes3HTY8ImJ9lLNdrb/Y79uP8svEhq0MS80J0S63x9vSt9jGfNbY8kVJcMzFvk
         sY/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466208; x=1795071008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b9b3tYu+beF9g/ZwB2Rnwljh+myz1+aTj2HUWSMtgl8=;
        b=JdWdrB0a1mecZquK/PKN2d3v4YRRDuwXzEH//YdckPrgiP3/xI+fcRghLIi0+wqAEy
         IstzjzJiAkDr963sZ89KaMgHM191P0ACbQnY1b+zzrbj0S6dg0vKt7J7aZug2U6kkLB2
         mz4k2QyicwK8pVBE+vv5tOnm4wvyDVJOLdAzoVX0KNykgtYwg+lyDqK930QOswAVC5Ge
         zanNzrhvrxoREh+pyT4BgYp9SofsigI8cl5hIB+SY159Ud40zp+VB91jiBoK2K79mM0b
         WmRarQk93cKMxm9uIVBjhqfZ1nFgBb6URp2JgqPiu83gl8J5qR0MkZA7u33KJPbP9V0w
         YYjQ==
X-Forwarded-Encrypted: i=1; AL+hErHjDXahlhoHtL2Pxn4RfZBbhKLFspOC5FjJ3nqU5LIGqwilSEO6fnT9z1VWXf9aB2trdmhAqZY2GyEF/2MXbg6n@lists.infradead.org
X-Gm-Message-State: APuU4Z9C0Sb6Dlsv3Ko5U/aXhGYiiPSIKaee4wwrb8C2WfbjH99MRBDR
	6la1IZ+blKbdD0u2C3q3YxXuf+lwxXtTACD0RLi11naICSeADq+FNa2K
X-Gm-Gg: AYBFou1t630ivZ4HMyzEJBbGpLxzHW9gLAomUhD8nmBzNKxxzw6aJgzuRPv2nz0wsLo
	mJ+iyvib9Mz5/nBVsJZWbJkLhcLigUBovfGR8Y4IfUcLRB/VuO4Hitdbdb/X3DLQIycKy63iM6g
	bkewTdAJOy0hfntSyy6JtxFYMRLcd4PMKOpE6wZECnbm3GbS3cU4hDflJNlWNIM7885ZjyKDCbZ
	ivYRpawOFZxSxLMZkjJ6UcSWJLCzuhjaiwbahe9cx9F6q4Qkp/4w/Qat8tTiyY33QMk+pdMt0FG
	EV9nnOSsQN23D0HYoKal/7WYRz7Qb5Yxnxp0a/NpdK2stCmoNXttg7uTDHh4Lp7SZ4XSYgTmZyX
	5ein1wqf5SQq3qyq7zn6fkQAWSJBHwWLCv7wj8SQxm3u2sdnb85Vc81lNyiuI5w5Q3r8RIDCgr1
	m3a/eDDN3GupLkpFR2HhevQ1Ku0X7WH4YokeaMOZFdh+QhMBGVl1RZiU82JZNCq061AC3fgTgy1
	JJKAsqtsWUP3X2e5Kxu1p5T9qeSNPMKJRih6my7bxYHSPY5h4+N5lo5p5ONkRSOQZHHqHM9sCMw
	Fb/+T6RFnZQKacivqNwU917WSpgcVuGDD832ybK2jJOuw/2A6pk0w83n/X1GtZQNB64TliyjLvY
	vgb+w9kBgtJMwSi7y
X-Received: by 2002:a05:693c:68c7:b0:374:e25e:a533 with SMTP id 5a478bee46e88-376864688a8mr4910852eec.35.1794466207572;
        Wed, 11 Nov 2026 22:50:07 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:182d:659:ffce:39a4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfadsm27190961eec.19.2026.11.11.22.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:50:06 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Mark Brown <broonie@kernel.org>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	Kris Bahnsen <kris@embeddedTS.com>,
	Mark Featherston <mark@embeddedTS.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-input@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] Input: ads7846 - remove unneeded memory barriers
Date: Wed, 11 Nov 2026 22:49:55 -0800
Message-ID: <20261112064957.1796975-4-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
In-Reply-To: <20261112064957.1796975-1-dmitry.torokhov@gmail.com>
References: <20261112064957.1796975-1-dmitry.torokhov@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_225008_846578_C04F4B16 
X-CRM114-Status: GOOD (  12.20  )
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
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The driver invokes mb() after setting the stopped flag in ads7846_stop()
and ads7846_restart(). These mandatory barriers lack pairing barriers on
the reader side and are unnecessary.

The wait queue operations wake_up() and wait_event_timeout(), along
with disable_irq() and enable_irq(), already provide the required
synchronization and memory ordering when stopping and restarting the
device polling. Remove the redundant barriers.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/ads7846.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/input/touchscreen/ads7846.c b/drivers/input/touchscreen/ads7846.c
index f1827684c902..6352117cd898 100644
--- a/drivers/input/touchscreen/ads7846.c
+++ b/drivers/input/touchscreen/ads7846.c
@@ -235,7 +235,6 @@ static void ads7846_stop(struct ads7846 *ts)
 	if (!ts->disabled && !ts->suspended) {
 		/* Signal IRQ thread to stop polling and disable the handler. */
 		ts->stopped = true;
-		mb();
 		wake_up(&ts->wait);
 		disable_irq(ts->spi->irq);
 	}
@@ -251,7 +250,6 @@ static void ads7846_restart(struct ads7846 *ts)
 
 		/* Tell IRQ thread that it may poll the device. */
 		ts->stopped = false;
-		mb();
 		enable_irq(ts->spi->irq);
 	}
 }
-- 
2.56.0.567.gdb80ae8cd5-goog



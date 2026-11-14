Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D76606A323
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 12:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c89dQsR5;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=CWqfabZr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=OLGP0ChfuX8yScgxhPPrkadHoSBbKqMfDAL47LIarJY=; b=c89dQsR5dWqgNb2CDG/hHhxwEH
	XPatUkaecyblFODGQeX2m3MAz0ba2IUPsqRzIMcW4yUu04GtFc0Q1H3qqSPvM6z49T5g3r5MSoryf
	iuBuPcULsoYhZj7kYFxaOqDEyemig77cFNca/GmeZV7Lf2F6DdPb55g2ySy/s6J71LAzorRsIu+OS
	OBm2nVYPUDNRey+hMiUxOxPv06/UjjfiZgPRXmjTCuN6H/hM1hAPm6SHekpo9nkVqr0pWziPSYtvy
	kEOm5zF9C8uxK0ne4P0qRlaHWnbNCBnlfPrEBfL7GUA8pxAYCFDHjzwW4pTfLJnQaGGRnjbPWj/wx
	1BUekREw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSD4q-0000000G1CN-2tM9;
	Sat, 14 Nov 2026 12:41:52 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSD4n-0000000G1BM-1N5t
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 12:41:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=OL
	GP0ChfuX8yScgxhPPrkadHoSBbKqMfDAL47LIarJY=; b=CWqfabZrfom59vS2zV
	20EWZL36lxB/9Iwl3gXvf/iwudvLVvgCe70v3RzfGEiqvnVphLu2nPFfWXvYqzDn
	zn9ELRPCAVApBjCcF0WzkqPC8H435l+94rd8B365hrjHDaeIrMICWMm0abbjKbnB
	9fx4ALL//vnm32mcgFMNygQSk=
Received: from Virtual-Platform.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD31SLuVvhqAxhDHg--.250S2;
	Sat, 14 Nov 2026 20:41:19 +0800 (CST)
From: Chao Xu <xuchao066@163.com>
To: suzuki.poulose@arm.com,
	mike.leach@arm.com,
	james.clark@linaro.org,
	leo.yan@arm.com,
	alexander.shishkin@linux.intel.com
Cc: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chao Xu <xuchao066@163.com>
Subject: [PATCH v1] coresight: etm4x: Fix instruction event 0 enablement
Date: Sat, 14 Nov 2026 20:41:13 +0800
Message-ID: <20261114124114.5499-1-xuchao066@163.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD31SLuVvhqAxhDHg--.250S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tF1ktr47CF48Ww4rGr4Durg_yoW8AFWkpr
	4Fkw1Yyws5Gw4fZ3y2kr1UW3y8Gws2kayDWrn5Jw47WF17ZrWYgF1rKr4UtFs7XFW7CFyf
	Jw4xtrn0qFy0kaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRJxh9UUUUU=
X-CM-SenderInfo: x0xfxtbrqwlqqrwthudrp/xtbC5xCq8Gr4VvBVcQAA39
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_044149_881481_65EB9AE5 
X-CRM114-Status: GOOD (  10.38  )
X-Spam-Score: -1.8 (-)
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
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

According to section 7.3.30 of the Arm ETMv4 architecture specification,
TRCEVENTCTL1R.INSTEN[n] controls event n.

event_instren_store() uses TRCEVENTCTL1R_INSTEN_1 when TRCIDR0.NUMEVENT
is zero. For an ETM implementing only event 0, INSTEN[1] is RES0, so
writing event_instren cannot enable event 0 and no instruction Event
element is generated for it.

Use INSTEN[0] for the single-event case and update the comment accordingly.

Signed-off-by: Chao Xu <xuchao066@163.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-sysfs.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
index db9e603f97ba..420403dc711d 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
@@ -566,16 +566,16 @@ static ssize_t event_instren_store(struct device *dev,
 	sysfs_config->eventctrl1 &= ~TRCEVENTCTL1R_INSTEN_MASK;
 	switch (caps->nr_event) {
 	case 0x0:
-		/* generate Event element for event 1 */
-		sysfs_config->eventctrl1 |= val & TRCEVENTCTL1R_INSTEN_1;
+		/* generate Event element for event 0 */
+		sysfs_config->eventctrl1 |= val & TRCEVENTCTL1R_INSTEN_0;
 		break;
 	case 0x1:
-		/* generate Event element for event 1 and 2 */
+		/* generate Event element for event 0 and 1 */
 		sysfs_config->eventctrl1 |= val & (TRCEVENTCTL1R_INSTEN_0 |
 						   TRCEVENTCTL1R_INSTEN_1);
 		break;
 	case 0x2:
-		/* generate Event element for event 1, 2 and 3 */
+		/* generate Event element for event 0, 1 and 2 */
 		sysfs_config->eventctrl1 |= val & (TRCEVENTCTL1R_INSTEN_0 |
 					     TRCEVENTCTL1R_INSTEN_1 |
 					     TRCEVENTCTL1R_INSTEN_2);
-- 
2.43.0



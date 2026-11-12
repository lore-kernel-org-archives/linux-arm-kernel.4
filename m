Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39FD60A382D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 07:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ddb7F7Is;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=jZeEnbD7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ODFeblqJ2IvUuHopebwv4o1Sjw4sySz8nIqoDyGgRI4=; b=ddb7F7IsFhEutrL/0nJ1z8cJP3
	UdAbzi9b3tfFVFEMm3o5JYu3kbwbmIbujW3q3cKnUsTvS396qm0Ioqd630rH9XGN3Ufbx7zpqIPGv
	HDmDhNgGE9jXttKKJkQjbyeFyDvTAJM1p21rZmh5K9PHgJT8w7kj/c5nL67/4J/KIx2PEBdXbnjvK
	5HXb+/95UtCJ144sw5hKtngttbuh7qL2i9DyTJtDZ5WFghxaQQQJ+3BBK6t2oX1bUJQ2fs211rUfP
	BOvMhmv0gVSZOV2n+PlpnopmQcxrNwux0hcinZJHcv0qTZCujBBXxsrech4D1n3FQhSWTFFAy13dB
	PHHGoXrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRP3S-00000008tsS-21yo;
	Thu, 12 Nov 2026 07:17:06 +0000
Received: from cmccmta4.chinamobile.com ([111.22.67.137])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRP2p-00000008tar-46Gc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 07:16:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=jZeEnbD75BNbBCYAWjbWJE8pRuh/gnzKyUqEqRgdZyOYhmx7qBH7sngA8W7eoSEpn+lOI4wJAqidB
	 sJnwyL1N+ykzKy1ba2GJtSaf2Xkuob3RS/WLBrmDmeTlOz6XYCeDpNHsQRbb+lSaJ4jzRUghZSEMrP
	 HLO8bkDWPh75I+m8=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46af567bee33-7ee0b;
	Thu, 12 Nov 2026 15:16:17 +0800 (CST)
X-RM-TRANSID: 2ee46af567bee33-7ee0b
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee66af567c0bef-f6ee0;
	Thu, 12 Nov 2026 15:16:17 +0800 (CST)
X-RM-TRANSID: 2ee66af567c0bef-f6ee0
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: ukleinek@kernel.org
Cc: nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] pwm: atmel-tcb: Fix the channel restart write on resume
Date: Thu, 12 Nov 2026 15:16:15 +0800
Message-ID: <20261112071615.154385-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.51.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_231633_798590_5DB11A8C 
X-CRM114-Status: GOOD (  10.15  )
X-Spam-Score: -2.4 (--)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

atmel_tcb_pwm_resume() passes the start command as the register address
and the channel control register offset as the value. The command is
0x5, which is not an aligned register address, so regmap rejects the
write and an enabled PWM channel is not restarted after resume.

Pass the channel control register first and the clock-enable and
software-trigger bits second.

Fixes: 061f8572a31c ("pwm: atmel-tcb: Switch to new binding")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 drivers/pwm/pwm-atmel-tcb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pwm/pwm-atmel-tcb.c b/drivers/pwm/pwm-atmel-tcb.c
index f74a42d75b81..e878eaaf81cc 100644
--- a/drivers/pwm/pwm-atmel-tcb.c
+++ b/drivers/pwm/pwm-atmel-tcb.c
@@ -541,8 +541,8 @@ static int atmel_tcb_pwm_resume(struct device *dev)
 
 	if (chan->enabled)
 		regmap_write(tcbpwmc->regmap,
-			     ATMEL_TC_CLKEN | ATMEL_TC_SWTRG,
-			     ATMEL_TC_REG(channel, CCR));
+			     ATMEL_TC_REG(channel, CCR),
+			     ATMEL_TC_CLKEN | ATMEL_TC_SWTRG);
 
 	return 0;
 }
-- 
2.51.0





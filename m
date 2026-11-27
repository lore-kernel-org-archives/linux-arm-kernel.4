Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A3F606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 23:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L0U9PCmi;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k6Z4qrN1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=K02zgxdGQWTbk3ueckkKkjJyj/QzbSgab6J/PqtEmnQ=; b=L0U9PCmipzE56D
	l935g589NIP6CLnn9GHLjv0C4QSTdc60Jty2itMiinen9Wbrobecz8Cidy2qnKVTqCbN4OC/nO3zT
	Wowvhna69qc00WXMlaOBAdCjkY4/B/Ngr35qK6gMW+Kbrax2fzO/PyslMqALnICfcTQSdySOwmRau
	u9gF7T+K0XQhE7wpzSNRhXQTQyinEk4HV8g/qQCQnaR9fae64+M3xiWQeQLiXFQHky3OuAQ/r+pna
	/Ii9J9hQk8/UsET0LruQItRR1/rSa7n7ZUYA46/MMHD97E+x92jNqSVrt0P5aB5xht7z3a7deeFY5
	fbye5akDoycFQW2Sxa2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX5bX-00000000CnR-3wx3;
	Fri, 27 Nov 2026 23:43:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX5ab-00000000CLe-3K7v
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 23:42:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 88271454DD;
	Fri, 27 Nov 2026 23:42:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2ACD1F008A0;
	Fri, 27 Nov 2026 23:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795822969;
	bh=K02zgxdGQWTbk3ueckkKkjJyj/QzbSgab6J/PqtEmnQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=k6Z4qrN1vtbaB79gvwpyv7wdR2AimXzGWshElx4T5MJW7+314fCN21twB2NYbdAN0
	 kuTHSLwq8y7635ze6zOnW3lt1wwDWSqt/c8aF4BVj59ud2Lyo6uXvYW2woNhIbOHC+
	 Owy/n2OFBEjJjVg8GRJPtTvwySlbjFKTzTXuaMO2V9XR5uhVo/aE1Hx2O0u/tIzshX
	 iX+YNWriDlvbB5z1dk+ghQ1310uyDaUkuurYtsiJGktgW2MDjmiOd6m9VUzoGyTxOs
	 051NATv5H6syDmR4JBV/+d8IqlKNzzsQunMe+zJ9Rvympg4KYc50FfAMvDeJAw2e/R
	 mxY9g/XMvxgJQ==
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 28 Nov 2026 00:42:34 +0100
Subject: [PATCH 6/6] mfd: db8500-prcmu: Always submit an explicit APE OPP
 request
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261128-ux500-prcmu-clock-move-v1-6-77c49daad1d2@kernel.org>
References: <20261128-ux500-prcmu-clock-move-v1-0-77c49daad1d2@kernel.org>
In-Reply-To: <20261128-ux500-prcmu-clock-move-v1-0-77c49daad1d2@kernel.org>
To: Ulf Hansson <ulfh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>, 
 Lee Jones <lee@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 mfd@lists.linux.dev
X-Mailer: b4 0.16.0
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

Do not infer the hardware state from a cache of previous Linux
requests. With firmware starting in an unknown state, the old path
could report success for a 50% request without sending it.

Accept the two supported firmware levels and always check the
acknowledgment. The clock driver will decide when to request a
transition.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/mfd/db8500-prcmu.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/mfd/db8500-prcmu.c b/drivers/mfd/db8500-prcmu.c
index 98ab0dc3d145..080ab61d7a29 100644
--- a/drivers/mfd/db8500-prcmu.c
+++ b/drivers/mfd/db8500-prcmu.c
@@ -366,13 +366,11 @@ static struct {
  * mb1_transfer - state needed for mailbox 1 communication.
  * @lock:	The transaction lock.
  * @work:	The transaction completion structure.
- * @ape_opp:	The current APE OPP.
  * @ack:	Reply ("acknowledge") data.
  */
 static struct {
 	struct mutex lock;
 	struct completion work;
-	u8 ape_opp;
 	struct {
 		u8 header;
 		u8 arm_opp;
@@ -692,14 +690,11 @@ int db8500_prcmu_set_ape_opp(u8 opp)
 {
 	int r = 0;
 
-	if (opp == mb1_transfer.ape_opp)
-		return 0;
+	if (opp != APE_50_OPP && opp != APE_100_OPP)
+		return -EINVAL;
 
 	mutex_lock(&mb1_transfer.lock);
 
-	if ((opp != APE_100_OPP) && (mb1_transfer.ape_opp != APE_100_OPP))
-		goto skip_message;
-
 	while (readl(PRCM_MBOX_CPU_VAL) & MBOX_BIT(1))
 		cpu_relax();
 
@@ -714,10 +709,6 @@ int db8500_prcmu_set_ape_opp(u8 opp)
 		(mb1_transfer.ack.ape_opp != opp))
 		r = -EIO;
 
-skip_message:
-	if (!r)
-		mb1_transfer.ape_opp = opp;
-
 	mutex_unlock(&mb1_transfer.lock);
 
 	return r;
@@ -1760,7 +1751,6 @@ void __init db8500_prcmu_early_init(void)
 	init_completion(&mb0_transfer.ac_wake_work);
 	mutex_init(&mb1_transfer.lock);
 	init_completion(&mb1_transfer.work);
-	mb1_transfer.ape_opp = APE_NO_CHANGE;
 	mutex_init(&mb2_transfer.lock);
 	init_completion(&mb2_transfer.work);
 	spin_lock_init(&mb2_transfer.auto_pm_lock);

-- 
2.56.1



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEC3606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 11:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QBmmB0wa;
	dkim=pass (1024-bit key) header.d=mail.zgclab.edu.cn header.i=@mail.zgclab.edu.cn header.a=rsa-sha256 header.s=dkim header.b=g62POGcG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=KhH3/ntoyorUoRnbCabrr5P7SSAKGYQSV0N3Qci+I/k=; b=QBmmB0waBHkiZWEzONmaM6q1x2
	32lksQu3BCZ4Y4BfYk/UYOLunwG/REGCVXd8vsTbxhNtXxK4jj3oThIgHn5Uc+JgEpGrB69xMC7tG
	norGkgqp1DMOJa2Znc6gIUKgVOSlQWX9j2EUS2a45K7oX8tLY/tbXx5O7xFV3fVfY+wHEg3AdCJl+
	Xp4TfnEUFM9UzJCYSREjzR/ssDqfub6sQM3ySeEnYMx7bY8ZDh1nIUbhGdk7W6Do/N1oGBEE0F4mO
	kVuG7+CTwa2aE3ij+vBcWW4pikx7HTHpj7ZEiuLnYxIrt+8ab/9mgnXQMal+McSe+tlkP/QiddqZI
	xcz/nNQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV5rM-000000011m9-05aw;
	Sun, 22 Nov 2026 11:35:52 +0000
Received: from azure-sdnproxy.icoremail.net ([207.46.229.174])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV5rH-000000011l2-1KEO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 11:35:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.zgclab.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=KhH3/ntoyorUoRnbCabrr5P7SSAKGYQSV0N3Qci+I/k=; b=g62POGcGOfhGN
	Hf3KQvZxTxe1WhEuupyeUHzQ/reQBRdgqWayQ9Nz1mUT9EMsVgc8kFs7OFK6rMWp
	xYFdbTZ5h6nw7aq1eMFE9ZwXrybMeiwYRYsZoqLZdUc1rvv36fwUsMIvn6Da6Y+c
	lBGl0wy4Kg7jUQlqdxva1I8ib2gl90=
Received: from stmpe_v2_send.eml (unknown [58.206.202.11])
	by web1 (Coremail) with SMTP id yAQGZQDXRjeM0wJr_JCqAg--.53142S2;
	Sun, 22 Nov 2026 19:35:40 +0800 (CST)
From: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
To: Lee Jones <lee@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, mfd@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] mfd: stmpe: Disable regulators on probe failure
Date: Sun, 22 Nov 2026 19:35:30 +0800
Message-ID: <179534733065.15652.3659794654405986240@mail.zgclab.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: yAQGZQDXRjeM0wJr_JCqAg--.53142S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGw1rGF1kGFyDZr47Zw4kCrg_yoW5Ww1kpF
	WDXFyFkr4UWFW09r4DAr47Xrn3WrW8trWxGrykW343Xr1jvF9FqFykCr1Yv3Z5Xrn7JanI
	yF9rXr18uF17XFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Fb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x2
	0xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18Mc
	Ij6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7Cj
	xVAaw2AFwI0_JF0_Jw1lc2xSY4AK67AK6r4kMxAIw28IcxkI7VAKI48JMxC20s026xCaFV
	Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWl
	x4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r
	1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_
	JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
	sGvfC2KfnxnUUI43ZEXa7IU5GztUUUUUU==
X-CM-SenderInfo: pzdqwxbusqjlo62juzldeovvfxof0/1tbiAQYTD2sCG5iHcQAAsH
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_033548_420927_03661A2E 
X-CRM114-Status: GOOD (  11.76  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The VCC and VIO supplies are enabled in stmpe_probe() but were never
disabled if probing failed later, leaking the enabled regulators.

Register a devm action to disable the supplies, and track whether each
supply was enabled in dedicated flags instead of consulting
regulator_is_enabled(), which reports the hardware state rather than
whether this consumer enabled it.  Drop the manual regulator_disable()
calls from stmpe_remove() so the supplies are disabled exactly once via
the devres action.

Fixes: 9c9e321455fb ("mfd: stmpe: add optional regulators")
Signed-off-by: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
---
 drivers/mfd/stmpe.c       | 24 +++++++++++++++++++-----
 include/linux/mfd/stmpe.h |  2 ++
 2 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/stmpe.c b/drivers/mfd/stmpe.c
index fd51ba74275c..fb30b8a4fbac 100644
--- a/drivers/mfd/stmpe.c
+++ b/drivers/mfd/stmpe.c
@@ -1362,6 +1362,16 @@ static void stmpe_of_probe(struct stmpe_platform_data *pdata,
 	}
 }
 
+static void stmpe_disable_regulators(void *data)
+{
+	struct stmpe *stmpe = data;
+
+	if (stmpe->vio_enabled)
+		regulator_disable(stmpe->vio);
+	if (stmpe->vcc_enabled)
+		regulator_disable(stmpe->vcc);
+}
+
 /* Called from client specific probe routines */
 int stmpe_probe(struct stmpe_client_info *ci, enum stmpe_partnum partnum)
 {
@@ -1410,13 +1420,22 @@ int stmpe_probe(struct stmpe_client_info *ci, enum stmpe_partnum partnum)
 		ret = regulator_enable(stmpe->vcc);
 		if (ret)
 			dev_warn(ci->dev, "failed to enable VCC supply\n");
+		else
+			stmpe->vcc_enabled = true;
 	}
 	stmpe->vio = devm_regulator_get_optional(ci->dev, "vio");
 	if (!IS_ERR(stmpe->vio)) {
 		ret = regulator_enable(stmpe->vio);
 		if (ret)
 			dev_warn(ci->dev, "failed to enable VIO supply\n");
+		else
+			stmpe->vio_enabled = true;
 	}
+
+	ret = devm_add_action_or_reset(ci->dev, stmpe_disable_regulators, stmpe);
+	if (ret)
+		return ret;
+
 	dev_set_drvdata(stmpe->dev, stmpe);
 
 	if (ci->init)
@@ -1489,11 +1508,6 @@ void stmpe_remove(struct stmpe *stmpe)
 	if (stmpe->domain)
 		irq_domain_remove(stmpe->domain);
 
-	if (!IS_ERR(stmpe->vio) && regulator_is_enabled(stmpe->vio))
-		regulator_disable(stmpe->vio);
-	if (!IS_ERR(stmpe->vcc) && regulator_is_enabled(stmpe->vcc))
-		regulator_disable(stmpe->vcc);
-
 	__stmpe_disable(stmpe, STMPE_BLOCK_ADC);
 
 	mfd_remove_devices(stmpe->dev);
diff --git a/include/linux/mfd/stmpe.h b/include/linux/mfd/stmpe.h
index 87e29d561e22..eec5fc795014 100644
--- a/include/linux/mfd/stmpe.h
+++ b/include/linux/mfd/stmpe.h
@@ -122,6 +122,8 @@ struct stmpe_platform_data;
 struct stmpe {
 	struct regulator *vcc;
 	struct regulator *vio;
+	bool vcc_enabled;
+	bool vio_enabled;
 	struct mutex lock;
 	struct mutex irq_lock;
 	struct device *dev;



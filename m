Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82E3606A338
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 11:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Gb/v7EoP;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=pBLaNbHq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eXwNm4f1iSOp1uIbGh1LM/4A3sttFi1BOEQD0XNPkUE=; b=Gb/v7EoPGwAZx/
	cNa5VhScCdZUB4g43vHc2XjMO/D53Ihgj2IsWbQ+TPDYpNlMc8sjPnAkRukS/Jj/gBjxRZraTrgv1
	kwzutlqajWWFyS4na2KB7AWOBOur3dGDVd3WA9SjA6tePAkaOEL0Xax8hYQ5vSv1/PxJ1Dpv+NylL
	GUBnaIB/wB8amfn9DCUX2/ka8y3Xna7eiEp5vTiSo+bSlmdglOWInF7s/Ibc6kfOCdUX9uzpeZGiO
	ywCRsIfKo7eyrEeHGn9MS6d3oSb1zSf36adg5q/xbBV8dhLNsW6BnXKAy5eEd9AjudwbRVgKdi6xM
	UQd3bXLcB16KYbycdjaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuBV-0000000Fojk-1tTu;
	Fri, 27 Nov 2026 11:32:09 +0000
Received: from smtp.ustc.edu.cn ([202.38.64.46] helo=ustc.edu.cn)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuBS-0000000Foha-1YPh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 11:32:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=eXwNm4f1iSOp1uIbGh1LM/4A3sttFi1BOE
	QD0XNPkUE=; b=pBLaNbHqwRH/BjI6bcRQlC49yaG5wh6v/6QMToK79Y8d0HRosa
	sV5GspoKN/KelyAb9dLgm7dI9i07K4LBbmAS5jUl0fQsoGmkhiGTyv+ycC4HqA7a
	rSV01E6+KsyktbfNUKNiTl1n1P6ecZLpppDQzwYg0pNHqVfvMF6gtWnuI=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.180.66])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgAntEgZaglrkHICAQ--.2585S3;
	Fri, 27 Nov 2026 19:31:42 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: suzuki.poulose@arm.com
Cc: mike.leach@arm.com,
	james.clark@linaro.org,
	leo.yan@arm.com,
	alexander.shishkin@linux.intel.com,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] coresight: ctcu: add missing MODULE_DEVICE_TABLE()
Date: Fri, 27 Nov 2026 19:31:36 +0800
Message-ID: <20261127113137.931578-2-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127113137.931578-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261127113137.931578-1-xiaqinghuan@mail.ustc.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: 3pYKCgAntEgZaglrkHICAQ--.2585S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Ww1DZr48Jw4rGr15WF4kJFb_yoW8XF45pF
	4DK34YyFZ8Gr4Fva17Jw1jqFWYywsa9ayFqr15G34Uua1YyryqvF1xKw4FyrnrWF15Grya
	kwn7tryqqFZ7J3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBab7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_JFI_Gr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIE
	c7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I
	8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCF
	s4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20x
	vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
	3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIx
	AIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAI
	cVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2js
	IEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07joYL9UUUUU=
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREDB2sHyZtdggANs4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_033206_988272_CA68FFCE 
X-CRM114-Status: GOOD (  10.96  )
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

The CTCU driver matches "qcom,sa8775p-ctcu", which SM8750 also falls back
to, but it never exports its OF match table.  Built as a module the driver
therefore carries no "of:" modalias, so udev cannot autoload it when the
CTCU device is registered and the device stays unbound until someone runs
modprobe by hand.

Seen on SM8750 with CONFIG_CORESIGHT_CTCU=m: "modinfo -F alias
coresight-ctcu" prints nothing, while a manual modprobe binds
10001000.ctcu immediately.  Add the missing MODULE_DEVICE_TABLE(of,
ctcu_match) so the module is autoloaded like the other Coresight drivers.

*** AI-assistance disclosure ***
This patch was prepared with the help of an LLM coding assistant.  The
author reviewed every line and ran the commands quoted above.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
 drivers/hwtracing/coresight/coresight-ctcu-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index 9043cad42f01e..a7caa5b00b6d1 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -295,6 +295,7 @@ static const struct of_device_id ctcu_match[] = {
 	{.compatible = "qcom,sa8775p-ctcu", .data = &sa8775p_cfgs},
 	{}
 };
+MODULE_DEVICE_TABLE(of, ctcu_match);
 
 static struct platform_driver ctcu_driver = {
 	.probe          = ctcu_platform_probe,
-- 
2.53.0



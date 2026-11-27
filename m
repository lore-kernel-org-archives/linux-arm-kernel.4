Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1945606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 13:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=l+1YDNI6;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=ZaJOIw3S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hdVITJ5aRy2iyF+rP6jnyLNGsmnOmJaXba9CfY7tpSc=; b=l+1YDNI67oP1jo
	nV0ADAW4vLasE5YH6/F1S3MW0ib16C/7lKyEtQwo4rvaDLuUALIaDbwUmJhNGpbeyLfsJmUl9NNtz
	OJVt1G+OpqgggLyo2NUQhQYW2OEtFfQRCUHw0FYwTDK7ihdZMJQoEF7Jo1sP/Lzo/vU0zgpprRynA
	qaE2n6mtvakLIAw7Fkr1PFa/kPNILkHrlEjzaZdq98Ib4A3aeu0jw90DMOCYMftz/pC66SgiE4OEt
	1ILis3DEZ+4jyvgIFKgr+/ul2MDYD66DHSb66S77xOmt0yz6buSGwPgMFNH+0JOLxtStZ5O2a96TC
	vl8GaZ+brUec8He2YIyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWw3A-0000000GH7p-1RBG;
	Fri, 27 Nov 2026 13:31:40 +0000
Received: from smtp.ustc.edu.cn ([202.38.64.46] helo=ustc.edu.cn)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWw2l-0000000GGyM-3mPK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 13:31:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=hdVITJ5aRy2iyF+rP6jnyLNGsmnOmJaXba
	9CfY7tpSc=; b=ZaJOIw3S3ne3ntnyeGk6GXC1x8yKI1tLnr6sAMLiQkqEsKsNK9
	N7NgZ6KPHwBh9E1IpxjevzllNHt/Augrqccw8smiRe8MAFhwI/IIUpvKxa1n7MCe
	qVLhJkzi3Gh1jgFDD5voTvjY6d7ER8aknQIXUVjYz9JGF8c0RnV0mCQKA=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.180.66])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgCXI0jphQlr2eQCAQ--.2853S3;
	Fri, 27 Nov 2026 21:30:23 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: suzuki.poulose@arm.com
Cc: mike.leach@arm.com,
	james.clark@linaro.org,
	leo.yan@arm.com,
	alexander.shishkin@linux.intel.com,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] coresight: ctcu: add missing MODULE_DEVICE_TABLE()
Date: Fri, 27 Nov 2026 21:30:16 +0800
Message-ID: <20261127133017.1606830-2-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127133017.1606830-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261127133017.1606830-1-xiaqinghuan@mail.ustc.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: 3pYKCgCXI0jphQlr2eQCAQ--.2853S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Ww1DZr48Jw4rGr15WF4kJFb_yoW8WFy5pF
	4DK34YyFZ8Gr4Fya17Jr1jgFWFkwsa9ay0qF15G34Uua1YyryqvF1xKw4FvFnrWF4UGry2
	kwn7tryqqFWxJ3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBSb7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_JFI_Gr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv
	6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
	02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE
	4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82
	IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
	0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMI
	IF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF
	0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87
	Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcTKZDUUUU
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREDB2sHyZtdggAesr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_053116_507760_E06CD354 
X-CRM114-Status: GOOD (  11.46  )
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

Fixes: f78d206f3d73 ("Coresight: Add Coresight TMC Control Unit driver")
Reviewed-by: James Clark <james.clark@linaro.org>
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



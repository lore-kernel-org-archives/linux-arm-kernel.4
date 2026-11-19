Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B13A606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 07:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gQBQSagn;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=AaxlJOZD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=E7ul2arr6XENd17+ogc5CtyqshNXPbPmSVo+aN3QCi4=; b=gQBQSagnC5wAywObQZc+esfj5I
	AiJzoQ1Z78ofM66C1HMhG68JtReHmLtR7yw2wxL3qX0yiwf75wd35SPflfQXPHyxh04SrpaxCVTeq
	nlFNvjVKrGJL+jR4v3gInw8CPY/0zzHWx4QHz+IxzDFLTm5msCFrlTPgf8j9Ln4Ia+g8lat9q6qmJ
	e7SzepHE+AvJQWFGE1XO7kAIpLA+5D77/P5kGiKpnHHYxVEUIMjHUXBtHAXJQnfHYG6uTg/AnfgVN
	Q0JleVKgYRyPM4wi6QZLIpGnFAqCv7eBVhkm/yOBp5INREgwROGHdnigqeQf8OBVa/pxisFKFPoq0
	3+CDrT/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTx2e-0000000B7ob-1myN;
	Thu, 19 Nov 2026 07:58:48 +0000
Received: from cmccmta6.chinamobile.com ([111.22.67.139])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTx2a-0000000B7ln-1gWT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 07:58:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=AaxlJOZDWE1XQp/vmEVc3NShjnZfgv559FJ28Np3fobvcZDDb1+ZthRlFg/0Jp8eMHGXImLrkdlzU
	 1YOR5/Gt9o425YFwQ+cEKpE6n1T4CboeyYry0jFfAHec3nlSGRpbPuL1MMBoW6iXMa3eTT/qRhfgBK
	 dZuR+oNZYw28eAF4=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee56afeac2705d-18c10;
	Thu, 19 Nov 2026 15:58:33 +0800 (CST)
X-RM-TRANSID: 2ee56afeac2705d-18c10
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from devin-VMware-Virtual-Platform (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee16afeac26a8c-f54cc;
	Thu, 19 Nov 2026 15:58:33 +0800 (CST)
X-RM-TRANSID: 2ee16afeac26a8c-f54cc
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] ASoC: imx-audmix: Balance SAI node references with devres
Date: Thu, 19 Nov 2026 15:58:32 +0800
Message-ID: <20261119075832.50172-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.51.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_235845_002868_C3766CFD 
X-CRM114-Status: GOOD (  11.27  )
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

Each successful parse of a SAI phandle in imx_audmix_probe() takes
a node reference. The card uses these nodes in the DAI links and
codec configuration, but neither probe failure nor device removal
releases the references.

Register a devres action for each reference as soon as it is acquired.
The card registration is managed by the same device, so the actions
release the nodes after the card has been unregistered.

Fixes: b86ef5367761 ("ASoC: fsl: Add Audio Mixer machine driver")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 sound/soc/fsl/imx-audmix.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/fsl/imx-audmix.c b/sound/soc/fsl/imx-audmix.c
index 2372cd26ee47..8d7faa1b9cc3 100644
--- a/sound/soc/fsl/imx-audmix.c
+++ b/sound/soc/fsl/imx-audmix.c
@@ -10,6 +10,7 @@
  * https://www.gnu.org/copyleft/gpl.html
  */
 
+#include <linux/device/devres.h>
 #include <linux/module.h>
 #include <linux/of_platform.h>
 #include <linux/clk.h>
@@ -123,6 +124,11 @@ static const char *name[][3] = {
 	{"SAI-Playback", "SAI-Playback", "AUDMIX-Capture-0"},
 };
 
+static void imx_audmix_put_node(void *data)
+{
+	of_node_put(data);
+}
+
 static int imx_audmix_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -206,6 +212,11 @@ static int imx_audmix_probe(struct platform_device *pdev)
 			return ret;
 		}
 
+		ret = devm_add_action_or_reset(&pdev->dev, imx_audmix_put_node,
+					       args.np);
+		if (ret)
+			return ret;
+
 		cpu_pdev = of_find_device_by_node(args.np);
 		if (!cpu_pdev) {
 			dev_err(&pdev->dev, "failed to find SAI platform device\n");




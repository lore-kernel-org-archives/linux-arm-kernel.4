Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8C3606A322
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 09:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=A+KyxgtO;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Zpl5MBkk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ybksNdKGZwcUybmuPou+wEJRhGtFCZ9Lfc93sClRt68=; b=A+KyxgtOMVInXy
	WMkSIrWPTMf0XAsR9da/WfYUmA2S7/NQy0/jMwQ/1GSJFZfiH9aDn7y6JSzYb0XSDvxCcfNPJWJaO
	dt6PBuaWjDdOhad6b6BKpqJpzOlIUW9wBBngRmec0HFf/Yr45cqU6wZEPzAKnQEUtjw+7BcalUJuR
	1IaJX+VORsLTAEEzFck6TFlHf93i4MB2BOkCfSBd8ze7byldTbVLlXgN17JNJAWJT0FYw8AnHYfvP
	NDerHSfLPgBCgAMDMQ70OlFMreucDA5zQP1gt8/2pfJ1P5tVmwZkZF6O8Gl5PoKjsFqOQflMpX3o2
	HXEjyj309d97snCyhaGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLUn-00000000DPN-1nU6;
	Mon, 09 Nov 2026 09:16:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLUS-00000000D0B-2hOq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 09:16:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 21CA815A1;
	Mon,  9 Nov 2026 01:16:33 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3C9873F85F;
	Mon,  9 Nov 2026 01:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794215796; bh=XLIQNLKLqBN+XK89CZJOMck4z1OnlpSdMf9XcQtFphE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zpl5MBkkdUwHlGy2vO236ngwip4+RGSLCsfgNX7kiddzQWkfmTYMxbkmobNvuEbVS
	 LN+191Gbi5/FLsCEM+yTseBwhv/k5hNZT1tkoGaHL9254CV95++B+kv+cCYC4LzRbi
	 XHzf6hxMX5uRLlQ2Ajp6WSQA21sSypFba8vS8uJc=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	d-gole@ti.com,
	jonathan.cameron@oss.qualcomm.com,
	elif.topuz@arm.com,
	lukasz.luba@arm.com,
	philip.radford@arm.com,
	david@kernel.org,
	souvik.chakravarty@arm.com,
	leitao@kernel.org,
	kas@kernel.org,
	puranjay@kernel.org,
	usama.arif@linux.dev,
	kernel-team@meta.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v15 31/35] firmware: arm_scmi: Enable autoloading for System Telemetry driver
Date: Mon,  9 Nov 2026 09:12:17 +0000
Message-ID: <20261109091221.2532706-32-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109091221.2532706-1-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_011636_751020_F5304682 
X-CRM114-Status: UNSURE (   8.81  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.4 (----)
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

Add the SCMI System Telemetry driver and related protocols to the list of
standard protocols whosw devices are created automatically, so enabling
module autoloading.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/bus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 25197197db8e..32002fd9d843 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -546,6 +546,7 @@ static const struct scmi_device_id scmi_std_id_table[] = {
 	{ SCMI_PROTOCOL_POWERCAP, "powercap" },
 	{ SCMI_PROTOCOL_PINCTRL, "pinctrl" },
 	{ SCMI_PROTOCOL_PINCTRL, "pinctrl-imx" },
+	{ SCMI_PROTOCOL_TELEMETRY, "telemetry" },
 	{ },
 };
 
-- 
2.54.0



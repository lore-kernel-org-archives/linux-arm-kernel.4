Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1900606EE91
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 15:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eKFFFsnL;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C02oSTTp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=y/UIhhNXTZbQxwNhuS+j3xwIQNBK1V9B1w6cr776u5M=; b=eKFFFsnLtlC2PEXvehcYevjGsX
	1YpH9exYVJmjimsmywAAYVWPD6TxW/+0UTTxyQh8sxpHHlPguO/mhThJfS49TYWDwKHXOwx0R/Hj+
	YBDwMMhBz1Ck/T1GFayvZB59OY161RSnSNHYpB2x15buJi2brVdjvc8abaOP0TyuKZxdx1KcWABPC
	7q2jBbe0OJm8kb2oPniUfmp4cA1vkuagDbOG7npATcstUE9ofQP8Fh4CdKqT4R279bDTbjFKyWt1x
	tgsI9mxC3bdHKye9q03bn+tNHR1GZG5LLThE+TUGcuhNRAQx5DzkaG2K6qGpPVCf8Jf7MtXCIH0DA
	SkIVewRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRgj-000000015RG-4AhG;
	Mon, 09 Nov 2026 15:53:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRgi-000000015Qt-177k
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 15:53:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 57A53633F4;
	Mon,  9 Nov 2026 15:53:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1CEF1F008A3;
	Mon,  9 Nov 2026 15:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794239619;
	bh=y/UIhhNXTZbQxwNhuS+j3xwIQNBK1V9B1w6cr776u5M=;
	h=From:To:Cc:Subject:Date;
	b=C02oSTTpUKkKoh8I0h8uuS5MyLowq7ygidt5jyoyJuh5mERtq5B7VIWHSYxeh8sVD
	 TrKvU0a7JjkolClj1XD/cItICx4EnqOD2bkFymaUsh1VdIQI2q2AwmDZX5o9pRwsdL
	 anifEssVJ1AF4B4PCOsJs9p0Sx2TpmQ1v1ZPZkyRw9JjT62QGrY0X8ifoZWxjixhaH
	 zimq+2xQwS9fkpWSyT/hIonHuyNC5uDlF5L4OKtF0XRX0AuLI0x6m/FFZ3R+feSfzc
	 ZVq12El/KFRJB2hifXlr+GyuFnjdPDDY1S6x4rXBPnxcU6v4xPqgmHeeMuNR+GE13Q
	 px20JWDis60Lg==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Subject: [PATCH RESEND 1/2] pmdomain: arm_scmi: Skip domains that fail initialization
Date: Mon,  9 Nov 2026 15:53:31 +0000
Message-ID: <20261109155332.1686594-1-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

pm_genpd_init() can fail while allocating generic power-domain state.
The SCMI driver ignores that error and stores the partially initialized
domain in the onecell array. Provider registration then fails because that
domain was never added to the global genpd list.

Preserve support for partially available SCMI power domains. Log the
failure and leave the corresponding onecell entry NULL so the other
initialized domains remain available. Explicitly skip empty slots when
unwinding provider registration failures.

Fixes: 898216c97ed2 ("firmware: arm_scmi: add device power domain support using genpd")
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/pmdomain/arm/scmi_pm_domain.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

Resending
https://lore.kernel.org/all/20260923101608.4180057-1-sudeep.holla@kernel.org/

diff --git a/drivers/pmdomain/arm/scmi_pm_domain.c b/drivers/pmdomain/arm/scmi_pm_domain.c
index fff7b4f438ca..b95b24470ba5 100644
--- a/drivers/pmdomain/arm/scmi_pm_domain.c
+++ b/drivers/pmdomain/arm/scmi_pm_domain.c
@@ -99,8 +99,13 @@ static int scmi_pm_domain_probe(struct scmi_device *sdev)
 		scmi_pd->genpd.power_on = scmi_pd_power_on;
 		scmi_pd->genpd.flags = GENPD_FLAG_ACTIVE_WAKEUP;
 
-		pm_genpd_init(&scmi_pd->genpd, NULL,
-			      state == SCMI_POWER_STATE_GENERIC_OFF);
+		ret = pm_genpd_init(&scmi_pd->genpd, NULL,
+				    state == SCMI_POWER_STATE_GENERIC_OFF);
+		if (ret) {
+			dev_warn(dev, "failed to initialize domain %d: %d\n",
+				 i, ret);
+			continue;
+		}
 
 		domains[i] = &scmi_pd->genpd;
 	}
@@ -126,8 +131,11 @@ static int scmi_pm_domain_probe(struct scmi_device *sdev)
 
 	return 0;
 err_rm_genpds:
-	for (i = num_domains - 1; i >= 0; i--)
+	for (i = num_domains - 1; i >= 0; i--) {
+		if (!domains[i])
+			continue;
 		pm_genpd_remove(domains[i]);
+	}
 
 	return ret;
 }
-- 
2.43.0



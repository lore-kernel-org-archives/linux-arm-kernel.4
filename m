Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C6B606A329
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 15:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vz4yO4FP;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Sp/JpgQX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=dQxWsk9tD+W0rC/Z3zWfzCTEEa3rqox9nlVNEL9xNjs=; b=vz4yO4FPC9rBwM3pkn8hSRXKZl
	8DGYNgBIKcLBdgjNP0E0koCxDQt19x9RSNZYNwyYkVgZekWGRfWT3UJwxrHKAVtBm82nQBRzn1bFL
	IQST2Hu1Ii/HtF98nUQ/16opSIAMLxjYuZx5I+O38ovm6LJH/XVIeCaAweeY2HOQou9SgUmSOdguR
	7hqByuPOfetq9zz8ONf2D+aDAHzLY1Tqn22EBm5SYgcl4a5rAp4uf/+nEES9vemSxci/8NHyFdYas
	IM6lXaT0PeSBnZhH1V80pEvKl4kypR/28u2MF6io8wNtQ2AiQQrEDT5xEwHqtXLUsaw77WgoGR27f
	roHV0kWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPM9D-0000000Ct1s-2XNM;
	Fri, 06 Nov 2026 15:46:35 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPM9A-0000000Ct0x-1dna
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 15:46:33 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 5AA9F202AA2;
	Fri, 06 Nov 2026 16:46:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793979986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dQxWsk9tD+W0rC/Z3zWfzCTEEa3rqox9nlVNEL9xNjs=;
	b=Sp/JpgQXhr+nR259tgROCK66kbPxBRRhQyRqDv79wzPzEd1HnV3NEBZav5AuQprur9G6lm
	wXxjtFo4UMTWckSktdHFs4qgt1WY9UrVWZt3mLW18Yb83XZ2Bex67fMv18+dlOIM/M4MzQ
	OAChgFA5ONzT4TNaz7/TYU+uQ40ZF8tflbWO5G0RtJ1vZP9ZdUf4AKIkOQao+qOsx9mzHE
	1qNs8GtmyBBbBEI05jOThq3hBvq91vEwSnqkitw5f3nsOJanpNa8qGt6j//EXeIHTcPxOc
	kVFHFLoTmS3EWc1VRMtxd9hp3FM7m5daiv5OTyhKDPDAxAruFa++dbcvYjn43g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793979986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dQxWsk9tD+W0rC/Z3zWfzCTEEa3rqox9nlVNEL9xNjs=;
	b=elygiWiaFCrYJ6qHiJfHR/G9HnJlkwBEwz6WZjXxxlIROt9cdFMD8jg1wXaR1Qr8kkZHic
	6AR4h5Vbmd8jDRoZj5n0njDfiqHnYIgPj5s0pXxl0z2PbqKkgrQ561EemZa1es9g63cnlZ
	A2WCZKdBvZwf4UCD65r0k3eflLMc79R+ELzR8BekQY1TderszKbjWmrLrQyL7eqIJ3DGz/
	77YdSNjb9UYDf2UyjBrK02dPood+TMK5YvX/gNqsbqZ+shqU8os9jMS93V6GVZahd+L1sK
	gtBpGmnBklQMvZ+AN8+QFA3M1gZ6kahyszJGD2TnKcBuBMc1udMAA4EsaFwGRA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793979986; a=rsa-sha256;
	cv=none;
	b=EespJsucjuk+1V30MTNlXQz8ldN+LyJ7mfkN9pgw4ifyqppT8w+fYNXVPXTIQYRAgl52Bg
	1FZC68CXwKbWZVLKCph4uQh6ABJVMmgyDTOsUOiL+9y12g74wesPuOj1cnkLjIUNLJdCnd
	0twYlyZGvJzHHCKQOzXKHjk9VzF6YvAom/GvrHh2JUWIzAr5InGVfHvfO/8RHOVkNRvOfR
	3+bJZTlUppKLmiDQAUA936M1V8qiQzl3lU15Qd46eNUnpJU47QRnNnjhItt5GFy1IgUm04
	0FF4V8MEviGWH7sELpWTdDE+im++ihj3j18qwqEQQerEqWWZQpmvgPNIGnuW2Q==
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1xPM94-002vNF-0r;
	Fri, 06 Nov 2026 16:46:26 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Fri, 06 Nov 2026 16:46:15 +0100
Subject: [PATCH] remoteproc: stm32_rproc: Do not request reset by index
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-reset-deindex-rproc-v1-1-41a03fcc8496@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAEb27WoC/yXMQQqDMBBG4avIrDtgIgr2KqWLNPmt00WUGVsE8
 e5Gu/wW721kUIHRvdpI8ROTKRe4W0VxDPkNllRMvvadc3XHCsPCCZITVtZZp8hNdCF49I1vByr
 lrBhkva6P59/2fX0Ql3NF+34AL2AJoXcAAAA=
X-Change-ID: 20261106-reset-deindex-rproc-3c1aa2e9325f
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-remoteproc@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Philipp Zabel <p.zabel@pengutronix.de>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_074632_592016_9E229193 
X-CRM114-Status: GOOD (  11.62  )
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

There is no need to request a single reset by index.
Use devm_reset_control_get_exclusive() to request the first and only
reset.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/remoteproc/stm32_rproc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index a47e040c6db8..1443a4013d6c 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -696,8 +696,8 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
 
 	ddata->rst = devm_reset_control_get_optional(dev, "mcu_rst");
 	if (!ddata->rst) {
-		/* Try legacy fallback method: get it by index */
-		ddata->rst = devm_reset_control_get_by_index(dev, 0);
+		/* Try legacy fallback method: get the first reset */
+		ddata->rst = devm_reset_control_get_exclusive(dev, NULL);
 	}
 	if (IS_ERR(ddata->rst))
 		return dev_err_probe(dev, PTR_ERR(ddata->rst),

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261106-reset-deindex-rproc-3c1aa2e9325f

Best regards,
--  
Philipp Zabel <p.zabel@pengutronix.de>



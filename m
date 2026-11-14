Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF12606D4D0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 03:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RJYu9FdR;
	dkim=pass (2048-bit key, unprotected) header.d=gahingwoo.com header.i=@gahingwoo.com header.a=rsa-sha256 header.s=fm1 header.b=OP8/R+8u;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=LgBsqteO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=62GIe8JvYP4f0TG0UnjGBes9su8g8+bruNHEN2VgCBU=; b=RJYu9FdR9PaZ+L
	YQ0qxfkEORFA7zfSZ4XO20BHXWNKnM6EUV8IOVJKCqGeem8TBYi0N/flyRtcPwZuZxr59dsGn9ci8
	TD+Dwr9UFYhGPEq3wB2tE8mObU+gBT5UZtzZwfB7j6FvkgiZcOsbc7c/xARMMZrf/kdO25q/1AxYH
	PUHyOgQRu0aUQnJlzuBJmb6jPr7JcnWU6sPXWHZxw27YyelNCmf89aJEALLycbZyHbQAHTtcqfHlN
	gQr0aqw5H166Kjgxi3ctCeDlgmVAtT5IxDIb8XCwaaDG9MdhOuh73BbzIsziDvxTc2LPlc0Y6tobl
	ijR99OH9gWWP3otabXtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS45Y-0000000F9wi-43DG;
	Sat, 14 Nov 2026 03:06:00 +0000
Received: from flow-a4-smtp.messagingengine.com ([103.168.172.139])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS45Q-0000000F9i2-3ZoR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 03:05:57 +0000
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailflow.phl.internal (Postfix) with ESMTP id 123D81381A4A
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 22:05:52 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Fri, 13 Nov 2026 22:05:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1794625551; x=
	1794632751; bh=62GIe8JvYP4f0TG0UnjGBes9su8g8+bruNHEN2VgCBU=; b=O
	P8/R+8uzC82AUnPVpEMcQaXw01cFs8GL1wYadqer1/d1py+00feJRBxN7+bwyeF5
	he0rDGOMVzJt+NYv83andxOGLK+oXLLa1iVYsdpAwn3jehpt1OW2hnAF3dNkTRo+
	GieamTiKXiiPPu3QX4bwkw/0M8ljWxfdEcyLNkFifuSQVmbJG9Afy4tuvLf2kmdc
	s7GCMcr+p6ayyQSFTswp7SNyR0/bTf3h1FaVpKWsuDf9SSBFFAIekae1zTvgAPud
	e+ybDeMHBXruPI3cO1TUGbWSTCQMGWpZ43DwVZh4my732uoMqURDLff2qWOnaw6n
	gkSBsj+GmxL73JqDUMwgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1794625551; x=1794632751; bh=6
	2GIe8JvYP4f0TG0UnjGBes9su8g8+bruNHEN2VgCBU=; b=LgBsqteOojkADG1eW
	qT265h2X0t35F3HXIIqlBN0sOIU7g193Oy2Nu2w3ubNxbGPfk8N4bBR2ftCgeu8R
	qIlcrKkCsAZByHcujYkPpCfFf97EWPy6fReia6fWO5kjFMeRV2apGqkRRkd6XkT7
	kGR+27Wn4fq1jUnywlqzEVd5xrvIPwfYHywLkX/jA511eRpV1iCpcCcMFVkBO6Ct
	86d54Jcpzb/d5+MWyvJD8/SdPirmWcV7w40pXTiNo+204PfJ/eECT3HdsKukTdUg
	kFD14QzlKX7szrO3p7F2ljBttphwt9BGk06aPl4AN1fHTjANV4p016J48cJOaN7+
	nW4TA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=gahingwoo.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794625551; d=gahingwoo.com;
	mf=PGdhaGluZ0BnYWhpbmd3b28uY29tPg==;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm1:rsa-sha256:ql2yBAjyQqqc+6O03FyV5ujhhhN9z9UQfRIhPQoWraT9H78
	BdN6OE+4nL6delzxcOtht//JTqfj3X1RhTej14kM4/skSMPOd4KfIgQroYJyXYD5
	sMRkHyM1g9iybhMtL2A59CXKMmPQAO7MkxmnwCE8gRY0k8+GzYH3P1rhVYZejFAL
	yl+Q4lld9ZaSBMO1zyi/wsi5EihtDgDOo4gpgm/5f2nSRRFMIR0ahFj2ftdZTFgY
	Rdr5T9cCiQfaCEPLpKHQsvnbMfhm1HvZ+UW79KAi4heXnNZzGvXjohrz2KulKF+r
	wWzMFD2dZG5eTAQwOwAqI1AIlYloYysPI8Ho+Qg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:NDXTvodY/WebqUiVdhIPdhL95PeiyKDkhELKQ8x+mYs=:DkRlgBDxCZU9QmygKRhVEtuZ+HRBJSSY3HPelOlhjMQ=;
X-ME-Sender: <xms:D9D3aulk1jmvaNs-tHZDS1h883Vs9CAhly9gcQ5lQuec9eRSVt5uVA>
    <xme:D9D3ah-YnF7NtNcrx5V0FtOxaLcpLbSWWE_U3myVj3HPXKRqYHyNLjxuxaoZMM1hp
    OWnkUlveAbhb1X_etK_lm440YBkoH_GhIERC-0EOGf63D_iKJLQvuU1>
X-ME-Received: <xmr:D9D3al67QdU7-rqg8OuJ8qNYtW1O6VeSY-BpQfgNurKuJkZH4YFXEduw7flzpUVUdQpuSUMk>
X-ME-Proxy-Cause: dmFkZTENh3Cq6bNtRDDqH//naJpK03OGhXB8Cp3eHHX2EpHYf2oBjZ1/43ruyqVDLzR5bI
    q7gV+k53czH7SJj0JMNaMvWBGkaUqaereb01ifHpul1q14DobEKJC2mDvQQE3HzqoOU9gl
    QO0UnCSJOnNpWmY1qWdj/IivEZ+5eJmA8XcRYmqsfPBSZaKqk9zCnQvCGUQuYFJdsYZGP5
    L8zECb373LU+oefpY9jKwOjkFDiU4CWxV3iExHL3zPnpeZwM1wkFJxhm/yJk+2AJ3ju4OO
    RXCknd9xSS299sQU1FiikwzYfEAyF9m0XTBIDoIn2qfRRJDU3uzKkImCFIAQPMS5Q++Urw
    eS6HPGHV1gD/K/rJZ0zWB5zuwTXkHj9Yzz6cNqJHild+o/2RHDPR0AfKkj6U+pMxGxlurT
    CsQSU2ZPvUgZ7DnLy/bNgvWxTC4RfY4FFkUFTjvFSIGwdt+t7+k+VCzbA9aAiolBzENHMX
    6cznB3i70KQBHhKmO8BnD21pBn0ONWMfuWoQ5X5omniaEX6pUr4UegyZFxHXLiTSnh0yGp
    YuP7q6DqdgRRPLkSNePsun/T00jigo92FpkMFA71jgS8OiKWS0v9xUJwzVO8RejQh0VyRg
    82y7djvbSxYSWExcyVlo5TqvZegL4fe1BCMVAp46KcHCnETM7asJKqZdZ4Mw
X-ME-Proxy: <xmx:D9D3ahqg3m0IMedWXhnW4rBxgFnF353P26mcgHpWWVMXeoNJwr_dQQ>
    <xmx:D9D3ahB-GUZ7SEAyvFmnyoHKWHXjhn7PkzXGlf_4q9HaYx12ujoASA>
    <xmx:D9D3aqMBv6sAEMwAWm21tAE-G-Vz7I4HCAlmjwUhZUIfJrunpyyzPQ>
    <xmx:D9D3agmn2jkzNzh8hTIwOGCkqC-2ofjIWQ1rKRA_h5ys1swH8831fg>
    <xmx:D9D3al-wnSH9_daQh1I-j2TUUqcE6wFrG-HMIMoJLzyDLRHWzUGevXYE>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Nov 2026 22:05:42 -0500 (EST)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: tomeu@tomeuvizoso.net,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	p.zabel@pengutronix.de,
	ogabbay@kernel.org,
	zhangqing@rock-chips.com
Cc: royalnet026@gmail.com,
	ulf.hansson@oss.qualcomm.com,
	abel.vesa@oss.qualcomm.com,
	sebastian.reichel@collabora.com,
	sidong.yang@furiosa.ai,
	u.kleine-koenig@baylibre.com,
	chaoyi.chen@rock-chips.com,
	shawn.lin@rock-chips.com,
	finley.xiao@rock-chips.com,
	diederik@cknow-tech.com,
	alchark@flipper.net,
	leonard@lausen.nl,
	vlwwwwww@gmail.com,
	jeff.hugo@oss.qualcomm.com,
	rfoss@kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v17 01/12] accel/rocket: request the core clocks by name
Date: Sat, 14 Nov 2026 16:05:18 +1300
Message-ID: <13f16cecfc7082c865b4d9308f0ccb50bee57500.1794615323.git.gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794615324.git.gahing@gahingwoo.com>
References: <cover.1794615324.git.gahing@gahingwoo.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_190553_077750_B2DB63EB 
X-CRM114-Status: GOOD (  13.88  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Igor Paunovic <royalnet026@gmail.com>

rocket_core_init() never sets the .id of the clocks, so all four are
requested with a NULL name and each one resolves to the first clock in the
DT, aclk.

As a result aclk is taken and enabled four times, while hclk, pclk and the
NPU compute clock are never enabled by the driver. It only works today
because the power-domain driver enables those clocks for it.

Give the four clocks their names, in the order the binding defines: aclk,
hclk, npu and pclk.

With that, a DT that lacks any of these clock-names fails probe with
-ENOENT instead of running on the wrong clock.

Fixes: ed98261b4168 ("accel/rocket: Add a new driver for Rockchip's NPU")
Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
Tested-by: Sidong Yang <sidong.yang@furiosa.ai>
Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS, NanoPC-T6 Plus
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Reviewed-by: Jiaxing Hu <gahing@gahingwoo.com>
[Jiaxing: shortened the commit message, named the clock indices]
Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/accel/rocket/rocket_core.c |  4 ++++
 drivers/accel/rocket/rocket_core.h | 10 +++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/rocket/rocket_core.c b/drivers/accel/rocket/rocket_core.c
index 1b27a2c2f435..c1458423cb69 100644
--- a/drivers/accel/rocket/rocket_core.c
+++ b/drivers/accel/rocket/rocket_core.c
@@ -28,6 +28,10 @@ int rocket_core_init(struct rocket_core *core)
 	if (err)
 		return dev_err_probe(dev, err, "failed to get resets for core %d\n", core->index);
 
+	core->clks[ROCKET_CLK_ACLK].id = "aclk";
+	core->clks[ROCKET_CLK_HCLK].id = "hclk";
+	core->clks[ROCKET_CLK_NPU].id = "npu";
+	core->clks[ROCKET_CLK_PCLK].id = "pclk";
 	err = devm_clk_bulk_get(dev, ARRAY_SIZE(core->clks), core->clks);
 	if (err)
 		return dev_err_probe(dev, err, "failed to get clocks for core %d\n", core->index);
diff --git a/drivers/accel/rocket/rocket_core.h b/drivers/accel/rocket/rocket_core.h
index f6d7382854ca..01a12664566c 100644
--- a/drivers/accel/rocket/rocket_core.h
+++ b/drivers/accel/rocket/rocket_core.h
@@ -27,6 +27,14 @@
 #define rocket_core_writel(core, reg, value) \
 	writel(value, (core)->core_iomem + (REG_CORE_##reg) - REG_CORE_S_STATUS)
 
+enum rocket_clk {
+	ROCKET_CLK_ACLK,
+	ROCKET_CLK_HCLK,
+	ROCKET_CLK_NPU,
+	ROCKET_CLK_PCLK,
+	ROCKET_CLK_MAX,
+};
+
 struct rocket_core {
 	struct device *dev;
 	struct rocket_device *rdev;
@@ -36,7 +44,7 @@ struct rocket_core {
 	void __iomem *pc_iomem;
 	void __iomem *cna_iomem;
 	void __iomem *core_iomem;
-	struct clk_bulk_data clks[4];
+	struct clk_bulk_data clks[ROCKET_CLK_MAX];
 	struct reset_control_bulk_data resets[2];
 
 	struct iommu_group *iommu_group;
-- 
2.43.0



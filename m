Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67265606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 19:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WAWIS0pL;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=igg7+PbW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=g1N9tbVOhbknui/KUnqnwvb5zZsgA7ui7noFKqFuo+w=; b=WAWIS0pL3/660vl23kX6sp01nC
	cWmglTn3PgDYnr2d0OKirz/VcA9wRWQqhvUdVUM30wengwkvpT0D+LsM8/LLVQlDSgoQtJnPl3Css
	zMW6t/BULzb16p8QY/DpSm/uXVdJf/wZeki+k0Mck1eNaJ+25kkVC2FCfTgK5oMslCzQ6xFEgDn2G
	wtYF3hTUGv5rvP4mu3LpEH36rcMqSVnoS3rNqJ69ydaT2THjk06Zu62S1IKioe2uf9AvrTyqR4iGF
	umCRRN/8xGnhUYKJ2SOFTUCaFNT+oaMyJw/sWXUu+/gxuEr/lDTWxahNeWeEimMRI0WDfiDvFhwuj
	SrVNcNxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPPnp-0000000DXud-281u;
	Fri, 06 Nov 2026 19:40:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPPnn-0000000DXtz-1GbF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 19:40:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A71C341B4A;
	Fri,  6 Nov 2026 19:40:42 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793994042;
	b=xg+cbGiCv7xUY3vmJejN0xKYiV+A5OBxL633NmzuWWKWutGf15SSfyTTeRjspRYScIZ6
	 i5CDfkeEzk2514bmSfUS1WwK9jyQz8JuARhmkXVkdp/tSfspnePBcYfiCDzXZQodKwuMi
	 LRg8wJM87gA2Q/yJu5Ocydg1i0DrkFdu2oL11Ctv6f1CAwfuTkkv2R+FMfBxKMgdFtC82
	 cXbJCI3sM80UGMjzUPs2D7Hpdtu4poovJEwEjKFpMf6vso+KUbdvvZDkckiNU7TmkAS/P
	 aSlshnHRkFxUMxBcxlBypLty+T6r/KuNAiDHB5BuS/XdjUyd/uBs2G8HSp845arks3A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793994042;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=g1N9tbVOhbknui/KUnqnwvb5zZsgA7ui7noFKqFuo+w=;
	b=G7AoER38Ntud2RLGbhgOZTKi5Gkqvck3WlqgSk52A1rrEG8UVk9vkP9ABm/Yu1o8OJ0r
	 VuC0YAWdtHkrM0kZ75nHxZn8TQzdWrfJqCMv0fw19XHx0TI9aYJKBAL1n91x2dPmJ8vCX
	 Zz8zeP1Kp4jWtZ7BpkFfGIxc5BobA7MEsU3gnZG4L49cLB/sq/c8t93LGv5oa6V7eKeen
	 Erqri70ZAxSSYoZoZCiZUg7qliE524O+pj4Eg0ODwioy56niqGOlMS/FHPzXl84+Ew5os
	 3mxcg9rASY6gM0xpcbW5ZyU0EeSvZ3VTOf9xgMKAB7a0ickznSnf4G3S3VM4ka1718A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0A1C51F0089F;
	Fri,  6 Nov 2026 19:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793994042;
	bh=g1N9tbVOhbknui/KUnqnwvb5zZsgA7ui7noFKqFuo+w=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=igg7+PbWs84GnfXb6WersQMj21z0AZxPr+MjTWMQt4UbLQm0TUR3/a8NlcmOaunZ3
	 YHSe0rqCvXW2RsiYL6gV0hYYqfPHMNpke7cCIxhVYiuVD/K52B0UkM6Uylm+YcELmV
	 U3FaVmv6//DejJve94it59m64a1q/gXMn5mxs5rho7KpLbC8H9uZpzt3Q/r/uuLYWm
	 FuyebVrViz90RHkUb50C9on4G+Fw9p+7C2aOAXUWZr9HI4D8K5lbcPUcK6Wn4f6MRZ
	 5vosKX1KgwpEDJGbKGY8D2Cyd5h3GvBpwjAaWQDGcA51xv2Lbe8JgfXt975h3V6M5T
	 A7GMI+EjcSW0g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5E0794783A;
	Fri,  6 Nov 2026 19:40:41 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Sat, 07 Nov 2026 03:40:33 +0800
Subject: [PATCH] firmware: arm_scmi: Drop the ARM architecture dependency
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261107-arm-scmi-arch-dep-v1-1-514872e8ede4@iscas.ac.cn>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMywqEMAyF4VeRrCdgKyj1VcRFGzMawQvNKIL47
 lZnd77F+U9QjsIKdXZC5F1UljnBfDKgwc89o3TJYHNbGpNX6OOESpOkQQN2vKIrvXOhsIHIQ/q
 tkb9yvM2m/Vu3MDL9nhBc1w1xJXeQdQAAAA==
X-Change-ID: 20261107-arm-scmi-arch-dep-96a99b32bcca
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Han Gao <rabenda.cn@gmail.com>, 
 Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793994040; l=1758;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=JFfyRaQjdRkhf1+nAyQftf8BDfEeha9RuqZH2ozDpeU=;
 b=WKv3qVktXvpY2424NiZPSFXWRZ5auD0LPYgNUC0J2hfBTaOLyfwe2GJj4c8PvAPyBOGi63/t8
 2LjLVo+kIR9B4DG1mGecFcC8TiJjdI9omLH+JM6pTdF38NzUBJGIIgh
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: gaohan@iscas.ac.cn
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Han Gao <gaohan@iscas.ac.cn>

The SCMI core and the mailbox and shared memory transports only use
generic kernel interfaces. Transports that need architecture support,
such as SMC, already carry their own dependencies.

Drop the ARM and ARM64 dependency so that other architectures can use
SCMI. Depend on HAS_IOMEM instead, for devm_ioremap().

Suggested-by: Michal Simek <michal.simek@amd.com>
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
This was patch 1 of the Zhihe A210 SoC series [1]. As Michal asked, it
now goes on its own through the SCMI tree.

Since [1], it depends on HAS_IOMEM: Sashiko found that UML, which has
no HAS_IOMEM, failed to link devm_ioremap().

Build tested on x86_64 without OF, i386, loongarch64, ppc64le, riscv64
and arm64. On UML, SCMI can no longer be selected.

[1] https://patch.msgid.link/20261103-a210-scmi-v3-0-ee6b31580808@iscas.ac.cn
---
 drivers/firmware/arm_scmi/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/Kconfig b/drivers/firmware/arm_scmi/Kconfig
index 783c24a20e29..f403271c3d11 100644
--- a/drivers/firmware/arm_scmi/Kconfig
+++ b/drivers/firmware/arm_scmi/Kconfig
@@ -3,7 +3,7 @@ menu "ARM System Control and Management Interface Protocol"
 
 config ARM_SCMI_PROTOCOL
 	tristate "ARM System Control and Management Interface (SCMI) Message Protocol"
-	depends on ARM || ARM64 || COMPILE_TEST
+	depends on HAS_IOMEM || COMPILE_TEST
 	help
 	  ARM System Control and Management Interface (SCMI) protocol is a
 	  set of operating system-independent software interfaces that are

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261107-arm-scmi-arch-dep-96a99b32bcca

Best regards,
--  
Han Gao <gaohan@iscas.ac.cn>




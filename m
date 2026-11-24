Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84904606A339
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 18:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qDwmLlSj;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=bUl4I4qK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Cl1G/Mg3MLListnA7EQNEKCHeIDoZedVmpyUo6+IOEs=; b=qDwmLlSjR1zbdr
	4sRSJpdV7AeScCnXDv+BLX+40ZC27516JrTuDwG3SSHVVJKaXJpMMcQHSgs5LXRl35O1yU+DTIaw1
	t3spSfdmjyysIlKSHomPjhXs4buWTdWMXLxJKHyjJT0EQYK/1UcTcPCeSTUBJclxJOmaMk6cufc2s
	pb4tG0vJYAF1XbX9WbBfURIwAu7yFIdZRa5diG4wzG1eaE7MFpNBOUJ3im5hriL0AupoSdQAtXP6T
	XGFwsyNWIu+1jNmxymnPH1+E7+t29eQZTqj+7YGTTD7Zl/ILoNt9WSRT6QxsVjqVJINKa0DMPzNSI
	VdWeNuquw35BRwW/Pe1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVu3L-00000007I9q-2KpG;
	Tue, 24 Nov 2026 17:11:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVu17-00000007H0D-0onR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 17:09:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 853BE1C0A;
	Tue, 24 Nov 2026 09:09:13 -0800 (PST)
Received: from e126453.arm.com (e126453.arm.com [10.33.8.63])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AB2293F763;
	Tue, 24 Nov 2026 09:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795540156; bh=lla7fRQ9ubK7UCYFc/yUdmuI1cGz4l0bT3PTGoiJq8Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bUl4I4qKXOYiT9kAy1gWLDQMyRJ7tr9Pea5q/SHd2Z9f+k82Gg8O8nf+mrLr5btDt
	 8Dn1sJa7A+AoLpCEOhDAuYV0mrRup52O3sXH/vqKOyH78OJ3IKm1LznLmLJihbS1as
	 x7ZqgF7LoIQ1hvRuyP5P0hMKj2yjOeICHyT53I+k=
From: Anthony McGivern <anthony.mcgivern@arm.com>
Date: Tue, 24 Nov 2026 17:07:52 +0000
Subject: [PATCH 24/24] MAINTAINERS: Add entry for mali-c720 driver
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-b4-initial-upstream-candidate-v1-24-0cb9bde1bd30@arm.com>
References: <20261124-b4-initial-upstream-candidate-v1-0-0cb9bde1bd30@arm.com>
In-Reply-To: <20261124-b4-initial-upstream-candidate-v1-0-0cb9bde1bd30@arm.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Anthony McGivern <anthony.mcgivern@arm.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Nayden Kanchev <nayden.kanchev@arm.com>, 
 Konstantin Babin <konstantin.babin@arm.com>, 
 Linus Walleij <linusw@kernel.org>, jacopo.mondi@ideasonboard.com, 
 kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com, 
 dan.scally@ideasonboard.com, Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Anthony McGivern <Anthony.McGivern@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795540079; l=1300;
 i=Anthony.McGivern@arm.com; s=20261124; h=from:subject:message-id;
 bh=gwm371NAmKOxnRaNds+4uLTJHOtoy/2+DHC1Mr7k2p0=;
 b=0lxdEHwrHw6DY4UHEjB2QJgO30puD9OOmiAT670llLbXbop41rljqaJ837TpWYy9toenI2ywU
 lAiUM4gWQFCDLv5Cw+QYqdD7X8wekGZMCyn7nHpnd0oOWQSCJJVoUYT
X-Developer-Key: i=Anthony.McGivern@arm.com; a=ed25519;
 pk=cvw1HHVRuWpdkn55JpnRyCO2oGBkBWaBXcc2S3CmHTU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_090917_355046_8A78AAF6 
X-CRM114-Status: GOOD (  10.06  )
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

From: Anthony McGivern <Anthony.McGivern@arm.com>

Add a MAINTAINERS entry for the mali-c720 driver and its associated
documentation.

Signed-off-by: Anthony McGivern <Anthony.McGivern@arm.com>
---
 MAINTAINERS | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 44540a1eb2b8088f9da95a9b6f83b4bf05188ee1..1bf854fb64fb7fcfef50d956350df05da3b2df75 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2392,6 +2392,19 @@ F:	Documentation/userspace-api/media/v4l/metafmt-arm-mali-c55.rst
 F:	drivers/media/platform/arm/mali-c55/
 F:	include/uapi/linux/media/arm/mali-c55-config.h
 
+ARM MALI-C720 ISP DRIVER
+M:	Anthony McGivern <anthony.mcgivern@arm.com>
+M:	Vincenzo Frascino <vincenzo.frascino@arm.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/admin-guide/media/mali-c720-graph.dot
+F:	Documentation/admin-guide/media/mali-c720.rst
+F:	Documentation/devicetree/bindings/media/arm,mali-c720.yaml
+F:	Documentation/userspace-api/media/drivers/mali-c720.rst
+F:	Documentation/userspace-api/media/v4l/metafmt-arm-mali-c720.rst
+F:	drivers/media/platform/arm/mali-c720/
+F:	include/uapi/linux/media/arm/mali-c720-config.h
+
 ARM MALI PANTHOR DRM DRIVER
 M:	Boris Brezillon <boris.brezillon@collabora.com>
 M:	Steven Price <steven.price@arm.com>

-- 
2.55.0


